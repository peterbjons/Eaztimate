<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Produkter</h1>

    <ul class="products">
        <li class="block">
            <h2>Jour</h2><div class="whitebox">
            <img src="Images/logo_jour.png" />
            
            <ul>
                <li>Hitta rätt</li>
                <li>Logga aktiviteter</li>
                <li>Beslutsstöd</li>
                <li>Rapportera</li>
            </ul>
            <p>Ett samtal kommer in till jouren och ett uppdrag startar med att jourhavande öppnar Jour-appen och noterar adress och telefonnummer...</p>
            <a class="button" style="float:left" href="product_description_jour.aspx">Läs mer &raquo;</a><div style="clear:both"></div></div>
        </li>
        <li class="block">
            <h2>Byggskada</h2><div class="whitebox">
            <img src="Images/logo_bygg.png" />
            <ul>
                <li>Dokumentera</li>
                <li>Bedöm</li>
                <li>Rapportera</li>
                
            </ul>
            <p>Stor eller liten fastighet, omfattande eller begränsad skada, sot eller fukt, osv. Skador skiljer sig åt men är sällan unika...  </p>
            <a class="button" style="float:left" href="product_description_bygg.aspx">Läs mer &raquo;</a><div style="clear:both"></div></div>
        </li>
        <li class="block">
            <h2>Lösöre</h2><div class="whitebox">
            <img src="Images/logo_sak.png" />
            <ul>
                <li>Dokumentera</li>
                <li>Bedöm</li>
                <li>Rapportera</li>
                
            </ul><p>Målet, att underlätta i varje led i hateringen av lösören är ambitiöst och kräver samarbete mellan individer och bolag... </p>
            <a class="button" style="float:left" href="product_description_losore.aspx">Läs mer &raquo;</a><div style="clear:both"></div></div>
        </li>
    </ul>





</asp:Content>

