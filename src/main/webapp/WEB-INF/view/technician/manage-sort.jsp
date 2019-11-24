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
.range-label{
	margin-right: 30px
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
									<li class="active">技师分类管理</li>
								</ol>
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>
				<!-- /# row -->
				<div class="main-content">
					<div class="row">
						<div class="card">
							<form class="layui-form">
								<div class="col-lg-6">
									<div class="layui-form-item">
										<label class="layui-form-label" style="width: 100px;">分类名称</label>
										<div class="layui-input-block">
											<input type="text" id="kwSortNmae" placeholder="请输入" autocomplete="off"
												class="layui-input">
										</div>
									</div>
								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" type="button" id="kwFormBtn">筛选</button>
										<button type="reset" class="layui-btn layui-btn-primary">重置</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-header">
									<h2>分类列表</h2><br>
									<div class="input-group input-group-default" style="width:400px">
                                        <input type="text" placeholder="输入名称" id="sortNmaeInput" class="form-control">
                                    	<span class="input-group-btn"><button class="btn btn-primary" id="addSortBtn" type="button"><i class="ti-plus"></i></button></span>
                                    </div>
								</div>
								<div class="card-body">
									<table id="technSortListTb"
										class="table table-responsive table-hover"
										lay-filter="technSortListTbFilter">

									</table>
								</div>
							</div>
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
	<div style="display: none;" id="editSortModal">
		<div class="layui-card">
			<div class="layui-card-body">
				<form id="editSortForm">
					<input type="hidden" name="technSortId" id="technSortIdModal" />
					<div class="form-group">
                        <label>分类名称</label>
                        <input type="text" name="sortName" id="technSortNameModal" class="form-control">
                    </div>
					<div class="form-group">
                        <label>权重</label>
                        <input type="number" name="sortWeight" id="technSortWeightModal" class="form-control">
                    </div>
					<button type="button" id="editSortBtn" class="btn btn-default">处理</button>
				</form>
			</div>
		</div>
	</div>

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
		$(function() {
			renderTb();
		});
		function renderTb() {
			var data = $("#kwSortNmae").val();
			layui.use(['table','util'], function() {
				var table = layui.table
				,util = layui.util;
				//第一个实例
				table.render({
					elem : '#technSortListTb',
					height : 312,
					url : '${PATH}/technSort/getTechnSortList',
					text : {
						none : '未找到分类'
					},
					skin : 'line' ,
					size : 'lg',
					contentType: "application/json",//必须指定，否则会报415错误
				    dataType : 'json',
					method:"POST",
					page : true //开启分页
					,
					where : {
						kwdata : data
					},
					cols : [ [ //表头
					{
						field : 'technSortId',
						title : '#',
						hide:true,
						align : "center"
					}, {
						field : 'sortName',
						title : '分类名称',
						align : "center",
						edit:"text"
					},{
						field : 'sortWeight',
						title : '分类权重',
						align : "center"
					},{
						title : '操作',
						toolbar : '#barDemo',
						align : "center"
					}]],
					parseData : function(res) { //res 即为原始返回的数据
						console.log(res)
						return {
							"code" : res.status, //解析接口状态
							"msg" : res.message, //解析提示文本
							"count" : res.total, //解析数据长度
							"data" : res.data
						//解析数据列表
						};
					}
				});
				table.on('tool(technSortListTbFilter)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
					if (layEvent === 'del') { //解决
						var id = data.technSortId;
						layer.confirm('确认删除吗？', function(index) {
							$.ajax({
								url : "${PATH}/technSort/delById/"+ id,
								method : "GET",
								success : function(res) {
									if (res.code == 100) {
										layer.msg(res.extend.msg, {icon : 1}, function() {
											renderTb();
										});
									}else{
										layer.msg(res.extend.msg, {icon : 2}, function() {
											renderTb();
										});
									}
								},
								error : function() {
									layer.msg("确认解决失败！系统出错！", {
										icon : 2
									});
								}
							});
							layer.close(index);
						});
					} else if (layEvent === 'edit') { //编辑
						$("#technSortIdModal").val(data.technSortId);
						$("#technSortNameModal").val(data.sortName);
						$("#technSortWeightModal").val(data.sortWeight);
						var index = layer.open({
							title : '修改分类',
							fix : true,
							resize : false,
							move : false,
							area : [ "600px", "300px" ],
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#editSortModal')
						});

					} else if (layEvent === 'LAYTABLE_TIPS') {
						layer.alert('Hi，头部工具栏扩展的右侧图标。');
					}
				});
			});
		}
		//筛选
		$("#kwFormBtn").click(function(){
			renderTb();
		});
		//添加
		$("#addSortBtn").click(function(){
			var name = $("#sortNmaeInput").val();
			layui.use('layer', function() {
				var layer = layui.layer;
				$.ajax({
					url:"${PATH}/technSort/addSort/"+name,
					method:"get",
					success:function(res){
						if(res.code==100){
							layer.msg(res.extend.msg,{icon:6},function(){
								renderTb();
							})
						}else{
							layer.msg(res.extend.msg,{icon:5},function(){
								$("#sortNmaeInput").val("");
								renderTb();
							})
						}
					},error:function(){
						layer.msg("系统错误！",{icon:5})						
					}
				});
			});
		});
		
		$("#editSortBtn").click(function(){
			var data = $("#editSortForm").serialize();
			layui.use('layer', function() {
				var layer = layui.layer;
				$.ajax({
					url:"${PATH}/technSort/editSort",					
					method:"post",
					data:data,
					success:function(res){
						if(res.code==100){
							layer.msg(res.extend.msg,{icon:6},function(){
								layer.closeAll();
								renderTb();
							})
						}else{
							layer.msg(res.extend.msg,{icon:5},function(){
								layer.closeAll();
								renderTb();
							})
						}
					},error:function(){
						layer.msg("系统错误！",{icon:5})						
					}
					
				});				
			})
		});
		
	</script>
<script type="text/html" id="barDemo">
<div align="center"	>
<button type="button" class="btn btn-warning btn-outline" lay-event="edit">修改</button>
<button type="button" class="btn btn-info  btn-outline" lay-event="del">删除</button>
</div>
</script>
</body>

</html>