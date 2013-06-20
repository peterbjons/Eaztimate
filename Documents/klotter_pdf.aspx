﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="klotter_pdf.aspx.cs" Inherits="Documents_klotter_pdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="klotter.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="a4_paper ">
            <div class="header height150">
                <div class="logo">
                    <img src="../Images/forsak2.png" />
                </div>
            </div>
            <div class="inspection_number">
                <asp:Literal ID="klotterno" runat="server" />
            </div>
            <div style="clear: both"></div>
            <div class="header_text">
                <asp:Literal ID="title" runat="server" />
            </div>
            <div style="clear: both"></div>

            <div class="col col_205">
                <h2 class="dark">Adress</h2>
                <asp:Literal ID="address" runat="server" /><br />
                <asp:Literal ID="zipcode" runat="server" />
                <asp:Literal ID="city" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Fastighetsbeteckning</h2>
                <asp:Literal ID="buildingno" runat="server" />
            </div>

            <div class="col col_205">
                <h2 class="dark">Åtgärd</h2>
                <asp:Literal ID="actions" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="dark">Polisanmälan</h2>
                <asp:Literal ID="policereport" runat="server" />
            </div>
            <div class="col col_655">
                <h2 class="dark">Kommentar</h2>
                <asp:Literal ID="comment" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="dark">Utfört av</h2>
                <asp:Literal ID="createdby" runat="server" />
            </div>


            <div class="col col_205">
                <h2 class="light">Kund</h2>
                <asp:Literal ID="client" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="light">Kundnummer</h2>
                <asp:Literal ID="clientno" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="light">Fakturaadress</h2>
                <asp:Literal ID="clientaddress" runat="server" /><br />
                <asp:Literal ID="clientaddress2" runat="server" /><br />
                <asp:Literal ID="clientzipcode" runat="server" />
                <asp:Literal ID="clientcity" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="light">Kontaktperson</h2>
            </div>
            <div class="col col_880">
                <h2 class="light">Specifikation</h2>
                <div style="border-bottom: 1px solid #ccc">
                    <div style="float: left">Tidsåtgång sanering</div>
                    <div style="float: right">200 timmar</div>
                    <div style="clear: both"></div>
                </div>
                <div style="border-bottom: 1px solid #ccc">
                    <div style="float: left">Tidsåtgång sanering</div>
                    <div style="float: right">200 timmar</div>
                    <div style="clear: both"></div>
                </div>
            </div>
            <%--            <div class="col col_205">
                <h2 class="light">Org nummer</h2>
                Hehehe
            </div>
            <div class="col col_205">
                <h2 class="light">Adress</h2>
                Hehehe
            </div>--%>
        </div>

        <div style="page-break-before: always">&nbsp;</div>

        <div class="a4_paper ">
            <div class="header height150">
                <div class="logo">
                    <img src="../Images/forsak2.png" />
                </div>
            </div>
            <div class="inspection_number"><asp:Literal ID="klotterno2" runat="server" /></div>

            <div style="clear: both"></div>
            <div class="header_text">
                <asp:Literal ID="title2" runat="server" />
            </div>
            <div style="clear: both"></div>

            <div class="col col_205">
                <h2 class="dark">Taggar</h2>
                Hjort</div>


            <div class="col col_880">
                <h2 class="dark">Bilder före</h2>
                <img src="../Images/bygg1.jpg" class="two_two" />
                <img src="../Images/bygg1.jpg" class="two_two last" />
            </div>
            <div class="col col_880">
                <h2 class="light">Bilder efter</h2>
                <img src="../Images/bygg1.jpg" class="two_two" />
                <img src="../Images/bygg1.jpg" class="two_two last" />
            </div>
        </div>
    </form>
</body>
</html>
