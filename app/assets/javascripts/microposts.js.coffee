# .panel hover change border color

handleIn =  ->
  $(this).css("border-color", "#A7B2FA");
  $(this).next().css("border-top-color","#A7B2FA");

handleOut =  ->
  $(this).css("border-color", "#dddddd");
  $(this).next().css("border-top-color","#dddddd");

changeBorderColor = ->
  $(".panel").hover(handleIn, handleOut);

$(document).bind("DOMSubtreeModified", changeBorderColor)



# hide admin-profile when window.width < 992

$(window).resize ->
  if $(this).width() < 992 
    $('.admin-pro').hide();
  else
    $('.admin-pro').show();
