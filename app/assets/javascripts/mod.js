// ヘッダーアニメーション
$(function() {
  var $header = $('.site-header'),
      animation = 'header-animation'

  $(window).on('load scroll', function() {
  var value = $(this).scrollTop();
  if ( value > 100 ) {
    $header.addClass(animation);
  } else {
    $header.removeClass(animation);
  }});
});