//= require jquery

jQuery(function($) {
  $('nav .right.menu .item').click(function() {
    document.cookie = '_example_session=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    location.href = '/';
  });
});
