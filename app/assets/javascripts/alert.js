// アラートアニメーション
$(function() {
  var notice = $('#alert-notice');
  // notice(通知系)アラート
  setTimeout(function(){
    notice.slideUp(600);
  },4500);
  notice.slideDown(200);
  // 非ログイン時のアラート
  $('.like_button,.bookmark_button').on('click', function() {
    var error = $(this).attr('class');
    setTimeout(function(){
      $(`#${error}-alert`).slideUp(400);
    },3500);
    $(`#${error}-alert`).slideDown(200);
  });
});
