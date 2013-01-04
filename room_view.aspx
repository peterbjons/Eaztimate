<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="room_view.aspx.cs" Inherits="room_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="inspect_object">
        <h3><a href="inspect_object.aspx?id=<%=inspectionid %>" class="breadcrumb"><asp:Literal ID="inspectionno" runat="server" /></a></h3>
        <h1><asp:Literal ID="title" runat="server" /></h1>
        <div class="col1">
            <div class="room_col">

                <h4>Name</h4>
                <p>
                    <asp:Literal ID="description" runat="server" />
                </p>
            </div>
            <div class="room_col">
                <h4>Damage grade</h4>
                <p>
                    <asp:Literal ID="opinion" runat="server" />
                </p>
            </div>
            <div class="object_col">
                <h4>Size</h4>
                <p>
                    44m&sup2;
                </p>
            </div>
            <div style="clear: both"></div>
            <h4>Pictures</h4>
            <asp:Repeater ID="imagerepeater" runat="server">
                <ItemTemplate>
                    <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="thumbnail" />
                </ItemTemplate>
            </asp:Repeater>                        
        </div>
    
    <div class="col2">
        <h4>Objects</h4>
        <asp:listbox runat="server" ID="objects" DataTextField="type" DataValueField="itemid">
        </asp:listbox>
        <a href="object_view.aspx"><span class="goto">Go to Object &raquo;</span></a>

    </div>

        <div style="clear:both"></div>



    </div>
</asp:Content>

