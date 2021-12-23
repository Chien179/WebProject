<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/ProductDetail.css">
    </jsp:attribute>
    <jsp:attribute name="js">
        <script src="${pageContext.request.contextPath}/views/JS/ProductDetail.js"></script>
    </jsp:attribute>
    <jsp:body>
        <div class="product-detail__container">
            <div class=" product-detail__body">
                <div class=" product-detail__halfup">
                <div class=" product-detail__image-container">
                    <img class="product-detail__image-main JS-product-detail__image" src="../../Img/download.png">
                    <div class="product-detail__image-otherimage">
                        <c:forEach begin="0" end="2" varStatus="loop" var="i">
                            <img class="product-detail__image-otherimage-img JS-product-detail__image" src="../../Img/download.png">
                        </c:forEach>
                    </div>
                </div>
                <div class=" product-detail__info">
                    <div class=" product-detail__heading">
                        <h4 title="Nhà di động thế hệ 8 của tương lai không bố con thằng nào có chỉ để trưng không thể sử dụng hết biết làm rồi huuhuhuhuhuhuhuhu" class="product-detail__header">Nhà di động thế hệ 8 của tương lai không bố con thằng nào có chỉ để trưng không thể sử dụng hết biết làm rồi huuhuhuhuhuhuhuhu</h4>
                    </div>
                    <div class="line"></div>
                    <div class=" product-detail__info-body">
                        <div class="product-detail__info-halfup">
                            <div class=" product-detail__info-halfleft">
                                <div class="  product-detail__info-price">
                                    <div title="GIÁ HIỆN TẠI" class="product-detail__info-pricebid"> 9.000.000.000 VND</div>
                                    <div title="GIÁ MUA NGAY" class="product-detail__info-pricenow"> 15.000.000.000 VND</div>
                                </div>
                                <div class=" product-detail__info-datenpoint">
                                    <div class="text-body product-detail__info-update">
                                        <h4>Ngày đăng:</h4>
                                    </div>
                                    <div class=" product-detail__info-enddate">
                                        <h4>Ngày kết thúc:</h4>
                                    </div>
                                    <div class=" product-detail__info-dateleft">
                                        <h4>Còn lại: 3 ngày</h4>
                                    </div>
                                    <div class="d-flex d-inline-block justify-content-between product-detail__info-owner">
                                        <div class="">
                                            <h4>Đang sở hữu: **í</h4>
                                        </div>
                                        <div class=" product-detail__info-point">
                                            <h4>Điểm đánh giá: 192đ</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" product-detail__info-halfright">
                                <div class=" product-detail__info-shop-heading">Shop name</div>
                                <p class=" product-detail__info-shop-describe">shop bán điện thoại đâm thằng tên Trí</p>
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
                                Good descriptive writing creates an impression in the reader's mind of an event, a place, a person, or a thing. The writing will be such that it will set a mood or describe something in such detail that if the reader saw it, they would recognize it.

                                To be good, descriptive writing has to be concrete, evocative and plausible.

                                To be concrete, descriptive writing has to offer specifics the reader can envision. Rather than “Her eyes were the color of blue rocks” (Light blue? Dark blue? Marble? Slate?), try instead, “Her eyes sparkled like sapphires in the dark.”
                                To be evocative, descriptive writing has to unite the concrete image with phrasing that evokes the impression the writer wants the reader to have. Consider “her eyes shone like sapphires, warming my night” versus “the woman’s eyes had a light like sapphires, bright and hard.” Each phrase uses the same concrete image, then employs evocative language to create different impressions.
                                To be plausible, the descriptive writer has to constrain the concrete, evocative image to suit the reader’s knowledge and attention span. “Her eyes were brighter than the sapphires in the armrests of the Tipu Sultan’s golden throne, yet sharper than the tulwars of his cruelest executioners” will have the reader checking their phone halfway through. “Her eyes were sapphires, bright and hard” creates the same effect in a fraction of the reading time. As always in the craft of writing: when in doubt, write less.
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
                <img class="modal__img" src="../../Img/download.png" alt="">
            </div>
        </div>
    </jsp:body>
</t:main>
