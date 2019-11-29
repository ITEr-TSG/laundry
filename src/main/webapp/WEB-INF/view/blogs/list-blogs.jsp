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
									<li class="active">所有博客</li>
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
								<div class="layui-form-item">
									<div class="layui-input-block">
										<textarea id="blogText" placeholder="请输入文章内容" class="layui-textarea"></textarea>
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
									<h2>博客列表</h2><br>
								</div>
								<div class="card-body">
									<table id="blogsListTb"
										class="table table-responsive table-hover"
										lay-filter="blogsListTbFilter">

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
	<!-- 模态框 -->	
<div style="display: none;" id="detailBlogModal">
	<fieldset class="layui-elem-field" >
	  <legend>文章</legend>
	  <div class="layui-field-box" id="detailBlogtitle">
	  </div>
	  <div class="layui-field-box" id="detailBlogDiv">
	  </div>
	</fieldset>
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
			var text = $("#blogText").val();
			layui.use(['table','util'], function() {
				var table = layui.table
				,util = layui.util;
				//第一个实例
				table.render({
					elem : '#blogsListTb',
					height : 312,
					url : '${PATH}/blogs/getBlogsList',
					text : {
						none : '未找到博客'
					},
					id:"blogsListTbId",
					skin : 'line' ,
					size : 'lg',
					contentType: "application/json",//必须指定，否则会报415错误
				    dataType : 'json',
					method:"POST",
					page : true //开启分页
					,
					where : {
						kwdata : text
					},
					cols : [ [ //表头
					{
						field : 'blogId',
						title : '#',
						hide:true,
						align : "center"
					}, {
						field : 'blogTitle',
						title : '标题',
						align : "center"
					},{
						field : 'isShow',
						title : '状态',
						align : "center"
					}, {
						field : 'praiseInt',
						title : '点赞量',
						align : "center"
					},{
						field : 'createTime',
						title : '创建时间',
						align : "center"
						,templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
					},{
						fixed : 'right',
						title : '操作',
						toolbar : '#barDemo',
						align : "center"
					} ]],
					parseData : function(res) { //res 即为原始返回的数据
						return {
							"code" : res.status, //解析接口状态
							"msg" : res.message, //解析提示文本
							"count" : res.total, //解析数据长度
							"data" : res.data
						//解析数据列表
						};
					}
				});
				table.on('tool(blogsListTbFilter)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

					if (layEvent === 'detail') { //查看
						 $("#detailBlogDiv").html(data.blogText);
						  $("#detailBlogtitle").html(data.blogTitle);
						  var index = layer.open({
								title : '查看博文',
								fix : true,
								resize : false,
								move : false,
								area: ['800px','500px'],
								zIndex : 500,
								shadeClose : true,
								shade : 0.4,
								type : 1,
								content : $('#detailBlogModal')
							});
					} else if (layEvent === 'del') { //解决
						 layer.confirm('真的删除行么', function(index){
						      obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
						      layer.close(index);
						      var id = data.blogId
						      $.ajax({
								url:"${PATH}/blogs/delByAdmin/"+id,	
								method:"get",
								success:function(res){
									if(res.code==100){
										layer.msg(res.extend.msg,{icon:6})
									}else{
										layer.msg(res.extend.msg,{icon:5})
									}
								},error:function(){
									layer.msg("系统错误！",{icon:5})
								}
						      });
						    });
					}  else if(layEvent === 'LAYTABLE_TIPS') {
						layer.alert('Hi，头部工具栏扩展的右侧图标。');
					}
				});
			});
		}
		
		//筛选
		$("#kwFormBtn").click(function(){
			renderTb();
		});
	</script>
	<script type="text/html" id="barDemo">
<div align = "center">
<button type="button" class="btn btn-info btn-xs btn-outline" lay-event="detail">查看</button>
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="del">删除</button>
</div>
</script>
</body>

</html>