jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page a').attr('href')
      
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').html("<div class='viewmore'>获取更多微博中...</div>")
        $.getScript(url)
    $(window).scroll()


