return unless window.location.pathname == "/shows"

$ ->
  $canvas = $('#map-canvas')

  # TODO:
  # * Routing point to point
  # * Handle multiple timeslots per marker
  #
  map =
    options:
      center: new google.maps.LatLng(-34.397, 150.644)
      zoom: 8
      scrollwheel: false
    geocoder: new google.maps.Geocoder()
    bounds: new google.maps.LatLngBounds()
    infowindow: new google.maps.InfoWindow()

    initialize: ->
      @canvas = new google.maps.Map($canvas[0], @options)
      @setMarkers()

    setMarkers: ->
      $('.timeslot').each (i, timeslot) =>
        $location = $(timeslot).find('[data-location]')
        name      = $location.text()
        address   = $location.data('location')
        @geocodeAddress address, name, $(timeslot).clone()

    dropMarker: (position, name, $el) ->
      marker = new google.maps.Marker
        map: @canvas
        position: position

      google.maps.event.addListener marker, "click", =>
        @infowindow.setContent $el.html()
        @infowindow.open @canvas, marker
        return

      @bounds.extend position
      @canvas.fitBounds @bounds
      return

    geocodeAddress: (address, name, el) ->
      @geocoder.geocode
        address: address
      , (results, status) =>
        if status is google.maps.GeocoderStatus.OK
          position = results[0].geometry.location
          @dropMarker position, name, el
        else
          console.error "Geocode was not successful for the following reason: " + status
        return

      return

  # Resize map when shown
  $(document).on 'shown.bs.tab', ->
    google.maps.event.trigger(map.canvas, "resize")
    map.canvas.fitBounds map.bounds

  map.initialize()
