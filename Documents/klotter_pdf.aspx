<%@ Page Language="C#" AutoEventWireup="true" CodeFile="klotter_pdf.aspx.cs" Inherits="Documents_klotter_pdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="klotter.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="a4_paper "><div class="header height150">
                <div class="logo">
                    <img src="../Images/forsak2.png" />
                </div></div>            <div class="inspection_number"><asp:Literal ID="klotterno" runat="server" /></div><div style="clear:both"></div>
            <div class="header_text"><asp:Literal ID="title" runat="server" /></div>
            <div style="clear: both"></div>


            <div class="col col_205">
                <h2 class="dark">Fastighetsbeteckning</h2>
                <asp:Literal ID="buildingno" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Adress</h2>
                 <asp:Literal ID="address" runat="server" /><br />
                <asp:Literal ID="zipcode" runat="server" />
                <asp:Literal ID="city" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Åtgärd</h2>
                <asp:Literal ID="actions" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="dark">Kommentar</h2>
                <asp:Literal ID="comment" runat="server" />
            </div>
            <div class="col col_880">
                <h2 class="light">Bilder</h2>
                <img src="../Images/bygg1.jpg" class="two_two" />
                <img src="../Images/bygg1.jpg" class="two_two last" />
                <img src="../Images/bygg1.jpg" class="two_two" />
                <img src="../Images/bygg1.jpg" class="two_two last" />
            </div>

        </div>

        <div style="page-break-before: always">&nbsp;</div>

        <div class="a4_paper "><div class="header height150">
                <div class="logo">
                    <img src="../Images/forsak2.png" />
                </div></div>  
            <div class="inspection_number">222222</div>
            <div style="float: right; font-size: 17pt;">Faktureringsunderlag</div>
            <div style="clear: both"></div>
            <div class="header_text"><asp:Literal ID="title2" runat="server" /></div>
            <div style="clear: both"></div>


            <div class="col col_205">
                <h2 class="dark">Kund</h2>
                <asp:Literal ID="client" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Kundnummer</h2>
                <asp:Literal ID="clientno" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Fakturaadress</h2>
                <asp:Literal ID="clientaddress" runat="server" /><br />
                <asp:Literal ID="clientaddress2" runat="server" /><br />
                <asp:Literal ID="clientzipcode" runat="server" />
                <asp:Literal ID="clientcity" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="dark">Fakturatyp</h2>
                Hehehe
            </div>
            <div class="col col_205">
                <h2 class="dark">Fastighetsägare</h2>
                Hehehe
            </div>
            <div class="col col_205">
                <h2 class="dark">Org nummer</h2>
                Hehehe
            </div>
            <div class="col col_205">
                <h2 class="dark">Adress</h2>
                Hehehe
            </div>
            <div class="col col_205 last">
                <h2 class="dark">Kontaktperson</h2>
                Hehehe
            </div>
            <div class="col col_880">
                <h2 class="light">Beteckning</h2>
                                <table>
                    <thead>
                        <tr>
                            <td>Konstruktion</td>
                            <td>Mängd</td>
                            <td>Föreslagen åtgärd</td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Profilsockel mot trä/stålregel, 6 hörn</td>
                            <td>10,6 m<sup>2</sup></td>
                            <td>Rivning/Nymontering</td>
                        </tr>
                        <tr>
                            <td>Parkett, 2007</td>
                            <td>11,89 m<sup>2</sup></td>
                            <td>Rivning/Nymontering</td>
                        </tr>
                        <tr>
                            <td>Foam</td>
                            <td>11,89 m<sup>2</sup></td>
                            <td>Rivning/Nymontering</td>
                        </tr>
                        <tr>
                            <td>Spånskiva löst lagda</td>
                            <td>4,00 m<sup>2</sup></td>
                            <td>Rivning/Nymontering</td>
                        </tr>
                        <tr>
                            <td>Luftspaltsbildande matta</td>
                            <td>11,89 m<sup>2</sup></td>
                            <td>Ej berört av skadan</td>
                        </tr>
                        <tr>
                            <td>Betong (platta på mark)</td>
                            <td>11,89 m<sup>2</sup></td>
                            <td>Ej berört av skadan</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col col_205">
                <h2 class="light">Faktureringsbar tid</h2>
                Hehehe
            </div>
        </div>
    </form>
</body>
</html>
