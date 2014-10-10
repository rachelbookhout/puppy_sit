jQuery ->
map = L.mapbox.map('map', 'rbookhout.jnj6mdfp').setView([42.368, -71.112], 13)

L.tileLayer("https://a.tiles.mapbox.com/v4/rbookhout.jnj6mdfp/page.html?access_token=pk.eyJ1IjoicmJvb2tob3V0IiwiYSI6InplX2F1N2cifQ.OS0b9-WgU_ID7X99bui17g#4/38.00/-97.00",
  attribution: "<a href='https://www.mapbox.com/about/maps/' target='_blank'>&copy; Mapbox &copy; OpenStreetMap</a> <a class='mapbox-improve-map' href='https://www.mapbox.com/map-feedback/' target='_blank'>Improve this map</a>"
  maxZoom: 18
).addTo map


$.ajax
  dataType: 'text'
  url: '/requests.json'
  success: (data) ->
    geojson = $.parseJSON(data)
    debugger;
    map.featureLayer.setGeoJSON(geojson)

map.featureLayer.on 'layeradd', (e) ->
  marker = e.layer
  properties = marker.feature.properties

  popupContent =  '<div class="popup">' +
                    '<h3>' + request.name + '</h3>' +
                    '<p>' + request.photo + '</p>' +
                  '</div>'

  marker.bindPopup popupContent,
    closeButton: false
    minWidth: 320
