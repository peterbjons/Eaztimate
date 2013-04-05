<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="object_view.aspx.cs" Inherits="object_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
	<link href="Content/ui-lightness/jquery-ui-1.9.2.custom.css" rel="stylesheet">
	<link href="Content/lightbox.css" rel="stylesheet">
	<script src="Scripts/jquery-ui-1.9.2.custom.js"></script>
	<script src="Scripts/lightbox.js"></script>

	<script>
		$(function () {

			$("#slider_price").slider({
				value: <%=slider_price %>, min: 0, max: 100, disabled: true, range: "min"
			});
			$("#slider_usage").slider({
				value: <%=slider_usage %>, min: 0, max: 100, disabled: true, range: "min"
			});
			$("#slider_age").slider({
				value: <%=slider_age %>, min: 0, max: 100, disabled: true, range: "min"
			});
			$("#slider_other").slider({
				value: <%=slider_other %>, min: 0, max: 100, disabled: true, range: "min"
			});
		});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div class="inspect_object">
		<h3><a href="inspection.aspx?id=<%=inspectionid %>" class="breadcrumb"><asp:Literal ID="inspectionno" runat="server" /></a> / <a href="room_view.aspx?id=<%=roomid %>" class="breadcrumb"><asp:Literal ID="roomname" runat="server" /></a></h3>
		<h1><asp:Literal ID="typename" runat="server" /></h1>

		<div class="col1">
			<div class="left_col">

				<h4>Name</h4>
				<p>
					<asp:Literal ID="itemtitle" runat="server" />
				</p>
			</div>

			<div class="middle_col">
				<h4>Amount</h4>
				<p>
					1
				</p>
			</div>
			<div style="clear: both"></div>
			<h4>Pictures</h4>
			<br />
			<asp:Repeater ID="imagerepeater" runat="server">
				<ItemTemplate>
					<a href="<%#DataBinder.Eval(Container.DataItem, "image")%>" rel="lightbox"><img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="thumbnail"/></a>
					<%--<img src="<%#DataBinder.Eval(Container.DataItem, "image")%>" class="thumbnail" rel="lightbox" />--%>
				</ItemTemplate>
			</asp:Repeater>
			<h4>Opinion</h4>
			<table id="sliders">
				<tr>
					<td>Price:</td>
					<td>
						<div id="slider_price" class="slider"></div>
					</td>
				</tr>
				<tr>
					<td>Usage:</td>
					<td>
						<div id="slider_usage" class="slider"></div>
					</td>
				</tr>
				<tr>
					<td>Age:</td>
					<td>
						<div id="slider_age" class="slider"></div>
					</td>
				</tr>
				<tr>
					<td>Other:</td>
					<td>
						<div id="slider_other" class="slider"></div>
					</td>
				</tr>

			</table>
			<h4>Material</h4>
			<ul class="material">
				<li>Wood</li>
				<li>Metal</li>
				<li>Other</li>
			</ul>





		</div>

		<div class="col2">
			<h4>Objects</h4>
			<asp:listbox runat="server" ID="objects" DataTextField="type" DataValueField="itemid">
			</asp:listbox>
			<asp:LinkButton runat="server" OnClick="Object_Click"><span class="goto">Go to Object &raquo;</span></asp:LinkButton>

		</div>
		<div style="clear:both"></div>
</asp:Content>

