<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Product.css">
        <style>
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
                color: var(--text-color);
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
                margin: 10px auto 0;
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
            function loadMore(){
                var amount = document.getElementsByClassName('product').length;
                $.ajax({
                        url: "/WebProject/Load",
                        type: "get", //send it through get method
                        data: {
                        exists: amount,
                    },
                    success: function(response) {
                        var load = document.getElementById('addMore');
                        load.innerHTML += response;
                    },
                    error: function(xhr) {
                        //Do Something to handle error
                    }
                });
            }

            let date = document.querySelectorAll('.time');
            let endDate = document.querySelectorAll('.remaining');

            // Update the count down every 1 second
            let x = setInterval(function() {
                for (let i =0; i < endDate.length; i++) {
                    // Set the date we're counting down to
                    let countDownDate = new Date(date[i].innerHTML).getTime();

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
                        endDate[i].innerHTML = days + 'd ' + hours + 'h ' + minutes+'m '+ seconds + 's';
                    }
                    else {
                        if (days > 0) {
                            endDate[i].innerHTML = days + ' ngày nữa';
                        }
                        else {
                            if (hours > 0){
                                endDate[i].innerHTML = hours + ' tiếng nữa';
                            }
                            else {
                                if (minutes > 0){
                                    endDate[i].innerHTML = minutes + ' phút nữa';
                                }
                                else {
                                    endDate[i].innerHTML = seconds + ' giây nữa';
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
        <div class="row">
            <div class="row product__container" style="margin: 0 auto">
                <div class="card-header bg-white mb-1 sticky-top product__header">
                    <h3 class="my-auto product__heading">SẢN PHẨM HIỆN CÓ</h3>
                </div>
                <div id="addMore" class="product__body">
                    <c:forEach begin="0" end="8" varStatus="loop" var="i">
                        <div class="product card card border-secondary h-60 product__body-item">
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
                                <p class="card-text card-text-config martop product__body-img-bid-price">${products[i].turn}<span class="float-end">***${name}</span></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <button class="btn btn--primary" onclick="loadMore()">Load More</button>
        </div>
    </jsp:body>
</t:main>

