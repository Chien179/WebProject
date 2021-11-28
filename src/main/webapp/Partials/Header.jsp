<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../CSS/Main.css">
    <link rel="stylesheet" href="../CSS/Header.css">
    <title>Chilldingo</title>
</head>
<body>
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
                                        <img src="../Img/download.png" alt="" class="header__notify-img">
                                        <div class="header__notify-info">
                                            <span class="header__notify-name">Item-name</span>
                                            <span class="header__notify-description">Item-description</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="header__notify-item">
                                    <a href="" class="header__notify-link">
                                        <img src="../Img/download.png" alt="" class="header__notify-img">
                                        <div class="header__notify-info">
                                            <span class="header__notify-name">Item-name</span>
                                            <span class="header__notify-description">Item-description</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="header__notify-item">
                                    <a href="" class="header__notify-link">
                                        <img src="../Img/download.png" alt="" class="header__notify-img">
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
                    <li class="nav-item nav-item--separate">
                        <a href="" class="nav-item-link nav-item-strong">
                            <i class="fas fa-user-plus"></i>
                            Đăng ký
                        </a>
                    </li>
                    <li class="nav-item nav-item-strong">
                        <i class="fas fa-sign-in-alt"></i>
                        <a class="js-login">Đăng nhập</a>
                    </li>
                </ul>
            </nav>
            <!-- Header search -->
            <div class="header-with-search">
                <div class="header__cate-btn js-cate-btn">
                    <i class="fas fa-bars header__cate-icon"></i>
                </div>
                <div class="header__logo">
                    <a href="#"><img class="header__logo-img" src="../Img/download.png" alt="Logo"></a>
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
                            <img src="../Img/download.png" alt="" class="header__cart-no-cart-img">
                            <span class="header__cart-list-no-cart-msg">Chưa có sản phẩm</span>

                            <h4 class="header__cart-heading">Sản phẩm đã thêm</h4>
                            <ul class="header__cart-list-item">
                                <!-- Cart item -->
                                <li class="header__cart-item">
                                    <img src="../Img/download.png" alt="" class="header__cart-img">
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
                                    <img src="../Img/download.png" alt="" class="header__cart-img">
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
                                    <img src="../Img/download.png" alt="" class="header__cart-img">
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