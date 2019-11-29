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
<title>编写博客</title>
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
				<div class="layui-col-md3">
					<h3 align="center" style="padding-top: 10px">编写者信息</h3>
					<h4 align="center" style="color: red">${technError}</h4>
					<br>
					<div class="layui-form cust-info">
						<div class="layui-form-item">
							<label class="layui-form-label">用户名</label>
							<div class="layui-input-block">
								<input type="text" readonly="readonly" value="${techn.technRealName}"
									class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">昵称</label>
							<div class="layui-input-block">
								<input type="text" readonly="readonly" value="${techn.technNick}"
									 class="layui-input">
							</div>
						</div>
					</div>

				</div>
				<div class="layui-col-md9" style="margin-bottom: 150px">
					<h3 align="center" style="padding-top: 10px">博客编写</h3>
					<br>
					  <input type="hidden" id="technId_blog" value="${techn.technicianId}">
					  <div class="layui-form-item" id="writeDiv">
					     
					  </div>
					  <div class="layui-form">
						  <input type="text" id="blig_title" placeholder="请输入标题" autocomplete="off" class="layui-input">
						  <input type="radio"  checked="checked" name="state" value="展示" title="展示">
						  <input type="radio" name="state" value="隐藏" title="隐藏" ><br><br>
					     
					      <button class="layui-btn" id="addBlogBtn" type="button">发表</button>
					      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
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
	


</body>
<script src="${PATH}/static/layui/layui.all.js"></script>
<script src="${PATH}/static/js/jquery2.0-min.js"></script>
<script src="${PATH}/static/wangEditor/release/wangEditor.min.js"></script>
<script type="text/javascript">
	var E = window.wangEditor
	var editor = new E('#writeDiv')
	// 自定义菜单配置
    editor.customConfig.menus = [
    	'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'list',  // 列表
        'justify',  // 对齐方式
        'quote',  // 引用
        'image',  // 插入图片
        'table',  // 表格
        'undo',  // 撤销
        'redo'  // 重复
    ]
	// 隐藏“网络图片”tab
    editor.customConfig.showLinkImg = false
	editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    editor.customConfig.uploadImgServer = '/upload'  // 上传图片到服务器
   	// 将图片大小限制为 1M
   	editor.customConfig.uploadImgMaxSize = 1*1024*1024
 	// 限制一次最多上传 5 张图片
   	editor.customConfig.uploadImgMaxLength = 5
    // 配置服务器端地址
    editor.customConfig.uploadImgServer = '${PATH}/blogs/uploadBlogImg'
    //自定义文件名字
    editor.customConfig.uploadFileName = 'file';
    editor.customConfig.customAlert = function (info) {
    	layui.layer.msg("图片格式或大小有误",{icon:5})
    }
    editor.customConfig.uploadImgHooks = {
    	    before: function (xhr, editor, files) {
    	    },
    	    success: function (xhr, editor, result) {
    	    },
    	    fail: function (xhr, editor, result) {
    	    	layui.layer.msg(result.msg,{icon:5})
    	    },
    	    error: function (xhr, editor) {
    	    	layui.layer.msg("图片格式或大小有误",{icon:5})
    	    },
    	    timeout: function (xhr, editor) {
    	    	layui.layer.msg("图片上传超时！",{icon:5})
    	    },
    	    // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
    	    customInsert: function (insertImg, result, editor) {
    	    var url = result.data
	        insertImg(url)	//回显
	
    	    }
    	}
	editor.create()
	editor.txt.html('<p>开始编写吧！</p>')
	 document.getElementById('addBlogBtn').addEventListener('click', function () {
		 var id = $("#technId_blog").val();
		 var title = $("#blig_title").val();
		 if(title==""){
			 layui.layer.msg("请给文章写上标题！",{icon:5});
			 return;
		 }
		 var blogState = $('input[name="state"]:checked').val();
        var blog = editor.txt.html()
        $.ajax({
        	url:"${PATH}/blogs/writeBlog",
        	method:"POST",
        	contentType: "application/json",//必须指定，否则会报415错误
            dataType : 'json',
        	data:JSON.stringify({id:id,text:blog,state:blogState,title:title}),
        	success:function(res){
        		if(res.code==100){
        			layui.layer.msg(res.extend.msg,{icon:6},function(){
        				location.reload();  
        			});
        		}else{
        			layui.layer.msg(res.extend.msg,{icon:5});
        		}
        	},error:function(){
        		layui.layer.msg("系统错误！",{icon:5});
        	}
        });
    }, false)
</script>
</html>