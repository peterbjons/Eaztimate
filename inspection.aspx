<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="inspection.aspx.cs" Inherits="inspect_object" %>
<%@ Register Src="~/controls/objectlist.ascx" TagPrefix="uc1" TagName="objectlist" %>
<%@ Register Src="~/controls/roomlist.ascx" TagPrefix="uc1" TagName="roomlist" %>

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
        <a href="inspection.aspx?id=<%=inspectionid %>" class="breadcrumb">
            <asp:Literal ID="inspectno" runat="server" /></a>
        <h1>
            <asp:Literal ID="description" runat="server" /></h1>
        <a class="button" style="float: none" id="collapse">Dölj</a>
        <h2 style="margin-top: 20px">Allmän information</h2>
        <div class="collapsable" style="width: 940px; background-color: #fff; padding: 10px; margin-bottom: 20px;">

            <div class="left_col">
                <h3>Adress</h3>
                <p>
                    <asp:Literal ID="address1" runat="server" />,
                    <asp:Literal ID="zipcode" runat="server" />
                    <asp:Literal ID="city" runat="server" />
                </p>
            </div>

            <div class="left_col">
                <h3>Yta (m&sup2;)</h3>
                <p>
                    <asp:Literal ID="area" runat="server" />
                </p>
            </div>

            <div class="right_col">
                <h3>Skadetyp</h3>
                <p>
                    <asp:Literal ID="damagetype" runat="server" />
                </p>
            </div>

            <div style="clear: both;"></div>

            <div class="left_col">
                <h3>Telefon</h3>
                <p>
                    <asp:Literal ID="phoneno" runat="server" />
                </p>
            </div>

            <div class="left_col">
                <h3>Vuxna/tonåringar/barn</h3>
                <p>
                    <asp:Literal ID="inhabitants" runat="server" />
                </p>
            </div>

            <div class="right_col">
                <h3>Villkor</h3>
                <p>
                    <asp:Literal ID="terms" runat="server" />
                </p>
            </div>

            <div style="clear: both;"></div>

            <%--<div class="left_col">
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
            </div>--%>

            <%--<div class="right_col">

                <h2>Map</h2>
                <p>
                    <iframe width="260" height="185" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=styraregatan+3+971+62+falun&amp;aq=&amp;sll=60.5994,15.625713&amp;sspn=0.004366,0.013937&amp;t=h&amp;ie=utf8&amp;hq=&amp;hnear=styraregatan+3,+791+62+falun,+dalarnas+l%c3%a4n,+sweden&amp;ll=60.599348,15.625635&amp;spn=0.00869,0.027874&amp;z=14&amp;output=embed"></iframe>
                    <br />
                    <small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=styraregatan+3+971+62+falun&amp;aq=&amp;sll=60.5994,15.625713&amp;sspn=0.004366,0.013937&amp;t=h&amp;ie=utf8&amp;hq=&amp;hnear=styraregatan+3,+791+62+falun,+dalarnas+l%c3%a4n,+sweden&amp;ll=60.599348,15.625635&amp;spn=0.00869,0.027874&amp;z=14">view larger map</a></small>
                </p>

            </div>--%>

        </div>
        <div style="clear: Both"></div>

        <uc1:roomlist runat="server" ID="roomlist" catselection="true"/>

        <%--<div style="width: 100%; margin-bottom: 0px;">
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
                                        <asp:DataPager ID="DataPager2" runat="server" PagedControlID="roomlist" PageSize="10" class="NavigationBar">
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
                                                    <h3></h3>

                                                </div>
                                            </div>
                                            <div class="inspection_col4">
                                                <p>
                                                    <%#DataBinder.Eval(Container.DataItem, "opinion")%>
                                                    
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
                                <%--<asp:CheckBoxList ID="CheckBoxList1" runat="server" DataValueField="roomid" DataTextField="title" OnSelectedIndexChanged="room_cblist_SelectedIndexChanged" AutoPostBack="true"></asp:CheckBoxList>--%>
                            <%---</div>
                        </div>                        
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        --%>
        <div style="clear: Both"></div>

        <uc1:objectlist runat="server" ID="objectlist" roomselection="true" catselection="true"/>
        
    </div>
</asp:Content>

