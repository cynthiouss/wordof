// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('a').click(function(){
    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 1500);
    return false;
});
