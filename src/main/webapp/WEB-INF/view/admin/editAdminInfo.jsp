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
                                    <li class="active">编辑资料</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <div class="main-content">
                	<div class="row">
                		<div class="col-lg-6  layui-col-md-offset3">
                            <div class="layui-card">
                                <div class="layui-card-header">
                                   	修改资料
                                </div>
                                <div class="layui-card-body">
                                    <form class="layui-form" id="listHeaderForm">
                                    <input type="hidden" name="adminId" value="${sessionScope.adminId}"/>
                                    	<div class="layui-col-md2 layui-col-md-offset3">
	                                    	<input type="radio" name="adminHead" value="1.jpg" class="headerInput">
					                   		<img alt="" src="${APP_PATH}/static/assets/images/avatar/1.jpg">
                                    	</div>
				                   		<div class="layui-col-md2">
					                   		<input type="radio" name="adminHead" value="2.jpg" class="headerInput">
											<img alt="" src="${APP_PATH}/static/assets/images/avatar/2.jpg">
				                   		</div>
				                   		<div class="layui-col-md2">
					                   		<input type="radio" name="adminHead" value="3.jpg" class="headerInput">
											<img alt="" src="${APP_PATH}/static/assets/images/avatar/3.jpg">
				                   		</div>
				                   		
				                   	</form>
				                   	<hr>
								      <button type="button" id="edithHeaderBtn" class="btn btn-success btn-outline btn-rounded m-b-10 m-l-5">修改头像</button>
								      <a href="#"><span class="user-avatar" id="showEditPwdForm">修改密码 <i class="ti-angle-down f-s-10"></i></span></a>
									<form class="layui-form" style="display: none;" id="editPwdForm">
									   <input type="hidden" name="adminId" value="${sessionScope.adminId}"/>
									  <div class="layui-form-item">
									    <label class="layui-form-label">旧密码</label>
									    <div class="layui-input-block">
									      <input type="text" name="oldPwd" required  lay-verify="required" placeholder="请输入旧密码" class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <label class="layui-form-label">新密码</label>
									    <div class="layui-input-block">
									      <input type="text" name="newPwd" required  lay-verify="required" placeholder="请输入新密码" class="layui-input">
									    </div>
									  </div>
									  <div class="layui-form-item">
									    <div class="layui-input-block">
									      <button class="layui-btn" type="button" id="editPwdBtn" lay-submit>立即提交</button>
									    </div>
									  </div>
									</form>
								</div>
                                
                                
                                
                            </div>
                        </div>
                	</div>
         		</div>
 </div>
 <!-- /# container-fluid -->
</div>
<!-- /# main -->
</div>
<!-- /# content wrap -->
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
<!-- scripit init-->
<script src="${APP_PATH}/static/layui/layui.all.js"></script>
<script>
    $(".layui-form-radio").css("padding-left","13px");
    
    $("#editPwdBtn").click(function(){
    	$.ajax({
    		url:"${APP_PATH}/admin/modifyPwd",
    		method:"POST",
    		data:$("#editPwdForm").serialize(),
    		success:function(res){
    			layui.use('layer', function(){
  				var layer = layui.layer;
  				  if(res.code == 100){
  					 layer.msg(res.extend.msg,{icon: 6},function(){
  						 window.location.href='${APP_PATH}/admin/loginOut';
					  });
  				  }else{
  					layer.msg(res.extend.msg,{icon: 5}); 
  				  }
    			});
    		}
    	});
    });
    
    $("#showEditPwdForm").click(function(){
    	$("#editPwdForm").removeAttr("style");
    	$(this).remove();
    });
    $("#edithHeaderBtn").click(function(){
    	var header =  $("#listHeaderForm").serialize();
    	$.ajax({
    		url:"${APP_PATH}/admin/modifyHeader",
    		method:"POST",
    		data:header,
    		success:function(res){
    			layui.use('layer', function(){
				  var layer = layui.layer;
				  if(res.code == 100){
					  layer.msg(res.extend.msg,{icon: 6},function(){
						  $("#adminHeaderImg").attr("src",res.extend.headerImg);
					  });
	    		  }else{
	    			  layer.msg(res.extend.msg,{icon: 5}); 
	    		  }
    					  
    		   });
    		},
    		error:function(){
    			 layer.msg("请选择头像！",{icon: 5});
    		}
    	});	
    });
    
</script>
</body>

</html>