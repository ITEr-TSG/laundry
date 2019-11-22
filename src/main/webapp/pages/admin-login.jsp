<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
  %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>后台登录</title>
	
	<!-- Styles -->
    <link href="${APP_PATH}/static/assets/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/nixon.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/style.css" rel="stylesheet">
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery2.0-min.js"></script>    
</head>

<body class="bg-primary">

	<div class="Nixon-login">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-lg-offset-3">
					<div class="login-content">
						<div class="login-logo">
							<a href="#"><span>匠心衣橱后台系统</span></a>
						</div>
						<div class="login-form">
							<h4>管理员登录</h4>
							<form action="${APP_PATH}/admin/loginInto" method="POST"> 
								<div class="form-group">
									<label>用户名</label>
									<input type="text" name="adminName" class="form-control" placeholder="请输入登录名">
								</div>
								<div class="form-group">
									<label>密码</label>
									<input type="password" name="adminPassword" class="form-control" placeholder="请输入密码">
								</div>
								<div class="checkbox">
									<label>
										<input type="checkbox"> 记住我
									</label>
									<label class="pull-right" style="color: orange;">
										${sessionScope.msg}
									</label>
								</div>
								<button type="submit" id="loginBtn" class="btn btn-primary btn-flat m-b-30 m-t-30">登录</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript" src="${APP_PATH}/static/layer/layer.js"></script> 
<script language="javascript">
      //防止页面后退
      history.pushState(null, null, document.URL);
      window.addEventListener('popstate', function () {
          history.pushState(null, null, document.URL);
      });
</script>
</html>