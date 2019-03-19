function check(){
  var a=document.getElementById('comment_text').value;
  if(a==""){
    return false;
  }else if(!a.match(/\S/g)){
    return false;
  }
}
