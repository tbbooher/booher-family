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
  s = encodeURIComponent(start_time) + "/" + encodeURIComponent(end_time)
  $.get('/calendar/find_duration/' + s, (data) ->
    id = "err_" + input_start.attr('id')
    if data.message == null
      duration_display.val(data.duration)
      input_start.parent().parent().removeClass('error')
      if $("#" + id).length > 0
        $("#" + id).remove()
    else
      input_stop.value = ""
      input_start.val("")
      input_start.parent().parent().addClass('error')
      duration_display.val(data.duration)
      if $("#" + id).length > 0
        $("#" + id).html(data.message)
      else
        duration_display.after("<span id=\"" + id + "\" class=\"help-inline\">" + data.message + "</span>")
      input_start.focus()
  )
  #console.log this.prevAll("input.st_event:first").value