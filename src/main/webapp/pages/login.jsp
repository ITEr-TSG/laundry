<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<head>
<meta charset="UTF-8">
<title>登录</title>
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

.layui-form-label {
	width: 100px;
}

input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

input[type="number"] {
	-moz-appearance: textfield;
}
</style>

<body>
	<div class="container-fluid" style="background-color: #393D49;">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="${PATH}/pages/index.jsp"> <i
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
				<ul class="layui-nav">
					<li class="layui-nav-item  mr-3"><a
						href="${PATH}/pages/cust-regiter.jsp">注册客户</a></li>
					<li class="layui-nav-item  mr-3"><a
						href="${PATH}/pages/technician-regiter.jsp">注册技师 </a></li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md12">

				<div class="layui-carousel" id="test1">
					<div carousel-item>
						<div>
							<div class="layui-col-md4 layui-col-md-offset4">
								<h1 align="center">客户登录</h1>
								<h4 align="center" style="color: red">${sessionScope.error}</h4>
								<br>
								<form class="layui-form" action="${PATH}/cust/loginInto"
									method="post">
									<div class="layui-form-item">
										<label class="layui-form-label">用户名</label>
										<div class="layui-input-block">
											<input type="text" name="formCode" required
												lay-verify="required" placeholder="请输入用户或邮箱" autocomplete="off"
												class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">密码</label>
										<div class="layui-input-block">
											<input type="password" name="custPassword" required
												lay-verify="required" placeholder="请输入标题密码" autocomplete="off"
												class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-input-block">
											<button type="button" id="forgetPwdBtn"
												class="layui-btn layui-btn-sm layui-btn-primary">忘记密码？</button>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-input-block">
											<button class="layui-btn" type="submit">登录</button>
											<button type="reset" class="layui-btn layui-btn-primary">重置</button>
										</div>
									</div>
								</form>
			
							</div>
						
						</div>
						<div>
							<div class="layui-col-md4 layui-col-md-offset4">
								<h1 align="center">技师登录</h1>
								<h4 align="center" style="color: red">${sessionScope.errorTechn}</h4>
								<br>
								<form class="layui-form" action="${PATH}/technician/loginInto"
									method="post">
									<div class="layui-form-item">
										<label class="layui-form-label">用户名</label>
										<div class="layui-input-block">
											<input type="text" name="formCode" required
												lay-verify="required" placeholder="请输入真实姓名或邮箱" autocomplete="off"
												class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">密码</label>
										<div class="layui-input-block">
											<input type="password" name="technPassword" required
												lay-verify="required" placeholder="请输入标题密码" autocomplete="off"
												class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-input-block">
											<button type="button" id="forgetPwdBtn_techn"
												class="layui-btn layui-btn-sm layui-btn-primary">忘记密码？</button>
										</div>
									</div>
									<div class="layui-form-item">
										<div class="layui-input-block">
											<button class="layui-btn" type="submit">登录</button>
											<button type="reset" class="layui-btn layui-btn-primary">重置</button>
										</div>
									</div>
								</form>
			
							</div>
						</div>
					</div>
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
	<!-- 模态款 -->
	<div id="forgetPwdModal" style="display: none;">
		<div class="layui-row">
			<div class="layui-col-md10 layui-col-md-offset1"
				style="margin-top: 10px">
				<div class="layui-form">
					<div class="layui-form-item">
						<label class="layui-form-label">邮箱</label>
						<div class="layui-input-block">
							<input type="email" required lay-verify="required"
								placeholder="请输入邮箱" id="changeEmailInput" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">验证码</label>
						<div class="layui-input-inline">
							<input style="margin-left: 10px; width: 209px" type="number"
								id="changeCode" required lay-verify="required"
								placeholder="请输入验证码" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux"
							style="margin-left: 10px">
							<input type="button" class="layui-btn  layui-btn-primary"
								id="codeBtn" value="点击获取验证码" onclick="sendemail()" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码</label>
						<div class="layui-input-block">
							<input type="text" id="change-pwd1" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">确认密码</label>
						<div class="layui-input-block">
							<input type="text" id="change-pwd2" required
								lay-verify="required" placeholder="请确认密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" type="button" id="custChangePwdBtn">修改</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="forgetPwdModal_techn" style="display: none;">
		<div class="layui-row">
			<div class="layui-col-md10 layui-col-md-offset1"
				style="margin-top: 10px">
				<div class="layui-form">
					<div class="layui-form-item">
						<label class="layui-form-label">邮箱</label>
						<div class="layui-input-block">
							<input type="email" required lay-verify="required"
								placeholder="请输入邮箱" id="changeEmailInput_techn" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">验证码</label>
						<div class="layui-input-inline">
							<input style="margin-left: 10px; width: 209px" type="number"
								id="changeCode_techn" required lay-verify="required"
								placeholder="请输入验证码" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux"
							style="margin-left: 10px">
							<input type="button" class="layui-btn  layui-btn-primary"
								id="codeBtn_techn" value="点击获取验证码" onclick="sendemail_techn()" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">密码</label>
						<div class="layui-input-block">
							<input type="text" id="change-pwd1_techn" required
								lay-verify="required" placeholder="请输入密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">确认密码</label>
						<div class="layui-input-block">
							<input type="text" id="change-pwd2_techn" required
								lay-verify="required" placeholder="请确认密码" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" type="button" id="technChangePwdBtn">修改</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
<script src="${PATH}/static/layui/layui.all.js"></script>
<script src="${PATH}/static/js/jquery2.0-min.js"></script>
<script type="text/javascript">
	$("#custChangePwdBtn").click(function() {
		layui.use('layer', function() {
			var layer = layui.layer;
			var changeEmail = $("#changeEmailInput").val();
			var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!reg.test(changeEmail)) {
				layer.msg("请输入正确的邮箱！", {
					icon : 5
				});
				return;
			}
			var changeCode = $("#changeCode").val();
			var changePwd1 = $("#change-pwd1").val();
			var changePwd2 = $("#change-pwd2").val();
			if (changePwd1 != changePwd2) {
				layer.msg("两次输入的密码不一致！", {
					icon : 5
				});
				return;
			}
			$.ajax({
				url : "${PATH}/cust/forgetPwd",
				method : "post",
				contentType : "application/json",//必须指定，否则会报415错误
				dataType : 'json',
				data : JSON.stringify({
					email : changeEmail,
					code : changeCode,
					changePwd : changePwd2
				}),
				success : function(res) {
					if (res.code == 100) {
						layer.msg(res.extend.msg, {
							icon : 6
						}, function() {
							layer.closeAll();
						});
					} else {
						layer.msg(res.extend.msg, {
							icon : 5
						}, function() {
							layer.closeAll();
						});
					}
				},
				error : function() {
					layer.msg("系统错误！", {
						icon : 5
					});
				}
			});

		})
	});
	$("#technChangePwdBtn").click(function() {
		layui.use('layer', function() {
			var layer = layui.layer;
			var changeEmail = $("#changeEmailInput_techn").val();
			var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!reg.test(changeEmail)) {
				layer.msg("请输入正确的邮箱！", {
					icon : 5
				});
				return;
			}
			var changeCode = $("#changeCode_techn").val();
			var changePwd1 = $("#change-pwd1_techn").val();
			var changePwd2 = $("#change-pwd2_techn").val();
			if (changePwd1 != changePwd2) {
				layer.msg("两次输入的密码不一致！", {
					icon : 5
				});
				return;
			}
			$.ajax({
				url : "${PATH}/technician/forgetPwd",
				method : "post",
				contentType : "application/json",//必须指定，否则会报415错误
				dataType : 'json',
				data : JSON.stringify({
					email : changeEmail,
					code : changeCode,
					changePwd : changePwd2
				}),
				success : function(res) {
					if (res.code == 100) {
						layer.msg(res.extend.msg, {
							icon : 6
						}, function() {
							layer.closeAll();
						});
					} else {
						layer.msg(res.extend.msg, {
							icon : 5
						}, function() {
							layer.closeAll();
						});
					}
				},
				error : function() {
					layer.msg("系统错误！", {
						icon : 5
					});
				}
			});

		})
	});
	//客户忘记密码
	$("#forgetPwdBtn").click(function() {
		layui.use('layer', function() {
			var layer = layui.layer;
			layer.open({
				type : 1,//类型
				area : [ '400px', '400px' ],//定义宽和高
				title : '客户忘记密码',//题目
				shadeClose : false,//点击遮罩层关闭
				content : $('#forgetPwdModal')
			//打开的内容
			});
		})
	});
	//技师忘记密码
	$("#forgetPwdBtn_techn").click(function() {
		layui.use('layer', function() {
			var layer = layui.layer;
			layer.open({
				type : 1,//类型
				area : [ '400px', '400px' ],//定义宽和高
				title : '技师忘记密码',//题目
				shadeClose : false,//点击遮罩层关闭
				content : $('#forgetPwdModal_techn')
			//打开的内容
			});
		})
	});
	var countdown = 60;
	function sendemail() {
		layui.use('layer', function() {
			var layer = layui.layer;
			var obj = $("#codeBtn");
			var email = $("#changeEmailInput").val();
			var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!reg.test(email)) {
				layer.msg("请输入正确的邮箱！", {
					icon : 5
				});
				return;
			}
			$.ajax({
				url : "${PATH}/regiterCode/createEmailCode?regEmail=" + email,
				method : "get",
				success : function(res) {
					if (res.code == 100) {
						layer.msg(res.extend.msg, {
							icon : 6
						});
					} else {
						layer.msg(res.extend.msg, {
							icon : 5
						});
					}
				},
				error : function() {
					layer.msg("系统错误！", {
						icon : 5
					});
					return;
				}
			});
			settime(obj);
		});
	}
	function sendemail_techn() {
		layui.use('layer', function() {
			var layer = layui.layer;
			var obj = $("#codeBtn_techn");
			var email = $("#changeEmailInput_techn").val();
			var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if (!reg.test(email)) {
				layer.msg("请输入正确的邮箱！", {
					icon : 5
				});
				return;
			}
			$.ajax({
				url : "${PATH}/regiterCode/createEmailCode?regEmail=" + email,
				method : "get",
				success : function(res) {
					if (res.code == 100) {
						layer.msg(res.extend.msg, {
							icon : 6
						});
					} else {
						layer.msg(res.extend.msg, {
							icon : 5
						});
					}
				},
				error : function() {
					layer.msg("系统错误！", {
						icon : 5
					});
					return;
				}
			});
			settime(obj);
		});
	}
	function settime(obj) { //发送验证码倒计时
		if (countdown == 0) {
			obj.attr('disabled', false);
			//obj.removeattr("disabled"); 
			obj.val("点击获取验证码");
			countdown = 60;
			return;
		} else {
			obj.attr('disabled', true);
			obj.val("重新发送(" + countdown + ")");
			countdown--;
		}
		setTimeout(function() {
			settime(obj)
		}, 1000)
	}
	
	layui.use('carousel', function(){
		  var carousel = layui.carousel;
		  //建造实例
		  carousel.render({
		    elem: '#test1'
		    ,width: '100%' //设置容器宽度
		    ,arrow: 'hover' //始终显示箭头
		    ,trigger:"click"
		    ,anim:"fade"
		    ,height:"600px"
		    ,autoplay:false
		  });
		});
	
</script>
</html>