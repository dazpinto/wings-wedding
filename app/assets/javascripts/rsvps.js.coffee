# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#going').hide().click (e) ->
    e.preventDefault()
    $(@).hide()
    $('#not_going').show()
    $('#rsvp_coming').prop('checked',true)

  $('#not_going').click (e) ->
    e.preventDefault()
    $(@).hide()
    $('#going').show()
    $('#rsvp_coming').prop('checked',false)

  $('#rsvp_coming').hide()
