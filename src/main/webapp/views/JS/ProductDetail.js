const productImgs=document.querySelectorAll('.JS-product-detail__image');
const productdetailModal=document.querySelector('.js-product-detail__modal');
const productdetailModalOverlay=document.querySelector('.js-product-detail-modal__overlay');

function showImg(){
    productdetailModal.classList.add('open')
}
function  hideImg(){
    productdetailModal.classList.remove('open')
}

for(const productImg of productImgs) {
    productImg.addEventListener('click', showImg)
}
productdetailModalOverlay.addEventListener('click', hideImg)
