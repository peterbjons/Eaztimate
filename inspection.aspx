<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="inspection.cs" Inherits="inspect_object" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <style type="text/css">        
        .Normal
        {
            background-color: #EFF3FB;
            cursor: pointer;
        }
        .Alternate
        {
            background-color: #f3e8f0;
            cursor: pointer;
        }
        .Normal:Hover, .Alternate:hover
        {
            background-color: #D1DDF1;
            cursor: pointer;
        }
    </style>
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
                $("#collapse").toggle(function () {
                    $(".collapsable").animate({
                        opacity: 0.25,
                        height: 'toggle'
                    }, 500, function () {
                        // Animation complete.
                        $("#collapse").text("Visa");
                    });
                }, function () {
                    $(".collapsable").animate({
                        opacity: 1.0,
                        height: 'toggle'
                    }, 500, function () {
                        // Animation complete.
                        $("#collapse").text("Dölj");
                    });



                });
            });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"/>
    <div class="inspect_object">
        <h3><a href="inspection.aspx?id=<%=inspectionid %>" class="breadcrumb"><asp:Literal ID="inspectno" runat="server"/></a></h3>
        <h1><asp:Literal ID="description" runat="server"/></h1><a class="button" style="float:none" id="collapse">Dölj</a>
        <div class="collapsable" style="width:980px">
        
            <div class="left_col">
                <h4>Damage type</h4>
                <p>
                    <asp:Literal ID="damagetype" runat="server"/>
                </p>
            </div>
            <div class="left_col">
                <h4>Adress</h4>
                <p>
                    <asp:Literal ID="address1" runat="server"/><br />
                    <asp:Literal ID="zipcode" runat="server"/> <asp:Literal ID="city" runat="server"/>
                </p>
            </div>
            <asp:UpdatePanel ID="update1" runat="server">
                <ContentTemplate>
                   <%-- <div class="full_col">
                        <h4>Rooms</h4>                
                        <asp:listbox runat="server" ID="rooms" DataTextField="title" DataValueField="roomid" AutoPostBack="true" OnSelectedIndexChanged="rooms_SelectedIndexChanged">
                        </asp:listbox>
                        <asp:LinkButton runat="server" OnClick="Room_Click"><span class="goto">Go to Room &raquo;</span></asp:LinkButton>
                    </div>--%>



                  
                </ContentTemplate>
            </asp:UpdatePanel>
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
          <div style="width:100%; margin-bottom: 150px;">
                      

                            <div id="inspection_list">
        <h4>Objects</h4>
        <ul>
            
                
                    <li>
                        <div class="inspection_item orange">
                            <div class="inspection_row_1">
                                <div class="inspection_row_col1">[namn1]</div>
                                <div class="inspection_row_col2">[namn2]</div>
                                <div style="clear: both"></div>
                            </div>
                            <div class="inspection_row_2" style="display:none">
                                <div class="inspection_col3">
                                    <div class="inspection_item_image">
                                        
                                    </div>
                                </div>
                                <div class="inspection_col4">
                                    <p>
                                       Information<br />
                                       Information<br />
                                    </p><br />
                                    <p>Information</p>

                                </div>
                                <div style="clear: both"></div>
                                <div class="inspection_item_bottom">
                                    <small>Date added: 2013-01-08<br /></small>
                                    <asp:LinkButton ID="LinkButton1" class="button" CommandArgument='<%# Eval("inventoryid") %>' CommandName="Open" runat="server">Open &raquo;</asp:LinkButton>
                                </div>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </li>
                
            
        </ul>



    </div>
    <div id="inspection_sort">
        <h4>Sort</h4>
        <a href="?so=0&id=<%=inspectionid %>"><div class="sort_item <%=(sortorder == 0 ? "blue" : "white") %>">Date</div></a>
        <a href="?so=1&id=<%=inspectionid %>"><div class="sort_item <%=(sortorder == 1 ? "blue" : "white") %>">Status</div></a>
        <a href="?so=2&id=<%=inspectionid %>"><div class="sort_item <%=(sortorder == 2 ? "blue" : "white") %>">Inspection number</div></a>
    </div>
    <div id="inspection_help">
        <h4>Urval</h4>
        <div class="selection_item white"><div class="sort_up"></div>Rum</div>
        <div class="selection_item white"><div class="sort_down"></div>Kategorier</div>
        
    </div>

                    </div>
    </div>
</asp:Content>

