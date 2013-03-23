# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

VENUE_LENGTH = 3
venues =
  church:
    button: '#pan_to_church'
    location: new google.maps.LatLng(53.801754, -1.553380)
    infoWindow: new google.maps.InfoWindow
      content: 'church'
  banquet:
    button: '#pan_to_banquet'
    location: new google.maps.LatLng(53.799480, -1.562461)
    infoWindow: new google.maps.InfoWindow
      content: 'banquet'
  evening:
    button: '#pan_to_evening'
    location: new google.maps.LatLng(53.771050, -1.665902)
    infoWindow: new google.maps.InfoWindow
      content: 'evening'

VENUE_ACTIVE = 'btn-primary'


$ ->
  $('#myCarousel').carousel()

  if $('#map-canvas').length > 0

    map = new google.maps.Map(document.getElementById("map-canvas"),
      center: new google.maps.LatLng(53.801754, -1.553380)
      zoom: 15
      mapTypeId: google.maps.MapTypeId.ROADMAP
      disableDefaultUI: true
    )

    switchTo = (a) ->
      map.panTo(a.location)
      $(".#{VENUE_ACTIVE}").removeClass(VENUE_ACTIVE)
      $(a.button).addClass(VENUE_ACTIVE)
      a.infoWindow.open()

    STEP = 1000
    t = 0

    $.each venues, (key, val)  ->
      $(val.button).click (e) ->
        e.preventDefault()
        switchTo(val)

      setTimeout(->
        switchTo(val)
        new google.maps.Marker(
          title: key
          map: map
          position: val.location
          animation: google.maps.Animation.DROP
        )
      t)
      t = t + STEP

    #after animations
    setTimeout(->
      map.setZoom(16)
      switchTo(venues['church'])
    VENUE_LENGTH * STEP)