$(document).ready(function() {
  let scroll_start = 0;
  const startchange = $('#home p');
  const offset = startchange.offset();
  $(document).scroll(function() {
    scroll_start = $(this).scrollTop();
    if(scroll_start > offset.top) {
        $('.navbar').removeClass('navbar-home');
     } else {
        $('.navbar').addClass('navbar-home');
     }
  });
});
