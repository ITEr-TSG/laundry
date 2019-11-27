<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<head>
<meta charset="UTF-8">
<title>个人中心</title>
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
.cust-info {
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
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md12">
				<div id="oldCustInfo" class="layui-col-md4 layui-col-md-offset4">
					<h1 align="center">技师信息</h1>
					<h4 align="center" style="color: red">${error}</h4>
					<br>
					<div class="layui-form cust-info">
						<div class="layui-form-item">
							<label class="layui-form-label">用户名</label>
							<div class="layui-input-block">
								<input type="text" readonly="readonly" value="${techn.technRealName}"
									required lay-verify="required" placeholder="请输入用户名"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">昵称</label>
							<div class="layui-input-block">
								<input type="text"  readonly="readonly" value="${techn.technNick}"
									required lay-verify="required" placeholder="请输入昵称"
									autocomplete="off" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-block">
								<input type="email" id="changeCustInfoEmail" readonly="readonly"
									value="${techn.technEmail}" required lay-verify="required"
									placeholder="请输入邮箱" id="regiterEmailInput" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">电话</label>
							<div class="layui-input-block">
								<input type="email" id="changeCustInfoEmail" readonly="readonly"
									value="${techn.technPhone}" required lay-verify="required"
									placeholder="请输入邮箱" id="regiterEmailInput" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">积分</label>
							<div class="layui-input-inline">
								<input readonly="readonly"
									style="margin-left: 10px; width: 270px" id="oldIntegral" type="number"
									value="${techn.technIntegral}" required lay-verify="required"
									placeholder="请输入验证码" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux"
								style="margin-left: 10px">
								<input type="button" class="layui-btn  layui-btn-primary"
									id="cashBtn" value="积分提现" />
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">照片</label>
							<div class="layui-input-block">
								<img alt="照片" style="width: 100px;height: 141px" src="${techn.technPhoto}">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button id="showChangeInfo"
									class="layui-btn layui-btn-radius layui-btn-normal"
									type="button">
									修改资料&nbsp;&nbsp;<i class="layui-icon layui-icon-edit"></i>
								</button>
							</div>
						</div>

					</div>

				</div>
				<div id="newCustInfo" hidden="hidden"
					class="layui-col-md4 layui-col-md-offset4">
					<h1 align="center">修改信息</h1>
					<form class="layui-form" action="${PATH}/technician/changeTechnInfo"
						method="post">
						<input type="hidden" name="technicianId" value="${techn.technicianId}">
						<input type="hidden" name="technPhone" value="${techn.technPhone}">
						<input type="hidden" name="technEmail" value="${techn.technEmail}">
						<div class="layui-form-item">
							<label class="layui-form-label">昵称</label>
							<div class="layui-input-block">
								<input type="text" name="technNick" placeholder="请输入昵称"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">新密码</label>
							<div class="layui-input-block">
								<input type="text" name="formPwd1" placeholder="请输入密码"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">确认密码</label>
							<div class="layui-input-block">
								<input type="text" name="formPwd2" placeholder="请确认密码"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">验证码</label>
							<div class="layui-input-inline">
								<input style="margin-left: 10px; width: 270px" type="number"
									name="formCode" required lay-verify="required"
									placeholder="请输入验证码" autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux"
								style="margin-left: 10px">
								<input type="button" class="layui-btn  layui-btn-primary"
									id="codeBtn" value="点击获取验证码" onclick="sendemail()" />
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" type="submit" lay-submit>修改</button>
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
	<!-- 模态框 -->
	<div id="cashModal" style="display: none;">
		<div class="layui-row">
			<div class="layui-col-md10 layui-col-md-offset1"
				style="margin-top: 10px">
				<form class="layui-form" id="cash_form">
					<input type="hidden" name="technId" id="techn-cash" value="${techn.technicianId}">
					<input type="hidden" name="oldIntegral" value="${techn.technIntegral}">
					<div class="layui-form-item">
						<label class="layui-form-label">提现方式</label>
						<div class="layui-input-block">
							<select name="cashWay" lay-verify="required">
						        <option value="0">---请选择---</option>
						        <option value="微信">微信</option>
						        <option value="支付宝">支付宝</option>
						    </select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">账号</label>
						<div class="layui-input-block">
							<input type="text" name="cashAccount" required lay-verify="required"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">输入积分</label>
						<div class="layui-input-block">
							<input type="text" value="${techn.technIntegral}" name="cashIntegral" id="input_money"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">金额</label>
						<div class="layui-input-block">
							<input type="number" id="integral" name="cashMoney" required lay-verify="required"
								readonly="readonly" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block">
							<button class="layui-btn" type="button" id="confirm-cash">申请提现</button>
						</div>
					</div>
				</form>
				<p style="color: red;">注意：积分的提现，平台收取最终10%的费用！</p>
			</div>
		</div>
	</div>


</body>
<script src="${PATH}/static/layui/layui.all.js"></script>
<script src="${PATH}/static/js/jquery2.0-min.js"></script>
<script type="text/javascript">
	var countdown = 60;
	function sendemail() {
		layui.use('layer', function() {
			var layer = layui.layer;
			var obj = $("#codeBtn");
			var email = $("#changeCustInfoEmail").val();
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
	//提现
	$("#cashBtn").click(function() {
		layui.use([ 'util', 'laydate', 'layer' ], function() {
			var util = layui.util, laydate = layui.laydate, layer = layui.layer;
			layer.open({
				type : 1,//类型
				area : [ '400px', '400px' ],//定义宽和高
				title : '积分提现',//题目
				shadeClose : false,//点击遮罩层关闭
				content : $('#cashModal')
			//打开的内容
			});

		});
	});
	//联动
	$("#input_money").bind('input propertychange', function() {
		var num1 = $(this).val();
		if (isNaN(num1)) { //如果为非数字，结果为空
			$("#integral").val() = "";
		} else { //将第二个输入框设置为美元值乘以汇率的结果
			$("#integral").val(num1 / 100)
		}
	});
	//提现
	$("#confirm-cash").click(function() {
		var id = $("#techn-cash").val();
		var data = $("#cash_form").serialize() ;
		var integral = $("#integral").val();
		var input_money = $("#input_money").val();
		var oldIntegral = $("#oldIntegral").val();
		if(input_money>oldIntegral){
			layui.layer.msg("提现积分超额",{icon:5});
			return ;
		}
		if (integral == "0"||integral=="") {
			layer.msg("请输入积分！")
			return;
		}
		var reg = /^[1-9]\d*$/
		if(!reg.test(integral)){
			layui.layer.msg("请您提现整数金额",{icon:5});
			return ;
		}
		$.ajax({
			url : "${PATH}/cashTechn/cashIntegral",
			method : "post",
			data:data,
			success : function(res) {
				if (res.code == 100) {
					layer.msg(res.extend.msg, {
						icon : 6,
						time : 5000
					}, function() {
						location.reload();
					})
				} else {
					layer.msg(res.extend.msg, {
						icon : 5
					})
				}
			},
			error : function() {
				layer.msg("系统错误！", {
					icon : 5
				})
			}
		});
	});

	$("#showChangeInfo").click(function() {
		$("#oldCustInfo").removeClass("layui-col-md-offset4");
		$("#newCustInfo").removeAttr("hidden");
	})
</script>
</html>