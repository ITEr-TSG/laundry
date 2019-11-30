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
									<li class="active">包月订单</li>
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
							<form class="layui-form" id="kwItemsForm">
								<div class="col-lg-6">
									<div class="layui-form-item">
										<label class="layui-form-label range-label">关键字</label>
										<div class="layui-input-block">
											<input name="kwText" placeholder="请输入" class="layui-input"></input>
										</div>
									</div>
									<div class="layui-form-item">
									    <label class="layui-form-label">条目</label>
									    <div class="layui-input-block">
									      <select name="itemId" id="itemIdSel" >
									        <option  value="0" >---请选择---</option>
									      	<option v-for="item in items" :value="item.itemId" v-text = 'item.itemName'></option>
									      </select>
									    </div>
									  </div>
								</div>
								<div class="col-lg-6">
									<div class="layui-form-item">
										<label class="layui-form-label range-label" style="width: 100px">提货日期</label>
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
									<div class="layui-form-item"  hidden="hidden">
									    <label class="layui-form-label">状态</label>
									    <div class="layui-input-block">
									      <select name="state">
									        <option value="0">---请选择---</option>
									        <option value="已下单">已下单</option>
									        <option value="提货中">提货中</option>
									        <option value="已提货">已提货</option>
									        <option value="服务中">服务中</option>
									        <option value="服务完">服务完</option>
									        <option value="配送中">配送中</option>
									        <option value="已收货">已收货</option>
									        <option value="已完成">已完成</option>
									      </select>
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
									<h2>包月订单</h2><br>
									<button class="layui-btn layui-btn-danger" type="button" id="delByIds">选中删除</button>
								</div>
								<div class="card-body">
									<table id="generalOrdersListTb"
										class="table table-responsive table-hover"
										lay-filter="generalOrdersListTbFilter">

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
	<div style="display: none;" id="editOrdersModal">
			<fieldset class="layui-elem-field layui-field-title">
			  <legend>订单信息</legend>
			  <div class="layui-field-box">
			  		<form class="layui-form" style="margin: 0 50px">
			  		    <input type="hidden" id="orderIdModal" name="orderId">
			  		    <div class="layui-form-item">
								 <label class="layui-form-label">技师</label>
								    <div class="layui-input-block">
								      <select name="technId" id="technSelModal" lay-verify="required">
								        <option v-for="item in techns" :value="item.technicianId" v-text = 'item.technRealName'></option>
								      </select>
								    </div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">客户</label>
								<div class="layui-input-block">
									<input type="text" name="shopper" id="orderShopperModal" required
										lay-verify="required" placeholder="请输入"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">地址</label>
								<div class="layui-input-block">
									<input type="text" name="address" id="orderAdressModal" required
										lay-verify="required" placeholder="请输入"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label">Email</label>
								<div class="layui-input-block">
									<input type="email" name="email" id="orderEmailModal" required
										lay-verify="required" placeholder="请输入"
										autocomplete="off" class="layui-input">
								</div>
							</div>
							
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="*">修改</button>
								<button type="reset" id="resetFormModal"
									class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
			  
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
			var data = $("#kwItemsForm").serializeArray();
			layui.use(['table','util'], function() {
				var table = layui.table
				,util = layui.util;
				//第一个实例
				table.render({
					elem : '#generalOrdersListTb',
					height : 312,
					url : '${PATH}/orders/getMonthOrderList',
					text : {
						none : '未找到订单'
					},
					id:"generalOrdersListTbId",
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
						field : 'orderId',
						title : '#',
						type:"checkbox",
						align : "center"
					}, {
						field : 'orderNumber',
						title : '订单号',
						align : "center"
					},{
						field : 'custName',
						title : '下单人',
						align : "center"
					},{
						field : 'technName',
						title : '技师',
						style:"color: blue;",
						align : "center"
					},{
						field : 'shopper',
						title : '客户',
						align : "center"
					},{
						field : 'address',
						align : "center",
						title : '地址',
					},{
						field : 'email',
						align : "center",
						title : 'Email',
					},{
						field : 'overTime',
						align : "center",
						style:"color: orange;",
						title : '到期时间',
						templet:"<div>{{layui.util.toDateString(d.overTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
					},{
						field : 'itemName',
						align : "center",
						title : '类型',
					},{
						field : 'appointTime',
						title : '约定时间',
						style:"color: red;",
						sort:true,
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
				table.on('tool(generalOrdersListTbFilter)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
					if (layEvent === 'detail') { //查看
						$.ajax({
							url:"${PATH}/orders/expireOrder/"+data.orderId,
							method:"get",
							success:function(res){
								if(res.code==100){
									layui.layer.msg(res.extend.msg,{icon:6},function(){
										renderTb();
									});
								}else{
									layui.layer.msg(res.extend.msg,{icon:5});
								}
							},error:function(){
								layer.msg("系统错误！",{icon:5});
							}
						});
						
					} else if (layEvent === 'edit') { //编辑
						$("#resetFormModal").click();
						$("#orderIdModal").val(data.orderId)
						$("#orderShopperModal").val(data.shopper)
						$("#orderAdressModal").val(data.address)
						$("#orderEmailModal").val(data.email)
						$("#technSelModal> option").each(function(){
							var va = $(this).val()
							if (va == data.technId) {
								$(this).attr("selected", "selected")
							}
							
						});
						layui.form.render('select');
						var index = layer.open({
							title : '修改订单信息',
							fix : true,
							resize : false,
							move : false,
							area : [ "800px", "500px" ],
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							anim:1,
							content : $('#editOrdersModal')
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
					var checkStatus = table.checkStatus('generalOrdersListTbId');
					var datas = checkStatus.data
					var ids = new Array();
					$(datas).each(function(){
						ids.push($(this)[0].orderId);
					})
					$.ajax({
						url:"${PATH}/orders/delOrdersByIds",
						method:"POST",
						contentType: "application/json",//必须指定，否则会报415错误
					    dataType : 'json',
						data:JSON.stringify(ids),
						success:function(res){
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
		
		layui.use(['layer', 'form'], function(){
			  var layer = layui.layer
			  ,form = layui.form;
			  form.on('submit(*)', function(data){
				  $.ajax({
					  url:"${PATH}/orders/editOrder",
					  method:"POST",
					  contentType: "application/json",//必须指定，否则会报415错误
				      dataType : 'json',
				      data : JSON.stringify(data.field),//序列化复杂对象
					  success:function(res){
						  console.log(res)
						  if(res.code == 100 ){
							  layer.msg(res.extend.msg,{icon:6},function(){
								  layer.closeAll()
								  renderTb();
							  })
						  }else{
							  layer.msg(res.extend.msg,{icon:5})
						  }
					  },error:function(){
						  layer.msg("系统错误！",{icon:5},function(){
							  layer.closeAll()
							  renderTb();
						  })
					  }
				  });
				  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
				});
			});
	//得到所有的条目
	var itemIdSel = new Vue({
		el:"#itemIdSel",
		data:{
			items:[]
		},created: function () {
			this.$http.get("${PATH}/orderItem/getMonthItems").then(function(response){
				console.log(response.body)
				//成功
				this.items=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		},updated: function () {
            layui.form.render();
	    }
	});
	//得到所有的技师
	var technSelModal = new Vue({
		el:"#technSelModal",
		data:{
			techns:[]
		},created: function () {
			this.$http.get("${PATH}/technician/getTechnByShow").then(function(response){
				//成功
				this.techns=response.body;
			},function(response) {
				//错误
				console.log("系统错误！")
			});
		},updated: function () {
            layui.form.render();
	    }
	});
	
	</script>
	<script type="text/html" id="barDemo">
<div align="center">
<button type="button" class="btn btn-info btn-xs btn-outline" lay-event="detail">到期</button>
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="edit">修改</button>
</div>
</script>
</body>

</html>