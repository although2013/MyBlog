jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').html("<div class='viewmore'>获取更多微博中...</div>")
        $.getScript(url)
    $(window).scroll()




# .panel hover change border color

handleIn =  ->
  $(this).css("border-color", "#A7B2FA");
  $(this).next().css("border-top-color","#A7B2FA");


handleOut =  ->
  $(this).css("border-color", "#dddddd");
  $(this).next().css("border-top-color","#dddddd");

changeBolderColor = ->
  $(".panel").hover(handleIn, handleOut);

$(document).bind("DOMSubtreeModified", changeBolderColor)