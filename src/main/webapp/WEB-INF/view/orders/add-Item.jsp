<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	pageContext.setAttribute("PATH", request.getContextPath());
  %>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>匠心衣橱后台</title>
<!-- Styles -->
<link
	href="${PATH}/static/assets/fontAwesome/css/fontawesome-all.min.css"
	rel="stylesheet">
<link href="${PATH}/static/assets/css/lib/themify-icons.css"
	rel="stylesheet">
<link href="${PATH}/static/assets/css/lib/mmc-chat.css" rel="stylesheet" />
<link href="${PATH}/static/assets/css/lib/sidebar.css" rel="stylesheet">
<link href="${PATH}/static/assets/css/lib/bootstrap.min.css"
	rel="stylesheet">
<link href="${PATH}/static/assets/css/lib/nixon.css" rel="stylesheet">
<link href="${PATH}/static/assets/lib/lobipanel/css/lobipanel.min.css"
	rel="stylesheet">
<link href="${PATH}/static/assets/css/style.css" rel="stylesheet">
<link href="${PATH}/static/layui/css/layui.css" rel="stylesheet">
<script src="${PATH}/static/vue/vue.min.js"></script>
<script src="${PATH}/static/vue/vue-resource.min.js"></script>
</head>
<style>
form {
	padding: 50px 0px
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
	<!-- 左侧导航 -->
	<%@ include file="/WEB-INF/view/common/leftNav.jsp"%>
	<!-- /# sidebar -->
	<%@ include file="/WEB-INF/view/common/header.jsp"%>

	<!-- END chat Sidebar-->
	<div class="content-wrap">
		<div class="main">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-8 p-0">
						<div class="page-header">
							<div class="page-title">
								<h1>导航</h1>
							</div>
						</div>
					</div>
					<!-- /# column -->
					<div class="col-lg-4 p-0">
						<div class="page-header">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="#">导航</a></li>
									<li class="active">添加订单条目</li>
								</ol>
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>
				<!-- /# row -->
				<div class="main-content">
					<div class="row">
						<div class="card-header">
							<h4>添加条目</h4>
						</div>
						<div class="card" style="height: 450px">
							<form class="layui-form">
								<div class="col-lg-6">
									<div class="layui-form-item">
										<label class="layui-form-label">名称</label>
										<div class="layui-input-block">
											<input type="text" name="itemName" required
												lay-verify="required" placeholder="请输入"
												autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">价格</label>
										<div class="layui-input-block">
											<input type="number" name="itemPrice" required
												lay-verify="required" placeholder="请输入(积分制)"
												autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
									    <label class="layui-form-label">状态</label>
									    <div class="layui-input-block">
									      <select name="itemState" lay-verify="required">
									        <option value="0">---请选择---</option>
									        <option value="展示">展示</option>
									        <option value="隐藏">隐藏</option>
									      </select>
									    </div>
									  </div>
									<div class="layui-form-item">
									    <label class="layui-form-label">分类</label>
									    <div class="layui-input-block">
									      <select name="itemSort" lay-verify="required">
									        <option value="0">---请选择---</option>
									        <option value="单次">单次</option>
									        <option value="包月">包月</option>
									      </select>
									    </div>
									  </div>
									  
								</div>
								<div class="col-lg-6 ">
									<div class="layui-form-item">
										<label class="layui-form-label">描述1</label>
										<div class="layui-input-block">
											<input type="text" name="desc1" required
												lay-verify="required" placeholder="请输入"
												autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">描述2</label>
										<div class="layui-input-block">
											<input type="text" name="desc2"  placeholder="请输入"
												autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">描述3</label>
										<div class="layui-input-block">
											<input type="text" name="desc3"  placeholder="请输入"
												autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">描述4</label>
										<div class="layui-input-block">
											<input type="text" name="desc4"  placeholder="请输入"
												autocomplete="off" class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">描述5</label>
										<div class="layui-input-block">
											<input type="text" name="desc5"  placeholder="请输入"
												autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="*">添加</button>
										<button type="reset" id="resetForm"
											class="layui-btn layui-btn-primary">重置</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- /# row -->
					<!-- /# row -->
				</div>
			</div>
			<!-- /# container-fluid -->
		</div>
		<!-- /# main -->
	</div>
	<!-- /# content wrap -->
	<!-- 查看模态框 -->

	<script src="${PATH}/static/assets/js/lib/jquery.min.js"></script>
	<!-- jquery vendor -->
	<script src="${PATH}/static/assets/js/lib/jquery.nanoscroller.min.js"></script>
	<!-- nano scroller -->
	<script src="${PATH}/static/assets/js/lib/sidebar.js"></script>
	<!-- sidebar -->
	<script src="${PATH}/static/assets/js/lib/bootstrap.min.js"></script>
	<!-- bootstrap -->
	<script src="${PATH}/static/assets/js/lib/mmc-common.js"></script>
	<script src="${PATH}/static/assets/js/scripts.js"></script>
	<script src="${PATH}/static/layui/layui.all.js"></script>
	<!-- scripit init-->
	<script>
layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
  form.on('submit(*)', function(data){
	  $.ajax({
		  url:"${PATH}/orderItem/addOrderItem",
		  method:"POST",
		  contentType: "application/json",//必须指定，否则会报415错误
	      dataType : 'json',
	      data : JSON.stringify(data.field),//序列化复杂对象
		  success:function(res){
			  console.log(res)
			  if(res.code == 100 ){
				  layer.msg(res.extend.msg,{icon:6},function(){
					  $("#resetForm").click();
				  })
			  }else{
				  layer.msg(res.extend.msg,{icon:5},function(){
					  $("#resetForm").click();
				  })
			  }
		  },error:function(){
			  layer.msg("系统错误！",{icon:5},function(){
				  $("#resetForm").click();
			  })
		  }
	  });
	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	});
});
</script>
</body>
</html>