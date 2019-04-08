$(function() {
  var passWordInput = $('#user_password'),
      passWordCheckButton = $('.password_check_button');

  $(function() {
    var form = $(".form-x");
    // devise関連フォーム入力のエフェクト
  // ユーザ登録情報編集フォーム用にfocus追加
    form.on('input focus', function(){
      var formId = $(this).attr('id');
      var input = $(this).val().length;
      if (input === 0) {
        $(`#${formId}`).removeClass('form-animation');
        $(`#${formId}-label`).removeClass('label-animation');
      } else {
        $(`#${formId}`).addClass('form-animation');
        $(`#${formId}-label`).addClass('label-animation');
      }
    });
  });

  $(function() {
    // パスワード表示/非表示ボタンの表示
    passWordInput.on('input focus', function(){
      var input = $(this).val().length;
      if (input === 0) {
        passWordCheckButton.addClass('none');
      } else {
        passWordCheckButton.removeClass('none');
      }
    });
  });

  $(function() {
    // パスワードの中身を表示/非表示
    passWordCheckButton.on('click', function(){
      var type = passWordInput.attr('type');
    if (type === 'password') {
      passWordCheckButton.text('非表示にする');
      passWordInput.attr('type','text');
    } else {
      passWordCheckButton.text('表示する');
      passWordInput.attr('type','password');
    }
    });
  });
});