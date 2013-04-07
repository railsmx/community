class Map
  constructor: (title, description, lat, lon) ->
    map = mapbox.map('map')
    map.addLayer(mapbox.layer().id('examples.map-vyofok3q'))

    map.ui.zoomer.add()
    map.ui.zoombox.add()
    map.ui.fullscreen.add()

    markerLayer = mapbox.markers.layer()

    mapbox.markers.interaction(markerLayer)
    map.addLayer(markerLayer);

    map.zoom(10).center({ lat: lat, lon: lon })

    markerLayer.add_feature({
        geometry: {
            coordinates: [lon, lat]
        },
        properties: {
            'marker-color': '#FF0000',
            'marker-symbol': 'star-stroked',
            title: title,
            description: description
        }
    })


App.Utilities.Map = Map