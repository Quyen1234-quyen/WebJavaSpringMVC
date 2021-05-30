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
	<div class="container-fluid">

        <jsp:include page="header.jsp"></jsp:include>

        <div class="row" id="menu" style="margin-top:100px">
          
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 task text-center .product">
                <a href="${pageContext.request.contextPath}/admin/product">
                    <i >
                        <span>Products</span>
                    </i>
                </a>
            </div>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 task text-center .bill">
                <a href="${pageContext.request.contextPath}/admin/bill">
                    <i >
                        <span>Bill</span>
                    </i>
                </a>
            </div>
        </div>

        <div class="row tasks">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3>Danh Sách Hóa Đơn Chưa Được Duyệt </h3>
                <!--table-->
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Quản Lý Hóa Đơn</h3>
                    </div>
                    <div class="panel-body text-center">

                        <div class="row qlhd" >
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                Mã Bill
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                Ngày
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                Tình Trạng
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                Hành Động
                            </div>
                        </div>

			
                       <c:forEach var="bill" items="${listbill }">
                      		<c:if test="${bill.status==0 }">
                      			<hr/>
                                <div class="row dong1" style="margin-top:10px">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong">
                                        <c:out value="${bill.idbill }"/>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong">
                                        <c:out value="${bill.date }"/>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong">
                                        <label class="label label-danger">
                                 			False
                                        </label>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong">
                                        <a href="${pageContext.request.contextPath}/admin/bill/billdetail/${bill.idbill}"  class="label label-success">
                                            Xem
                                        </a>
                                        
                                        &nbsp;

                                        <a href="${pageContext.request.contextPath}/admin/bill/updatebill/${bill.idbill}" class="label label-success ">
                                            Duyệt
                                        </a>

                                        &nbsp;
                                        <a href='' data-toggle="modal" data-target="#myModal3" class="label label-warning">
                                            Xoa
                                        </a>
                                        <div id="myModal3" class="modal fade" role="dialog">
									    <div class="modal-dialog">
									  
									      <!-- Modal content-->
									      <div class="modal-content text-center">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									          <h4 class="modal-title">Bạn Có Thật Sự Muốn Xóa Sản Phẩm Này</h4>
									        </div>
									        <div class="modal-body text-center">
									            <button type="button" class="btn btn-default" data-dismiss="modal">Huy bo</button>
									            <a href='${pageContext.request.contextPath}/admin/bill/xoabill/${bill.idbill}' class="btn btn-warning">Xoa</a>
									        </div>
									        
									      </div>
									  
									    </div>
									</div>
                                    </div>
                                </div>
                      		</c:if>
                       		
                       
                       </c:forEach>

                            

                    </div>
                </div>

            </div>


            <!---->
        </div>

        <!--nhung don hang da duyet-->
        <div class="row tasks">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <h3>Danh Sách Sản Phẩm Đã Được Duyệt </h3>
                <!--table-->
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">Quản Lý Hóa Đơn</h3>
                    </div>
                    <div class="panel-body text-center">

                        <div class="row qlhd">
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                Mã Bill
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                Ngày
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                Tình Trạng
                            </div>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                Hành Động
                            </div>
                        </div>

                        <div class="row">
                            <c:forEach var="bill" items="${listbill }">
                      		<c:if test="${bill.status==1 }">
                      			<hr/>
                                <div class="row dong1" style="margin-top:10px">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong">
                                        <c:out value="${bill.idbill }"/>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong">
                                        <c:out value="${bill.date }"/>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong">
                                        <label class="label label-success">
                                        	True
                                        </label>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 dong">
                                        <a href='${pageContext.request.contextPath}/admin/bill/billdetail/${bill.idbill}' class="label label-success " >
                                            Xem
                                        </a>
                                       
                                        &nbsp;

                                        <a href="" class="label label-success " data-toggle="modal" data-target="#myModal5">
                                            Duyệt
                                        </a>
										<div id="myModal5" class="modal fade" role="dialog">
									    <div class="modal-dialog">
									  
									      <!-- Modal content-->
									      <div class="modal-content text-center">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									          <h4 class="modal-title">San Pham Dang Duoc Giao </h4>
									        </div>
									        <div class="modal-body text-center">
									            <button type="button" class="btn btn-default" data-dismiss="modal">Xong</button>
									            
									        </div>
									        
									      </div>
									  
									    </div>
									</div>
                                        &nbsp;
                                        
                                        <a href='' data-toggle="modal" data-target="#myModal6" class="label label-warning">
                                            Xoa
                                        </a>
                                        
                                        <div id="myModal6" class="modal fade" role="dialog">
									    <div class="modal-dialog">
									  
									      <!-- Modal content-->
									      <div class="modal-content text-center">
									        <div class="modal-header">
									          <button type="button" class="close" data-dismiss="modal">&times;</button>
									          <h4 class="modal-title">Bạn Có Thật Sự Muốn Xóa Sản Phẩm Này</h4>
									        </div>
									        <div class="modal-body text-center">
									            <button type="button" class="btn btn-default" data-dismiss="modal">Huy bo</button>
									            <a href='${pageContext.request.contextPath}/admin/bill/xoabill/${bill.idbill}' class="btn btn-warning">Xoa</a>
									        </div>
									        
									      </div>
									  
									    </div>
									</div>
                                    </div>
                                </div>
                      		</c:if>
                       		
                       
                       </c:forEach>
                        </div>


                    </div>
                </div>

            </div>
			

            <!---->
        </div>
        

</body>
</html>