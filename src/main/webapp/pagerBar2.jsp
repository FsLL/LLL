<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	function previousPage(page){
		if(page==1){
			return false;
		}
		page--;
		window.location.href = "/findNewsByPage/"+page;
	}

	function nextPage(page,pages){
		if(page==pages){
			return false;
		}
		page++;
		window.location.href = "/findNewsByPage/"+page;
	}
</script>
<div class="pages">
	 <a href="/findNewsByPage/1" class="p_pre">首页</a>
	 <a href="javascript:void(0);" onclick="previousPage(${requestScope.page})" class="p_pre">上一页</a>
	 <a href="javascript:void(0);" class="cur">${requestScope.page}/${requestScope.pages}</a>
	 <a href="javascript:void(0);" onclick="nextPage(${requestScope.page},${requestScope.pages})" class="p_pre">下一页</a>
	 <a href="/findNewsByPage/${requestScope.pages}" class="p_pre">尾页</a>
</div>