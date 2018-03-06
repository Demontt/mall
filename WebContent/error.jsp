<%@ page import="util.ErrorCode" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>饱了么 - 出错啦</title>
    <script>
        var time = 3;
        function foo() {
            window.setTimeout("foo()", 1000);
            if (time > 0) {
                document.getElementById("show").innerHTML = "<font color=red>" + time + "</font> 秒后回到上一页";
                time--;
            } else {
                window.location.href = '<%
                try {
                    out.print((String)session.getAttribute("target"));
                } catch (Exception e) {
                    out.print("index.jsp");
                }
                %>'
            }
        }
    </script>
    <link rel="stylesheet" href="css/login.css">
</head>
<body onload="foo()">
<%@ include file="part4.jsp" %>
    <span id="title">出错啦！</span>
</div>
<div class="container" style="width: 100%;background:#f7f7f7; text-align: center">
    <h1><%
        try {
            int errorCode = (int) session.getAttribute("errorCode");
            switch (errorCode) {
                case ErrorCode.VERIFY_CODE_WRONG:
                    out.print("验证码错误！");
                    break;
                case ErrorCode.LOGIN_FAIL:
                    out.print("用户名或密码错误！");
                    break;
                case ErrorCode.SIGNUP_FAIL:
                    out.print("注册失败");
                    break;
                case ErrorCode.GOOD_NOT_FOUND:
                    out.print("商品未找到！");
                    break;
                default:
                    throw new Exception();
            }
        } catch (Exception e) {
            out.print("未知错误！");
        }
    %></h1>
    <p id="show"></p>
</div>
<%@ include file="part3.jsp" %>