# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#going').click (e) ->
    e.preventDefault()
    $(@).addClass('btn-primary')
    $('#not_going').removeClass('btn-primary')
    $('#rsvp_coming').prop('checked',true)

  $('#not_going').click (e) ->
    e.preventDefault()
    $(@).addClass('btn-primary')
    $('#going').removeClass('btn-primary')
    $('#rsvp_coming').prop('checked',false)

  $('#rsvp_coming').hide()
  if $('#rsvp_coming').prop('checked')
    $('#going').addClass('btn-primary')
  else
    $('#not_going').addClass('btn-primary')
