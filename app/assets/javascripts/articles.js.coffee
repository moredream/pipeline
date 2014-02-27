# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#article_editor').validate
    debug: false,
    rules:
      'article[title]': required: true
      'article[tag_ids][]': required: true


$(document).ready(ready)
$(document).on('page:load', ready)

ready2 = ->
  $('#article_tag').select2
    placeholder: "Choose Keywords."
    allowClear: true

$(document).ready(ready2)
$(document).on('page:load', ready2)


endless = ->
  isScrolledIntoView = (elem) ->
          docViewTop = $(window).scrollTop()
          docViewBottom = docViewTop + $(window).height()
          elemTop = $(elem).offset().top
          elemBottom = elemTop + $(elem).height()
          (elemTop >= docViewTop) && (elemTop <= docViewBottom)

  if $('.pagination').length
          $(window).scroll ->
                  url = $('.pagination .next a').attr('href')
                  if url &&  $(window).scrollTop() > $(document).height() - $(window).height() - 50
                          $('.pagination').text('Fetching more products...')
                          $.getScript(url)
    $(window).scroll()


$(document).ready(endless)
$(document).on('page:load', endless)
