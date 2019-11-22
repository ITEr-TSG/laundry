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
    <title>项遇您后台主页</title>
    <!-- Styles -->
    <link href="${APP_PATH}/static/assets/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="${APP_PATH}/static/assets/css/lib/sidebar.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/nixon.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/lib/lobipanel/css/lobipanel.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/style.css" rel="stylesheet">
    <link href="${APP_PATH}/static/layui/css/layui.css" rel="stylesheet">
    <script src="${APP_PATH}/static/vue/vue.min.js"></script>
    <script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
</head>

<body>
    <!-- 左侧导航 -->
    <%@ include file="/WEB-INF/view/common/leftNav.jsp" %>
    <!-- /# sidebar -->
    <%@ include file="/WEB-INF/view/common/header.jsp" %>
    
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
                                    <li class="active">主页</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="main-content">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="stat-widget-two">
                                    <div class="widget-icon color-1">
                                        <i class="fas fa-bullseye"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="stat-text">Today Expenses </div>
                                        <div class="stat-digit"> <i class="fa fa-dollar-sign"></i>8500</div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /# column -->
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="stat-widget-two">
                                    <div class="widget-icon color-2">
                                        <i class="fas fa-credit-card"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="stat-text">Income Detail</div>
                                        <div class="stat-digit"> <i class="fa fa-dollar-sign"></i>7800</div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /# column -->
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="stat-widget-two">
                                    <div class="widget-icon color-3">
                                        <i class="fas fa-tasks"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="stat-text">Task Completed</div>
                                        <div class="stat-digit"> 500</div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /# column -->
                        <div class="col-lg-3">
                            <div class="card">
                                <div class="stat-widget-two">
                                    <div class="widget-icon color-4">
                                        <i class="fas fa-users"></i>
                                    </div>
                                    <div class="stat-content">
                                        <div class="stat-text">Today Visitor</div>
                                        <div class="stat-digit"> 650</div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: 65%;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /# column -->
                    </div>
                    <div class="row">
                    	<div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>反馈信息</h4>
									<div class="card-header-right-icon">
										<ul>
											<li class="card-close" id="lookTBIcon"><i class="ti-email"></i></li>
											<li class="card-option" id="reloadTBIcon"><i class="ti-loop" aria-haspopup="true" aria-expanded="true" role="link"></i>
											</li>
											 
										</ul>
									</div>
                                </div>
                                <div class="card-body">
                                    <table id="feedBackTb" class="table table-responsive table-hover" lay-filter="feedBackTBFilter">
                                        
                                    </table>
                                </div>
							</div>
                        </div>
                    </div>
                    
                    
                    <!-- /# row -->
         <!-- /# row -->     </div>
 </div>
 <!-- /# container-fluid -->
</div>
<!-- /# main -->
</div>
<!-- /# content wrap -->
<!-- 查看模态框 -->
<div style="display: none;" id="detailFeedBlackModal">
		<div class="layui-card">
			<div class="layui-card-body" id="feedText">
			</div>
		</div>
</div>
<div style="display: none;" id="editFeedBlackModal">
		<div class="layui-card">
			<div class="layui-card-body">
				<form id="editFeedBackForm">
					<input type="hidden" name="feedbackId" id="feedBackIdModal" />
					<div class="form-group" id="sortIdSele">
	                    <label>反馈分类</label>
	                    <select name="feedbackSortId" id="sortModalSel" class="form-control">
	                        <option value="0">---请选择---</option>
	                        <option v-for="item in sort" :value="item.feedbackSortId">{{item.sortName}}</option>
	                    </select>
                	</div>
					<div class="form-group">
	                    <label>反馈紧急性</label>
	                    <select name="feedbackSerious" class="form-control">
	                        <option value="0">普通</option>
	                        <option value="1">紧急</option>
	                    </select>
                	</div>
                	<button type="button" id="editFeedBackBtn" class="btn btn-default">处理</button>
				</form>
			</div>
		</div>
</div>

<script src="${APP_PATH}/static/assets/js/lib/jquery.min.js"></script>
<!-- jquery vendor -->
<script src="${APP_PATH}/static/assets/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="${APP_PATH}/static/assets/js/lib/sidebar.js"></script>
<!-- sidebar -->
<script src="${APP_PATH}/static/assets/js/lib/bootstrap.min.js"></script>
<!-- bootstrap -->
<script src="${APP_PATH}/static/assets/js/lib/mmc-common.js"></script>
<script src="${APP_PATH}/static/assets/js/scripts.js"></script>
<script src="${APP_PATH}/static/layui/layui.all.js"></script>

<!-- scripit init-->
<script>
	$(function(){
		renderTb();
	});
	function renderTb(){
		layui.use('table', function(){
			  var table = layui.table;
			  //第一个实例
			  table.render({
			    elem: '#feedBackTb'
			    ,height: 312
			    ,url: '${APP_PATH}/feedBack/getNoSolvedFeedList' //数据接口
			    ,page: true //开启分页
			    ,where: {solved:1}
			    ,cols: [[ //表头
			      {field: 'feedbackId', title: '#',hide:true,rowspan:2,align:"center"}
			      ,{field: 'feedbackCustName', title: '反馈人称呼',rowspan:2,align:"center"}
			      ,{field: 'feedbackCustEmail', title: 'Email',rowspan:2,align:"center"}
			      ,{title: '反馈状态',colspan:2,align:"center"}
			      ,{field: 'createTime', title: '反馈时间',rowspan:2,align:"center"}
			      ,{fixed: 'right', title: '操作',width:150,width:200, align:'center', toolbar: '#barDemo',rowspan:2,align:"center"}
			    ],
			    [
		    	   {field: 'feedbackSerious',align:"center", style:"color: orange;", title: '紧急性',templet: function(d){
			    	  return d.feedbackSerious == false?"普通":"紧急"
			      	}}
			      ,{field: 'feedIsDel',align:"center", style:"color: red;",title: '是否解决',templet: function(d){
			    	  return d.feedIsDel == true?"待解决":"已解决"
			      	}}
			    ]
			    ]
			    ,text: {
			        none: '暂时没有需要处理的留言'
			    }
			    ,skin: 'line' //行边框风格
			    ,size: 'lg'
			  	,parseData: function(res){ //res 即为原始返回的数据
			  		console.log(res)
				    return {
				      "code": res.status, //解析接口状态
				      "msg": res.message, //解析提示文本
				      "count": res.total, //解析数据长度
				      "data": res.data //解析数据列表
				    };
				  }
			  });
			  table.on('tool(feedBackTBFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				 
				  if(layEvent === 'detail'){ //查看
					  $("#feedText").html(data.feedbackText);
					  var index = layer.open({
							title : '反馈内容',
							fix : true,
							resize :false,
							move: false,
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#detailFeedBlackModal')
						});
				  } else if(layEvent === 'solveFeedBack'){ //解决
					  console.log(data.feedbackSortId)
					  if(data.feedbackSortId==0){
						  layer.msg("请先在“修改”里面选择反馈分类！",{icon: 2});
						  return;
					  }
					var id=data.feedbackId;
				    layer.confirm('确认已经解决了吗？', function(index){
				      $.ajax({
				    	  url:"${APP_PATH}/feedBack/solveFeedBack?id="+id,
				    	  method:"GET",
				    	  success:function(res){
				    		  if(res.code==100){
				    			  layer.msg(res.extend.msg,{icon: 1},function(){
				    				  renderTb();
				    			  }); 
				    		  }
				    	  },error:function(){
				    		  layer.msg("确认解决失败！系统出错！",{icon: 2});
				    	  }
				      });
				      layer.close(index);
				    });
				  } else if(layEvent === 'edit'){ //编辑
					  $("#feedBackIdModal").val(data.feedbackId);
				  	  var sortId = data.feedbackSortId
				  	  $("#sortModalSel > option").each(function(){
				  		 var va = $(this).val()
				  		  if(va == sortId){
				  			$(this).attr("selected","selected") 
				  		  }
				  	  });	
					  var index = layer.open({
							title : '反馈内容',
							fix : true,
							resize :false,
							move: false,
							area:["600px","300px"],
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#editFeedBlackModal')
						});
					  
				  } else if(layEvent === 'LAYTABLE_TIPS'){
				    layer.alert('Hi，头部工具栏扩展的右侧图标。');
				  }
				});
			});
	}
	var sortIdSele = new Vue({
		el:"#sortIdSele",
		data:{
			sort:[]
		},
		created: function () {
			this.$http.get("${APP_PATH}/feedBackSort/getAll").then(function(response){
				//成功
				this.sort=response.body;
			},function(response) {
				//错误
				console.log("查询反馈分类时，出现系统错误！")
			});
		}
	});
	//修改反馈信息
	$("#editFeedBackBtn").click(function(){
		layui.use('layer', function(){
			 var table = layui.table;
			$.ajax({
				url:"${APP_PATH}/feedBack/updateFeedBack",
				method:"POST",
				data:$("#editFeedBackForm").serialize(),
				success:function(res){
					if(res.code==100){
						layer.msg(res.extend.msg,{icon: 6},function(){
							renderTb();
							layer.closeAll(); //疯狂模式，关闭所有层
						});	
					}else{
						layer.msg(res.extend.msg,{icon: 5});	
					}
				},error:function(){
					layer.msg('修改反馈信息时，系统错误！',{icon: 5});
				}
			});
		})
	});
	//点击表格顶部的刷新
	$("#reloadTBIcon").click(function(){
		renderTb();
	});
	$("#lookTBIcon").click(function(){
		layui.use('layer', function(){
			var table = layui.layer;
			layer.msg("待处理的反馈信息");
		})
	});
	
</script>
<script type="text/html" id="barDemo">
<button type="button" class="btn btn-info btn-xs btn-outline" lay-event="detail">查看</button>
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="edit">修改</button>
<button type="button" class="btn btn-danger btn-xs btn-outline" lay-event="solveFeedBack">解决</button>
</script>
</body>

</html>