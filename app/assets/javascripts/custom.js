$(document).ready(function() {
    $('nav li ul').hide().removeClass('profile-dropdown');
    $('nav li').hover(
  function () {
    $('ul', this).stop().slideDown(100);
  },
  function () {
    $('ul', this).stop().slideUp(100);
  }
);

    $('#calendar').fullCalendar({
       events: '/requests.json'
    })

});



var container = document.querySelector('#container');
var msnry = new Masonry( container, {
  // options
  columnWidth: 2000,
  itemSelector: '.item',
});

