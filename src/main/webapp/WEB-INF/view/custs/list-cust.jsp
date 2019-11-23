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
									<li class="active">所有客户</li>
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
							<form class="layui-form" id="kwCustForm">
								<div class="col-lg-6">
									<div class="layui-form-item">
										<label class="layui-form-label">用户名</label>
										<div class="layui-input-block">
											<input type="text" name="custName"  placeholder="请输入" autocomplete="off"
												class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label range-label">积分</label>
										<div class="layui-input-inline">
											<input type="number" placeholder="请输入" name="min_integral"
												autocomplete="off" class="layui-input">
										</div>
										<div class="layui-form-mid">-</div>
										<div class="layui-input-inline">
											<input type="number" placeholder="请输入" name="max_integral"
												autocomplete="off" class="layui-input">
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="layui-form-item">
										<label class="layui-form-label">邮箱</label>
										<div class="layui-input-block">
											<input type="text" name="custEmail"  placeholder="请输入" autocomplete="off"
												class="layui-input">
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label range-label">日期</label>
										<div class="layui-input-inline">
											<input type="text" id="start_date" placeholder="请选择" name="start_date"
												autocomplete="off" class="layui-input">
										</div>
										<div class="layui-form-mid">-</div>
										<div class="layui-input-inline">
											<input type="text" id="end_date" placeholder="请选择" name="end_date"
												autocomplete="off" class="layui-input">
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
									<h2>客户列表</h2><br>
									<button class="layui-btn layui-btn-danger" type="button" id="delByIds">选中删除</button>
								</div>
								<div class="card-body">
									<table id="custListTb"
										class="table table-responsive table-hover"
										lay-filter="custListTbFilter">

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
	<div style="display: none;" id="detailFeedBlackModal">
		<div class="layui-card">
			<div class="layui-card-body" id="feedText"></div>
		</div>
	</div>
	<div style="display: none;" id="editFeedBlackModal">
		<div class="layui-card">
			<div class="layui-card-body">
				<form id="editFeedBackForm">
					<input type="hidden" name="feedbackId" id="feedBackIdModal" />
					<div class="form-group" id="sortIdSele">
						<label>反馈分类</label> <select name="feedbackSortId"
							id="sortModalSel" class="form-control">
							<option value="0">---请选择---</option>
							<option v-for="item in sort" :value="item.feedbackSortId">{{item.sortName}}</option>
						</select>
					</div>
					<div class="form-group">
						<label>反馈紧急性</label> <select name="feedbackSerious"
							class="form-control">
							<option value="0">普通</option>
							<option value="1">紧急</option>
						</select>
					</div>
					<button type="button" id="editFeedBackBtn" class="btn btn-default">处理</button>
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
			var data = $("#kwCustForm").serializeArray();
			layui.use(['table','util'], function() {
				var table = layui.table
				,util = layui.util;
				//第一个实例
				table.render({
					elem : '#custListTb',
					height : 312,
					url : '${PATH}/cust/getCustList',
					text : {
						none : '未找到顾客'
					},
					id:"custListTbId",
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
						field : 'custId',
						title : '#',
						type:"checkbox",
						align : "center"
					}, {
						field : 'custName',
						title : '用户名',
						align : "center"
					},{
						field : 'custNick',
						title : '昵称',
						align : "center"
					}, {
						field : 'custEmail',
						title : '邮箱',
						align : "center"
					},{
						field : 'custIntegral',
						title : '积分',
						align : "center"
					},{
						field : 'createTime',
						title : '创建时间',
						align : "center"
						,templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
					}/* ,{
						fixed : 'right',
						title : '操作',
						toolbar : '#barDemo',
						align : "center"
					} */]],
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
				table.on('tool(feedBackTBFilter)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

					if (layEvent === 'detail') { //查看
						$("#feedText").html(data.feedbackText);
						var index = layer.open({
							title : '反馈内容',
							fix : true,
							resize : false,
							move : false,
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#detailFeedBlackModal')
						});
					} else if (layEvent === 'solveFeedBack') { //解决
						console.log(data.feedbackSortId)
						if (data.feedbackSortId == 0) {
							layer.msg("请先在“修改”里面选择反馈分类！", {
								icon : 2
							});
							return;
						}
						var id = data.feedbackId;
						layer.confirm('确认已经解决了吗？', function(index) {
							$.ajax({
								url : "${APP_PATH}/feedBack/solveFeedBack?id="
										+ id,
								method : "GET",
								success : function(res) {
									if (res.code == 100) {
										layer.msg(res.extend.msg, {
											icon : 1
										}, function() {
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
						$("#feedBackIdModal").val(data.feedbackId);
						var sortId = data.feedbackSortId
						$("#sortModalSel > option").each(function() {
							var va = $(this).val()
							if (va == sortId) {
								$(this).attr("selected", "selected")
							}
						});
						var index = layer.open({
							title : '反馈内容',
							fix : true,
							resize : false,
							move : false,
							area : [ "600px", "300px" ],
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#editFeedBlackModal')
						});

					} else if (layEvent === 'LAYTABLE_TIPS') {
						layer.alert('Hi，头部工具栏扩展的右侧图标。');
					}
				});
			});
		}
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  //执行一个laydate实例
			  laydate.render({
			    elem: '#start_date' //指定元素,
			    ,eventElem: '#start_date'
			    ,trigger: 'click'
			  });
			  laydate.render({
			    elem: '#end_date' //指定元素,
			    ,eventElem: '#end_date'
			    ,trigger: 'click'
			  });
			});
		//筛选
		$("#kwFormBtn").click(function(){
			renderTb();
		});
		//批量删除
		$("#delByIds").click(function(){
			layui.use(['table','layer'], function() {
				var table = layui.table
				,layer = layui.layer;
				layer.confirm('真的删除行么', function(index){
					var checkStatus = table.checkStatus('custListTbId');
					var datas = checkStatus.data
					var ids = new Array();
					$(datas).each(function(){
						ids.push($(this)[0].custId);
					})
					console.log(ids)
					$.ajax({
						url:"${PATH}/cust/delCustByIds",
						method:"POST",
						contentType: "application/json",//必须指定，否则会报415错误
					    dataType : 'json',
						data:JSON.stringify(ids),
						success:function(res){
							console.log(res)
							if(res.code == 100){
								layer.msg(res.extend.msg,{icon:6},function(){
									renderTb();
								});
							}else{
								layer.msg(res.extend.msg,{icon:5},function(){
									renderTb();
								});
							}
						},error:function(){
							layer.msg("系统错误！",{icon:5},function(){
								renderTb();
							});
						}
					});	
				  layer.close(index);
				});
			});
		})
	</script>
	<script type="text/html" id="barDemo">
<button type="button" class="btn btn-info btn-xs btn-outline" lay-event="detail">查看</button>
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="edit">修改</button>
</script>
</body>

</html>