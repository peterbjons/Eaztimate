﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="open_klotter.aspx.cs" Inherits="openklotter" Theme="Standard" UICulture="Auto" %>
<%@ Register Src="~/controls/klotterlist.ascx" TagPrefix="uc1" TagName="klotterlist" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
    <style>
        .chart1 #Bar1 {
            stroke: none;
        }
        .chart1 > div {
            border: none !important;
        }
        .chart2 > div {
            border: none !important;
        }

        #infoWindow {
            width: 100px;
            font-size: 0.8em;
        }
    </style>
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDvJakG_LsdMMz4JvpjPp838tHpAJUkQOA&sensor=false">
    </script>
    <script type="text/javascript">
        var infowindow = new google.maps.InfoWindow({
            content: '',
            maxWidth: 100
        });
        var markers = [<%=markers %>];
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
    <h1>Öppna klotterärenden</h1>
    <div class="datepicker">
        <asp:DropDownList ID="person" runat="server" DataTextField="syncemail" DataValueField="syncemail" Visible="false">            
        </asp:DropDownList>
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
            <div id="chart1" style="float: left; margin-right: 10px;">
                <h2>Ärenden per månad</h2>
                <ajaxToolkit:BarChart ID="monthbar" runat="server"  ChartType="Bar"
                    CategoriesAxis="jul, aug, sep, okt, nov, dec" CssClass="chart1"
                     ValueAxisLines="4">
                    <%--<Series>
                        <ajaxToolkit:BarChartSeries Name="Ärenden"
                            Data="0, 0, 1, 8, 10, 11" BarColor="#1c80aa" />
                    </Series>--%>
                </ajaxToolkit:BarChart>
            </div>  
            <div style="float: left; margin-right: 10px;">
                <h2><a href="map_klotter.aspx">Placering</a></h2>
                <div id="map-canvas" style="width: 300px; height: 200px;"></div>
            </div>
            <div id="chart2" style="float: left;">
                <h2>Typ</h2>
                <ajaxToolkit:PieChart ID="pieChart1" runat="server" ChartHeight="200" 
                    ChartWidth="300" CssClass="chart2"
                    ChartTitleColor="#0E426C">
                    <PieChartValues>
                        <ajaxToolkit:PieChartValue Category="Högtryckstvätt" Data="45" 
                        PieChartValueColor="#1c80aa" PieChartValueStrokeColor="#1c80aa" />
                        <ajaxToolkit:PieChartValue Category="HT Recycling" Data="25" 
                        PieChartValueColor="#549ec4" PieChartValueStrokeColor="#549ec4" />
                        <ajaxToolkit:PieChartValue Category="Handtvätt" Data="17" 
                        PieChartValueColor="#85c8e0" PieChartValueStrokeColor="#85c8e0" />                        
                    </PieChartValues>
                </ajaxToolkit:PieChart >
            </div>
            <div style="clear: both"></div>
        </div>
        <div style="clear: both"></div>
    </div>    
    <div class="whitebox"> 
        <uc1:klotterlist ID="klotterlist" runat="server" />
            <%--<ajaxToolkit:PieChart ID="PieChart1" runat="server"></ajaxToolkit:PieChart>--%>
        <div style="clear: both"></div>
    </div>
</asp:Content>