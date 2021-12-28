<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<header>
  <title>Chilldingo</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Register.css">
  <script src="https://www.google.com/recaptcha/api.js"></script>
  <script type="text/javascript">
    var onloadCallback = function() {
      alert("grecaptcha is ready!");
    };
  </script>
  <script type="text/javascript">
    var onloadCallback = function() {
      grecaptcha.render('captcha', {
        'sitekey' : '6Le1gdQdAAAAAPq80moWg3VdIyceo5jl2QFotdhI',
      });
    };
  </script>
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
</header>
<body style="margin: 0">
  <table>
      <tr>
        <div style="background-image: linear-gradient( #1ab7ea, #48c5ee, #6dd1f1, #8adaf4); display: flex; align-items: center;">
          <h2 class="logo">AUCTION</h2>
        </div>
      </tr>
      <tr>
        <div class="container-signup" style="margin: 0">
          <img src="${pageContext.request.contextPath}/Img/auction.png" class="signup-more" alt="auction" style="height: 871px">
          <div class="wrap-signup">

            <form class="signup-form" action="${pageContext.request.contextPath}/Account/Register" method="post" id="frmRegister">
              <span class="signup-form-title">Đăng Ký</span>

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
              <div id="captcha"></div>
              <div class="container-signup-form-btn">
                <div class="wrap-signup-form-btn">
                  <button type="submit" class="signup-form-btn">
                    Đăng ký ngay
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </tr>
    </table>
  <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
</body>
</html>