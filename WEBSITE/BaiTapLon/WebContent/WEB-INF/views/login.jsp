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
	<link href="<c:url value="/static/css/dangnhap.css"/>" rel="stylesheet" type="text/css"/>
	<link rel="shortcut icon" href="<c:url value="/static/logo/favicon.png"/>" type="image/x-icon" />
</head>
<body>
			 <div class="container">
        	<div id="form">
            
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h1 class="text-center" style="margin-bottom: 40px">Admin</h1>
                    <hr/>
                    <form role="form" action="${pageContext.request.contextPath}/admin/login" method="POST" style="margin:10px">
                        <div class="form-group">
                            <div class="input-group">
                                <input type="text" class="form-control"  placeholder="User" name="username" required>
                                <label style="background:rgb(27, 177, 40);color:white" class="input-group-addon glyphicon glyphicon-user"></label>
                            </div>
                        </div>
                        <!-- /.form-group -->

                        <div class="form-group">
                            <div class="input-group">
                                <input type="password" class="form-control"  placeholder="Password" name="password" required>
                                <label style="background:rgb(27, 177, 40);color:white" class="input-group-addon glyphicon glyphicon-lock"></label>
                            </div>
                            <!-- /.input-group -->
                        </div>
                       	<c:if test="${loi ==1 }">
                       		<p class="text-center" style="color:red">Username or Password is not correct</p>
                       	</c:if>
                        
                        <div class=" text-center">
                            <button type="submit" class="btn " style="background:rgb(27, 177, 40);color:white">ĐĂNG NHẬP</button>
                        </div>
                    </form>
                    
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>