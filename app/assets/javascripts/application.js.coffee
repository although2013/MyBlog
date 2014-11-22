#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .
#= require _headroom.jquery
#= require nprogress
#= require nprogress-turbolinks
#= require bootstrap
#= require cropper
#= require_self

page_endless = () ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 150
        $('.pagination').html("
        <div class='fetching_more_microposts'><i class='fa fa-spinner fa-spin fa-3x'></i></div>")
        $.getScript(url)
    $(window).scroll()


# click one frequent tag, write it into input-form

frequent_tags = ->
  $('.frequent-tag').click ->
    text = $.trim($(this).text())
    $('#micropost_tag').val(text)


header_border_bottom = ->
  if $(window).width() < 768
    $('.navbar-header').css('box-shadow':'0px 1px 2px #e7e7e7');
  else
    $('.navbar-header').css('box-shadow':'none');


$(window).resize(header_border_bottom);


$(document).on 'page:change', ->
  $("header").headroom();

  page_endless();
  frequent_tags();
  header_border_bottom();
