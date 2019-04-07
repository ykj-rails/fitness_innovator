//画像プレビュー(contents/new, user/edit)
$(function() {
  $('#before-sample').on('change', function(e) {
      var file = e.target.files[0];
      var blobUrl = window.URL.createObjectURL(file);
      $('#before-preview').attr('src', blobUrl);
  });
  $('#after-sample').on('change', function(e) {
      var file = e.target.files[0];
      var blobUrl = window.URL.createObjectURL(file);
      $('#after-preview').attr('src', blobUrl);
  });
  $('#file-user').on('change', function(e) {
      var file = e.target.files[0];
      var blobUrl = window.URL.createObjectURL(file);
      $('#user-image').attr('src', blobUrl);
  });
});

