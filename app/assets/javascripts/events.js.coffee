get_and_update_hours = (date) ->
  $.get('/calendar/weekly_hours/' + encodeURIComponent(date), (data) ->
    prev_hours = Math.round(data.hours*100)/100
    new_hours = 0
    for duration in $(".hours")
      new_hours += parseFloat(duration.value) unless duration.value == ""
    total_hours = prev_hours + new_hours
    $("#time").html("Proposed total hours for this week: <strong>" + Math.round(total_hours*100)/100 + "</strong>")
  )

$("#week_build_week_start").change ->
  console.log this.value
  get_and_update_hours(this.value)

$("#event_ends_at").change ->
  end = this.value
  start = $("#event_starts_at").val()
  $("#duration_area").show()
  diff = new Date(end) - new Date(start)
  diff_time = diff / (60 * 60 * 1000)
  console.log "diff time: " + diff_time
  $("#duration").val(Math.round(diff_time*100)/100 + " hours")

#st_event
$(".sp").blur ->
  input_stop = this
  input_start = $(this).prev()
  end_time = input_stop.value
  start_time = input_start.val()
  duration_display = $(this).next()
  duration_hours = duration_display.next()
  s = encodeURIComponent(start_time) + "/" + encodeURIComponent(end_time)
  $.get('/calendar/find_duration/' + s, (data) ->
    id = "err_" + input_start.attr('id')
    if data.message == null
      duration_display.val(data.duration)
      duration_hours.val(data.hours)
      input_start.parent().parent().removeClass('error')
      if $("#" + id).length > 0
        $("#" + id).remove()
      # now update the weekly hour count
      get_and_update_hours($("#week_build_week_start").val())
    else
      # uncomment if you want to clear the values
      #input_stop.value = ""
      #input_start.val("")
      input_start.parent().parent().addClass('error')
      duration_display.val(data.duration)
      if $("#" + id).length > 0
        $("#" + id).html(data.message)
      else
        duration_display.after("<span id=\"" + id + "\" class=\"help-inline\">" + data.message + "</span>")
      input_start.focus()
  )


