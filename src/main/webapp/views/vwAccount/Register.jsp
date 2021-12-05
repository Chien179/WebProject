<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Đăng Ký</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Register.css">
</head>
<body>
<div style="background-image: linear-gradient( #1ab7ea, #48c5ee, #6dd1f1, #8adaf4)" >
  <h2 class="logo">AUCTION</h2>
</div>
<div class="container-signup">
  <div class="signup-more"></div>
  <div class="wrap-signup" >
    <form class="signup-form">
      <span class="signup-form-title">Đăng Ký</span>

      <div class="wrap-input">
        <span class="lable-input">Họ và tên</span>
        <input class="input" type="text" name="name" placeholder="Họ và tên của bạn" required>
        <span class="focus-input"></span>
      </div>

      <div class="wrap-input">
        <span class="lable-input">Email</span>
        <input class="input" type="email" name="email" placeholder="Email của bạn" required>
        <span class="focus-input"></span>
      </div>

      <div class="wrap-input">
        <span class="lable-input">Ngày sinh</span>
        <input class="input" type="date" name="dob" placeholder="Ngày sinh của bạn" required>
        <span class="focus-input"></span>
      </div>

      <div class="wrap-input">
        <span class="lable-input">Địa chỉ</span>
        <input class="input" type="text" name="address" placeholder="Địa chỉ của bạn" required>
        <span class="focus-input"></span>
      </div>

      <div class="wrap-input">
        <span class="lable-input">Mật khẩu</span>
        <input class="input" type="password" name="password" placeholder="Mật khẩu của bạn" required>
        <span class="focus-input"></span>
      </div>
      <div class="wrap-input">
        <span class="lable-input">Xác nhận mật khẩu</span>
        <input class="input" type="password" name="password" placeholder="Xác nhận lại mật khẩu" required>
        <span class="focus-input"></span>
      </div>
      <div class="container-signup-form-btn">
        <div class="wrap-signup-form-btn">
          <button class="signup-form-btn">Đăng ký ngay</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>
