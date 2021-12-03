<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Category.css">

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
