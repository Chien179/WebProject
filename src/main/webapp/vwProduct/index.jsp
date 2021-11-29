<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/11/2021
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<style>
    div.card:hover, div.card:active{
        background-color: #F7F7F7; cursor: pointer}
    .martop{
        margin-top: -10px !important;
    }
</style>
<head>
    <title>Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <c:forEach begin="0" end="11" varStatus="loop">
            <div class="card card border-secondary h-60 col-4" style="width: 22rem; margin: 10px 0px 10px 20px">
                <img src="image.jpg" style="padding: 20px 10px 0px 12px"  alt="House">
                <div class="card-body">
                    <h1 class="card-title pt-0" style="color: #337ab7; font-size: 20px">House</h1>
                    <p class="card-text" style="font-size: 12px; font-weight: bold">Ngày đăng: 1/12/2021</p>
                    <p class="card-text" style="font-size: 14px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                    <p class="card-text martop" style="font-size: 16px; color: green; font-weight: bold"><fmt:formatNumber value="${3000000000}" type="currency"/>
                        <span class="float-end" style="color: black">7 ngày</span></p>

                    <p class="card-text" style="font-size: 14px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                    <p class="card-text martop" style="font-size: 16px; font-weight: bold">10<span class="float-end">Nguyen Huu Dang</span></p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/e7f075a2cb.js" crossorigin="anonymous"></script>
</body>
</html>

