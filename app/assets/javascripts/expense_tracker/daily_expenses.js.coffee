# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $.get("/expense_tracker/daily_expenses/expense_report.json", (data) ->
    Morris.Line
      element: 'expense_projection'
      data: data
      xkey: 'day'
      ykeys: ['ideal', 'remaining']
      labels: ['ideal', 'remaining']
  )
