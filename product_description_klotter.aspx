<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="product_description_klotter.aspx.cs" Inherits="product_description_klotter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>EZ Klotter</h1>
    <div class="whitebox">
        <div class="app_col1">
            <div class="app_image">
                <img src="Images/logo_klotter_300_300.png" />
            </div>
            <h2>Funktioner</h2>
            <ul class="app_funktioner">
                <li>GPS</li>
                <li>Delningscenter</li>

                <li>Jourlistan </li>
                <li>Checklistor</li>
                <li>Formulär</li>
                <li>Logg</li>
                <li>Rapportgenerator</li>
            </ul>
            <h2>Specifikationer</h2>

            <ul class="app_funktioner">
                <li>Version: <span style="color: #1c80aa">1.0b</span></li>
                <li>Storlek: <span style="color: #1c80aa">5.1 MB</span></li>
                <li>Språk: <span style="color: #1c80aa">Svenska</span></li>
                <li>Uppdaterad: <span style="color: #1c80aa">2013-06-18</span></li>
                <li>Platform: <span style="color: #1c80aa">Android +4.0</span></li>
            </ul>
            <h2>Hårdvarukrav</h2>
            <ul class="app_funktioner">
                <li>Kamera</li>
                <li>GPS</li>
            </ul>
            <%--<h2>När</h2>
            <ul class="app_funktioner">
                <li>Vid vid tvätt av tak och fasader, klotter och andra missfärgningar</li>
            </ul>
            <h2>Hur</h2>
            <ul class="app_funktioner">
                <li>Registrera dig hos Eaztimate
(om du inte redan har ett användarkonto)</li>
                <li>Ladda ner EZ Klottet till mobiltelefonen</li>
                <li>Fyll i användaruppgifter </li>
                <li>Börja använda </li>
            </ul>
            <h2>Varför</h2>
            <ul class="app_funktioner">
                <li>Dokumentera före och efter insats</li>
                <li>Skapar arbetsrapporter</li>
                <li>Förenklar polisanmälan</li>
                <li>Bra rapportverktyg för 
Var insatser gjorts</li>
                <li>Vilka insatser</li>
                <li>Vilka taggar som tagits bort</li>
            </ul>--%>
        </div>
        <div class="app_col2">
            <div class="app_banner" style="background-image: url(images/stock/banner-klotter-app.jpg);"></div>
            <h2>Beskrivning</h2>
            <h2>Användningsområde</h2>
            <p>
EZ klotter utvecklades som namnet antyder för att hantera dokumentation av klotterärenden men när Micke Pettersson på OCAB i Dalarna började använda den så kom det fram fler användningsområden. Som ansvarig för högtryckstvättsbilen använder han i dag EZ Klotter för att dokumentera alla typer av insatser.</p>
            <p>EZ Klotter laddar du ner i mobiltelefonen där du enkelt och smidigt har den till hands då situationen före och efter insatsen skall dokumenteras. </p>
            <p>Dokumentationen fungerar sedan både som rapportunderlag till kund och som fakturaunderlag.</p>
            <p>För OCAB i Dalarna har vi även utvecklat en rutin för att upprätta en polisanmälan.</p>
<%--            <h2>Så funkar det</h2>
            <ul class="lista">
                <li>Förbered ärenden genom att knappa in arbetsorder, dessa hamnar i en att göra lista.</li>
                <li>Innan du åker klickar du på ”visa vägen” och hittar du inte dit sedan tidigare följer du anvisningen i GPS. </li>
                <li>När du anlänt tar du kort på det som skall tvättas.</li>
                <li>Anger en åtgärd.</li>
                <li>När åtgärden är utförd tar du kort på resultatet.</li>
                <li>Skriver in eventuella kommentarer.</li>
                <li>Skapar rapport som skickas till din E-post som en PDF.</li>
            </ul>--%>
            <div class="varhurvarfor">
                <h2>När</h2>
                <p>Vid vid tvätt av tak och fasader, klotter och andra missfärgningar</p>
            </div>
            <div class="varhurvarfor">
                <h2>Hur</h2>
                <p>
                    Registrera dig hos Eaztimate
(om du inte redan har ett användarkonto)
Ladda ner EZ Klottet till mobiltelefonen
Fyll i användaruppgifter 
Börja använda
                </p>
            </div>
            <div class="varhurvarfor last">
                <h2>Varför</h2>
                <p>
                    Dokumentera före och efter insats
Skapar arbetsrapporter
Förenklar polisanmälan
Bra rapportverktyg för 
Var insatser gjorts
Vilka insatser
Vilka taggar som tagits bort
                </p>
            </div>

            <div style="clear: both"></div>
           <%-- <h2>Skärmdumpar</h2>
            <div class="app_screenshots">
                <ul style="width: 1100px;">
                    <li>
                        <img src="Images/screenshot_klotter1.jpg" /></li>
                    <li>
                        <img src="Images/screenshot_klotter2.jpg" /></li>
                    <%--<li>
                        <img src="Images/screenshot_klotter2.jpg" /></li>

                </ul>
                <div style="clear: both;"></div>

            </div>--%>
            <h2>Våra andra appar</h2>
            <div class="app_appar">
                <ul>
                    <a href="product_description_bygg.aspx">
                        <li class="floater_bygg">
                            <p>Byggskada</p>
                        </li>
                    </a>
                    <a href="product_description_jour.aspx">
                        <li class="floater_jour">
                            <p>Jour</p>
                        </li>
                    </a>
                    <a href="product_description_sanering.aspx">
                        <li class="floater_sanering">
                            <p>Sanering</p>
                        </li>
                    </a>
                    <a href="product_description_losore.aspx">
                        <li class="floater_losore last">
                            <p>Lösöre</p>
                        </li>
                    </a>

                </ul>
                <div style="clear: both"></div>
            </div>
          <%--  <div class="big_button">Beställ</div>--%>
        </div>
        <div style="clear: both"></div>
    </div>

</asp:Content>

