# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
mapInitialize = () ->
  mapOptions =
    center: new google.maps.LatLng(53.801754, -1.553380)
    zoom: 15
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

$ ->
  $('#myCarousel').carousel()
  mapInitialize()