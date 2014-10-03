#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .
#= require _headroom.jquery
#= require nprogress
#= require nprogress-turbolinks



$(document).on 'page:fetch', ->
  NProgress.start()
$(document).on 'page:change', ->
  $("header").headroom();
  NProgress.done();
$(document).on 'page:restore', ->
  NProgress.remove()
