// アラートアニメーション
$(function() {
  var notice = $('#alert-notice'),
      like = $('#like-alert');
  // notice(通知系)アラート
  setTimeout(function(){
    notice.slideUp(600);
  },4500);
  notice.slideDown(200);
  // 非ログイン時のいいねアラート
  $('.like_button').on('click', function() {
    setTimeout(function(){
      like.slideUp(400);
    },3500);
    like.slideDown(200);
  });

});
