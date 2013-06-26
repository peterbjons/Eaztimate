<%@ Page Title="Ändra klotterärende" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="detail_klotter.aspx.cs" Inherits="klotter_detail_klotter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1><%: Title %></h1>
    <div class="forms whitebox">
        <h2>Grunddata</h2>
        <div class="col2">
            <asp:TextBox runat="server" ID="aonr" placeholder="Arbetsordernummer" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Arbetsordernummer</strong><br />
                Ärendets arbetsordernummer
            </span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="aonr"
                CssClass="field-validation-error" ErrorMessage="The email address field is required." Display="Dynamic" />
        </div>
        <div class="col2">
            <asp:TextBox runat="server" ID="title" placeholder="Titel" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Titel</strong><br />
                Dokumentationens titel.
            </span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="title"
                CssClass="field-validation-error" ErrorMessage="The first name field is required." Display="Dynamic" />
        </div>
        <div class="col1">
            <asp:TextBox runat="server" ID="description" placeholder="Jobbeskrivning" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Titel</strong><br />
                Dokumentationens titel.
            </span>
        </div>
        <h2>Skadeplatsen</h2>
        <div class="col2">
            <asp:TextBox runat="server" ID="fastbet" placeholder="Fastighetsbeteckning" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Fastighetsbeteckning</strong><br />
                Fastighetsbeteckning
            </span>   
            <asp:TextBox runat="server" ID="zipcode" placeholder="Postnummer" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Postnummer</strong><br />
                Fastighetens postnummer.
            </span>         
        </div>
        <div class="col2">
            <asp:TextBox runat="server" ID="address" placeholder="Adress" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Adress</strong><br />
                Fastighetens adress.
            </span>
            <asp:TextBox runat="server" ID="city" placeholder="Ort" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Ort</strong><br />
                Fastighetens ort.
            </span>
        </div>
        <h2>Kunduppgifter</h2>
        <div class="col2">
            <asp:TextBox runat="server" ID="clientname" placeholder="Kundnamn" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Kundnamn</strong><br />
                Namn på kunden
            </span>   
            <asp:TextBox runat="server" ID="clientaddress" placeholder="Adress 1" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Adress 1</strong><br />
                Kundens fakturaadress.
            </span>
            <asp:TextBox runat="server" ID="clientzipcode" placeholder="Postnummer" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Postnummer</strong><br />
                Kundens postnummer.
            </span>            
        </div>
        <div class="col2">
            <asp:TextBox runat="server" ID="clientno" placeholder="Kundnummer" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Kundnummer</strong><br />
                kundnummer.
            </span>               
            <asp:TextBox runat="server" ID="clientaddress2" placeholder="Adress 2" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Adress</strong><br />
                Kundens fakturaadress.
            </span>
            <asp:TextBox runat="server" ID="clientcity" placeholder="Ort" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Kundort</strong><br />
                Kundens ort.
            </span>
        </div>
        <h2>Polisrapport</h2>
        <div class="col2">
            <asp:DropDownList ID="policereport" runat="server">
                <asp:ListItem Text="Ja" Value="1"></asp:ListItem>
                <asp:ListItem Text="Nej" Value="0"></asp:ListItem>
            </asp:DropDownList>
            <%--<asp:RadioButtonList ID="policereport" runat="server" RepeatDirection="Horizontal" CssClass="radiobuttonlist">
                <asp:ListItem Value="1"> Ja </asp:ListItem>
                <asp:ListItem Value="0"> Nej </asp:ListItem>
            </asp:RadioButtonList>--%>
        </div>
        <div class="col2">
            <asp:TextBox runat="server" ID="policetext" placeholder="Fritext" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Fritext</strong><br />
                Fritext till polisanmälan
            </span>
        </div>
        <div class="col2 room_images">
            <h2>Bilder före</h2>
            <asp:Repeater ID="beforeimagerepeater" runat="server">
                <ItemTemplate>                    
                    <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="two_two <%#(Container.ItemIndex) % 2 != 0 ? "last" : "" %>" />
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <div class="col2 room_images">
            <h2>Bilder efter</h2>
            <asp:Repeater ID="afterimagerepeater" runat="server">
                <ItemTemplate>                    
                    <img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="two_two <%#(Container.ItemIndex) % 2 != 0 ? "last" : "" %>" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div style="clear: both"></div>
        <div class="col2">
            <asp:Button ID="detailEditButton" runat="server" Text="Spara förändringar" OnClick="UserEdit_Click"/>
        </div>
        <div class="col2">
            <asp:Button ID="reportEditButton" runat="server" Text="Spara och skapa rapport" OnClick="UserEdit_Click"/>
        </div>
        <div style="clear: both"></div>
        </div>
        <div class="forms whitebox">
        <div class="col2">
            <h2>Övriga data</h2>
            <asp:RadioButton ID="policeyes" runat="server" Text="<span></span> Ja" />
            <asp:CheckBox ID="htcb" runat="server" Text="<span></span>Högtryckstvätt" />
            <asp:CheckBoxList ID="cat_cblist" runat="server" DataValueField="key" DataTextField="value"></asp:CheckBoxList>
        </div>
        <div class="col2">
            <h2>Taggar</h2>
            <asp:ListBox ID="tagsbox" SelectionMode="Multiple" DataTextField="tag" DataValueField="tag" runat="server" class="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Taggar</strong><br />
                Taggar.
            </span>
        </div>
        <h2>resten</h2>
        <div class="col2">
            <asp:TextBox runat="server" ID="tel2" placeholder="Phone no 2" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Phone no 2</strong><br />
                The second phone number (if available).
            </span>
            <asp:HiddenField ID="userdataexists" Value="false" runat="server"/>
            <asp:Button ID="UserEdit" runat="server" Text="Save changes" OnClick="UserEdit_Click"/>
        </div>
        <div style="width: 50%; float: right;">
            <asp:ListBox ID="rolesBox" SelectionMode="Multiple" DataTextField="rolename" DataValueField="rolename" runat="server" class="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Roles</strong><br />
                Select all roles this user belongs to.
            </span>
        </div>
        <div style="clear: both;"></div>
    </div>    
</asp:Content>

