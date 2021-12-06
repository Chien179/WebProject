<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>
<jsp:useBean id="top5Time" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>
<jsp:useBean id="top5Price" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>
<jsp:useBean id="top5Turn" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Index.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Product.css">
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/views/JS/Product.js"></script>
    </jsp:attribute>
    <jsp:body>
        <div class="container-fluid">
            <div class="row">
                <div class="row" style="width: 125rem">
                    <div id="carouselExampleIndicators" class="carousel slide w-100" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner p-5">
                        <div class="carousel-item active">
                            <div class="row w-82">
                                <div class="p-3">
                                    <h3 class="my-auto">TOP 5 SẢN PHẨM SẮP KẾT THÚC</h3>
                                </div>
                                <div class="d-flex">
                                    <c:forEach items="${top5Time}" var="t">
                                        <div class="card card card-hover border-secondary h-60" style="width: 220px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/Img/${t.proName}/1_thumbs.png" style="padding: 20px 10px 0px 12px" alt="${t.proName}" class="h-50">
                                            <div class="card-body">
                                                <h5 class="card-title pt-0 txtOverflow" style="color: #337ab7; font-size: 20px">${t.proName}</h5>
                                                <p class="card-text card-text-config" style="font-size: 6px; font-weight: bold">
                                                    Ngày đăng: ${t.startDateTime}
                                                    <span>
                                                        <button class="float-end buy-button-small"><i class="fas fa-cart-plus"></i> Mua ngay</button>
                                                    </span>
                                                </p>
                                                <p class="card-text card-text-config" style="font-size: 7px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; color: green; font-weight: bold"><fmt:formatNumber value="${t.price}" type="currency"/>
                                                    <span hidden class="time">${t.timeFormat}</span>
                                                    <span class="remaining float-end" style="color: black"></span>
                                                </p>
                                                <p class="card-text card-text-config" style="font-size: 7px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                                                <c:set var="fullname" value="${t.name}"/>
                                                <c:set var="lengthname" value="${fn:length(fullname)}"/>
                                                <c:set var = "name" value="${fn:substring(fullname,lengthname/2,lengthname)}"/>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; font-weight: bold">10<span class="float-end">***${name}</span></p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row w-82">
                                <div class="p-3">
                                    <h3 class="my-auto">TOP 5 SẢN PHẨM GIÁ CAO NHẤT</h3>
                                </div>
                                <div class="d-flex">
                                    <c:forEach items="${top5Price}" var="t">
                                        <div class="card card card-hover border-secondary h-60" style="width: 220px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/Img/${t.proName}/1_thumbs.png" style="padding: 20px 10px 0px 12px" alt="${t.proName}" class="h-50">
                                            <div class="card-body">
                                                <h5 class="card-title pt-0 txtOverflow" style="color: #337ab7; font-size: 20px">${t.proName}</h5>
                                                <p class="card-text card-text-config" style="font-size: 6px; font-weight: bold">Ngày đăng: ${t.startDateTime}<span><button class="float-end buy-button-small"><i class="fas fa-cart-plus"></i> Mua ngay</button></span></p>
                                                <p class="card-text card-text-config" style="font-size: 7px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; color: green; font-weight: bold"><fmt:formatNumber value="${t.price}" type="currency"/>
                                                    <span hidden class="time">${t.timeFormat}</span>
                                                    <span class="remaining float-end" style="color: black"></span>
                                                </p>
                                                <p class="card-text card-text-config" style="font-size: 7px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                                                <c:set var="fullname" value="${t.name}"/>
                                                <c:set var="lengthname" value="${fn:length(fullname)}"/>
                                                <c:set var = "name" value="${fn:substring(fullname,lengthname/2,lengthname)}"/>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; font-weight: bold">10<span class="float-end">***${name}</span></p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="row w-82">
                                <div class="p-3">
                                    <h3 class="my-auto">TOP 5 SẢN PHẨM NHIỀU LƯỢT ĐẤU GIÁ NHẤT</h3>
                                </div>
                                <div class="d-flex">
                                    <c:forEach items="${top5Turn}" var="t">
                                        <div class="card card card-hover border-secondary h-60" style="width: 220px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/Img/${t.proName}/1_thumbs.png" style="padding: 20px 10px 0px 12px" alt="${t.proName}" class="h-50">
                                            <div class="card-body">
                                                <h5 class="card-title pt-0 txtOverflow" style="color: #337ab7; font-size: 20px">${t.proName}</h5>
                                                <p class="card-text card-text-config" style="font-size: 6px; font-weight: bold">Ngày đăng: ${t.startDateTime}<span><button class="float-end buy-button-small"><i class="fas fa-cart-plus"></i> Mua ngay</button></span></p>
                                                <p class="card-text card-text-config" style="font-size: 7px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; color: green; font-weight: bold"><fmt:formatNumber value="${t.price}" type="currency"/>
                                                    <span hidden class="time">${t.timeFormat}</span>
                                                    <span class="remaining float-end" style="color: black"></span>
                                                </p>
                                                <p class="card-text card-text-config" style="font-size: 7px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                                                <c:set var="fullname" value="${t.name}"/>
                                                <c:set var="lengthname" value="${fn:length(fullname)}"/>
                                                <c:set var = "name" value="${fn:substring(fullname,lengthname/2,lengthname)}"/>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; font-weight: bold">10<span class="float-end">***${name}</span></p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev carousel-control" style="margin-top: 33em;" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <i class="fa fa-arrow-circle-o-left fa-5x" aria-hidden="true"></i>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next carousel-control" style="margin-top: 33em;" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <i class="fa fa-arrow-circle-o-right fa-5x" aria-hidden="true"></i>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                </div>
            </div>
            <div class="row p-custom">
                <div class="card-header bg-white mb-1 sticky-top" style="width:113rem; height: 5rem">
                    <h3 class="my-auto">SẢN PHẨM GỢI Ý</h3>
                </div>
                <c:forEach begin="0" end="14" varStatus="loop" var="i">
                    <div class="card card border-secondary h-60" style="width: 350px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 400px;">
                        <img src="${pageContext.request.contextPath}/Img/${products[i].proName}/1_thumbs.png" style="padding: 20px 10px 0px 12px" alt="${products[i].proName}" class="h-50"/>
                        <div class="card-body">
                            <h1 class="card-title pt-0 txtOverflow" style="color: #337ab7; font-size: 20px">${products[i].proName}</h1>
                            <p class="card-text card-text-config" style="font-size: 12px; font-weight: bold">Ngày đăng: ${products[i].startDateTime}<span><button class="float-end buy-button"><i class="fas fa-cart-plus"></i> Mua ngay</button></span></p>
                            <p class="card-text card-text-config" style="font-size: 14px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
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