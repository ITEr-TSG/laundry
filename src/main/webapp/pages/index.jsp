<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="zxx">
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<head>
	<title>首页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="utf-8">
	<meta name="keywords" content="" />
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>

	<!-- Bootstrap Core CSS -->
	<link href="${PATH}/pages/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<!-- gallery css -->
	<link rel="stylesheet" href="${PATH}/pages/css/swipebox.css">
	<!-- Custom CSS -->
	<link href="${PATH}/pages/css/style.css" rel='stylesheet' type='text/css' />
	<!-- font-awesome icons -->
	<link href="${PATH}/pages/css/fontawesome-all.min.css" rel="stylesheet">
	<!-- //Custom Theme files -->
	<!--webfonts-->
	<link href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	    rel="stylesheet">
	<!--//webfonts-->
	<link href="${PATH}/static/layui/css/layui.css" rel='stylesheet'
	type='text/css' />
</head>

<body>
	<!-- header -->
	<header style="background-color: #393D49; ">
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light">
				<a class="navbar-brand" href="${PATH}/pages/index.jsp">
					<i class="fab fa-empire"></i>
				</a>
				<button class="navbar-toggler ml-md-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
				    aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto text-center layui-nav">
						 <li class="layui-nav-item">
						    <a href="${PATH}/pages/index.jsp">主页</a>
						  </li>
						<li class="layui-nav-item  mr-3">
							<a href="#about">关于</a>
						</li>
							<li class="layui-nav-item" lay-unselect="">
							    <a href="javascript:;">匠心衣橱</a>
							    <dl class="layui-nav-child">
							      <dd><a  href="#services">服务</a></dd>
							      <dd><a class="dropdown-item scroll" href="#team">团队</a></dd>
							      <dd><a class="dropdown-item scroll" href="#gallery">图库</a></dd>
							      <dd><a class="dropdown-item scroll" href="#pricing">套餐</a></dd>
							      <dd><a class="dropdown-item scroll" href="#testimonials">评价</a></dd>
							    </dl>
							  </li>
						
						<li class="layui-nav-item">
							<a  href="#contact">联系我们</a>
						</li>
					</ul>
					<ul class="layui-nav">
					<c:choose>
						<c:when test="${sessionScope.nick == null}">
							<li class="layui-nav-item  mr-3">
								<a href="${PATH}/pages/login.jsp">登录</a>
							</li>
							<li class="layui-nav-item  mr-3">
								<a href="${PATH}/pages/admin-login.jsp">后台登录</a>
							</li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionScope.flag == 1}">
									<li class="layui-nav-item" lay-unselect="">
											<a href="javascript:;"><img src="/file/header/2.jpg" class="layui-nav-img"> ${sessionScope.nick} </a>
										<dl class="layui-nav-child">
											<dd>
												<a class="dropdown-item" href="${PATH}/cust/getCustInfo/${sessionScope.id}/${sessionScope.name}">个人中心</a>
											</dd>
											<dd>
												<a class="dropdown-item" href="${PATH}/cust/loginOut">退出登录</a>
											</dd>
										</dl>
									</li>
								</c:when>
								<c:when test="${sessionScope.flag == 2}">
									<li class="layui-nav-item" lay-unselect="">
											<a href="javascript:;"><img src="${sessionScope.photo}" class="layui-nav-img"> ${sessionScope.nick} </a>
										<dl class="layui-nav-child">
											<dd>
												<a class="dropdown-item" href="${PATH}/technician/getTechnInfo/${sessionScope.id}/${sessionScope.phone}">个人中心</a>
											</dd>
											<dd>
												<a class="dropdown-item" href="${PATH}/cust/loginOut">退出登录</a>
											</dd>
										</dl>
									</li>
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</ul>
					
					

				</div>
			</nav>
		</div>
	</header>
	<!-- //header -->
	<!-- banner -->
	<div class="banner" id="home">
		<div class="container">
			<div class="banner-text text-center">
				<div class="callbacks_container">
					<ul class="rslides" id="slider3">
						<li>
							<div class="slider-info">
								<h3 class="text-capitalize">We care for all your valued garments </h3>
								<a class="btn btn-primary  mt-4 text-capitalize scroll" href="#about" role="button">read more</a>
							</div>
						</li>
						<li>
							<div class="slider-info">
								<h3 class="text-capitalize">Trust Us, We Save Your Time.</h3>
								<a class="btn btn-primary  mt-4 text-capitalize scroll" href="#about" role="button">read more</a>
							</div>
						</li>
						<li>
							<div class="slider-info">
								<h3 class="text-capitalize">we offer the best laundry services</h3>
								<a class="btn btn-primary  mt-4 text-capitalize scroll" href="#about" role="button">read more</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //banner -->
	<!-- about -->
	<section class="about-w3ls" id="about">
		<div class="container">
			<div class="jumbotron text-center pt-0">
				<img src="${PATH}/pages/images/about.jpg" alt="" class="img-fluid rounded-circle">
				<h1 class="ab-title my-5">We Promise Highest Quality Care</h1>
				<h2 class="lead">Donec consequat sapien ut leo cursus rhoncus. Nullam dui mi, vulputate ac metus at, semper varius orci. Nulla accumsan
					ac elit in congue.</h2>
				<hr class="my-4">
				<p>rerum hic tenetur a sapiente delectus reiciendis maiores alias consequatur aut consequat sapien ut leo cursus rhoncus.
					Nullam dui mi, vulputate ac metus .</p>
				<p class="lead">
					<a class="btn btn-primary btn-lg mt-3 scroll" href="#services" role="button">Learn more</a>
				</p>
			</div>
		</div>
	</section>
	<!-- //about -->
	<!--services-->
	<div class="agileits-services py-md-5 py-3" id="services">
		<div class="container">
			<h3 class="w3ls-title text-center text-capitalize pb-md-5 pb-4">what we do</h3>
			<div class="agileits-services-row row py-md-5 pb-5">
				<div class="col-lg-3 col-md-6 agileits-services-grids">
					<span class="fab fa-uniregistry p-4"></span>
					<h4 class="mt-2 mb-3">Commercial Service</h4>
					<p>Itaque earum rerum hic tenetur a sapiente delectus reiciendis maiores alias consequatur aut</p>
				</div>
				<div class="col-lg-3 col-md-6 agileits-services-grids mt-md-0 mt-3">
					<span class="fab fa-jenkins p-4"></span>
					<h4 class="mt-2 mb-3">Self Service</h4>
					<p>Itaque earum rerum hic tenetur a sapiente delectus reiciendis maiores alias consequatur aut</p>
				</div>

				<div class="col-lg-3 col-md-6 agileits-services-grids mt-lg-0 mt-3">
					<span class="fab fa-schlix p-4"></span>
					<h4 class="mt-2 mb-3">Faster Service</h4>
					<p>Itaque earum rerum hic tenetur a sapiente delectus reiciendis maiores alias consequatur aut</p>
				</div>
				<div class="col-lg-3 col-md-6 agileits-services-grids mt-lg-0 mt-3">
					<span class="fas fa-magic p-4"></span>
					<h4 class="mt-2 mb-3">Stain Removal</h4>
					<p>Itaque earum rerum hic tenetur a sapiente delectus reiciendis maiores alias consequatur aut</p>
				</div>
			</div>
		</div>
	</div>
	<!-- //services-->
	<!-- stats -->
	<section class="agile_stats text-center py-5">
		<div class="container pt-sm-5">
			<div class="stats_agile mb-sm-5 mb-3">
				<h3 class="stat-title text-capitalize pb-md-5 pb-4">let us do your laundry</h3>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="counter pt-5 px-3 pb-3">
						<i class="far fa-smile fa-2x"></i>
						<div class="timer count-title count-number mt-2" data-to="5100" data-speed="1500"></div>
						<p class="count-text text-capitalize">happy customers</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 mt-md-0 mt-sm-5 mt-3">
					<div class="counter  pt-5 px-3 pb-3">
						<i class=" fab fa-stack-overflow fa-2x"></i>
						<div class="timer count-title count-number mt-2" data-to="4783" data-speed="1500"></div>
						<p class="count-text text-capitalize">dry clean</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 mt-lg-0 mt-sm-5 mt-3">
					<div class="counter  pt-5 px-3 pb-3">
						<i class="fas fa-eraser fa-2x"></i>
						<div class="timer count-title count-number mt-2" data-to="2184" data-speed="1500"></div>
						<p class="count-text text-capitalize">ironing</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 mt-lg-0  mt-sm-5 mt-3">
					<div class="counter  pt-5 px-3 pb-3">
						<i class="fas fa-exclamation fa-2x"></i>
						<div class="timer count-title count-number mt-2" data-to="1084" data-speed="1084"></div>
						<p class="count-text text-capitalize">stain removal</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //stats -->
	<!-- team -->
	<section class="wthree-row py-5" id="team">
		<div class="container py-md-5 py-3">
			<div class="py-md-5 py-3 bg-pricemain text-center">
				<h3 class="w3ls-title text-center text-capitalize pb-md-5 pb-4">meet our team</h3>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6 team-grids">
					<div class="team-effect">
						<img src="${PATH}/pages/images/t1.jpg" alt="img" class="img-responsive">
					</div>
					<!-- team text -->
					<div class="footerv2-w3ls mt-3">
						<h4>John Smith</h4>
						<p>Creative Director</p>
						<ul class="social-iconsv2 agileinfo">
							<li>
								<a href="#">
									<i class="fab fa-facebook-f"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-twitter"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-google-plus-g"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-linkedin-in"></i>
								</a>
							</li>
						</ul>
					</div>
					<!-- //team text -->
				</div>
				<div class="col-lg-3 col-sm-6 team-grids mt-sm-0 mt-5">
					<div class="team-effect">
						<img src="${PATH}/pages/images/t3.jpg" alt="img" class="img-responsive">
					</div>
					<!-- team text -->
					<div class="footerv2-w3ls mt-3">
						<h4>Thomson Doe</h4>
						<p>Chairman</p>
						<ul class="social-iconsv2 agileinfo">
							<li>
								<a href="#">
									<i class="fab fa-facebook-f"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-twitter"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-google-plus-g"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-linkedin-in"></i>
								</a>
							</li>
						</ul>
					</div>
					<!-- //team text -->
				</div>
				<div class="col-lg-3 col-sm-6 team-grids mt-lg-0 mt-5">
					<div class="team-effect">
						<img src="${PATH}/pages/images/t2.jpg" alt="img" class="img-responsive">
					</div>
					<!-- team text -->
					<div class="footerv2-w3ls mt-3">
						<h4>Smith Kevin</h4>
						<p>Executive Manager</p>
						<ul class="social-iconsv2 agileinfo">
							<li>
								<a href="#">
									<i class="fab fa-facebook-f"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-twitter"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-google-plus-g"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-linkedin-in"></i>
								</a>
							</li>
						</ul>
					</div>
					<!-- //team text -->
				</div>
				<div class="col-lg-3 col-sm-6 team-grids mt-lg-0 mt-5">
					<div class="team-effect">
						<img src="${PATH}/pages/images/t4.jpg" alt="img" class="img-responsive">
					</div>
					<!-- team text -->
					<div class="footerv2-w3ls mt-3">
						<h4>Laura Hill</h4>
						<p>HR Manager</p>
						<ul class="social-iconsv2 agileinfo">
							<li>
								<a href="#">
									<i class="fab fa-facebook-f"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-twitter"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-google-plus-g"></i>
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fab fa-linkedin-in"></i>
								</a>
							</li>
						</ul>
					</div>
					<!-- //team text -->
				</div>
			</div>
		</div>
	</section>
	<!-- //team -->
	<div class="tlinks">Collect from <a href="http://www.cssmoban.com/" >建站模板</a></div>
	<!-- gallery -->
	<div class="gallery  py-md-5 py-3" id="gallery">
		<div class="container">
			<h3 class="w3ls-title text-center text-capitalize py-md-4 py-3">gallery</h3>
			<div class="gallery_gds row pt-md-5 pt-3">
				<div class="col-4 gal-w3l">
					<div class="agileits-img">
						<a href="images/g1.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
							<img class="img-responsive img-style row2" src="${PATH}/pages/images/g1.jpg" alt="" />
						</a>
					</div>
				</div>
				<div class="col-4  gal-w3l">
					<div class="agileits-img">
						<a href="images/g2.jpg" class="swipebox" title="Duis maximus tortor diam, ac lobortis justo rutrum quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non purus fermentum, eleifend velit non">
							<img src="${PATH}/pages/images/g2.jpg" alt="" class="img-responsive img-style row2" />
						</a>
					</div>
				</div>
				<div class="col-4  gal-w3l">
					<div class="agileits-img">
						<a href="images/g3.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
							<img src="${PATH}/pages/images/g3.jpg" alt="" class="img-responsive img-style row2" />
						</a>
					</div>
				</div>
			</div>
			<div class="gallery_gds row">
				<div class="col-4  gal-w3l">
					<div class="agileits-img">
						<a href="images/g4.jpg" class="swipebox" title="Praesent non purus fermentum, eleifend velit non Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis.">
							<img src="${PATH}/pages/images/g4.jpg" alt="" class="img-responsive img-style row2" />
						</a>
					</div>
				</div>
				<div class="col-4  gal-w3l">
					<div class="agileits-img">
						<a href="images/g5.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
							<img src="${PATH}/pages/images/g5.jpg" alt="" class="img-responsive img-style row2" />
						</a>
					</div>
				</div>
				<div class="col-4  gal-w3l">
					<div class="agileits-img">
						<a href="images/g6.jpg" class="swipebox" title="Duis maximus tortor diam, ac lobortis justo rutrum quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non purus fermentum, eleifend velit non">
							<img src="${PATH}/pages/images/g6.jpg" alt="" class="img-responsive img-style row2" />
						</a>
					</div>
				</div>
			</div>
			<div class="row pb-md-5 pb-3">
				<div class="col-4  gal-w3l">
					<div class="agileits-img">
						<a href="images/g7.jpg" class="swipebox" title="Praesent non purus fermentum, eleifend velit non Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis.">
							<img src="${PATH}/pages/images/g7.jpg" alt="" class="img-responsive img-style row2" />
						</a>
					</div>
				</div>
				<div class="col-4  gal-w3l">
					<div class="agileits-img">
						<a href="images/g8.jpg" class="swipebox" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis maximus tortor diam, ac lobortis justo rutrum quis. Praesent non purus fermentum, eleifend velit non">
							<img src="${PATH}/pages/images/g8.jpg" alt="" class="img-responsive img-style row2" />
						</a>
					</div>
				</div>
				<div class="col-4  gal-w3l">
					<div class="agileits-img">
						<a href="images/g9.jpg" class="swipebox" title="Duis maximus tortor diam, ac lobortis justo rutrum quis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non purus fermentum, eleifend velit non">
							<img src="${PATH}/pages/images/g9.jpg" alt="" class="img-responsive img-style row2" />
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //gallery -->
	<!-- pricing -->
	<section class="wthree-row py-md-5 pt-sm-5" id="pricing">
		<div class="container py-md-5 py-3">
			<h3 class="w3ls-title text-center text-capitalize pb-md-5 pb-4">pricing plans</h3>
			<div class="row pb-5">
				<div class="col-lg-3 col-md-6 text-center  pb-0 pt-3 px-3 agile-pricegrid">
					<div class="bg-price py-sm-3 rounded-top text-center">
						<h4>Basic</h4>
						<span class="mx-auto my-2"></span>
					</div>
					<div class="p-3">
						<h5 class="pt-2">
							<sup>$</sup>39</h5>
						<span>per month</span>
					</div>
					<ul class="list-group-flush">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
					</ul>
					<div class="py-3 px-2">
						<button type="button" class="btn btn-info btn-lg btn-block text-md-center" data-toggle="modal" aria-pressed="false" data-target="#exampleModal">Get Started</button>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center pb-0 pt-3 px-3 agile-pricegrid">
					<div class="bg-price py-sm-3 rounded-top text-center">
						<h4>Regular</h4>
						<span class="mx-auto my-2"></span>
					</div>
					<div class="p-3">
						<h5 class="pt-2">
							<sup>$</sup>69</h5>
						<span>per month</span>
					</div>
					<ul class="list-group-flush">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
					</ul>
					<div class="py-3 px-2">
						<button type="button" class="btn btn-info btn-lg btn-block" data-toggle="modal" aria-pressed="false" data-target="#exampleModal">Get Started</button>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center p-3  agile-pricegrid">
					<div class="bg-price py-sm-3 rounded-top text-center">
						<h4>Mega</h4>
						<span class="mx-auto my-2"></span>
					</div>
					<div class="p-3">
						<h5 class="pt-2">
							<sup>$</sup>99</h5>
						<span>per month</span>
					</div>
					<ul class="list-group-flush">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
					</ul>
					<div class="py-3 px-2">
						<button type="button" class="btn btn-info btn-lg btn-block" data-toggle="modal" aria-pressed="false" data-target="#exampleModal">Get Started</button>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center pb-0 pt-3 px-3 agile-pricegrid">
					<div class="bg-price py-sm-3 rounded-top text-center">
						<h4>Combo</h4>
						<span class="mx-auto my-2"></span>
					</div>
					<div class="p-3">
						<h5 class="pt-2">
							<sup>$</sup>199</h5>
						<span>per month</span>
					</div>
					<ul class="list-group-flush">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Morbi leo risus</li>
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Porta ac consectetur ac</li>
					</ul>
					<div class="py-3 px-2">
						<button type="button" class="btn btn-info btn-lg btn-block" data-toggle="modal" aria-pressed="false" data-target="#exampleModal">Get Started</button>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //pricing -->
	<!-- testimonials -->
	<section class="wthree-row py-5 testi-agile" id="testimonials">
		<div class="container py-md-5 py-3">
			<h3 class="w3ls-title text-center text-capitalize pb-md-5 pb-4">testimonials</h3>
			<div class="w3_testimonials_grids w3_testimonials_grids">
				<div class="sreen-gallery-cursual">
					<div id="owl-demo" class="owl-carouselpb-5">
						<div class="item-owl text-center">
							<div class="img-agile">
								<i class="fas fa-user"></i>
								<h6 class="mt-3 text-white">Michael Paul</h6>
							</div>
							<div class="test-review test-tooltip1">
								<p class="mx-auto mt-3 text-white">
									<i class="fa fa-quote-left" aria-hidden="true"></i> Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
									sed diam voluptua.
									<i class="fa fa-quote-right" aria-hidden="true"></i>
								</p>
							</div>
						</div>
						<div class="item-owl">
							<div class="img-agile">
								<i class="fas fa-user"></i>
								<h6 class="mt-3 text-white">Riya Allen</h6>
							</div>
							<div class="test-review test-tooltip1">
								<p class="mx-auto mt-3 text-white">
									<i class="fa fa-quote-left" aria-hidden="true"></i> Polite sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed
									diam voluptua.
									<i class="fa fa-quote-right" aria-hidden="true"></i>
								</p>
							</div>
						</div>
						<div class="item-owl">
							<div class="img-agile">
								<i class="fas fa-user"></i>
								<h6 class="mt-3 text-white">Riya Allen</h6>
							</div>
							<div class="test-review test-tooltip1">
								<p class="mx-auto mt-3 text-white">
									<i class="fa fa-quote-left" aria-hidden="true"></i> Consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat,
									sed diam voluptua.
									<i class="fa fa-quote-right" aria-hidden="true"></i>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- //testimonials -->
	<!-- contact -->
	<section class="wthree-row py-5 w3-contact" id="contact">
		<div class="container py-md-5">
			<h3 class="w3ls-title text-center text-capitalize pb-md-5 pb-4">contact us</h3>
			<div class="row contact-form py-3">
				<div class="col-lg-6 wthree-form-left">
					<!-- contact form grid -->
					<div class="contact-top1">
						<form action="#" method="get" class="f-color">
							<div class="form-group">
								<label for="contactusername">Name</label>
								<input type="text" class="form-control" id="contactusername" required>
							</div>
							<div class="form-group">
								<label for="contactemail">Email</label>
								<input type="email" class="form-control" id="contactemail" required>
							</div>
							<div class="form-group">
								<label for="contactcomment">Your Message</label>
								<textarea class="form-control" rows="5" id="contactcomment" required></textarea>
							</div>
							<button type="submit" class="btn btn-info btn-block">Submit</button>
						</form>
					</div>
					<!--  //contact form grid ends here -->
				</div>
				<!-- contact details -->
				<!-- contact map grid -->
				<div class="col-lg-6  mt-lg-0 mt-5 map contact-right">
					<iframe class="h-50" src="" allowfullscreen></iframe>
					<div class="address mt-3">
						<h5 class="pb-3 text-capitalize">Contact info</h5>
						<address>
							<p class="c-txt">90 Street, City, State 34789.</p>
							<p>
								+10 234 5678</p>
							<p>
								<p>
									<a href="mailto:info@example.com">mail@golaundry.com</a>
								</p>
						</address>
					</div>
				</div>
				<!--//contact map grid ends here-->
			</div>
			<!-- //contact details container -->
		</div>
	</section>
	<!-- //contact -->
	<!-- slide -->
	<section class="wthree-row py-sm-5 py-3 slide-bg bg-dark">
		<div class="container py-md-5 py-3">
			<div class="py-lg-5 bg-pricemain">
				<h3 class="agile-title text-capitalize text-white">go laundry!</h3>
				<span class="w3-line"></span>
				<h5 class="agile-title text-capitalize pt-4">trust us, we save your time.</h5>
				<p class="text-light py-sm-4 py-2">Aliquam ac est vel nisl condimentum interdum vel eget enim. Curabitur mattis orci sed leo mattis, nec maximus nibh faucibus.
					Mauris et justo vel nibh rhoncus venenatis. Nullal condimentum interdum vel eget enim. Curabitur mattis orci sed le.
				</p>
				<a href="#" class="text-uppercase serv_link align-self-center bg-light btn px-4">read more</a>
			</div>
		</div>
	</section>
	<!--//slide-->
	<!-- footer -->
	<footer class="py-md-5 pt-5 pb-4">
		<div class="container">
			<!-- footer grid top -->
			<div class="footerv2-w3ls text-center">
				<h4 class="w3ls-title text-capitalize pb-3">socialize with us</h4>
				<ul class="social-iconsv2 agileinfo mt-3">
					<li>
						<a href="#">
							<i class="fab fa-facebook-f"></i>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fab fa-twitter"></i>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fab fa-google-plus-g"></i>
						</a>
					</li>
					<li>
						<a href="#">
							<i class="fab fa-linkedin-in"></i>
						</a>
					</li>
				</ul>
				<div class="fv3-contact mt-3">
					<span class="fas fa-envelope-open mr-2"></span>
					<p>
						<a href="mailto:example@email.com" class="text-dark">info@example.com</a>
					</p>
				</div>
				<div class="fv3-contact">
					<span class="fas fa-phone-volume mr-2"></span>
					<p>+456 123 7890</p>
				</div>
			</div>
			<!-- copyright -->
			<div class="cpy-right text-center pt-5">
				<p>Copyright &copy; 2018.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			</div>
			<!-- //copyright -->
		</div>
	</footer>
	<!-- //footer -->
	<!-- order modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title text-capitalize" id="exampleModalLabel1">order your laundry</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="#" method="post" class="p-3">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Your Name</label>
							<input type="text" class="form-control" placeholder=" " name="Name" id="recipient-name" required="">
						</div>
						<div class="form-group">
							<label for="recipient-name1" class="col-form-label">Your Email</label>
							<input type="email" class="form-control" placeholder=" " name="Name" id="recipient-name1" required="">
						</div>
						<div class="form-group">
							<label for="recipient-name2" class="col-form-label">Phone</label>
							<input type="text" class="form-control" placeholder=" " name="Name" id="recipient-name2" required="">
						</div>
						<div class="form-group">
							<label class="mr-2 col-form-label">Pick Up</label>
							<input id="datepicker1" name="check in" type="text" value="mm/dd/yyyy" class="form-control" required="">
						</div>
						<div class="form-group">
							<label class="mr-2 col-form-label">Delivery </label>
							<input id="datepicker2" name="check out" type="text" value="mm/dd/yyyy" class="form-control" required="">
						</div>
						<div class="form-check">
							<label class="form-check-label col-form-label" for="l1">
								<input type="checkbox" class="form-check-input" value="" id="l1">Wash& Fold
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label col-form-label" for="l2">
								<input type="checkbox" class="form-check-input" value="" id="l2">Handwash
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label col-form-label" id="l3">
								<input type="checkbox" class="form-check-input" value="" id="13">Dry Clean
							</label>
						</div>
						<div class="form-check">
							<label class="form-check-label col-form-label" for="l4">
								<input type="checkbox" class="form-check-input" value="" id="l4">Carpets
							</label>
						</div>
						<div class="form-group">
							<label for="comment" class="col-form-label">Pickup Address:</label>
							<textarea class="form-control" rows="5" id="comment"></textarea>
						</div>

						<div class="right-w3l">
							<input type="submit" class="form-control" value="pick my laundry">
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- //order modal -->
	<!-- js-->
	<script src="${PATH}/pages/js/jquery-2.2.3.min.js"></script>
	<!-- js-->
	<!-- Banner text Responsiveslides -->
	<script src="${PATH}/pages/js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function () {
			// Slideshow 4
			$("#slider3").responsiveSlides({
				auto: true,
				pager: true,
				nav: false,
				speed: 500,
				namespace: "callbacks",
				before: function () {
					$('.events').append("<li>before event fired.</li>");
				},
				after: function () {
					$('.events').append("<li>after event fired.</li>");
				}
			});

		});
	</script>
	<!-- //Banner text  Responsiveslides -->
	<!-- start-smooth-scrolling -->
	<script src="${PATH}/pages/js/move-top.js "></script>
	<script src="${PATH}/pages/js/easing.js "></script>
	<script>
		jQuery(document).ready(function ($) {
			$(".scroll ").click(function (event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
	<!-- //end-smooth-scrolling -->
	<!-- smooth-scrolling-of-move-up -->
	<script>
		$(document).ready(function () {
			/*
			 var defaults = {
				 containerID: 'toTop', // fading element id
				 containerHoverID: 'toTopHover', // fading element hover id
				 scrollSpeed: 1200,
				 easingType: 'linear' 
			 };
			 */

			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<script src="${PATH}/pages/js/SmoothScroll.min.js "></script>
	<!-- //smooth-scrolling-of-move-up -->
	<!-- gallery swipebox -->
	<script src="${PATH}/pages/js/jquery.swipebox.min.js"></script>
	<script>
		jQuery(function ($) {
			$(".swipebox").swipebox();
		});
	</script>
	<script src="${PATH}/pages/js/jquery.adipoli.min.js"></script>
	<!-- effect -->
	<script>
		$(function () {
			$('.row2').adipoli({
				'startEffect': 'overlay',
				'hoverEffect': 'sliceDown'
			});
		});
	</script>
	<!-- //swipe box js -->
	<!-- stats counter -->
	<script src="${PATH}/pages/js/counter.js"></script>
	<!-- Date picker -->
	<link rel="stylesheet" href="${PATH}/pages/css/jquery-ui.css" />
	<script src="${PATH}/pages/js/jquery-ui.js"></script>
	<script>
		$(function () {
			$("#datepicker1,#datepicker2").datepicker();
		});
	</script>
	<!-- // Date picker -->
	<!-- testimonials -->
	<link href="${PATH}/pages/css/owl.carousel.css" rel="stylesheet">
	<script src="${PATH}/pages/js/owl.carousel.js"></script>
	<script>
		$(document).ready(function () {
			$("#owl-demo").owlCarousel({
				items: 1,
				lazyLoad: true,
				autoPlay: false,
				navigation: true,
				navigationText: true,
				pagination: true,
			});
		});
	</script>
	<!-- //for testimonials slider-js-script-->
	<!-- Bootstrap Core JavaScript -->
	<script src="${PATH}/pages/js/bootstrap.js ">
	</script>
	<script src="${PATH}/static/layui/layui.all.js"></script>
	<!-- //Bootstrap Core JavaScript -->
</body>

</html>