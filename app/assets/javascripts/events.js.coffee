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
  end_time = this.value
  start_time = $(this).prev().val()
  duration_display = $(this).next()
  s = encodeURIComponent(start_time) + "/" + encodeURIComponent(end_time)
  $.get('/calendar/find_duration/' + s, (data) ->
    duration_display.val(data.duration)
  )
  #console.log this.prevAll("input.st_event:first").value