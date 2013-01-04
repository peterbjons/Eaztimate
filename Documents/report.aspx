<%@ Page Language="C#" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="Documents_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .inspection_number {
            background-color: #000;
            color: #fff;
            font-weight: 300;
            font-size: 10pt;
            padding: 5px 7px;
            width: 205px;
            margin-top: 100px;
            margin-bottom: 30px;
        }

        h1 {
            font-weight: 300;
            margin-bottom: 50px;
            font-size: 34pt;
        }

        .block {
            width: 170px;
            background-color: #ccc;
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
            <div class="inspection_number">
                <asp:Literal ID="inspectionno" runat="server">Inspection number</asp:Literal>
            </div>
            <h1>
                <asp:Literal ID="description" runat="server">Description</asp:Literal></h1>

            <div class="block">hej</div>
            <div style="width: 20px; float: left"></div>
            <div class="block">hejhe</div>
        <div style="width: 20px; float: left"></div>
            <div class="block">jehj</div>
        <div style="width: 20px; float: left"></div>
            <div class="block">hej</div>
        
    </form>
</body>
</html>
