<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="product" scope="request" type="com.ute.webproject.beans.Product"/>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>
<jsp:useBean id="topBidder" scope="request" type="java.util.List<com.ute.webproject.beans.Auction>"/>
<jsp:useBean id="seller" scope="request" type="com.ute.webproject.beans.Seller"/>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/ProductDetail.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Product.css">
        <style>
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

            .carousel-indicators > li {
                border-radius: 50%;
                width: 12px;
                height: 12px;
            }

            .carousel-indicators {
                width: 80px;
                margin: auto;
            }
            .product-detail__halfup{
                display: flex;
                margin-top: 35px;
                background-color: white;
                border: 1px solid transparent;
                border-radius: 3px;
                overflow: hidden;
            }
            .product-detail__image-container{
                min-width: 50%;
                max-width: 50%;
                border-right: 1px solid #dbdbdb;
            }
            .product-detail__image-main{
                width: 100%;
                max-height: 500px;

            }
            .product-detail__image-main:hover{
                background-color: #e8e8e8;
                cursor: pointer;
            }
            .product-detail__image-otherimage{
                display: flex;
                width: 100%;
                justify-content: space-between;
                margin-top: 10px;
                border-top: 1px solid #dbdbdb;
                padding: 2px 0 2px;
            }
            .product-detail__image-otherimage-img{
                width: 30%;
                height: 30%;
            }
            .product-detail__image-otherimage-img:hover{
                background-color: #e8e8e8;
                cursor: pointer;
            }
            .product-detail__info{
                margin: 0 20px;
                min-width: 551px;
            }
            .product-detail__heading{
                padding: 5px;
            }
            .product-detail__info-point{
                margin-left: 10px;
            }
            .product-detail__header{
                font-size: 2.5rem;
                text-transform: capitalize;
            }

            .product-detail__info-body{
                margin-top: 10px;
            }
            .product-detail__info-halfup{
                display: flex;
            }
            .product-detail__info-halfleft{
                flex: 2;
                border-right: 1px solid #dbdbdb;
                padding-right: 15px;
            }
            .product-detail__info-price{
                display: flex;
                justify-content: space-between;
                align-items: flex-end;
                line-height: 3rem;
            }
            .product-detail__info-pricebid{
                font-size: 2rem;
                font-weight: bold;
                color: red;
            }
            .product-detail__info-pricenow{
                font-weight: bold;
                color: blue;
                font-size: 1.5rem;
                align-self: center;
            }
            .product-detail__info-halfright{
                flex: 1;
                padding-left: 15px;
            }
            .product-detail__info-shop-heading{
                font-weight: bold;
                font-size: 15px;
                line-height: 3rem;
                text-align: center;
                text-transform: capitalize;
            }
            .product-detail__info-shop-describe{
                line-height: 2rem;
                font-size: 13px;
                text-align: center;
            }
            .product-detail__info-shop-btn-container{
                display: flex;
            }
            .product-detail__info-shop-btn{
                margin: 0 auto;
            }
            .product-detail__info-shop-button{
                text-transform: capitalize;
            }
            .product-detail__info-halfdown{
                justify-content: space-evenly;
                margin-top: 10px;
            }
            .btn.product-detail__info-shop-btn-now{
                background-color: #ff3945;
                color: var(--white-color);
                text-transform: uppercase;
            }
            .btn.product-detail__info-shop-btn-now:hover{
                color: var(--text-color);
                background-color: #ff3945;
                text-transform: uppercase;
            }
            .product-detail__topbidder-bidder:first-child{
                background-color: #f5c6cb;
            }
            .product-detail__topbidder-bidder:nth-child(2){
                background-color: #ffeeba;
            }
            .product-detail__topbidder-bidder:nth-child(3){
                background-color: #c3e6cb;
            }
            .product-detail__topbidder-name,
            .product-detail__topbidder-money{
                text-transform: capitalize;
                font-size: 1.5rem;
            }
            .product-detail__topbidder-bidder:first-child .product-detail__topbidder-name,
            .product-detail__topbidder-bidder:first-child .product-detail__topbidder-money{
                text-transform: uppercase;
                font-weight: 900;
                color: #ff3945;
            }
            .product-detail__topbidder-bidder:nth-child(2) .product-detail__topbidder-name,
            .product-detail__topbidder-bidder:nth-child(2) .product-detail__topbidder-money{
                font-weight: 700;
                color: #c0930c;
            }
            .product-detail__topbidder-bidder:nth-child(3) .product-detail__topbidder-name,
            .product-detail__topbidder-bidder:nth-child(3) .product-detail__topbidder-money{
                color: #20c744;
            }
            .product-detail__Describe{
                display: block;
            }
            .product-detail__Describe-body{
                font-size: 1.5rem;
                text-align: justify;
                padding: 12px;
            }
            .product-detail__modal.open{
                display: flex;
            }
            .modal__overlay{
                z-index: -1;
            }
            .modal__body{
                max-width: 500px;
            }
            .modal__img{
                width: 100%;
            }
            .modal__body{
                max-width: 500px;
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
        <script src="${pageContext.request.contextPath}/views/JS/ProductDetail.js"></script>
        <script src="${pageContext.request.contextPath}/views/JS/Product.js"></script>
    </jsp:attribute>
    <jsp:body>
        <div class="product-detail__container">
            <div class=" product-detail__body">
                <div class=" product-detail__halfup">
                <div class=" product-detail__image-container">
                    <img class="product-detail__image-main JS-product-detail__image" onclick="showImg(1)" src="${pageContext.request.contextPath}/Img/${product.proName}/1.png">
                    <div class="product-detail__image-otherimage">
                        <c:forEach begin="2" end="4" varStatus="loop" var="i">
                            <img class="product-detail__image-otherimage-img JS-product-detail__image" onclick="showImg(${i})" src="${pageContext.request.contextPath}/Img/${product.proName}/${i}.png">
                        </c:forEach>
                    </div>
                </div>
                <div class=" product-detail__info">
                    <div class=" product-detail__heading">
                        <h4 title="${product.proName}" class="product-detail__header">${product.proName}</h4>
                    </div>
                    <div class="line"></div>
                    <div class=" product-detail__info-body">
                        <div class="product-detail__info-halfup">
                            <div class=" product-detail__info-halfleft">
                                <div class="  product-detail__info-price">
                                    <div title="GIÁ HIỆN TẠI" class="product-detail__info-pricebid"><fmt:formatNumber value="${product.price}" type="currency"/></div>
                                    <div title="GIÁ MUA NGAY" class="product-detail__info-pricenow"> N/A</div>
                                </div>
                                <div class=" product-detail__info-datenpoint">
                                    <div class="text-body product-detail__info-update">
                                        <h4>Ngày đăng: ${product.startDateTime}</h4>
                                    </div>
                                    <div class=" product-detail__info-enddate">
                                        <h4>Ngày kết thúc: ${product.endDateTime}</h4>
                                    </div>
                                    <div class=" product-detail__info-dateleft">
                                        <h4 hidden class="time">${product.timeFormat}</h4> <h4>Còn lại: <span class="remaining float-end" style="color: black"></span></h4>
                                    </div>
                                    <div class="d-flex d-inline-block justify-content-between product-detail__info-owner">
                                        <div class="">
                                            <c:set var="fullname" value="${product.name}"/>
                                            <c:set var="lengthname" value="${fn:length(fullname)}"/>
                                            <c:set var = "name" value="${fn:substring(fullname,lengthname/2,lengthname)}"/>
                                            <h4>Đang sở hữu: ***${name}</h4>
                                        </div>
                                        <div class=" product-detail__info-point">
                                            <h4> Đánh giá: 0đ</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" product-detail__info-halfright">
                                <div class=" product-detail__info-shop-heading">Shop Name</div>
                                <p class=" product-detail__info-shop-describe">${seller.name}</p>
                                <div class="product-detail__info-shop-btn-container">
                                    <a href="#" class="product-detail__info-shop-btn"><button class="btn btn--primary product-detail__info-shop-button">Xem shop</button></a>
                                </div>
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="product-detail__info-halfdown product-detail__info-shop-btn-container">
                            <button class="btn product-detail__info-shop-btn-now" style="margin-top: 6px">MUA NGAY</button>
                            <form id="formBid" method="post" action="${pageContext.request.contextPath}/Product/ByCate/Detail">
                                <input name="userID" value="${authUser.id}" hidden/>
                                <input name="proID" value="${product.proID}" hidden>
                                <input name="step" value="${product.step}" hidden>
                                <input id="curPrice" name="curPrice" value="${product.price}" hidden>
                                <input id="bid" name="bid" value="false" hidden>
                                <c:set var="rcmPrice" value="${product.price + product.step}"/>
                                <input id="maxPrice" name="maxPrice" type="number" style="width: 50%; height: 50px; font-size: 25px; margin-left: 30px" value="${rcmPrice}"/>
                                <button class="btn btn--primary product-detail__info-shop-btn-normal" id="bid-button" style="margin-top: -16px">ĐẶT BID</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
                <div class="row product-detail__halfdown">
                <div class="col-md-9">
                    <div class="row h-auto w-auto product-detail__topbidder">
                        <div class="mt-5 mx-2 product-detail__topbidder-heading">
                            <h3 class="product-detail__topbidder-header">Top Bidder</h3>
                        </div>
                        <ul class="list-group list-group-flush w-100 mx-4 product-detail__topbidder-list">
                            <c:forEach begin="0" end="4" var="i">
                                <li class="list-group-item list-group-item d-flex justify-content-between product-detail__topbidder-bidder">
                                    <c:choose>
                                        <c:when test="${topBidder[i] != null}">
                                            <div class="product-detail__topbidder-name">${topBidder[i].name}</div>
                                            <div class="product-detail__topbidder-money">${topBidder[i].curPrice}</div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="product-detail__topbidder-name">Trống</div>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="row h-auto w-auto product-detail__Describe">
                        <div class="mt-5 mx-2 product-detail__Describe-heading">
                            <h3>Description</h3>
                        </div>
                        <div class="d-flex bg-white mx-4 product-detail__Describe-body">
                            <p>
                                ${product.fullDes}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <br><br>
            <div class="">
                <div class="row product__container" style="margin: 0 auto">
                    <div class="card-header bg-white mb-1 sticky-top product__header">
                        <h3 class="my-auto product__heading">GỢI Ý CHO BẠN</h3>
                    </div>
                    <div class="product__body">
                        <c:forEach begin="0" end="${products.size() - 1}" varStatus="loop" var="i">
                            <c:if test="${product.catID == products[i].catID && product.proID != products[i].proID}">
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
                                    <p class="card-text card-text-config martop product__body-img-bid-price">${products[i].turn}<span class="float-end">***${name}</span></p>
                                </div>
                            </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal product-detail__modal js-product-detail__modal">
            <div class="modal__overlay js-product-detail-modal__overlay"></div>
            <div class="modal__body js-modal__body">
                <img class="modal__img" src="${pageContext.request.contextPath}/Img/${product.proName}/" alt="">
            </div>
        </div>
        <script>
            const productImgs=document.querySelectorAll('.JS-product-detail__image');
            const productdetailModal=document.querySelector('.js-product-detail__modal');
            const productdetailModalOverlay=document.querySelector('.js-product-detail-modal__overlay');
            const modalImgContainer=document.querySelector('.js-modal__body');
            const modalImg = document.querySelector('.modal__img');
            const  x = modalImg.attributes[1].value;
            function showImg(i){
                modalImg.setAttribute("src", "${pageContext.request.contextPath}/Img/${product.proName}/" + i.toString() + ".png")
                productdetailModal.classList.add('open')
            }
            function hideImg(){
                productdetailModal.classList.remove('open')
                modalImg.removeAttribute("src")
            }
            productdetailModalOverlay.addEventListener('click', hideImg)

            document.getElementById('bid-button').addEventListener('click',function (e) {
                if (!auth){
                    e.preventDefault();
                    showLoginModal();
                }else {
                    const maxPrice = parseInt(document.getElementById('maxPrice').value);
                    const curPrice = parseInt(document.getElementById('curPrice').value);

                    if (maxPrice < curPrice || document.getElementById('maxPrice').value === ''){
                        e.preventDefault();
                        window.alert('bạn không thể đặt giá thấp hơn giá trị hiện tại');
                    }else {
                        document.getElementById('bid').value = true;
                        document.getElementById('formBid').submit();
                    }
                }
            })
        </script>
    </jsp:body>
</t:main>
