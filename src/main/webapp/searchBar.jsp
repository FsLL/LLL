<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript">
        $(function(){
            initCart();
        })
        function initCart(){
            var costArray = $(".cost");
            var totalCost = 0;
            for(var i=0;i<costArray.length;i++){
                var obj = costArray[i];
                obj = $(obj);
                var val = parseInt(obj.text());
                totalCost += val;
            }
            $("#totalCost").text(totalCost);
        }
    </script>
</head>
<body>
<div class="top">
    <div class="logo">
        <a href="/index"><img src="/images/logo.png"></a>
    </div>
    <div class="search">
        <form action="/product/search" method="post">
            <input type="text" name="keyWord" class="s_ipt">
            <input type="submit" value="搜索" class="s_btn">
        </form>
    </div>
    <div class="i_car">
        <a href="/product/findAllCartByUserId/${sessionScope.user.id}">
            <div class="car_t">
                购物车 [
                <span>
                    <c:if test="${sessionScope.user.carts==null || sessionScope.user.carts.size()==0}">空</c:if>
                    <c:if test="${sessionScope.user.carts!=null && sessionScope.user.carts.size()>0}">${sessionScope.user.carts.size()}</c:if>
            </span>]
            </div>
        </a>
        <div class="car_bg">
            <div class="un_login">我的购物车</div>
            <ul class="cars">
                <c:forEach items="${sessionScope.user.carts}" var="cart">
                    <li>
                        <div class="img"><a href="goodsList_getProductById?id=${cart.product.id}"><img src="/images/${cart.product.fileName }" width="58" height="58" /></a></div>
                        <div class="name"><a href="goodsList_getProductById?id=${cart.product.id}">${cart.product.name}</a></div>
                        <div class="price"><font color="#ff4e00">￥${cart.product.price}</font> X <span class="quantity">${cart.quantity}</span>  =  <span class="cost">${cart.cost}</span></div>
                    </li>
                </c:forEach>
            </ul>
            <div class="price_sum">共计&nbsp;<font color="#ff4e00">￥</font><span id="totalCost"></span></div>
            <div class="price_a"><a href="/cart/findByUserId">去结算</a></div>
        </div>
    </div>
</div>
</body>
</html>

