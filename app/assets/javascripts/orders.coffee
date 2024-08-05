# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#order_booking_datetime').datepicker(dateFormat: 'yy-mm-dd')
  $('#order_staff_signoff_datetime').datepicker(dateFormat: 'yy-mm-dd')
  $('#order_customer_signoff_datetime').datepicker(dateFormat: 'yy-mm-dd')

