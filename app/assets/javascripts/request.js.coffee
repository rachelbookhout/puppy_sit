$(document).ready ->
map = L.mapbox.map('map', 'rbookhout.jnj6mdfp').setView([42.368, -71.112], 13)
$.ajax
  dataType: 'text'
  url: 'requests.json'
  success: (data) ->
    geojson = $.parseJSON(data)
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
