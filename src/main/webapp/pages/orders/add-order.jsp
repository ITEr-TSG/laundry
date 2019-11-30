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
<title>顾客下单</title>
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
	<script src="${PATH}/static/vue/vue.min.js"></script>
<script src="${PATH}/static/vue/vue-resource.min.js"></script>
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
	<%@ include file="/pages/common/header.jsp"%>
	<div class="layui-container">
		<h3 align="center" style="padding-top: 10px">订单信息</h3>
		<h4 align="center" style="color: red">${itemError}</h4>
		<form class="layui-form cust-info">
			<div class="layui-row">
				<div class="layui-col-md3">
						<div class="layui-form-item">
							<div class="layui-input-block">
								<input type="hidden" name="itemId" value="${itemId}"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">类型</label>
							<div class="layui-input-block">
								<input type="text" name="itemSort" readonly="readonly"
									value="${itemSort}" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">名称</label>
							<div class="layui-input-block">
								<input type="text" name="itemName" readonly="readonly"
									value="${itemName}" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">积分</label>
							<div class="layui-input-block">
								<input type="number" name="price" readonly="readonly"
									value="${orderPrice}" class="layui-input">
							</div>
						</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-form-item">
						<div class="layui-input-block">
							<input type="hidden" name="custId" id="custId" value="${sessionScope.id}"
								class="layui-input">
							<input type="hidden" name="custName" id="custId" value="${sessionScope.name}"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">称呼</label>
						<div class="layui-input-block">
							<input type="text" name="shopper" required  lay-verify="required" placeholder="请输入您的称呼" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">地址</label>
						<div class="layui-input-block">
							<input type="text" name="address" required  lay-verify="required" placeholder="请输入" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">Email</label>
						<div class="layui-input-block">
							<input type="email" name="email" required  lay-verify="required" placeholder="请输入" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">提货时间</label>
						<div class="layui-input-block">
							<input type="text" name="appointTime" id="appointTime" required  lay-verify="required" placeholder="请输入" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">技师</label>
						<div class="layui-input-block">
							<select name="technId" id="selectTechn" lay-verify="">
							  <option value="">---请选择---</option>
							  <option v-for="item in techns" :value="item.technicianId" v-text = 'item.technRealName+" 昵称："+item.technNick'></option>
							</select>   
						</div>
					</div>
					 <div class="layui-form-item">
					    <div class="layui-input-block">
					      <button class="layui-btn" lay-submit lay-filter="addOrder">确认下单</button>
					      <button type="reset" id="reset" class="layui-btn layui-btn-primary">重置</button>
					    </div>
					  </div>
					  
					  
				</div>
				

			</div>
		</form>
		

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
	layui.use(['layer', 'form'], function(){
	  var layer = layui.layer
	  ,form = layui.form;
	  form.on('submit(addOrder)', function(data){
		  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
		  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
		  var form = data.field
		  var reg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		  if(!reg.test(form.email)){
		    	layer.msg("请输入正确的邮箱！",{icon:5});
		    	return;
		  }
		  $.ajax({
			  url:"${PATH}/orders/addOrder",
			  method:"POST",
			  contentType: "application/json",//必须指定，否则会报415错误
		      dataType : 'json',
		      data : JSON.stringify(form),//序列化复杂对象
			  success:function(res){
				  console.log(res)
				  if(res.code == 100 ){
					  layer.msg(res.extend.msg,{icon:6},function(){
						  $("#reset").click();
					  })
				  }else{
					  layer.msg(res.extend.msg,{icon:5})
				  }
			  },error:function(){
				  layer.msg("系统错误！",{icon:5},function(){
					  $("#reset").click();
				  })
			  }
		  });
		  
		  
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
	})
	
	
	//技师选择
	var showDiv = new Vue({
		el:"#selectTechn",
		data:{
			techns:[],
		},created: function () {
			this.$http.get("${PATH}/technician/selectTechn").then(function(response){
				//成功
				this.techns=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
			
		},updated: function () {
            layui.form.render();
	    },
	})
	//判断是否登录
	var custId = $("#custId").val()
	if(custId == ""){
		layui.layer.msg("您还未登录！请您先登录！",{icon:5},function(){
			window.location.href="${PATH}/pages/login.jsp";
		});
	}
	//约定的提货时间
	layui.use(['laydate','layer'], function(){
		  var laydate = layui.laydate,
		  layer = layui.layer;
		  //执行一个laydate实例
		  laydate.render({
		    elem: '#appointTime' //指定元素
		    ,type: 'datetime'
	    	,min: 0
		    ,trigger: 'click'
	    	,done: function(value, date){
	    	      layer.msg('你选择的日期是：' + value);
	    	 }
		  });
		});
	
</script>
</html>