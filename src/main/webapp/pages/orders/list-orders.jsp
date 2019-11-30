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
<title>我的订单</title>
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
		<div class="layui-row">
				
				<div class="layui-col-md12" style="margin-bottom: 150px">
					<h3 align="center" style="padding-top: 10px">订单列表</h3>
					<br>
					<form class="layui-form" id="kwByOrders">
					<input type="hidden" value="${custId}" name="custId"/>
					<input type="hidden" value="${custName}" name="custName"/>
					 <div class="layui-form-item">
					    <label class="layui-form-label">订单号</label>
					    <div class="layui-input-block">
					      <input type="text" name="orderNumber" placeholder="请输入订单号" class="layui-input">
							<button id="kwGetOrdersBtn" style="position: absolute;top: 0;right: 6px;cursor: pointer;" type="button" class="layui-btn">
								<i class="layui-icon layui-icon-search"></i>  
							</button>
					    </div>
					  </div>
					</form>
					<table id="ordersListTb" lay-filter="ordersListTbFilter"></table>
					
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
	<div style="display: none;" id="editOrdersModal">
		<fieldset class="layui-elem-field layui-field-title">
			<legend>订单信息</legend>
			<div class="layui-field-box">
				<form class="layui-form" style="margin: 0 50px">
					<input type="hidden" id="orderIdModal" name="orderId">
					<div class="layui-form-item">
						<label class="layui-form-label">客户</label>
						<div class="layui-input-block">
							<input type="text" name="shopper" id="orderShopperModal" required
								lay-verify="required" placeholder="请输入" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">地址</label>
						<div class="layui-input-block">
							<input type="text" name="address" id="orderAdressModal" required
								lay-verify="required" placeholder="请输入" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">Email</label>
						<div class="layui-input-block">
							<input type="email" name="email" id="orderEmailModal" required
								lay-verify="required" placeholder="请输入" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">技师</label>
						<div class="layui-input-block">
							<select name="technId" id="technSelModal" lay-verify="required">
								<option v-for="item in techns" :value="item.technicianId"
									v-text="item.technRealName+' 昵称 ：'+item.technNick"></option>
							</select>
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
</body>
<script src="${PATH}/static/layui/layui.all.js"></script>
<script src="${PATH}/static/js/jquery2.0-min.js"></script>
<script src="${PATH}/static/wangEditor/release/wangEditor.min.js"></script>
<script type="text/javascript">
$(function() {
	renderTb();
});
function renderTb(){
	layui.use(['table','layer'], function(){
		  var table = layui.table
		  var layer = layui.layer;
		  var data = $("#kwByOrders").serializeArray();
		  //第一个实例
		  table.render({
		     elem: '#ordersListTb'
		    ,height: 312
		    ,url: '${PATH}/orders/getOrdersListByCust' //数据接口
		    ,page: true, //开启分页
		    text : {
				none : '您还下单'
			},
			id:"ordersListTbId",
			skin : 'line' ,
			contentType: "application/json",//必须指定，否则会报415错误
		    dataType : 'json',
			method:"POST",
			unresize:true,
			where : {
				kwdata : data
			},
		    cols: [[ //表头
		      {field: 'custId', title: '#',hide:true,align : "center"}
		      ,{field: 'orderNumber', style:"color: blue;",title: '订单号',align : "center"} 
		      ,{field: 'shopper', style:"color: orange;",title: '顾客',align : "center"} 
		      ,{field: 'email', title: 'Email',align : "center"} 
		      ,{field: 'address', title: '地址',align : "center"}
		      ,{field: 'state',style:"color: red;", title: '状态',align : "center"} 
		      ,{field : 'appointTime',title : '提货时间',sort:true,align : "center",templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
		      ,{fixed : 'right',title : '操作',toolbar : '#barDemo',align : "center"}
		    ]],
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
		  table.on('tool(ordersListTbFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			  var data = obj.data; //获得当前行数据
			  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
			  if(layEvent === 'editOrdersModal'){ //编辑
				  $("#resetFormModal").click();
			  	  if(data.state!="已下单"){
			  		  layui.layer.msg("当前订单不支持修改！",{icon:5});
			  		  return;
			  	  }
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

			  } else if(layEvent === 'over'){
				  if(data.state!="配送中"){
					  layui.layer.msg("当前订单不允许此操作！",{icon:5});
			  		  return;  
				  }
				  $.ajax({
					  url:"${PATH}/orders/editStateByCust/"+data.orderId+"/1",
					  method:"get",
					  success:function(res){
						  if(res.code==100){
							  layer.msg(res.extend.msg,{icon:6},function(){
								  layer.closeAll()
								  renderTb();
							  })
						  }else{
							  layer.msg(res.extend.msg,{icon:5},function(){
								  layer.closeAll()
								  renderTb();
							  })
						  }
					  },error:function(){
						  layer.msg("系统出错！",{icon:5})
					  }
				  });
			  } else if(layEvent === 'evaluate'){
				  if(data.state!="已完成"){
					  layui.layer.msg("当前订单不允许此操作！",{icon:5});
			  		  return;  
				  }
				  /* $.ajax({
					  url:"${PATH}/orders/editStateByCust/"+data.orderId+"/2",
					  method:"get",
					  success:function(res){
						  if(res.code==100){
							  layer.msg(res.extend.msg,{icon:6},function(){
								  layer.closeAll()
								  renderTb();
							  })
						  }else{
							  layer.msg(res.extend.msg,{icon:5},function(){
								  layer.closeAll()
								  renderTb();
							  })
						  }
					  },error:function(){
						  layer.msg("系统出错！",{icon:5})
					  }
				  }); */
			  }else if(layEvent === 'LAYTABLE_TIPS'){
			    layer.alert('Hi，头部工具栏扩展的右侧图标。');
			  }
			});
		  
		});
}
$("#kwGetOrdersBtn").click(function(){
	renderTb();
});
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
</script>
<script type="text/html" id="barDemo">
<div align="center">
<button type="button" class="btn btn-info  layui-btn-xs" lay-event="over">完成</button>
<button type="button" class="btn layui-btn-warm layui-btn-xs" lay-event="editOrdersModal">修改</button>
<button type="button" class="btn layui-btn-normal layui-btn-xs" lay-event="evaluate">评价</button>
</div>
</script>
</html>