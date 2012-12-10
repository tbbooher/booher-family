# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

unless $("textarea#activity_description").length == 0
  (->
    CKEDITOR.remove CKEDITOR.instances["activity_description"]  if CKEDITOR.instances["activity_description"]
    CKEDITOR.replace "activity_description",
      language: "en"
      toolbar: "Easy"
      class: ["ckeditor", "optional"]

  ).call this