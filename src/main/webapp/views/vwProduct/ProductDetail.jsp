<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="product" scope="request" type="com.ute.webproject.beans.Product"/>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>
<jsp:useBean id="topBidder" scope="request" type="java.util.List<com.ute.webproject.beans.Auction>"/>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/ProductDetail.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Product.css">
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
                                <div class=" product-detail__info-shop-heading">Shop name</div>
                                <p class=" product-detail__info-shop-describe">HIHI</p>
                                <div class="product-detail__info-shop-btn-container">
                                    <a href="#" class="product-detail__info-shop-btn"><button class="btn btn--primary product-detail__info-shop-button">Xem shop</button></a>
                                </div>
                            </div>
                        </div>
                        <div class="line"></div>
                        <div class="product-detail__info-halfdown product-detail__info-shop-btn-container">
                            <button class="btn product-detail__info-shop-btn-now">MUA NGAY</button>
                            <form id="formBid" method="post" action="${pageContext.request.contextPath}/Product/ByCate/Detail">
                                <input name="userID" value="${authUser.id}" hidden/>
                                <input name="proID" value="${product.proID}" hidden>
                                <input name="step" value="${product.step}" hidden>
                                <input id="curPrice" name="curPrice" value="${product.price}" hidden>
                                <input id="maxPrice" name="maxPrice" type="number" style="width: 100%; height: 100px; font-size: 50px"/>
                                <button class="btn btn--primary product-detail__info-shop-btn-normal" id="bid-button">MUA THEO BID</button>
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
                                    <p class="card-text card-text-config martop product__body-img-bid-price">10<span class="float-end">***${name}</span></p>
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
<%--                <img class="modal__img" src="${pageContext.request.contextPath}/Img/${product.proName}/1.png" alt="">--%>
            </div>
        </div>
        <script>
            const productImgs=document.querySelectorAll('.JS-product-detail__image');
            const productdetailModal=document.querySelector('.js-product-detail__modal');
            const productdetailModalOverlay=document.querySelector('.js-product-detail-modal__overlay');
            const modalImg=document.querySelector('.js-modal__body');
            function showImg(i){
                switch (i)
                {
                    case (1):
                        modalImg.innerHTML='<img class="modal__img" src="${pageContext.request.contextPath}/Img/${product.proName}/1.png" alt="">';
                        break;
                    case (2):
                        modalImg.innerHTML='<img class="modal__img" src="${pageContext.request.contextPath}/Img/${product.proName}/2.png" alt="">';
                        break;
                    case (3):
                        modalImg.innerHTML='<img class="modal__img" src="${pageContext.request.contextPath}/Img/${product.proName}/3.png" alt="">';
                        break;
                    case (4):
                        modalImg.innerHTML='<img class="modal__img" src="${pageContext.request.contextPath}/Img/${product.proName}/4.png" alt="">';
                        break;
                }
                productdetailModal.classList.add('open')
            }
            function  hideImg(){
                productdetailModal.classList.remove('open')
            }

            productdetailModalOverlay.addEventListener('click', hideImg)

            document.getElementById('bid-button').addEventListener('click',function (e) {
                if (!auth){
                    e.preventDefault();
                    showLoginModal();
                }else {
                    const maxPrice = parseInt(document.getElementById('maxPrice').value);
                    const curPrice = parseInt(document.getElementById('curPrice').value);

                    if (maxPrice < curPrice){
                        e.preventDefault();
                        window.alert('bạn không thể đặt giá thấp hơn giá trị hiện tại');
                    }else {
                        document.getElementById('formBid').submit();
                    }
                }
            })

        </script>
    </jsp:body>
</t:main>
