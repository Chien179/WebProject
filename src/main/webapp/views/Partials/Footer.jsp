<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Footer.css">
<style>
    #footer{
        position: absolute;
        width: 100%;
        top: 100%;
    }
    #footer .line{
        margin: 10px 0;
        background-color: var(--white-color);
    }
    .footer__container{
        background-image: linear-gradient( 0, #1ab7ea, #48c5ee, #6dd1f1, #8adaf4);
        height: 120px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        position: sticky;
        bottom: 0;
    }
    .footer_spkt{
        height: 120px;
    }
    .footer__info{
        color: var(--white-color);
        text-shadow: 2px 2px 5px black;
        font-size: 1.5rem;
        margin-top: 10px;
        text-align: center;
        cursor: default;
    }
    .footer__info-SV{
        display: flex;
        margin-top: 10px;
    }
    .footer__info-SV .width25 + .width25{
        margin-left: 10px;
    }
    .footer__info-SV .width25:last-child{
        width: 173px;
    }
    .footer__thamkhao{
        margin-right: 36px;
    }
    .footer__thamkhao-heading{
        font-size: 1.5rem;
        margin-top: 10px;
        display: block;
        color: var(--white-color);
        text-shadow: 2px 2px 5px black;
    }
    .footer__logo{
        width: 120px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .footer__logo-img{
        width: 33px;
    }
</style>
<div id="footer">
    <div class="footer__container">
        <div class="footer__logo">
            <a href="https://hcmute.edu.vn/" target="_blank">
                <img class="footer_spkt" src="${pageContext.request.contextPath}/Img/spktlogo-removebg-preview.png" alt="Logo-Spkt">
            </a>
        </div>
        <div class="footer__info">
            <div class="footer__info-GV">
                <span>Lecturer name: Ngô Ngọc Đăng Khoa</span>
                <div class="line"></div>
            </div>
            <span>Students name</span>
            <div class="footer__info-SV">
                <div class="width25">
                    <span>Nguyễn Minh Chiến</span>
                    <br>
                    <span>19110173</span>
                </div>
                <div class="width25">
                    <span>Nguyễn Hữu Đăng</span>
                    <br>
                    <span>19110187</span>
                </div>
                <div class="width25">
                    <span>Nguyễn Minh Khang</span>
                    <br>
                    <span>19110223</span>
                </div>
                <div class="width25">
                    <span>Nguyễn Văn Sơn Tùng</span>
                    <br>
                    <span>19110018</span>
                </div>
            </div>
        </div>
        <div class="footer__thamkhao">
            <span class="footer__thamkhao-heading">Nguồn tham khảo</span>
            <div class="line"></div>
            <div class="footer__logo">
                <a href="https://shopee.vn/" target="_blank">
                    <img class="footer__logo-img" src="${pageContext.request.contextPath}/Img/shopee-logo.png" alt="Shopee Logo">
                </a>
                <a href="https://fullstack.edu.vn/" target="_blank">
                    <img class="footer__logo-img" src="${pageContext.request.contextPath}/Img/f8-logo.png" alt="F8 Logo">
                </a>
                <a href="https://tiki.vn/" target="_blank">
                    <img class="footer__logo-img" src="${pageContext.request.contextPath}/Img/ebaylogo.png" alt="Ebay Logo">
                </a>
            </div>
        </div>
    </div>
</div>