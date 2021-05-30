<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<header class="header">
		<c:forEach var="prd" items="${list }">
			<c:out value="${prd.idpc }"/>
		</c:forEach>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <!-- Logo -->
                    <div id="logo">
                        <a href="${pageContext.request.contextPath}/">
                            <p class="text-center ">
                                <span>LVQ</span>
                                <i>Sport Shop</i>
                            </p>
                        </a>
                    </div>
                    <!-- Logo -->
                </div>
                <div class="col-md-6" style="padding: 0;margin:0px;">
                    <!-- Menu -->
                    <div id="menu">
                        <div class="menu_bar">
                            <a href="#">
                                <snan class="icon1">fdfsd</snan>
                            </a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li class="active">
                                <a href="#">TRANG CHỦ</a>
                            </li>

                            <li class="dropdown">

                                <a class=" dropdown-toggle" data-toggle="dropdown" >SẢN PHẨM
                                    <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu submenu">
                                    <c:forEach var="pc" items="${listpc }">
                                    	<li>
                                        	<a href="${pageContext.request.contextPath}/product/<c:out value="${pc.idpc }" />"><c:out value="${pc.name }"/></a>
                                    	</li>
                                    </c:forEach>
                                </ul>

                            </li>
                            <li>
                                <a href="#blog">BLOG</a>
                            </li>
                            <li>
                                <a href="#gioithieu">GIỚI THIỆU</a>
                            </li>
                            <li>
                                <a href="#lienhe">LIÊN HỆ</a>
                            </li>

                        </ul>

                    </div>
                    <!-- Menu -->
                </div>
                <div class="col-md-3">
                    <div id="form">
                        <div class="search-box navbar-form ">
                            <form class="serach-from" action="/BaiTapLon/timsp" method="POST">
                                <input type="text" class="form-control" placeholder="...Search Products" name="key" required/>
                                <button type="submit" class="btn search-btn">
                                    <i class="glyphicon glyphicon-search"></i>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>