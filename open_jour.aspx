<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="open_jour.aspx.cs" Inherits="openjour" %>
<%@ Register Src="~/controls/jourlist.ascx" TagPrefix="uc1" TagName="jourlist" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
    
</asp:Content>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h1>Open Jour</h1>
    <div class="whitebox">
    <uc1:jourlist ID="jourlist" runat="server" />
   
    <div style="clear: both"></div></div>
</asp:Content>