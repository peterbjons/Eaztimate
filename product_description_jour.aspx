<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="product_description_jour.aspx.cs" Inherits="product_description_jour" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <img src="Images/logo_jour.png" /><h1>Beskrivning - Jour</h1>
    <p>Ett samtal kommer in till jouren och ett uppdrag startar med att jourhavande öppnar Jour-appen och noterar adress och telefonnummer till kontaktperson på skadeplatsen.  Tid och uppgifter om olika steg i jourärendet loggas sedan i kronologisk ordning: </p>
    <ol>
        <li>Samtalet till kontaktpersonen</li>
        <li>Resan till platsen</li>
        <li>Ankomst</li>
        <li>Ev. akuta åtgärder</li>
        <li>Besiktning</li>
        <li>Skadebegränsade åtgärder</li>
    </ol>
    <p>Loggen och dokumentation i forma av formulär, fritexter och bilder rapporteras därefter in till Försäkringsbolaget.</p>
    <p>Därmed är jourärendet avslutat.</p>
    <p>Fördelarna med att ha med sig en Jour-app i mobilen eller i paddan är flera jämfört med att arbeta med papper, penna och kamera. Enligt användarna sticker dock det minimala efterarbetet ut. Vid kontakt med internet skickas jourrapporten vidare, oftast innan du lämnar platsen. </p>

    <a href="products.aspx" class="button" style="float:left">&laquo; Tillbaka till produkter</a><a href="product_timeline.aspx#jour_timeline" class="button">Se tidslinje &raquo;</a>
</asp:Content>

