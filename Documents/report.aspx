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
            font-size: 8pt;
            float: left;
            padding: 2px 7px 5px 7px;
        }

        .light {
            background-color: #85c8e0;
            color: #fff;
        }

        .dark {
            background-color: #1c80aa;
            color: #fff;
        }

        .divider-bottom {
            height: 20px;
            width: 100%;
        }

        .divider-side {
            width: 20px;
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

        <div class="block light">Skadetyp</div>
        <div class="divider-side"></div>
        <div class="block light">Skadeplats</div>
        <div class="divider-side"></div>
        <div class="block light">Skadedatum</div>
        <div class="divider-side"></div>
        <div class="block light">Självrisk</div>
        <div style="clear: both"></div>

        <div class="block"><asp:Literal ID="damagetype" runat="server" /></div>
        <div class="divider-side"></div>
        <div class="block">tdst, 12345 aaaa</div>
        <div class="divider-side"></div>
        <div class="block">2012-11-25</div>
        <div class="divider-side"></div>
        <div class="block">4000kr</div>
        <div style="clear: both"></div>
        <div class="divider-bottom"></div>

        <div class="block light">Typ av byggnad</div>
        <div class="divider-side"></div>
        <div class="block light">Storlek</div>
        <div class="divider-side"></div>
        <div class="block light">Antal och ålder på boende</div>
        <div class="divider-side"></div>
        <div class="block light">Försäkringar</div>
        <div style="clear: both"></div>



    </form>
</body>
</html>
