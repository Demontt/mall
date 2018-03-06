<%@ page import="model.User" %>
<%@ page import="model.GoodsList" %>
<%@ page import="dao.GoodsListDao" %>
<%@ page import="model.GoodsSearch" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.Good" %>
<%@ page import="dao.GoodDao" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>饱了么 - 首页</title>
    <link rel="stylesheet"  href="css/index.css"type="text/css">
    <link rel="stylesheet" href="css/menu.css" type="text/css">
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/header.js"></script>
</head>
<%@ include file="part1.jsp" %>
                <h3><a href="" class="all_class">全部商品分类</a></h3>
                <div class="menu">
<%@ include file="part2.jsp" %>
            <div class="indexpic">
                <div class="screen">
                    <div class="bd">
                        <div class="mt" style="background-color: rgb(250, 192, 143); display: none;">
                            <a href="" target="_blank">
                                <img src="img/index/big1.jpg" alt="首页全屏轮播大图A" width="1010" height="455">
                            </a>
                        </div>
                        <div class="mt" style="background-color: rgb(242, 220, 219); display: none;">
                            <a href="" target="_blank">
                                <img src="img/index/big2.jpg" alt="首页全屏轮播大图B" width="1010" height="455">
                            </a>
                        </div>
                        <div class="mt" style="background-color: rgb(217, 150, 148); display: block;">
                            <a href="" target="_blank">
                                <img src="img/index/big3.jpg" alt="首页全屏轮播大图C" width="1010" height="455">
                            </a>
                        </div>
                        <div class="mt" style="background-color: rgb(195, 214, 155); display: none;">
                            <a href="" target="_blank">
                                <img src="img/index/big4.jpg" alt="首页全屏轮播大图D" width="1010" height="455">
                            </a>
                        </div>
                    </div>
                    <div class="cd"></div>
                    <div class="hd">
                        <ul>
                            <li><a href="#"><img src="img/index/big1.jpg"></a></li>
                            <li><a href="#"><img src="img/index/big2.jpg"></a></li>
                            <li><a href="#"><img src="img/index/big3.jpg"></a></li>
                            <li><a href="#"><img src="img/index/big4.jpg"></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div style="position: fixed; top: 150px">
                <div style="background-color:#fff;border: 3px solid #e61952;z-index:99; width: 100px; height: 160px; position: relative; top:50px; left: -105px; text-align: center; color: #777; text-decoration: none;">
                    <img src="img/index/game.jpg" style="width: 100px;height: 100px;" onclick="window.location.href='game.htm'" onmouseover="this.style.cursor='pointer'"><br>
                    <a href="game.htm" style="font-size: 14px" onmouseover="this.style.fontSize='16px'"
                       onmouseleave="this.style.fontSize='14px'">
                        <h3 style="width: 100px;height:20px;margin: 0;">&gt; 玩游戏 &lt;<br/>赢优惠券</h3>
                    </a>
                </div>
            </div>
            <div style="position: fixed; bottom: 150px;">
                <a href="#top" onmouseover="this.style.cursor='default'">
                    <div style="background-color:#fff;border: 3px solid #e66208;z-index:99; width: 50px; height: 50px; position: relative; top:50px; right: -1024px; text-align: center; color: #777; text-decoration: none;overflow: hidden">
                        <span style="font-size: 48px; color: #e66208; user-select: none">^</span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="hot_sale">
    <div class="title">
        <span class="title_hot_sale">热卖推荐</span>
    </div>
    <div class="hot_sale_content">
        <ul class="hot_sale_snack">
            <%
                try {
                    GoodsSearch goodSearch = new GoodsSearch("");
                    goodSearch.setHot(1);
                    GoodsList goodsList = new GoodsListDao().getGoodsList(goodSearch);
                    if (goodsList.isEmpty()) {
                        throw new Exception();
                    } else {
                        Iterator iterator = goodsList.getGoods();
                        while (iterator.hasNext()) {
                            int id = (int) iterator.next();
                            Good good = new GoodDao().getGood(id);
                            if (good == null) {
                                throw new Exception();
                            }
                            out.print("<li>\n" +
                                    "                <p><a href=\"good.jsp?id=" + id + "\" target=\"_blank\" class=\"hot_sale_img\">\n" +
                                    "                    <img alt=\"" + good.getName() + "\" width=\"160\" height=\"160\" src=\"img/goods/logo/" + good.getImg() + "\">\n" +
                                    "                </a></p>\n" +
                                    "                <p><a href=\"good.jsp?id=" + id + "\" target=\"_blank\" class=\"name\" title=\"" + good.getName() + "\">" + good.getName() + "</a></p>\n" +
                                    "                <p class=\"price\"><em>￥</em>" + good.getPrice() + "</p>\n" +
                                    "            </li>\n");
                        }
                    }
                } catch (Exception e) {
                    out.print("");
                }
            %>
        </ul>
    </div>
</div>
<%@ include file="part3.jsp" %>