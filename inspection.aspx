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
                <h4>Damage type</h4>
                <p>
                    <asp:Literal ID="damagetype" runat="server" />
                </p>
            </div>
            <div class="left_col">
                <h4>Adress</h4>
                <p>
                    <asp:Literal ID="address1" runat="server" /><br />
                    <asp:Literal ID="zipcode" runat="server" />
                    <asp:Literal ID="city" runat="server" />
                </p>
            </div>

            <%-- <div class="full_col">
                        <h4>Rooms</h4>                
                        <asp:listbox runat="server" ID="rooms" DataTextField="title" DataValueField="roomid" AutoPostBack="true" OnSelectedIndexChanged="rooms_SelectedIndexChanged">
                        </asp:listbox>
                        <asp:LinkButton runat="server" OnClick="Room_Click"><span class="goto">Go to Room &raquo;</span></asp:LinkButton>
                    </div>--%>





            <div class="right_col">

                <h4>Map</h4>
                <p>
                    <iframe width="260" height="185" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=styraregatan+3+971+62+falun&amp;aq=&amp;sll=60.5994,15.625713&amp;sspn=0.004366,0.013937&amp;t=h&amp;ie=utf8&amp;hq=&amp;hnear=styraregatan+3,+791+62+falun,+dalarnas+l%c3%a4n,+sweden&amp;ll=60.599348,15.625635&amp;spn=0.00869,0.027874&amp;z=14&amp;output=embed"></iframe>
                    <br />
                    <small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=styraregatan+3+971+62+falun&amp;aq=&amp;sll=60.5994,15.625713&amp;sspn=0.004366,0.013937&amp;t=h&amp;ie=utf8&amp;hq=&amp;hnear=styraregatan+3,+791+62+falun,+dalarnas+l%c3%a4n,+sweden&amp;ll=60.599348,15.625635&amp;spn=0.00869,0.027874&amp;z=14">view larger map</a></small>
                </p>

            </div>

        </div>
        <div style="clear: Both"></div>        
                <div style="width: 100%; margin-bottom: 0px;">
                    <div id="inspection_list">
                        <h4>Objects</h4>
                        <asp:UpdatePanel ID="listupdatepanel" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                            
                        <asp:ListView ID="objectlist" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="objectlist_ItemCommand" OnDataBound="objectlist_DataBound" OnPagePropertiesChanging="objectlist_PagePropertiesChanging">
                            <LayoutTemplate>
                                <ul>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceholder"></asp:PlaceHolder>
                                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="objectlist" PageSize="5" class="NavigationBar">
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
                                    <div class="inspection_item blue">
                                        <div class="inspection_row_1">
                                            <div class="inspection_row_col1_inspection_aspx"><%#DataBinder.Eval(Container.DataItem, "itemtitle")%></div>
                                            
                                            <div class="inspection_row_col2_inspection_aspx"><%#DataBinder.Eval(Container.DataItem, "grouptitle")%>/<%#DataBinder.Eval(Container.DataItem, "categorytitle")%></div>
                                            <div style="clear: both"></div>
                                        </div>
                                        <div class="inspection_row_2" style="display: none">
                                            <div class="inspection_col3">                                                
                                                <div class="inspection_item_image">
                                                    <a rel="lightbox" href="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "itemimage"))%>"><img src="<%#AmazonHandler.GetPrivateImage(DataBinder.Eval(Container.DataItem, "inspectionno") + "/" + DataBinder.Eval(Container.DataItem, "itemimage"))%>" /></a>
                                                    <h3><%--<%#DataBinder.Eval(Container.DataItem, "objects")%>--%></h3>
                                                    
                                                </div>
                                            </div>
                                            <div class="inspection_col4">
                                                <p>
                                                    <%--<%#DataBinder.Eval(Container.DataItem, "address1")%>--%><br />
                                                    <%--<%#DataBinder.Eval(Container.DataItem, "zipcode")%> <%#DataBinder.Eval(Container.DataItem, "city")%>--%><br />
                                                </p>
                                                <br />
                                                <p><%--<%#DataBinder.Eval(Container.DataItem, "insurancecompany")%>--%></p>

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

                                </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>
                    <div id="inspection_sort">
                        <h4>Sort</h4>
                        <a href="?so=<%= sortorder == 0 ? 1 : 0 %>&id=<%=inspectionid %>">
                            <div class="sort_item white">
                                <div class="<%=(sortorder == 0 ? "sort_up" : sortorder == 1 ? "sort_down" : "sort_none") %>"></div>
                                Kategori</div>
                        </a>
                        <a href="?so=<%= sortorder == 2 ? 3 : 2 %>&id=<%=inspectionid %>">
                            <div class="sort_item white">
                                <div class="<%=(sortorder == 2 ? "sort_up" : sortorder == 3 ? "sort_down" : "sort_none") %>"></div>
                                Grupp</div>
                        </a>
                        <a href="?so=<%= sortorder == 4 ? 5 : 4 %>&id=<%=inspectionid %>">
                            <div class="sort_item white">
                                <div class="<%=(sortorder == 4 ? "sort_up" : sortorder == 5 ? "sort_down" : "sort_none") %>"></div>
                                Namn</div>
                        </a>
                    </div>
                    <div id="inspection_help">
                        <h4>Urval</h4>
                        <div class="selection_item white">
                            <div class="sort_closed"></div>
                            Rum</div>
                        <div class="selection_item white">
                            <div class="sort_closed"></div>
                            Kategorier</div>

                    </div>

                </div>            
    </div>
</asp:Content>

