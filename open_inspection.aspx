<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="open_inspection.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        var speed = 1;
        $(document).ready(function () {
            $(".inspection_row_1").click(function () {
                var hide = ($(this).closest('li').find('.inspection_row_2').css('display') != 'none');
                $(".inspection_row_2").hide(200);
                if (!hide) {
                    $(this).closest('li').find('.inspection_row_2').show(200);
                } else {

                }
            });
        });
    </script>
</asp:Content>



<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h1>Open inspection</h1>

    <div id="inspection_list">
        <h2>Inspections</h2>
        <asp:ListView ID="companylist" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="companylist_ItemCommand" OnDataBound="companylist_DataBound">
            <LayoutTemplate>
                <ul>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="companylist" PageSize="25" class="NavegationBar">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" FirstPageImageUrl="~/Images/pager_first.png" ShowFirstPageButton="true" PreviousPageImageUrl="~/Images/pager_prev.png" ShowLastPageButton="false" ShowNextPageButton="false" />
                            <asp:NumericPagerField ButtonCount="10" />
                            <asp:NextPreviousPagerField ButtonType="Image" ShowLastPageButton="true" ShowNextPageButton="true"
                                ShowPreviousPageButton="false" LastPageImageUrl="~/Images/pager_last.png" NextPageImageUrl="~/Images/pager_next.png" />
                        </Fields>
                    </asp:DataPager>
                </ul>
            </LayoutTemplate>
            <ItemTemplate>
                <li>
                    <div class="inspection_item <%#setColor((int)DataBinder.Eval(Container.DataItem, "status"))%>">
                        <div class="inspection_row_1">
                            <div class="inspection_row_col1"><%#DataBinder.Eval(Container.DataItem, "inspectionno")%></div>
                            <div class="inspection_row_col2"><%#DataBinder.Eval(Container.DataItem, "description")%></div>                           
                            <div style="clear: both"></div>
                        </div>
                        <div class="inspection_row_2" style="display: none">
                            <div class="inspection_col3">
                                <div class="inspection_item_objects">
                                    <h3><%#DataBinder.Eval(Container.DataItem, "objects")%></h3>
                                    <h4>objects</h4>
                                </div>
                            </div>
                            <div class="inspection_col4">
                                <p>
                                    <%#DataBinder.Eval(Container.DataItem, "address1")%><br />
                                    <%#DataBinder.Eval(Container.DataItem, "zipcode")%> <%#DataBinder.Eval(Container.DataItem, "city")%><br />
                                </p>
                                <br />
                                <p><%#DataBinder.Eval(Container.DataItem, "insurancecompany")%></p>

                            </div>
                            <div style="clear: both"></div>
                            <div class="inspection_item_bottom">
                                <small>Last change: <%#((DateTime)DataBinder.Eval(Container.DataItem, "dateupdated")).ToString("yyyy-MM-dd")%><br />
                                </small>
                                <asp:LinkButton ID="LinkButton1" class="button" CommandArgument='<%# Eval("inventoryid") %>' CommandName="Open" runat="server">Open &raquo;</asp:LinkButton>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                </li>
            </ItemTemplate>
        </asp:ListView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"></asp:SqlDataSource>  
    <div id="inspection_sort">
        <h2>Sort</h2>
        <a href="?so=0">
            <div class="inspection_item <%=(sortorder == 0 ? "blue" : "white") %>">Date</div>
        </a>
        <a href="?so=1">
            <div class="inspection_item <%=(sortorder == 1 ? "blue" : "white") %>">Status</div>
        </a>
        <a href="?so=2">
            <div class="inspection_item <%=(sortorder == 2 ? "blue" : "white") %>">Inspection number</div>
        </a>
    </div>
    <div id="inspection_help">
        <h2>Description</h2>
        <div class="inspection_item green">Completed</div>
        <div class="inspection_item orange">In progress</div>
        <div class="inspection_item blue">Not started</div>
    </div>
    <div style="clear: both"></div>
</asp:Content>

