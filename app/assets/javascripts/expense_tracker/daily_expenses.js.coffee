# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  if $("#expense_projection").length > 0
    week = $("#expense_projection").data('week')
    $.get("/expense_tracker/weeks/" + week + ".json", (data) ->
      Morris.Line
        element: 'expense_projection'
        data: data
        xkey: 'day'
        ykeys: ['ideal', 'remaining']
        labels: ['ideal', 'remaining']
    )

  $('#product_category_name').autocomplete
    source: $('#product_category_name').data('autocomplete-source')