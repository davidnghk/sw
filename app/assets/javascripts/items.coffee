# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#item_due_date').datepicker(dateFormat: 'yy-mm-dd')
  $('#item_completion_date').datepicker(dateFormat: 'yy-mm-dd')
