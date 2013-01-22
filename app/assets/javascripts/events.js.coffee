$("#event_ends_at").change ->
  end = this.value
  start = $("#event_starts_at").val()
  $("#duration_area").show()
  diff = new Date(end) - new Date(start)
  diff_time = diff / (60 * 60 * 1000)
  console.log "diff time: " + diff_time
  $("#duration").val(Math.round(diff_time*100)/100 + " hours")

#$("#event_starts_at").change ->
#  start_time = new Date(this.value)
#  t = new Date(start_time.getTime() + 8*60000*60)
#  mins = t.getMinutes()
#  console.log String(mins).length
#  mins = "0" + mins if String(mins).length < 2
#  month = t.getMonth()+1
#  et =   t.getDate() + "/" + month + "/" + t.getFullYear() + " " + t.getHours() + ":" + mins
#  $("#event_ends_at").val(et)