# .panel hover change border color

handleIn =  ->
  $(this).children("div.panel-body").css("background-color", "#FFF6DE");
  $(this).children("div.panel-footer").css("background-color", "#FFF6DE");

handleOut =  ->
  if $(this).children("div.panel-body.popular").length > 0
    $(this).children("div.panel-body.popular").css("background-color", "#fffce9");
    $(this).children("div.panel-footer.popular").css("background-color", "#fffce9");
  else
    $(this).children("div.panel-body").css("background-color", "white");
    $(this).children("div.panel-footer").css("background-color", "white");

changeBorderColor = ->
  $(".panel").hover(handleIn, handleOut);

$(document).bind("DOMSubtreeModified", changeBorderColor)

