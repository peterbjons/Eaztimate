﻿<%@ Page Title="Create Company" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="admin_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="AdminMainContent" runat="Server">
    <div class="forms">
        <h1><%: Title %></h1>
        <h2>Use the form below to create a new company</h2>
        <div style="float: left; width: 50%">
            <asp:TextBox runat="server" ID="CompanyNameText" placeholder="Company name" />
            <asp:TextBox runat="server" ID="CompanyAdress1Text" placeholder="Adress 1" />
            <asp:TextBox runat="server" ID="CompanyAdress2Text" placeholder="Adress 2" />
            <asp:TextBox runat="server" ID="CompanyZipText" placeholder="Zip code" />
            <asp:TextBox runat="server" ID="CompanyCityText" placeholder="City" />
        </div>
        <div style="float: left; width: 50%">
            <asp:TextBox runat="server" ID="CompanyEmailText" placeholder="Email" />
            <asp:TextBox runat="server" ID="CompanyPhoneText" placeholder="Phone" />
            <asp:Button ID="CompanyCreate" runat="server" Text="Create company" />
        </div>
        <div style="clear: both"></div>
        <h2 style="margin-top: 20px;">List of people in this company</h2>
        <table class="companycreate jourtable">
            <thead>
                <tr>
                    <th class="dark">Name</th>
                    <th class="dark">Email</th>
                    <th class="dark">Bulle</th>
                    <th class="dark">Kaka</th>
                    <th class="dark">Fisk</th>
                </tr>
            </thead>
            <tr class="user_level1">
                <td>Märtin Rossvalds</td>
                <td>m.rossvalds@tele2.se</td>
                <td>Kanel</td>
                <td>Ballerina</td>
                <td>Ansjovis</td>
            </tr>
            <tr class="user_level2">
                <td>Märtin Rossvalds</td>
                <td>m.rossvalds@tele2.se</td>
                <td>Kanel</td>
                <td>Ballerina</td>
                <td>Ansjovis</td>
            </tr>
            <tr class="user_level3">
                <td>Märtin Rossvalds</td>
                <td>m.rossvalds@tele2.se</td>
                <td>Kanel</td>
                <td>Ballerina</td>
                <td>Ansjovis</td>
            </tr>
                        <tr class="user_level4">
                <td>Märtin Rossvalds</td>
                <td>m.rossvalds@tele2.se</td>
                <td>Kanel</td>
                <td>Ballerina</td>
                <td>Ansjovis</td>
            </tr>
            <tr class="user_level4">
                <td>Märtin Rossvalds</td>
                <td>m.rossvalds@tele2.se</td>
                <td>Kanel</td>
                <td>Ballerina</td>
                <td>Ansjovis</td>
            </tr>
            <tr class="user_level4">
                <td>Märtin Rossvalds</td>
                <td>m.rossvalds@tele2.se</td>
                <td>Kanel</td>
                <td>Ballerina</td>
                <td>Ansjovis</td>
            </tr>

        </table>
    </div>
</asp:Content>

