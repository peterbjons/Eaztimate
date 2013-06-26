<%@ Page Title="Manage company" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="List_company.aspx.cs" Inherits="admin_List_company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMainContent" runat="Server">
    <h1><%: Title %></h1>
    <%--<h2 style="float: left;">Choose company to edit</h2>
    <h2 style="float: right;"><a href="company.aspx" class="button" style="float:none">New</a></h2>--%>
    <div class="whitebox">
    <h2>Choose company to edit</h2>
    <div><a href="company.aspx" class="button" style="float:left">New</a>
        <div style="clear:both"></div>
    </div>
    <asp:ListView ID="companylist" runat="server" DataSourceID="SqlDataSource1">
        <LayoutTemplate>
            <table class="companycreate jourtable">
                <thead>
                    <tr>
                        <th class="dark">Company</th>
                        <th class="dark"></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                    <tr>
                        <td colspan="2" style="text-align: center;">
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
                </tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tr>
                <td><%# Eval("title") %></td>
                <td><a class="button" href="company.aspx?id=<%# Eval("customerid") %>">Edit</a></td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"  SelectCommand="SELECT [customerid], [title] FROM [customer] WHERE [datedeleted] IS NULL ORDER BY [customerid]">
    </asp:SqlDataSource></div>
</asp:Content>