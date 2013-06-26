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
    <h1>Skapa ärende</h1>
    <div class="whitebox">
    <div id="create_inspection">
        <div class="col1">
            <h2>Kontaktuppgifter</h2><input type="text" id="contact_name" runat="server" placeholder="Namn" />
            <input type="text" id="contact_phone" runat="server" placeholder="Telefon" />
            <h2>Adress</h2><input type="text" id="adress_line1" runat="server" placeholder="Adress 1" />
            <input type="text" id="adress_line2" runat="server" placeholder="Adress 2" />
            <input type="text" id="adress_line3" runat="server" placeholder="Postnummer" />
            <input type="text" id="adress_line4" runat="server" placeholder="Ort" />

        </div>
        <div class="col2">
            <h2>Skada</h2><input type="text" id="inspection_damage_type" runat="server" placeholder="Skadetyp" />
            <input type="text" id="inspection_building_type" runat="server" placeholder="Byggnadstyp" />
            <input type="text" id="inspection_size" runat="server" placeholder="Yta (m&sup2;)" />
            <input type="text" id="inspection_adults" runat="server" placeholder="Vuxna" class="input_third" />
            <input type="text" id="inspection_youth" runat="server" placeholder="Ungdomar" class="input_third" />
            <input type="text" id="inspection_children" runat="server" placeholder="Barn" class="input_third" />
            <div style="clear: both"></div>
            <input type="text" id="inspection_area" runat="server" placeholder="Område" />
            <input type="text" id="inspection_insurance_company" runat="server" placeholder="Försäkringsbolag" />
            <input type="text" id="inspection_insurance_sup1" runat="server" placeholder="Tilläggsförsäkring" />
            <input type="submit" id="inspection_create" runat="server" value="Skapa" />
        </div>
        <div style="clear: both"></div></div>
    </div>
</asp:Content>

