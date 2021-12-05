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
        <div class="container-fluid">
            <div class="row p-custom">
                <div class="card-header bg-white sticky-top mb-1 p-3" style="width: 112rem; height: 5rem">
                    <h3 class="my-auto">SẢN PHẨM HIỆN CÓ</h3>
                </div>
                <c:forEach begin="0" end="${products.size() - 1}" varStatus="loop" var = "i">
                    <div class="card card border-secondary h-60" style="width: 350px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 400px;">
                        <img src="${pageContext.request.contextPath}/Img/download.png" style="padding: 20px 10px 0px 12px" alt="House">
                        <div class="card-body">
                            <h1 class="card-title pt-0 txtOverflow" style="color: #337ab7; font-size: 20px">${products[i].proName}</h1>
                            <p class="card-text card-text-config" style="font-size: 12px; font-weight: bold">Ngày đăng: ${products[i].startDateTime}</p>
                            <p class="card-text card-text-config" style="font-size: 14px">BID HIỆN TẠI
                                <span class="float-end">THỜI GIAN CÒN LẠI</span>
                            </p>
                            <p class="card-text card-text-config martop" style="font-size: 16px; color: green; font-weight: bold"><fmt:formatNumber value="${products[i].price}" type="currency"/>
                                <span hidden class="time">${products[i].timeFormat}</span>
                                <span class="remaining float-end" style="color: black"></span>
                            </p>
                            <p class="card-text card-text-config" style="font-size: 14px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                            <c:set var="fullname" value="${products[i].name}"/>
                            <c:set var="lengthname" value="${fn:length(fullname)}"/>
                            <c:set var = "name" value="${fn:substring(fullname,lengthname/2,lengthname)}"/>
                            <p class="card-text card-text-config martop" style="font-size: 16px; font-weight: bold">10<span class="float-end">***${name}</span></p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </jsp:body>
</t:main>

