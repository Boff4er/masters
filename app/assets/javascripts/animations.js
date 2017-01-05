var slides = new Array("header", ".main-cats", ".footer-top");
var scroll = $(document).scrollTop();
checkScroll(scroll);
$(window).scroll(function(){
  var scroll = $(document).scrollTop();
  checkScroll(scroll);
});

function number_to(id,from,to,duration)
{
var element = document.getElementById(id);
var start = new Date().getTime();
setTimeout(function() {
    var now = (new Date().getTime()) - start;
    var progress = now / duration;
    var result = Math.floor((to - from) * progress + from);
    element.innerHTML = progress < 1 ? result : to;
    if (progress < 1) setTimeout(arguments.callee, 10);
}, 10);
}

var fakts_show = false;

$(function(){
  setTimeout(function(){
      $(".main-form .left").addClass("left-show");
  }, 500);

  if (fakts_show == false) {
    $(".main-form .values .item b").each(function(){
        var max = parseInt($(this).text());
        var obj = this;
        var item = $(this).attr("item");
        number_to("item"+item,0,max,2500);
    });
    fakts_show = true
  }

  /*setTimeout(function(){
      $(".main-form .right form").addClass("form-show");
      $(".main-form .left h1").addClass("h1-show");
  }, 500);*/

});

function checkScroll (scroll) {

  $.each(slides, function(val, p){
    if ($(p).length > 0) {
        var top = $(p).offset().top;
        if (scroll + $(window).height() - $(window).height()/4 >= top) {

          if (p == "header") {

            
         
          }

          if (p == ".main-cats") {
            setTimeout(function(){
                $(".main-cats .item-list .item").addClass("item-show");
            }, 1000);
          }

          if (p == ".footer-top") {
            setTimeout(function(){
                $(".footer-top .right .item .img-1").addClass("img-1-show");
            }, 1000);
            setTimeout(function(){
                $(".footer-top .right .item .img-2").addClass("img-2-show");
            }, 1400);
            setTimeout(function(){
                $(".footer-top .right .item .img-3").addClass("img-3-show");
            }, 1800);
          }

        }
    }
  });
}