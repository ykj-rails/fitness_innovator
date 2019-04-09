// アラートアニメーション
$(function() {
  var notice = $('#alert-notice');
  // notice(通知系)アラート
  setTimeout(function(){
    notice.slideUp(400);
  },4500);
  notice.slideDown(400);
  // 非ログイン時の(エラー)アラート
  $('.like_button,.bookmark_button').on('click', function() {
    var error = $(this).attr('class');
    setTimeout(function(){
      $(`#${error}-alert`).slideUp(200);
    },3000);
    $(`#${error}-alert`).slideDown(200);
  });
});