var map_new
var geocoder


function initMap() {
    // geocoderを初期化
    geocoder = new google.maps.Geocoder()

    map_new = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 38, lng: 140 },
        zoom: 5
    });
}

function codeAddress() {
    // 入力を取得
    let inputAddress = document.getElementById('address').value;

    // geocodingしたあとmapを移動
    geocoder.geocode({ 'address': inputAddress }, function(results, status) {
        if (status == 'OK') {
            // map.setCenterで地図が移動
            map_new.setCenter(results[0].geometry.location);


            // google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
            var marker = new google.maps.Marker({
                map: map_new,
                position: results[0].geometry.location
            });

            if (marker == []) {
                document.getElementById("place-submit-button").disabled = true;
            } else {
                document.getElementById("place-submit-button").disabled = false;
            }
            document.getElementById("set-latitude").value = marker.getPosition().lat();
            document.getElementById("set-longitude").value = marker.getPosition().lng();
            map_new.setZoom(15);
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
};