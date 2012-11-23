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
    return false

$(document).ready ->
  # date = new Date()
  # d = date.getDate()
  # m = date.getMonth()
  # y = date.getFullYear()
  months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"]
  location_id = $("#calendar").data('location')
  $("#calendar").fullCalendar
    editable: true
    # need to figure out how to go to specific date

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
      $("#populate").html "Populate " + month_string
      # match "calendar/populate/:month_string/location/:location_id"
      $("#populate").attr "href", "/calendar/populate/" + month_string + "/location/" + location_id
      $("#empty").attr "href", "/calendar/empty_out_month/" + month_string + "/location/" + location_id
      $("#empty").html "Delete events for " + month_string
      $("#timeslots").attr "href", "/locations/" + location_id + "/time_slots/"
      $("#timeslots").html "Time Slots"
    eventSources: [
      url: "/calendar/serve_events/" + location_id
      textColor: "black"
      ignoreTimezone: false
    ]
    timeFormat: "h:mm "
    dragOpacity: "0.5"

    eventDrop: (event, dayDelta, minuteDelta, allDay, revertFunc) ->
      updateEvent event

    eventResize: (event, dayDelta, minuteDelta, revertFunc) ->
      updateEvent event

    eventClick: (event, jsEvent, view) ->
      e = event
      el = $(this)
      id = el.attr("href").split("/")[4]
      if $('.popover').size() == 0
        # calendar/show_coaches/:location_id/event/:id
        $.ajax url: "/calendar/show_coaches/" + location_id + "/event/" + id, cache: false, success: (data) ->
          el.popover(
            {title: 'Edit Coaches',
            content: data,
            html: true,
            animation: false,
            trigger: 'manual'
            }
          ).popover('show')
          edit_form = $('#edit_event_'+id)
          edit_form.on('ajax:complete', (event, elements) ->
            $.get('/calendar/show_coaches/' + location_id + '/event/' + id + '.json', (coaches) ->
              el.children().first().children().last().html(coaches.join(", "))
            )
            el.popover('destroy')
            # now update the top partial
            $.get('/coaches/show_usage/' + id + '/' + encodeURI(e.start.toDateString()) + '.json', (events) ->
              for e in events
                $("#coach_count_" + e.id).html(e.slots)
            )
          )
      else
        console.log "***** removed *****"
        $('.popover').remove()
      return false
  year = $("#calendar").data('year')
  month = $("#calendar").data('month')
  $("#calendar").fullCalendar('gotoDate',year,month)