class window.Map
  constructor: (location) ->    
    wax.tilejson('http://api.tiles.mapbox.com/v3/examples.map-4l7djmvo/geocode/' + 
      encodeURIComponent(location) + '.json', @position)
    ###
    @getLocationGoogle(location)
    ###
    
  position: (position) ->
    console.log(position)
    map = mapbox.map('map')
    map.addLayer(mapbox.layer().id('examples.map-4l7djmvo'))

    markerLayer = mapbox.markers.layer()
    mapbox.markers.interaction(markerLayer)
    map.addLayer(markerLayer)

    if position and position.results and position.results.length
      position = position.results[0][0]
    else
      position.lat = position.Placemark[0].Point.coordinates[0]
      position.lon = position.Placemark[0].Point.coordinates[1]    

    console.log(position)
    if position 
      map.zoom(10).center({ lat: position.lat, lon: position.lon })
      markerLayer.add_feature({
        geometry: { coordinates: [ position.lon, position.lat] },
        properties: { 'marker-color': '#000', 'marker-symbol': 'star-stroked', }
      })
    else
      map.zoom(2).center({ lat: 24.68695241199918, lon: 3.779296875000008 })
    

  getLocationGoogle: (location) ->
    geocoder = new GClientGeocoder()
    geocoder.getLocations(location, @position)