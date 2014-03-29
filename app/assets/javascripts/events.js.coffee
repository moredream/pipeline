# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:change', ->
  $('#event_editor').validate
    debug: false,
    rules:
      'event[title]': required: true
      'event[tag_list][]': required: true


event_tag_ready = ->
  $('#event_tag').select2
    placeholder: "Choose Keywords."
    allowClear: true

$(document).ready(event_tag_ready)
$(document).on('page:load', event_tag_ready)