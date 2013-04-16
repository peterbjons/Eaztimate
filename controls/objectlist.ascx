<%@ Control Language="C#" AutoEventWireup="true" CodeFile="objectlist.ascx.cs" Inherits="controls_objectlist" %>

<div style="width: 100%; margin-bottom: 0px;">
            <asp:UpdatePanel ID="listupdatepanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="inspection_list">
                        <h2>Objekt</h2>
                        <asp:HiddenField ID="sortorderhidden" runat="server" Value="0" />
                        <asp:HiddenField ID="room_hf" runat="server" Value="0" />
                        <asp:HiddenField ID="inspection_hf" runat="server" Value="0" />
                        <asp:ListView ID="objectlist" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="objectlist_ItemCommand" OnDataBound="objectlist_DataBound" OnPagePropertiesChanging="objectlist_PagePropertiesChanging">
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
                                        <div class="inspection_row_1">
                                            <div class="inspection_row_col1_inspection_aspx"><%#DataBinder.Eval(Container.DataItem, "itemtitle")%></div>

                                            <div class="inspection_row_col2_inspection_aspx"><%#DataBinder.Eval(Container.DataItem, "grouptitle")%>/<%#DataBinder.Eval(Container.DataItem, "categorytitle")%></div>
                                            <div style="clear: both"></div>
                                        </div>
                                        <div class="inspection_row_2" style="display: none">
                                            <div class="inspection_col3">
                                                <div class="inspection_item_image">
                                                    <a rel="lightbox" target="_blank" href="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "itemimage"))%>">
                                                        <img src="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "itemimage"))%>" <%#DBNull.Value.Equals(DataBinder.Eval(Container.DataItem, "itemimage")) ?  "style='display: none'" : "" %>/></a>

                                                </div>
                                            </div>
                                            <div class="item_col4">												
                                                    Pris: <div class="sliderclass">
                                                        <span style="width: <%#DataBinder.Eval(Container.DataItem, "price")%>%"></span>
                                                    </div>
                                                Skick: <div class="sliderclass">
                                                        <span style="width: <%#DataBinder.Eval(Container.DataItem, "usage")%>%"></span>
                                                    </div>
                                                Ålder: <div class="sliderclass">
                                                        <span style="width: <%#DataBinder.Eval(Container.DataItem, "age")%>%"></span>
                                                    </div>
                                                Övrigt: <div class="sliderclass">
                                                        <span style="width: <%#DataBinder.Eval(Container.DataItem, "other")%>%"></span>
                                                    </div>                                                   
                                            </div>
                                            <div style="clear: both"></div>
                                            <div class="inspection_item_bottom">
                                                <small>Datum: <%#((DateTime)DataBinder.Eval(Container.DataItem, "dateupdated")).ToString("yyyy-MM-dd")%><br />
                                                </small>
                                                <asp:LinkButton ID="LinkButton1" class="button" CommandArgument='<%# Eval("itemid") %>' CommandName="Open" runat="server">Öppna &raquo;</asp:LinkButton>
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
                        <h2>Sortering</h2>
                        <asp:LinkButton ID="sort1_lb" OnCommand="Sort_Command" CommandName='0' runat="server">
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 0 ? "sort_up" : sortorder == 1 ? "sort_down" : "sort_none") %>"></div>
                        Kategori
                    </div>
                        </asp:LinkButton>
                        <asp:LinkButton ID="sort2_lb" OnCommand="Sort_Command" CommandName='2' runat="server">
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 2 ? "sort_up" : sortorder == 3 ? "sort_down" : "sort_none") %>"></div>
                        Grupp
                    </div>
                        </asp:LinkButton>
                        <asp:LinkButton ID="sort3_lb" OnCommand="Sort_Command" CommandName='4' runat="server">
                    <div class="sort_item white">
                        <div class="<%=(sortorder == 4 ? "sort_up" : sortorder == 5 ? "sort_down" : "sort_none") %>"></div>
                        Namn
                    </div>
                        </asp:LinkButton>
                    </div>
                    </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cat_cblist" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="room_cblist" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
                    <div id="inspection_help">
                        <h2>Urval</h2>
                        <div id="roomdiv" class="selection_item white" runat="server">
                            <div class="sort_row1 row_rum1">
                                <div class="sort_closed"></div>
                                Rum
                            </div>
                            <div class="sort_row2 row_rum2" style="display: none">
                                <asp:CheckBoxList ID="room_cblist" runat="server" DataValueField="roomid" DataTextField="title" OnSelectedIndexChanged="room_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>
                            </div>
                        </div>
                        <div id="catdiv" runat="server" class="selection_item white">
                            <div class="sort_row1 row_kategori1">
                                <div class="sort_closed"></div>
                                Kategorier
                            </div>
                            <div class="sort_row2 row_kategori2" style="display: none">
                                <asp:CheckBoxList ID="cat_cblist" runat="server" DataValueField="categoryid" DataTextField="title" OnSelectedIndexChanged="cat_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>                                
                            </div>
                        </div>
                    </div>                
        </div>