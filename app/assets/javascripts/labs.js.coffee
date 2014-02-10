# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  $('#lab_editor').validate
    debug: false,
    rules:
      'lab[name]': required: true

ready = ->
  $('#lab_category').select2
    placeholder: "Select univs."
    allowClear: true


$(document).ready(ready)
$(document).on('page:load', ready)

univFormatResult = (person) ->
  markup = "<table class='person-result'><tr>"
  markup += "<td>#{person.name}</td>" if person.name != undefined
  markup += "</td></tr></table>"

univFormatSelection = (person) ->
  markup = person.name
  markup +=  " &lt;" + person.name + "&gt;" if person.name != ""

jQuery ->
  $('#teens_select2').select2
    placeholder: "Select univs.",
    minimumInputLength: 1,
    allowClear: true,
    ajax:
      url: '/categories.json'
      dataType: 'json'
      results: (data, page) ->
        results: data
    formatResult: univFormatResult
    formatSelection: univFormatSelection
    dropdownCssClass: "bigdrop"


