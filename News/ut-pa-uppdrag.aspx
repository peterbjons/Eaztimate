<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ut-pa-uppdrag.aspx.cs" Inherits="ut_pa_uppdrag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../Scripts/bjqs-1.3.js"></script>
    <link href="../Content/bjqs.css" rel="stylesheet" />
    <script>
        jQuery(document).ready(function ($) {
            $('#uppdrag').bjqs({
                'height': 655,
                'width': 940,
                'responsive': true,
                'animtype': 'slide',
                'automatic': false,
                'nexttext': ' ',
                'prevtext': ' ',
                'showmarkers': false,
               

            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Eaztimate följer med ut på en skada</h1>
    <div class="whitebox">
       
        <div id="uppdrag">
    <ul class="bjqs">
        <li class="slide0"><div class="uppdrag_desc">Följ med Eaztimate ut på uppdrag, använd pilarna för att navigera dig genom bildspelet.</div></li>
        <li class="slide1"><div class="uppdrag_desc">Magnus börjar dagen med att starta mobilen och synkronisera  EZ Byggskada med OCAB skador. Nya uppdrag som lagts i OCAB skador listas i EZ Byggskada.  </div></li>
        <li class="slide2"><div class="uppdrag_desc">Det första Magnus gör är att klicka på ”ring upp” knappen bredvid fastighetsägarens telefonnummer och får bekräftat att han kan komma in i fastigheten.</div></li>
        <li class="slide3"><div class="uppdrag_desc">Med hjälp av GPS funktionen  i EZ byggskada kommer Magnus rätt till varje skada och slipper onödiga telefonsamtal och felkörningar</div></li>
        <li class="slide4"><div class="uppdrag_desc">Med mätutrustning, verktyg och EZ-appen är det klart att påbörja skadedokumentationen</div></li>
        <li class="slide5"><div class="uppdrag_desc">För att hantera en byggskada krävs att stora mängder information samlas in. I EZ-appen  gås rum för rum  igenom , 
fotografier, mått, mätvärden , konstruktioner och material samlas in systematiskt och hamnar direkt på rätt rum.</div></li>
        <li class="slide6"><div class="uppdrag_desc">Fuktmätning. Alla mätvärden direkt in på rätt plats. Inget dubbelarbete</div></li>
        <li class="slide7"><div class="uppdrag_desc">Snabbt , enkelt, rätt . Mått på alla rum. Konstruktioner, mått och material matas enkelt in enligt förutbestämda mallar.</div></li>
        <li class="slide8"><div class="uppdrag_desc">När fältarbetet är avslutat synkas informationen upp och allt är tillgängligt för alla inblandade parter, skadereglerare, byggare, försäkringstagare
och  den egna arbetsledningen. Magnus är redo att ta sig an nästa uppdrag. </div></li>
        <li class="slide9"><div class="uppdrag_desc">Åter på kontoret efter avslutat fältarbete kan små justeringar/kompletteringar göras i OCAB skador och byggskaderapporten är klar. Inga papper och handgjorda skisser att hålla reda på och framför allt inget tidsödande dubbelarbete. </div></li>
        
    </ul>
</div>

     
    </div>
</asp:Content>

