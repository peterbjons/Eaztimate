<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="detail_klotter.aspx.cs" Inherits="klotter_detail_klotter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
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
        <h2>Arbetsplats</h2>
        <div style="width: 50%; float: left;">
            <asp:TextBox runat="server" ID="lname" placeholder="Last Name" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Last Name</strong><br />
                This users last name.
            </span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lname"
                CssClass="field-validation-error" ErrorMessage="The last name field is required." Display="Dynamic" />

            <asp:TextBox runat="server" ID="tel1" placeholder="Phone no 1" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.png" />
                <strong>Phone no 1</strong><br />
                The first phone no.
            </span>
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

