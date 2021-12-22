<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/ProductDetail.css">
    </jsp:attribute>
    <jsp:body>
        <div class="product-detail__container">
            <div class="row p-5 product-detail__body">
                <div class="row product-detail__halfup">
                <div class="col-md-5 product-detail__image-container">
                    <div id="carouselExampleIndicators" class="carousel slide">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="${pageContext.request.contextPath}/Img/download.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/Img/download.png" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="${pageContext.request.contextPath}/Img/download.png" class="d-block w-100" alt="...">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7 product-detail__info">
                    <div class="row product-detail__heading">
                        <div class="d-flex card-header h-auto bg-white border product-detail__header">
                            <h4>Nhà di động thế hệ 8 của tương lai không bố con thằng nào có chỉ để trưng không thể sử dụng hết biết làm rồi huuhuhuhuhuhuhuhu</h4>
                        </div>
                    </div>
                    <div class="row product-detail__info-body">
                        <div class="col-md-8 mt-5 product-detail__info-halfleft">
                            <div class="card border-0">
                                <div class="card-header text-primary product-detail__info-price">
                                    <div class="text-body bg-light product-detail__info-pricebid">
                                        <h5>Giá hiện tại: 9.000.000.000 VND</h5>
                                    </div>
                                    <div class="text-body bg-light product-detail__info-pricenow">
                                        <h5>Giá mua ngay: 15.000.000.000 VND</h5>
                                    </div>
                                </div>
                                <div class="card-body product-detail__info-datenpoint">
                                    <div class="text-body product-detail__info-update">
                                        <h4>Ngày đăng:</h4>
                                    </div>
                                    <div class="text-body product-detail__info-enddate">
                                        <h4>Ngày kết thúc:</h4>
                                    </div>
                                    <div class="text-body product-detail__info-dateleft">
                                        <h4>Còn lại: 3 ngày</h4>
                                    </div>
                                    <div class="d-flex d-inline-block justify-content-between product-detail__info-owner">
                                        <div class="text-body">
                                            <h4>Đang sở hữu: **í</h4>
                                        </div>
                                        <div class="text-body product-detail__info-point">
                                            <h4>Điểm đánh giá: 192đ</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card product-detail__info-halfright">
                                <div class="card-body">
                                    <h5 class="card-title product-detail__info-shop-heading">Ipad</h5>
                                    <p class="card-text product-detail__info-shop-describe">shop bán điện thoại đâm thằng tên Trí</p>
                                    <a href="#" class="btn btn-primary product-detail__info-shop-btn">Xem shop</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <div class="row product-detail__halfdown">
                <div class="col-md-9">
                    <div class="row h-auto w-auto product-detail__topbidder">
                        <div class="mt-5 mx-2 product-detail__topbidder-heading">
                            <h4 class="product-detail__topbidder-header">Top Bidder</h4>
                        </div>
                        <ul class="list-group list-group-flush w-100 mx-4 product-detail__topbidder-list">
                            <li class="list-group-item list-group-item-danger d-flex justify-content-between product-detail__topbidder-bidder">
                                <div>top</div>
                                <div>tien</div>
                            </li>
                            <li class="list-group-item list-group-item-success d-flex justify-content-between">
                                <div>top</div>
                                <div>tien</div>
                            </li>
                            <li class="list-group-item list-group-item-warning d-flex justify-content-between">
                                <div>top</div>
                                <div>tien</div>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <div>top</div>
                                <div>tien</div>
                            </li>
                            <li class="list-group-item d-flex justify-content-between">
                                <div>top</div>
                                <div>tien</div>
                            </li>
                        </ul>
                    </div>
                    <div class="row h-auto w-auto product-detail__Describe">
                        <div class="mt-5 mx-2 product-detail__Describe-heading">
                            <h4>Description</h4>
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
    </jsp:body>
</t:main>
