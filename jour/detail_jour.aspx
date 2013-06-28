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
    <script src="../Scripts/jquery.ddslick.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1><%: Title %></h1>
    <div class="forms whitebox">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
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


            <%--UTRYMME FÖR BILDER--%>
        </div>
        <div class="col2">
            <h2>Beskrivning</h2>
            <asp:TextBox runat="server" ID="description" placeholder="Beskrivning" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Beskrivning</strong><br />
                Beskrivning.
            </span>

        </div>
        <div class="col2 last">
            <h2>Övriga behov</h2>
            <asp:CheckBoxList runat="server" ID="otherneeds"></asp:CheckBoxList>

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
        <div style="clear: both"></div>
        <script>
            $('.dropdown1').ddslick({

                width: 217,
                onSelected: function (selectedData) {

                    //callback function: do something with selectedData;
                }
            }


 );
            $('.dropdown2').ddslick({

                width: 217,
                onSelected: function (selectedData) {

                    //callback function: do something with selectedData;
                }
            }


    );
            $('.dropdown3').ddslick({

                width: 217,
                onSelected: function (selectedData) {

                    //callback function: do something with selectedData;
                }
            }


    );
            $('.dropdown4').ddslick({

                width: 247,
                onSelected: function (selectedData) {

                    //callback function: do something with selectedData;
                }
            }


    );
        </script>
    </div>
    <h1>Rum</h1>
    <div class="forms whitebox">

        <div class="col1">
            <ul class="room_row_list">
                <li>
                    <div class="room_row_1">
                        Kontor, primär skadeplats
                    </div>
                    <div class="room_row_2" style="display: none">
                        <div class="col2">
                            <h2>Skador i utrymmet</h2>
                            <asp:CheckBoxList runat="server" ID="areadamage"></asp:CheckBoxList>
                        </div>
                        <div class="col2 last">
                            <h2>Åtgärder i utrymmet</h2><asp:CheckBoxList runat="server" ID="CheckBoxList1"></asp:CheckBoxList>
                            <asp:TextBox runat="server" ID="TextBox5" placeholder="Avfuktarnummer" CssClass="tooltip" />
                            <span>
                                <img class="callout" src="/Images/callout.png" />
                                <strong>Avfuktarnummer</strong><br />
                                Nummer på avfuktare
                            </span>
                        </div>
                        <div style="clear: both"></div>
                        <div class="col1">
                            <h2>Bilder</h2>
                            <%--BILDER HÄR--%>
                        </div>
                        <div class="col1">
                            <h2>Övriga noteringar</h2>
                            <asp:TextBox runat="server" ID="roomnotes" placeholder="Övriga noteringar" CssClass="tooltip" />
                            <span>
                                <img class="callout" src="/Images/callout.png" />
                                <strong>Kundnamn</strong><br />
                                Namn på kunden
                            </span>
                        </div>

                    </div>
                </li>

            </ul>

        </div>

        <div style="clear: both"></div>




    </div>




</asp:Content>

