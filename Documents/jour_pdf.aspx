﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jour_pdf.aspx.cs" Inherits="Documents_jour_pdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="jour.css?asdf=1" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="a4_paper ">

            <div class="header_text">
                Jourrapport
                <asp:Literal ID="damagetype" runat="server" />
                <asp:Literal ID="jourdate" runat="server" />                
                <span class="line1">
                    <asp:Literal ID="contactaddress_header" runat="server" />,
                    <asp:Literal ID="contactcity_header" runat="server" />
                </span>
                <span class="line2">Larmcentralens ärendenummer: <asp:Literal ID="lccaseid" runat="server" />
                </span>

            </div>
            <div class="col col_205">
                <h2 class="dark">Försäkringstagare</h2>
                <asp:Literal ID="contactname" runat="server" /><br />
                <asp:Literal ID="contactpn" runat="server" /><br />
                <asp:Literal ID="contactaddress" runat="server" /><br />
                <asp:Literal ID="contactaddress2" runat="server" />
                <asp:Literal ID="contactzipcode" runat="server" />
                <asp:Literal ID="contactcity" runat="server" /><br />
                <asp:Literal ID="contactphone1" runat="server" />
                <asp:Literal ID="contactphone2" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Försäkring</h2>
                <asp:Literal ID="insurancetype" runat="server" /><br />
                <asp:Literal ID="insuranceno" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Ansvarig Ocab</h2>
                <asp:Literal ID="fname" runat="server" /> <asp:Literal ID="lname" runat="server" /><br />
                <asp:Literal ID="tel1" runat="server" /><br />
                <asp:Literal ID="tel2" runat="server" /><br />
                <asp:Literal ID="syncemail" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="dark">Övriga behov</h2>
                <ol class="needs">
                    <asp:Literal ID="otherneeds" runat="server" />
                </ol>
                
            </div>



            <div style="clear: both"></div>
            
            
            <div class="col col_655">
                <img runat="server" id="jourimage" />
                <div id="imagetext" runat="server">
                <strong>Händelse:</strong><asp:Literal ID="damagedescription" runat="server" /><br />
                <strong>Berörda utrymmen:</strong> <asp:Literal ID="roomslist" runat="server" />
            </div>
            </div>
            <asp:Repeater ID="jourimagerepeater" runat="server">
                <ItemTemplate>
                    <div class="col col_205 last">
                        <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div style="clear: both"></div>
            
            <div style="clear: both; height: 20px;"></div>
            <div id="actiondescdiv2" runat="server">
            <div class="col col_655">
                <h2 class="light">Beskrivning av skadan</h2>
                <asp:Literal ID="damagedescription_case2" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="light">Åtgärd</h2>
                <asp:Literal ID="action" runat="server" />
            </div>
                </div>
            <div class="col col_880" id="actiondescdiv" runat="server">
                <h2 class="light">Beskrivning av åtgärd</h2>
                <asp:Literal ID="actiondesc" runat="server" />
                <div  id="entrepreneurdiv" runat="server">
                <strong>Kontaktad entreprenör:</strong><asp:Literal ID="entrepeneur" runat="server" />
            </div>
            </div>

            <div id="damagelistdiv" runat="server">
                <div class="col col_205">
                    <h2 class="light">Skalskydd</h2>
                    <asp:Literal ID="skalskyddlit" runat="server" />
                </div>
                <div class="col col_205">
                    <h2 class="light">El/värme</h2>
                    <asp:Literal ID="elvarmelit" runat="server" />
                </div>

                <div class="col col_205">
                    <h2 class="light">Klimatskärm</h2>
                    <asp:Literal ID="klimatskarmlit" runat="server" />
                </div>

                <div class="col col_205 last">
                    <h2 class="light">Funktion</h2>
                    <asp:Literal ID="funktionlit" runat="server" />
                </div>
            </div>
            
        </div>

        <div style="page-break-before: always">&nbsp;</div>

        <div class="a4_paper ">

            <div class="header_text">
                Insatsrapport - Jour
                <asp:Literal ID="logdate" runat="server" />
            </div>
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





        </div>
        <div id="room_pages" runat="server">


            <asp:Repeater ID="roomrepeater" runat="server" OnItemDataBound="roomrepeater_ItemDataBound">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <div style="page-break-before: always">&nbsp;</div>
                    <div class="a4_paper">
                        <div class="header_text">                            
                            <asp:HiddenField ID="roomidHidden" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "roomid")%>' />
                            <%#DataBinder.Eval(Container.DataItem, "title")%>
                            <%#(Container.ItemIndex) == 0 ? ", primär skadeplats" : ", sekundär skadeplats" %>
                        </div>
                        <div class="col col_880">

                            <div class="col col_430">
                                <h2 class="dark">Skador i utrymmet</h2>
                                <%#(bool)DataBinder.Eval(Container.DataItem, "problem_water") ? "Fritt vatten<br/>" : "" %>
                                <%#(bool)DataBinder.Eval(Container.DataItem, "problem_humidity") ? "Extrem luftfuktighet<br/>" : "" %>
                                <%#(bool)DataBinder.Eval(Container.DataItem, "problem_odor") ? "Luktproblem<br/>" : "" %>
                                <%#(bool)DataBinder.Eval(Container.DataItem, "problem_contamination") ? "Avloppsvatten/smitta<br/>" : "" %>
                            </div>

                            <div class="col col_430 last">
                                <h2 class="dark">Åtgärder i utrymmet</h2>
                                <ul style="margin-top: 0px;">
                                    <%#formatRoomAction((string)DataBinder.Eval(Container.DataItem, "roomaction"))%>
                                </ul>
                            </div>
                        </div>                       

                        <asp:Repeater ID="roomimagerepeater" runat="server">
                            <ItemTemplate>
                                
                                <div class="col col_430" runat="server" visible="<%# (Container.ItemIndex == 0) %>">
                                    <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" />
                                </div>
                                
                                <%#(Container.ItemIndex) == 1 ? "<div class=\"col col_430 last\">" : "" %>
                                <asp:Panel runat="server" Visible="<%# (Container.ItemIndex != 0) %>">
                                    <div class="col col_205 <%#(Container.ItemIndex) % 2 == 0 ? "last" : "" %>" style="margin-bottom: 13px">
                                        <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" />
                                    </div>
                                </asp:Panel>                                
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Literal ID="possibleenddiv" runat="server" />
                        <div style="clear: both; height: 20px;"></div>
                        <div class="col col_880">
                            <h2 class="light">Övriga noteringar</h2>
                            <%#DataBinder.Eval(Container.DataItem, "description")%>
                        </div>
                    </div>                        
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
