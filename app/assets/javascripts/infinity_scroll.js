$(function() {
  // indexページ用
  $('.index-jscroll').jscroll({
    contentSelector: '.content-list',
    nextSelector: 'li.next:last a',
    padding: 3000
  });
  // user/showページ用
  $('.user-show-jscroll').jscroll({
    contentSelector: '.content-list',
    nextSelector: 'li.next:last a',
    padding: 300
  });
});