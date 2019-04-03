$(function() {
  var form = $(".form-x");

  form.on('input', function(){
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