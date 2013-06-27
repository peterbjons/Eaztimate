<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="open_klotter.cs" Inherits="openklotter" %>
<%@ Register Src="~/controls/klotterlist.ascx" TagPrefix="uc1" TagName="klotterlist" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
    
</asp:Content>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajaxToolkit:ToolkitScriptManager>
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h1>Öppna klotterärenden</h1>
    <div class="whitebox">
    <uc1:klotterlist ID="klotterlist" runat="server" />
        <ajaxToolkit:PieChart ID="PieChart1" runat="server"></ajaxToolkit:PieChart>
    <div style="clear: both"></div></div>
</asp:Content>