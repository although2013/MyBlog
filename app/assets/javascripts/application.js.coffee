#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .
#= require _headroom.jquery
#= require nprogress
#= require nprogress-turbolinks
#= require bootstrap
#= require cropper


page_endless = () ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 150
        $('.pagination').html("<div class='fetching_more_microposts'>获取更多微博中...</div>")
        $.getScript(url)
    $(window).scroll()




$(document).on 'page:change', ->
  $("header").headroom();

  page_endless();
  
