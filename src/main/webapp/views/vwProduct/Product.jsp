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
                    <h3 class="my-auto product__heading">SẢN PHẨM HIỆN CÓ</h3>
                </div>
                <div class="product__body">
                    <c:forEach begin="0" end="${products.size()-1}" varStatus="loop" var="i">
                        <div class="card card border-secondary h-60 product__body-item">
                            <img class="product__body-img" src="${pageContext.request.contextPath}/Img/${products[i].proName}/1_thumbs.png" alt="${products[i].proName}"/>
                            <div class="card-body product__body-img-body">
                                <h1 class="card-title pt-0 txtOverflow product__body-img-heading">${products[i].proName}</h1>
                                <p class="card-text card-text-config product__body-img-date">Ngày đăng: ${products[i].startDateTime}<span><button class="float-end buy-button"><i class="fas fa-cart-plus"></i> Mua ngay</button></span></p>
                                <p class="card-text card-text-config product__body-img-info-type">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                                <p class="card-text card-text-config martop product__body-img-info"><fmt:formatNumber value="${products[i].price}" type="currency"/>
                                    <span hidden class="time">${products[i].timeFormat}</span>
                                    <span class="remaining float-end" style="color: black"></span>
                                </p>
                                <p class="card-text card-text-config product__body-img-bid-price-type">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                                <c:set var="fullname" value="${products[i].name}"/>
                                <c:set var="lengthname" value="${fn:length(fullname)}"/>
                                <c:set var = "name" value="${fn:substring(fullname,lengthname/2,lengthname)}"/>
                                <p class="card-text card-text-config martop product__body-img-bid-price">10<span class="float-end">***${name}</span></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>

