document.addEventListener('DOMContentLoaded', function() {
  $('input[type="checkbox"]').each(function() {
    if ($(this).is(':checked')) {
      $(this).parent().parent().addClass('active');
    }
  });

  $('input[type="checkbox"]').on('change', function() {
    $(this).parent().parent().toggleClass('active');
  });
});
