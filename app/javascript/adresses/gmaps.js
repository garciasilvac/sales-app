export function initMap(lat, lng, mapDiv) {
    var myCoords = new google.maps.LatLng(lat, lng);
    var mapOptions = {
    center: myCoords,
    zoom: 15
    };
/*    var map = new google.maps.Map(document.getElementById('map'), mapOptions);*/    
    var map = new google.maps.Map(mapDiv, mapOptions);
    var marker = new google.maps.Marker({
        position: myCoords,
        map: map
    });
}