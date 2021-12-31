<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<header>
  <title>Chilldingo</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Register.css">
  <script src="https://www.google.com/recaptcha/api.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
  <script type="text/javascript">
    var onloadCallback = function() {
      grecaptcha.render('captcha', {
        'sitekey' : '6Le1gdQdAAAAAPq80moWg3VdIyceo5jl2QFotdhI',
      });
    };

    $('#frmRegister').on('submit', function (e) {
      e.preventDefault();
      console.log("here")

      const email = $('#txtEmail').val();
      if (email.length === 0) {
        alert('Invalid email.');
        return;
      }

      $.getJSON('${pageContext.request.contextPath}/Account/IsAvailable?email=' + email, function (data) {
        if (data === true) {
          $('#frmRegister').off('submit').submit();
          console.log('test')
        } else {
          alert('Email is not available.');
        }
      });
    });

    $('#txtName').select();
  </script>
</header>
<style>
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
  .focus-input{
    color: var(--primary-color);
  }

  .header__logo{
    /* width: 200px; */
    margin-right: 26px;
  }
  .header__logo-img{
    width: 120px;
  }
</style>
<body style="margin: 0">
  <table>
      <tr>
        <div style="background-image: linear-gradient( #1ab7ea, #48c5ee, #6dd1f1, #8adaf4); display: flex; align-items: center;">
          <div class="header__logo">
            <a href="${pageContext.request.contextPath}/Home"><img class="header__logo-img" src="${pageContext.request.contextPath}/Img/download.png" alt="Logo"></a>
          </div>
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
                <div class="wrap-signup-form-btn" style="width: 100%">
                  <button type="submit" class=" btn btn--primary signup-form-btn" style="width: 100%; margin-top: 10px">
                    Đăng ký
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