<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="create_inspection.aspx.cs" Inherits="create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <script src="Scripts/html5placeholder.jquery.js"></script>

    <script language="javascript">
        $(function () {
            $('form').jqTransform({ imgPath: 'Images/' });
        });
	</script>
    <script>
        $(function () {
            $(':input[placeholder]').placeholder();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Create inspection</h1>
    <div id="create_inspection">
        <div class="col1">
            <h2>Contact Details</h2><input type="text" id="contact_name" runat="server" placeholder="Name" />
            <input type="text" id="contact_phone" runat="server" placeholder="Phone" />
            <h2>Adress</h2><input type="text" id="adress_line1" runat="server" placeholder="Adress line 1" />
            <input type="text" id="adress_line2" runat="server" placeholder="Adress line 2" />
            <input type="text" id="adress_line3" runat="server" placeholder="Zip code" />
            <input type="text" id="adress_line4" runat="server" placeholder="City" />

        </div>
        <div class="col2">
            <h2>Damage</h2><input type="text" id="inspection_damage_type" runat="server" placeholder="Damage Type" />
            <input type="text" id="inspection_building_type" runat="server" placeholder="Building Type" />
            <input type="text" id="inspection_size" runat="server" placeholder="Size (m&sup2;)" />
            <input type="text" id="inspection_adults" runat="server" placeholder="Adults" class="input_third" />
            <input type="text" id="inspection_youth" runat="server" placeholder="Youths" class="input_third" />
            <input type="text" id="inspection_children" runat="server" placeholder="Children" class="input_third" />
            <div style="clear: both"></div>
            <input type="text" id="inspection_area" runat="server" placeholder="Area" />
            <input type="text" id="inspection_insurance_company" runat="server" placeholder="Insurance company" />
            <input type="text" id="inspection_insurance_sup1" runat="server" placeholder="Supplementary insurance" />
            <input type="submit" id="inspection_create" runat="server" value="Create" />
        </div>
        <div style="clear: both"></div>
    </div>
</asp:Content>

