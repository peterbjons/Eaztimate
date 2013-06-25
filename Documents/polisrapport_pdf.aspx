<%@ Page Language="C#" AutoEventWireup="true" CodeFile="polisrapport_pdf.aspx.cs" Inherits="Documents_polisrapport_pdf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="polis.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="a4_paper ">
            <h1>Polisanmälan</h1>
            <h2>Klotter på fasad</h2>

            <table class="ao_nr">
                <tbody><tr><td style="width: 200px;"><span class="liten">Arbetsordernr</span>
                    <p class="stor">
                    <%: aonr %></p></td></tr></tbody>
            </table>            

            <table>
                <thead>
                    <tr>
                        <td colspan="2">Uppgifter om ägaren:</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 400px"><span class="liten">Ägare</span><p class="stor"><%: clientname %></p></td>
                        <td rowspan="2" style="width: 400px;"><span class="liten">Adress</span><p class="stor"><%: clientaddress %><br /><%: clientaddress2 %><br /><%: clientzipcode %> <%: clientcity %></p></td>
                    </tr>
                <tr>
                    <td><span class="liten">Organisationsnummer</span><p class="stor"><%: clientorgno %></p></td>
                </tr>
                    <tr>
                    <td><span class="liten">Kontaktperson</span><p class="stor"><%: clientcontact %></p></td>
                        <td><span class="liten">Fastighetsbeteckning</span><p class="stor"><%: buildingno %></p></td>
                </tr>
                </tbody>
            </table>
              <table>
                <thead>
                    <tr>
                        <td colspan="2">Uppgifter om brottet:</td>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td style="width: 400px"><span class="liten">Typ</span><p class="stor">Skadegörelse genom klotter på fasad</p></td>
                        <td rowspan="2" style="width: 400px;"><span class="liten">Adress</span>
                            <p class="stor">
                            <%: address %><br />
                            <%: zipcode %> <%: city %>
                            </p>
                        </td>
                    </tr>
                <tr>
                    <td><span class="liten">Upptäckt datum</span>
                        <p class="stor"><%: timestamp.ToString("yyyy-MM-dd") %></p>
                    </td>
                </tr>
                    <tr>
                    <td colspan="2"><span class="liten">Placering på byggnaden</span></td>
                  
                </tr>
                </tbody>
            </table>
              <table>
                <thead>
                    <tr>
                        <td colspan="2">Uppgifter om anmälaren:</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 400px"><span class="liten">Anmälare</span><p class="stor"><%: createdcompany %></p></td>
                        <td rowspan="2" style="width: 400px;"><span class="liten">Adress</span>
                            <p class="stor"><%: createdcompany %><br /><%: createdaddress %><br /><%: createdaddress2 %><br /><%: createdzipcode %> <%: createdcity %></p></td>
                    </tr>
                <tr>
                    <td><span class="liten">Organisationsnummer</span><p class="stor"><%: createdorgno %></p></td>
                </tr>
                    <tr>
                    <td><span class="liten">Kontaktperson</span><p class="stor"><%: createdby %></p></td>
                        <td><span class="liten">Telefon</span><p class="stor"><%: createdphone %></p></td>
                </tr>
                </tbody>
            </table>

            <p><%: createdcompany %> har skriftligen fullmakt från fastighetsägaren att göra denna anmälan. Se även bifogad fotobilaga.</p>
           <p style="font-size:14pt;margin-top: 60px;">Önskas ytterligare information i ärendet står vi gärna till Er tjänst<br /><%: createdcompany %></p>
            <p style="font-size:16pt"><%: createdby %></p>
        </div>

    </form>
</body>
</html>
