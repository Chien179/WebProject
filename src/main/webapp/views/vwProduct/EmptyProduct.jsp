<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Product.css">
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/views/JS/Product.js"></script>
    </jsp:attribute>
    <jsp:body>
        <div class="">
            <div class="row product__container">
                <div class="card-header bg-white mb-1 sticky-top product__header">
                    <h3 class="my-auto product__heading">KHÔNG CÓ SẢN PHẨM</h3>
            </div>
        </div>
    </jsp:body>
</t:main>

