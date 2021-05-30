<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="content">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="row xemthem">
                    <!--tieu de-->
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                        <span id="xem">GIỎ HÀNG CỦA BẠN</span>
                    </div>
                    <!--tieu de-->
                </div>
            </div>
        </div>
        <!--giohang-->
        <div class="giohang">

            <div class="row tieude" style="border-bottom: 1px solid #000">
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center">Hành Động</p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center">Hình Ảnh</p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center">Tên</p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center">Gía</p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center">Số Lượng</p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center">Thành Tiền</p>
                </div>

            </div>

            <div>
            	
                	<c:forEach var="p" items="${list1}">
                		<c:forEach var="p1" items="${listp }">
                			<c:if test="${p.idp==p1.id }">
                				<div class="row" style="border-bottom:1px solid #000;padding: 20px 0px">
                        <!--xoa-->
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 giohang1">
                            <div class="row">
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-right">
                                    <a href="" data-toggle="modal" data-target="#myModal">
                                        <span class="fa fa-close"></span>
                                    </a>
									<div id="myModal" class="modal fade" role="dialog">
									    <div class="modal-dialog">
									  
									      <!-- Modal content-->
									      <div class="modal-content text-center">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									          <h4 class="modal-title">Bạn Có Thật Sự Muốn Xóa Sản Phẩm Này</h4>
									        </div>
									        <div class="modal-body text-center">
									            <button type="button" class="btn btn-default" data-dismiss="modal">Huy bo</button>
									            <a href='${pageContext.request.contextPath}/giohang/xoaSanPham/${p.idp }' class="btn btn-warning">Xoa</a>
									        </div>
									        
									      </div>
									  
									    </div>
									</div>
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 text-left">
                                    <span class="fa fa-heart"></span>
                                </div>
                            </div>

                        </div>
                        <!--xoa-->
                        <!--hinh anh-->
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 giohang2">

                            <div class="img text-center">
                               <img  src="${pageContext.request.contextPath}/<c:url value="${p1.img }"/>" width="100%"/>
                            </div>

                        </div>
                        <!--hinh anh-->
                        <!--tieude-->
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 giohang3 text-center">

                            <div>
                                <p>
                                    ${p1.name }
                                </p>
                            </div>

                        </div>
                        <!--tieude-->
                        <!--price-->
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 giohang4">
                            <p class="text-center">
                                ${p1.price }00 $
                            </p>
                        </div>
                        <!--price-->
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 giohang5 text-center">
                            <div>
                                &nbsp;
                                <a href="${pageContext.request.contextPath}/giohang/GiamSoLuong/${p.idp}" class="fa fa-minus">
                                </a>
                                &nbsp;
                                <span class="qty">
                                   <c:out value="${p.quantity }" />
                                </span>
                                &nbsp;
                                <a href="${pageContext.request.contextPath}/giohang/ThemSoLuong/${p.idp}" class="fa fa-plus">
                                </a>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 giohang6 text-center">
                            <p>
                                <c:out value="${p.quantity * p1.price }"/>00 $
                            </p>
                        </div>
                    </div>
                			</c:if>
                		</c:forEach>
                	</c:forEach>
                    
                    

            </div>
            <div class="row" id="tongtien" style="border-bottom: 1px solid #000">
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center"></p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center"></p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center"></p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center"></p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                    <p class="text-center">Tổng Tiền</p>
                </div>
                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 tongtien">
                    <p class="text-center">
                    	 <c:out value="${tongtien }"/>.000 $
                        <span>
                           </span>
                    </p>
                </div>

            </div>

            <div class="row xacnhan">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 text-left">
                    <a href="${pageContext.request.contextPath}/home.html" class="btn"style="background:rgb(231, 78, 17)" >
                        Tiếp Tục Mua Hàng
                    </a>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6  text-right">
                  
                    
                    <c:if test="${list1.size()==0}">
                    	<a href=""  id="xacnhan" style="background:rgb(231, 78, 17)">Xác Nhận Mua Hàng</a>
                    </c:if>
                    <c:if test="${list1.size()>0}">
                    	<a href="" data-toggle="modal" data-target="#myModal1" id="xacnhan" style="background:rgb(231, 78, 17)">Xác Nhận Mua Hàng</a>
                    </c:if>
                        
                    
                    <jsp:include page="xacnhanmuahang.jsp"></jsp:include>
                    
                </div>
                <script>
                    function loi(){
                        alert('Bạn Chưa Thêm Sản Phẩm Vào Giỏ Hàng');
                    }
                </script>
            </div>

        </div>

	<script type="text/javascript">
	$('#xacnhan').click(function(e){
		
		if(${list1.size()}==0){
			e.preventDefault();
			alert("Gio Hang Khong Co San Pham");
		}
	}) 
</script>
    </div>