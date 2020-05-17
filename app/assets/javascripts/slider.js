$(function() {
  var ar = $('#slider').children();
  ar.sort(function(){
  return Math.random()-Math.random();
  });
  for(i=0; i < ar.length; i++) {
  $('#slider').html(ar)
  }
  $('#slider').slick({
    arrows: false,
    autoplay: true,
    autoplaySpeed: 4000,
    dots: false,
    infinite: true,
    speed: 500,
    fade: true,
    cssEase: 'linear'
  });
});