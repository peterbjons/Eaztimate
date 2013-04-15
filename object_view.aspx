<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="object_view.aspx.cs" Inherits="object_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Content/ui-lightness/jquery-ui-1.9.2.custom.css" rel="stylesheet">
    <link href="Content/lightbox.css" rel="stylesheet">
    <script src="Scripts/jquery-ui-1.9.2.custom.js"></script>
    <script src="Scripts/lightbox.js"></script>

    <script>
        $(function () {

            $("#slider_price").slider({
                value: <%=slider_price %>, min: 0, max: 100, disabled: true, range: "min"
            });
            $("#slider_usage").slider({
                value: <%=slider_usage %>, min: 0, max: 100, disabled: true, range: "min"
            });
            $("#slider_age").slider({
                value: <%=slider_age %>, min: 0, max: 100, disabled: true, range: "min"
            });
            $("#slider_other").slider({
                value: <%=slider_other %>, min: 0, max: 100, disabled: true, range: "min"
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="inspect_object">
        <h3><a href="inspection.aspx?id=<%=inspectionid %>" class="breadcrumb"><asp:Literal ID="inspectionno" runat="server" /></a> / <a href="room_view.aspx?id=<%=roomid %>" class="breadcrumb"><asp:Literal ID="roomname" runat="server" /></a></h3>
        <h1><asp:Literal ID="typename" runat="server" /></h1>

        <%--<div class="col1">--%>
        <div class="collapsable" style="width: 960px">
            <div class="threecol_1">

                <h2>Namn</h2>
                <p class="white_block">
                    <asp:Literal ID="itemtitle" runat="server" />
                </p>
            </div>

            <div class="threecol_2">
                <h2>Antal</h2>
                <p class="white_block">
                    1
                </p>
            </div>

            <div class="threecol_3">
                <h2>Saneringsbar</h2>
                <p class="white_block">
                    Ja
                </p>
            </div>
            <div style="clear: both"></div>            
            <h2>Omdöme</h2>
            <table id="sliders" style="width: 100%; background-color: #fff;">
                <tr>
                    <td>Pris:</td>
                    <td>
                        <div id="slider_price" class="slider"></div>
                    </td>
                </tr>
                <tr>
                    <td>Skick:</td>
                    <td>
                        <div id="slider_usage" class="slider"></div>
                    </td>
                </tr>
                <tr>
                    <td>Ålder:</td>
                    <td>
                        <div id="slider_age" class="slider"></div>
                    </td>
                </tr>
                <tr>
                    <td>Övrigt:</td>
                    <td>
                        <div id="slider_other" class="slider"></div>
                    </td>
                </tr>

            </table>
            <div style="clear: both"></div> 
            <h2>Bilder</h2>
            <asp:Repeater ID="imagerepeater" runat="server">
                <ItemTemplate>
                    <a href="<%#DataBinder.Eval(Container.DataItem, "image")%>" rel="lightbox"><img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="thumbnail_large"/></a>
                </ItemTemplate>
            </asp:Repeater>
            <div style="clear: both"></div> 
            <h2>Material</h2>
            <ul class="material">
                <li>Trä</li>
                <li>Metall</li>
                <li>Övrigt</li>
            </ul>





        </div>

        <%--<div class="col2">
            <h4>Objects</h4>
            <asp:listbox runat="server" ID="objects" DataTextField="type" DataValueField="itemid">
            </asp:listbox>
            <asp:LinkButton runat="server" OnClick="Object_Click"><span class="goto">Go to Object &raquo;</span></asp:LinkButton>

        </div>--%>
        <div style="clear:both"></div>
</asp:Content>

