<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<t:main>
 <jsp:attribute name="css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Register.css">
  </jsp:attribute>
  <jsp:attribute name="js">
    <script>
      $('#frmRegister').on('submit', function (e) {
        e.preventDefault();

        const email = $('#txtEmail').val();
        if (email.length === 0) {
          alert('Invalid email.');
          return;
        }

        $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?user=' + email, function (data) {
          if (data === true) {
            $('#frmRegister').off('submit').submit();
          } else {
            alert('Email is not available.');
          }
        });
      });

      $('#txtName').select();
    </script>
  </jsp:attribute>
  <jsp:body>
    <table>
      <tr>
        </div>
      </tr>
      <tr>
        <div class="container-signup">
          <img src="${pageContext.request.contextPath}/Img/auction.png" class="signup-more" alt="auction" style="height: 871px">
          <div class="wrap-signup">

            <form class="signup-form" action="" method="post" id="frmRegister">
              <span class="signup-form-title register__heading">Đăng Ký</span>

              <div class="wrap-input">
                <span class="lable-input">Họ và tên</span>
                <input class="input" type="text" id="txtName" name="name" placeholder="Họ và tên của bạn"  required>
                <span class="focus-input"></span>
              </div>

              <div class="wrap-input">
                <span class="lable-input">Email</span>
                <input class="input" type="email" id="txtEmail" name="email" placeholder="Email của bạn" required>
                <span class="focus-input"></span>
              </div>

              <div class="wrap-input">
                <span class="lable-input">Ngày sinh</span>
                <input class="input" type="date" id="txtDOB" name="dob" placeholder="Ngày sinh của bạn" required>
                <span class="focus-input"></span>
              </div>

              <div class="wrap-input">
                <span class="lable-input">Mật khẩu</span>
                <input class="input" type="password" id="txtPassword" name="rawpwd" placeholder="Mật khẩu của bạn" required>
                <span class="focus-input"></span>
              </div>

              <div class="wrap-input">
                <span class="lable-input">Xác nhận mật khẩu</span>
                <input class="input" type="password"  placeholder="Xác nhận lại mật khẩu" required>
                <span class="focus-input"></span>
              </div>

              <div class="container-signup-form-btn">
                <div class="wrap-signup-form-btn">
                  <button type="submit" class="signup-form-btn btn btn--primary">
                    Đăng ký ngay
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </tr>
    </table>
  </jsp:body>
</t:main>