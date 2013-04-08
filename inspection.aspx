<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="inspection.aspx.cs" Inherits="inspect_object" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">
        .Normal {
            background-color: #EFF3FB;
            cursor: pointer;
        }

        .Alternate {
            background-color: #f3e8f0;
            cursor: pointer;
        }

            .Normal:Hover, .Alternate:hover {
                background-color: #D1DDF1;
                cursor: pointer;
            }
    </style>
    <script type="text/javascript">
        var speed = 1;
        $(document).ready(function () {
            expandList($(".inspection_row_1"), $('.inspection_row_2'));
            expandSort($(".row_rum1"), $('.row_rum2'));
            expandSort($('.row_kategori1'), $('.row_kategori2'));
            expandElement($("#collapse"), $(".collapsable"));			
        });		
    </script>
    <link href="Content/lightbox.css" rel="stylesheet">
    <script src="Scripts/jquery-ui-1.9.2.custom.js"></script>
    <script src="Scripts/lightbox.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="inspect_object">
        <h3><a href="inspection.aspx?id=<%=inspectionid %>" class="breadcrumb">
            <asp:Literal ID="inspectno" runat="server" /></a></h3>
        <h1>
            <asp:Literal ID="description" runat="server" /></h1>
        <a class="button" style="float: none" id="collapse">Dölj</a>
        <div class="collapsable" style="width: 980px">

            <div class="left_col">
                <h2>Damage type</h2>
                <p>
                    <asp:Literal ID="damagetype" runat="server" />
                </p>
            </div>
            <div class="left_col">
                <h2>Adress</h2>
                <p>
                    <asp:Literal ID="address1" runat="server" /><br />
                    <asp:Literal ID="zipcode" runat="server" />
                    <asp:Literal ID="city" runat="server" />
                </p>
            </div>

            <div class="right_col">

                <h2>Map</h2>
                <p>
                    <iframe width="260" height="185" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=styraregatan+3+971+62+falun&amp;aq=&amp;sll=60.5994,15.625713&amp;sspn=0.004366,0.013937&amp;t=h&amp;ie=utf8&amp;hq=&amp;hnear=styraregatan+3,+791+62+falun,+dalarnas+l%c3%a4n,+sweden&amp;ll=60.599348,15.625635&amp;spn=0.00869,0.027874&amp;z=14&amp;output=embed"></iframe>
                    <br />
                    <small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=styraregatan+3+971+62+falun&amp;aq=&amp;sll=60.5994,15.625713&amp;sspn=0.004366,0.013937&amp;t=h&amp;ie=utf8&amp;hq=&amp;hnear=styraregatan+3,+791+62+falun,+dalarnas+l%c3%a4n,+sweden&amp;ll=60.599348,15.625635&amp;spn=0.00869,0.027874&amp;z=14">view larger map</a></small>
                </p>

            </div>

        </div>
        <div style="clear: Both"></div>
        <div style="width: 100%; margin-bottom: 0px;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="room_list">
                        <h2>Rooms</h2>
                        <asp:HiddenField ID="roomsortorderhidden" runat="server" Value="0" />
                        <asp:ListView ID="roomlist" runat="server" DataSourceID="RoomSqlDataSource" OnItemCommand="roomlist_ItemCommand" OnDataBound="roomlist_DataBound" OnPagePropertiesChanging="roomlist_PagePropertiesChanging">
                            <LayoutTemplate>
                                <ul>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                                    <div class="pager">
                                        <asp:DataPager ID="DataPager2" runat="server" PagedControlID="objectlist" PageSize="10" class="NavigationBar">
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
                                            <div class="inspection_row_col1_inspection_aspx"><%#DataBinder.Eval(Container.DataItem, "title")%></div>

                                            <div class="inspection_row_col2_inspection_aspx"><%#DataBinder.Eval(Container.DataItem, "description")%></div>
                                            <div style="clear: both"></div>
                                        </div>
                                        <div class="inspection_row_2" style="display: none">
                                            <div class="inspection_col3">
                                                <div class="inspection_item_image">
                                                    <a rel="lightbox" href="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "roomimage"))%>">
                                                        <img src="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "roomimage"))%>" <%#DBNull.Value.Equals(DataBinder.Eval(Container.DataItem, "roomimage")) ?  "style='display: none'" : "" %> /></a>
                                                    <h3><%--<%#DataBinder.Eval(Container.DataItem, "objects")%>--%></h3>

                                                </div>
                                            </div>
                                            <div class="inspection_col4">
                                                <p>
                                                    <%#DataBinder.Eval(Container.DataItem, "opinion")%>
                                                    <%--<%#DataBinder.Eval(Container.DataItem, "zipcode")%> <%#DataBinder.Eval(Container.DataItem, "city")%>--%><br />
                                                </p>
                                                <br />
                                                <p><%--<%#DataBinder.Eval(Container.DataItem, "insurancecompany")%>--%></p>

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
                        <h2>Sort</h2>
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
                        <h2>Selection</h2>
                        <div class="selection_item white">
                            <div class="sort_row1 row_cat1_1">
                                <div class="sort_closed"></div>
                                Typ
                            </div>
                            <div class="sort_row2 row_cat1_2" style="display: none">
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataValueField="roomid" DataTextField="title" OnSelectedIndexChanged="room_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>
                            </div>
                        </div>                        
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div style="clear: Both"></div>
        <div style="width: 100%; margin-bottom: 0px;">
            <asp:UpdatePanel ID="listupdatepanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div id="inspection_list">
                        <h2>Objects</h2>
                        <asp:HiddenField ID="sortorderhidden" runat="server" Value="0" />
                        <asp:HiddenField ID="room_hf" runat="server" Value="0" />
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
                                                    <a rel="lightbox" href="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "itemimage"))%>">
                                                        <img src="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "itemimage"))%>" <%#DBNull.Value.Equals(DataBinder.Eval(Container.DataItem, "itemimage")) ?  "style='display: none'" : "" %>/></a>
                                                    <h3><%--<%#DataBinder.Eval(Container.DataItem, "objects")%>--%></h3>

                                                </div>
                                            </div>
                                            <div class="inspection_col4">
                                                <p>
                                                    Price: <%#DataBinder.Eval(Container.DataItem, "price")%> / 100<br />
                                                    Usage: <%#DataBinder.Eval(Container.DataItem, "usage")%> / 100<br />
                                                    Age: <%#DataBinder.Eval(Container.DataItem, "age")%> / 100<br />
                                                    Other: <%#DataBinder.Eval(Container.DataItem, "other")%> / 100<br />
                                                    <%--<%#DataBinder.Eval(Container.DataItem, "address1")%>--%><br />
                                                    <%--<%#DataBinder.Eval(Container.DataItem, "zipcode")%> <%#DataBinder.Eval(Container.DataItem, "city")%>--%>
                                                </p>

                                            </div>
                                            <div style="clear: both"></div>
                                            <div class="inspection_item_bottom">
                                                <small>Datum: <%#((DateTime)DataBinder.Eval(Container.DataItem, "dateupdated")).ToString("yyyy-MM-dd")%><br />
                                                </small>
                                                <asp:LinkButton ID="LinkButton1" class="button" CommandArgument='<%# Eval("itemid") %>' CommandName="Open" runat="server">Open &raquo;</asp:LinkButton>
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
                    <div id="inspection_help">
                        <h2>Selection</h2>
                        <div class="selection_item white">
                            <div class="sort_row1 row_rum1">
                                <div class="sort_closed"></div>
                                Rum
                            </div>
                            <div class="sort_row2 row_rum2" style="display: none">
                                <asp:CheckBoxList ID="room_cblist" runat="server" DataValueField="roomid" DataTextField="title" OnSelectedIndexChanged="room_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>
                            </div>
                        </div>
                        <div class="selection_item white">
                            <div class="sort_row1 row_kategori1">
                                <div class="sort_closed"></div>
                                Kategorier
                            </div>
                            <div class="sort_row2 row_kategori2" style="display: none">
                                <asp:CheckBoxList ID="cat_cblist" runat="server" DataValueField="categoryid" DataTextField="title" OnSelectedIndexChanged="cat_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>                                
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>

