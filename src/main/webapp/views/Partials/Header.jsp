<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.ute.webproject.beans.Category>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.webproject.beans.User" />
<jsp:useBean id="subCate" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>

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
                            <li class="nav-item nav-item--separate">
                                <a href="#" class="nav-item-link nav-item-strong">
                                    <i class="fa-solid fa-user"></i>
                                    ${authUser.name}
                                </a>
                            </li>
                            <li class="nav-item nav-item-strong">
                                <i class="fa-solid fa-right-from-bracket"></i>
                                <a class="nav-item-link nav-item-strong" href="#" onclick="document.getElementById('frmLogout').submit();">Đăng xuất</a>
                            </li>
<%--                        <div class="header__account">--%>
<%--                            <div class="header__account-wrap">--%>
<%--                                <i class="fas fa-user header__account-icon"></i>--%>
<%--                                <span class="header__account-username"> ${authUser.name}</span>--%>
<%--                                <i class="fas fa-sort-down"></i>--%>
<%--                            </div>--%>
<%--                            <div class="header__account-list">--%>
<%--                                <ul class="header__account-list-heading">--%>
<%--                                    <li class="header__account-list-item">Tài khoản</li>--%>
<%--                                    <li class="header__account-list-item"><a class="js-login nav-item-link nav-item-strong" href="#" onclick="document.getElementById('frmLogout').submit();">Đăng xuất</a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>
                            <form style="width: 0px" id="frmLogout" method="post" action="${pageContext.request.contextPath}/Account/Logout"></form>
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
                    <a href="${pageContext.request.contextPath}/Home"><img class="header__logo-img" src="${pageContext.request.contextPath}/Img/download.png" alt="Logo"></a>
                </div>
                <form id="searchForm" style="width: 0px" action="${pageContext.request.contextPath}/Product/" method="post"></form>
                <div class="header__search">
                    <div class="header__search-input-wrap">
                        <input type="text" class="header__search-input" placeholder="Tìm kiếm..." name="pro">
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
                    <a href="#" onclick="document.getElementById('searchForm').submit();">
                    <button class="header__search-btn">
                        <i class="fas fa-search header__search-btn-icon"></i>
                    </button>
                    </a>
                </div>
                <!-- Account layout -->
                <div class="header__account">
<%--                    <div class="header__account-wrap">--%>
<%--                        <i class="fas fa-user header__account-icon"></i>--%>
<%--                        <span class="header__account-username">Nguyen Van Son Tung</span>--%>
<%--                        <i class="fas fa-sort-down"></i>--%>
<%--                    </div>--%>
<%--                    <div class="header__account-list">--%>
<%--                        <ul class="header__account-list-heading">--%>
<%--                            <li class="header__account-list-item">Tài khoản</li>--%>
<%--                            <li class="header__account-list-item">Đăng xuất</li>--%>
<%--                        </ul>--%>

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
                   <a href="${pageContext.request.contextPath}/Product"><h3 class="category__header">Danh mục sản phẩm</h3></a>
                </li>
                <c:choose>
                    <c:when test="${categories.size() == 0}">
                        <li class="category__item">
                            Không có dữ liệu
                        </li>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${categories}" var="c">
                            <div class="line"></div>
                            <a href="${pageContext.request.contextPath}/Product/ByCate/ProductByCat?id=${c.catID}">
                                <li class="category__item js-category__item">
                                        ${c.catName}
                                    </a>
                                        <div class="js-sub-category sub-category">
                                            <c:forEach items="${subCate}" var="s">
                                                <c:if test="${s.catID == c.catID}">
                                                    <ul class="sub-category__list">
                                                        <a href="${pageContext.request.contextPath}/Product/ByCate/Detail?id=${s.proID}">
                                                            <li class="sub-category__item">${s.proName}</li>
                                                        </a>
                                                        <div class="line"></div>
                                                    </ul>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                </li>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </ul>
    </div>
</div>
<!-- Modal -->
<div class="modal login-modal js-modal">
    <div class="modal__overlay js-modal__overlay">

    </div>
    <div class="modal__body">
        <form class="login-form" method="post">
            <div class="login-form__container js-login-form__container">
                <div class="login__header">
                    <h3 class="login__heading">Đăng nhập</h3>
                    <div class="js-escape-btn">
                        <i class="fas fa-times escape-btn"></i>
                    </div>
                </div>
                <div class="login-form__form">
                    <input type="text" class="login-form__input" placeholder="Tài khoản" name="email">
                </div>
                <div class="login-form__form">
                    <input type="password" class="login-form__input" placeholder="Mật khẩu" name="password">
                    <div class="text-danger" style="font-size: 12px" id="loginError" hidden>
                        Your account and/or password is incorrect, please try again
                    </div>
                    <div class="login-form__more">
                        <a href="" class="login-form__more-link login-form__more-forgetpass">Quên mật khẩu</a>
                        <a href="" class="login-form__more-link">Cần trợ giúp?!</a>
                    </div>
                </div>
                <div class="login-form__btn">
                    <button class="btn btn--primary btn--login" id="submit">ĐĂNG NHẬP</button>
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
            </div>
        </form>
    </div>
</div>
<div class="error" hidden>${hasError}</div>
<script src="${pageContext.request.contextPath}/views/JS/Header.js"></script>
<script>
    const loginError= Boolean(document.querySelector('.error').innerHTML);

    if (loginError){
        document.getElementById('loginError').hidden = false
        window.addEventListener('load', showLoginModal)
    }

    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }

    function hideLoginModal(){
        document.getElementById('loginError').hidden = true
        modal.classList.remove('open')
    }

    modalOverlay.addEventListener('click', hideLoginModal)
    escapeBtn.addEventListener('click', hideLoginModal)
</script>