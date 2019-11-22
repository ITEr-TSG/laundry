<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<head>
<meta charset="UTF-8">
<title>客户注册</title>
<link href="${PATH}/pages/css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<link rel="stylesheet" href="${PATH}/pages/css/swipebox.css">
<!-- Custom CSS -->
<link href="${PATH}/pages/css/style.css" rel='stylesheet'
	type='text/css' />
<!-- font-awesome icons -->
<link href="${PATH}/pages/css/fontawesome-all.min.css" rel="stylesheet">
<!-- //Custom Theme files -->
<!--webfonts-->
<link
	href="http://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!--//webfonts-->
<link href="${PATH}/static/layui/css/layui.css" rel='stylesheet'
	type='text/css' />
</head>
<style>
form {
	padding: 0px 0px 100px 0
}

h1 {
	padding: 100px 0px 50px 0px
}
.layui-form-label{
	width: 100px;

}
input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
    input[type="number"]{
        -moz-appearance: textfield;
    }

</style>

<body>
	<div class="container-fluid" style="background-color: gray;">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="index.html"> <i
				class="fab fa-empire"></i>
			</a>
			<button class="navbar-toggler ml-md-auto" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto text-center">
				</ul>
				<a href="${PATH}/pages/login.jsp"
					class="btn btn-info btn-lg-block w3ls-btn px-4 text-uppercase font-weight-bold"
					aria-pressed="false"> 客户登录 </a>&nbsp;&nbsp;&nbsp;&nbsp; <a
					href="${PATH}/pages/login.jsp"
					class="btn btn-info btn-lg-block w3ls-btn px-4 text-uppercase font-weight-bold"
					aria-pressed="false"> 注册技师 </a>

			</div>
		</nav>
	</div>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md12">
				<div class="layui-col-md4 layui-col-md-offset4">
					<h1 align="center">客户注册</h1>
					<h4 align="center" style="color: red"> ${sessionScope.error}</h4><br>
					<form class="layui-form" action="${PATH}/cust/regiterCust" method="post">
						<div class="layui-form-item">
							<label class="layui-form-label">用户名</label>
							<div class="layui-input-block">
								<input type="text" name="custName" required lay-verify="required"
									placeholder="请输入用户名" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">密码</label>
							<div class="layui-input-block">
								<input type="text" name="formPwd1" required lay-verify="required"
									placeholder="请输入密码" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">确认密码</label>
							<div class="layui-input-block">
								<input type="text" name="formPwd2" required lay-verify="required"
									placeholder="请确认密码" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-block">
								<input type="email"  name="custEmail" required lay-verify="required"
									placeholder="请输入邮箱" id="regiterEmailInput" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">验证码</label>
							<div class="layui-input-inline">
								<input style="margin-left: 10px;width: 270px" type="number"  name="formCode" required lay-verify="required"
									placeholder="请输入验证码" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux" style="margin-left: 10px"><input type="button" class="layui-btn  layui-btn-primary" id="codeBtn" value="点击获取验证码" onclick="sendemail()"/> </div>
						</div>
						

						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" type="submit" lay-submit>登录</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>

				</div>
			</div>

		</div>

	</div>
	<footer class="py-md-5 pt-5 pb-4" style="background-color: gray;">
		<div class="container">
			<!-- footer grid top -->
			<div class="footerv2-w3ls text-center">
				<h4 class="w3ls-title text-capitalize pb-3">关注我们</h4>
				<ul class="social-iconsv2 agileinfo mt-3">
					<li><a href="#"> <i class="fab fa-facebook-f"></i>
					</a></li>
					<li><a href="#"> <i class="fab fa-twitter"></i>
					</a></li>
					<li><a href="#"> <i class="fab fa-google-plus-g"></i>
					</a></li>
					<li><a href="#"> <i class="fab fa-linkedin-in"></i>
					</a></li>
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
			<div class="cpy-right text-center pt-5"></div>
			<!-- //copyright -->
		</div>
	</footer>

</body>
<script src="${PATH}/static/layui/layui.all.js"></script>
<script src="${PATH}/static/js/jquery2.0-min.js"></script>
<script type="text/javascript"> 
	var countdown=60; 
	function sendemail(){
		layui.use('layer', function(){
		  	var layer = layui.layer;
		  	var obj = $("#codeBtn");
		    var email = $("#regiterEmailInput").val();
		    var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		    if(!reg.test(email)){
		    	layer.msg("请输入正确的邮箱！",{icon:5});
		    	return;
		    }
		    $.ajax({
		    	url:"${PATH}/regiterCode/createEmailCode?regEmail="+email,
		    	method:"get",
		    	success:function(res){
		    		if(res.code==100){
		    			layer(res.extend.msg,{icon:6});
		    		}else{
		    			layer(res.extend.msg,{icon:5});
		    		}
		    	},error:function(){
		    		layer.msg("系统错误！",{icon:5});
		    		return;
		    	}
		    });
		    settime(obj);
		});
	    }
	function settime(obj) { //发送验证码倒计时
	    if (countdown == 0) { 
	        obj.attr('disabled',false); 
	        //obj.removeattr("disabled"); 
	        obj.val("点击获取验证码");
	        countdown = 60; 
	        return;
	    } else { 
	        obj.attr('disabled',true);
	        obj.val("重新发送(" + countdown + ")");
	        countdown--; 
	    } 
	setTimeout(function() { 
	    settime(obj) }
	    ,1000) 
	}
</script>
</html>