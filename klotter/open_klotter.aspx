<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="open_klotter.cs" Inherits="openklotter" Theme="Standard" %>
<%@ Register Src="~/controls/klotterlist.ascx" TagPrefix="uc1" TagName="klotterlist" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
    <style>
        .chart1 #Bar1 {
            stroke: none;
        }
        .chart1 > div {
            border: none !important;
        }
    </style>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvJakG_LsdMMz4JvpjPp838tHpAJUkQOA&sensor=false">
    </script>
    <script type="text/javascript">
        function initialize() {
            var mapOptions = {
                center: new google.maps.LatLng(60.606, 15.649),
                zoom: 7,
                disableDefaultUI: true,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };

            var image = '/images/ez_logo_64.png';
            var myLatLng = new google.maps.LatLng(60.606, 15.649);


            var map = new google.maps.Map(document.getElementById("map-canvas"),
                mapOptions);

            var beachMarker = new google.maps.Marker({
                position: myLatLng,
                map: map,
                icon: image
            });

        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <h1>Öppna klotterärenden</h1>
    <div class="whitebox">        
        <div>            
            <div id="chart1" style="float: left">
                <h2>Ärenden per månad</h2>
                <ajaxToolkit:BarChart ID="BarChart1" runat="server"  ChartType="Bar"
                    CategoriesAxis="jul, aug, sep, okt, nov, dec" CssClass="chart1"
                     ValueAxisLines="4">
                    <Series>
                        <ajaxToolkit:BarChartSeries Name="Ärenden"
                            Data="0, 0, 1, 8, 10, 11" BarColor="#1c80aa" />
                    </Series>
                </ajaxToolkit:BarChart>
            </div>  
            <div style="float: left">
                <h2>Ärendenas placering</h2>
                <div id="map-canvas" style="width: 300px; height: 200px;"/>
            </div>
            <div style="clear: both"></div>
        </div>
        <div style="clear: both"></div>
        <uc1:klotterlist ID="klotterlist" runat="server" />
            <%--<ajaxToolkit:PieChart ID="PieChart1" runat="server"></ajaxToolkit:PieChart>--%>
        <div style="clear: both"></div>
    </div>
</asp:Content>