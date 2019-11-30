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
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>博客列表</title>
 
  <link rel="stylesheet" type="text/css" href="${PATH}/pages/css/main.css">
  <!-- Bootstrap Core CSS -->
	<link href="${PATH}/pages/css/bootstrap.css" rel='stylesheet' type='text/css' />
	<!-- gallery css -->
	<link rel="stylesheet" href="${PATH}/pages/css/swipebox.css">
	<!-- Custom CSS -->
	<link href="${PATH}/pages/css/style.css" rel='stylesheet' type='text/css' />
	 <link rel="stylesheet" type="text/css" href="${PATH}/static/layui/css/layui.css">
<!--加载meta IE兼容文件-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<script src="${PATH}/static/js/jquery2.0-min.js"></script>
<script src="${PATH}/static/js/comment.js"></script>
<script src="${PATH}/static/vue/vue.min.js"></script>
<script src="${PATH}/static/vue/vue-resource.min.js"></script>
</head>
<body>
  <%@ include file="/pages/common/header.jsp"%>
  <div class="content whisper-content">
    <div class="cont">
      <div class="whisper-list" id="lookBlogs">
      <input type="hidden"  value="${sessionScope.id}" ref="startId" id="startId"/>
  	  <input type="hidden"  value="${sessionScope.name}" ref="startName" id="startName"/>
      	<a class="layui-btn layui-btn-primary" href="javascript:history.go(-1);">
		  <i class="layui-icon layui-icon-return"> 返回</i>
		</a>
      	<div class="item-box">
          <div class="review-version">
              <div class="form">
                <div class="layui-form">
                  <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                      <textarea name="desc"  placeholder="请输入查询条件" v-model="kwBlogsModel" class="layui-textarea"></textarea>
                    </div>
                  </div>
                  <div class="layui-form-item">
                    <div class="layui-input-block" style="text-align: right;">
                      <button type="button" class="layui-btn" v-on:click="findByKw">搜索</button>
                    </div>
                  </div>
                </div>
              </div>
          </div>
         
        </div>
      
        <div class="item-box" v-for="item in blogs">
          <div class="item">
            <div class="whisper-title" >
              <i class="layui-icon layui-icon-date"></i><span class="hour">{{item.createTime | moment}}</span></span>
            </div>
            <div style="height: 50px">
	            <p class="text-cont" v-html="item.blogTitle">
	            </p>
            </div>
            <div class="op-list">
              <p class="like" v-on:click="collectBlog(item.blogId,item.technName)"><i  class="layui-icon layui-icon-rate"></i><span>{{item.praiseInt}}</span></p> 
              <p class="edit"><i class="layui-icon layui-icon-username"></i><span>{{item.technName}}</span></p> 
              <p class="off" off=""><span>阅读</span><i class="layui-icon layui-icon-down"></i></p>
            </div>
          </div>
         	
         	<div class="review-version layui-hide">
              <div class="list-cont">
                <div class="cont">
                  <div class="text">
                    <p class="ct" v-html="item.blogText"></p>
                  </div>
                </div>
              </div>
          </div>
         
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="${PATH}/static/layui/layui.js"></script>
  <script type="text/javascript">
   layui.config({
      base: '${PATH}/static/js/'
    }).use(['element','laypage','form','menu'],function(){
      element = layui.element,laypage = layui.laypage,form = layui.form,menu = layui.menu;
      laypage.render({
        elem: 'demo'
        ,count: 70 //数据总数，从服务端得到
      });
      menu.init();
      menu.off();
      menu.submit()
    })
  </script>
  <script type="text/javascript">
  var lookBlogs = new Vue({
	  el:"#lookBlogs",
		data:{
			blogs:[],
			kwBlogsModel:"",
			startId:"",
			startName:""
		},
		created: function () {
			this.$http.post("${PATH}/blogs/getBlogByCust",{data:this.kwBlogsModel}).then(function(response){
				console.log(response.body)
				//成功
				this.blogs=response.body;
			},function(response) {
				//错误
				console.log("查询反馈分类时，出现系统错误！")
			});
		}, 
       methods:{
    	findByKw:function(){
    		this.$http.post("${PATH}/blogs/getBlogByCust",{data:this.kwBlogsModel}).then(function(response){
				console.log(response.body)
				//成功
				this.blogs=response.body;
			},function(response) {
				console.log("查询反馈分类时，出现系统错误！")
			});
    	},
    	collectBlog:function(id,name){
    		this.$http.post("${PATH}/blogsCollect/collectByCust",{
    			startId:this.$refs.startId.value,
    			startName:this.$refs.startName.value,
    			blogId:id,
    			technName:name
    			}).then(function(response){
    				console.log(response.body)
				//成功
				var state = response.body
				if(state.code==100){
					layui.layer.msg(state.extend.msg,{icon:6});
				}else{
					layui.layer.msg(state.extend.msg,{icon:5});
				}
			},function(response) {
				console.log("系统错误！")
			});
       }
    	}
  });
  Vue.filter('moment', function (value, formatString) {
      formatString = formatString || 'YYYY-MM-DD';
      return moment(value).format(formatString);
  });
  </script>
</body>
</html>