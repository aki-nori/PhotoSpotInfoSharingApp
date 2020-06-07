let map
let geocoder

function initMap() {
    // geocoderを初期化
    geocoder = new google.maps.Geocoder()

    map = new google.maps.Map(document.getElementById('map'), {
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
            map.setCenter(results[0].geometry.location);


            // google.maps.MarkerでGoogleMap上の指定位置にマーカが立つ
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
            document.getElementById("set-latitude").value = marker.getPosition().lat();
            document.getElementById("set-longitude").value = marker.getPosition().lng();
            map.setZoom(15);
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
};