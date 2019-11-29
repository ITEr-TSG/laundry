<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="zxx">
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<head>
	<title>技师列表</title>
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
	<script src="${PATH}/static/vue/vue.min.js"></script>
<script src="${PATH}/static/vue/vue-resource.min.js"></script>
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
						
							
						
						<li class="layui-nav-item">
							<a href="${PATH}/pages/blogs/whisper.jsp">博客中心</a>
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
												<a class="dropdown-item" href="${PATH}/blogs/writeBlog/${sessionScope.id}/${sessionScope.phone}">编写博客</a>
											</dd>
											<dd>
												<a class="dropdown-item" href="${PATH}/blogs/getBlogsByTechn/${sessionScope.id}/${sessionScope.phone}">我的博客</a>
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
	
	
	
	
	<!-- team -->
	<section class="wthree-row py-5">
		<div class="container py-md-5 py-3">
			<div class="py-md-5 py-3 bg-pricemain text-center">
				<h3 class="w3ls-title text-center text-capitalize pb-md-5 pb-4">专业的技师团队</h3>
			</div>
			<div class="row" id="technList">
				<div class="col-lg-12 team-grids">
					<!-- 条件 -->
					<div class="layui-form" >
					  <div class="layui-form-item">
					    <div class="layui-inline">
					      <label class="layui-form-label">分类</label>
					      <div class="layui-input-inline">
					        <select  lay-search="" ref="sortId">
					          <option value="">直接选择或搜索选择</option>
					          <option v-for="item in sorts" :value="item.technSortId" v-text = 'item.sortName'></option>
					        </select>
					      </div>
					      <button type="button" v-on:click="fingByCust" class="layui-btn">
					      	<i class="layui-icon layui-icon-search"></i>   
					      </button>
					    </div>
						</div>
					</div>					
				</div>
				
				
				<div class="col-lg-3 col-sm-6 team-grids" v-for="item in techns">
					<div class="team-effect">
						<img :src="item.technPhoto" alt="照片" class="img-responsive">
					</div>
					<!-- team text -->
					<div class="footerv2-w3ls mt-3">
						<h4 v-text = 'item.technRealName'></h4>
						<p v-text = 'item.technEmail'></p>
						<ul class="social-iconsv2 agileinfo">
							
						</ul>
					</div>
					<!-- //team text -->
				</div>
				
				
				
			</div>
		</div>
	</section>
	<!-- //team -->
	<!-- slide -->
	<section class="wthree-row py-sm-5 py-3 slide-bg bg-dark">
		<div class="container py-md-5 py-3">
			<div class="py-lg-5 bg-pricemain">
				<h3 class="agile-title text-capitalize text-white">去洗衣服！</h3>
				<span class="w3-line"></span>
				<h5 class="agile-title text-capitalize pt-4">相信我们，我们可以节省您的时间！</h5>
				<p class="text-light py-sm-4 py-2">Aliquam ac est vel nisl condimentum interdum vel eget enim. Curabitur mattis orci sed leo mattis, nec maximus nibh faucibus.
					Mauris et justo vel nibh rhoncus venenatis. Nullal condimentum interdum vel eget enim. Curabitur mattis orci sed le.
				</p>
			</div>
		</div>
	</section>
	<!--//slide-->
	<!-- footer -->
	<footer class="py-md-5 pt-5 pb-4">
		<div class="container">
			<!-- footer grid top -->
			<div class="footerv2-w3ls text-center">
				<h4 class="w3ls-title text-capitalize pb-3">关注我们</h4>
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
		</div>
	</footer>
	<!-- //footer -->
	<!-- order modal -->
	
	<!-- js-->
	<script src="${PATH}/pages/js/jquery-2.2.3.min.js"></script>
	<script src="${PATH}/static/layui/layui.all.js"></script>
	<!-- //Bootstrap Core JavaScript -->
</body>
<script type="text/javascript">
	var technList = new Vue({
		el:"#technList",
		data:{
			sorts:[],
			techns:[],
			sortId:""
		},created: function () {
			this.$http.get("${PATH}/technSort/getSorts").then(function(response){
				//成功
				this.sorts=response.body;
			},function(response) {
				//错误
				console.log("查询反馈分类时，出现系统错误！")
			});
			this.$http.post("${PATH}/technician/getTechnByCust",{data:this.sortId}).then(function(response){
				//成功
				this.techns=response.body;
			},function(response) {
				//错误
				console.log("查询反馈分类时，出现系统错误！")
			});
		},updated: function () {
            layui.form.render();
      },
      methods:{
    	  fingByCust:function(){
    		  this.$http.post("${PATH}/technician/getTechnByCust",{data:this.$refs.sortId.value}).then(function(response){
  				//成功
  				this.techns=response.body;
  			},function(response) {
  				//错误
  				console.log("查询反馈分类时，出现系统错误！")
  			});
    	  } 
      }
	});
</script>
</html>