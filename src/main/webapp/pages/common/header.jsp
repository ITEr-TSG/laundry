<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid" style="background-color: #393D49;">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="${PATH}/pages/index.jsp"> <i
				class="fab fa-empire"></i>
			</a>
			<button class="navbar-toggler ml-md-auto" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation" style="">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto text-center layui-nav">
					<li class="layui-nav-item">
				    <a href="${PATH}/pages/index.jsp">主页</a>
				  </li>
				  <li class="layui-nav-item">
					<a href="${PATH}/pages/blogs/whisper.jsp">博客中心</a>
				</li>
				</ul>
				<ul class="layui-nav">
					<c:choose>
						<c:when test="${sessionScope.nick == null}">
							<li class="layui-nav-item  mr-3">
								<a href="${PATH}/pages/login.jsp">登录</a>
							</li>
							<li class="layui-nav-item  mr-3">
								<a href="${PATH}/pages/admin-login.jsp">后台登录</a>
							</li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionScope.flag == 1}">
									<li class="layui-nav-item" lay-unselect="">
											<a href="javascript:;"><img src="/file/header/2.jpg" class="layui-nav-img"> ${sessionScope.nick} </a>
										<dl class="layui-nav-child">
											<dd>
												<a class="dropdown-item" href="${PATH}/cust/getCustInfo/${sessionScope.id}/${sessionScope.name}">个人中心</a>
											</dd>
											<dd>
												<a class="dropdown-item" href="${PATH}/orders/getMyOrders/${sessionScope.id}/${sessionScope.name}">我的订单</a>
											</dd>
											<dd>
												<a class="dropdown-item" href="${PATH}/cust/loginOut">退出登录</a>
											</dd>
										</dl></li>
								</c:when>
								<c:when test="${sessionScope.flag == 2}">
									<li class="layui-nav-item" lay-unselect="">
											<a href="javascript:;"><img src="${sessionScope.photo}" class="layui-nav-img"> ${sessionScope.nick} </a>
										<dl class="layui-nav-child">
											<dd>
												<a class="dropdown-item" href="${PATH}/technician/getTechnInfo/${sessionScope.id}/${sessionScope.phone}">个人中心</a>
											</dd>
											<dd>
												<a class="dropdown-item" href="${PATH}/blogs/writeBlog/${sessionScope.id}/${sessionScope.phone}">编写博客</a>
											</dd>
											<dd>
												<a class="dropdown-item" href="${PATH}/blogs/getBlogsByTechn/${sessionScope.id}/${sessionScope.phone}">我的博客</a>
											</dd>
											<dd>
												<a class="dropdown-item" href="${PATH}/cust/loginOut">退出登录</a>
											</dd>
										</dl></li>
								</c:when>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</div>