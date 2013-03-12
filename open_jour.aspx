<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="open_jour.aspx.cs" Inherits="openjour" %>

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
    <h1>Open Jour</h1>

    <div id="inspection_list">
        <h2>Cases</h2>
        <ul>
            <asp:Repeater ID="inspectionrepeater" runat="server" OnItemCommand="inspectionrepeater_ItemCommand">
                <ItemTemplate>
                    <li>
                        <div class="inspection_item <%#setColor((int)DataBinder.Eval(Container.DataItem, "status"))%>">
                            <div class="inspection_row_1">
                                <div class="inspection_row_col1">10-1234-63</div>
                                <div class="inspection_row_col2">Kaserngården 4, Falun</div>
                                <div style="clear: both"></div>
                            </div>
                            <div class="inspection_row_2" style="display:none">
                                <div class="inspection_col3">
                                  <div class="inspection_item_image"><img src="Images/bygg1.jpg" /> </div>
                                </div>
                                <div class="inspection_col4b">
                                    <p>Per Karlsson</p>
                                    <small>073 934 64 70</small><br />
                                    <small>023 123 45</small>
                                    <p style="margin-top:25px;">Företag / Vatten / Insats ocab</p>
                                </div>
                                <div style="clear: both"></div>
                                <div class="inspection_item_bottom">
                                    <small>Last change: <%#((DateTime)DataBinder.Eval(Container.DataItem, "dateupdated")).ToString("yyyy-MM-dd")%><br /></small>
                                    <asp:LinkButton style="margin-left: 5px;" class="button" CommandArgument='<%# Eval("inventoryid") %>' CommandName="Open" runat="server">Open &raquo;</asp:LinkButton>
                                    <a class="button" >PDF &raquo;</a>
                                </div>
                                <div style="clear: both"></div>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>



    </div>
    <div id="inspection_sort">
        <h2>Sort</h2>
        <a href="?so=0"><div class="inspection_item <%=(sortorder == 0 ? "blue" : "white") %>">Date</div></a>
        <a href="?so=1"><div class="inspection_item <%=(sortorder == 1 ? "blue" : "white") %>">Status</div></a>
        <a href="?so=2"><div class="inspection_item <%=(sortorder == 2 ? "blue" : "white") %>">Inspection number</div></a>
    </div>
    <div id="inspection_help">
        <h2>Description</h2>
        <div class="inspection_item green">Completed</div>
        <div class="inspection_item orange">In progress</div>
        <div class="inspection_item blue">Not started</div>
    </div>
    <div style="clear: both"></div>
</asp:Content>

