var map = L.mapbox.map('map', 'rbookhout.jnj6mdfp', {
  accessToken: 'pk.eyJ1IjoicmJvb2tob3V0IiwiYSI6InplX2F1N2cifQ.OS0b9-WgU_ID7X99bui17g'
});

map.setView([42.366, -71.109], 13);
$.ajax({
  dataType: 'json',
  url: '/requests.json',
  success: function(geoJSON) {
    map.featureLayer.setGeoJSON(geoJSON);
  }
});
map.featureLayer.on('layeradd', function(e) {
  var marker, popupContent, properties;
  marker = e.layer;
  properties = marker.feature.properties;
  popupContent = '<div class="popup">' + '<h3>' + '<a href ="requests/' + properties.num + '">'
  + properties.name + '</a>' +'</h3>' + '<h4> From: ' + properties.start_time + '</h4> ' + '<h4> To: ' + properties.end_time +  '</h4>' +'<p>' + '<img src="' + properties.photo + '" width = "300px" height = "300px">' + '</p>' + '</div>';
  return marker.bindPopup(popupContent, {
    closeButton: false,
    minWidth: 320
  });
});
