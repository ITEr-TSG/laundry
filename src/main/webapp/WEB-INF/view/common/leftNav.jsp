<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
        <div class="nano">
            <div class="nano-content">
                <ul>
                    <li class="active">
                        <a href="${PATH}/admin/toIndex"><i class="ti-home"></i> 首页</a>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-user"></i>客户管理<span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${PATH}/cust/toAddCustPage">添加客户</a></li>
                            <li><a href="${PATH}/cust/toListCustPage">所有客户</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-time"></i> 技师管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${PATH}/technSort/toMenageSortPage">分类管理</a></li>
                            <li><a href="${PATH}/technician/toTechnListPage">所有技师</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-bar-chart-alt"></i>积分管理<span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${PATH}/rechargeCust/toCustIntegralPage">客户积分</a></li>
                            <li><a href="${PATH}/cashTechn/toTechnIntegralPage">技师积分</a></li>
                              
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-crown"></i>订单管理<span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${PATH}/orderItem/toAddOrderItemPage">添加条目</a></li>
                            <li><a href="${PATH}/orderItem/toOrderItemListPage">订单条目</a></li>
                            <li><a href="${PATH}/newFood/toNewFoodListPage">订单中心</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-timer"></i>博客管理<span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${PATH}/blogs/toTechnBlogsListPage">技师博客</a></li>
                            <li><a href="${PATH}/blogsCollect/toCollectPage">点赞管理</a></li>
                        </ul>
                    </li>
                    <li>
                    	<a href="${PATH}/discount/useCouponByCode"><i class="ti-shield"></i> 联系我们</a>
                    </li>
                    <li><a href="${PATH}/admin/loginOut"><i class="ti-close"></i> 退出登录</a></li>
                </ul>
            </div>
        </div>
    </div>