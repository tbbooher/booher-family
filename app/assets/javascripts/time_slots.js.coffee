$("#time_slot_ends_at").change ->
  end = this.value
  start = $("#time_slot_starts_at").val()
  $("#duration_area").show()
  console.log "start: " + start
  console.log "end:" + end
  diff = new Date(end) - new Date(start)
  diff_time = diff / (60 * 60 * 1000)
  console.log "diff time: " + diff_time
  $("#duration").val(Math.round(diff_time*100)/100 + " hours")
