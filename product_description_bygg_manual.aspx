<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="product_description_bygg_manual.aspx.cs" Inherits="product_description_bygg_manual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../Scripts/bjqs-1.3.js"></script>
    <link href="../Content/bjqs.css" rel="stylesheet" />
     <script>
         jQuery(document).ready(function ($) {
             $('#manual_byggskada').bjqs({
                 'height': 600,
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      <h1>Manual Byggskada</h1>
    <div class="whitebox">
       
        <div id="manual_byggskada" class="manual">
    <ul class="bjqs">
        <li class="slide0">
            <img src="Images/manual_vy1.png" />
           <h2>Menyfältet</h2><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec mattis mauris, tincidunt porttitor nunc. Proin et viverra felis. Etiam non aliquam nulla. Etiam tincidunt in arcu sit amet aliquet. Proin cursus velit quis turpis tristique, eu sodales nunc euismod. Donec vulputate purus ultricies iaculis pellentesque. Fusce rutrum mauris ac dui ultricies tristique. Nulla facilisi. Suspendisse non diam vitae odio volutpat pretium. Etiam consectetur ullamcorper sapien ac scelerisque. Pellentesque eu urna et lorem tincidunt congue sed non massa. Praesent ac tincidunt lacus. Vivamus faucibus erat a lacus malesuada bibendum. Curabitur volutpat leo at nisl dictum, id congue odio bibendum. Aliquam ut enim id tellus euismod ornare facilisis sed magna. Nulla pharetra egestas pharetra.</p>
        </li>
        <li class="slide1">

        </li>
        <li class="slide2">

        </li>
        <li class="slide3"

        </li>
        <li class="slide4">

        </li>
        <li class="slide5">

        </li>
        <li class="slide6">

        </li>
        <li class="slide7">

        </li>
        <li class="slide8">

        </li>
        <%--<li class="slide9"><div class="uppdrag_desc">Åter på kontoret efter avslutat fältarbete kan små justeringar/kompletteringar göras i OCAB skador och byggskaderapporten är klar. Inga papper och handgjorda skisser att hålla reda på och framför allt inget tidsödande dubbelarbete. </div></li>--%>
        
    </ul>
</div>

     
    </div>



</asp:Content>

