<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
        <div class="nano">
            <div class="nano-content">
                <ul>
                    <li class="active">
                        <a href="${APP_PATH}/admin/toIndex"><i class="ti-home"></i> 首页</a>
                    </li>
                    <li>
                    	<a href="${APP_PATH}/discount/useCouponByCode"><i class="ti-heart"></i> 使用优惠卷</a>
                    </li>
                    
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-email"></i>反馈福利<span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${APP_PATH}/feedBack/afterSolveFB">已解决的反馈</a></li>
                            <li><a href="${APP_PATH}/feedDiscount/getAllCoupon">所有优惠卷</a></li>
                            <li><a href="${APP_PATH}/feedDiscount/mangeSortAndDiscount">反馈分类和优惠卷</a></li><!-- 放在了中间表的控制器 -->
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-time"></i> 预约管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${APP_PATH}/appointment/toValidAppointPage">有效预约</a></li>
                            <li><a href="${APP_PATH}/appointment/toAddApointPage">添加预约</a></li>
                            <%-- <li><a href="${APP_PATH}/appointment/toAfterApointPage">服务之后</a></li> --%>
                            
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-bar-chart-alt"></i>  菜单管理  <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${APP_PATH}/foodMenus/toAddFoodMenusPage">添加菜单</a></li>
                            <li><a href="${APP_PATH}/foodMenus/toFoodMenusListPage">菜单管理</a></li>
                              
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-crown"></i>  新品管理<span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${APP_PATH}/newFood/toAddNewPage">添加新品</a></li>
                            <li><a href="${APP_PATH}/newFood/toNewFoodListPage">上新管理</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-timer"></i>  即将推出<span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${APP_PATH}/soonFood/toAddSoonPage">添加推新</a></li>
                            <li><a href="${APP_PATH}/soonFood/toSoonFoodListPage">推新管理</a></li>
                        </ul>
                    </li>
                    <%-- <li>
                    	<a href="${APP_PATH}/discount/useCouponByCode"><i class="ti-shield"></i> 登录日志</a>
                    </li> --%>
                    <li><a href="${APP_PATH}/admin/loginOut"><i class="ti-close"></i> 退出登录</a></li>
                </ul>
            </div>
        </div>
    </div>