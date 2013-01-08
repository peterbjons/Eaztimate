<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="inspect_object.aspx.cs" Inherits="inspect_object" %>

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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"/>
    <div class="inspect_object">
        <h3><a href="inspect_object.aspx?id=<%=inspectionid %>" class="breadcrumb"><asp:Literal ID="inspectno" runat="server"/></a></h3>
        <h1><asp:Literal ID="description" runat="server"/></h1>
        <div class="col1">
            <div class="room_col">
                <h4>Damage type</h4>
                <p>
                    <asp:Literal ID="damagetype" runat="server"/>
                </p>
            </div>
            <div class="object_col">
                <h4>Adress</h4>
                <p>
                    <asp:Literal ID="address1" runat="server"/><br />
                    <asp:Literal ID="zipcode" runat="server"/> <asp:Literal ID="city" runat="server"/>
                </p>
            </div>
            <asp:UpdatePanel ID="update1" runat="server">
                <ContentTemplate>
                    <div class="full_col">
                        <h4>Rooms</h4>                
                        <asp:listbox runat="server" ID="rooms" DataTextField="title" DataValueField="roomid" AutoPostBack="true" OnSelectedIndexChanged="rooms_SelectedIndexChanged">
                        </asp:listbox>
                        <asp:LinkButton runat="server" OnClick="Room_Click"><span class="goto">Go to Room &raquo;</span></asp:LinkButton>
                    </div>



                    <div class="full_col">
                        <h4>Objects</h4>
                        <asp:GridView ID="objectgrid" runat="server" AllowSorting="true" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" CssClass="gridviewtable" GridLines="none" OnRowDataBound="objectgrid_RowDataBound" >
                            <HeaderStyle CssClass="orrpon" Height="36"/>
                            <RowStyle CssClass="Normal" />
                            <AlternatingRowStyle CssClass="Alternate" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField Visible="true" DataField="itemid" ReadOnly="true" />
                                <asp:BoundField HeaderText="Kategori" DataField="categorytitle" ReadOnly="true" SortExpression="categorytitle"/>
                                <asp:BoundField HeaderText="Grupp" DataField="grouptitle" ReadOnly="true" SortExpression="grouptitle" />
                                <asp:BoundField HeaderText="Typ" DataField="itemtitle" ReadOnly="true" SortExpression="itemtitle" ItemStyle-CssClass="typeclass" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"                   
                          ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" />
                        <asp:LinkButton runat="server" OnClick="Object_Click"><span style="margin-top: 20px; float:right" class="goto">Go to Object &raquo;</span></asp:LinkButton>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="clear: both"></div>
        </div>
        <div class="col2">
            <%--<h4>Picture</h4>
            <p>
                <img src="Images/object1.jpg" />
            </p>--%>
            <h4>Map</h4>
            <p>
                <iframe width="250" height="175" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Styraregatan+3+971+62+Falun&amp;aq=&amp;sll=60.5994,15.625713&amp;sspn=0.004366,0.013937&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=Styraregatan+3,+791+62+Falun,+Dalarnas+l%C3%A4n,+Sweden&amp;ll=60.599348,15.625635&amp;spn=0.00869,0.027874&amp;z=14&amp;output=embed"></iframe>
                <br />
                <small><a href="https://maps.google.com/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Styraregatan+3+971+62+Falun&amp;aq=&amp;sll=60.5994,15.625713&amp;sspn=0.004366,0.013937&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=Styraregatan+3,+791+62+Falun,+Dalarnas+l%C3%A4n,+Sweden&amp;ll=60.599348,15.625635&amp;spn=0.00869,0.027874&amp;z=14">View Larger Map</a></small>
            </p>

        </div>
        <div style="clear: Both"></div>
    </div>
</asp:Content>

