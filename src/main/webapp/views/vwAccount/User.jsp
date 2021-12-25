<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/User.css">
    </jsp:attribute>
    <jsp:body>
        <div class="User__container">
            <div class="User__img-container">
                <img class="User__img" src="../../Img/download.png" alt="Ảnh đại diện">
            </div>
            <div class="User__info-container">
                <div class="User__info User__info-name-container">
                    <label class="User__info User__info-name">Tên:</label>
                    <input type="text" class="User__info-name-input">
                </div>
                <div class="User__info User__info-dateofBirth-container">
                    <label class="User__info-dateofBirth">Ngày sinh: </label>
                    <input type="date" class="User__info-dateofBirth-input">
                </div>
                <div class="User__info User__info-password-container">
                    <label class="User__info-password">Mật khẩu: </label>
                    <input type="password">
                </div>
                <div class="User__info User__info-password-container">
                    <label class="User__info-password">Mật khẩu mới: </label>
                    <input type="password">
                </div>
                <div class="User__info User__info-retype-password-container">
                    <label class="User__info-retype-password">Nhập lại mật khẩu: </label>
                    <input type="password">
                </div>
                <div class="User__info-btn-container">
                    <label class="User__info"></label>
                    <button class="btn btn--primary User__info-btn">Lưu thay đổi</button>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>
