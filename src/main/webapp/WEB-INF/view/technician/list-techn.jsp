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
									<li class="active">所有技师</li>
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
							<form class="layui-form" id="kwTechnForm">
								<div class="col-lg-6">
									<div class="layui-form-item">
										<label class="layui-form-label">用户名</label>
										<div class="layui-input-block">
											<input type="text" name="name"  placeholder="请输入" autocomplete="off"
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
									 <div class="layui-form-item">
									    <label class="layui-form-label">状态</label>
									    <div class="layui-input-block">
									      <select name="technState">
									        <option value="0">---请选择---</option>
									        <option value="已通过">已通过</option>
									        <option value="待审核">待审核</option>
									        <option value="已驳回">已驳回</option>
									      </select>
									    </div>
									  </div>
								</div>
								<div class="col-lg-6">
									<div class="layui-form-item">
										<label class="layui-form-label">邮箱</label>
										<div class="layui-input-block">
											<input type="text" name="email"  placeholder="请输入" autocomplete="off"
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
								<div class="col-lg-12">
								<div class="layui-form-item">
								    <label class="layui-form-label">分类</label>
								    <div class="layui-input-block" id="getAllSort">
								      <input v-for="item in sorts" type="checkbox" name="sortId" :value="item.technSortId" :title="item.sortName">
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
									<h2>技师列表</h2><br>
									<button class="layui-btn layui-btn-normal" type="button" id="passByIds">一键通过</button>
									<button class="layui-btn layui-btn-warm" type="button" id="rejectByIds">一键驳回</button>
									<button class="layui-btn layui-btn-danger" type="button" id="delByIds">选中删除</button>
								</div>
								<div class="card-body">
									<table id="technListTb"
										class="table table-responsive table-hover"
										lay-filter="technListTbFilter">

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
	<div style="display: none;" id="detailTechnModal" align="center">
		<div class="layui-card">
			<div class="layui-card-body">
				<h4>技师电话：</h4>
				<div id="technPhon"></div>
			</div>
			<div class="layui-card-body" >
				<h4>技师昵称：</h4>
				<div id="technNick"></div>
			</div>
			<div class="layui-card-body">
				<h4>技师留言：</h4>
				<div id="technText"></div>
			</div>
			<div class="layui-card-body">
				<h4>技师所属分类：</h4>
				<div id="showSortNmae"></div>
			</div>
			<div class="thumbnail"  style="width: 205px;height: 320px">
                   <p>技师照片</p>
               <img id="technImg"  style="width: 200px;height: 283px" alt="照片" style="width:100%">
            </div>
		</div>
	</div>
	<div style="display: none;" id="sortTechnModal">
		<div class="layui-card">
			<div class="layui-card-body">
				<form class="layui-form" id="midSortTechnForm">
					<input type="hidden" id="technIdModal" name="technId"/>
					 <div class="layui-form-item">
					    <label class="layui-form-label">复选框</label>
					    <div class="layui-input-block" id="getAllSortModal">
					      <input v-for="item in sorts" type="checkbox" name="sortIds" :value="item.technSortId" :title="item.sortName">
					    </div>
					  </div>
				  <div class="layui-form-item">
				    <div class="layui-input-block">
				      <button class="layui-btn" type="button" id="addSortTechnBtn">立即提交</button>
				      <button type="reset" id="changeSortReset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
				  </div>
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
			var data = $("#kwTechnForm").serializeArray();
			layui.use(['table','util'], function() {
				var table = layui.table
				,util = layui.util;
				//第一个实例
				table.render({
					elem : '#technListTb',
					height : 312,
					url : '${PATH}/technician/getTechnList',
					text : {
						none : '未找到技师'
					},
					id:"technListTbId",
					skin : 'line' ,
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
						field : 'technicianId',
						title : '#',
						type:"checkbox",
						align : "center"
					}, {
						field : 'technRealName',
						title : '真实姓名',
						align : "center"
					},{
						field : 'technEmail',
						title : '邮箱',
						align : "center"
					},{
						field : 'technPhone',
						title : '电话',
						align : "center"
					},{
						field : 'technIntegral',
						title : '积分',
						align : "center"
					},{
						field : 'technState',
						title : '状态',
						style:"color: orange;",
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
				table.on('tool(technListTbFilter)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

					if (layEvent === 'detail') { //查看
						$("#technText").html(data.technRemarks);
						$("#technNick").html(data.technNick);
						$("#technPhon").html(data.technPhone);
						$("#technImg").attr("src",data.technPhoto);
						$.ajax({
							url:"${PATH}/technMidSort/getSortNameByTechnId/"+data.technicianId,
							method:"get",
							success:function(res){
								$("#showSortNmae").html(res.extend.sort);
							}
						})
						var index = layer.open({
							title : '详细信息',
							fix : true,
							resize : false,
							move : false,
							area: ['600px','620px'],
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#detailTechnModal')
						});
					} else if(layEvent === 'sort'){
						var id=data.technicianId
						$("#technIdModal").val(id);
						$("#changeSortReset").click();
						var index = layer.open({
							title : '修改分类 ( 注意：格式化修改！)',
							fix : true,
							resize : false,
							move : false,
							area: ['600px','300px'],
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#sortTechnModal')
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
					var checkStatus = table.checkStatus('technListTbId');
					var datas = checkStatus.data
					var ids = new Array();
					$(datas).each(function(){
						ids.push($(this)[0].technicianId);
					})
					if(ids.length==0){
						layer.msg("请选择要删除的数据！",{icon:5});
						return;
					}
					$.ajax({
						url:"${PATH}/technician/delTechnByIds",
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
		//批量通过
		$("#passByIds").click(function(){
			layui.use(['table','layer'], function() {
				var table = layui.table
				,layer = layui.layer;
				layer.confirm('真的通过行么', function(index){
					var checkStatus = table.checkStatus('technListTbId');
					var datas = checkStatus.data
					var ids = new Array();
					$(datas).each(function(){
						ids.push($(this)[0].technicianId);
					})
					if(ids.length==0){
						layer.msg("请选择要通过的数据！",{icon:5});
						return;
					}
					$.ajax({
						url:"${PATH}/technician/passTechnByIds",
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
		//批量驳回
		$("#rejectByIds").click(function(){
			layui.use(['table','layer'], function() {
				var table = layui.table
				,layer = layui.layer;
				layer.confirm('真的驳回行么', function(index){
					var checkStatus = table.checkStatus('technListTbId');
					var datas = checkStatus.data
					var ids = new Array();
					$(datas).each(function(){
						ids.push($(this)[0].technicianId);
					})
					if(ids.length==0){
						layer.msg("请选择要驳回的数据！",{icon:5});
						return;
					}
					$.ajax({
						url:"${PATH}/technician/rejectTechnByIds",
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
		
		
		
		//得到所有的分类
		var getAllSort = new Vue({
		el:"#getAllSort",
		data:{
			sorts:[]
		},
		created: function () {
			this.$http.get("${PATH}/technSort/getSorts").then(function(response){
				console.log(response.body)
				//成功
				this.sorts=response.body;
			},function(response) {
				//错误
				console.log("查询反馈分类时，出现系统错误！")
			});
		},updated: function () {
            layui.form.render();
      },
	});
		//模态框内
		var getAllSortModal = new Vue({
		el:"#getAllSortModal",
		data:{
			sorts:[]
		},
		created: function () {
			this.$http.get("${PATH}/technSort/getSorts").then(function(response){
				//成功
				this.sorts=response.body;
			},function(response) {
				//错误
				console.log("查询反馈分类时，出现系统错误！")
			});
		},updated: function () {
            layui.form.render();
      },
	});
		
	$("#addSortTechnBtn").click(function(){
		var data = $("#midSortTechnForm").serialize();
		layui.use('layer', function() {
			var layer = layui.layer;
			$.ajax({
				url:"${PATH}/technMidSort/updateMid",				
				method:"POST",
				data:data,
				success:function(res){
					if(res.code==100){
						layer.msg(res.extend.msg,{icon:6},function(){
							layer.closeAll();
						});
					}else{
						layer.msg(res.extend.msg,{icon:5});
					}
				},error:function(){
					layer.msg("系统错误！",{icon:5});
				}
			});
		})		
	});
	</script>
<script type="text/html" id="barDemo">
<div align="center">
<button type="button" class="btn btn-info btn-xs btn-outline" lay-event="detail">查看</button>
<button type="button" class="btn btn-pink btn-xs btn-outline" lay-event="sort">分类</button>
</div>
</script>
</body>

</html>