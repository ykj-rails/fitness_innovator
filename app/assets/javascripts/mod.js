// ヘッダーアニメーション
$(function() {
  var $header = $('.site-header'),
      animation = 'header-animation'

  $(window).on('load scroll', function() {
  var value = $(this).scrollTop();
  if ( value > 60 ) {
    $header.addClass(animation);
  } else if ( value < 30 ) {
    $header.removeClass(animation);
  }});

  $('#header-none').load(function(){
    $header.remove();
  });
});