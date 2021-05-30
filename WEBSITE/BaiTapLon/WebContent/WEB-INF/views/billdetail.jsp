<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>LVQ Sports Shop</title>
	<script src="<c:url value="/static/js/jquery.min.js" />"></script>
		<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
			
		<link href="<c:url value="/static/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/font-awesome.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/static/css/billdetail.css"/>" rel="stylesheet" type="text/css"/>
	<link rel="shortcut icon" href="<c:url value="/static/logo/favicon.png"/>" type="image/x-icon" />
</head>
<body>
	<form action="" method="" class=" form-horizontal">
        <h1 class="text-center">Thông Tin Đơn Hàng</h1>
        <hr/>
        	<div class="form-group">
                    <label class="control-label col-sm-4" for="email">Tên Khách Hàng :</label>
                    <div class="col-sm-4">
                        <input readonly="true" class="form-control" readonly="true" name="Idprod" value="${name }">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="email"> Số Điện Thoại :</label>
                    <div class="col-sm-4">
                        <input readonly="true" class="form-control" readonly="true" name="Idprod" value="${phone }">
                    </div>
                </div>
                <div class="form-group">
                        <label class="control-label col-sm-4" for="email">Địa Chỉ :</label>
                        <div class="col-sm-4">
                            <input readonly="true" class="form-control" readonly="true" name="Idprod" value="${address }">
                        </div>
                    </div>
            	<c:forEach var="bill" items="${listbillinfo }">
            		<c:forEach var="p" items="${product }">
            			<c:if test="${bill.idp==p.id }">
            			
            				<div class="form-group">
                <label class="control-label col-sm-4" for="email">Mã Sản Phẩm :</label>
                <div class="col-sm-4">
                    <input readonly="true" class="form-control" readonly="true" name="Idprod" value="${p.id }">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="email">Tên Sản Phẩm :</label>
                <div class="col-sm-4">
                    <input readonly="true" class="form-control" readonly="true" name="ten" value="${p.name }">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="email">Gía Sản Phẩm :</label>
                <div class="col-sm-4">
                    <input readonly="true" class="form-control" readonly="true" name="gia" value="${p.price }00$">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="email">Số Lượng :</label>
                <div class="col-sm-4">
                    <input readonly="true" class="form-control" readonly="true" name="quantity" value="${bill.quantity }">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="email">Hình Ảnh :</label>
                <div class="col-sm-8">
                    <img src="<c:url value="/${p.img }"/>" width="180px" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-4" for="email">Thành Tiền :</label>
                <div class="col-sm-4">
                    <input readonly="true" class="form-control" readonly="true" name="Idprod" value="${p.price*bill.quantity }00$">
                </div>
            </div>
            			</c:if>
            		</c:forEach>
            	</c:forEach>
            <hr/>
        	</div>
           </form>

                <div class="text-center">
                 <h4>Tong Tien : ${tong }.000$</h4>
                </div>
                <div class="text-center">
                <a href="${pageContext.request.contextPath}/admin/bill">
                	<button  class="btn text-center" style="margin-bottom: 10px">Quay Lại</button>
                </a>
                    
                </div>
    
</body>