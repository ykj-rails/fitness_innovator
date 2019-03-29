$(function(){
  function buildIndexHTML(comment){
    var html = `<div class="col-12 mb-1">
                  <a class="user-name mx-1" href=/users/${comment.user_id}>${comment.user_name}</a>
                  <span class="s-font">${comment.text}</span><br>
                </div>`
    return html;
  }
  function buildShowHTML(comment,img,content_id){
    var html = `<div class="col-12 my-1">
                  <a href="/users/${comment.user_id}"><img class="user-image-icon-sm" src="${img}"></a>
                  <a class="user-name mx-1" href="/users/${comment.user_id}">${comment.user_name}</a>
                  <span class="s-font">${comment.text}</span><br>
                  <time>たった今</time>
                  <span class="float-right">
                    <svg class="svg-inline--fa fa-ellipsis-h fa-w-16" id="my-ellipsis" data-toggle="modal" data-target="#comment_id_${comment.id}" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="ellipsis-h" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M328 256c0 39.8-32.2 72-72 72s-72-32.2-72-72 32.2-72 72-72 72 32.2 72 72zm104-72c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72zm-352 0c-39.8 0-72 32.2-72 72s32.2 72 72 72 72-32.2 72-72-32.2-72-72-72z"></path></svg><!-- <i class="fas fa-ellipsis-h pointer" data-toggle="modal" data-target="#comment_id_349"></i> -->
                  </span>
                </div>

                <div class="modal" id="comment_id_${comment.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                  <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                      <div class="modal-body">
                        <a class="denger-link" rel="nofollow" data-method="delete" href="/contents/${content_id}/comments/${comment.id}">コメントを削除</a>
                      </div>
                      <div class="modal-body-b">
                        <span class="s-font pointer" data-dismiss="modal">キャンセル</span>
                      </div>
                    </div>
                  </div>
                </div>`
    return html;
  }

  function buildCommentCountHTML(comment){
    var html = `コメント${comment.count}件を全て表示`
    return html;
  }

  $('.new_comment').on('submit', function(e){
    var formSpinner = $('#form-spinner');
    formSpinner.css('display', 'inline');
    var id = $(this).attr('id');
    var img = $(this).find('#form-user-icon').attr('src');
    var input = $(this).find('input[type="text"]').val();
    var url = $(this).attr('action')
    var re = /^\s+$|^　+$/;
    if (input === "" || input.match(re)) {
      return false;
    } else {
    e.preventDefault();
    var formData = new FormData(this);
    var href = $(location).attr('origin') + url
    console.log(href)
    $.ajax({
      url: href,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var indexhtml = buildIndexHTML(data);
      var showhtml = buildShowHTML(data,img,id);
      var counthtml = buildCommentCountHTML(data);
      formSpinner.css('display', 'none');
      $(`#comment_count_id_${id}`).text(counthtml);
      $(`#index_comments_${id}`).append(indexhtml);
      $('#show_comments').append(showhtml);
      $('.form-control').val('');
    })
    .fail(function(){
      formSpinner.css('display', 'none');
      alert('入力エラーです');
    })
  }})
});