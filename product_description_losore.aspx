<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="product_description_losore.aspx.cs" Inherits="product_description_losore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">


    <%--NYA--%>


    <h1>EZ Lösöre</h1>
    <div class="whitebox">
        <div class="app_col1">
            <div class="app_image">
                <img src="Images/logo_sak_300_300.png" />
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
            </ul>
            <h2>Hårdvarukrav</h2>
            <ul class="app_funktioner">
                <li>Kamera</li>
                <li>GPS</li>
            </ul>
        </div>
        <div class="app_col2">
            <div class="app_banner" style="background-image: url(images/stock/banner-losore.jpg);"></div>
            <h2>Beskrivning</h2>
            <p>Att dokumentera lösöre på en skadeplats  med hjälp av applikationen EZ Lösöre har flera fördelar. </p>
            <p>Det dynamiska gränssnittet  i applikationen gör det möjligt att:</p>
            <ul class="lista">
                <li>Anpassa och avgränsa innehållet utifrån fastighet och skadans art och omfattning.</li>
                <li>Logiskt kategorisera, gruppera och typbestämma objekt.</li>
            </ul>
            <p>Inbyggda mallar leder till att:</p>
            <ul class="lista">
                <li>Dokumentationen av objekt blir fullständig.</li>
                <li>Objektens egenskaper beskrivs med enhetliga skalor och begrepp.</li>
                <li>Rapporter följer en standard och ger en utförlig bild över skadat lösöre.</li>
            </ul>
            <p>
              Översikt och status vyer ger handläggare en god överblick av arbetet.
Funktionen att kopiera över egenskaper från ett objekt till ett annat spar tid.
            </p>


            <div class="varhurvarfor">
                <h2>När</h2>
                <p>Vid behov av att dokumentera skadat lösöre</p>
            </div>
            <div sclass="varhurvarfor">
                <h2>Var</h2>
                <p>EZ Lösöre är utvecklad för att köras på en padda och används på skadeplatsen, här kommer det mobila konceptet verkligen till sin rätt som informationsinsamlare. EZ Lösöre är även integrerad med en egen databas som möjliggör kompletteringar via PC.</p>
            </div>
        <div class="varhurvarfor last">
            <h2>Hur</h2>
            <p>Ladda hem EZ Lösöre från vår hemsida, EZ Lösöre är kopplad till en separat databas där alla uppgifter lagras. Försäkringsbolag och den skadedrabbade kan sedan logga in och ta del av den insamlade informationen.</p>
        </div>

        <div style="clear: both"></div>


        <h2>Skärmdumpar</h2>
        <div class="app_screenshots">
            <ul style="width: 1100px;">
                <li>
                    <img src="Images/screenshot_byggskada1.png" /></li>
                <li>
                    <img src="Images/screenshot_byggskada2.png" /></li>
                <li>
                    <img src="Images/screenshot_byggskada3.png" /></li>

            </ul>
            <div style="clear: both;"></div>

        </div>
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

                <a href="product_description_klotter.aspx">
                    <li class="floater_klotter last">
                        <p>Klotter</p>
                    </li>
                </a>
            </ul>
            <div style="clear: both"></div>
        </div>
        <div class="big_button">Beställ</div>
    </div>
    <div style="clear: both"></div>
    </div>






</asp:Content>

