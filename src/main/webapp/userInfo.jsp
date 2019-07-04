<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="searchBar.jsp" %>
<div class="i_bg bg_color">
    <div class="m_content">
        <%@ include file="leftBar.jsp"%>
        <div class="m_right" id="content">
            <div class="m_des">
                <table border="0" style="width:870px; line-height:22px;" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td width="115"><img src="/images/${sessionScope.user.fileName}" width="90" height="90" /></td>
                        <td>
                            <div class="m_user">${sessionScope.user.userName}</div><br />
                            <p>
                                性别:
                                <c:if test="${sessionScope.user.sex == 1}">男</c:if>
                                <c:if test="${sessionScope.user.sex == 0}">女</c:if>
                                <br /><br />
                                邮箱:${sessionScope.user.email}<br /><br />
                                电话:${sessionScope.user.mobile}<br /><br />
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</div>
</body>
</html>

















