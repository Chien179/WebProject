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
    </jsp:attribute>
    <jsp:body>
        <div class="User__container">
            <div class="User__img-container">
                <img class="User__img" src="${pageContext.request.contextPath}/Img/download.png" alt="Ảnh đại diện">
            </div>
            <form class="User__info-form" method="post" onsubmit="return validateMyForm()">
                <div class="User__info-container">
                    <div class="User__info User__info-id-container">
                        <input style="display: none" name="id" type="text" class="User__info-id-input" value="${users.id}" required>
                    </div>
                    <div class="User__info User__info-name-container">
                        <label class="User__info User__info-name">Họ và Tên:</label>
                        <input name="name" type="text" class="User__info-name-input" placeholder="Tên của bạn" value="${users.name}" required>
                    </div>
                    <div class="User__info User__info-mail-container">
                        <label class="User__info User__info-mail">Email:</label>
                        <input  type="email" class="User__info-mail-input" placeholder="Email của bạn" value="${users.email}" disabled>
                    </div>
                    <div class="User__info User__info-dateofBirth-container">
                        <label class="User__info-dateofBirth">Ngày sinh: </label>
                        <input type="date" class="User__info-dateofBirth-input">
                    </div>
                    <div class="User__info User__info-password-container">
                        <label class="User__info-password">Mật khẩu: </label>
                        <input required type="password" class="User__info-password-input" name="password">
                    </div>
                    <div class="User__info User__info-new-password-container">
                        <label class="User__info-new-password">Mật khẩu mới: </label>
                        <input  type="password" class="User__info-new-password-input">
                    </div>
                    <div class="User__info User__info-retype-password-container">
                        <label class="User__info-retype-password">Nhập lại mật khẩu: </label>
                        <input  type="password" class="User__info-retype-password-input">
                    </div>
                    <div class="User__info User__info-checkbox-container">
                        <label class="User__info"></label>
                        <input id="User__info-checkbox" class="User__info-checkbox" type="checkbox">
                        <label for="User__info-checkbox" class="User__info-checkbox-label">Chỉnh sửa mật khẩu</label>
                    </div>
                    <div class="User__info-btn-container">
                        <label class="User__info"></label>
                        <button class="btn btn--primary User__info-btn" formaction="${pageContext.request.contextPath}/Account/UserUpdate">Lưu thay đổi</button>
                    </div>
                </div>
            </form>

        </div>
        <script>
            const submitForm=document.querySelector('.User__info-form');
            const passwordInput = document.querySelector('.User__info-password-input');
            const newpasswordInput = document.querySelector('.User__info-new-password-input');
            const newpasswordContainer = document.querySelector('.User__info-new-password-container');
            const repassowrdInput = document.querySelector('.User__info-retype-password-input');
            const repassowrdContainer = document.querySelector('.User__info-retype-password-container');
            const button = document.querySelector('.User__info-btn');
            const checkBox=document.querySelector('.User__info-checkbox');
            const checkBoxLabel=document.querySelector('.User__info-checkbox-label');

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
            function validateMyForm()
            {
                if(checkBox.checked == true){
                    if(!(passwordInput.value === "${users.password}" && newpasswordInput.value === repassowrdInput.value)) {
                        alert("Mật khẩu không chính xác");
                        // returnToPreviousPage();
                        return false;
                    }

                    alert("Chỉnh sửa thông tin thành công!");
                    return true;
                }
                else{
                    if(passwordInput.value !== "${users.password}"){
                        alert("Mật khẩu chưa chính xác");
                        return false;
                    }
                    alert("Cập nhật thông tin thành công!");
                    return true;
                }

            }
            function returnToPreviousPage(){
                window.history.back();
            }

            checkBox.addEventListener('click', showhideInputpassowrd);
            window.addEventListener('click', showhideInputpassowrd);
        </script>
    </jsp:body>
</t:main>
