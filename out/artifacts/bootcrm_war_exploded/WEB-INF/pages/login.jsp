<%--
  Created by IntelliJ IDEA.
  User: stark
  Date: 2018.11.23
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/iconfont.css" />
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
</head>

<body>
<div id="main-box"></div>
<div id="main-content">
    <div class="login-body">
        <div class="login-main">
            <form action="login" method="post" class="login-form">
                <h3>客户管理中心</h3>
                <h5 style="padding-bottom: 10px">Customer Management Center</h5>
                <!-- 账号登陆 -->
                <div class="item-box">
                    <div class="input-group user-name ">
							<span class="input-group-addon"><i
                                class="iconfont icon-yonghu"></i></span> <input type="text"
                                                                                name="usercode" class="form-control username"
                                                                                placeholder="用户名/手机号">
                    </div>
                    <div class="input-group password">
							<span class="input-group-addon"><i
                                class="iconfont icon-mima"></i></span> <input type="password"
                                                                              name="password" class="form-control pwd" placeholder="密码">
                    </div>

                    <div class="login_btn_panel">
                        <button class="btn-submit" type="button">登录</button>
                        <div class="checktips animated shake">${msg }</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/logincheck.js"></script>
</body>
</html>

