<%@ Page Language="C#" AutoEventWireup="true" CodeFile="report.cs" Inherits="Documents_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="report.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="a4_paper">
        <div class="damage_summary_paper">
            <div class="ensurance_company_logo">
                <img src="Images/forsak1.png" />
            </div>
            <div class="sanerings_company_logo">
                <img src="Images/forsak2.png" />
            </div>
            <div style="clear: both"></div>
            <div class="inspection_number"><asp:Literal ID="inspectionno" runat="server" /></div>
            <h2><asp:Literal ID="description" runat="server" /></h2>

            <ul class="light">
                <li>
                    <h4>Skadetyp</h4>
                    <p><asp:Literal ID="damagetype" runat="server" /></p>
                </li>
                <li>
                    <h4>Skadeplats</h4>
                    <p><asp:Literal ID="address" runat="server" /></p>
                </li>
                <li>
                    <h4>Skadedatum</h4>
                    <p><asp:Literal ID="damagedate" runat="server" /></p>
                </li>
                <li>
                    <h4>Självrisk</h4>
                    <p>400000kr</p>
                </li>

            </ul>
            <div style="clear: both"></div>
            <ul class="light">
                <li>
                    <h4>Typ av byggnad</h4>
                    <p>Enplans med källare</p>
                </li>
                <li>
                    <h4>Storlek</h4>
                    <p><asp:Literal ID="size" runat="server"/> kvm</p>
                </li>
                <li>
                    <h4>Antal och ålder på boende</h4>
                    <p><asp:Literal id="inhabitants" runat="server" /></p>
                </li>
                <li>
                    <h4>Försäkringar</h4>
                    <p><asp:Literal ID="insurance" runat="server" /></p>
                </li>
            </ul>
            <div style="clear: both"></div>
            <ul class="dark">
                <li>
                    <h4>Försäkringstagare</h4>
                    <p>
                        Per Persson<br />
                        Box 3<br />
                        791 21 Falun<br />
                        070- 123 33 66<br />
                        023-454 21
                    </p>
                </li>
                <li>
                    <h4>Anmälare</h4>
                    <p>
                        Greta Svärd<br />
                        023 - 123 23
                    </p>
                </li>
                <li>
                    <h4>Kontaktperson</h4>
                    <p>
                        Greta Svärd<br />
                        023 - 123 23
                    </p>
                </li>
                <li>
                    <h4>Försäkringsbolag</h4>
                    <p>
                        03-453-99 LCR<br />
                        Lotta Croner<br />
                        023 - 930 10<br />
                        skador@dalarnas.se
                    </p>
                </li>
            </ul>
            <div style="clear: both"></div>
            <ul class="dark">
                <li>
                    <h4>Saneringsbara objekt</h4>
                    <p>2140st</p>
                </li>
                <li>
                    <h4>Icke saneringsbara object</h4>
                    <p>901st</p>
                </li>
                <li>&nbsp;
                </li>
                <li>
                    <h4>Totalt värde</h4>
                    <div class="saneringsbara_color red"></div>
                    <div class="saneringsbara_value">21243kr</div>
                    <div style="clear: both"></div>
                    <div class="non_saneringsbara_color green2"></div>
                    <div class="non_saneringsbara_value">24013kr</div>
                    <div style="clear: both"></div>
                    <div class="line">
                        <div class="saneringsbara_color"></div>
                        <div class="saneringsbara_value">43200kr</div>
                    </div>
                </li>
            </ul>
            <div style="clear: both"></div>
        </div>
    </div>

    </form>
</body>
</html>
