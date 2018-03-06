<%@ page import="model.User" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="model.Good" %>
<%@ page import="dao.GoodDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>饱了么 - 购物车</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/cart.css">
    <script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
<%@ include file="part4.jsp" %>
<span id="title">购物车</span>
</div>
<div class="container"
     style="width: 100%;background:#f7f7f7; text-align: center; height: auto; padding-left: 0; padding-right:0;">
    <%
        if (user != null) {
            try {
                double price = 0;
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    throw new Exception();
                }
                if (cart.isEmpty()) {
                    throw new Exception();
                }
                out.print("<div id=\"car\" class=\"car\">\n" +
                        "        <div class=\"head_row hid\">\n" +
                        "            <div class=\"img left\">&nbsp;</div>\n" +
                        "            <div class=\"name left\">商品名称</div>\n" +
                        "            <div class=\"price left\">单价</div>\n" +
                        "            <div class=\"ctrl left\">数量</div>\n" +
                        "        </div>\n");

                Iterator iterator = cart.getGoods();
                while (iterator.hasNext()) {
                    Map.Entry entry = (Map.Entry) iterator.next();
                    Integer id = (Integer) entry.getKey();
                    Integer amount = (Integer) entry.getValue();
                    Good good = new GoodDao().getGood(id);
                    out.print("        <div class=\"row hid\">\n" +
                            "            <div class=\"img left\"><img src=\"img/goods/logo/" + good.getImg() + "\" width=\"80\" height=\"80\"></div>\n" +
                            "            <div class=\"name left\"><p class=\"fix\">" + good.getName() + "</p></div>\n" +
                            "            <div class=\"price left\"><span>" + good.getPrice() + "元</span></div>\n" +
                            "            <div class=\"ctrl left\">" +
                            "<p class=\"fix\"><input class=\"num-input\" id=\"value" + good.getId() + "\" onchange=\"check(this)\" value=\"" + amount + "\">" +
                            " <button class=\"btn_plus\" onclick=\"valueMinus(" + good.getId() + ")\">-</button> <button class=\"btn_plus\" onclick=\"valuePlus(" + good.getId() + ")\">+</button>" +
                            " <button style=\"background-color:#F03F00;\" class=\"btn_plus\" onclick=\"del(" + good.getId() + ")\">x</button> <button style=\"background-color:#4000f4\" class=\"btn_plus\" onclick=\"save(" + good.getId() + ")\">√</button></p></div>\n" +
                            "        </div>\n");
                    price += good.getPrice() * amount;
                }
                out.print("    </div>\n");
                String price_show = String.format("%.2f", price);
                out.print("<span style=\"font-size:24px;margin-right:50px;\">合计：￥" + price_show + "</span>");
                out.print("<button style=\"background-color:#e61952; width:200px; height:50px;\" class=\"btn_plus\">结算</button>");
            } catch (Exception e) {
                out.print("<h1>您的购物车为空</h1>");
            }
        } else {
            out.print("<h1>您还未登录，请先登录</h1>");
        }
    %>
</div>
<%@ include file="part3.jsp" %>