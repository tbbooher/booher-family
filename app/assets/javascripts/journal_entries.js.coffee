# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
save_form = (that) ->
  $form = $(that).parents('form:first');
  $.post($form.attr("action"), $form.serialize(), null, "json")

$("#update-button").click ->
  save_form this
  console.log "aved"

$("#journal_entry_description").live "blur", ->
  save_form this
  console.log "form saved!!"
