# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
save_form = (that) ->
  $form = $(that).parents('form:first');
  match = /^(\/\w+\/\w+\/\w+|\/\w+)\/(\w+)$/.exec($form.attr("action"))
  id = match.pop() if match
#  console.log "the id:" + id
  if id # this is a form to update, do the normal update
    $.post($form.attr("action"), $form.serialize(), null, "json")
  else # have a brand new form
    # add the form and change the action to have an id
#    console.log "we have a new form"
    $.post($form.attr("action"), $form.serialize(), (data) ->
      id =  data.id
      $form.attr "action", $form.attr("action") + "/" + id
#      hidden = "<input type=\"hidden\" name=\"_method\" value=\"put\" />"
#      $form.append hidden
    , 'json')

$("#update-button").click ->
  save_form this

$("#journal_entry_description").live "blur", ->
  save_form this

$("#journal_entry_to_do").live "blur", ->
  save_form this
