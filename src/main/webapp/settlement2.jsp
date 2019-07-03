<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
        $(function(){
            var array = $(".qprice");
            var totalCost = 0;
            for(var i = 0;i < array.length;i++){
                var val = parseInt($(".qprice").eq(i).html().substring(1));
                totalCost += val;
            }
            $("#totleprice").html("￥"+totalCost);
            $("#settlement2_totalCost").val(totalCost);
            //给cost赋值
            var totleprice = $("#totleprice").text();
            totleprice = totleprice.substring(1);
            $("input[name=cost]").val(totleprice);
        });
	</script>
	<title>易买网</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="searchBar">
	<%@ include file="searchBar.jsp" %>
</div>
<div class="i_bg">
	<div id="settlement">

		<div class="content mar_20">
			<img src="/images/img2.jpg"/>
		</div>
		<div class="content mar_20">
			<div class="two_bg">
				<div class="two_t">
					<span class="fr"><a href="/cart/findByUserId">修改</a></span>商品列表
				</div>
				<table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="car_th" width="550">商品名称</td>
						<td class="car_th" width="150">购买数量</td>
						<td class="car_th" width="130">小计</td>
					</tr>

					<c:forEach items="${cartList}" var="cart">
						<tr>
							<td align="center">
								<div class="c_s_img">
									<img src="/images/${cart.product.fileName}" width="73" height="73"/>
								</div>
									${cart.product.name}
							</td>
							<td align="center">${cart.quantity}</td>
							<td align="center" class="qprice" style="color:#ff4e00;">￥${cart.cost}</td>
						</tr>
					</c:forEach>

				</table>

				<div class="two_t">
					<span class="fr"></span>收货人信息
				</div>
				<table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
					<tr>
						<td class="p_td" width="160">用户名称</td>
						<td width="395">${sessionScope.user.userName}</td>
						<td class="p_td">登录名称</td>
						<td>${sessionScope.user.loginName}</td>
					</tr>
					<tr>
						<td class="p_td">手机</td>
						<td>${sessionScope.user.mobile}</td>
						<td class="p_td" width="160">电子邮件</td>
						<td width="395">${sessionScope.user.email}</td>
					</tr>
				</table>
				<div class="two_t">
					<span class="fr"></span>选择地址
				</div>
				<form id="form" action="/order/settlement" method="post">
					<input type="hidden" name="cost"/>
					<table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">

						<c:forEach items="${addressList}" var="address">
							<tr>
								<td class="p_td" width="160">

									<input type="radio" name="selectAddress"

									<c:if test="${address.isDefault == 1}">
										   checked
									</c:if>

										   value="${address.address}">

								</td>
								<td>
										${address.address}
								</td>
							</tr>
						</c:forEach>

						<tr>
							<td class="p_td" width="160">
								新地址<input type="radio" name="selectAddress" value="newAddress">
							</td>
							<td>
								地址 <input type="text" value="" name="address" class="add_ipt"> 
								备注 <input type="text" value="" name="remark" class="add_ipt">
							</td>
						</tr>

					</table>
					<table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
						<tr height="70">
							<td align="right">
								<b style="font-size:14px;">应付款金额：<span id="totleprice" style="font-size:22px; color:#ff4e00;"></span></b>
							</td>
						</tr>
						<tr height="70">
							<td align="right"><a href="javascript:void(0);" onclick="settlement3();"><img
									src="/images/btn_sure.gif"/></a></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
        function settlement3() {
            $("#form").submit();
        }
	</script>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>
