<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="header">
        <div class="pull-left">
            <div class="logo">
                <a href="${APP_PATH}/admin/toIndex">
                    <img id="logoImg" src="${APP_PATH}/static/assets/logo/logo.png" data-logo_big="${APP_PATH}/static/assets/logo/logo.png" data-logo_small="${APP_PATH}/static/assets/logo/logoSmall.png" alt="Nixon" />
                </a>
            </div>
            <div class="hamburger sidebar-toggle">
                <span class="ti-menu"></span>
            </div>
        </div>
        <div class="pull-right p-r-15 " >
            <ul>
                <li class="header-icon dib">
                    <i class="ti-bell"></i>
                    <div class="note-count">2</div>
                </li>
                <li class="header-icon dib">
                    <i class="ti-email"></i>
                    <div class="note-count">21</div>
                    
                </li>
                <li class="header-icon dib chat-sidebar-icon"><i class="ti-comments"></i></li>
                <li class="header-icon dib">
                    <img class="avatar-img" id="adminHeaderImg" src="${sessionScope.adminHeader}" alt="管理员头像" /> <span class="user-avatar">${sessionScope.admin}<i class="ti-angle-down f-s-10"></i></span>
                    <div class="drop-down dropdown-profile">
                        <div class="dropdown-content-body">
                            <ul>
                                <li><a href="${APP_PATH}/admin/editAdminInfo"><i class="ti-user"></i> <span>编辑资料</span></a></li>
                                <!-- <li><a href="#"><i class="ti-wallet"></i> <span>My Balance</span></a></li>
                                <li><a href="#"><i class="ti-write"></i> <span>My Task</span></a></li>
                                <li><a href="#"><i class="ti-calendar"></i> <span>My Calender</span></a></li>
                                <li><a href="#"><i class="ti-email"></i> <span>Inbox</span></a></li>
                                <li><a href="#"><i class="ti-settings"></i> <span>Setting</span></a></li>
                                <li><a href="#"><i class="ti-help-alt"></i> <span>Help</span></a></li>
                                <li><a href="#"><i class="ti-lock"></i> <span>Lock Screen</span></a></li> -->
                                
                                <li><a href="${APP_PATH}/admin/loginOut"><i class="ti-power-off"></i> <span>退出登录</span></a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>