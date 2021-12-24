<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="product" scope="request" type="com.ute.webproject.beans.Product"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.webproject.beans.User" />

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/ProductDetail.css">
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
                    <img class="product-detail__image-main JS-product-detail__image" src="${pageContext.request.contextPath}/Img/${product.proName}/1.png">
                    <div class="product-detail__image-otherimage">
                        <img class="product-detail__image-otherimage-img JS-product-detail__image" src="${pageContext.request.contextPath}/Img/${product.proName}/1.png">
                        <img class="product-detail__image-otherimage-img JS-product-detail__image" src="${pageContext.request.contextPath}/Img/${product.proName}/2.png">
                        <img class="product-detail__image-otherimage-img JS-product-detail__image" src="${pageContext.request.contextPath}/Img/${product.proName}/3.png">
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
                            <button class="btn btn--primary product-detail__info-shop-btn-normal">MUA THEO BID</button>
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
                            <c:forEach begin="0" end="4" varStatus="loop" var="i">
                                <li class="list-group-item list-group-item d-flex justify-content-between product-detail__topbidder-bidder">
                                    <div class="product-detail__topbidder-name">top</div>
                                    <div class="product-detail__topbidder-money">tien</div>
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
        </div>
        <div class="modal product-detail__modal js-product-detail__modal">
            <div class="modal__overlay js-product-detail-modal__overlay"></div>
            <div class="modal__body">
                <img class="modal__img" src="${pageContext.request.contextPath}/Img/${product.proName}/1_thumbs.png" alt="">
            </div>
        </div>
    </jsp:body>
</t:main>
