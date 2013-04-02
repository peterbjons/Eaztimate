<%@ Page Title="Create Company" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="admin_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMainContent" runat="Server">
    <div class="forms">
        <h1><%: Title %></h1>
        <h2>Use the form below to create a new company</h2>
        <div style="float: left; width: 50%">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CompanyNameText" CssClass="field-validation-error" ErrorMessage="The company name field is required." Display="Dynamic"/>
            <asp:TextBox runat="server" ID="CompanyNameText" placeholder="Company name" />            
            <asp:TextBox runat="server" ID="CompanyAdress1Text" placeholder="Adress 1" />
            <asp:TextBox runat="server" ID="CompanyAdress2Text" placeholder="Adress 2" />
            <asp:TextBox runat="server" ID="CompanyZipText" placeholder="Zip code" />
            <asp:TextBox runat="server" ID="CompanyCityText" placeholder="City" />
        </div>
        <div style="float: left; width: 50%">
            <asp:TextBox runat="server" ID="CompanyContactPersonText" placeholder="Contact person" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CompanyEmailText" CssClass="field-validation-error" ErrorMessage="The email field is required." Display="Dynamic"/>
            <asp:TextBox runat="server" ID="CompanyEmailText" placeholder="Email" />
            <asp:TextBox runat="server" ID="CompanyPhoneText" placeholder="Phone" />            
            <asp:Button ID="CompanyCreate" runat="server" Text="Create company" OnClick="CompanyCreate_Click"/>
        </div>
        <div style="clear: both; height: 20px;"></div>

        <asp:Panel id="usersheader" runat="server" visible="false">

        <h2>Add / Remove roles</h2>

        <div style="float: left; width: 50%">
            <asp:ListBox ID="rolesBox" SelectionMode="Multiple" runat="server" />
            <asp:Button ID="addroleButton" runat="server" Text="Add role" OnClick="addroleButton_Click"/>
        </div>
        

        <div style="float: right; width: 50%">
            <asp:ListBox ID="rolesaddedBox" SelectionMode="Multiple" runat="server" />
            <asp:Button ID="removeroleButton" runat="server" Text="Remove role" OnClick="removeroleButton_Click"/>
        </div>

        <div style="clear: both"></div>
        
            <h2 style="margin-top: 20px; float: left;">List of people in this company</h2>
            <h2 style="margin-top: 20px; float: right;"><a href="Register.aspx?id=<%=id.ToString() %>">New</a></h2>
            <table class="companycreate jourtable">
                    <thead>
                    <tr>
                        <th class="dark">Name</th>
                        <th class="dark">Email</th>
                        <th class="dark">Bulle</th>
                        <th class="dark">Kaka</th>
                        <th class="dark"></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:ListView ID="companylist" runat="server">
                    <LayoutTemplate>            
                                <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                                <tr>
                                    <td colspan="5" style="text-align: center;">
                                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="companylist" PageSize="10" class="NavegationBar">
                                           <Fields>
                                               <asp:NextPreviousPagerField ButtonType="Image" FirstPageImageUrl="~/Images/pager_first.png" ShowFirstPageButton="true" PreviousPageImageUrl="~/Images/pager_prev.png" ShowLastPageButton="false" ShowNextPageButton="false" />
                                                <asp:NumericPagerField ButtonCount="10" />
                                                <asp:NextPreviousPagerField ButtonType="Image" ShowLastPageButton="true" ShowNextPageButton="true"
                                                    ShowPreviousPageButton="false" LastPageImageUrl="~/Images/pager_last.png" NextPageImageUrl="~/Images/pager_next.png" />
                                           </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>                                    
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr class="user_level1">
                            <td><%# Eval("UserName") %></td>
                            <td><%# Eval("Email") %></td>
                            <td></td>
                            <td></td>
                            <td><a href="edituser.aspx?id=<%# Eval("ProviderUserKey") %>">Edit</a></td>
                        </tr>           
                    </ItemTemplate>
                </asp:ListView>
                </tbody>
            </table>
        </asp:Panel>
    </div>
</asp:Content>

