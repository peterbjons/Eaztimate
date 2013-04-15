<%@ Page Title="Edit user" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="edit_user.aspx.cs" Inherits="admin_edit_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMainContent" Runat="Server">
    <h1><%: Title %></h1>
    <h2 id="titleh2" runat="server"></h2>
    <div class="forms">  
        <div style="width: 50%; float: left;">
            <asp:TextBox runat="server" ID="Email" placeholder="Email" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.gif" />
                <strong>Email</strong><br />
                The email address to this user.
            </span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Email"
                CssClass="field-validation-error" ErrorMessage="The email address field is required." Display="Dynamic" />
            <asp:TextBox runat="server" ID="fname" placeholder="First Name" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.gif" />
                <strong>First Name</strong><br />
                This users first name.
            </span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fname"
                CssClass="field-validation-error" ErrorMessage="The first name field is required." Display="Dynamic" />
            <asp:TextBox runat="server" ID="lname" placeholder="Last Name" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.gif" />
                <strong>Last Name</strong><br />
                This users last name.
            </span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lname"
                CssClass="field-validation-error" ErrorMessage="The last name field is required." Display="Dynamic" />

            <asp:TextBox runat="server" ID="tel1" placeholder="Phone no 1" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.gif" />
                <strong>Phone no 1</strong><br />
                The first phone no.
            </span>
            <asp:TextBox runat="server" ID="tel2" placeholder="Phone no 2" CssClass="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.gif" />
                <strong>Phone no 2</strong><br />
                The second phone number (if available).
            </span>
            <asp:HiddenField ID="userdataexists" Value="false" runat="server"/>
            <asp:Button ID="UserEdit" runat="server" Text="Save changes" OnClick="UserEdit_Click"/>
        </div>
        <div style="width: 50%; float: right;">
            <asp:ListBox ID="rolesBox" SelectionMode="Multiple" DataTextField="rolename" DataValueField="rolename" runat="server" class="tooltip"/>
            <span>
                <img class="callout" src="/Images/callout.gif" />
                <strong>Roles</strong><br />
                Select all roles this user belongs to.
            </span>
        </div>
    </div>
</asp:Content>

