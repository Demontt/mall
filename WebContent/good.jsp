<%@ page import="model.User" %>
<%@ page import="util.ErrorCode" %>
<%@ page import="model.Good" %>
<%@ page import="dao.GoodDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Good good = null;
    try {
        if (request.getParameter("id").equals("")) {
            throw new Exception();
        } else {
            int id = Integer.valueOf(request.getParameter("id"));
            good = new GoodDao().getGood(id);
            if (good == null) {
                throw new Exception();
            }
        }
    } catch (Exception e) {
        request.getSession().setAttribute("errorCode", ErrorCode.GOOD_NOT_FOUND);
        request.getSession().setAttribute("target", "index.jsp");
        response.sendRedirect("error.jsp");
        return;
    }
%>
<html>
<head>
    <title><% out.print(good.getName()); %> - 饱了么</title>
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/menu.css" type="text/css">
    <link rel="stylesheet" href="css/good.css">
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/header_hidden.js"></script>
    <script type="text/javascript" src="js/good.js"></script>
</head>
<%@ include file="part1.jsp" %>
                <h3><a href="" class="all_class">商品分类</a></h3>
                <div class="menu" style="display: none;">
<%@ include file="part2.jsp" %>
        </div>
    </div>
</div>
<div class="snack_bg">
    <div class="wrap fixed">
        <div class="snack_info fixed">
            <div class="wrap_left">
                <div id="zoom">
                    <img src="img/goods/logo/<% out.print(good.getImg()); %>" width="400" height="400">
                </div>
            </div>
            <div class="wrap_right">
                <h3 class="name"><% out.print(good.getName()); %></h3>
                <div class="price">
                    <ul>
                        <li class="price1"><em>￥</em>
                            <span id="shopprice"><% out.print(good.getPrice()); %></span>
                        </li>
                        <li class="price2" id="price2">
                            <span class="tag2" id="exercise_name">包邮</span>
                            为您节省￥<span id="cha">10</span>
                            <p>(市场价￥<% out.print(good.getPrice() + 10); %>)</p>
                        </li>
                        <li class="status">
                            <div class="activity">
                                <p>单品包邮</p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="info_wrap">
                    <p class="num">
                        编号： <em><% out.print(good.getNumber()); %></em>
                    </p>
                    <p class="info">
                        品牌：
                        <em><% out.print(good.getBrand()); %></em>
                        <span>|</span>
                        产 地：<em><% out.print(good.getCity()); %></em>
                        <span>|</span>

                        净含量：
                        <em><% out.print(good.getWeight()); %>克</em>
                    </p>
                    <p class="fl">
                        库存：
                        <em id="amount"><% out.print(good.getAmount()); %></em>
                    </p>
                    <br><br>
                    <div class="num2 fixed">
                        <span class="fl">数量：</span>
                        <input class="num-input" id="value" onchange="check(this)" value="1">
                        <button class="btn_plus" onclick="valueMinus()" id="minus">-</button>
                        <button class="btn_plus" onclick="valuePlus()" id="plus">+</button>
                        <span id="errText" style="color: #ff0000; position: relative; left: 10px; bottom: 5px;"></span>
                    </div>
                    <button class="btn_add" onclick="valueSubmit(<% out.print(good.getId()); %>)">添加到购物车</button>
                </div>
            </div>
        </div>
    </div>
    <div class="wrap fixed">
        <div id="detail_cot">
            <div id="tabCot_product">
                <div class="tabCot_pro">
                    <div id="lingshi_a">
                        <% out.print(good.getDescription()); %>
                    </div>
                    <div class="tips">
                        <% out.print(good.getDetail()); %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="part3.jsp" %>