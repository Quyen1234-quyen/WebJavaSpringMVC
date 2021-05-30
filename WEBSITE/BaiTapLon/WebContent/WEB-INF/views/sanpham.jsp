<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	$(document).ready(function(){
	});
</script>
	<div id="content"></div>
	<!-- Gio Hang-->
    <div id="shop" class="btn-shop">
            <a href="${pageContext.request.contextPath}/giohang">
                <span class="glyphicon glyphicon-shopping-cart cart">
                    <span class="soluong  ">
                        <c:out value="${sessionScope.myCartNum}"/>
                    </span>
                </span>
        
            </a>
    </div>
    <div class="lol" style="height: 100px;width:100px"></div>
    <!-- San Pham-->
    <section class="sanpham" id="sanpham">
        <h3 class="text-center">SẢN PHẨM</h3>
        <div class="container">
            <div class="row">
                <c:forEach var="p" items="${listp }">
                	<div class="col-md-3 sp">
	                    <div class="product" style="height: 400px">
	                        <div class="img">
	                            <img src="${pageContext.request.contextPath}/${p.img }" width="100%" />
	                        </div>
	                        <div>
	                            <h4 class="text-center"><c:out value="${p.name }"/></h4>
	                            <h6 class="text-center"><c:out value="${p.des }"/></h6>
	                            <p class="text-center"><c:out value="${p.price }"/>$</p>
	                        </div>
	                        <div class="text-center addtocart">
	                            	<a href="${pageContext.request.contextPath}/addsp/${p.id }">
	                            		<button >Add To Cart</button> 
	                            	</a>
	                            	   
	                        </div>
	                    </div>
                	</div>
                </c:forEach>
            </div>
        </div>
    </section>