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
       events: '/responses.json'
  })
});



