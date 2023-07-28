// JavaScript Document
//Get the button:
mybutton = document.getElementById("myBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
}

document.addEventListener("DOMContentLoaded",function(){
var nut = document.querySelectorAll('div.nut ul li');
var slides = document.querySelectorAll('div.slide div');
for(var i = 0 ; i < nut.length; i++){
nut[i].addEventListener('click',function(){
    var nutnay = this;
    var vitrislide = 0;
    console.log(nutnay.previousElementSibling);
    for(var i = 0;nutnay = nutnay.previousElementSibling; vitrislide++){
        
    }
    for(var i = 0; i < slides.length; i++){
        slides[i].classList.remove('ra');
    }
    for(var i = 0; i < slides.length; i++){
        slides[vitrislide].classList.add('ra');
    }
})
}

 
    auto();
    function auto(){
    var thoigian = setInterval(function(){
        var slide = document.querySelector('div.slide div.ra');
        var vitrislide = 0;
        for(var i = 0 ; slide = slide.previousElementSibling ; vitrislide ++){
        }
        for(var i = 0 ; i < slides.length; i++){
            slides[i].classList.remove('ra');
        }
        if(vitrislide == slides.length - 1){
            slides[0].classList.add('ra');
               
        }
        else{
        slides[vitrislide].nextElementSibling.classList.add('ra');
            
    }
    },5000)

    for(var i = 0; i < 3; i++){
        nut[i].addEventListener('click',function () {
            clearInterval(thoigian);
               
        })
    }

}
 
var x = setInterval(function(){
console.log('dm');
},1000);
 
},false)