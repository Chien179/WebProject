<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="users" scope="request" type="com.ute.webproject.beans.User" />
<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/User.css">
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
                /* T???i ??u chuy???n ?????ng b???ng will change */
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

            .User__container{
                min-height: 500px;
                margin: 40px auto 0;
                display: flex;
                min-width: 90%;
            }
            .User__info-container label{
                min-width: 200px;
                text-align: right;
            }
            .User__info-container input{
                min-width: 255px;
                height: 40px;
                border-radius: 5px;
                border: 1px solid var(--border-color);
                margin-top: 8px;
                padding: 0 12px;
                font-size: 1.4rem;
                outline: none;
            }
            .User__info{
                font-size: 2rem;
            }
            .User__info + .User__info{
                margin-top: 10px;
            }
            .User__img{
                max-width: 300px;
            }
            .User__info-name{

            }
            .User__info-new-password-container,
            .User__info-retype-password-container{
                display: none;
            }
            .User__info-new-password-container.show,
            .User__info-retype-password-container.show{
                display: block;
            }
            .User__info-checkbox-container{
                /*width: 563px;*/
                display: flex;
                justify-content: flex-start;
            }
            .User__info .User__info-checkbox{
                margin: 0 0 0 6px;
                min-width: 0;
            }
            .User__info-container .User__info-checkbox-label{
                min-width: 0;
                font-size: 1.5rem;
                margin: auto 0 auto 2px;
            }
            .User__info-btn{
                text-transform: uppercase;
                font-size: 1.5rem;
                margin-top: 10px;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <div class="User__container">
            <div class="User__img-container">
                <img class="User__img" src="${pageContext.request.contextPath}/Img/download.png" alt="???nh ?????i di???n">
            </div>
            <form class="User__info-form" method="post" onsubmit="return validateMyForm()">
                <div class="User__info-container">
                    <div class="User__info User__info-id-container">
                        <input style="display: none" name="id" type="text" class="User__info-id-input" value="${users.id}" required>
                    </div>
                    <div class="User__info User__info-name-container">
                        <label class="User__info User__info-name">H??? v?? T??n:</label>
                        <input name="name" type="text" class="User__info-name-input" placeholder="T??n c???a b???n" value="${users.name}" required>
                    </div>
                    <div class="User__info User__info-mail-container">
                        <label class="User__info User__info-mail">Email:</label>
                        <input  type="email" class="User__info-mail-input" placeholder="Email c???a b???n" value="${users.email}" name="email" disabled>
                    </div>
                    <div class="User__info User__info-dateofBirth-container">
                        <label class="User__info-dateofBirth">Ng??y sinh: </label>
                        <input name="dob" type="date" class="User__info-dateofBirth-input">
                    </div>
                    <div class="User__info User__info-password-container">
                        <label class="User__info-password">M???t kh???u: </label>
                        <input required type="password" class="User__info-password-input" name="oldPass">
                    </div>
                    <div class="User__info User__info-new-password-container">
                        <label class="User__info-new-password">M???t kh???u m???i: </label>
                        <input  type="password" class="User__info-new-password-input" name="newPass">
                    </div>
                    <div class="User__info User__info-retype-password-container">
                        <label class="User__info-retype-password">Nh???p l???i m???t kh???u: </label>
                        <input  type="password" class="User__info-retype-password-input">
                    </div>
                    <div class="User__info User__info-checkbox-container">
                        <label class="User__info"></label>
                        <input id="User__info-checkbox" class="User__info-checkbox" type="checkbox">
                        <label for="User__info-checkbox" class="User__info-checkbox-label">Ch???nh s???a m???t kh???u</label>
                    </div>
                    <div class="User__info-btn-container">
                        <label class="User__info"></label>
                        <button class="btn btn--primary User__info-btn" formaction="${pageContext.request.contextPath}/Account/UserUpdate">L??u thay ?????i</button>
                    </div>
                </div>
            </form>
        </div>
        <div id="oldPassError" hidden>${oldPassError}</div>
        <div id="newPassError" hidden>${newPassError}</div>
        <script>
            const submitForm = document.querySelector('.User__info-form');
            const dateofBirth = document.querySelector('.User__info-dateofBirth-input');
            const passwordInput = document.querySelector('.User__info-password-input');
            const newpasswordInput = document.querySelector('.User__info-new-password-input');
            const newpasswordContainer = document.querySelector('.User__info-new-password-container');
            const repassowrdInput = document.querySelector('.User__info-retype-password-input');
            const repassowrdContainer = document.querySelector('.User__info-retype-password-container');
            const button = document.querySelector('.User__info-btn');
            const checkBox = document.querySelector('.User__info-checkbox');
            const checkBoxLabel = document.querySelector('.User__info-checkbox-label');


            function showhideInputpassowrd(){
                if(checkBox.checked == true){
                    newpasswordContainer.classList.add('show')
                    repassowrdContainer.classList.add('show')
                    newpasswordInput.required = true
                    repassowrdInput.required = true
                    newpasswordInput.name = "password"
                    passwordInput.removeAttribute("name")
                }
                else{
                    newpasswordContainer.classList.remove('show')
                    repassowrdContainer.classList.remove('show')
                    newpasswordInput.required = false
                    repassowrdInput.required = false
                    passwordInput.name = "password"
                    newpasswordInput.removeAttribute("name")
                }
            }

            if(checkBox.checked == true){
                newpasswordContainer.classList.add('show')
                repassowrdContainer.classList.add('show')
                newpasswordInput.required = true
                repassowrdInput.required = true
                newpasswordInput.name = "password"
                passwordInput.removeAttribute("name")
            }
            else{
                newpasswordContainer.classList.remove('show')
                repassowrdContainer.classList.remove('show')
                newpasswordInput.required = false
                repassowrdInput.required = false
                passwordInput.name = "password"
                newpasswordInput.removeAttribute("name")
            }

            function validateMyForm()
            {
                if(dateofBirth.value === null || dateofBirth.value === ""){
                    dateofBirth.value = "2001-01-01"
                }
                if(checkBox.checked == true){
                    if(!(newpasswordInput.value === repassowrdInput.value)) {
                        alert("M???t kh???u nh???p l???i kh??ng kh???p");
                        // returnToPreviousPage();
                        return false;
                    }
                    alert("Ch???nh s???a th??ng tin th??nh c??ng!");
                    return true;
                }
            }
            function returnToPreviousPage(){
                window.history.back();
            }

            const oldPassErr = (document.getElementById('oldPassError').innerHTML === 'true');
            const newPassErr = (document.getElementById('newPassError').innerHTML === 'true');

            if(oldPassErr){
                alert('M???t kh???u kh??ng ????ng!')
            }

            if(newPassErr){
                alert('M???t kh???u m???i tr??ng v???i m???t kh???u c??')
            }

            checkBox.addEventListener('click', showhideInputpassowrd);
            // window.addEventListener('click', showhideInputpassowrd);
        </script>
    </jsp:body>
</t:main>
