<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <h1>Kontakt</h1>
    <div class="whitebox" id="contact">
        <%--<img src="images/stock/banner-44.jpg" />--%>
        <%--<iframe width="940" height="294" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.se/maps?f=q&amp;source=s_q&amp;hl=sv&amp;geocode=&amp;q=Digitalyard+Sverige+AB,+Kaserng%C3%A5rden,+Falun&amp;aq=0&amp;oq=digital&amp;sll=60.604819,15.665629&amp;sspn=0.169018,0.618668&amp;t=m&amp;ie=UTF8&amp;hq=Digitalyard+Sverige+AB,&amp;hnear=Kaserng%C3%A5rden,+791+40+Falun&amp;ll=60.606109,15.649724&amp;spn=0.006193,0.040298&amp;z=15&amp;output=embed"></iframe>--%>
<%--        <iframe width="940" height="294" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.se/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Digitalyard+Sverige+AB,+Kaserng%C3%A5rden,+Falun&amp;aq=0&amp;oq=digital&amp;sll=61.066205,14.438327&amp;sspn=4.387437,14.27124&amp;t=h&amp;ie=UTF8&amp;hq=&amp;hnear=&amp;iwloc=A&amp;ll=60.606256,15.649781&amp;spn=0.006295,0.006295&amp;output=embed"></iframe>
        <br />--%>
        <img src="Images/contact.jpg" />
        <%--<div class="contact_item">
            <div class="contact_photo">
                <img src="Images/micke.jpg" /></div>
            <div class="contact_details">
                <h3>Michael Hallberg</h3>
                <h4>projektledare</h4>
                <p>Telefon: 070 123 45 67</p>
                <p>Email: michael@yard.se</p>
            </div>
            <div style="clear:both"></div>
        </div>
                <div class="contact_item">
            <div class="contact_photo">
                <img src="Images/noone.jpg" /></div>
            <div class="contact_details"> <h3>Ingen Ingensson</h3>
                <h4>specialist</h4>
                <p>Telefon: 070 123 45 67</p>
                <p>Email: ingen@eaztimate.com</p></div>
                    <div style="clear:both"></div>
        </div>--%>
        <div style="float: left; width: 560px; margin-right: 30px">
            <h2>Kontakt</h2>
            <p>Ni kan nå oss på telefon vardagar mellan 09.00 - 11.00 samt 14.00 - 16.00.  Annars går det bra att maila, vi är snabba på att svara!  </p>
            <%--<div class="formbox">
                Namn *
                <input type="text" />
            </div>
            <div class="formbox">
                Epost *
                <input type="text" />
            </div>
            <div class="formbox last">
                Rubrik *
                <input type="text" />
            </div>
            Meddelande *
            <textarea></textarea>
            <input type="submit" value="Skicka" class="big_button"/>--%>
        </div>
        <div style="float: left; width: 350px;">
            <h2>Kontaktinformation</h2>
            <ul class="contact">
                <li style="background-image: url(Images/icon_20_location.png);">Eaztimate, Kaserngården 4, Falun</li>
                <li style="background-image: url(Images/icon_20_phone.png);">023-79 75 90</li>
                <li style="background-image: url(Images/icon_20_mail.png);"><a href="mailto:support@eaztimate.se">support@eaztimate.se</a></li>
                <li style="background-image: url(Images/icon_20_mail.png);"><a href="mailto:info@eaztimate.se">info@eaztimate.se</a></li>
            </ul>

        </div>
        <div style="clear: both"></div>

    </div>


</asp:Content>

