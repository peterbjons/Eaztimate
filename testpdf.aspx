<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testpdf.aspx.cs" Inherits="testpdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .testklass {
            background-color: #f00;
        }

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="clear: both"></div>
        <div class="inspection_number" >[inspectionno]</div>
        <h2>[inspectiontitle]</h2>
        <h3 class="testklass"><asp:Literal ID="testlit" runat="server" /></h3>
    </form>
</body>
</html>
