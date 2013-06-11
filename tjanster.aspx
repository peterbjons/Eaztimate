<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="tjanster.aspx.cs" Inherits="tjanster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Tjänster</h1>
    <div class="whitebox">
        <img src="images/stock/banner-5.jpg" />
                <h2>Support & Service</h2>
        <p>Teknisk support på applikationer ingår i avgifterna för att använda respektive applikation. På hårdvara levererade av oss är support och service inkluderat i 2 år från och med leveransdatum.</p>
        <p>Användarsupport ingår i avgiften, öppen vardagar mellan 09.00 - 11.00 samt 14.00 - 16.00.   </p>
        <%--<h2>Kontakt</h2>--%>
        <table>
           
            <tbody>
            <tr>
                <td style="width:90px;">Telefon:</td>
                <td>023-79 75 90</td>
            </tr>
            <tr>
                <td>E-post:</td>
                <td>support@eaztimate.se</td>
            </tr></tbody>
        </table>
        <h2>Integration</h2>
        <p>
            Samtliga applikationen är utformade för att vara självständiga och funktionella verktyg speciellt framtagna för att hantera specifika typer av uppdrag. Att integrera Eaztimates lösningar med bakomliggande ärendehanteringssystem kan dock har flera fördelar.
            </p><p>Tidsbesparing från att slippa dubbelarbete
Kortare ledtider om det finns befintliga kopplingar till externa parter</p>
<%--        <h2>Uppdateringar av programvara</h2>
        <p class="textneedsfix">Fördelarna med att ha med sig en Jour-app i mobilen eller i paddan är flera jämfört med att arbeta med papper, penna och kamera. Enligt användarna sticker dock det minimala efterarbetet ut. Vid kontakt med internet skickas jourrapporten vidare, oftast innan du lämnar platsen. </p>--%>
        
      <%--   <div class="divider"></div>
       <a href="products.aspx" class="button" style="float: left">&laquo; Tillbaka till produkter</a><a href="product_timeline.aspx#jour_timeline" class="button">Se tidslinje &raquo;</a><div style="clear: both"></div>--%>
    </div>
</asp:Content>

