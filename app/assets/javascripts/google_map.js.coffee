window.initMap = ->
  mapCanvas = document.getElementById('map')
  if mapCanvas
    treehouse =
      lat: 1.5904932
      lng: 103.516292
    mapOptions =
      center: treehouse
      zoom: 15
    map = new (google.maps.Map)(mapCanvas, mapOptions)
    marker = new (google.maps.Marker)(
      position: treehouse
      map: map)
