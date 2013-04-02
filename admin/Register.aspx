<%@ Page Title="Create user" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="AdminMainContent">
    <div class="forms">
        <hgroup class="title">
            <h1><%: Title %></h1>
            <h2>Use the form below to create a new user</h2>
        </hgroup>

        <asp:CreateUserWizard runat="server" ID="RegisterUser" ViewStateMode="Disabled" OnCreatedUser="RegisterUser_CreatedUser">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
                <asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
            </LayoutTemplate>
            <WizardSteps>
                <asp:CreateUserWizardStep runat="server" ID="RegisterUserWizardStep">
                    <ContentTemplate>


                        <p class="validation-summary-errors">
                            <asp:Literal runat="server" ID="ErrorMessage" />
                        </p>


                        <div style="float: left; width: 50%;">
                            <%--<asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>--%>
                            <asp:TextBox runat="server" ID="UserName" placeholder="User name" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="field-validation-error" ErrorMessage="The user name field is required." Display="Dynamic" />

                            <%--<asp:Label runat="server" AssociatedControlID="Email">Email address</asp:Label>--%>
                            <asp:TextBox runat="server" ID="Email" placeholder="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="field-validation-error" ErrorMessage="The email address field is required." Display="Dynamic" />
                            <p class="message-info">
                                Passwords are required to be a minimum of <%: Membership.MinRequiredPasswordLength %> characters in length.
                            </p>
                            <%--<asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>--%>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" placeholder="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                CssClass="field-validation-error" ErrorMessage="The password field is required." Display="Dynamic" />

                            <%--<asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>--%>
                            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" placeholder="Confirm password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />

                            <asp:Button runat="server" CommandName="MoveNext" Text="Create user" />
                        </div>

                    </ContentTemplate>
                    <CustomNavigationTemplate />
                </asp:CreateUserWizardStep>
            </WizardSteps>
        </asp:CreateUserWizard>
        <div style="float: left;">
            <asp:ListBox ID="rolesBox" SelectionMode="Multiple" runat="server" DataTextField="rolename" />
        </div>
    </div>
</asp:Content>
