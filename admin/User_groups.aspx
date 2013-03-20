<%@ Page Title="Manage user groups" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="User_groups.aspx.cs" Inherits="admin_User_groups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMainContent" Runat="Server">
    <div class="forms">
    <h1><%: Title %></h1>
        <h2>Use the form below to create or manage user groups</h2>


        <div style="float: left; width: 50%">
            <asp:TextBox runat="server" ID="UserGroupNameText" placeholder="Name" />
            
            <asp:Button ID="UserGroupCreate" runat="server" Text="Create user group" OnClick="UserGroupCreate_Click" />
        </div>
        <div style="float:left; width: 50%">
            <asp:ListBox ID="rolesBox" SelectionMode="Multiple" runat="server" />
            <asp:Button ID="UserGroupDelete" runat="server" Text="Delete user group" OnClientClick="return confirm('Are you sure?');" OnClick="UserGroupDelete_Click" />
        </div>

        </div>
</asp:Content>

