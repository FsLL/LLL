<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%@ include file="header.jsp"%>
	<script type="text/javascript">
        $(function() {
            $(".nav").hover(function() {
                $(this).find(".leftNav").show();
            }, function() {
                $(this).find(".leftNav").hide();
            });
            $(".leftNav ul li").hover(function() {
                $(this).find(".fj").addClass("nuw");
                $(this).find(".zj").show();
            }, function() {
                $(this).find(".fj").removeClass("nuw");
                $(this).find(".zj").hide();
            });
        })
	</script>
	<title>易买网</title>
</head>
<body>
<div id="searchBar">
	<%@ include file="searchBar.jsp"%>
</div>
<div class="menu_bg">
	<div class="menu">
		<%@ include file="categoryBar.jsp"%>
	</div>
</div>
<div class="i_bg">
	<div class="content mar_20">
		<div id="favoriteList"></div>
		<div class="l_list">
			<div class="list_t">
				<span class="fr">共发现${products.size()}件</span>
			</div>
			<div class="list_c">
				<ul class="cate_list">
					<c:forEach items="${products}" var="product">
						<li>
							<div class="name">
								<a href="/product/findById/${product.id}">${product.name}</a>
							</div>
							<div class="price">
								<font>￥<span>${product.price}</span></font> &nbsp;
							</div>
							<div class="img">
								<a href="/product/findById/${product.id}">
									<img src="/images/${product.fileName} " width="185"
										 height="155" />
								</a>
							</div>
							<div class="carbg">
								<a href="javascript:void(0);" class="ss" >收藏</a>
								<a href="javascript:void(0);" class="j_car" >加入购物车</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>
