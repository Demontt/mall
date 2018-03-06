<%@ page import="dao.AnalysisSearchDao" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="dao.GoodsListDao" %>
<%@ page import="model.*" %>
<%@ page import="dao.GoodDao" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String k = request.getParameter("k");
    String brand = request.getParameter("brand");
    String taste = request.getParameter("taste");
    String city = request.getParameter("city");
    String sort = request.getParameter("sort");
    String low = request.getParameter("low");
    String high = request.getParameter("high");
    boolean k_isSet = false;
    boolean brand_isSet = false;
    boolean taste_isSet = false;
    boolean city_isSet = false;
    boolean sort_isSet = false;
    boolean price_isSet = false;
    if (k != null && !k.equals("") && !k.equals("null")) {
        k_isSet = true;
    }
    if (brand != null && !brand.equals("") && !brand.equals("null")) {
        brand_isSet = true;
    }
    if (taste != null && !taste.equals("") && !taste.equals("null")) {
        taste_isSet = true;
    }
    if (city != null && !city.equals("") && !city.equals("null")) {
        city_isSet = true;
    }
    if (sort != null && !sort.equals("") && !sort.equals("null")) {
        sort_isSet = true;
    }
    if (low != null && !low.equals("") && !low.equals("null") && high != null && !high.equals("") && !high.equals("null")) {
        price_isSet = true;
    }
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>饱了么</title>
    <link rel="stylesheet" href="css/index.css" type="text/css">
    <link rel="stylesheet" href="css/menu.css" type="text/css">
    <link rel="stylesheet" href="css/page.css" type="text/css">
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/header.js"></script>
    <script type="text/javascript" src="js/page.js"></script>
</head>
<%@ include file="part1.jsp" %>
                <h3><a href="" class="all_class">商品分类</a></h3>
                <div class="menu_sp">
<%@ include file="part2.jsp" %>
        </div>
    </div>
</div>
<div class="main_wrap">
    <div class="wrap_right">
        <div class="wrap_right_top">
            <div class="crumbs">当前位置：
                <span><a title="首页" href="index.jsp">首页</a></span>
                <span class="partation">&gt;</span>
                <span>全部商品</span>
            </div>
            <div id="close_div" class="sort fixed mt10">
                <a onclick="window.location.href='page.jsp'" class="re_filter">重置筛选条件</a>
                <dl style="border:none" class="fixed">
                    <dt>品牌：</dt>
                    <dd>
                        <span class="<% out.print(brand_isSet?"":"on"); %>" onclick="init('brand')">不限</span>
                        <%
                            try {
                                AnalysisSearch analysisSearch = new AnalysisSearch("brand");
                                analysisSearch = new AnalysisSearchDao().getResult(analysisSearch);
                                if (analysisSearch.isEmpty()) {
                                    throw new Exception();
                                } else {
                                    Iterator iterator = analysisSearch.getResults();
                                    while (iterator.hasNext()) {
                                        String this_brand = (String) iterator.next();
                                        boolean this_brand_isOn = brand_isSet && this_brand.equals(brand);
                                        out.print("<span onclick=\"add('brand', '" + this_brand + "')\" class=" + (this_brand_isOn ? "on" : "") + ">" + this_brand + "</span>");
                                    }
                                }
                            } catch (Exception e) {
                                out.print("");
                            }
                        %>
                    </dd>
                </dl>

                <dl class="fixed">
                    <dt>口味：</dt>
                    <dd>
                        <span onclick="init('taste')" class="<% out.print(taste_isSet?"":"on"); %>">不限</span>
                        <%
                            try {
                                AnalysisSearch analysisSearch = new AnalysisSearch("taste");
                                analysisSearch = new AnalysisSearchDao().getResult(analysisSearch);
                                if (analysisSearch.isEmpty()) {
                                    throw new Exception();
                                } else {
                                    Iterator iterator = analysisSearch.getResults();
                                    while (iterator.hasNext()) {
                                        String this_taste = (String) iterator.next();
                                        boolean this_taste_isOn = taste_isSet && this_taste.equals(taste);
                                        out.print("<span onclick=\"add('taste', '" + this_taste + "')\" class=" + (this_taste_isOn ? "on" : "") + ">" + this_taste + "</span>");
                                    }
                                }
                            } catch (Exception e) {
                                out.print("");
                            }
                        %>
                    </dd>
                </dl>
                <dl class="fixed">
                    <dt>产地：</dt>
                    <dd>
                        <span onclick="init('city')" class="<% out.print(city_isSet?"":"on"); %>">不限</span>
                        <%
                            try {
                                AnalysisSearch analysisSearch = new AnalysisSearch("city");
                                analysisSearch = new AnalysisSearchDao().getResult(analysisSearch);
                                if (analysisSearch.isEmpty()) {
                                    throw new Exception();
                                } else {
                                    Iterator iterator = analysisSearch.getResults();
                                    while (iterator.hasNext()) {
                                        String this_city = (String) iterator.next();
                                        boolean this_city_isOn = city_isSet && this_city.equals(city);
                                        out.print("<span onclick=\"add('city', '" + this_city + "')\" class=" + (this_city_isOn ? "on" : "") + ">" + this_city + "</span>");
                                    }
                                }
                            } catch (Exception e) {
                                out.print("");
                            }
                        %>
                    </dd>
                </dl>
            </div>
            <div class="rank mt10">
                <ul class="fl">
                    <li><b><a>排序：</a></b></li>
                    <li<%out.print(sort_isSet&&sort.equals("amount")?" style='border-top: solid #ff0000 3px;'":"");%>><span onmouseover="this.style.cursor='pointer'" title="点击之后按销量从高到低排列" onclick="sortBy('amount', '<% out.print(sort_isSet&&sort.equals("amount")?"off":""); %>')">销量</span></li>
                    <li<%out.print(sort_isSet&&sort.equals("price")?" style='border-top: solid #ff0000 3px;'":"");%>><span onmouseover="this.style.cursor='pointer'" title="点击之后按价格从高到低排列" onclick="sortBy('price', '<% out.print(sort_isSet&&sort.equals("price")?"off":""); %>')">价格</span></li>
                    <li>价格区间: <input type="text" name="lowprice" id="lowprice" class="input" value="<%out.print(price_isSet?low:"");%>"> - <input
                            type="text" name="upprice" id="upprice" class="input" value="<%out.print(price_isSet?high:"");%>">
                        <a style="cursor: pointer" onclick="submit()" class="btn_fix">确定</a><span id="errText" style="color: #ff0000; margin-left: 20px"></span></li>
                </ul>
            </div>
            <div class="snack_wrap fixed">
                <ul>
                    <%
                        try {
                            GoodsSearch goodSearch = new GoodsSearch("");
                            boolean flag = k_isSet || brand_isSet || taste_isSet || city_isSet || sort_isSet || price_isSet;
                            if (!flag) {
                                goodSearch = new GoodsSearch("*");
                            } else {
                                if (k_isSet) {
                                    goodSearch.setName(k);
                                }
                                if (brand_isSet) {
                                    goodSearch.setBrand(brand);
                                }
                                if (taste_isSet) {
                                    goodSearch.setTaste(taste);
                                }
                                if (city_isSet) {
                                    goodSearch.setCity(city);
                                }
                                if (sort_isSet) {
                                    goodSearch.setSort(sort, "DESC");
                                }
                                if (price_isSet) {
                                    goodSearch.setPrice(low, high);
                                }
                            }
//                            System.out.println(goodSearch);
                            GoodsList goodsList = new GoodsListDao().getGoodsList(goodSearch);
                            if (!goodsList.isEmpty()) {
                                Iterator iterator = goodsList.getGoods();
                                while (iterator.hasNext()) {
                                    int id = (int) iterator.next();
                                    Good good = new GoodDao().getGood(id);
                                    if (good == null) {
                                        throw new Exception();
                                    }
                                    out.print("<li>\n" +
                                            "                        <a class=\"img\" title=\"" + good.getName() + "\" target=\"_blank\" href=\"good.jsp?id=" + id + "\">\n" +
                                            "                            <img src=\"img/goods/logo/" + good.getImg() + "\">\n" +
                                            "                        </a>\n" +
                                            "                        <p class=\"name\">" + good.getName() + "</p>\n" +
                                            "                        <p class=\"price\">￥" + good.getPrice() + "\n" +
                                            "                            <del>￥");
                                    out.print(good.getPrice() + 10);
                                    out.print("</del>\n" +
                                            "                        </p>\n" +
                                            "                        <p class=\"btn\">\n" +
                                            "                            <a href=\"cart?id=" + id + "&amount=1\" class=\"btn_cart\">加入购物车</a>\n" +
                                            "                            <a href=\"#\" class=\"btn_collect\">收藏</a>\n" +
                                            "                        </p>\n" +
                                            "                    </li>\n");
                                }
                            } else {
                                throw new Exception();
                            }

                        } catch (Exception e) {
                            out.print("<div style=\"width:100%; height:100px; margin: 0 auto; text-align:center; padding-top:50px\"><span style=\"margin: 12px; color: #e61952;font-size: 24px;\">没有您所需要的信息！</span></div>");
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</div>
<%@ include file="part3.jsp" %>