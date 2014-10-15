$('nav li ul').hide().removeClass('profile-dropdown');
$('nav li').hover(
  function () {
    $('ul', this).stop().slideDown(100);
  },
  function () {
    $('ul', this).stop().slideUp(100);
  }
);


var container = document.querySelector('#container');
var msnry = new Masonry( container, {
  // options
  columnWidth: 2000,
  itemSelector: '.item',
  "gutter": 20
});
