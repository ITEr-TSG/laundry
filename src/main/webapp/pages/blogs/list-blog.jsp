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
<title>博客列表</title>
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
<link href="${PATH}/static/css/icheck-material.min.css" rel='stylesheet'
	type='text/css' />
<link href="${PATH}/static/css/icheck-material-custom.min.css" rel='stylesheet'
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
					<h3 align="center" style="padding-top: 10px">博客列表</h3>
					<br>
					<form class="layui-form" id="kwByBlogs">
					<input type="hidden" value="${techn.technicianId}" name="technId"/>
							<div class="layui-col-md3">
								<div class="layui-form-item">
								    <label class="layui-form-label">状态</label>
								    <div class="layui-input-block">
								      <select name="isShow">
								        <option value="0">---请选择---</option>
								        <option value="展示">展示</option>
								        <option value="隐藏">隐藏</option>
								      </select>
								    </div>
								  </div>
							</div>	
							<div class="layui-col-md9">
								<div class="layui-form-item">
								    <label class="layui-form-label">模糊搜索：</label>
								    <div class="layui-input-block">
								      <input type="text" name="blogText" placeholder="请输入" autocomplete="off" class="layui-input">
								    </div>
								  </div>
							</div>
							<div class="layui-col-md">
								<div class="layui-form-item">
								    <div class="layui-input-block">
								      <button class="layui-btn" id="kwGetBlogsBtn" type="button">搜索</button>
								      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
								    </div>
								  </div>
							</div>
					</form>
					<table id="blogsListTb" lay-filter="blogsListTbFilter"></table>
					
					
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
<!-- 模态框 -->	
<div style="display: none;" id="detailBlogModal">
	<fieldset class="layui-elem-field" >
	  <legend>文章</legend>
	  <div class="layui-field-box" id="detailBlogDiv">
	  </div>
	</fieldset>
</div>
<div style="display: none;" id="editBlogModal">
	<fieldset class="layui-elem-field" >
	  <legend>文章</legend>
	  <input type="hidden" id="editBlogId"/>
	  <div class="layui-field-box" id="editBlogDiv">
	  	<div id="editShowBlog"></div>
	  </div>
		<div class="layui-form">
			<div class="layui-form-item">
			    <div class="layui-input-block">
			      <input type="radio" name="editBlogState" value="展示" title="展示">
			      <input type="radio" name="editBlogState" value="隐藏" title="隐藏">
			    </div>
			  </div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="button" id="editBlogBtn" class="btn layui-btn-normal">修改</button>
				</div>
			</div>
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
		  var data = $("#kwByBlogs").serializeArray();
		  //第一个实例
		  table.render({
		     elem: '#blogsListTb'
		    ,height: 312
		    ,url: '${PATH}/blogs/getBlogsListByTechn' //数据接口
		    ,page: true, //开启分页
		    text : {
				none : '您还未编写过博客'
			},
			id:"blogsListTbId",
			skin : 'line' ,
			contentType: "application/json",//必须指定，否则会报415错误
		    dataType : 'json',
			method:"POST",
			unresize:true,
			where : {
				kwdata : data
			},
		    cols: [[ //表头
		      {field: 'blogId', title: '#',hide:true,align : "center"}
		      ,{field: 'isShow', style:"color: orange;",title: '状态',align : "center"} 
		      ,{field: 'praiseInt', title: '点赞',align : "center",sort:true} 
		      ,{field : 'createTime',title : '写作时间',sort:true,align : "center",templet:"<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
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
		  table.on('tool(blogsListTbFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			  var data = obj.data; //获得当前行数据
			  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
			  if(layEvent === 'detail'){ //查看
				  $("#detailBlogDiv").html(data.blogText);
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
				  
			  } else if(layEvent === 'del'){ //删除
			    layer.confirm('真的删除行么', function(index){
			      obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
			      layer.close(index);
			      var id = data.blogId
			      $.ajax({
					url:"${PATH}/blogs/delByTechn/"+id,	
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
			  } else if(layEvent === 'edit'){ //编辑
				  $("#editShowBlog").html(data.blogText);
				  $("#editBlogId").val(data.blogId);
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
						content : $('#editBlogModal')
					});
				  
			  } else if(layEvent === 'LAYTABLE_TIPS'){
			    layer.alert('Hi，头部工具栏扩展的右侧图标。');
			  }
			});
		  
		});
}
$("#kwGetBlogsBtn").click(function(){
	renderTb();
});
	var E = window.wangEditor
	var editor = new E('#editBlogDiv')
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
	 document.getElementById('editBlogBtn').addEventListener('click', function () {
		 var id = $("#editBlogId").val();
		 var blogState = $('input[name="editBlogState"]:checked').val();
        var blog = editor.txt.html()
        $.ajax({
        	url:"${PATH}/blogs/editBlog",
        	method:"POST",
        	contentType: "application/json",//必须指定，否则会报415错误
            dataType : 'json',
        	data:JSON.stringify({id:id,text:blog,state:blogState}),
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
<script type="text/html" id="barDemo">
<div align="center">
<button type="button" class="btn btn-info  layui-btn-xs" lay-event="detail">查看</button>
<button type="button" class="btn layui-btn-warm layui-btn-xs" lay-event="edit">修改</button>
<button type="button" class="btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
</div>
</script>
</html>