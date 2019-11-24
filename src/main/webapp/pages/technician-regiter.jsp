<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
%>
<head>
<meta charset="UTF-8">
<title>技师注册</title>
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
					<li class="layui-nav-item  mr-3">
					<a href="${PATH}/pages/cust-regiter.jsp">注册客户</a>
					</li>
					<li class="layui-nav-item  mr-3">
						<a href="${PATH}/pages/login.jsp">登录</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="layui-container">
		<div class="layui-row">
			<h1 align="center">技师注册</h1>
			<h4 align="center" style="color: red">${sessionScope.error}</h4>
			<br>
			<div class="layui-form-item">
			    <label class="layui-form-label">图片</label>
			    <div class="layui-input-block">
			       <div class="layui-upload">
					  <button type="button" class="layui-btn" id="uploadFoodImg">选择图片</button>
					  <div class="layui-upload-list">
					    <img class="layui-upload-img" style="width: 100px;height: 141px;" id="previewImg">
					    <p id="demoText"></p>
					  </div>
					</div>
			    </div>
			  </div>
			<form class="layui-form" id="regiter_techn_form">
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<label class="layui-form-label">昵称</label>
						<div class="layui-input-block">
							<input type="text" name="technNick" required lay-verify="required"
								placeholder="请输入登录名" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">电话号码</label>
						<div class="layui-input-block">
							<input type="number" name="technPhone" required
								lay-verify="required" placeholder="请输入电话号码" autocomplete="off"
								class="layui-input">
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
				</div>
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<label class="layui-form-label">真实姓名</label>
						<div class="layui-input-block">
							<input type="text" name="technRealName" required lay-verify="required"
								placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">邮箱</label>
						<div class="layui-input-block">
							<input type="text" name="technEmail"
								lay-verify="email" placeholder="请输入邮箱" id="regiterEmailInput"
								autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">验证码</label>
						<div class="layui-input-inline">
							<input style="margin-left: 10px" type="number"
								name="formCode" required lay-verify="required"
								placeholder="请输入验证码" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-word-aux">
							<input type="button" class="layui-btn  layui-btn-primary"
								id="codeBtn" value="获取验证码" onclick="sendemail()" />
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">备注</label>
						<div class="layui-input-block">
							<textarea name="technRemarks" lay-verify="required" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
					<input type="hidden" name="technPhoto" id="technician_img">
					
					<div class="layui-col-md6"></div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="*" type="button" id="regiter_techn" >申请注册</button>
						<button type="reset" id="resetBtn" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
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
		    			layer.msg(res.extend.msg,{icon:6});
		    		}else{
		    			layer.msg(res.extend.msg,{icon:5});
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
	layui.use(['upload','layer','form'], function(){
		 var $ = layui.jquery
		 ,upload = layui.upload
		 ,layer = layui.layer
		 ,form = layui.form;
		 var uploadInst = upload.render({
		    elem: '#uploadFoodImg'
		    ,url: '${PATH}/technician/uploadNewFoodImg'
		    ,accept:"images"	//指定允许上传时校验的文件类型
		    ,exts:'jpg|png|gif|bmp|jpeg'
		    ,acceptMime:'image/*' //规定打开文件选择框时，筛选出的文件类型
		    ,size:1024	//设置文件最大可允许上传的大小，单位 KB。
		    ,field:"file"
		    ,before: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#previewImg').attr('src', result); //图片链接（base64）
		      });
		    }
		    ,done: function(res){
		      //如果上传失败
		      if(res.code > 0){
		        return layer.msg(res.msg,{icon:6});
		      }
		      //上传成功
		      console.log(res.data)
		      $("#technician_img").val(res.data);
		      return layer.msg(res.msg,{icon:6});
		      
		    }
		    ,error: function(){
		      //演示失败状态，并实现重传
		      var demoText = $('#demoText');
		      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
		      demoText.find('.demo-reload').on('click', function(){
		        uploadInst.upload();
		      });
		    }
		  });
	})
	$("#regiter_techn").click(function(){
		var dataForm = $("#regiter_techn_form").serialize();
		layui.use(['layer','form'], function(){
			 var layer = layui.layer;
			 var form = layui.form;
			 var img = $("#technician_img").val();
			 if(img == ""){
				layer.msg("请选择图片！",{icon:5})	
				return;
		 	 }
			 form.verify({
				  email: function(value, item){ //value：表单的值、item：表单的DOM对象
					  console.log("email"+value)
					  if(!new RegExp("^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$").test(value)){
				      return '邮箱格式不对！';
				    }
				  }
				}); 
			 form.on('submit(*)', function(data){
				 $.ajax({
					 url :"${PATH}/technician/regiter",
					 method:"POST",
					 data:dataForm,
					 success:function(res){
						 if(res.code==100){
							 layer.msg(res.extend.msg,{icon:6},function(){
								 $("#resetBtn").click();
							 })
						 }else{
							 layer.msg(res.extend.msg,{icon:5}) 
						 }
					 },error:function(){
						 layer.msg("系统错误！",{icon:5})
					 }
				 });
				  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			});
		})
	});
	
</script>
</html>