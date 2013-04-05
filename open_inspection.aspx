﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="open_inspection.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(document).ready(function () {
            expandList($(".inspection_row_1"), $('.inspection_row_2'));
        });
    </script>
</asp:Content>



<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h1>Open inspection</h1>

    <asp:UpdatePanel ID="updatelist" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="sortorderhidden" runat="server" Value="0" />
            <div id="inspection_list">
                <h2>Inspections</h2>
                <asp:ListView ID="companylist" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="companylist_ItemCommand" OnDataBound="companylist_DataBound" OnPagePropertiesChanging="companylist_PagePropertiesChanging">
                    <LayoutTemplate>
                        <ul>
                            <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                            <div class="pager">
                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="companylist" PageSize="5" class="NavegationBar">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Image" FirstPageImageUrl="~/Images/pager_first.png" ShowFirstPageButton="true" PreviousPageImageUrl="~/Images/pager_prev.png" ShowLastPageButton="false" ShowNextPageButton="false" />
                                        <asp:NumericPagerField ButtonCount="10" NumericButtonCssClass="pagerclass" CurrentPageLabelCssClass="pagerclass_selected" NextPreviousButtonCssClass="pagerclass" />
                                        <asp:NextPreviousPagerField ButtonType="Image" ShowLastPageButton="true" ShowNextPageButton="true"
                                            ShowPreviousPageButton="false" LastPageImageUrl="~/Images/pager_last.png" NextPageImageUrl="~/Images/pager_next.png" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"></asp:SqlDataSource>
            </div>
            <div id="inspection_sort">
                <h2>Sort</h2>
                <asp:LinkButton OnCommand="Sort_Command" CommandName='0' runat="server">
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 0 ? "sort_up" : sortorder == 1 ? "sort_down" : "sort_none") %>"></div>
                        Date
                    </div>
                </asp:LinkButton>
                <%--<a href="?so=<%= sortorder == 0 ? 1 : 0 %>">
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 0 ? "sort_up" : sortorder == 1 ? "sort_down" : "sort_none") %>"></div>
                        Date
                    </div>
                </a>--%>
                <%--<a href="?so=<%= sortorder == 2 ? 3 : 2 %>">--%>
                <asp:LinkButton OnCommand="Sort_Command" CommandName='2' runat="server">
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 2 ? "sort_up" : sortorder == 3 ? "sort_down" : "sort_none") %>"></div>
                        Status
                    </div>
                <%--</a>--%>
                </asp:LinkButton>
                <asp:LinkButton OnCommand="Sort_Command" CommandName='4' runat="server">
                <%--<a href="?so=<%= sortorder == 4 ? 5 : 4 %>">--%>
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 4 ? "sort_up" : sortorder == 5 ? "sort_down" : "sort_none") %>"></div>
                        Inspection number
                    </div>
                <%--</a>--%>
                </asp:LinkButton>
            </div>
            <div id="inspection_help">
                <h2>Description</h2>
                <div class="inspection_item green">Completed</div>
                <div class="inspection_item orange">In progress</div>
                <div class="inspection_item blue">Not started</div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div style="clear: both"></div>
</asp:Content>

