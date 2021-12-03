<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Header.css">

<div class="app">
    <!-- Header -->
    <div id="header">
        <div class="grid">
            <!-- Header navigation -->
            <nav class="header__nav">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="" class="nav-item-link">
                            <i class="fas fa-bell"></i>
                            Thông báo
                        </a>
                        <div class="header__notify">
                            <header class="header__notify-header">
                                <h3>Thông báo mới nhận</h3>
                            </header>
                            <ul class="header__notify-list">
                                <li class="header__notify-item">
                                    <a href="" class="header__notify-link">
                                        <img src="${pageContext.request.contextPath}/Img/download.png" alt="" class="header__notify-img">
                                        <div class="header__notify-info">
                                            <span class="header__notify-name">Item-name</span>
                                            <span class="header__notify-description">Item-description</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="header__notify-item">
                                    <a href="" class="header__notify-link">
                                        <img src="${pageContext.request.contextPath}/Img/download.png" alt="" class="header__notify-img">
                                        <div class="header__notify-info">
                                            <span class="header__notify-name">Item-name</span>
                                            <span class="header__notify-description">Item-description</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="header__notify-item">
                                    <a href="" class="header__notify-link">
                                        <img src="${pageContext.request.contextPath}/Img/download.png" alt="" class="header__notify-img">
                                        <div class="header__notify-info">
                                            <span class="header__notify-name">Item-name</span>
                                            <span class="header__notify-description">Item-description</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <footer class="header__notify-footer">
                                <a href="" class="header__notify-footer-btn">Xem tất cả</a>
                            </footer>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-item-link">
                            <i class="fas fa-info-circle"></i>
                            Trợ giúp
                        </a>
                    </li>
                    <c:choose>
                        <c:when test="${auth}">
                            hehe
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item nav-item--separate">
                                <a href="${pageContext.request.contextPath}/views/vwAccount/Register.jsp" class="nav-item-link nav-item-strong">
                                    <i class="fas fa-user-plus"></i>
                                    Đăng ký
                                </a>
                            </li>
                            <li class="nav-item nav-item-strong">
                                <i class="fas fa-sign-in-alt"></i>
                                <a class="js-login nav-item-link nav-item-strong">Đăng nhập</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
            <!-- Header search -->
            <div class="header-with-search">
                <div class="header__cate-btn js-cate-btn">
                    <i class="fas fa-bars header__cate-icon"></i>
                </div>
                <div class="header__logo">
                    <a href="#"><img class="header__logo-img" src="${pageContext.request.contextPath}/Img/download.png" alt="Logo"></a>
                </div>
                <div class="header__search">
                    <div class="header__search-input-wrap">
                        <input type="text" class="header__search-input" placeholder="Tìm kiếm...">
                        <!-- Search history -->
                        <div class="header__search-history">
                            <h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>
                            <ul class="header__search-history-list">
                                <li class="header__search-history-item">
                                    <a href="">Item 1</a>
                                </li>
                                <li class="header__search-history-item">
                                    <a href="">Item 2</a>
                                </li>
                                <li class="header__search-history-item">
                                    <a href="">Item 3</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="header__search-select">
                        <span class="header__search-select-label">Trong shop</span>
                        <i class="fas fa-angle-down header__search-select-icon"></i>
                        <ul class="header__search-option">
                            <!-- Dấu tích đi js sau -->
                            <li class="header__search-option-item">
                                <span>Trong shop</span>
                                <i class="fas fa-check"></i>
                            </li>
                            <li class="header__search-option-item">
                                <span>Ngoài shop</span>
                                <i class="fas fa-check"></i>
                            </li>
                        </ul>
                    </div>
                    <button class="header__search-btn">
                        <i class="fas fa-search header__search-btn-icon"></i>
                    </button>
                </div>
                <!-- Cart layout -->
                <div class="header__cart">
                    <div class="header__cart-wrap">
                        <i class="fas fa-shopping-cart header__cart-icon"></i>
                        <span class="header__cart-notify">3</span>
                        <!-- No cart:  Add header__cart-list--no-cart-->
                        <div class="header__cart-list">
                            <!-- Chua co hinh -->
                            <img src="${pageContext.request.contextPath}/Img/download.png" alt="" class="header__cart-no-cart-img">
                            <span class="header__cart-list-no-cart-msg">Chưa có sản phẩm</span>

                            <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                            <ul class="header__cart-list-item">
                                <!-- Cart item -->
                                <li class="header__cart-item">
                                    <img src="${pageContext.request.contextPath}/Img/download.png" alt="" class="header__cart-img">
                                    <div class="header__cart-item-info">
                                        <div class="header__cart-item-head">
                                            <h5 class="header__cart-item-name">Item-name</h5>
                                            <div class="header__cart-item-name-wrap">
                                                <span class="header__cart-item-price">Item-price</span>
                                                <span class="header__cart-item-multi">x</span>
                                                <span class="header__cart-item-quantity">Item-quantity</span>
                                            </div>
                                        </div>
                                        <div class="header__cart-item-body">
                                            <span class="header__cart-item-describtion">Item-describtion</span>
                                            <span class="header__cart-item-remove">Xóa</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="header__cart-item">
                                    <img src="${pageContext.request.contextPath}/Img/download.png" alt="" class="header__cart-img">
                                    <div class="header__cart-item-info">
                                        <div class="header__cart-item-head">
                                            <h5 class="header__cart-item-name">Item-name</h5>
                                            <div class="header__cart-item-name-wrap">
                                                <span class="header__cart-item-price">Item-price</span>
                                                <span class="header__cart-item-multi">x</span>
                                                <span class="header__cart-item-quantity">Item-quantity</span>
                                            </div>
                                        </div>
                                        <div class="header__cart-item-body">
                                            <span class="header__cart-item-describtion">Item-describtion</span>
                                            <span class="header__cart-item-remove">Xóa</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="header__cart-item">
                                    <img src="${pageContext.request.contextPath}/Img/download.png" alt="" class="header__cart-img">
                                    <div class="header__cart-item-info">
                                        <div class="header__cart-item-head">
                                            <h5 class="header__cart-item-name">Item-name</h5>
                                            <div class="header__cart-item-name-wrap">
                                                <span class="header__cart-item-price">Item-price</span>
                                                <span class="header__cart-item-multi">x</span>
                                                <span class="header__cart-item-quantity">Item-quantity</span>
                                            </div>
                                        </div>
                                        <div class="header__cart-item-body">
                                            <span class="header__cart-item-describtion">Item-describtion</span>
                                            <span class="header__cart-item-remove">Xóa</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <a href="#"><button class="btn btn--primary header__cart-view-btn">Xem giỏ hàng</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="content">
    <!-- Category -->
    <div class="category js-cate">
        <ul class="category__list">
            <div class="category__item-wrap">
                <li class="category__heading">
                    <h3 class="category__header">Danh mục sản phẩm</h3>
                </li>
                <div class="line"></div>
                <li class="category__item js-category__item">
                    Category-1
                    <div class="js-sub-category sub-category">
                        <ul class="sub-category__list">
                            <li class="sub-category__item">SubCate1</li>
                            <div class="line"></div>
                            <li class="sub-category__item">SubCate2</li>
                            <div class="line"></div>
                            <li class="sub-category__item">SubCate3</li>
                        </ul>
                    </div>
                </li>
                <div class="line"></div>
                <li class="category__item">
                    Category-2
                </li>
                <div class="line"></div>
                <li class="category__item">
                    Category-3
                </li>
            </div>
        </ul>
    </div>
</div>
<!-- Modal -->
<div class="modal login-modal js-modal">
<div class="modal__overlay js-modal__overlay">

</div>
<div class="modal__body">
    <div class="login-form">
        <div class="login-form__container js-login-form__container">
            <div class="login__header">
                <h3 class="login__heading">Đăng nhập</h3>
                <div class="js-escape-btn">
                    <i class="fas fa-times escape-btn"></i>
                </div>
            </div>
            <form action="" method="post">
                <div class="login-form__form">
                    <input type="text" class="login-form__input" placeholder="Tài khoản">
                </div>
                <div class="login-form__form">
                    <input type="password" class="login-form__input" placeholder="Mật khẩu">
                    <div class="login-form__more">
                        <a href="" class="login-form__more-link login-form__more-forgetpass">Quên mật khẩu</a>
                        <a href="" class="login-form__more-link">Cần trợ giúp?!</a>
                    </div>
                </div>
                <div class="login-form__btn">
                    <button class="btn btn--primary btn--login">ĐĂNG NHẬP</button>
                </div>
                <div class="login-form__socials">
                    <div class="-or-">
                        <div class="line"></div>
                        <span class="text-between">HOẶC</span>
                        <div class="line"></div>
                    </div>
                    <div class="login-form__socials-icon">
                        <a href=""><i class="fab fa-facebook login-form__socials-icon-fb"></i></a>
                        <a href=""><i class="fab fa-google"></i></a>
                        <a href=""><i class="fab fa-apple login-form__socials-icon-apple"></i></a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script src="${pageContext.request.contextPath}/views/JS/Header.js"></script>
