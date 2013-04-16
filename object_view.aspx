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
            <script type="text/javascript">
                var speed = 1;
                $(document).ready(function () {
                    expandElement($("#collapse"), $(".collapsable"));
                });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="inspect_object">
        <a href="inspection.aspx?id=<%=inspectionid %>" class="breadcrumb"><asp:Literal ID="inspectionno" runat="server" /></a> / <a href="room_view.aspx?id=<%=roomid %>" class="breadcrumb"><asp:Literal ID="roomname" runat="server" /></a>
        <h1><asp:Literal ID="typename" runat="server" /></h1>

        <%--<div class="col1">--%>
               
        <h2 style="margin-top: 20px">Allmän information</h2>
       <div class="collapsable" style="width: 940px; background-color: #fff; padding: 10px; margin-bottom: 20px;">
            <div class="left_col" style="width: 460px;">

                <h3>Namn</h3>
                <p>
                    <asp:Literal ID="itemtitle" runat="server" />
                </p>
            </div>

            <div class="left_col" style="width:220px;">
                <h3>Antal</h3>
                <p>
                    1
                </p>
            </div>

            <div class="right_col" style="width:220px;">
                <h3>Saneringsbar</h3>
                <p>
                    Ja
                </p>
            </div>
            <div style="clear: both"></div>   
           </div>         
            <h2 style="margin-top: 20px">Övrig information</h2><div class="collapsable" style="width: 940px; background-color: #fff; padding: 10px; margin-bottom: 20px;">
                <div class="left_col" style="width:460px">
                <h3>Omdöme</h3>
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
                    </div>
            <div class="right_col" style="width:460px"><h3>Material</h3>
            <ul class="material">
                <li>Trä</li>
                <li>Metall</li>
                <li>Övrigt</li>
            </ul>


            </div><div style="clear: both"></div> 
               <div style="display:block">
            <h3>Bilder</h3>
            <asp:Repeater ID="imagerepeater" runat="server">
                <ItemTemplate>
                    <a href="<%#DataBinder.Eval(Container.DataItem, "image")%>" rel="lightbox[bilder]"><img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="thumbnail_large"/></a>
                </ItemTemplate>
            </asp:Repeater></div>
            
            
           <div style="clear: both"></div> 
 </div>



        </div>

        <%--<div class="col2">
            <h4>Objects</h4>
            <asp:listbox runat="server" ID="objects" DataTextField="type" DataValueField="itemid">
            </asp:listbox>
            <asp:LinkButton runat="server" OnClick="Object_Click"><span class="goto">Go to Object &raquo;</span></asp:LinkButton>

        </div>--%>
        <div style="clear:both"></div>
</asp:Content>

