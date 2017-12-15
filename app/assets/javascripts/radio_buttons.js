document.addEventListener('DOMContentLoaded', function() {
  $('input[type="radio"]').each(function() {
    if ($(this).is(':checked')) {
      $(this).parent().parent().addClass('active');
    }
  });

  $('input[type="radio"]').on('change', function() {
    $(this).parent().parent().toggleClass('active');
  });
});
