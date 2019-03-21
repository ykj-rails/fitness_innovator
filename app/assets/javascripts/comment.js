// コメントが空なら送信させない
function check(){
  var a=document.activeElement.value;
  if(a==""){
    return false;
  }else if(!a.match(/\S/g)){
    return false;
  }
}
