$(document).on 'click', '.centered-tabs a', (e) ->
  e.preventDefault()
  $this = $(this)
  $this.siblings().removeClass('active')
  $this.addClass('active')
  $this.tab('show')

$(document).on 'ready page:load', (e) ->
  $canvas = $('#map-canvas')
  return unless $canvas.length

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
        name      = $(timeslot).text()
        loc       = $(timeslot).data('location')

        if loc
          loc    = loc.split(',')
          latLng =  new google.maps.LatLng(loc[0], loc[1])
          @dropMarker latLng, name, $(timeslot)

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


  # Resize map when shown
  $(document).on 'shown.bs.tab', ->
    google.maps.event.trigger(map.canvas, "resize")
    map.canvas.fitBounds map.bounds

  map.initialize()
