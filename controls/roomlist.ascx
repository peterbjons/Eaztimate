<%@ Control Language="C#" AutoEventWireup="true" CodeFile="roomlist.aspx.cs" Inherits="controls_roomlist" %>

<div style="width: 100%; margin-bottom: 0px;">
            <asp:UpdatePanel ID="listupdatepanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="inspection_list">
                        <h2>Rum</h2>
                        <asp:HiddenField ID="sortorderhidden" runat="server" Value="0" />
                        <asp:HiddenField ID="room_hf" runat="server" Value="0" />
                        <asp:HiddenField ID="inspection_hf" runat="server" Value="0" />
                        <asp:ListView ID="objectlist" runat="server" DataSourceID="RoomSqlDataSource" OnItemCommand="objectlist_ItemCommand" OnDataBound="objectlist_DataBound" OnPagePropertiesChanging="objectlist_PagePropertiesChanging">
                            <LayoutTemplate>
                                <ul>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                                    <div class="pager">
                                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="objectlist" PageSize="10" class="NavigationBar">
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
                                    <div class="inspection_item blue">
                                        <div class="room_row_1">
                                            <div class="inspection_row_col1_inspection_aspx"><%#DataBinder.Eval(Container.DataItem, "title")%></div>

                                            <div class="inspection_row_col2_inspection_aspx"><%#DataBinder.Eval(Container.DataItem, "description")%></div>
                                            <div style="clear: both"></div>
                                        </div>
                                        <div class="room_row_2" style="display: none">
                                            <div class="inspection_col3">
                                                <div class="inspection_item_image">
                                                    <a rel="lightbox" href="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "roomimage"))%>">
                                                        <img src="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "roomimage"))%>" <%#DBNull.Value.Equals(DataBinder.Eval(Container.DataItem, "roomimage")) ?  "style='display: none'" : "" %> /></a>
                                                </div>
                                            </div>
                                            <div class="inspection_col4">
                                                <p>
                                                    <%#DataBinder.Eval(Container.DataItem, "opinion")%>
                                                    <%--<%#DataBinder.Eval(Container.DataItem, "zipcode")%> <%#DataBinder.Eval(Container.DataItem, "city")%>--%>
                                                </p>                                               
                                            </div>
                                            <div style="clear: both"></div>
                                            <div class="inspection_item_bottom">
                                                <small>Datum: <%#((DateTime)DataBinder.Eval(Container.DataItem, "dateupdated")).ToString("yyyy-MM-dd")%><br />
                                                </small>
                                                <asp:LinkButton ID="LinkButton1" class="button" CommandArgument='<%# Eval("roomid") %>' CommandName="Open" runat="server">Open &raquo;</asp:LinkButton>
                                            </div>
                                            <div style="clear: both"></div>
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:ListView>

                        <asp:SqlDataSource ID="RoomSqlDataSource" runat="server"
                            ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"></asp:SqlDataSource>

                    </div>
                    <div id="room_sort">
                        <h2>Sortering</h2>
                        <asp:LinkButton ID="LinkButton2" OnCommand="Sort_Command" CommandName='0' runat="server">
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 0 ? "sort_up" : sortorder == 1 ? "sort_down" : "sort_none") %>"></div>
                        Typ
                    </div>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" OnCommand="Sort_Command" CommandName='2' runat="server">
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 2 ? "sort_up" : sortorder == 3 ? "sort_down" : "sort_none") %>"></div>
                        Namn
                    </div>
                        </asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" OnCommand="Sort_Command" CommandName='4' runat="server">
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 4 ? "sort_up" : sortorder == 5 ? "sort_down" : "sort_none") %>"></div>
                        Antal objekt
                    </div>
                        </asp:LinkButton>
                    </div>
                    <div id="room_help">
                        <h2>Urval</h2>
                        <div class="selection_item white">
                            <div class="sort_row1 row_cat1_1">
                                <div class="sort_closed"></div>
                                Typ
                            </div>
                            <div class="sort_row2 row_cat1_2" style="display: none">
                                <%--<asp:CheckBoxList ID="CheckBoxList1" runat="server" DataValueField="roomid" DataTextField="title" OnSelectedIndexChanged="room_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>--%>
                            </div>
                        </div>                        
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>