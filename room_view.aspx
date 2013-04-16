<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="room_view.aspx.cs" Inherits="room_view" %>
<%@ Register Src="~/controls/objectlist.ascx" TagPrefix="uc1" TagName="objectlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Content/lightbox.css" rel="stylesheet">
    <script src="Scripts/lightbox.js"></script>
        <script type="text/javascript">
            var speed = 1;
            $(document).ready(function () {
                expandElement($("#collapse"), $(".collapsable"));
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="inspect_object">
        <a href="inspection.aspx?id=<%=inspectionid %>" class="breadcrumb"><asp:Literal ID="inspectionno" runat="server" /></a>
        <h1><asp:Literal ID="title" runat="server" /></h1>
        <a class="button" style="float: none" id="collapse">Dölj</a>
        <h2 style="margin-top: 20px">Allmän information</h2>
        <div class="collapsable" style="width: 940px; background-color: #fff; padding: 10px; margin-bottom: 20px;">
            <div class="left_col">
                <h3>Namn</h3>
                <p>
                    <asp:Literal ID="description" runat="server" />
                </p>
            </div>
            <div class="left_col">
                <h3>Yta (m²)</h3>
                <p>
                    44m&sup2;
                </p>
            </div>
            <div class="right_col">
                <h3>Objekt</h3>
                <p>
                    <asp:Literal ID="objectscount" runat="server" />
                </p>
            </div>
            <div style="clear: both;"></div> 
            <div class="object_col">
                <h3>Skada</h3>
                <p>
                    <asp:Literal ID="opinion" runat="server" />
                </p>
            </div>                       
            <div style="clear: both"></div>
            <h3>Bilder</h3>
            <asp:Repeater ID="imagerepeater" runat="server">
                <ItemTemplate>
                    <a href="<%#DataBinder.Eval(Container.DataItem, "image")%>" rel="lightbox[bilder]"><img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="thumbnail_large <%#Container.ItemIndex == 3 ? "last" : string.Empty %>"/></a>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div style="clear:both"></div>

        <uc1:objectlist runat="server" ID="objectlist" roomselection="false" catselection="true"/>

    </div>
</asp:Content>

