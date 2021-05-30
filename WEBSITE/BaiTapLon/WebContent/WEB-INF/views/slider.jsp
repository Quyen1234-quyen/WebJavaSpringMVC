<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="slide" >
        <div class="black"></div>
        <div class="content">
            <h1>WelCome To
                <span class="type"></span>
            </h1>
            <script src="<c:url value="/static/js/typed.js" />"></script>
            <script type="text/javascript">
                var typed = new Typed(".type", {
                    strings: ["LVQ Sports Shop"],
                    typeSpeed: 60,
                    backSpeed: 60,
                    loop: true
                });
            </script>
            <div>
                <h2 class="text-center">About Me</h2>
            </div>
            <ul>
                <li>
                    <a href="#">
                        <span class="fa fa-facebook"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="fa fa-github"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="fa fa-youtube"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="fa fa-twitter"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="fa fa-pinterest"></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="fa fa-linkedin"></span>
                    </a>
                </li>
            </ul>
        </div>

    </section>