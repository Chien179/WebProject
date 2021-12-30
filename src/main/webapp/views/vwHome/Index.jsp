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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Product.css">
        <style>
            .carousel-control {
                width: 30px;
                height: 30px;
            }

            .carousel-indicators {
                width: 160px;
                margin: auto;
                z-index: 1;
            }

            .carousel-indicators li {
                background-color: var(--primary-color);
            }

            .fa-arrow-circle-o-left, .fa-arrow-circle-o-right {
                color: var(--primary-color);
            }

            .fa:hover {
                font: normal normal normal 50px/1 FontAwesome;
                z-index: 1;
            }

            .sticky-top {
                z-index: 1;
                top: 120px;
            }
            .p-custom {
                padding: 3rem 3rem 3rem 6rem;
            }

            .w-82 {
                width: 82%;
            }
            :root{
                --white-color: #fff;
                --black-color: #000;
                --text-color: #333;
                --primary-color: rgb(26, 183, 234);
                --border-color: #dbdbdb;
                --background-color: #f5f5fa;

                --header-height:120px;
                --nav-height:34px;
                --header-with-search-height: calc(var(--header-height) - var(--nav-height));
            }
            *{
                padding: 0;
                margin: 0;
                box-sizing: inherit;
            }
            html, body{
                box-sizing: border-box;
                font-family: arial, sans-serif !important;
                scroll-behavior: smooth;
                font-size: 62.5%;
                line-height: 1.6rem;
                background-color: var(--background-color);
                position: relative;
                min-height: 500px;
            }
            #content{
                position: relative;
            }
            /* Animation grow hover */
            @keyframes HoverGrow{
                from{
                    transform: scale(0);
                    opacity: 0;
                }
                to{
                    transform: scale(1);
                    opacity: 1;
                }
            }
            @keyframes fadeIn{
                from{
                    opacity: 0;
                }
                to{
                    opacity: 1;
                }
            }
            @keyframes grow{
                from{
                    transform: scale(var(--grow-from));
                }
                to{
                    transform: scale(var(--grow-to));
                }
            }
            @keyframes leftRight{
                from{
                    left: -236px;
                }
                to{
                    left: 0;
                }
            }
            .Up__icon-fa:hover{
                font-size: 2rem;
            }
            .grid{
                width: 1400px;
                max-width: 100%;
                margin: 0 auto;
            }
            .grid__full-width{
                width: 100%;
            }
            .grid__row{
                display: flex;
                flex-wrap: wrap;
            }
            ul{
                list-style: none;
            }
            .line{
                height: 1px;
                width: 100%;
                background-color: #dbdbdb;
                flex: 1;
            }
            .text-between{
                color: var(--text-color);
                padding: 0 1rem;
                text-transform: uppercase;
                font-size: .95rem;
            }
            .-or-{
                display: flex;
                align-items: center;
            }
            .btn{
                min-width: 142px;
                height: 36px;
                text-decoration: none;
                border: none;
                border-radius: 2px;
                font-size: 1.5rem;
                padding: 0;
                outline: none;
                cursor: pointer;
                color: var(--text-color);
                background-color: var(--white-color);
            }
            .btn:hover{
                background-color: rgba(0, 0, 0, 0.05);
            }
            .btn.btn--primary{
                color: var(--white-color);
                background-color: var(--primary-color);
            }
            .btn--primary:focus{
                border: none;
                outline: none;
            }
            .btn.btn--primary:hover{
                color: var(--text-color);
            }
            .btn.btn--disabled{
                cursor: default;
                background-color: #c3c3c3;
                color: #949494;
            }
            .btn + .btn{
                margin-left: 2px;
            }
            /* Modal */
            .modal{
                position: fixed;
                top: 0;
                right: 0;
                bottom: 0;
                left: 0;
                /*display: flex;*/
                animation: fadeIn linear 0.1s;
                display: none;
            }
            .modal__body{
                --grow-from: 0.7;
                --grow-to: 1;
                margin: auto;
                position: relative;
                z-index: 1;
                animation: grow linear 0.2s;
                display: flex;
            }
            div.card:hover, div.card:active{
                background-color: #e8e8e8; cursor: pointer;
            }

            .martop{
                margin-top: 0px !important;
            }

            .card-text-config{
                font-size: 14px;
                display: flex;
                justify-content: space-between;
            }

            .txtOverflow{
                white-space: nowrap;
                width: 300px;
                overflow: hidden;
                text-overflow: ellipsis;
            }
            .sticky-top {
                z-index: 1;
                top: 118px;
            }

            .w-77 {
                width: 77%;
            }

            .buy-button {
                background-color: #1ab7ea;
                border: 1px solid white;
                color: white;
                padding: 7px 26px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: -5px 2px 1px;
                cursor: pointer;
                border-radius: 12px;
            }
            .buy-button-small {
                background-color: #1ab7ea;
                border: 1px solid white;
                color: white;
                padding: 0px 9px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 11px;
                margin: -5px 2px 1px;
                cursor: pointer;
                border-radius: 12px;
            }


            .buy-button:hover{
                border: 1px solid grey;
                color: black;
            }
            .buy-button-small:hover{
                border: 1px solid grey;
            }

            .scale {
                height: 10em;
            }
            .product__container{
                margin-top: 10px;
            }
            .product__header{
                width: 100%;
                height: 35px;
                margin: 0 auto;
                margin-left: 1.3%;
            }
            .product__heading{
                text-align: center;
                cursor: default;
                text-transform: uppercase
            }
            .product__body{
                display: flex;
                max-width: 1110px;
                flex-wrap: wrap;
                margin: 0 auto;
            }
            .product__body-item{
                width: 350px;
                margin: 10px 0px 10px 20px;
                box-sizing: border-box;
                height: 400px;
            }
            .product__body-img{
                padding: 20px 10px 0px 12px;
                width: 343px;
                height: 200px
            }
            .product__body-img-body{

            }
            .product__body-img-heading{
                color: #337ab7;
                font-size: 20px
            }
            .product__body-img-date{
                font-size: 12px;
                font-weight: bold
            }
            .product__body-img-info-type{
                font-size: 1.4rem
            }
            .product__body-img-info{
                font-size: 16px;
                color: green;
                font-weight: bold
            }
            .product__body-img-bid-price-type{
                font-size: 14px
            }
            .product__body-img-bid-price{
                font-size: 16px;
                font-weight: bold
            }

        </style>
    </jsp:attribute>
    <jsp:attribute name="js">
<%--        <script src="${pageContext.request.contextPath}/views/JS/Product.js"></script>--%>
        <script>
            let date = document.querySelectorAll('.time');
            let endDate = document.querySelectorAll('.remaining');

            // Update the count down every 1 second
            let x = setInterval(function() {
                for (let i =0; i < endDate.length; i++) {
                    // Set the date we're counting down to
                    let countDownDate = new Date(date[i].childNodes[0].nodeValue).getTime();

                    // Get today's date and time
                    let now = new Date().getTime();

                    // Find the distance between now and the count down date
                    let distance = countDownDate - now;

                    // Time calculations for days, hours, minutes and seconds
                    let days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    if (days > 3) {
                        // Output the result in an element with id="demo"
                        endDate[i].innerHTML = `${days}d ${hours}h ${minutes}m ${seconds}s`;
                    }
                    else {
                        if (days > 0) {
                            endDate[i].innerHTML =`${days} ngày nữa`;
                        }
                        else {
                            if (hours > 0){
                                endDate[i].innerHTML =`${hours} tiếng nữa`;
                            }
                            else {
                                if (minutes > 0){
                                    endDate[i].innerHTML =`${minutes} phút nữa`;
                                }
                                else {
                                    endDate[i].innerHTML =`${seconds} giây nữa`;
                                }
                            }
                        }
                    }

                    // If the count down is over, write some text
                    if (distance < 0) {
                        clearInterval(x);
                        endDate[i].innerHTML = "Hết Thời Hạn";
                    }
                }
            }, 1000);
        </script>
    </jsp:attribute>
    <jsp:body>
        <div class="" style="margin: 0 auto;display: flex;flex-wrap: wrap; justify-content: center">
            <div class="row" style="margin: 0 auto">
                <div class="row" style="width: 126rem">
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
                                    <h3 class="my-auto" style="cursor: default">TOP 5 SẢN PHẨM SẮP KẾT THÚC</h3>
                                </div>
                                <div class="d-flex">
                                    <c:forEach items="${top5Time}" var="t">
                                        <div class="card card card-hover border-secondary h-60" style="width: 222px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/Img/${t.proName}/1_thumbs.png" style="padding: 20px 10px 0px 12px; width: 214px; height: 130px" alt="${t.proName}" onclick="location.href='${pageContext.request.contextPath}/Product/ByCate/Detail?id=${t.proID}'">
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
                                        <div class="card card card-hover border-secondary h-60" style="width: 222px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/Img/${t.proName}/1_thumbs.png" style="padding: 20px 10px 0px 12px; width: 214px; height: 130px" alt="${t.proName}" onclick="location.href='${pageContext.request.contextPath}/Product/ByCate/Detail?id=${t.proID}'"/>
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
                                        <div class="card card card-hover border-secondary h-60" style="width: 222px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 300px;">
                                            <img src="${pageContext.request.contextPath}/Img/${t.proName}/1_thumbs.png" style="padding: 20px 10px 0px 12px; width: 214px; height: 130px" alt="${t.proName}" onclick="location.href='${pageContext.request.contextPath}/Product/ByCate/Detail?id=${t.proID}'"/>
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
            <div class="row product__container">
                <div class="card-header bg-white mb-1 sticky-top product__header">
                    <h3 class="my-auto product__heading">SẢN PHẨM GỢI Ý</h3>
                </div>
                <div class="product__body">
                    <c:forEach begin="0" end="12" varStatus="loop" var="i">
                        <div class="card card border-secondary h-60 product__body-item">
                            <img class="product__body-img" src="${pageContext.request.contextPath}/Img/${products[i].proName}/1_thumbs.png" alt="${products[i].proName}" onclick="location.href='${pageContext.request.contextPath}/Product/ByCate/Detail?id=${products[i].proID}'"/>
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