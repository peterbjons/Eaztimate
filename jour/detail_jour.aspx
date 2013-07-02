<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="detail_jour.aspx.cs" Inherits="jour_detail_jour" %>

<%@ Register Src="~/controls/roomlist.ascx" TagPrefix="uc1" TagName="roomlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script>
        Modernizr.addTest('csschecked', function () {
            return Modernizr.testStyles("#modernizr input {margin-left:0px;} #modernizr input:checked {margin-left: 20px;}", function (elem) {
                var chx = document.createElement('input');
                chx.type = "checkbox";
                chx.checked = "checked";
                elem.appendChild(chx);
                return elem.lastChild.offsetLeft >= 20;
            });
        });
    </script>
    <script src="/Scripts/jquery.ddslick.js"></script>
    <link href="/Content/lightbox.css" rel="stylesheet">
    <script src="/Scripts/lightbox.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1><%: Title %></h1>
    <div class="forms whitebox">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="col2">
            <h2>Skadetyp</h2>
            <asp:DropDownList ID="damagetype" runat="server" CssClass="dropdown5" DataValueField="damagetype" DataTextField="damagetype">                
            </asp:DropDownList>
        </div>
        <div class="col2 last">
            <h2>Uppdragsgivarens ärendenummer</h2>
            <asp:TextBox runat="server" ID="lcno" placeholder="Uppdragsgivarens ärendenummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Uppdragsgivarens ärendenummer</strong><br />
                Uppdragsgivarens ärendenummer.
            </span>
        </div>
        <div style="clear: both;"></div>
        <h2>Försäkringstagare</h2>
        <div class="col2">
            <asp:TextBox runat="server" ID="clientname" placeholder="Namn" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Namn</strong><br />
                Namn på försäkringstagaren.
            </span>
            <asp:TextBox runat="server" ID="clientaddress" placeholder="Adress 1" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Adress 1</strong><br />
                Försäkringstagarens adress.
            </span>
            <asp:TextBox runat="server" ID="clientzipcode" placeholder="Postnummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Postnummer</strong><br />
                Försäkringstagarens postnummer.
            </span>
            <asp:TextBox runat="server" ID="clientphone1" placeholder="Telefonnummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Telefonnummer</strong><br />
                Försäkringstagarens telefonnummer.
            </span>
        </div>
        <div class="col2 last">
            <asp:TextBox runat="server" ID="clientno" placeholder="Personnummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Personnummer</strong><br />
                Försäkringstagarens personnummer.
            </span>
            <asp:TextBox runat="server" ID="clientaddress2" placeholder="Adress 2" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Adress</strong><br />
                Försäkringstagarens adress.
            </span>
            <asp:TextBox runat="server" ID="clientcity" placeholder="Ort" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Kundort</strong><br />
                Försäkringstagarens ort.
            </span>
            <asp:TextBox runat="server" ID="clientphone2" placeholder="Telefonnummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Telefonnummer</strong><br />
                Försäkringstagarens telefonnummer.
            </span>
        </div>
        <div style="clear: both"></div>


        <h2>Försäkring</h2>
        <div class="col2">
            <asp:TextBox runat="server" ID="insurancetype" placeholder="Försäkringstyp" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Försäkringstyp</strong><br />
                Typ av försäkring
            </span>

        </div>
        <div class="col2 last">
            <asp:TextBox runat="server" ID="insurancenumber" placeholder="Försäkringsnummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Försäkringsnummer</strong><br />
                Försäkringsnummer.
            </span>

        </div>        
        <div style="clear: both"></div>
        <h2>Bilder</h2>
        <div class="col1">
            <asp:Repeater ID="jourimagerepeater" runat="server">
                <ItemTemplate>
                    <div class="jour_images <%#(Container.ItemIndex+1) % 4 == 0 ? "last" : "" %>" style="float: left;">
                    <a href="<%#DataBinder.Eval(Container.DataItem, "image")%>" rel="lightbox" style="text-decoration: none; width: 225px; margin-right: 10px;">
                        <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="jour_images <%#(Container.ItemIndex+1) % 4 == 0 ? "last" : "" %>" />
                    </a>
                        </div>
                </ItemTemplate>
            </asp:Repeater>   
            <div style="clear:both"></div>         
        </div>
        
        <div class="col4 ">
            <h2>Övriga behov</h2>
            <asp:CheckBoxList runat="server" ID="otherneeds" RepeatLayout="UnorderedList" CssClass="jourcblist">
                <asp:ListItem Text="<span></span>Tillfälligt boende" Value="1"></asp:ListItem>
                <asp:ListItem Text="<span></span>Kontanter" Value="2"></asp:ListItem>
                <asp:ListItem Text="<span></span>Transport" Value="3"></asp:ListItem>
                <asp:ListItem Text="<span></span>Förmedling av kontakt" Value="4"></asp:ListItem>
            </asp:CheckBoxList>

        </div><div class="col4_3 last">
            <h2>Beskrivning</h2>
            <asp:TextBox runat="server" ID="description" placeholder="Beskrivning" CssClass="tooltip" Rows="3" TextMode="MultiLine" />
        </div>
        <div style="clear: both"></div>

        <div class="col4">
            <h2>Skalskydd</h2>
            <asp:DropDownList ID="skalskydd" runat="server" CssClass="dropdown1">
                <asp:ListItem Text="Nedsatt" Value="1"></asp:ListItem>
                <asp:ListItem Text="Ej påverkad" Value="0"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col4">
            <h2>El/värme</h2>
            <asp:DropDownList ID="el_varme" runat="server" CssClass="dropdown2">
                <asp:ListItem Text="Nedsatt" Value="1"></asp:ListItem>
                <asp:ListItem Text="Ej påverkad" Value="0"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col4">
            <h2>Klimatskydd</h2>
            <asp:DropDownList ID="klimatskydd" runat="server" CssClass="dropdown3">
                <asp:ListItem Text="Nedsatt" Value="1"></asp:ListItem>
                <asp:ListItem Text="Ej påverkad" Value="0"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col4 last">
            <h2>Funktion</h2>
            <asp:DropDownList ID="funktion" runat="server" CssClass="dropdown4">
                <asp:ListItem Text="Nedsatt i berörda utrymmen" Value="1"></asp:ListItem>
                <asp:ListItem Text="Ej påverkad" Value="0"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="clear: both; height: 20px;"></div>
        <div class="col2">
            <asp:Button ID="detailEditButton" runat="server" Text="Spara förändringar" OnClick="detailEditButton_Click" />
        </div>
        <div class="col2 last">
            <asp:Button ID="reportEditButton" runat="server" Text="Spara och skapa rapport(er)" OnClick="reportEditButton_Click" />
        </div>
        <div style="clear: both"></div>
        <script>
            $('.dropdown1').ddslick({

                width: 226,
                onSelected: function (selectedData) {

                    //callback function: do something with selectedData;
                }
            }


 );
            $('.dropdown2').ddslick({

                width: 226,
                onSelected: function (selectedData) {

                    //callback function: do something with selectedData;
                }
            }


    );
            $('.dropdown3').ddslick({

                width: 226,
                onSelected: function (selectedData) {

                    //callback function: do something with selectedData;
                }
            }


    );
            $('.dropdown4').ddslick({

                width: 227,
                onSelected: function (selectedData) {

                    //callback function: do something with selectedData;
                }
            }
    );

            $('.dropdown5').ddslick({

            width: 463,
            onSelected: function (selectedData) {

                //callback function: do something with selectedData;
            }
            }


    );
        </script>
    </div>
    <h1>Rum</h1>
    <div class="forms">

        

            <ul class="room_row_list">
            <asp:Repeater ID="roomrepeater" runat="server" OnItemDataBound="roomrepeater_ItemDataBound">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <li class="">
                    <div class="room_row_1 ">
                        <asp:HiddenField ID="roomidHidden" runat="server" Value='<%#DataBinder.Eval(Container.DataItem, "roomid")%>' />
                        <%#Eval("title")%>
                        <%#(Container.ItemIndex) == 0 ? ", primär skadeplats" : ", sekundär skadeplats" %>
                    </div>

                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>                        

                    <div class="room_row_2" style="display: none">   
                        
                        <div class="col2">
                            <h2>Skador i utrymmet</h2>
                            <asp:CheckBoxList runat="server" ID="areadamage">
                                <asp:ListItem Text="<span></span>Fritt vatten" Value="1"></asp:ListItem>
                                <asp:ListItem Text="<span></span>Extrem luftfuktighet" Value="2"></asp:ListItem>
                                <asp:ListItem Text="<span></span>Luktproblem" Value="3"></asp:ListItem>
                                <asp:ListItem Text="<span></span>Avloppsvatten/smitta" Value="4"></asp:ListItem>
                            </asp:CheckBoxList>
                        </div>

                        <div class="col2 last">
                            <h2>Åtgärder i utrymmet</h2>
                            <ul style="margin-top: 0px;">
                                <%#formatRoomAction((string)Eval("roomaction"))%>
                            </ul>
                        </div>

                        <div style="clear: both"></div>
                        <div class="col1">
                            <h2>Bilder</h2>
                            <asp:Repeater ID="roomimagerepeater" runat="server">
                                <ItemTemplate> 
                                    <div class="jour_images <%#(Container.ItemIndex+1) % 4 == 0 ? "last" : "" %>" style="float: left;">
                                    <a href="<%#Eval("image")%>" rel="lightbox" style="text-decoration: none; width: 225px; margin-right: 10px;">                                    
                                        <img src="<%#Eval("image")%>" class="klotter_images <%#(Container.ItemIndex) % 3 == 0 ? "last" : "" %>" />
                                    </a>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>                        

                        <div class="col1">
                            <h2>Övriga noteringar</h2>
                            <asp:TextBox runat="server" ID="notes" placeholder="Övriga noteringar" CssClass="tooltip" Text='<%#Eval("description")%>' />
                            <span>
                                <img class="callout" src="/Images/callout.png" />
                                <strong>Övriga noteringar</strong><br />
                                Övriga noteringar
                            </span>
                        </div>
                        <div class="col2">
                            <asp:Button runat="server" CommandName="save" CommandArgument='<%#Eval("roomid")%>' Text="Spara rum" OnClick="RoomSave_Click" OnClientClick="alert('test');" />
                        </div>
                        <div style="clear: both;"></div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>                        
                    </li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
        

        <div style="clear: both"></div>




    </div>




</asp:Content>

