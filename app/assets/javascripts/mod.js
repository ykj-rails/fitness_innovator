// ヘッダーアニメーション
$(function() {
  var $header = $('.site-header'),
      animation = 'header-animation'

  $(window).on('load scroll', function() {
  var value = $(this).scrollTop();
  console.log(value);
  if ( value > 60 ) {
    $header.addClass(animation);
  } else if ( value < 30 ) {
    $header.removeClass(animation);
  }});
});