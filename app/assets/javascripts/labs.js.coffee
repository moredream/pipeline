# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


lab_editor_ready = ->
  $('#lab_editor').validate
    debug: false,
    rules:
      'lab[name]': required: true


$(document).ready(lab_editor_ready)
$(document).on('page:load', lab_editor_ready)


# lab_category_ready = ->
#   $('#lab_category_tokens').tokenInput '/categories.json',
#     theme: 'mac'
#     preventDuplicates: true
#     prePopulate: $('#lab_category_tokens').data('load')

# $(document).ready(lab_category_ready)
# $(document).on('page:load', lab_category_ready)
# ready = ->
#   $('#lab_category').select2
#     placeholder: 'Select Regions.'
#     allowClear: true


# lab_button_ready = ->
#   changeTab = (e) ->
#     e.preventDefault()
#     name = $('#lab-desc').html()
#     $('input[id=lab_content]').val(name)
#     $('#lab_editor').validate
#       debug: false,
#       rules:
#         'lab[name]': required: true
#     $('#lab_editor').submit();


#   $("#lab-button").click changeTab


# $(document).ready(lab_button_ready)
# $(document).on('page:load', lab_button_ready)
