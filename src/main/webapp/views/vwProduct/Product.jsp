<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.webproject.beans.Product>"/>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Product.css">
    </jsp:attribute>
    <jsp:attribute name="js">
         <script>
             let endDate = document.querySelector('.remaining');
             // Update the count down every 1 second
             let x = setInterval(function() {
                 for (let i =0; i < endDate.length; i++){
                     // Set the date we're counting down to
                     let countDownDate = new Date('2021-12-14T14:00').getTime();

                     // Get today's date and time
                     let now = new Date().getTime();

                     // Find the distance between now and the count down date
                     let distance = countDownDate - now;

                     // Time calculations for days, hours, minutes and seconds
                     let days = Math.floor(distance / (1000 * 60 * 60 * 24));
                     let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                     let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                     let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                     // Output the result in an element with id="remaining"
                    document.querySelector('.test').innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s ";

                     // If the count down is over, write some text
                     if (distance < 0) {
                         clearInterval(x);
                         document.getElementById("remaining").innerHTML = "EXPIRED";
                     }
                 }
             }, 1000);
         </script>
    </jsp:attribute>
    <jsp:body>
        <div class="container-fluid">
            <div class="row p-5">
            <c:forEach begin="0" end="11" varStatus="loop" var = "i">
                <div class="card card border-secondary h-60" style="width: 350px; margin: 10px 0px 10px 20px; box-sizing: border-box; height: 400px;">
                    <img src="${pageContext.request.contextPath}/Img/download.png" style="padding: 20px 10px 0px 12px" alt="House">
                    <div class="card-body">
                        <h1 class="card-title pt-0" style="color: #337ab7; font-size: 20px">${products[i].proName}</h1>
                        <p class="card-text card-text-config" style="font-size: 12px; font-weight: bold">Ngày đăng: ${products[i].startDateTime}</p>
                        <p class="card-text card-text-config" style="font-size: 14px">BID HIỆN TẠI
                            <span class="float-end">THỜI GIAN CÒN LẠI</span>
                        </p>
                        <p class="card-text card-text-config martop" style="font-size: 16px; color: green; font-weight: bold"><fmt:formatNumber value="${products[i].price}" type="currency"/>
                            <span class="remaining float-end" style="color: black">${products[i].endDateTime}</span>
                            <span class="test"></span>
                        </p>
                        <p class="card-text card-text-config" style="font-size: 14px">SỐ LƯỢT RA GIÁ<span class="float-end">BIDDER CAO NHẤT</span></p>
                        <c:set var="fullname" value="${products[i].name}"/>
                        <c:set var="lengthname" value="${fn:length(fullname)}"/>
                        <c:set var = "name" value="${fn:substring(fullname,lengthname/2,lengthname)}"/>
                        <p class="card-text card-text-config martop" style="font-size: 16px; font-weight: bold">10<span class="float-end">***${name}</span></p>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
    </jsp:body>
</t:main>

