$(function(){
  $('.dropdown li.hover').hover(function(){
      $(this).children('ul').show();
  }, function(){
      $(this).children('ul').hide();
  });
});