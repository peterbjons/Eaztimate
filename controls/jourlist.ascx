<%@ Control Language="C#" AutoEventWireup="true" CodeFile="jourlist.ascx.cs" Inherits="controls_jourlist" %>
<script>
    Modernizr.addTest('csschecked', function () {
        return Modernizr.testStyles("#modernizr input {margin-left:0px;} #modernizr input:checked {margin-left: 20px;}", function (elem) {
            var chx = document.createElement('input');
            chx.type = "checkbox";
            chx.checked = "checked";
            elem.appendChild(chx);
            return elem.lastChild.offsetLeft >= 20;
        });
    });
</script>
<div style="width: 100%; margin-bottom: 0px;">
            <asp:UpdatePanel ID="listupdatepanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="inspection_list">
                        <h2>Jourärenden</h2>
                        <asp:HiddenField ID="sortorderhidden" runat="server" Value="0" />
                        <asp:HiddenField ID="room_hf" runat="server" Value="0" />
                        <asp:HiddenField ID="inspection_hf" runat="server" Value="0" />
                        <asp:ListView ID="jourlist" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="jourlist_ItemCommand" OnDataBound="jourlist_DataBound" OnPagePropertiesChanging="jourlist_PagePropertiesChanging">
                            <LayoutTemplate>
                                <ul>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                                    <div class="pager">
                                        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="jourlist" PageSize="10" class="NavigationBar">
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
                                            <div class="inspection_row_col1"><%#DataBinder.Eval(Container.DataItem, "jourid") %></div>
                                            <div class="inspection_row_col2"><%#DataBinder.Eval(Container.DataItem, "contactaddress") %>, <%#DataBinder.Eval(Container.DataItem, "contactcity") %></div>
                                            <div style="clear: both"></div>
                                        </div>
                                        <div class="inspection_row_2" style="display: none">
                                            <div class="inspection_col3">
                                                <div class="inspection_item_image">
                                                    <a rel="lightbox" target="_blank" href="<%#DBNull.Value.Equals(DataBinder.Eval(Container.DataItem, "image")) ? "" : AmazonHandler.GetPrivateImageJour((string)DataBinder.Eval(Container.DataItem, "journo")+"/"+(string)DataBinder.Eval(Container.DataItem, "image"))%>">
                                                        <img src="<%#DBNull.Value.Equals(DataBinder.Eval(Container.DataItem, "image")) ? "" : AmazonHandler.GetPrivateImageJour((string)DataBinder.Eval(Container.DataItem, "journo")+"/"+(string)DataBinder.Eval(Container.DataItem, "image")) %>" <%#DBNull.Value.Equals(DataBinder.Eval(Container.DataItem, "image")) ?  "style='display: none'" : "" %>/></a>

                                                </div>
                                            </div>
                                            <div class="inspection_col4b">
                                                <p><%#DataBinder.Eval(Container.DataItem, "contactname") %></p>
                                                <small><%#DataBinder.Eval(Container.DataItem, "contactphone1") %></small><br />
                                                <small><%#DataBinder.Eval(Container.DataItem, "contactphone2") %></small>
                                                <p style="margin-top:25px;"><%#DataBinder.Eval(Container.DataItem, "insurancetype") %> / <%#DataBinder.Eval(Container.DataItem, "damagetype") %> / Insats ocab</p>
                                            </div>
                                            <div style="clear: both"></div>
                                            <div class="inspection_item_bottom">
                                                <small>Datum: <%#((DateTime)DataBinder.Eval(Container.DataItem, "dateupdated")).ToString("yyyy-MM-dd")%><br />
                                                </small>
                                                <asp:LinkButton ID="LinkButton1" style="margin-left: 5px;" class="button" CommandArgument='<%# Eval("jourid") %>' CommandName="Open" runat="server">Open &raquo;</asp:LinkButton>
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
                        Datum
                    </div>
                        </asp:LinkButton>
                       <%-- <asp:LinkButton ID="sort2_lb" OnCommand="Sort_Command" CommandName='2' runat="server">
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
                        </asp:LinkButton>--%>
                    </div>
                    </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="cat_cblist" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="type_cblist" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="city_cblist" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
                    <div id="inspection_help">
                        <h2>Urval</h2>
                        <div id="roomdiv" class="selection_item white" runat="server">
                            <div class="sort_row1 row_rum1">
                                <div class="sort_closed"></div>
                                Skadetyp
                            </div>
                            <div class="sort_row2 row_rum2" style="display: none">
                                <asp:CheckBoxList ID="type_cblist" runat="server" DataValueField="damagetype" DataTextField="title" OnSelectedIndexChanged="type_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>                                
                            </div>
                        </div>
                        <div id="catdiv" runat="server" class="selection_item white">
                            <div class="sort_row1 row_kategori1">
                                <div class="sort_closed"></div>
                                Åtgärder
                            </div>
                            <div class="sort_row2 row_kategori2" style="display: none">
                                <asp:CheckBoxList ID="cat_cblist" runat="server" DataValueField="key" DataTextField="value" OnSelectedIndexChanged="cat_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>                                
                            </div>
                        </div>
                        <div id="citydiv" runat="server" class="selection_item white">
                            <div class="sort_row1 row_city1">
                                <div class="sort_closed"></div>
                                Ort
                            </div>
                            <div class="sort_row2 row_city2" style="display: none">
                                <asp:CheckBoxList ID="city_cblist" runat="server" DataValueField="city" DataTextField="title" OnSelectedIndexChanged="city_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>                                
                            </div>
                        </div>
                    </div>                
        </div>