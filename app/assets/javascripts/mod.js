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

// ボタンタブ切り替え(user/show下部コンテンツ)
$(function() {
  var active = 'active-top',
      userImageButton = $('#user_image-button'),
      userImageContent = $('.user_image'),
      bookMarkButton = $('#user_bookmark_image-button'),
      bookMarkContent = $('.user_bookmark_image');

  $('.nav-button').on('click', function(){
    buttonId = $(this).attr('id');
    if ( buttonId ===  'user_image-button' ) {
      userImageButton.addClass(active);
      userImageContent.removeClass('none');
      bookMarkButton.removeClass(active);
      bookMarkContent.addClass('none');
    } else {
      bookMarkButton.addClass(active);
      bookMarkContent.removeClass('none');
      userImageButton.removeClass(active);
      userImageContent.addClass('none');
    }
  });
});
