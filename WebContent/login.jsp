<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>饱了么 - 登陆 | 注册</title>
    <link rel="stylesheet" href="css/login.css">
    <script src="js/login.js"></script>
</head>
<body>
<%@ include file="part4.jsp" %>
    <span id="title">会员登录</span>
</div>
<div style="background-color:#322a27;">
    <div class="container">
        <form method="post" action="login">
            <div class="login" id="login">
                <p>用户名</p><input name="login_username" type="text" placeholder="会员名" id="login_username"><br>
                <p>密&ensp;&ensp;码</p><input name="login_password" type="password" id="login_password"><br>
                <p>验证码</p><input name="login_code" type="text" id="login_code">
                <img onclick="code(this)" alt="点击加载"><br>
                <div class="buttons">
                    <button onclick="return loginSubmit()" style="background-color:rgba(241, 177, 80, 0.3);">登陆</button>
                    <button onclick="return signup()" style="background-color:rgba(141, 61, 7, 0.3);">注册</button>
                </div>
            </div>
        </form>
        <form method="post" id="signupForm" action="signup">
            <div class="login" id="signup" style="display: none">
                <p>用户名</p><input name="signup_username" type="text" placeholder="会员名" id="signup_username"><br>
                <p>密&ensp;&ensp;码</p><input name="signup_password" type="password" id="signup_password"><br>
                <p>密码确认</p><input name="signup_password_confirm" type="password" id="signup_password_confirm"><br>
                <p>验证码</p><input name="signup_code" type="text" id="signup_code">
                <img onclick="code(this)" alt="点击加载"><br>
                <div class="buttons">
                    <button onclick="return signupSubmit()" style="background-color:rgba(239, 146, 28, 0.3);">注册
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
<%@ include file="part3.jsp" %>