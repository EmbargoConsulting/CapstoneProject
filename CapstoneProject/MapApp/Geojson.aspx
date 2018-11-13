<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Geojson.aspx.cs" Inherits="Geojson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.5/leaflet.css" />
    <script src="usStates.geojson" type="text/javascript"></script>
    <script src="/js/leaflet-0.7.2/leaflet.ajax.min.js"></script>

    <style>
        html, body, #map {
            height: 100%;
        }
        body {
            padding: 0;
            margin: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="form-group">
                <label>Name</label>
                <asp:TextBox ID="TextBox1" required="required" CssClass="form-control" runat="server"></asp:TextBox>

            </div>
            <div class="form-group">
                <label>Latitude</label>
                <asp:TextBox ID="TextBox2" AutoPostBack="true" runat="server" OnTextChanged="TestSubmit_ServerClick" CssClass="form-control" placeholder=""></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Longitude</label>
                <asp:TextBox ID="TextBox3" AutoPostBack="true" runat="server" OnTextChanged="TestSubmit_ServerClick" CssClass="form-control" placeholder=""></asp:TextBox>
            </div>

            <asp:Button ID="Button1" runat="server" Text="Save Coordinates" OnClick="TestSubmit_ServerClick" />
            <asp:Button ID="Button2" OnClientClick="if (!getLocation()) { return false;};"  runat="server" Text="get lat/long"/>
                        <asp:Button ID="Button3" runat="server" Text="Finish" OnClick="TestFinish_ServerClick" />

        </div>
    <div id="map" style="height: 100%"</div>
    <script src="http://d3js.org/d3.v2.min.js?2.9.3"></script>
    <script src="http://cdn.leafletjs.com/leaflet-0.5/leaflet.js"></script>

    <script type="text/javascript"> 
var x = document.getElementById("demo");
        var watchid;
   function getLocation() {
       if (navigator.geolocation) {
        geoLoc = navigator.geolocation;
        watchID = geoLoc.watchPosition(showPosition);

    }
 }

     function showPosition(position) {
         TextBox2.value = position.coords.latitude;
         TextBox3.value = position.coords.longitude;
        }


    </script>
    </form>
</body>
</html>
