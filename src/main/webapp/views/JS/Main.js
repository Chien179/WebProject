const upBtn=document.querySelector('.js-Up');

window.addEventListener('scroll', (event)=>{
    let Scroll=this.scrollY;
    if(Scroll>=200){
        upBtn.classList.add('open')
    }
    else{
        upBtn.classList.remove('open');
    }
})

