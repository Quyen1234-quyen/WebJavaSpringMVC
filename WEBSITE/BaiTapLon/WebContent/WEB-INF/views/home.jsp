<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>LVQ Sports Shop</title>
		<script src="<c:url value="/static/js/jquery.min.js" />"></script>
		<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
			
		<link href="<c:url value="/static/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/font-awesome.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/header.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/slide.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/sanpham.css"/>" rel="stylesheet" type="text/css"/>
		<link href="<c:url value="/static/css/footer.css"/>" rel="stylesheet" type="text/css"/>
		<link rel="shortcut icon" href="<c:url value="/static/logo/favicon.png"/>" type="image/x-icon" />
		<script type="text/javascript">
        $(document).ready(function(){
            //back to top
            //check to see if the window is top if not then display button
            $(window).scroll(function () {
                if ($(this).scrollTop() > 400) {
                  	$('.header').addClass('active').animate({opacity:.8}); 
                    $('.btn-shop').addClass('active');
                    $('.btn-shop').fadeIn(500);
                }
                else {
                    $('.header').removeClass('active');
                    $('.btn-shop').fadeOut(500);
                }
                $('.dropdown ').on('click', function() {
               	 
           		 if ($(this).scrollTop() > 400) {
                        $('.submenu').addClass('active').animate({opacity:1});
                        return true;
                    }
                    else{
                        $('.submenu').removeClass('active')
                    }
           	 
              
           });
            })
            
            
        })
    </script>
	</head>
	<body>
			<jsp:include page="header.jsp"></jsp:include>
			<jsp:include page="slider.jsp"></jsp:include>
			<jsp:include page="sanpham.jsp"></jsp:include>
			
	</body>
</html>