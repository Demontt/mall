<%@page pageEncoding="UTF-8"%>
<body>
<div class="head">
    <div class="top fixed">
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

    <div class="header">
        <a class="logo" href="index.jsp" title="饱了么"><img src="img/logo.jpg" alt="" width="140" height="70"></a>
        <div class="search">
            <form action="page.jsp" method="get">
                <div class="searchBg">
                    <input type="text" class="ks" name="k" value="" placeholder="搜索" autocomplete="off"/>
                    <input type="submit" class="btnSearch" value="找零食"/>
                </div>

                <div class="hotSearch">
                    <a href="page.jsp?k=凤爪" target="_blank">凤爪</a>
                    <a href="page.jsp?k=巧克力" target="_blank">巧克力</a>
                    <a href="page.jsp?k=锅巴" target="_blank">锅巴</a>
                    <a href="page.jsp?k=威化饼" target="_blank">威化饼</a>
                    <a href="page.jsp?k=坚果" target="_blank">坚果</a>
                </div>
            </form>
        </div>
        <div class="qrc_news">
            <a href="activity/activity.html" class="qrc"></a>
        </div>
    </div>

    <div class="secheader">
        <div class="navbar">
            <div class="sidebar">