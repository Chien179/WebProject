<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Main.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/CSS/Category.css">
<style>
    /* Category */
    .category{
        width: 200px;
        background-color: var(--white-color);
        box-shadow: 1px 1px 2px #ccc;
        border-top-right-radius: 3px;
        border-bottom-right-radius: 3px;
        left: 0;
        top: 0;
        animation: leftRight linear 0.25s;
        display: none;
        z-index: 2;
        margin-top: 120px;
        position: fixed;
    }
    .category.open{
        display: block;
    }
    .category__item-wrap{
        width: 80%;
        margin: 0 auto;
        padding-bottom: 0px;
    }
    .category__heading{
        position: relative;
        text-align: center;
        margin: 4px auto;
        font-size: 1.4rem;
        padding: 4px 0;
        cursor: pointer;
        border-radius: 3px;
    }
    .category__header{
        font-size: 1.5rem;
    }
    .category__header:hover{
        color: var(--primary-color);
    }
    .category__item{
        position: relative;
        text-align: center;
        margin: 4px auto;
        font-size: 1.4rem;
        padding: 4px 0;
        cursor: pointer;
        border-radius: 3px;
    }
    .category__item::after{
        display: inline-block;
        content: "";
        width: 50px;
        height: 22px;
        position: absolute;
        left: 150px;
        top: 0px;
    }
    .category__item-wrap::after{
        display: block;
    }
    .category__item:hover{
        background-image: linear-gradient( to right, #1ab7ea, #48c5ee, #6dd1f1, #8adaf4)!important;
    }
    .category__item:hover>a{
        color: var(--white-color) !important;
    }
    .category__item.openSubcate .sub-category{
        display: block;
    }
    .category__item:first-child:hover{
        color: var(--primary-color);
        background-color: transparent;
        background-image: none;
    }
    .sub-category{
        position: absolute;
        width: calc(230px /2);
        background-color: var(--white-color);
        box-shadow: 0px 0px 2px 1px #ccc;
        margin-top: 5px;
        border-radius: 3px;
        animation: HoverGrow linear 0.15s;
        transform-origin: 0 0;
        left: 115%;
        top: -40%;
        color: var(--text-color);
        display: none;
    }
    .category__item:hover
    .sub-category{
        display: block;
    }
    .sub-category__item{
        margin: 4px auto;
        width: 80%;
        padding: 4px 0;
        font-size: 1.4rem;
        border-radius: 3px;
    }
    .sub-category__item:hover{
        color: var(--white-color);
        background-image: linear-gradient( to right, #1ab7ea, #48c5ee, #6dd1f1, #8adaf4);
    }
    .sub-category__list .line{
        width: 80%;
        margin: 0 auto;
    }
    a{
        text-decoration: none;
        color: black;
    }
    a:hover{
        text-decoration: none;
    }
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
    *{
        padding: 0;
        margin: 0;
        box-sizing: inherit;
    }
    html, body{
        box-sizing: border-box;
        font-family: arial, sans-serif !important;
        scroll-behavior: smooth;
        font-size: 62.5%;
        line-height: 1.6rem;
        background-color: var(--background-color);
        position: relative;
        min-height: 500px;
    }
    #content{
        position: relative;
    }
    /* Animation grow hover */
    @keyframes HoverGrow{
        from{
            transform: scale(0);
            opacity: 0;
        }
        to{
            transform: scale(1);
            opacity: 1;
        }
    }
    @keyframes fadeIn{
        from{
            opacity: 0;
        }
        to{
            opacity: 1;
        }
    }
    @keyframes grow{
        from{
            transform: scale(var(--grow-from));
        }
        to{
            transform: scale(var(--grow-to));
        }
    }
    @keyframes leftRight{
        from{
            left: -236px;
        }
        to{
            left: 0;
        }
    }
    .Up__icon-fa:hover{
        font-size: 2rem;
    }
    .grid{
        width: 1400px;
        max-width: 100%;
        margin: 0 auto;
    }
    .grid__full-width{
        width: 100%;
    }
    .grid__row{
        display: flex;
        flex-wrap: wrap;
    }
    ul{
        list-style: none;
    }
    .line{
        height: 1px;
        width: 100%;
        background-color: #dbdbdb;
        flex: 1;
    }
    .text-between{
        color: var(--text-color);
        padding: 0 1rem;
        text-transform: uppercase;
        font-size: .95rem;
    }
    .-or-{
        display: flex;
        align-items: center;
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
    .btn + .btn{
        margin-left: 2px;
    }
    /* Modal */
    .modal{
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        /*display: flex;*/
        animation: fadeIn linear 0.1s;
        display: none;
    }
    .modal__body{
        --grow-from: 0.7;
        --grow-to: 1;
        margin: auto;
        position: relative;
        z-index: 1;
        animation: grow linear 0.2s;
        display: flex;
    }
</style>
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
