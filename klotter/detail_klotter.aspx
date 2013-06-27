<%@ Page Title="Klotterärende" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="detail_klotter.aspx.cs" Inherits="klotter_detail_klotter" %>

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
        <h2>Grunddata</h2>
        <div class="col2">
            <asp:HiddenField ID="klotterno" runat="server" />
            <asp:TextBox runat="server" ID="aonr" placeholder="Arbetsordernummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Arbetsordernummer</strong><br />
                Ärendets arbetsordernummer
            </span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="aonr"
                CssClass="field-validation-error" ErrorMessage="The email address field is required." Display="Dynamic" />
        </div>
        <div class="col2 last">
            <asp:TextBox runat="server" ID="title" placeholder="Titel" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Titel</strong><br />
                Dokumentationens titel.
            </span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="title"
                CssClass="field-validation-error" ErrorMessage="The first name field is required." Display="Dynamic" />
        </div><div style="clear: both"></div>
        <div class="col1">
            <asp:TextBox runat="server" ID="description" placeholder="Jobbeskrivning" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Titel</strong><br />
                Dokumentationens titel.
            </span>
        </div>
        <div class="col2">
            <h2>Bilder före</h2>
            <asp:Repeater ID="beforeimagerepeater" runat="server">
                <ItemTemplate>
                    <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="klotter_images <%#(Container.ItemIndex) % 2 != 0 ? "last" : "" %>" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="col2 last">
            <h2>Bilder efter</h2>
            <asp:Repeater ID="afterimagerepeater" runat="server">
                <ItemTemplate>
                    <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="klotter_images <%#(Container.ItemIndex) % 2 != 0 ? "last" : "" %>" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div style="clear: both"></div>
        <h2>Skadeplatsen</h2>
        <div class="col2">
            <asp:TextBox runat="server" ID="fastbet" placeholder="Fastighetsbeteckning" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Fastighetsbeteckning</strong><br />
                Fastighetsbeteckning
            </span>
            <asp:TextBox runat="server" ID="zipcode" placeholder="Postnummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Postnummer</strong><br />
                Fastighetens postnummer.
            </span>
        </div>
        <div class="col2 last">
            <asp:TextBox runat="server" ID="address" placeholder="Adress" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Adress</strong><br />
                Fastighetens adress.
            </span>
            <asp:TextBox runat="server" ID="city" placeholder="Ort" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Ort</strong><br />
                Fastighetens ort.
            </span>
        </div><div style="clear: both"></div>
        <h2>Kunduppgifter</h2>
        <div class="col2">
            <asp:TextBox runat="server" ID="clientname" placeholder="Kundnamn" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Kundnamn</strong><br />
                Namn på kunden
            </span>
            <asp:TextBox runat="server" ID="clientaddress" placeholder="Adress 1" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Adress 1</strong><br />
                Kundens fakturaadress.
            </span>
            <asp:TextBox runat="server" ID="clientzipcode" placeholder="Postnummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Postnummer</strong><br />
                Kundens postnummer.
            </span>
        </div>
        <div class="col2 last">
            <asp:TextBox runat="server" ID="clientno" placeholder="Kundnummer" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Kundnummer</strong><br />
                kundnummer.
            </span>
            <asp:TextBox runat="server" ID="clientaddress2" placeholder="Adress 2" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Adress</strong><br />
                Kundens fakturaadress.
            </span>
            <asp:TextBox runat="server" ID="clientcity" placeholder="Ort" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Kundort</strong><br />
                Kundens ort.
            </span>
        </div><div style="clear: both"></div>
        <h2>Polisrapport</h2>
        <div class="col2">

            <asp:DropDownList ID="policereport" runat="server" CssClass="dropdown">
                <asp:ListItem Text="Ja" Value="1"></asp:ListItem>
                <asp:ListItem Text="Nej" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <%--<asp:RadioButtonList ID="policereport" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist">
                <asp:ListItem Value="1"> Ja </asp:ListItem>
                <asp:ListItem Value="0"> Nej </asp:ListItem>
            </asp:RadioButtonList>--%>
        </div>
        <div class="col2 last">
            <asp:TextBox runat="server" ID="policetext" placeholder="Fritext" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Fritext</strong><br />
                Fritext till polisanmälan
            </span>
        </div>
        <div style="clear: both"></div>
        <div class="col2">
            <h2>Tidsåtgång</h2>
            <asp:DropDownList ID="hour_ddl" runat="server" Style="width: 100px" CssClass="dropdown2">
            </asp:DropDownList><div style="float:left; width:10px; height: 10px;"></div>
            <asp:DropDownList ID="minutes_ddl" runat="server" Style="width: 100px;" CssClass="dropdown3">
            </asp:DropDownList><div style="clear:both"></div>
        </div>
        <div class="col2 last">
            <h2>Taggar</h2>
            <asp:TextBox runat="server" ID="tags" placeholder="Taggar" CssClass="tooltip" />
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Taggar</strong><br />
                Taggar, separera taggar med komma (tag1, tag2, tag3)
            </span>
        </div><div style="clear: both"></div>
        <div class="col2">
            <asp:Button ID="detailEditButton" runat="server" Text="Spara förändringar" OnClick="UserEdit_Click" />
        </div>
        <div class="col2 last">
            <asp:Button ID="reportEditButton" runat="server" Text="Spara och skapa rapport(er)" OnClick="ReportCreate_Click" />
        </div>
        <div style="clear: both"></div>
    </div>
    <script> $('.dropdown').ddslick({
     width:463,
     onSelected: function (selectedData) {

         //callback function: do something with selectedData;
     }
 }


 );
        $('.dropdown2').ddslick({
            height: 300,
            width: 227,
            onSelected: function (selectedData) {

                //callback function: do something with selectedData;
            }
        }


);
        $('.dropdown3').ddslick({
            height: 300,
            width: 227,
            onSelected: function (selectedData) {

                //callback function: do something with selectedData;
            }
        }


);
    </script>
</asp:Content>

