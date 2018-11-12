<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mapWithNames.aspx.cs" Inherits="mapWithNames" %>

<!DOCTYPE html>

<html>
<head>
    <style>
        /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
    <div id="map"></div>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAOMifgFv-paPtyeASDRcH3FtjBdieleME&callback=initMap" type="text/javascript">
    </script>
    <script>
        var map;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 2,
                center: new google.maps.LatLng(2.8, -187.3),
                mapTypeId: 'terrain'
            });

            // Create a <script> tag and set the USGS URL as the source.
            var script = document.createElement('script');
            // This example uses a local copy of the GeoJSON stored at
            // http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojsonp
            script.src = 'js/Coordinates.js';
            ;
            document.getElementsByTagName('head')[0].appendChild(script);

            infoWindow = new google.maps.InfoWindow();
            // When the user clicks, open an infowindow
            map.data.addListener('click', function (event) {
                console.log('testLog');
                var myHTML = event.feature.getProperty("name");
                infowindow.setContent("<div style='width:150px; text-align: center;'>" + myHTML + "TEST</div>");
                infowindow.setPosition(event.feature.getGeometry().get());
                infowindow.setOptions({ pixelOffset: new google.maps.Size(0, -30) });
                infowindow.open(map);


            });


        }

        // Loop through the results array and place a marker for each
        // set of coordinates.
        window.geojson_callback = function (results) {
            for (var i = 0; i < results.features.length; i++) {
                console.log('test');
                var coords = results.features[i].geometry.coordinates;
                var name = results.features[i].properties.name;
                var latLng = new google.maps.LatLng(coords[0], coords[1]);
                var marker = new google.maps.Marker({
                    position: latLng,
                    map: map,
                    title: name

                });


            }
        }
        google.maps.event.addDomListener(window, 'load', initMap);


    </script>
</body>
</html>
