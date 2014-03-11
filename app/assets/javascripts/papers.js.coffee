# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
onEndless = ->
  if $('.pagination').length and $('#papers').length
    $(window).off 'scroll', onEndless
    url = $('.pagination .next a').attr('href')
    $('.pagination').hide()
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 150
      $('.pagination').show().text('Loading more ...')
      $.getScript url, ->
        $(window).on 'scroll', onEndless
    else
      $(window).on 'scroll', onEndless

$(window).on 'scroll', onEndless

$(window).scroll()
