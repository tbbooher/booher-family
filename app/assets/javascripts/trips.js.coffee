# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

unless $("textarea#trip_day_notes").length == 0
  (->
    CKEDITOR.remove CKEDITOR.instances["trip_day_notes"]  if CKEDITOR.instances["trip_day_notes"]
    CKEDITOR.replace "trip_day_notes",
      language: "en"
      toolbar: "Easy"
      class: ["ckeditor", "optional"]

  ).call this

$(document).on "focus", "[data-behaviour~='datepicker']", (e) ->
  $(this).datepicker
    format: "yyyy-mm-dd"
    weekStart: 1
    autoclose: true
