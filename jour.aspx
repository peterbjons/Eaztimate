﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="jour.aspx.cs" Inherits="jour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="Documents/jour.css?asdf=1" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .a4_paper {
            height: 1278px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
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
                <h2 class="dark rubrik">Försäkringsnummer</h2>
                <asp:Literal id="insuranceno" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark rubrik">Typ av försäkring</h2>
                <asp:Literal id="insurancetype" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark rubrik">Händelse</h2>
                <asp:Literal id="damagetype" runat="server" />
            </div>
            <div class="col col_205 last">
                <h2 class="dark rubrik">Insatsdatum</h2>
                <asp:Literal id="jourdate" runat="server" />
            </div>
            <div style="clear: both"></div>
            <div class="col col_205">
                <h2 class="dark rubrik">Försäkringstagare</h2>
                <asp:Literal id="contactname" runat="server" /><br />
                <asp:Literal id="contactpn" runat="server" /><br />
                <asp:Literal id="contactaddress" runat="server" /><br />
                <asp:Literal id="contactaddress2" runat="server" />
                <asp:Literal id="contactzipcode" runat="server" /> <asp:Literal id="contactcity" runat="server" /><br />
                <asp:Literal id="contactphone1" runat="server" />
                <asp:Literal id="contactphone2" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark rubrik">Ansvarig Ocab</h2>                
                <asp:Literal id="syncemail" runat="server" />
            </div>
            <div class="col col_205">
                <h2 class="dark">Åtgärd</h2>                
                <asp:Literal id="action" runat="server" />
            </div>
            <div style="clear: both"></div>
            <asp:Repeater ID="jourimagerepeater" runat="server">
                <ItemTemplate>                    
                    <div class="col col_205 <%#(Container.ItemIndex+1) % 4 == 0 ? "last" : "" %>">
                        <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" />
                    </div>                        
                </ItemTemplate>
            </asp:Repeater>
            <div style="clear:both; height:100px;"></div>
            <div class="col col_430">
                <h2 class="light rubrik">Beskrivning av skadan</h2>
                <asp:Literal id="damagedescription" runat="server" />
            </div>
            
            <div class="col col_430 last" >
                <h2 class="light rubrik">Övriga behov</h2>
                <ol class="needs">
                    <asp:Literal ID="otherneeds" runat="server"/>                 
                </ol>
            </div>
            <div class="col col_430" id="actiondescdiv" runat="server">
                <h2 class="light rubrik">Beskrivning av åtgärd</h2>
                <asp:Literal id="actiondesc" runat="server" />
            </div>
            <div class="col col_430 last" id="entrepreneurdiv" runat="server">
                <h2 class="light rubrik">Kontaktad entreprenör</h2>
                <asp:Literal id="entrepeneur" runat="server" />
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
                            <h2 class="dark rubrik">Rum</h2>
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
                            <h2 class="light rubrik">Rumsbeskrivning</h2>
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
                    </div>
                    <div style="clear:both; height:100px;"></div>

                    <%#(Container.ItemIndex+1) % 2 == 0 ? "<div style=\"page-break-before: always\">&nbsp;</div>" : "" %>

                </ItemTemplate>
            </asp:Repeater>
            </div>
            </div>
        <asp:Button ID="printbutton" runat="server" Text="Print" OnClick="printbutton_Click" />
    
</asp:Content>

