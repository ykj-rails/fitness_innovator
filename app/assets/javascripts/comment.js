$(function(){
  function buildHTML(comment){
    var html = `<div class="col-12 mb-1">
                  <a class="user-name mx-1" href=/users/${comment.user_id}>${comment.user_name}</a>
                  <span class="s-font">${comment.text}</span><br>
                </div>`
    return html;
  }

  $('.new_comment').on('submit', function(e){
    var id = $(this).attr('id');
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
      var html = buildHTML(data);
      $(`#index_comments_${id}`).append(html)
      $('.form-control').val('')
    })
    .fail(function(){
      alert('入力エラーです');
    })
  }})
});

// if ($(`input[name=comment_${id}]`).val() == '') {
//   alert('入力してください');
//   return false;
// } else {

// console.log.data("text");
//       if($(this).val() == ""){
//         return false;
//       } else {

// $(function(){
//   function buildHTML(comment){
//     var html = `<a class="user-name mx-1" href=/users/${comment.user_id}>${comment.user_name}</a>
//                 <span class="s-font">${comment.text}</span><br>`
//     return html;
//   }
//   $('#27').on('submit', function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var href = window.location.href + '/comments'
//     $.ajax({
//       url: href,
//       type: "POST",
//       data: formData,
//       dataType: 'json',
//       processData: false,
//       contentType: false
//     })
//     .done(function(data){
//       var html = buildHTML(data);
//       $('.comments').append(html)
//       $('.form-control').val('')
//     })
    // .fail(function(){
    //   alert('error');
    // })
//   })
// });