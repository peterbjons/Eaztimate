<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="product_description.aspx.cs" Inherits="product_description" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Mobila applikationer</h1>
    <div class="whitebox">

        <%--  <div class="appblock litetappblock">
            <div class="appar">
                <ul>
                    <li class="floater_bygg">
                        <p>Byggskada</p>
                    </li>
                    <li class="floater_jour">
                        <p>Jour</p>
                    </li>
                    <li class="floater_sanering">
                        <p>Sanering</p>
                    </li>
                    <li class="floater_losore">
                        <p>Lösöre</p>
                    </li>
                    <li class="floater_klotter last">
                        <p>Klotter</p>
                    </li>
                </ul>
                <div style="clear: both"></div>
            </div>
        </div>--%>
        <%--<img src="images/stock/banner-33.jpg" />--%>
        <%--  <p>När arbetet med att ta fram våra första applikationer inleddes var vi noga med att ställa oss frågorna, när, var, hur och varför, ofta och till alla involverade. Svaren vi fick har vi sammanställt nedan. </p>--%>
        <%--        <div class="blockbox"><h2>När:</h2><p>Var helst det är tekniskt möjligt att tillgodose ett behov av bättre dokumentation och minskad administration.</p></div>
        <div class="blockbox last">
            <h2>Var:</h2> <p>På plats, där skador uppstår och åtgärdas</p>
        </div>
        <div class="blockbox"><h2>Hur:</h2> <p>Med hjälp av väl beprövad teknik och intuitiva gränssnitt</p></div>
        <div class="blockbox last"><h2>Varför:</h2> <p>Tidsbesparande, minskad felprocent, förbättrad kommunikationen mellan den som utför arbetet och de som skall ta del av det utförda arbetet.</p></div><div style="clear:both; height:20px"></div>--%>
        <div class="whitefield" style="background-image: url(images/stock/eaztimate-33.jpg); background-size: 100% auto; background-position: center -170px; margin-bottom: 20px; height: auto;">
            <div class="bubble" style="width: auto;">

                <p>När arbetet med att ta fram våra första applikationer inleddes var vi noga med att ställa oss frågorna, när, var, hur och varför, ofta och till alla involverade. Svaren vi fick har vi sammanställt nedan. </p>
            </div>
            <div class="bubble appbubble">
                <h2>När</h2>
                <p>Var helst det är tekniskt möjligt att tillgodose ett behov av bättre dokumentation och minskad administration.</p>
            </div>
            <div class="bubble  appbubble last">
                <h2>Var</h2>
                <p>På plats, där skador uppstår och åtgärdas</p>
            </div>
            <div class="bubble appbubble bottom">
                <h2>Hur</h2>
                <p>Med hjälp av väl beprövad teknik och intuitiva gränssnitt</p>
            </div>
            <div class="bubble appbubble bottom last">
                <h2>Varför</h2>
                <p>Tidsbesparande, minskad felprocent, förbättrad kommunikation</p>
            </div>



            <div style="clear: both"></div>

        </div>

        <p>Självklarheter? – javisst, det är självklart, med den tekniska utvecklingen av mobiltelefonen så följer möjligheten till förändringar och förbättringar av arbetsmetoderna som känns självklara.</p>

        <p>Nedan finner ni beskrivningar av våra applikationer som utvecklats och driftsatts av Eastimate. Applikationer som svarar på frågorna När, var, hur och varför.</p>
        <div class="appblock litetappblock">
            <div class="appar">
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
              <%--      <a href="product_description_sanering.aspx">--%>
                        <li class="floater_sanering">
                            <p>Sanering</p>
                        </li>
                <%--    </a>--%>
                    <a href="product_description_losore.aspx">
                        <li class="floater_losore">
                            <p>Lösöre</p>
                        </li>
                    </a>
                   <%-- <a href="product_description_klotter.aspx">--%>
                        <li class="floater_klotter last">
                            <p>Klotter</p>
                        </li>
                  <%--  </a>--%>
                </ul>
                <div style="clear: both"></div>
            </div>
        </div>
    </div>
    <%-- <h1>Eaztimate applikationer</h1>--%>
    <%--<div class="product_block">
        <img src="Images/logo_jour_300_300.png" style="float: left" /><div class="slider_text">

            <h2 style="padding-top: 0px">Eaztimate Jour</h2>
            <p>Ett samtal kommer in till jouren och ett uppdrag startar med att jourhavande öppnar Jour-appen och noterar adress och telefonnummer till kontaktperson på skadeplatsen. Tid och uppgifter om olika steg i jourärendet loggas sedan i kronologisk ordning...</p>
            <ul>
                <li>Hitta rätt</li>
                <li>Logga aktiviteter</li>
                <li>Beslutsstöd</li>
                <li>Rapportera</li>
            </ul>

            <a class="button" style="float: left;" href="product_description_jour.aspx">Läs mer &raquo;</a>
            <div style="clear: both"></div>
        </div>
        <div style="clear: both"></div>
    </div>
    <div class="product_block">
        <img src="Images/logo_bygg_300_300.png" style="float: left" /><div class="slider_text">

            <h2 style="padding-top: 0px">Eaztimate Bygg</h2>
            <p>Stor eller liten fastighet, omfattande eller begränsad skada, sot eller fukt, osv. Skador skiljer sig åt men är sällan unika. I EZ Byggskada har vi strukturera upp möjliga skador, viket leder till att arbetet med att dokumentera, bedöma och rapportera underlättas avsevärt...</p>
            <ul>
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
            <p>Målet, att underlätta i varje led i hanteringen av lösören är ambitiöst och kräver samarbete mellan individer och bolag. Första steget mot att nå dit är taget i.o.m. EZL-appen. Stora utmaningar ligger i begreppet lösöre omfattar ett stort antal olika saker, en keps, en byrå, två stolar, tre flaskor, en samling frimärken, listan kan göras lång...</p>
            <ul>
                <li>Dokumentera</li>
                <li>Bedöm</li>
                <li>Rapportera</li>

            </ul>
            <a class="button" style="float: left;" href="product_description_losore.aspx">Läs mer &raquo;</a>

        </div>
        <div style="clear: both"></div>
    </div>--%>
    <%--    <div class="whitebox">
        <div class="services_block" style="height: 550px;">
            <h3>Eaztimate Jour</h3>
            <img src="Images/logo_jour_300_300.png" style="margin-left: 50px" />
            <p>Ett samtal kommer in till jouren och ett uppdrag startar med att jourhavande öppnar Jour-appen och noterar adress och telefonnummer till kontaktperson på skadeplatsen. Tid och uppgifter om olika steg i jourärendet loggas sedan i kronologisk ordning...</p>
            <span class="buttonlight">Hitta rätt</span><span class="buttonlight">Logga aktiviteter</span><span class="buttonlight">Beslutsstöd</span><span class="buttonlight">Rapportera</span><a href="product_description_jour.aspx" class="button" style="float: left">Läs mer &raquo;</a>
        </div>
        <div class="services_block" style="height: 550px;">
            <h3>Eaztimate Bygg</h3>
            <img src="Images/logo_bygg_300_300.png" style="margin-left: 50px" />
            <p>Stor eller liten fastighet, omfattande eller begränsad skada, sot eller fukt, osv. Skador skiljer sig åt men är sällan unika. I EZ Byggskada har vi strukturera upp möjliga skador, viket leder till att arbetet med att dokumentera, bedöma och rapportera underlättas avsevärt...</p>
            <span class="buttonlight">Dokumentera</span><span class="buttonlight">Bedöm</span><span class="buttonlight">Rapportera</span><a href="product_description_bygg.aspx" class="button" style="float: left">Läs mer &raquo;</a>
        </div>
        <div class="services_block last" style="height: 550px;">
            <h3>Eaztimate Lösöre</h3>
            <img src="Images/logo_sak_300_300.png" style="margin-left: 50px" />
            <p>Målet, att underlätta i varje led i hanteringen av lösören är ambitiöst och kräver samarbete mellan individer och bolag. Första steget mot att nå dit är taget i.o.m. EZL-appen. Stora utmaningar ligger i begreppet lösöre omfattar ett stort antal olika saker, en keps, en byrå, två stolar, tre flaskor, en samling frimärken, listan kan göras lång...</p>
            <span class="buttonlight">Dokumentera</span><span class="buttonlight">Bedöm</span><span class="buttonlight">Rapportera</span><a href="product_description_losore.aspx" class="button" style="float: left">Läs mer &raquo;</a>
        </div>
        <div style="clear: both"></div>
    </div>--%>
</asp:Content>

