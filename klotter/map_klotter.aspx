<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="map_klotter.aspx.cs" Inherits="klotter_map_klotter" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">  
    <style>        
        #infoWindow {
            width: 100px;
            font-size: 0.8em;
        }
    </style>  
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvJakG_LsdMMz4JvpjPp838tHpAJUkQOA&sensor=false">
    </script>
    <script type="text/javascript">
        var markers = [<%= markers %>];
        var infowindow = new google.maps.InfoWindow({
            content: '',
            maxWidth: 100
        });
        function initialize() {
            var mapOptions = {
                center: new google.maps.LatLng(60.606, 15.649),
                zoom: 7,
                disableDefaultUI: true,
                /*mapTypeId: google.maps.MapTypeId.HYBRID*/
            };

            var image = '/images/flag.png';
            var myLatLng = new google.maps.LatLng(60.606, 15.649);


            var map = new google.maps.Map(document.getElementById("map-canvas"),
                mapOptions);

            var bounds = new google.maps.LatLngBounds();

            for (var i = 0; i < markers.length; i++) {
                var mark = markers[i];
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(mark[0], mark[1]),
                    map: map,
                    icon: image,
                    content: '<div id="infoWindow">' + mark[2] + '</div>'
                });
                google.maps.event.addListener(marker, "click", function () {
                    infowindow.setContent(this.content);
                    infowindow.open(map, this);
                });
                bounds.extend(marker.position);

            }

            map.fitBounds(bounds);

            //var beachMarker = new google.maps.Marker({
            //    position: myLatLng,
            //    map: map,
            //    icon: image
            //});           

        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></ajaxToolkit:ToolkitScriptManager>
    <h1>Karta klotterärenden</h1>
    <div class="datepicker">
        <asp:TextBox ID="datestart" runat="server"></asp:TextBox>
        <ajaxToolkit:CalendarExtender runat="server"
            id="datestartExtender"
            TargetControlID="datestart"
            CssClass="ajax__calendar"            
            Format="yyyy-MM-dd"
            />
         - 
        <asp:TextBox ID="dateend" runat="server"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="dateendExtender" runat="server"
            TargetControlID="dateend"
            CssClass="ajax__calendar"
            Format="yyyy-MM-dd"
            />
        
        <asp:ImageButton ID="updateDate" runat="server" OnClick="updateDate_Click" Text="Uppdatera" ImageUrl="~/Images/datepicker_reload.png"/>
    </div><div style="clear:both"></div>
    <div class="whitebox">        
        <div>
            <h2>Placering</h2>
            <div id="map-canvas" style="width: 100%; height: 500px;"></div>        
        </div>
        <div style="clear: both"></div>
    </div>
</asp:Content>

