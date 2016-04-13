$('.dropdown-toggle').on('click', function() {
  $('.navbar-wagon-dropdown-menu').addClass('is-visible')
})


$(document).on('click', function() {
  $('.navbar-wagon-dropdown-menu').removeClass('is-visible')
})
