# .panel hover change border color

handleIn =  ->
  $(this).css("border-color", "#A7B2FA");
  $(this).next().css("border-top-color","#A7B2FA");
  $(this).children("div.panel-body").css("background-color", "#f5f8fa");
  $(this).children("div.panel-footer").css("background-color", "#f5f8fa");



handleOut =  ->
  $(this).css("border-color", "#dddddd");
  $(this).next().css("border-top-color","#dddddd");
  if $(this).children("div.panel-body.popular").length > 0
    $(this).children("div.panel-body.popular").css("background-color", "#fffce9");
    $(this).children("div.panel-footer.popular").css("background-color", "#fffce9");
  else
    $(this).children("div.panel-body").css("background-color", "white");
    $(this).children("div.panel-footer").css("background-color", "white");

changeBorderColor = ->
  $(".panel").hover(handleIn, handleOut);

$(document).bind("DOMSubtreeModified", changeBorderColor)

