<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page isELIgnored="false" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>
<%--    <script type="text/javascript" src="/js/productDetail.js"></script>--%>
    <script type="text/javascript">
        $(function(){
            $(".type").click(function(){
                $(".type").removeClass("checked");
                $(this).addClass("checked");
            });

            $(".color").click(function(){
                $(".color").removeClass("checked");
                $(this).addClass("checked");
            });
        });
        
        function add(stock) {
            var val = $("#quantity").val();
            if(stock == val){
                alert("库存不足！");
                return false;
            }
            val++;
            $("#quantity").val(val);
        }

        function sub(){
            var val = $("#quantity").val();
            if(val == 1){
                return false;
            }
            val--;
            $("#quantity").val(val);
        }

        function addCart(id,price){
            var quantity = $("#quantity").val();
            var cost = price*quantity;
            window.location.href= "/cart/add/"+id+"/"+quantity+"/"+cost;
        }
        
    </script>
    <script type="text/javascript">
    	$(function(){
    		$(".nav").hover(function(){						   
				$(this).find(".leftNav").show();
			},function(){
				$(this).find(".leftNav").hide();
			});
			$(".leftNav ul li").hover(
				function(){
					$(this).find(".fj").addClass("nuw");
					$(this).find(".zj").show();
				}
				,
				function(){
					$(this).find(".fj").removeClass("nuw");
					$(this).find(".zj").hide();
				}
			);
    	})
    </script>
    <title>易买网</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="searchBar">
    <%@ include file="searchBar.jsp" %>
</div>
<div class="menu_bg">
    <div class="menu">
        <%@ include file="categoryBar.jsp" %>
    </div>
</div>
<div class="i_bg">
    <div class="postion">
    </div>
    <div class="content" style="margin-left: 230px">
        <div id="tsShopContainer" style="float:left;">
            <div id="tsImgS">
                <a href="" title="Images" class="MagicZoom" id="MagicZoom">
                    <img src="/images/${product.fileName }" width="390" height="390" style="border:1px solid #EAEAEA;"/>
                </a>
            </div>
        </div>
        <div class="pro_des">
            <div class="des_name">
                <input type="hidden" value="${product.id}"  name="entityId" class="n_ipt"/>
                <p>${product.name }</p>
                “开业巨惠，北京专柜直供”，不光低价，“真”才靠谱！
            </div>
            <div class="des_price">
                本店价格：<b>￥${product.price }</b><br/>
            </div>
           <div class="des_price">
                库存：<b>${product.stock }</b><br/>
            </div>
            <div class="des_choice">
                <span class="fl">型号选择：</span>
                <ul>
                    <li class="type">30ml
                        <div class="ch_img"></div>
                    </li>
                    <li class="type checked">50ml
                        <div class="ch_img"></div>
                    </li>
                    <li class="type">100ml
                        <div class="ch_img"></div>
                    </li>
                </ul>
            </div>
            <div class="des_choice">
                <span class="fl">颜色选择：</span>
                <ul>
                    <li class="color">红色
                        <div class="ch_img"></div>
                    </li>
                    <li class="color checked">白色
                        <div class="ch_img"></div>
                    </li>
                    <li class="color">黑色
                        <div class="ch_img"></div>
                    </li>
                </ul>
            </div>
            <br>
            <br>
            <div class="des_join">
                <div class="j_nums">
                    <input type="text" id="quantity"   value="1"  name="quantity" class="n_ipt"/>
                    <input type="button" value="" onclick="add(${product.stock})" class="n_btn_1"/>
                    <input type="button" value="" onclick="sub()" class="n_btn_2"/>
                    <input type="hidden" name="productStock" value="100">
                </div>
                <span class="fl">
                     <img src="/images/j_car.png" onclick="addCart(${product.id},${product.price})"/>
                </span>
            </div>
        </div>
    </div>
    <div class="content mar_20">
        <div id="favoriteList">
        </div>
        <div class="l_list">
            <div class="des_border">
                <div class="des_tit">
                    <ul>
                        <li class="current"><a href="#p_attribute">商品属性</a></li>
                        <li><a href="#p_details">商品详情</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">
                    <table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;"
                           cellspacing="0" cellpadding="0">
                        <tr>
                            <td>商品名称：${product.name }</td>
                            <td>商品价格：${product.price }</td>
                            <td>品牌： 迪奥（Dior）</td>
                            <td>上架时间：2015-09-06 09:19:09 </td>
                        </tr>
                        <tr>
                            <td>商品毛重：160.00g</td>
                            <td>商品产地：法国</td>
                            <td>香调：果香调香型：淡香水/香露EDT</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>容量：1ml-15ml </td>
                            <td>类型：女士香水，Q版香水，组合套装</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="des_border" id="p_details">
                <div class="des_t">商品详情</div>
                <div class="des_con">
                    <table border="0" align="center" style="width:745px; font-size:14px; font-family:'宋体';" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                               	${product.name }
                            </td>
                        </tr>
                    </table>
                    <p align="center">
                        <img src="/images/${product.fileName }" width="185" height="155">
                    </p>
                </div>
            </div>
        </div>
    </div>
    <script>
        favoriteList();
    </script>
    <%@ include file="footer.jsp" %>
</div>
</body>
</html>
