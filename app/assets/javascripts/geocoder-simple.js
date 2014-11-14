$(initialize);

function initialize(){
  createMap();
  addLocations();
}

function createMap(){
  var mapOptions = {
    zoom: 12,
  };

  window.map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  window.mapBound = new google.maps.LatLngBounds();
}

function addLocations() {
  $.each($(".listing-address"), function(i, address) {
    geocodeAndAddMarker($(address).text());
  });
};

function geocodeAndAddMarker(address){
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode( { 'address': address }, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var result_location = results[0].geometry.location;
      var marker = new google.maps.Marker({
        map: window.map,
        position: result_location
      });

      setBounds(result_location)
    } else {
      alert("Geocode was not successful for the following reason: " + status);
    }
  });
}

function setBounds(latlng) {
  window.mapBound.extend(latlng);
  window.map.fitBounds(window.mapBound)
}

//google.maps.event.addDomListener(window, 'load', initialize);
