<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="room_view.aspx.cs" Inherits="room_view" %>
<%@ Register Src="~/controls/objectlist.ascx" TagPrefix="uc1" TagName="objectlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Content/lightbox.css" rel="stylesheet">
    <script src="Scripts/lightbox.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="inspect_object">
        <h3><a href="inspection.aspx?id=<%=inspectionid %>" class="breadcrumb"><asp:Literal ID="inspectionno" runat="server" /></a></h3>
        <h1><asp:Literal ID="title" runat="server" /></h1>
        <div class="collapsable" style="width: 960px">
            <div class="threecol_1">
                <h2>Namn</h2>
                <p class="white_block">
                    <asp:Literal ID="description" runat="server" />
                </p>
            </div>
            <div class="threecol_2">
                <h2>Area</h2>
                <p class="white_block">
                    44m&sup2;
                </p>
            </div>
            <div class="threecol_3">
                <h2>Objekt</h2>
                <p class="white_block">
                    <asp:Literal ID="objectscount" runat="server" />
                </p>
            </div>
            <div style="clear: both;"></div> 
            <div class="object_col">
                <h2>Skada</h2>
                <p class="white_block">
                    <asp:Literal ID="opinion" runat="server" />
                </p>
            </div>                       
            <div style="clear: both"></div>
            <h2>Bilder</h2>
            <asp:Repeater ID="imagerepeater" runat="server">
                <ItemTemplate>
                    <a href="<%#DataBinder.Eval(Container.DataItem, "image")%>" rel="lightbox"><img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="thumbnail_large <%#Container.ItemIndex == 3 ? "last" : string.Empty %>"/></a>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div style="clear:both"></div>

        <uc1:objectlist runat="server" ID="objectlist" roomselection="false" catselection="true"/>

    </div>
</asp:Content>

