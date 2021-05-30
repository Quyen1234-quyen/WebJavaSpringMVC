<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="myModal1" class="modal fade" role="dialog">
	 <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Xác Nhận Mua Hàng</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body ">
                    <form:form  action="${pageContext.request.contextPath}/giohang/xacnhanmuahang" method="GET">
                        <div class="form-group">
                            <input name="name" class="form-control" placeholder="Nhap Tên"   required />
                        </div>

                        <div class="form-group">
                            <input class="form-control" placeholder="Nhap Email" name="email"  required />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Nhap Số Điện Thoại" name="phone"  required />
                        </div>
                        <div class="form-group">
                            <input class="form-control" placeholder="Nhap Địa Chỉ" name="address"  required />
                        </div>
						
                        <div class="text-center" style="color:red">
                            <p>(*) Kiểm Tra Kỹ Thông Tin Trước Khi Xác Nhận Mua Hàng</p>
                            <p>(*) Sau khi xác nhận bạn nhớ kiểm tra mail</p>
                         
                        </div>
                        <div id="giohang">
                            <div style="margin-top:10px">
                                <div class="row" style="border-bottom: 1px solid #000" id="tieude">
                                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                        <p class="text-center">Hành Động</p>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                        <p class="text-center">Hình Ảnh</p>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                        <p class="text-center">Tên</p>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                        <p class="text-center">Gía</p>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                        <p class="text-center">Số Lượng</p>
                                    </div>
                                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                        <p class="text-center">Thành Tiền</p>
                                    </div>

                                </div>
                               	<c:forEach var="p" items="${list1}">
                					<c:forEach var="p1" items="${listp }">
                						<c:if test="${p.idp==p1.id }">
                                    <div class="row" style="border-bottom:1px solid #000;padding: 20px 0px">
                                        <!--xoa-->
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 ">
                                            <div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                                    <a href='/xoaSPgh/'>
                                                        <span class="fa fa-close"></span>
                                                    </a>
                                                </div>

                                            </div>

                                        </div>
                                        <!--xoa-->
                                        <!--hinh anh-->
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 ">

                                            <div class="img text-center">
                                                 <img  src="${pageContext.request.contextPath}/${p1.img }" width="100%"/>
                                            </div>

                                        </div>
                                        <!--hinh anh-->
                                        <!--tieude-->
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2  text-center">

                                            <div>
                                                <p>
                                                    ${p1.name }
                                                </p>
                                            </div>

                                        </div>
                                        <!--tieude-->
                                        <!--price-->
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 ">
                                            <p class="text-center">
                                                ${p1.price }00 $
                                            </p>
                                        </div>
                                        <!--price-->
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2  text-center">
                                            <div id="sl">
                                                &nbsp;
                                                <a href="/GiamSoLuong/" class="fa fa-minus">
                                                </a>
                                                &nbsp;
                                                <span class="qty">
                                                    <c:out value="${p.quantity }" />
                                                </span>
                                                &nbsp;
                                                <a href="/ThemSoLuong/" class="fa fa-plus">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2  text-center">
                                            <p>
                                                <c:out value="${p.quantity * p1.price }"/>00 $
                                            </p>
                                        </div>
                                    </div>
                                    </c:if>
                					</c:forEach>
                				</c:forEach>
                            </div>
                        </div>
                        <div class="text-center" style="margin-top:20px">
                            	<button  class="btn " style="background:rgb(231, 78, 17);color:white">
                            	
                            	XÁC NHẬN
                            
                            	</button>
                           
                            <a href="${pageContext.request.contextPath}/giohang" class="btn " id="huybo">HỦY BỎ</a>
                        </div>
                        <div class="modal-footer d-flex justify-content-center text-center">
                            <div class="text-center" style="color:red">

                                <p>(*) Kiểm Tra Kỹ Thông Tin Trước Khi Xác Nhận Mua Hàng</p>
                                <p>(*) Sau khi xác nhận bạn nhớ kiểm tra mail</p>
                                
                            </div>
                        </div>
                    </form:form>

                </div>

            </div>
        </div>
									</div>