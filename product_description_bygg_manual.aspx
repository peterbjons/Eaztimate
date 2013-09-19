<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="product_description_bygg_manual.aspx.cs" Inherits="product_description_bygg_manual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        //$(document).ready(function() {
        //    $('#btn_menyfaltet').click(function () {
        //        $('#menyfaltet').toggle('slow', function () {
        //            // Animation complete.
        //        });
        //    })
        //});

        function show(id) {
            $('.vy').hide();
            $(id).show();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h1>Manual Byggskada</h1>
    <div class="whitebox">
        <div class="help">
            <div class="app_col1">
                <h2>Hjälpavsnitt</h2>
                <ul>
                    <li>Kom igång
                        <ul>
                            <li onclick="show('#laddaner');">Ladda ner</li>
                            <li onclick="show('#installation');">Installation</li>
                            <li onclick="show('#android');">Android</li>
                            <li onclick="show('#kommaigang');">Komma igång</li>
                        </ul>
                    </li>
                    <li onclick="show('#grundlaggande');">Grundläggande
                   <ul>
                       <li onclick="show('#menyfaltet');">Menyfältet</li>
                       <li onclick="show('#verktygsfaltet');">Verktygsfältet</li>
                       <li onclick="show('#huvudvy');">Huvudvy</li>
                       <li onclick="show('#listor');">Listor</li>
                   </ul>
                    </li>
                </ul>
                <ul>
                    <li>Byggskada
                   <ul>
                       <li onclick="show('#skapanytt');">Skapa nytt ärende</li>
                       <li onclick="show('#laggtillrum');">Lägg till/Ta bort rum</li>
                       <li onclick="show('#olikformatrum');">Olikformat rum</li>
                       <li onclick="show('#laggtillobjekt');">Lägg till objekt</li>
                       <li onclick="show('#klar');">Synkning</li>
                   </ul>
                    </li>
                    <li>Ikoner
                        <ul>
                            <li onclick="show('#ikoner');">Ikoner</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="app_col2">

                <div class="vy startvy">
                    <h2>Manual för appen byggskada</h2>
                    <p>Introtext till manual</p>
                </div>
                <div class="vy" id="laddaner">
                    <img src="Images/help_download2.png" />
                    <h2>Ladda ner appen</h2>
                    <p>Logga in med ditt användarnamn och lösenord på Eaztimate-admin via din Android-telefon. Ladda sen ner appen genom att trycka på "ladda ner app" via menyn.</p>
                </div>
                <div class="vy" id="installation">
                    <img src="Images/help_download.png" /><h2>Installation</h2><p>Installera appen genom att följa instruktionerna i telefonen, när appen har installerats hittar du den på en av startpanelerna.</p></div>
                <p></p>
                <div class="vy" id="android">
                    <img src="Images/help_android.png" />
                    <h2>Android</h2></div>
                <div class="vy" id="kommaigang">
                    <img src="Images/help_komigang.png" /><h2>Komma igång</h2><p>När appen är installerad öppnas den via ikonen på startpanelen.</p></div>

                <div class="vy" id="grundlaggande">
                    <h2>Grundläggande</h2>
                    <p>Halla</p>
                </div>
                <div class="vy" id="menyfaltet">

                    <img src="Images/manual_vy1.png" /><h2>Menyfältet</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec mattis mauris, tincidunt porttitor nunc. Proin et viverra felis. Etiam non aliquam nulla. Etiam tincidunt in arcu sit amet aliquet. Proin cursus velit quis turpis tristique, eu sodales nunc euismod. Donec vulputate purus ultricies iaculis pellentesque. Fusce rutrum mauris ac dui ultricies tristique. Nulla facilisi. Suspendisse non diam vitae odio volutpat pretium. Etiam consectetur ullamcorper sapien ac scelerisque. Pellentesque eu urna et lorem tincidunt congue sed non massa. Praesent ac tincidunt lacus. Vivamus faucibus erat a lacus malesuada bibendum. Curabitur volutpat leo at nisl dictum, id congue odio bibendum. Aliquam ut enim id tellus euismod ornare facilisis sed magna. Nulla pharetra egestas pharetra.</p>
                </div>
                <div class="vy" id="verktygsfaltet">

                    <img src="Images/manual_vy2.png" /><h2>Verktygsfältet</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec mattis mauris, tincidunt porttitor nunc. Proin et viverra felis. Etiam non aliquam nulla. Etiam tincidunt in arcu sit amet aliquet. Proin cursus velit quis turpis tristique, eu sodales nunc euismod. Donec vulputate purus ultricies iaculis pellentesque. Fusce rutrum mauris ac dui ultricies tristique. Nulla facilisi. Suspendisse non diam vitae odio volutpat pretium. Etiam consectetur ullamcorper sapien ac scelerisque. Pellentesque eu urna et lorem tincidunt congue sed non massa. Praesent ac tincidunt lacus. Vivamus faucibus erat a lacus malesuada bibendum. Curabitur volutpat leo at nisl dictum, id congue odio bibendum. Aliquam ut enim id tellus euismod ornare facilisis sed magna. Nulla pharetra egestas pharetra.</p>
                </div>
                <div class="vy" id="huvudvy">

                    <img src="Images/manual_vy3.png" /><h2>Huvudvy</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec mattis mauris, tincidunt porttitor nunc. Proin et viverra felis. Etiam non aliquam nulla. Etiam tincidunt in arcu sit amet aliquet. Proin cursus velit quis turpis tristique, eu sodales nunc euismod. Donec vulputate purus ultricies iaculis pellentesque. Fusce rutrum mauris ac dui ultricies tristique. Nulla facilisi. Suspendisse non diam vitae odio volutpat pretium. Etiam consectetur ullamcorper sapien ac scelerisque. Pellentesque eu urna et lorem tincidunt congue sed non massa. Praesent ac tincidunt lacus. Vivamus faucibus erat a lacus malesuada bibendum. Curabitur volutpat leo at nisl dictum, id congue odio bibendum. Aliquam ut enim id tellus euismod ornare facilisis sed magna. Nulla pharetra egestas pharetra.</p>
                </div>
                <div class="vy" id="listor">

                    <img src="Images/manual_vy4.png" /><h2>Listor</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus nec mattis mauris, tincidunt porttitor nunc. Proin et viverra felis. Etiam non aliquam nulla. Etiam tincidunt in arcu sit amet aliquet. Proin cursus velit quis turpis tristique, eu sodales nunc euismod. Donec vulputate purus ultricies iaculis pellentesque. Fusce rutrum mauris ac dui ultricies tristique. Nulla facilisi. Suspendisse non diam vitae odio volutpat pretium. Etiam consectetur ullamcorper sapien ac scelerisque. Pellentesque eu urna et lorem tincidunt congue sed non massa. Praesent ac tincidunt lacus. Vivamus faucibus erat a lacus malesuada bibendum. Curabitur volutpat leo at nisl dictum, id congue odio bibendum. Aliquam ut enim id tellus euismod ornare facilisis sed magna. Nulla pharetra egestas pharetra.</p>
                </div>

                <div class="vy" id="skapanytt">

                    <img src="Images/manual_bygg_vy1.png" /><h2>Skapa nytt ärende</h2>
                    <p>
                        Tryck på skapa ny för att skapa nytt skadeärende.<br />
                        Fyll sedan i fältet Arbetsordernummer och tryck “Hämta”, finns ärendet loggat i systemet hämtar appen automatiskt hem uppgifter. Tryck sedan på “Ny skaderapport” för att verkställa.
                    </p>
                    <div class="col1">
                        <h2>Lista</h2>
                        <p>Dina ärenden sparas i listan på startvyn till Eaztimate Bygg. För att gå in på ett ärende klickar du på det i listan. För att radera ett ärende håller du in på det tills en dialogruta öppnas för bekräftelse.</p>
                        <div class="icon_desc">
                            <img src="Images/help_login.png" /><p>Logga in till ditt användarkonto för att kunna synka ärenden med bakomliggande databas</p>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div class="col2">
                        <h2>Ärendet</h2>
                        <p>
                            När du skapat ditt ärende och går in på det har du alltid snabb tillgång till det nödvändigaste.
Allt i Eaztimates appar är byggt med användarvänligheten i fokus. Här arbetar man uppifrån och ner.
                        </p>
                        <div class="icon_desc">
                            <img src="Images/help_photo.png" /><p>För att ta foton trycker du bara på fotoikonen</p>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
                <div class="vy" id="laggtillrum">

                    <img src="Images/manual_bygg_vy2.png" /><h2>Lägg till/Ta bort rum</h2>
                    <p>
                        När du först öppnar ett ärende kommer du till rumsöversikten, här börjar man med att skapa upp rum. Klicka på fliken “Lägg till/Ta bort rum”. Du kan nu lägga till och ta bort rum. 
Klicka på det rum du vill skapa. Och håll in på det rum du vill ta bort (alternativt tryck på krysset om det blir fel när du skapar upp rum). När du är klar sparar du genom att trycka på spara (disketten) i verktygsmenyn.
                    </p>
                    <div class="col1">
                        <h2>Editera rum</h2>
                        <p>I rumsöversikten, välj ett rum i listan. Mata in rumsdata, ta foto och spara. Väljer du Olikformigt rum får du mäta med det inbyggda verktyget. </p>
                        <h2>Status på rum</h2>
                        <p>I rumslistan visas de rum du har lagt till, efter namnet syns två ikoner som visar om rummet har bild / rumsdata</p>
                    </div>
                    <div class="col2">
                        <div class="icon_desc">
                            <img src="Images/help_addobject.png" />
                            <p>När du är klar med rummet kan du börja lägga in objekt i det genom att klicka på ikonen uppe i höger hörn</p>
                            <div style="clear: both"></div>
                        </div>
                        <div class="icon_desc">
                            <img src="Images/help_save.png" />
                            <p>Spara när du är klar genom att trycka på “Spara”-ikonen</p>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
                <div class="vy" id="olikformatrum">

                    <img src="Images/manual_bygg_vy3.png" />
                    <h2>Olikformat rum</h2>
                    <p>
                        I första vyn för olikformat rum fyller du i måtten på rummet, mät avstånd från till hörn och ange om det är ett inner-/ytterhörn. Appen räknar sedan ut storleken på rummet. Klicka på ikonen uppe i höger hörn för att se hur ritningen ser ut.<br />
                        För att lägga till mätpunkter klickar man på ikonerna uppe i höger hörn och flyttar runt punkterna.
                    </p>
                    <h2>Ikoner</h2>
                    <div class="col1">
                        <div class="icon_desc">
                            <img src="Images/help_blueprint.png" /><p>För att gå till ritningen klicka på “Ritning”-ikonen</p>
                            <div style="clear: both"></div>
                        </div>
                        <div class="icon_desc">
                            <img src="Images/help_measurepoint.png" /><p>Mätpunkt, håll in för att dra mätpunkten till korrekt placering</p>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div class="col2">
                        <div class="icon_desc">
                            <img src="Images/help_addpoint.png" /><p>Lägg till ny mätpunkt</p>
                            <div style="clear: both"></div>
                        </div>
                        <div class="icon_desc">
                            <img src="Images/help_removepoint.png" /><p>Ta bort senast tillagda mätpunkt</p>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div style="clear: both"></div>
                </div>
                <div class="vy" id="laggtillobjekt">

                    <img src="Images/manual_bygg_vy4.png" /><h2>Lägg till objekt</h2>
                    <p>När du valt rum i menyn kan du börja lägga till objekt, du klickar dig ner i en hierarkisk lista i vänsterkolumnen. När du kommit tillräckligt djupt dyker det upp textfält som du fyller i. </p>
                    <h2>Lägga till / Kopiera rum</h2>
                    <div class="icon_desc">
                        <img src="Images/help_addroom.png" /><p>Behöver du lägga till fler rum klickar du på “Lägg till rum”-ikonen uppe i menyn</p>
                        <div style="clear: both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_copyroom.png" /><p>Det finns även möjlighet att kopiera ett rum direkt, detta gör du genom att klicka på “Kopiera rum”-ikonen, välj sedan i den ruta som dyker upp vilket rum du vill kopiera</p>
                        <div style="clear: both"></div>
                    </div>
                </div>
                <div class="vy" id="klar">

                    <img src="Images/manual_bygg_vy5.png" />
                    <h2>Synka</h2>
                    <p>
                        När du är klar går du tillbaka till översikten och väljer att synka ärendet. I färgmarkeringen på varje ärende ser man snabbt status på sina ärenden. Där Blå färg är “Nytt ärende”, Grön färg är “Synkat ärende” och där gul är “Pågående ärende”.
                        <br />
                        Du kan när som helst gå tillbaka och ändra i ett ärende via Översiktsvyn.
                    </p>
                    <h2>Ikoner</h2>
                    <div class="icon_desc">
                        <img src="Images/help_login.png" /><p>Logga in till ditt användarkonto för att kunna synka ärenden med bakomliggande databas</p>
                        <div style="clear: both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_synk.png" /><p>Synka ärendet när du är klar med det, ärendet synkas då med databasen.</p>
                        <div style="clear: both"></div>
                    </div>
                    <h2>Status</h2>
                    <div style="border-left: solid 10px #85c8e0; padding: 5px 5px 5px 10px; margin: 5px 0px; width: 200px; float: left;">Blå = Nytt ärende</div>
                    <div style="border-left: solid 10px #39B54A; padding: 5px 5px 5px 10px; margin: 5px 0px; width: 200px; float: left;">Grön = Synkat ärende</div>
                    <div style="border-left: solid 10px #FFd040; padding: 5px 5px 5px 10px; margin: 5px 0px; width: 200px; float: left;">Gul = Pågående ärende</div>
                </div>

                <div class="vy" id="ikoner">
                    <h2>Ikoner</h2>
                    <p>Hittat en ikon du inte riktigt känner igen? Här förklarar vi de allra vanligaste ikonerna.</p>
                    <div class="icon_desc">
                        <img src="Images/help_addobject.png" /><p>När du är klar med rummet kan du börja lägga in objekt i det genom att klicka på ikonen uppe i höger hörn</p>
                        <div style="clear: Both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_addpoint.png" /><p>Lägg till ny mätpunkt</p>
                        <div style="clear: Both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_addroom.png" /><p>När du är klar med rummet kan du börja lägga in objekt i det genom att klicka på ikonen uppe i höger hörn</p>
                        <div style="clear: Both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_blueprint.png" /><p>För att gå till ritningen klicka på “Ritning”-ikonen</p>
                        <div style="clear: Both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_copyroom.png" /><p>Det finns även möjlighet att kopiera ett rum direkt, detta gör du genom att klicka på “Kopiera rum”-ikonen, välj sedan i den ruta som dyker upp vilket rum du vill kopiera</p>
                        <div style="clear: Both"></div>
                    </div>

                    <div class="icon_desc">
                        <img src="Images/help_login.png" /><p>Logga in till ditt användarkonto för att kunna synka ärenden med bakomliggande databas</p>
                        <div style="clear: Both"></div>
                    </div>

                    <div class="icon_desc">
                        <img src="Images/help_measurepoint.png" /><p>Mätpunkt, håll in för att dra mätpunkten till korrekt placering</p>
                        <div style="clear: Both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_photo.png" /><p>För att ta foton trycker du bara på fotoikonen</p>
                        <div style="clear: Both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_removepoint.png" /><p>Ta bort senast tillagda mätpunkt</p>
                        <div style="clear: Both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_save.png" /><p>Spara när du är klar genom att trycka på “Spara”-ikonen</p>
                        <div style="clear: Both"></div>
                    </div>
                    <div class="icon_desc">
                        <img src="Images/help_synk.png" /><p>Synka ärendet när du är klar med det, ärendet synkas då med databasen.</p>
                        <div style="clear: Both"></div>
                    </div>



                </div>
        </div>
        <div style="clear: both"></div>

    </div>
    </div>



</asp:Content>

