﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="contact">
        <h1>Contact</h1>
        <h2>
            If you need to come in contact with us, please contact one of the following persons
        </h2>
        <div class="contact_item">
            <div class="contact_photo">
                <img src="Images/micke.jpg" /></div>
            <div class="contact_details">
                <h3>Michael Hallberg</h3>
                <h4>projektledare</h4>
                <p>Phone: 070 123 45 67</p>
                <p>Email: michael@yard.se</p>
            </div>
            <div style="clear:both"></div>
        </div>
                <div class="contact_item">
            <div class="contact_photo">
                <img src="Images/noone.jpg" /></div>
            <div class="contact_details"> <h3>Ingen Ingensson</h3>
                <h4>specialist</h4>
                <p>Phone: 070 123 45 67</p>
                <p>Email: ingen@eaztimate.com</p></div>
                    <div style="clear:both"></div>
        </div>
    </div>

</asp:Content>

