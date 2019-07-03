<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="nav">
	<div class="nav_t">全部商品分类</div>
	<div class="leftNav">
		<ul>

			<c:forEach items="${categoryList}" var="level1">
				<li>
					<div class="fj">
						<span class="n_img"><span></span> <img src="" /></span> <span
							class="fl">${level1.name}</span>
					</div>
					<div class="zj">
						<div class="zj_l">

							<c:forEach items="${level1.productCategories}" var="level2">
								<div class="zj_l_c">
									<h2>
										<a href="/product/findByLevelId/${level2.type}/${level2.id}">${level2.name}</a>
									</h2>
									<c:forEach items="${level2.productCategories}" var="level3">
										<a href="/product/findByLevelId/${level3.type}/${level3.id}">${level3.name}</a>|
									</c:forEach>
								</div>
							</c:forEach>


						</div>
					</div>
				</li>
			</c:forEach>


		</ul>
	</div>
</div>
<ul class="menu_r">
	<li><a href="/index">首页</a></li>
	<c:forEach items="${categoryList}" var="productCategory">
		<li><a href="/product/findByLevelId/${productCategory.type}/${productCategory.id}">${productCategory.name}</a></li>
	</c:forEach>
</ul>
<div class="m_ad">中秋送好礼！</div>