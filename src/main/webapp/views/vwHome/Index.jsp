<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Index.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Product.css">
    </jsp:attribute>
    <jsp:body>
        <div class="container-fluid">
            <div class="row p-5">
                <div class="row w-100 p-2">
                    <div id="carouselExampleIndicators" class="carousel slide w-100" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <h3 class="my-auto p-3">Top 5 sản phẩm</h3>
                                <div class="d-flex justify-content-around">
                                    <c:forEach begin="0" end="4" varStatus="loop">
                                        <div class="card card card-hover border-secondary h-60" style="width: 276px; box-sizing: border-box; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/Img/download.png" style="padding: 20px 10px 0px 12px" alt="House">
                                            <div class="card-body">
                                                <h5 class="card-title pt-0" style="color: #337ab7; font-size: 20px">Hollow Knight</h5>
                                                <p class="card-text card-text-config" style="font-size: 6px; font-weight: bold">Ngày đăng: 1/12/2021</p>
                                                <p class="card-text card-text-config" style="font-size: 7px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; color: green; font-weight: bold"><fmt:formatNumber value="${165000}" type="currency"/>
                                                    <span class="float-end" style="color: black">7 ngày</span>
                                                </p>
                                                <p class="card-text card-text-config" style="font-size: 7px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; font-weight: bold">10<span class="float-end">Nguyen Huu Dang</span></p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <h3 class="my-auto p-3">Top 5 sản phẩm</h3>
                                <div class="d-flex justify-content-around">
                                    <c:forEach begin="0" end="4" varStatus="loop">
                                        <div class="card card card-hover border-secondary h-60" style="width: 276px; box-sizing: border-box; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/Img/download.png" style="padding: 20px 10px 0px 12px" alt="House">
                                            <div class="card-body">
                                                <h5 class="card-title pt-0" style="color: #337ab7; font-size: 20px">Hollow Knight</h5>
                                                <p class="card-text card-text-config" style="font-size: 6px; font-weight: bold">Ngày đăng: 1/12/2021</p>
                                                <p class="card-text card-text-config" style="font-size: 7px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; color: green; font-weight: bold"><fmt:formatNumber value="${165000}" type="currency"/>
                                                    <span class="float-end" style="color: black">7 ngày</span>
                                                </p>
                                                <p class="card-text card-text-config" style="font-size: 7px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; font-weight: bold">10<span class="float-end">Nguyen Huu Dang</span></p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <h3 class="my-auto p-3">Top 5 sản phẩm</h3>
                                <div class="d-flex justify-content-around">
                                    <c:forEach begin="0" end="4" varStatus="loop">
                                        <div class="card card card-hover border-secondary h-60" style="width: 276px; box-sizing: border-box; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/Img/download.png" style="padding: 20px 10px 0px 12px" alt="House">
                                            <div class="card-body">
                                                <h5 class="card-title pt-0" style="color: #337ab7; font-size: 20px">Hollow Knight</h5>
                                                <p class="card-text card-text-config" style="font-size: 6px; font-weight: bold">Ngày đăng: 1/12/2021</p>
                                                <p class="card-text card-text-config" style="font-size: 7px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; color: green; font-weight: bold"><fmt:formatNumber value="${165000}" type="currency"/>
                                                    <span class="float-end" style="color: black">7 ngày</span>
                                                </p>
                                                <p class="card-text card-text-config" style="font-size: 7px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                                                <p class="card-text card-text-config martop" style="font-size: 8px; font-weight: bold">10<span class="float-end">Nguyen Huu Dang</span></p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev carousel-control ml-4" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <i class="fa fa-arrow-circle-o-left fa-3x" aria-hidden="true"></i>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next carousel-control mr-4" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <i class="fa fa-arrow-circle-o-right fa-3x" aria-hidden="true"></i>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div class="row align-items-start">
                    <div class="card-header bg-white sticky-top mb-1 w-100 p-3">
                            <h3 class="my-auto">SẢN PHẨM GỢI Ý</h3>
                        </div>
                    <c:forEach begin="0" end="19" varStatus="loop">
                            <div class="card card border-secondary h-60" style="width: 350px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 400px;">
                                <img src="${pageContext.request.contextPath}/Img/download.png" style="padding: 20px 10px 0px 12px" alt="House">
                                <div class="card-body">
                                    <h1 class="card-title pt-0" style="color: #337ab7; font-size: 20px">Hollow Knight</h1>
                                    <p class="card-text card-text-config" style="font-size: 12px; font-weight: bold">Ngày đăng: 1/12/2021</p>
                                    <p class="card-text card-text-config" style="font-size: 14px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                                    <p class="card-text card-text-config martop" style="font-size: 16px; color: green; font-weight: bold"><fmt:formatNumber value="${165000}" type="currency"/>
                                        <span class="float-end" style="color: black">7 ngày</span></p>

                                    <p class="card-text card-text-config" style="font-size: 14px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                                    <p class="card-text card-text-config martop" style="font-size: 16px; font-weight: bold">10<span class="float-end">Nguyen Huu Dang</span></p>
                                </div>
                            </div>
                        </c:forEach>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>