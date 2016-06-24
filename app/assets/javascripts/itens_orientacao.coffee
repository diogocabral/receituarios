# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#itens_orientacao').on 'click', '.add_item', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $('#itens_orientacao').children('ul').append($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $('#itens_orientacao').on 'click', '.remove_item', (event) ->
    $(this).closest('li').remove()
    event.preventDefault()

  $('#itens_orientacao').on 'click', '.remove_subitem', (event) ->
    $(this).parent().remove()
    event.preventDefault()

  $('#itens_orientacao').on 'click', '.add_subitem', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).next('ul').append($(this).data('fields').replace(regexp, time))
    event.preventDefault()

$(document).ready(ready)
$(document).on('page:load', ready)