<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.ute.webproject.beans.Category>"/>
<jsp:useBean id="authUser" scope="session" type="com.ute.webproject.beans.User" />
<jsp:useBean id="subCate" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Header.css">
<meta name="google-signin-client_id" content="477326920799-ue1c2om427obpj9bt1j7qsgulmmdi3nj.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<style>
    /* Header */
    #header{
        height: var(--header-height);
        background-image: linear-gradient( #1ab7ea, #48c5ee, #6dd1f1, #8adaf4);
        position: fixed;
        width: 100%;
        z-index: 2;
    }
    .header__nav{
        display: flex;
        justify-content: flex-end;
    }
    .nav-list{
        list-style: none;
        margin: 4px 0 0 0;
    }
    .nav-item{
        margin: 10px 8px 0;
        cursor: pointer;
        position: relative;
    }
    .nav-item,
    .nav-item-link{
        display: inline-block;
        font-size: 1.5rem;
        color: var(--white-color);
        text-decoration: none;
        font-weight: 300;
        padding-bottom: 2px;
        font-family: arial, sans-serif !important;

    }
    .nav-item:hover,
    .nav-item-link:hover{
        color: rgba(255, 255, 255, 0.7);
        text-decoration: none;
    }
    .nav-item:hover .header__notify{
        display: block;
        z-index: 1;
    }
    .nav-item-strong{
        font-weight: 600;
    }
    .nav-item--separate::after{
        content: "";
        display: block;
        position: absolute;
        width: 1px;
        height: 16px;
        border-left: 1px solid #8adaf4;
        right: -9px;
        top: 50%;
        transform: translateY(-50%);
    }

    /* Header notify */
    .header__notify{
        position: absolute;
        top: 120%;
        width: 404px;
        background-color: white;
        right: 0;
        border: 1px solid #d3d3d3;
        cursor: default;
        display: none;
        animation: HoverGrow ease-in 0.2s;
        /* Tối ưu chuyển động bằng will change */
        will-change: opacity, transform;
        transform-origin: calc(100% - 20px) 0;
        border-radius: 3px;
        /* overflow: hidden; */
        box-shadow: 0 2px 10px #ccc;
    }
    .header__notify::before{
        content: "";
        border-width: 20px 26px;
        border-style: solid;
        border-color: transparent transparent var(--white-color) transparent;
        position: absolute;
        right: 0;
        top: -30px;
    }
    .header__notify::after{
        content: "";
        display: block;
        position: absolute;
        width: 90px;
        height: 20px;
        right: 0;
        top: -20px;
        /* background-color: red; */
    }
    .header__notify:hover .header__notify{
        display: block;
    }
    .header__notify-header{
        height: 40px;
        background-color: white;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
    }
    .header__notify-header h3{
        color: #999;
        margin: 0 0 0 12px;
        font-weight: 400;
        font-size: 1.4rem;
        line-height: 40px;
    }
    .header__notify-list{
        padding-left: 0;
    }
    .header__notify-item a:hover{
        text-decoration: none !important;
    }
    .header__notify-item{
        /* display: flex; */
    }
    .header__notify-item:hover{
        background-color: rgba(241, 241, 241, 0.7);
    }
    .header__notify-item--viewed{
        background-color: white;
    }
    .header__notify-link{
        padding: calc((65px - 32px) / 2) 0;
        display: flex;
        text-decoration: none;
        background-color: rgba(26, 183, 234, 0.1);
    }
    .header__notify-img{
        width: 48px;
        object-fit: contain;
    }
    .header__notify-info{
        flex: 1;
        margin-left: 12px;
    }
    a.header__notify-link:hover{
        text-decoration: none;
    }
    .header__notify-name{
        display: block;
        font-size: 1.4rem;
        color: var(--black-color);
        font-weight: 600;
        line-height: 1.8rem;
    }
    .header__notify-description{
        display: block;
        font-size: 1.2rem;
        color: #756f6e;
        line-height: 1.6rem;
        margin-top: 4px;
    }
    .header__notify-footer{
        text-align: center;
        padding: 8px 0;
    }
    .header__notify-footer-btn{
        text-decoration: none;
        color: var(--black-color);
        font-size: 1.4rem;
        font-weight: 600;
    }
    .header__notify-footer-btn:hover{
        color: var(--primary-color);
    }
    .header-with-search{
        display: flex;
        height: var(--header-with-search-height);
        align-items: center;
        margin: 0 8px;
    }
    .header__search{
        display: flex;
        align-items: center;
    }
    .header__search-input-wrap{
        height: 100%;
        flex: 1;
        position: relative;
    }
    .header__search-input{
        width: 100%;
        height: 100%;
        border: none;
        outline: none;
        font-size: 1.5rem;
        color: var(--text-color);
        padding: 0 16px;
        border-radius: 3px;
    }
    .header__search-input:focus-visible ~
    .header__search-history{
        z-index: 1;
        display: block;
    }
    /* Search history */
    .header__search-history{
        position: absolute;
        top: calc(100% + 2px);
        left: 0;
        width: calc(100% - 16px);
        background-color: var(--white-color);
        border-radius: 3px;
        box-shadow: 0 1px 5px rgb(172, 172, 172);
        display: none;
    }
    .header__search-history-heading{
        margin: 6px 12px;
        font-size: 1.4rem;
        color: #999;
        font-weight: 500;
        cursor: default;
    }
    .header__search-history-list{
        padding-left: 0;
        margin: 6px 0 0;
        overflow: hidden;
    }
    .header__search-history-item{
        height: 38px;
        /* display: block; */
        padding: 0 12px;
    }
    .header__search-history-item:hover{
        background-color: #fafafa;
        cursor: pointer;
    }
    .header__search-history-item a{
        text-decoration: none;
        font-size: 1.4rem;
        color: var(--text-color);
        line-height: 38px;
    }
    .header__search-select{
        border-left: 1px solid #e8e8e8;
        padding-left: 16px;
        position: relative;
        cursor: default;
    }
    .header__search-select::after{
        content: "";
        display: block;
        width: 100%;
        height: 18px;
        /* background-color: red; */
        position: absolute;
        top: 107%;
        right: calc(100% - 125px);
    }
    .header__search-select:hover
    .header__search-option{
        z-index: 1;
        display: block;
    }
    .header__search-select-label{
        font-size: 1.4rem;
        color: var(--text-color);
    }
    .header__search-select-icon{
        font-size: 1.5rem;
        margin: 0 16px 0 8px;
        position: relative;
        top: 1px;
        color: rgb(131, 131, 131);
    }
    .header__search-option{
        position: absolute;
        right: 0;
        top: 178%;
        border-radius: 3px;
        width: 126px;
        box-shadow: 0 1px 2px #ccc;
        padding-left: 0;
        /* overflow: hidden; */
        display: none;
        animation: fadeIn ease-in 0.2s;
    }
    .header__search-option-item{
        background-color: var(--white-color);
        /* background-color: black; */
        padding: 8px 8px;
        /* text-align: right; */
    }
    .header__search-option-item:first-child{
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
    }
    .header__search-option-item:last-child{
        border-bottom-left-radius: 3px;
        border-bottom-right-radius: 3px;
    }
    .header__search-option-item:hover{
        background-color: #fafafa;
        cursor: pointer;
    }
    .header__search-option-item span{
        font-size: 1.4rem;
        color: var(--text-color);
        margin-left: 8px;
    }
    .header__search-option-item i{
        font-size: 1.2rem;
        color: var(--primary-color);
        margin-left: 12px;
    }
    .header__search-btn{
        background-color: var(--primary-color);
        border: none;
        height: 34px;
        border-radius: 3px;
        margin-right: 3px;
        width: 60px;
        outline: none;
    }
    .header__search-btn:hover{
        background-color: #63c5e4;
        cursor: pointer;
    }
    .header__search-btn-icon{
        font-size: 1.4rem;
        color: var(--white-color);
    }
    .header__cate-btn{
        width: 30px;
        text-align: center;
    }
    .header__cate-icon{
        color: var(--white-color);
        cursor: pointer;
        font-size: 2.4rem;
    }
    .header__cate-icon:hover{
        color: rgba(255, 255, 255, 0.7);
    }
    .header__logo{
        /* width: 200px; */
        margin-right: 26px;
    }
    .header__logo-img{
        width: 120px;
    }
    .header__search{
        background-color: var(--white-color);
        flex: 1;
        height: 40px;
        border-radius: 3px;
    }
    .header__account{
        width: 210px;
        text-align: center;
        position: relative;
    }
    .header__account-wrap{
        position: relative;
        /*display: inline-block;*/
        padding: 0 12px;
        cursor: pointer;
        display: flex;
        align-items: flex-end;
    }
    .header__account-icon{
        font-size: 2.5rem;
        color: var(--white-color);
    }
    .header__account-username{
        font-size: 1.5rem;
        color: var(--white-color);
        margin-left: 2px;
    }
    .header__account-wrap>.fa-sort-down{
        color: var(--white-color);
        margin: auto 0 auto 2px;
        font-size: 1.5rem;
    }
    .header__account-wrap:hover
    .header__account-list{
        display: block;
    }
    .header__account-wrap:hover
    .header__account-icon,
    .header__account-wrap:hover
    .header__account-username,
    .header__account-wrap:hover
    .fa-sort-down{
        color: rgba(255, 255, 255, 0.7);
    }
    .header__account:hover
    .header__account-list{
        display: block;
    }
    .header__account-list{
        position: absolute;
        top: calc(100% + 9px);
        background-color: var(--white-color);
        right: -3px;
        width: 180px;
        border-radius: 3px;
        cursor: default;
        box-shadow: 0 2px 10px #ccc;
        display: none;
        animation: fadeIn ease-in 0.2s;
    }
    .header__account-list::before{
        position: absolute;
        content: "";
        right: 32%;
        top: -30px;
        border-width: 20px 25px;
        border-style: solid;
        border-color: transparent transparent var(--white-color) transparent;
        cursor: pointer;
    }
    .header__account::after{
        display: block;
        content: "";
        position: absolute;
        width: 100%;
        height: 25px;
        /*background-color: red;*/
        right: -10px;
    }
    .header__account-list-heading{
        text-align: left;
        /*margin: 8px 0 8px 12px;*/
        font-size: 1.4rem;
        color: #999;
        font-weight: 400;
        margin: 10px 0 10px;
    }
    .header__account-list-item{
        text-align: center;
        padding: 5px 0;
        color: var(--text-color);
        margin: 0 20px;
        border-radius: 3px;
    }
    .header__account-list-item:hover{
        background-image: linear-gradient( to right, #1ab7ea, #48c5ee, #6dd1f1, #8adaf4);
        color: var(--white-color);
        cursor: pointer;
    }
    /*.header__cart-list--no-cart .header__cart-no-cart-img,*/
    /*.header__cart-list--no-cart .header__cart-list-no-cart-msg{*/
    /*    display: block;*/
    /*    margin-left: auto;*/
    /*    margin-right: auto;*/
    /*}*/
    /*.header__cart-no-cart-img{*/
    /*    width: 60%;*/
    /*    display: none;*/
    /*}*/
    /*.header__cart-list--no-cart{*/
    /*    padding: 24px 0;*/
    /*}*/
    /*.header__cart-list-no-cart-msg{*/
    /*    display: none;*/
    /*    font-size: 1.4rem;*/
    /*    margin-top: 12px;*/
    /*    color: var(--text-color);*/
    /*}*/
    /*.header__cart-notify{*/
    /*    position: absolute;*/
    /*    padding: 1px 7px;*/
    /*    background-color: var(--white-color);*/
    /*    color: var(--primary-color);*/
    /*    font-size: 1.4rem;*/
    /*    line-height: 1.4rem;*/
    /*    border-radius: 10px;*/
    /*    border: 1px solid var(--primary-color);*/
    /*    top: -8px;*/
    /*    right: 0;*/
    /*}*/
    /*.header__cart-list-item{*/
    /*    padding-left: 0;*/
    /*}*/
    /*.header__cart-item{*/
    /*    display: flex;*/
    /*    align-items: center;*/
    /*    cursor: pointer;*/
    /*}*/
    /*.header__cart-item:hover{*/
    /*    background-color: #fbfbfb;*/
    /*}*/
    /*.header__cart-img{*/
    /*    width: 42px;*/
    /*    height: 42px;*/
    /*    margin: 12px;*/
    /*    border: 1px solid var(--border-color);*/
    /*}*/
    /*.header__cart-item-info{*/
    /*    width: 100%;*/
    /*    margin-right: 12px;*/
    /*}*/
    /*.header__cart-item-head{*/
    /*    display: flex;*/
    /*    align-items: center;*/
    /*    justify-content: space-between;*/
    /*    width: 100%;*/
    /*}*/
    /*.header__cart-item-name{*/
    /*    font-size: 1.4rem;*/
    /*    font-weight: 500;*/
    /*    color: var(--text-color);*/
    /*    margin: 0;*/
    /*}*/
    /*.header__cart-item-price{*/
    /*    font-size: 1.4rem;*/
    /*    color: var(--primary-color);*/
    /*}*/
    /*.header__cart-item-multi{*/
    /*    font-size: 0.9rem;*/
    /*    color: gray;*/
    /*    margin: 0 4px;*/
    /*}*/
    /*.header__cart-item-quantity{*/
    /*    color: var(--black-color);*/
    /*    font-size: 1.2rem;*/
    /*}*/
    /*.header__cart-item-body{*/
    /*    display: flex;*/
    /*    justify-content: space-between;*/
    /*}*/
    /*.header__cart-item-describtion{*/
    /*    color: gray;*/
    /*    font-size: 1.2rem;*/
    /*}*/
    /*.header__cart-item-remove{*/
    /*    color: var(--text-color);*/
    /*    font-size: 1.2rem;*/
    /*    cursor: pointer;*/
    /*}*/
    /*.header__cart-item-remove:hover{*/
    /*    color: var(--primary-color);*/
    /*}*/
    /*.header__cart-view-btn{*/
    /*    margin-bottom: 4px;*/
    /*}*/
    /* Up */
    .Up{
        position: -webkit-sticky;
        position: sticky;
        left: 95%;
        display: none;
        bottom: 10px;
        background-color: rgba(0, 0, 0, 0.5);
        width: 32px;
        height: 32px;
        border-radius: 20px;
        animation: fadeIn ease 0.2s;
    }
    .Up.open{
        display: flex;
    }
    .Up__icon{
        font-size: 2rem !important;
        margin: 7px auto 0;
        color: white;
    }
    .Up:hover{
        background-color: rgba(0, 0, 0, 0.6);
        cursor: pointer;
    }
    .Up:hover .Up__icon{
        color: white;
    }
    /* Login form */
    .login-modal.open{
        display: flex;
    }
    .modal__overlay{
        background-color: rgba(0, 0, 0, 0.4);
        position: absolute;
        width: 100%;
        height: 100%;
    }
    .modal__body{
        background-color: var(--white-color);
        margin: auto;
        /* position: relative; */
        z-index: 1;
        border-radius: 5px;
    }
    .login-form{
        width: 500px;

    }
    .login-form__container{
        padding: 32px 32px 0;
    }
    .login__header{
        padding-bottom: 24px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
    .escape-btn{
        font-size: 2rem;
        cursor: pointer;
        padding: 10px;
    }
    .escape-btn:hover{
        color: var(--primary-color);
    }
    .login__heading{
        font-size: 2.2rem;
        font-weight: 500;
        color: var(--text-color);
    }

    .login-form__form{

    }
    .login-form__input{
        width: 100%;
        height: 40px;
        border-radius: 5px;
        border: 1px solid var(--border-color);
        margin-top: 8px;
        padding: 0 12px;
        font-size: 1.4rem;
        outline: none;
    }
    .login-form__input:focus-visible{
        border-color: #888;
    }
    .login-form__btn{
        width: 100%;
        margin: 32px 0 5px;
    }
    .btn--login{
        width: 100%;
    }
    .login-form__more{
        display: flex;
        justify-content: flex-end;
        margin: 10px 5px 0 0;
    }
    .login-form__more-link{
        text-decoration: none;
        color: var(--text-color);
        font-size: 1.2rem;
        position: relative;
        /* line-height: 1.2rem; */
    }
    .login-form__more-link + .login-form__more-link{
        padding-left: 10px;
    }
    .login-form__more-link:hover{
        text-decoration: underline;
        color: var(--text-color);
    }
    .login-form__more .login-form__more-forgetpass{
        color: var(--primary-color);
        text-decoration: none;
    }
    .login-form__more-forgetpass::after{
        content: "";
        display: block;
        position: absolute;
        right: -7px;
        top: 1px;
        width: 1px;
        height: 14px;
        border-left: 1px solid var(--black-color);
    }
    .login-form__socials{

    }
    .login-form__socials-icon{
        display: flex;
        font-size: 3rem;
        justify-content: center;
        margin: 10px 0;
        line-height: 5.5rem;
        align-items: center;
    }
    .login-form__socials-icon-apple{
        font-size: 4rem;
        margin-bottom: 9px
        /* align-self: center */
    }
    .login-form__socials-icon a{
        color: var(--text-color);
    }
    .login-form__socials-icon a:hover{
        color: var(--primary-color);
    }
    .login-form__socials-icon a + a{
        margin-left: 5px;
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
</style>
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
                                <a href="${pageContext.request.contextPath}/Account/User?id=${authUser.id}" class="nav-item-link nav-item-strong">
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
                                <a href="${pageContext.request.contextPath}/Account/Register" class="nav-item-link nav-item-strong">
                                    <i class="fas fa-user-plus"></i>
                                    Đăng ký
                                </a>
                            </li>
                            <li class="nav-item nav-item-strong">
                                <a class="js-login nav-item-link nav-item-strong">
                                    <i class="fas fa-sign-in-alt"></i>
                                    Đăng nhập
                                </a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
            <!-- Header search -->
            <div class="header-with-search">
                <div class="header__cate-btn js-cate-btn" onclick="showhideCate()">
                    <i class="fas fa-bars header__cate-icon"></i>
                </div>
                <div class="header__logo">
                    <a href="${pageContext.request.contextPath}/Home"><img class="header__logo-img" src="${pageContext.request.contextPath}/Img/download.png" alt="Logo"></a>
                </div>
<%--                <form id="searchForm" style="width: 0px" action="${pageContext.request.contextPath}/Product/ByCate/WithName?name=Jacket" method=""></form>--%>
                <div class="header__search">
                    <div class="header__search-input-wrap">
                        <input type="text" class="header__search-input" placeholder="Tìm kiếm..." name="pro">
                        <!-- Search history -->
<%--                        <div class="header__search-history">--%>
<%--                            <h3 class="header__search-history-heading">Lịch sử tìm kiếm</h3>--%>
<%--                            <ul class="header__search-history-list">--%>
<%--                                <li class="header__search-history-item">--%>
<%--                                    <a href="">Item 1</a>--%>
<%--                                </li>--%>
<%--                                <li class="header__search-history-item">--%>
<%--                                    <a href="">Item 2</a>--%>
<%--                                </li>--%>
<%--                                <li class="header__search-history-item">--%>
<%--                                    <a href="">Item 3</a>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
                    </div>
                    <div class="header__search-select">
                        <span class="header__search-select-label">Xếp theo</span>
                        <i class="fas fa-angle-down header__search-select-icon"></i>
                        <ul class="header__search-option">
                            <!-- Dấu tích đi js sau -->
                            <li class="header__search-option-item">
                                <a class="byPrice" href="${pageContext.request.contextPath}/Product/ByCate/ByPrice?name="><span onclick="orderByPrice()">Giá</span></a>
                                <i class="fas fa-check"></i>
                            </li>
                            <li class="header__search-option-item">
                                <a class="byDate" href="${pageContext.request.contextPath}/Product/ByCate/ByDate?name="><span onclick="orderByDate()">Ngày</span></a>
                                <i class="fas fa-check"></i>
                            </li>
                        </ul>
                    </div>
                    <%--
                    <%--                    <a href="#" onclick="document.getElementById('searchForm').submit();">--%>
                    <a class="search_forward" href="${pageContext.request.contextPath}/Product/ByCate/WithName?name=">
                    <button id="search_button" class="header__search-btn" onclick="getSearch()">
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
        <form class="login-form" method="post" id="login-submit" onsubmit="document.getElementById('login-submit').action = document.documentURI;">
            <div class="login-form__container js-login-form__container">
                <div class="login__header">
                    <h3 class="login__heading">Đăng nhập</h3>
                    <div class="js-escape-btn">
                        <i class="fas fa-times escape-btn"></i>
                    </div>
                </div>
                <div class="login-form__form">
                    <input type="text" class="login-form__input" placeholder="Tài khoản" name="email" id="email">
                </div>
                <div class="login-form__form">
                    <input type="password" class="login-form__input" placeholder="Mật khẩu" name="password" id="password">
                    <input id="gg-name" name="gg-name" hidden/>
                    <input id="gg-image" name="gg-image" hidden/>
                    <input id="gg-email" name="gg-email" hidden/>
                    <div class="text-danger" style="font-size: 12px" id="loginError" hidden>
                        Your account and/or password is incorrect, please try again
                    </div>
                    <div class="login-form__more">
                        <a href="" class="login-form__more-link login-form__more-forgetpass">Quên mật khẩu</a>
                        <a href="" class="login-form__more-link">Cần trợ giúp?!</a>
                    </div>
                </div>
                <div class="login-form__btn">
                    <button class="btn btn--primary btn--login" id="login-button" type="submit">ĐĂNG NHẬP</button>
                </div>
                <div class="login-form__socials">
                    <div class="-or-">
                        <div class="line"></div>
                        <span class="text-between">HOẶC</span>
                        <div class="line"></div>
                    </div>
                    <div class="login-form__socials-icon">
                        <a href="#"><i class="fab fa-facebook login-form__socials-icon-fb"></i></a>
                        <a href="#" class="fab fa-google" id="gg-button"></a>
                        <a href=""><i class="fab fa-apple login-form__socials-icon-apple"></i></a>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div id="error" hidden>${hasError}</div>
<div id="auth" hidden>${auth}</div>
<script src="${pageContext.request.contextPath}/views/JS/Header.js"></script>
<script>
    const loginError= (document.querySelector('#error').innerHTML === 'true');

    if (loginError){
        window.addEventListener('load', showLoginModal)
        document.getElementById('loginError').hidden = false
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

    const auth = (document.getElementById('auth').innerHTML === 'true');
    const forward = document.querySelector('.search_forward');
    const inputVal = document.querySelector('.header__search-input');
    const byPrice = document.querySelector('.byPrice');
    const byDate = document.querySelector('.byDate');

    //Đăng nhập bằng google
    window.onload = function(){
        gapi.load('auth2', function() {
            var auth2 = gapi.auth2.init({
                client_id: '477326920799-ue1c2om427obpj9bt1j7qsgulmmdi3nj.apps.googleusercontent.com',
                cookiepolicy: 'single_host_origin',
                scope: 'profile email'
            });
            document.getElementById('gg-button').addEventListener('click', function() {
                auth2.signIn().then(() => {
                    var profile = auth2.currentUser.get().getBasicProfile();
                    var name = profile.getName();
                    var image = profile.getImageUrl();
                    var email = profile.getEmail();
                    document.querySelector('#gg-name').value = name;
                    document.querySelector('#gg-image').value = image;
                    document.querySelector('#gg-email').value = email;
                    document.getElementById('login-submit').submit();
                }).catch((error) => {
                    console.log('Google Sign Up or Login Error: ', error)
                });
            });
        });
    }

    //Full text search
    function getSearch() {
        let searchVal = inputVal.value;
        if(searchVal === null || searchVal ===""){
            //Noi chuoi
            forward.attributes[1].value = "${pageContext.request.contextPath}/Home";
        }
        else
            forward.attributes[1].value += searchVal;
    }

    document.addEventListener("keypress", function (event){
        if (event.keyCode === 13){
            document.getElementById('search_button').click();
        }
    })
    function orderByPrice(){
        let searchVal = inputVal.value;
        if(searchVal === null || searchVal ===""){
            //Noi chuoi
            byPrice.attributes[1].value = "${pageContext.request.contextPath}/Home";
        }
        else
            byPrice.attributes[1].value += searchVal;
    }

    function orderByDate(){
        let searchVal = inputVal.value;
        if(searchVal === null || searchVal ===""){
            //Noi chuoi
            byDate.attributes[1].value = "${pageContext.request.contextPath}/Home";
        }
        else
            byDate.attributes[1].value += searchVal;
    }

    //kiểm tra login rỗng
    document.getElementById('login-submit').addEventListener('submit',function (e){
        if (document.getElementById('email').innerHTML !== null || document.getElementById('password').innerHTML !== null){
            e.preventDefault();
            showLoginModal();
            alert('Vui Lòng Không Để Trống Email Và Mật Khẩu');
        }
    })
</script>
