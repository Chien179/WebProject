<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Product.css">
    </jsp:attribute>
    <jsp:body>
        <div class="container-fluid">
            <div class="row p-5">
            <c:forEach begin="0" end="11" varStatus="loop">
                <div class="card card border-secondary h-60" style="width: 350px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 400px;">
                    <img src="${pageContext.request.contextPath}/Img/download.png" style="padding: 20px 10px 0px 12px" alt="House">
                    <div class="card-body">
                        <h1 class="card-title pt-0" style="color: #337ab7; font-size: 20px">Hollow Knight</h1>
                        <p class="card-text card-text-config" style="font-size: 12px; font-weight: bold">Ngày đăng: 1/12/2021</p>
                        <p class="card-text card-text-config" style="font-size: 14px">BID HIỆN TẠI <span class="float-end">THỜI GIAN CÒN LẠI</span></p>
                        <p class="card-text card-text-config martop" style="font-size: 16px; color: green; font-weight: bold"><fmt:formatNumber value="${165000}" type="currency"/>
                            <span class="float-end" style="color: black">7 ngày</span></p>

                        <p class="card-text card-text-config" style="font-size: 14px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                        <p class="card-text card-text-config martop" style="font-size: 16px; font-weight: bold">10<span class="float-end">Nguyen Huu Dang</span></p>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
    </jsp:body>
</t:main>

