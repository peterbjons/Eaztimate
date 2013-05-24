<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="product_timeline.aspx.cs" Inherits="product_timeline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <img src="Images/logo_clock.png" /><h1>Händelseförlopp</h1>
    <a name="jour_timeline"></a>
    <h2>Dag 1</h2>

    <div class="timeline_container">
        <img src="Images/logo_jour_60.png" class="head" />
        <ul class="jour">
            <li>
                <h3>1 minut</h3>
                <p>Personsökaren piper och X öppnar EZ Jour, väljer i listan över anslutna journummer och ringer upp. <strong>Tid och Jour loggas som start på jourärende</strong></p>

            </li>
            <li>
                <h3>5 minut</h3>
                <p>Samtal med jour. Registrera grunddata och omständigheter kring skada. <strong>Tid för avslutat samtal med jour loggas</strong></p>
            </li>
            <li>
                <h3>15 minut</h3>
                <p>Samtal till skadedrabbad. Alternativ för hur jourärendet skall fortgå registreras. <strong>Tid för samtal med skadedrabbad loggas</strong></p>
            </li>
            <li>
                <h3>30 minut</h3>
                <p>Ankomst till skadeplats dokumenteras, <strong>Tid för ankomst loggas</strong></p>
            </li>
            <li>
                <h3>1 timme</h3>
                <p>Eventuella akutåtgärder vidtas. <strong>Akutåtgärder loggas</strong></p>
            </li>
            <li>
                <h3>2 timmar</h3>
                <p>Utvändig besiktning dokumenteras. <strong>Tid för utvändig besiktning loggas</strong></p>
            </li>
            <li>
                <h3>6 timmar</h3>
                <p>Invändig besiktning dokumentera. <strong>Tid för invändig besiktning loggas</strong></p>
            </li>
            <li>
                <h3>12 timmar</h3>
                <p>Åtgärder vidtagna för att begränsa skada dokumenteras. <strong>Tid för skadebegränsande åtgärder loggas</strong></p>
            </li>
            <li>
                <h3>24 timmar</h3>
                <p>Ärendet avslutas. <strong>Tid för avslut loggas</strong></p>
            </li>
            <li>
                <h3>24 timmar</h3>
                <p>Jourrapport synkas med databas.</p>
            </li>
            <li>
                <h3>24 timmar</h3>
                <p>Jourrapport skapas och skickas till Försäkringsbolag. </p>
            </li>
            
        </ul>

    </div><a class="button" style="float: left" href="product_description_jour.aspx">&laquo; Till beskrivningen av Jour</a>
    <div style="clear:both; margin-bottom: 30px;"></div><a name="bygg_timeline"></a>
    <h2>Dag 2</h2>
    <div class="timeline_container">
        <img src="Images/logo_bygg_60.png" class="head" />
        <ul class="bygg">
            <li>
                <h3>1 minut</h3>
                <p>Skapa upp ny rapport genom att hämta från bakomliggande system eller genom att lägga in uppgifter om skadeplatsen manuellt.</p>
            </li>
            <li>
                <h3>5 minut</h3>
                <p>Dokumentera byggnadstyp</p>
            </li>
            <li>
                <h3>15 minut</h3>
                <p>Beskriv och fotografera primär skadeorsak</p>
            </li>
            <li>
                <h3>30 minut</h3>
                <p>Beskriv rumsförhållanden</p>
            </li>
            <li>
                <h3>1 timme</h3>
                <p>Dokumentera omfattning av skada </p>
            </li>
            <li>
                <h3>2 timmar</h3>
                <p>Skapa rapport</p>
            </li>
            <li>
                <h3>6 timmar</h3>
                <p>Skicka rapport på byggskada</p>
            </li>
           
        </ul>

    </div>
    <a class="button" style="float: left" href="product_description_bygg.aspx">&laquo; Till beskrivningen av Byggskada</a>
    <div style="clear:both; margin-bottom: 30px;"></div><a name="sak_timeline"></a>
    <h2>Dag 3</h2><div class="textneedsfix">
    <div class="timeline_container">
        <img src="Images/logo_sak_60.png" class="head" />
        <ul class="sak">
            <li>
                <h3>1 minut</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent hendrerit, tortor eget </p>
            </li>
            <li>
                <h3>5 minut</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent hendrerit, tortor eget </p>
            </li>
            <li>
                <h3>15 minut</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent hendrerit, tortor eget </p>
            </li>
            <li>
                <h3>30 minut</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent hendrerit, tortor eget </p>
            </li>
            <li>
                <h3>1 timme</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent hendrerit, tortor eget </p>
            </li>
            <li>
                <h3>2 timmar</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent hendrerit, tortor eget </p>
            </li>
            <li>
                <h3>6 timmar</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent hendrerit, tortor eget </p>
            </li>
            <li>
                <h3>12 timmar</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent hendrerit, tortor eget </p>
            </li>
            <li>
                <h3>24 timmar</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent hendrerit, tortor eget </p>
            </li>
        </ul>
</div></div>
    <a class="button" style="float: left" href="product_description_losore.aspx">&laquo; Till beskrivningen av Lösöre</a>
    <div style="clear:both; margin-bottom: 30px;"></div>
</asp:Content>

