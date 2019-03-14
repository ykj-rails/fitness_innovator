// show/commentフォームが空(半角/全角スペース含む)ならsubmitさせない
function check(){
  var a=document.new_comment.comment_text.value;
  if(a==""){
    return false;
  }else if(!a.match(/\S/g)){
    return false;
  }
}
