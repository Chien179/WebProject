const loginBtn=document.querySelector('.js-login');
const modal=document.querySelector('.js-modal');
const modalOverlay=document.querySelector('.js-modal__overlay');
const escapeBtn=document.querySelector('.js-escape-btn');
const cateBtn=document.querySelector('.js-cate-btn');
const cateForm=document.querySelector('.js-cate');
const cateItems=document.querySelectorAll('.js-category__item');


var countcateBtn=0;

//Hien thi Modal login
function showLoginModal(){
    modal.classList.add('open')
}

//An Modal Login
function hideLoginModal(){
    modal.classList.remove('open')
}
function showhideCate(){
    if(countcateBtn % 2===0){
        // Dua cate form tu trai qua
        cateForm.classList.add('open')
    }
    else{
        //An cate form
        cateForm.classList.remove('open')
    }
    countcateBtn++;
}

// Dua cate form tu trai qua
function showCate(){
    cateForm.classList.add('open')
}
//An cate form
function hideCate(){
    cateForm.classList.remove('open')
}

// Show subcategory list
// function showSubCate(){
//     const subCate=document.querySelector('.js-sub-category')
//     if(subCate)
//     {
//         subCate.classList.add('sub-category', 'open')

//         subCate.innerHTML=`<ul class="sub-category__list">
//         <li class="sub-category__item">SubCate1</li>
//         <div class="line"></div>
//         <li class="sub-category__item">SubCate2</li>
//         <div class="line"></div>
//         <li class="sub-category__item">SubCate3</li>
//     </ul>`
//     }
// }

// Hide subcategory list
// function hideSubCate(){

// }

loginBtn.addEventListener('click', showLoginModal)
modalOverlay.addEventListener('click', hideLoginModal)
escapeBtn.addEventListener('click', hideLoginModal)
cateBtn.addEventListener('click', showhideCate)
// for(var i=0; i<cateItems.length; i++)
// {
//     var cateItem=cateItems[i];

//     cateItem.addEventListener('mouseover', showSubCate)
//     cateItem.addEventListener('mouseleave', hideSubCate)
// }