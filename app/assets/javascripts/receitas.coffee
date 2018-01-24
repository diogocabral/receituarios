# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("#receita_modal").modal("hide")

  $('.importar').on 'click', (event) ->
    $("#receita_modal").modal("show")
    event.preventDefault()

$(document).on('turbolinks:load', ready)