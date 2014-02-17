return unless window.location.pathname == "/shows"

$ ->
  $canvas = $('#map-canvas')

  map =
    options: {
      center: new google.maps.LatLng(-34.397, 150.644),
      zoom: 8
    },
    initialize: ->
      @canvas = new google.maps.Map($canvas[0], @options)

  # Resize map when shown
  $(document).on 'shown.bs.tab', ->
    google.maps.event.trigger(map.canvas, "resize")

  map.initialize()
