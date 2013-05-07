class Map
  constructor: (lat, lon) ->
    if $('#map')
      $.getScript("http://api.tiles.mapbox.com/mapbox.js/v0.6.7/mapbox.js", ->
        $("head").append("<link>");
        css = $("head").children(":last");
        css.attr({
          rel:  "stylesheet",
          type: "text/css",
          href: "http://api.tiles.mapbox.com/mapbox.js/v0.6.7/mapbox.css"
        });

        map = mapbox.map('map')
        map.addLayer(mapbox.layer().id('examples.map-vyofok3q'))

        map.ui.zoomer.add()
        map.ui.zoombox.add()
        map.ui.fullscreen.add()

        markerLayer = mapbox.markers.layer()

        mapbox.markers.interaction(markerLayer)
        map.addLayer(markerLayer);

        map.zoom(15).center({ lat: lat, lon: lon })

        markerLayer.add_feature({
            geometry: {
                coordinates: [lon, lat]
            },
            properties: {
                'marker-color': '#FF0000',
                'marker-symbol': 'star-stroked',
            }
        })
      )

App.Utilities.Map = Map