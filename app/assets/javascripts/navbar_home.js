$(document).ready(function() {
  let scroll_start = 0;
  const startchange = $('.video-container');
  const offset = startchange.height();
  $(document).scroll(function() {
    scroll_start = $(this).scrollTop();
    if(scroll_start > offset) {
        $('.pages.home .navbar-wagon').removeClass('navbar-home');
     } else {
        $('.pages.home .navbar-wagon').addClass('navbar-home');
     }
  });
});
