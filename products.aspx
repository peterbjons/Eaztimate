<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Produkter</h1>

    <%--    <ul class="products">
        <li class="block">
            <h2>Jour</h2><div class="whitebox">
            <img src="Images/logo_jour_300_300.png" />
            
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
            <img src="Images/logo_bygg_300_300.png" />
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
            <img src="Images/logo_sak_300_300.png" />
            <ul>
                <li>Dokumentera</li>
                <li>Bedöm</li>
                <li>Rapportera</li>
                
            </ul><p>Målet, att underlätta i varje led i hateringen av lösören är ambitiöst och kräver samarbete mellan individer och bolag... </p>
            <a class="button" style="float:left" href="product_description_losore.aspx">Läs mer &raquo;</a><div style="clear:both"></div></div>
        </li>
    </ul><div style="clear:both"></div>--%>
    <div class="product_block">
        <img src="Images/logo_jour_300_300.png" style="float: left" /><div class="slider_text">

            <h2 style="padding-top: 0px">Eaztimate Jour</h2>
            <p>Ett samtal kommer in till jouren och ett uppdrag startar med att jourhavande öppnar Jour-appen och noterar adress och telefonnummer till kontaktperson på skadeplatsen. Tid och uppgifter om olika steg i jourärendet loggas sedan i kronologisk ordning...</p>
            <ul>
                <li>Hitta rätt</li>
                <li>Logga aktiviteter</li>
                <li>Beslutsstöd</li>
                <li>Rapportera</li>
            </ul>
            
            <a class="button" style="float: left; " href="product_description_jour.aspx">Läs mer &raquo;</a>
<div style="clear:both"></div>
        </div>
        <div style="clear: both"></div>
    </div>
    <div class="product_block">
        <img src="Images/logo_bygg_300_300.png" style="float: left" /><div class="slider_text">

            <h2 style="padding-top: 0px">Eaztimate Bygg</h2>
            <p>Stor eller liten fastighet, omfattande eller begränsad skada, sot eller fukt, osv. Skador skiljer sig åt men är sällan unika. I EZ Byggskada har vi strukturera upp möjliga skador, viket leder till att arbetet med att dokumentera, bedöma och rapportera underlättas avsevärt...</p><ul>
                <li>Dokumentera</li>
                <li>Bedöm</li>
                <li>Rapportera</li>
                
            </ul>
            <a class="button" style="float: left;" href="product_description_bygg.aspx">Läs mer &raquo;</a>

        </div>
        <div style="clear: both"></div>
    </div>

    <div class="product_block">
        <img src="Images/logo_sak_300_300.png" style="float: left" /><div class="slider_text">

            <h2 style="padding-top: 0px">Eaztimate Lösöre</h2>
            <p>Målet, att underlätta i varje led i hanteringen av lösören är ambitiöst och kräver samarbete mellan individer och bolag. Första steget mot att nå dit är taget i.o.m. EZL-appen. Stora utmaningar ligger i begreppet lösöre omfattar ett stort antal olika saker, en keps, en byrå, två stolar, tre flaskor, en samling frimärken, listan kan göras lång...</p><ul>
                <li>Dokumentera</li>
                <li>Bedöm</li>
                <li>Rapportera</li>
                
            </ul>
            <a class="button" style="float: left; " href="product_description_losore.aspx">Läs mer &raquo;</a>

        </div>
        <div style="clear: both"></div>
    </div>
        <div class="product_block">
        <img src="Images/logo_hardware_300_300.png" style="float: left" /><div class="slider_text">

            <h2 style="padding-top: 0px">Hårdvara</h2>
            <p>Vi kan grejerna!</p><ul>
                <li>Surfplattor</li>
                <li>Mobiltelefoner</li>
                <li>Android</li>
                
            </ul>
            <a class="button" style="float: left; " href="product_description_losore.aspx">Läs mer &raquo;</a>

        </div>
        <div style="clear: both"></div>
    </div>





</asp:Content>

