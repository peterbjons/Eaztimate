<%@ Page Language="C#" AutoEventWireup="true" CodeFile="header.aspx.cs" Inherits="Documents_header" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="jour.css?asdf=1" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="header height150">
                <div class="logo">
                    <img src="../Images/forsak2.png" />
                </div>
                <div style="float:right; text-align: right"><asp:Literal ID="insurancenumber" runat="server" /><br /><asp:Literal ID="address" runat="server" /><br /><asp:Literal ID="jourdate" runat="server" /></div>
                <div style="clear: both"></div>
            </div>
</body>
</html>