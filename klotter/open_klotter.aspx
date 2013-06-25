﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="open_klotter.cs" Inherits="openklotter" %>
<%@ Register Src="~/controls/klotterlist.ascx" TagPrefix="uc1" TagName="klotterlist" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
    
</asp:Content>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h1>Öppna klotterärenden</h1>

    <uc1:klotterlist ID="klotterlist" runat="server" />
   
    <div style="clear: both"></div>
</asp:Content>