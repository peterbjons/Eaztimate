﻿<%@ Page Title="Eaztimate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
    <link href='http://fonts.googleapis.com/css?family=Oswald|Open+Sans:300italic,400italic,400,300,700' rel='stylesheet' type='text/css'>
</asp:Content>



<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h1 class="huvud">Eaztimate</h1>
    <div class="whitebox">
        <h2>Effektivitet</h2>
        <p>Mer gjort på kortare tid med lägre felprocent och högre kvalitet. Mer tid för eftertanke och mindre tid i bil, bättre beslutsunderlag och kortare ledtider. Tydliga mallar och förbättrad överblick, minskar stress och osäkerhet. Eaztimates mobila applikationen är inga underverk men det förbättrar onekligen dina chanser att addera värden i din verksamhet. </p>
        <p style="margin-bottom:50px;">Med fokus på funktionalitet, användarvänlighet och integration har Eaztimate under 2012 och 2013, utvecklat, levererat och integrerat mobila applikationer som på ett revolutionerade sätt har förändrat och förbättrat arbetet med att utföra och dokumentera jour, byggskador och lösöresärenden. </p>
        <blockquote>"  I arbetet med att begränsa omfattningen av sakskador i samband med sot och fukt i fastigheter är, tid, professionalism och god kommunikation viktiga faktorer för att lyckas  "</blockquote>
        <h2>Mobila applikationer</h2>
        <p>Var för sig är Jour, Byggskada och Lösöre, applikationer som underlättar arbetet med att bedöma, dokumentera och rapportera omfattningen av skadan. Tillsammans utgör de länkar i en mycket stark kedja mellan den drabbade, försäkringsbolaget och saneringsbolaget.</p>
        <blockquote>"  Eaztimate erbjuder en uppsättning verktyg som svarar upp mot dina förväntningar  "</blockquote>
        <h2>Våra tjänster</h2>
        <div class="services_block">
            <h3>Produkter</h3>
            <img src="Images/produkter.png" style="margin-left: 50px" />
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce diam lacus, pellentesque in vestibulum ac, malesuada scelerisque enim. Nunc volutpat nisi quis urna viverra euismod. Vivamus tempus sagittis leo.</p>
            <span class="buttonlight">Jour</span><span class="buttonlight">Byggskada</span><span class="buttonlight">Lösöre</span><a href="products.aspx" class="button" style="float: left">Läs mer &raquo;</a>
        </div>
        <div class="services_block">
            <h3>Utbildning</h3>
            <img src="Images/books.png" style="margin-left: 50px" />
            <p>Våra utbildningar riktar sig till personal inom företag som vill utveckla sin verksamhet med hjälp av modern teknik och väl beprövade arbetsmetoder. Personal som genomgår utbildning blir certifierade att använda våra verktyg och tillgång till vår support.</p>
             <%--<span class="buttonlight">Steg 1-3</span>--%><span class="buttonlight">Certifiering</span><a href="utbildning.aspx" class="button" style="float: left">Läs mer &raquo;</a>
        </div>
        <div class="services_block last">
            <h3>Tjänster</h3>
            <img src="Images/livboj.png" style="margin-left: 50px" />
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce diam lacus, pellentesque in vestibulum ac, malesuada scelerisque enim. Nunc volutpat nisi quis urna viverra euismod. Vivamus tempus sagittis leo.</p>
            <span class="buttonlight">Hosting</span><span class="buttonlight">Support</span><span class="buttonlight">Integration</span><a href="tjanster.aspx" class="button" style="float: left">Läs mer &raquo;</a>
        </div>
        <div style="clear: both"></div>
        <h2>Övriga tjänster</h2>
        <p>Vi erbjuder även Hosting, integration, certifiering, uppgraderingar med mer..</p>


        <%--<p>I arbetet med att begränsa omfattningen av sakskador i samband med sot och fukt i fastigheter är, tid, professionalism och god kommunikation, viktiga faktorer för att lyckas.    </p>
    <p>Eaztimate erbjuder mobila applikationer med en uppsättning verktyg som svarar upp mot dessa faktorer.</p>
    <p>Var för sig är, Jour, Byggskada och Lösöre, applikationer som underlättar arbetet med att bedöma, dokumentera och rapportera omfattningen av skadan. Tillsammans utgör de länkar i en mycket stark kedja mellan den drabbade, försäkringsbolaget och saneringsbolaget.  </p>--%>
    </div>

    <%-- <h1 class="huvud">Utmaning</h1>
    <div class="whitebox"><img src="Images/placeholder_utmaning.png" />
</div>
    <h1>Verktyg</h1>
    <div class="whitebox"><img src="Images/placeholder_verktyg.png" /></div>
    <div id="start_boxes"><h1 class="huvud">Applikationer</h1>
                    <ul>
                        <li class="box1">
                            <h3>Jour</h3>
                            
                            <img src="Images/logo_jour_box.png" />
                            

                            <a class="button" href="product_description_jour.aspx">Läs mer &raquo;</a>
                        </li>
                        <li class="box2">
                            <h3>Byggskada</h3>
                            <img src="Images/logo_bygg_box.png" />
                            
                            <a class="button" href="product_description_bygg.aspx">Läs mer &raquo;</a>
                        </li>
                        <li class="box3">
                            <h3>Lösöre</h3>
                            <img src="Images/logo_sak_box.png" />
                            
                            <a class="button" href="product_description_losore.aspx">Läs mer &raquo;</a>
                        </li>
                    </ul>
                    <div style="clear:both"></div>
                </div>--%>
</asp:Content>
