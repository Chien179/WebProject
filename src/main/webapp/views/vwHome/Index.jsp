<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:main>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Index.css">
    </jsp:attribute>>
    <jsp:body>
        <div class="d-block p-5">
            <div class="row ">
                <div id="carouselExampleIndicators" class="carousel slide mb-5 mt-3 w-100" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner w-100">
                        <div class="carousel-item active">
                            <div class="card-header bg-white mb-1 w-100 p-3">
                                <h3 class="my-auto">Top 5 sản phẩm</h3>
                            </div>
                            <div class="d-flex justify-content-around">
                                <c:forEach begin="0" end="5" varStatus="loop">
                                <div class="card card-hover mx-1 btn" style="width: 17em; height: 17em; background-color: darksalmon">
                                    <img class="card-img-top" src="${pageContext.request.contextPath}/Img/download.png" alt="Card image cap">
                                    <div class="card-body">
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="card-header bg-white mb-1 w-100 p-3">
                                <h3 class="my-auto">Top 5 sản phẩm</h3>
                            </div>
                            <div class="d-flex justify-content-around">
                                <c:forEach begin="0" end="5" varStatus="loop">
                                <div class="card card-hover mx-1 btn" style="width: 17em; height: 17em; background-color: darksalmon">
                                    <img class="card-img-top" src="${pageContext.request.contextPath}/Img/download.png" alt="Card image cap">
                                    <div class="card-body">
                                        <p class="card-text">Some quick example text to build on the card title.</p>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <div class="card-header bg-white mb-1 w-100 p-3">
                                <h3 class="my-auto">Top 5 sản phẩm</h3>
                            </div>
                            <div class="d-flex justify-content-around">
                                <c:forEach begin="0" end="5" varStatus="loop">
                                <div class="card card-hover mx-1 btn" style="width: 17em; height: 17em; background-color: darksalmon">
                                    <img class="card-img-top" src="${pageContext.request.contextPath}/Img/download.png" alt="Card image cap">
                                    <div class="card-body">
                                        <p class="card-text">Some quick example text to build.</p>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev carousel-control ml-3" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <i class="fa fa-arrow-circle-left fa-3x" aria-hidden="true"></i>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next carousel-control mr-3" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <i class="fa fa-arrow-circle-right fa-3x" aria-hidden="true"></i>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="row ">
                <div class="d-flex align-items-start flex-column">
                    <div class="card-header bg-white w-100 sticky-top p-3">
                        <h3 class="my-auto">SẢN PHẨM GỢI Ý</h3>
                    </div>
                    <div class="d-flex justify-content-between row">
                        <c:forEach begin="0" end="19" varStatus="loop">
                        <div class="col-sm-3 mb-3">
                            <div class="card card-hover w-100" style="width: 18rem;">
                                <img src="${pageContext.request.contextPath}/Img/download.png" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Card title</h5>
                                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                    <a href="#" class="btn btn-primary">Go somewhere</a>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>