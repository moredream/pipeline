# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

article_editor_ready = ->
  $('#article_editor').validate
    debug: false,
    rules:
      'article[title]': required: true
      'article[tag_ids][]': required: true


$(document).ready(article_editor_ready)
$(document).on('page:load', article_editor_ready)

article_tag_ready = ->
  $('#article_tag').select2
    placeholder: "Choose Keywords."
    allowClear: true

$(document).ready(article_tag_ready)
$(document).on('page:load', article_tag_ready)


# endless = ->
#   if $('.pagination').length and $('#articles').length
#     $(window).scroll ->
#       url = $('.pagination .next a').attr('href')
#         $('.pagination').hide()
#         if url &&  $(window).scrollTop() > $(document).height() - $(window).height() - 50
#           $('.pagination').show().text('Loading more ...')
#           $.getScript(url)

#     $(window).scroll()


# $(document).ready(endless)
# $(document).on('page:load', endless)

onEndless = ->
  if $('.pagination').length and $('#articles').length
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
