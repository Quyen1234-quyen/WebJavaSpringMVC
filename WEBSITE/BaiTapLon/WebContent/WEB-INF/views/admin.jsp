<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>LVQ Sports Shop</title>
	<script src="<c:url value="/static/js/jquery.min.js" />"></script>
		<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
			
		<link href="<c:url value="/static/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/font-awesome.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/header.css"/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/static/css/admin1.css"/>" rel="stylesheet" type="text/css"/>
	<link rel="shortcut icon" href="<c:url value="/static/logo/favicon.png"/>" type="image/x-icon" />
</head>
<body>
		<!-- Header -->
<div class="container-fluid">
        <jsp:include page="header.jsp"></jsp:include>
        <div class="row" id="menu" style="margin-top:80px">
            <h3 class="text-center">Admin
                <span>&nbsp;</span>
            </h3>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 task text-center .product">
                <a href="${pageContext.request.contextPath}/admin/product">
                    <i>
                        <span>Products</span>
                    </i>
                </a>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 task text-center .bill">
                <a href="${pageContext.request.contextPath}/admin/bill">
                    <i>
                        <span>Bill</span>
                    </i>
                </a>
            </div>
        </div>
        <div class="text-center">
            <a href="${pageContext.request.contextPath}/admin/product/them" class="btn" id="themsanpham">
                Thêm Sản Phẩm
            </a>
        </div>
        <div class="row tasks">
            <div class="col-md-12" >
                <!--table-->

                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Quản Lý Sản Phẩm</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row qlhd ">
                            <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5 text-center">
                                Sản Phẩm
                            </div>
                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                Loại
                            </div>
                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                                Gía
                            </div>
                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                Hành Động
                            </div>
                        </div>

                        <div class="row">
                           
                        <!--noi dung-->
                        <c:forEach var="p" items="${listsp }">
                        	<hr/>
                            <div class="row dong1 " style="margin-top:10px">
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong" ">
                                    <img  src="<c:url value="${p.img }"/>" width="70%"/>
                                </div>
                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 dong">
                                     ${p.name }    
                                </div>
                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 dong">
                                    ${p.idpc }
                                </div>
                                <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2 dong">
                                    ${p.price }
                                </div>
                                <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong">
                                    <a href="${pageContext.request.contextPath}/admin/product/suaSP/${p.id }">
                                        <span class="glyphicon glyphicon-pencil" style="margin-top:10px;font-size: 20px;color:green"></span>
                                    </a>
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="" data-toggle="modal" data-target="#myModal1">
                                        <span class="glyphicon glyphicon-remove" style="margin-top:10px;font-size: 20px;color:orange"></span>
                                    </a>
                                    <div id="myModal1" class="modal fade" role="dialog">
									    <div class="modal-dialog">
									  
									      <!-- Modal content-->
									      <div class="modal-content text-center">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									          <h4 class="modal-title">Bạn Có Thật Sự Muốn Xóa Sản Phẩm Này</h4>
									        </div>
									        <div class="modal-body text-center">
									            <button type="button" class="btn btn-default" data-dismiss="modal">Huy bo</button>
									            <a href='${pageContext.request.contextPath}/admin/product/xoa/${p.id}' class="btn btn-warning">Xoa</a>
									        </div>
									        
									      </div>
									  
									    </div>
									</div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>


    </div>
</body>
</html>