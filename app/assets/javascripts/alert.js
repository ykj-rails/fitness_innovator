// アラートアニメーション
$(function() {
  var notice = $('#alert-notice'),
      success = $('#bookmark_success-alert');
  // notice(通知系)アラート
  setTimeout(function(){
    notice.slideUp(500);
  },4500);
  notice.slideDown(200);
  // 非ログイン時の(エラー)アラート
  $('.like_button,.bookmark_button').on('click', function() {
    var error = $(this).attr('class');
    setTimeout(function(){
      $(`#${error}-alert`).slideUp(200);
    },3000);
    $(`#${error}-alert`).slideDown(200);
  });
});