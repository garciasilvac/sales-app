export function initMap(lat, lng, mapDiv, iwContent) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 15
    };
/*    var map = new google.maps.Map(document.getElementById('map'), mapOptions);*/    
    var map = new google.maps.Map(mapDiv, mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        map: map,
        clickable : true
    });
    marker.info = new google.maps.InfoWindow({
        content: iwContent
    });
    marker.info.open(map, marker);
    google.maps.event.addListener(marker, 'click', function() {
      marker.info.open(map, marker);
    });
}