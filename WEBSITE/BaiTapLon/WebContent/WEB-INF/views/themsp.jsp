<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                <title>Insert title here</title>
				<script src="<c:url value="/static/js/jquery.min.js" />"></script>
				<script src="<c:url value="/static/js/bootstrap.min.js" />"></script>
			
                <link href="<c:url value="/static/css/bootstrap.min.css "/>" rel="stylesheet" type="text/css" />
                <link href="<c:url value="/static/css/font-awesome.css "/>" rel="stylesheet" type="text/css" />
                <link href="<c:url value="/static/css/font-awesome.min.css "/>" rel="stylesheet" type="text/css" />
                <link href="<c:url value="/static/css/them1.css"/>" rel="stylesheet" type="text/css" />
            </head>

            <body>
                <div class="them">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            Them San Pham
                        </h3>
                    </div>
                    <div class="panel-body">

                        <form:form action="${pageContext.request.contextPath}/admin/product/them" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>Mã:</label>
                                <form:input type="text" class="form-control" placeholder="Nhap Mã" path="id" required="required"/>
                            </div>

                            <div class="form-group">
                                <label>Tên :</label>
                                <form:input type="text" class="form-control" placeholder="Nhap Tên" path="name" required="required"/>
                            </div>
                            <div class="form-group">
                                <label>Gia :</label>
                                <form:input type="number" class="form-control" placeholder="Nhap Gía" path="price" required="required"/>
                            </div>
                            <div className="form-group">
                                <label>Loại</label>
                                <form:select class="form-control" path="idpc" >
                                    <c:forEach var="pc" items="${listpc }">
                                        <option value="<c:out value="${pc.idpc } "/>">
                                            <c:out value="${pc.name }" />
                                        </option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="form-group">
                                <label>Ảnh</label>
                                <input class="form-control" name="file" type="file" accept=".jpg,.jpeg,.png" required="required"/>
                            </div>
                            <div class="form-group">
                                <label>Mô Tả</label>
                                <form:input class="form-control rounded-0" path="des" required="required"/>


                            </div>
                            <div class="text-center" style="margin-top:50px">
                                <button type="submit" class="btn btn-success">Luu Lai</button>
                                &nbsp;
                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/admin">Huy Bo</a>
                            </div>
                        </form:form>
                    </div>
                </div>
                </div>
                </div>

            </body>

            </html>