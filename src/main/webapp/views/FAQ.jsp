<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
<head>
    <title>FAQ Page</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css">

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <style>
        #footer {
            clear: both;
            position: relative;
            margin-top: 120px;
        }
        .text-secondary {
            color: #3d5d6f;
        }

        .h4,
        h4 {
            font-size: 1.2rem;
        }

        h2 {
            color: #333;
            font-size: 35px;
        }

        .fa,
        .fas {
            font-family: 'FontAwesome';
            font-weight: 400;
            font-size: 1.2rem;
            font-style: normal;
        }

        .right-0 {
            right: 0;
        }

        .top-0 {
            top: 0;
        }

        .h-100 {
            height: 100%;
        }

        a.text-secondary:focus,
        a.text-secondary:hover {
            text-decoration: none;
            color: #22343e;
        }

        #accordion .fa-plus {
            transition: -webkit-transform 0.25s ease-in-out;
            transition: transform 0.25s ease-in-out;
            transition: transform 0.25s ease-in-out, -webkit-transform 0.25s ease-in-out;
        }

        #accordion a[aria-expanded=true] .fa-plus {
            -webkit-transform: rotate(45deg);
            transform: rotate(45deg);
        }

    </style>
</head>
<body>
    <jsp:include page="./Partials/Header.jsp"/>

<div class="text-center" style=" margin-top: 100px">
    <h2 class="mt-5 mb-5">Câu hỏi thường gặp</h2>
</div>
<section class="container my-5" id="maincontent">
    <section id="accordion" >

        <a class="py-3 d-block h-100 w-100 position-relative z-index-1 pr-1 text-secondary border-top" aria-controls="faq-17" aria-expanded="false" data-toggle="collapse" href="#faq-17" role="button">
            <div class="position-relative">
                <h2 class="h4 m-0 pr-3" style="font-size: 25px">
                    Câu hỏi 1 ?
                </h2>
                <div class="position-absolute top-0 right-0 h-100 d-flex align-items-center">
                    <i class="fa fa-plus"></i>
                </div>
            </div>
        </a>
        <div class="collapse" id="faq-17" style="">
            <div class="card card-body border-3 p-4" style="font-size: 20px">
                <p>Câu trả lời.</p>
            </div>
        </div>

        <a class="py-3 d-block h-100 w-100 position-relative z-index-1 pr-1 text-secondary border-top" aria-controls="faq-18" aria-expanded="false" data-toggle="collapse" href="#faq-18" role="button" style="margin-top: 20px">
            <div class="position-relative">
                <h2 class="h4 m-0 pr-3" style="font-size: 25px">
                    Câu hỏi 2 ?
                </h2>
                <div class="position-absolute top-0 right-0 h-100 d-flex align-items-center">
                    <i class="fa fa-plus"></i>
                </div>
            </div>
        </a>
        <div class="collapse" id="faq-18" style="font-size: 20px">
            <div class="card card-body border-3 p-4" style="font-size: 20px">
                <p>Câu trả lời.</p>
            </div>
        </div>

        <a class="py-3 d-block h-100 w-100 position-relative z-index-1 pr-1 text-secondary border-top" aria-controls="faq-19" aria-expanded="false" data-toggle="collapse" href="#faq-19" role="button"  style="margin-top: 20px">
            <div class="position-relative">
                <h2 class="h4 m-0 pr-3" style="font-size: 25px">
                    Câu hỏi 3?
                </h2>
                <div class="position-absolute top-0 right-0 h-100 d-flex align-items-center">
                    <i class="fa fa-plus"></i>
                </div>
            </div>
        </a>
        <div class="collapse" id="faq-19" >
            <div class="card card-body border-3 p-4" style="font-size: 20px">
                <p>Câu trả lời</p>
            </div>
        </div>

        <a class="py-3 d-block h-100 w-100 position-relative z-index-1 pr-1 text-secondary  border-top" aria-controls="faq-20" aria-expanded="false" data-toggle="collapse" href="#faq-20" role="button"  style="margin-top: 20px">
            <div class="position-relative">
                <h2 class="h4 m-0 pr-3" style="font-size: 25px">
                    Câu hỏi 4 ?
                </h2>
                <div class="position-absolute top-0 right-0 h-100 d-flex align-items-center">
                    <i class="fa fa-plus"></i>
                </div>
            </div>
        </a>
        <div class="collapse" id="faq-20">
            <div class="card card-body border-3 p-4" style="font-size: 20px">
                <p>Câu trả lời</p>
            </div>
        </div>

        <a class="py-3 d-block h-100 w-100 position-relative z-index-1 pr-1 text-secondary  border-top" aria-controls="faq-21" aria-expanded="false" data-toggle="collapse" href="#faq-21" role="button"  style="margin-top: 20px">
            <div class="position-relative">
                <h2 class="h4 m-0 pr-3" style="font-size: 25px">
                   Câu hỏi 5 ?
                </h2>
                <div class="position-absolute top-0 right-0 h-100 d-flex align-items-center">
                    <i class="fa fa-plus"></i>
                </div>
            </div>
        </a>
        <div class="collapse" id="faq-21">
            <div class="card card-body border-3 p-4" style="font-size: 20px">
                <p>Câu trả lời</p>
            </div>
        </div>

        <a class="py-3 d-block h-100 w-100 position-relative z-index-1 pr-1 text-secondary  border-top" aria-controls="faq-22" aria-expanded="false" data-toggle="collapse" href="#faq-22" role="button"  style="margin-top: 20px">
            <div class="position-relative" style="font-size: 25px">
                <h2 class="h4 m-0 pr-3" style="font-size: 25px">
                   Câu hỏi 6 ?
                </h2>
                <div class="position-absolute top-0 right-0 h-100 d-flex align-items-center">
                    <i class="fa fa-plus"></i>
                </div>
            </div>
        </a>
        <div class="collapse" id="faq-22">
            <div class="card card-body border-3 p-4" style="font-size: 20px">
                <p>Câu trả lời</p>
            </div>
        </div>
    </section>

</section>
<div id="footer">
    <jsp:include page="./Partials/Footer.jsp"/>
</div>
</body>
</html>