# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# a future calendar might have many sources.
#http://arshaw.com/fullcalendar/docs/event_ui/eventDrop/
# http://arshaw.com/fullcalendar/docs/event_ui/eventResize/
# http://arshaw.com/fullcalendar/docs/mouse/eventClick/
# would like a lightbox here.


updateEvent = (the_event) ->
  $.update "/events/" + the_event.id,
    event:
      title: the_event.title
      starts_at: "" + the_event.start
      ends_at: "" + the_event.end
      description: the_event.description
  , (response) ->
    # maybe put an alert on the page that the update has happened
    $.get('/calendar/weekly_hours/' + encodeURIComponent(the_event.start)
    , (data) ->
      $("#time").html(Math.round(data.hours*100)/100 + ' hours for week starting ' + data.week_start )
    )
    return false

$(document).ready ->
  months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]
  $("#calendar").fullCalendar
    editable: true
    header:
      left: "prev,next today"
      center: "title"
      right: "month,agendaWeek,agendaDay"
    defaultView: "month"
    height: 500
    slotMinutes: 60
    loading: (bool) ->
      if bool
        $("#loading").show()
      else
        $("#loading").hide()
      d = $("#calendar").fullCalendar("getDate")
      month_string = months[d.getMonth()] + "-" + d.getFullYear()
      $("#empty").attr "href", "/calendar/empty_out_month/" + month_string
      $("#empty").html "Delete events for " + month_string
    eventSources: [
      url: "/calendar/serve_events/"
      textColor: "black"
      ignoreTimezone: true
    ]
    timeFormat: 'h:mm{ - h:mm}'
    dragOpacity: "0.5"

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent event

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent event

  year = $("#calendar").data('year')
  month = $("#calendar").data('month')
  $("#calendar").fullCalendar('gotoDate',year,month)