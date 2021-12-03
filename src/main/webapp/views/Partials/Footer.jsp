<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Footer.css">
    </jsp:attribute>
    <jsp:body>
        <div id="footer">
            <div class="footer__container">
                <div class="footer__logo">
                    <a href="https://hcmute.edu.vn/" target="_blank">
                        <img class="footer_spkt" src="../../Img/spktlogo-removebg-preview.png" alt="Logo-Spkt">
                    </a>
                </div>
                <div class="footer__info">
                    <div class="footer__info-GV">
                        <span>Lecture name: Ngô Ngọc Đăng Khoa</span>
                        <div class="line"></div>
                    </div>
                    <span>Students name</span>
                    <div class="footer__info-SV">
                        <div class="width25">
                            <span>Nguyễn Minh Chiến</span>
                            <br>
                            <span>19110000</span>
                        </div>
                        <div class="width25">
                            <span>Nguyễn Hữu Đăng</span>
                            <br>
                            <span>19110187</span>
                        </div>
                        <div class="width25">
                            <span>Nguyễn Minh Khang</span>
                            <br>
                            <span>19110000</span>
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
                            <img class="footer__logo-img" src="../../Img/shopee-logo.png" alt="Shopee Logo">
                        </a>
                        <a href="https://fullstack.edu.vn/" target="_blank">
                            <img class="footer__logo-img" src="../../Img/f8-logo.png" alt="F8 Logo">
                        </a>
                        <a href="https://tiki.vn/" target="_blank">
                            <img class="footer__logo-img" src="../../Img/tiki-logo-removebg-preview.png" alt="Tiki Logo">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>