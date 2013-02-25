# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
save_form = (that) ->
  $(that).css('border-color', 'green')
  if $("#saved").length == 0
    s = '<div class="alert" id="saved"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>Saved</strong></div>'
    $(".span12").first().prepend(s)
  else
    $("#saved").show().fadeOut(2000)
  $form = $(that).parents('form:first');
  match = /^(\/\w+\/\w+\/\w+|\/\w+)\/(\w+)$/.exec($form.attr("action"))
  id = match.pop() if match
  if id # this is a form to update, do the normal update
#    console.log "regular save via put"
    $.post($form.attr("action"), $form.serialize(), null, "json")
  else # have a brand new form, add an id
#    console.log "changing by id"
    $.post($form.attr("action"), $form.serialize(), (data) ->
      id =  data.id
      $form.attr "action", $form.attr("action") + "/" + id
      $form.attr "method", "put"
      input_method = $('input[name="_method"]')
      if input_method.length > 0
        input_method.val('put')
      else
        $form.find('div').first().append('<input name="_method" type="hidden" value="put">')
    , 'json')

$("#update-button").click ->
  save_form this

$("#journal_entry_description").live "blur", ->
  save_form this

$("#journal_entry_to_do").live "blur", ->
  save_form this
