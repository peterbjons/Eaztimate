<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jour_pdf.aspx.cs" Inherits="Documents_jour_pdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="jour.css?asdf=1" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="a4_paper ">
            <div class="header height60">
                <div class="logo">
                    <img src="../Images/forsak2.png" />
                </div>
                <div class="inspection_number">03-14917-12 NUS  <span style="float: right">sid 2/4</span></div>
                <div style="clear: both"></div>
            </div>
            <div class="header_text">Insatsrapport - Jour</div>
            <div class="col col_205">
                <h2 class="dark">Försäkringsnummer</h2>
                <asp:Literal id="insuranceno" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Typ av försäkring</h2>
                <asp:Literal id="insurancetype" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Händelse</h2>
                <asp:Literal id="damagetype" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="dark">Insatsdatum</h2>
                <asp:Literal id="jourdate" runat="server" />
            </div>
            <div style="clear: both"></div>
            <div class="col col_205">
                <h2 class="dark">Försäkringstagare</h2>
                <asp:Literal id="contactname" runat="server" /><br />
                <asp:Literal id="contactaddress" runat="server" /><br />
                <asp:Literal id="contactaddress2" runat="server" />
                <asp:Literal id="contactzipcode" runat="server" /> <asp:Literal id="contactcity" runat="server" /><br />
                <asp:Literal id="contactphone1" runat="server" />
                <asp:Literal id="contactphone2" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Ansvarig Ocab</h2>                
                <asp:Literal id="syncemail" runat="server" />
            </div>
            <div style="clear: both"></div>
            <asp:Repeater ID="jourimagerepeater" runat="server">
                <ItemTemplate>                    
                    <div class="col col_205 <%#(Container.ItemIndex+1) % 4 == 0 ? "last" : "" %>">
                        <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" />
                    </div>                        
                </ItemTemplate>
            </asp:Repeater>
            <div style="clear: both"></div>
            <div class="col col_880">
                <h2 class="light">Beskrivning av skadan</h2>
                <asp:Literal id="damagedescription" runat="server" />
            </div>
            <div class="col col_430" >
                <h2 class="light">Övriga behov</h2>
                <ol class="needs">
                    <asp:Literal ID="otherneeds" runat="server"/>
                </ol>
            </div>
            <div class="col col_430 last" id="entrepreneur" runat="server">
                <h2 class="light">Kontaktuppgifter annan entrepreneur</h2>
                Lindstrumps Elektriska<br />
                Styraregatan 28</br />
                709 23 Falun<br /><br />
                Lindstrumps Elektriska<br />
                Styraregatan 28</br />
                709 23 Falun<br /><br />
            </div>

        </div>

        <div style="page-break-before: always">&nbsp;</div>

        <div class="a4_paper ">
            <div class="header height60">
                <div class="logo">
                    <img src="../Images/forsak2.png" />
                </div>
                <div class="inspection_number">03-14917-12 NUS  <span style="float: right">sid 2/4</span></div>
                <div style="clear: both"></div>
            </div>
            <div class="header_text">Insatsrapport - Jour</div>
            <table class="jourtable">
                <thead>
                    <tr>
                        <th style="width: 126px" class="dark">Klockslag</th>
                        <th style="width: 6px">&nbsp;</th>
                        <th style="width: 206px" class="dark">Händelse</th>
                        <th style="width: 6px">&nbsp;</th>
                        <th style="width: 466px" class="dark">Kommentar</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="logrepeater" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#((DateTime)DataBinder.Eval(Container.DataItem, "timestamp")).ToString("HH:mm")%></td>
                                <td></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "activity")%></td>
                                <td></td>
                                <td><%#DataBinder.Eval(Container.DataItem, "comment")%></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>                                        
                </tbody>
            </table>


            <div class="footer">
                <div class="col col_205">
                    Ocab i Dalarna<br />
                    Rissgårdsvägen 3<br />
                    791 77 Falun

                </div>
                <div class="col col_205">
                    Växel: 023-79 24 40<br />
                    Direkt: 023-79 24 41<br />
                    Telefax: 023-635 40

                </div>
                <div class="col col_205">
                    Lars Hagbohm<br />
                    Mobil: 070-521 34 40<br />
                    lars.hagbohm@ocab.se

                </div>
                
            </div>


        </div>
        <div id="room_pages" runat="server">
        <div style="page-break-before: always">&nbsp;</div>

        <div class="a4_paper">
            <div class="header height60">
                <div class="logo">
                    <img src="../Images/forsak2.png" />
                </div>
                <div class="inspection_number">03-14917-12 NUS  <span style="float: right">sid 2/4</span></div>
                <div style="clear: both"></div>
            </div>            
            <asp:Repeater ID="roomrepeater" runat="server" OnItemDataBound="roomrepeater_ItemDataBound">
                <HeaderTemplate>
                    <div class="header_text">Insatsrapport - Rum</div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col col_430">
                        <div class="col col_205">
                            <h2 class="dark">Rum</h2>
                            <asp:HiddenField ID="roomidHidden" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "roomid")%>' />
                            <%#DataBinder.Eval(Container.DataItem, "title")%>
                        </div>
                        <div class="col col_205 last">
                            <h2 class="dark">Upptäckta problem</h2>
                            <%#(bool)DataBinder.Eval(Container.DataItem, "problem_water") ? "Fritt vatten<br/>" : "" %>
                            <%#(bool)DataBinder.Eval(Container.DataItem, "problem_humidity") ? "Extrem luftfuktighet<br/>" : "" %>
                            <%#(bool)DataBinder.Eval(Container.DataItem, "problem_odor") ? "Luktproblem<br/>" : "" %>
                            <%#(bool)DataBinder.Eval(Container.DataItem, "problem_contamination") ? "Avloppsvatten/smitta<br/>" : "" %>
                        </div>

                        <div class="col col_430 last">
                            <h2 class="light">Rumsbeskrivning</h2>
                            <%#DataBinder.Eval(Container.DataItem, "description")%>
                        </div>
                    </div>
                    <div class="col col_430 last">
                        <asp:Repeater ID="roomimagerepeater" runat="server" OnItemDataBound="roomrepeater_ItemDataBound">
                            <ItemTemplate>
                                <div class="col col_205 <%#(Container.ItemIndex+1) % 2 == 0 ? "last" : "" %>">
                                    <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        
                        <%--<div class="col col_205 last">
                            <img src="../Images/bygg1.jpg" />
                        </div>
                        
                        <div class="col col_205">
                            <img src="../Images/bygg1.jpg" />
                        </div>
                        <div class="col col_205 last">
                            <img src="../Images/bygg1.jpg" />

                        </div>--%>
                    </div>
                    <div style="clear:both; height:100px;"></div>

                    <%#(Container.ItemIndex+1) % 2 == 0 ? "<div style=\"page-break-before: always\">&nbsp;</div>" : "" %>

                </ItemTemplate>
            </asp:Repeater>
            </div>
            </div>
    </form>
</body>
</html>