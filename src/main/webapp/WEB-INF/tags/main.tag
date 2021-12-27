<%@ tag pageEncoding="UTF-8" %>
<%@ attribute name="css" fragment="true" required="false" %>
<%@ attribute name="js" fragment="true" required="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Chilldingo</title>
    <jsp:invoke fragment="css" />
</head>
<body>
    <jsp:include page="../../views/Partials/Header.jsp"/>
    <div class="container-fluid" style="position: relative; min-height: 635px">
        <div class="row">
            <div class="">
                <jsp:include page="../../views/Partials/Category.jsp"/>
            </div>
            <div class="col-sm-10" style="margin: 100px auto 0; display: flex; justify-content: center">
                <jsp:doBody/>
            </div>
        </div>
        <div class="Up js-Up">
            <a href="#" class="Up__icon"><i class="fa fa-angle-up Up__icon-fa"></i></a>
        </div>
    </div>
    <jsp:include page="../../views/Partials/Footer.jsp"/>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/e7f075a2cb.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/views/JS/Main.js"></script>
    <jsp:invoke fragment="js" />
</body>
</html>