<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../CSS/Main.css">
    <link rel="stylesheet" href="../CSS/Category.css">
    <title>Chilldingo</title>
</head>
<body>
<div id="content">
    <!-- Category -->
    <div class="category js-cate">
        <ul class="category__list">
            <div class="category__item-wrap">
                <li class="category__heading">
                    <h3 class="category__header">Danh mục sản phẩm</h3>
                </li>
                <div class="line"></div>
                <li class="category__item js-category__item">
                    Category-1
                    <div class="js-sub-category sub-category">
                        <ul class="sub-category__list">
                            <li class="sub-category__item">SubCate1</li>
                            <div class="line"></div>
                            <li class="sub-category__item">SubCate2</li>
                            <div class="line"></div>
                            <li class="sub-category__item">SubCate3</li>
                        </ul>
                    </div>
                </li>
                <div class="line"></div>
                <li class="category__item">
                    Category-2
                </li>
                <div class="line"></div>
                <li class="category__item">
                    Category-3
                </li>
            </div>
        </ul>
    </div>
</div>
</body>
</html>
