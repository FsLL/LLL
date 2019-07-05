<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<%@ include file="header.jsp"%>
	<%@ include file="searchBar.jsp"%>
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@ include file="leftBar.jsp"%>
			<div class="m_right">
				<p></p>
				<div class="mem_tit">资讯列表</div>
				<table border="0" class="order_tab"
					style="width: 930px; text-align: center; margin-bottom: 30px;"
					cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td width="15%">地址编号</td>
							<td width="15%">具体信息</td>
							<td width="15%">创建时间</td>
							<td width="15%">备注</td>
							<td width="15%">默认地址</td>
							<td width="25%">操作</td>
						</tr>
						<c:forEach items="${requestScope.list}" var="address">
							<tr>
								<td>${address.id}</td>
								<td>${address.address}</td>
								<td>${address.createTime}</td>
								<td>${address.remark}</td>
								<td>
									<c:if test="${address.isDefault == 1}">
										是
									</c:if>
									<c:if test="${address.isDefault == 0}">
										否
									</c:if>
								</td>
								<td>
									<a href="/deleteByAddressId/${address.id}">删除</a>
									<a href="">修改</a>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>