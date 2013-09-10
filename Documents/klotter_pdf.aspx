<%@ Page Language="C#" AutoEventWireup="true" CodeFile="klotter_pdf.aspx.cs" Inherits="Documents_klotter_pdf" %>

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
                <div class="sanerings_company_logo"><b><%: datecreated.ToShortDateString() %></b><br />
                    <%: createdby %><br />
                    <%: phone1 %>
                </div>
            </div>
            <div class="inspection_number">
                <%: klotterno %>
            </div>
            <div style="clear: both"></div>
            <div class="header_text">
                <%: title %>
            </div>
            <div style="clear: both"></div>

            <div class="col col_205">
                <h2 class="dark">Adress</h2>
                <%: address %><br />
                <%: zipcode %> <%: city %>
            </div>
            <div class="col col_205">
                <h2 class="dark">Fastighetsbeteckning</h2>
                <%: buildingno %>
            </div>

            <div class="col col_205">
                <h2 class="dark">Åtgärd</h2>
                <asp:Literal ID="actions" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="dark">Polisanmälan</h2>
                <%: policereport %>
            </div>
            <div style="clear:both"></div>
            <div class="col col_655">
                <h2 class="dark">Kommentar</h2>
                <%: comment %>
            </div>
            <div class="col col_205 last">
                <h2 class="dark">Taggar</h2>
                <%: tags %>
            </div>
            <div style="clear:both"></div>

            <div class="col col_205">
                <h2 class="light">Kund</h2>
                <%: client %>
            </div>
            <div class="col col_205">
                <h2 class="light">Kundnummer</h2>
                <%: clientno %>
            </div>
            <div class="col col_205">
                <h2 class="light">Fakturaadress</h2>
                <%: clientaddress %><br />
                <%: clientaddress2 %><br />
                <%: clientzipcode %> <%: clientcity %>
            </div>
            <div class="col col_205 last">
                <h2 class="light">Kontaktperson</h2>
            </div>
            <div style="clear:both"></div>
            <div class="col col_880">
                <h2 class="light">Specifikation</h2>
                <div class="spec_row">
                    <div class="name_spec">Benämning</div>
                    <div class="ammount_spec">Antal</div>
                </div>
                <div class="spec_row">
                    <div class="name">Tidsåtgång sanering</div>
                    <div class="ammount"><%: time %></div>
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
                </div>                <div class="sanerings_company_logo"><b>2013-01-02</b><br />
                    <%: createdby %>
                    
                </div>
            </div>
            <div class="inspection_number"><%:klotterno %></div>

            <div style="clear: both"></div>
            <div class="header_text">
                <%: title %>
            </div>
            <div style="clear: both"></div>

            <div class="col col_880">
                <h2 class="dark">Bilder före</h2>
                <asp:Repeater ID="beforeimagerepeater" runat="server">
                    <ItemTemplate>                    
                        <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="two_two <%#(Container.ItemIndex) % 2 != 0 ? "last" : "" %>" />
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
        <div style="page-break-before: always">&nbsp;</div>
                <div class="a4_paper ">
            <div class="header height150">
                <div class="logo">
                    <img src="../Images/forsak2.png" />
                </div>                <div class="sanerings_company_logo"><b>2013-01-02</b><br />
                    <%: createdby %>
                    
                </div>
            </div>
            <div class="inspection_number"><%:klotterno %></div>

            <div style="clear: both"></div>
            <div class="header_text">
                <%: title %>
            </div>
            <div style="clear: both"></div>
            <div class="col col_880">
                <h2 class="dark">Bilder efter</h2>
                <asp:Repeater ID="afterimagerepeater" runat="server">
                    <ItemTemplate>                    
                        <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="two_two <%#(Container.ItemIndex) % 2 != 0 ? "last" : "" %>" />
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
    </form>
</body>
</html>
