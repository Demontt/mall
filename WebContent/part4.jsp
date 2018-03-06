<%@page pageEncoding="UTF-8"%>
<div class="top">
    <div class="topContent">
        <ul class="topLeft">
            <li>您好，欢迎来到饱了么！</li>
            <li><%
                User user = (User) session.getAttribute("user");
                if (user != null) {
                    out.print(user.getUsername());
                    out.print(" ");
                    out.print("<a href=\"logout\">退出</a>");
                } else {
                    out.print("<a href=\"login.jsp\">登录 | 注册</a>");
                }
            %></li>
        </ul>
        <ul class="topRight">
            <li><a href="cart.jsp">我的购物车</a></li>
            <li>|</li>
            <li><a href="page.jsp">全部商品</a></li>
            <li>|</li>
            <li><a href="#">消息中心</a></li>
            <li>|</li>
            <li><a href="#">我的订单</a></li>
            <li>|</li>
            <li><a href="index.jsp">首页</a></li>
        </ul>
    </div>
</div>
<div class="title">
    <a href="index.jsp" title="饱了么"><img src="img/logo.jpg" alt="" width="140" height="70"></a>
