# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	$('#itens').on 'click', '.remove_item', (event) ->
		if $(this).closest('tr').children().val() == ''
			$(this).closest('tr').remove()
		else
			$(this).prev('input[type=hidden]').val('true')
			$(this).closest('tr').hide()
		event.preventDefault()

	$('#itens').on 'click', '.add_item', (event) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		$('tbody').append($(this).data('fields').replace(regexp, time))
		event.preventDefault()

$(document).ready(ready)
$(document).on('page:load', ready)