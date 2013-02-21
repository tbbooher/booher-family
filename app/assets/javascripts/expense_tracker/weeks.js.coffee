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

  #  $('#product_category_name').autocomplete
  #    source: $('#product_category_name').data('autocomplete-source')

  if $("#category_doughnut").length > 0
    week = $("#category_doughnut").data('week')
    $.get("/expense_tracker/weeks/" + week + "/expense_by_categories.json", (data) ->
      Morris.Donut
        element: 'category_doughnut'
        data: data
    )