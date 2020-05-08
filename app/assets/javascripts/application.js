// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require_tree .
//= require jquery
//= require jquery_ujs

$(function() {
  var ar = $('.slider').children();
  ar.sort(function(){
  return Math.random()-Math.random();
  });
  for(i=0; i < ar.length; i++) {
  $('.slider').html(ar)
  }
  $('.slider').slick({
      prevArrow:'<i class="fa fa-angle-left arrow arrow-left"></i>',
      nextArrow:'<i class="fa fa-angle-right arrow arrow-right"></i>',
      dots: false,
      autoplay: true,
      autoplaySpeed: 5000,
      speed: 800
  });

  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});