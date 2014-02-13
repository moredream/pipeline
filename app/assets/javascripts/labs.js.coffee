# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  $('#lab_editor').validate
    debug: false,
    rules:
      'lab[name]': required: true


$(document).ready(ready)
$(document).on('page:load', ready)


ready2 = ->
  $('#lab_category_tokens').tokenInput '/categories.json',
    theme: 'mac'
    preventDuplicates: true
    prePopulate: $('#lab_category_tokens').data('load')

$(document).ready(ready2)
$(document).on('page:load', ready2)
# ready = ->
#   $('#lab_category').select2
#     placeholder: 'Select Regions.'
#     allowClear: true


ready3 = ->
  changeTab = (e) ->
    e.preventDefault()
    name = $('#lab-desc').html()
    $('input[id=lab_content]').val(name)
    $('#lab_editor').validate
      debug: false,
      rules:
        'lab[name]': required: true
    $('#lab_editor').submit();


  $("#lab-button").click changeTab


$(document).ready(ready3)
$(document).on('page:load', ready3)
