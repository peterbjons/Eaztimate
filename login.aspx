<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Account_Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ContentPlaceHolderID="HeadContent">
    <script src="Scripts/html5placeholder.jquery.js"></script>
        <script>
            $(function () {
                $(':input[placeholder]').placeholder();
            });
    </script>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %></h1>
    </hgroup>
    <div class="whitebox">
    <section id="loginForm">
        <h2>Use a local account to log in</h2>
        <asp:Login runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <div class="forms">
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                
                  
                    
                            <%--<asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>--%>
                            <asp:TextBox runat="server" ID="UserName" placeholder="User name"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="The user name field is required." Display="Dynamic"/>
                       
                            <%--<asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>--%>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Password"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="The password field is required." Display="Dynamic"/>
                        
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe" CssClass="checkbox">Remember me?</asp:Label>
                       
                    <asp:Button runat="server" CommandName="Login" Text="Log in" />
               </div>
            </LayoutTemplate>
        </asp:Login>
        <p>
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
            if you don't have an account.
        </p>
    </section>
</div>

</asp:Content>