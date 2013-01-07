<%@ Page Language="C#" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="Documents_report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .inspection_number {
            background-color: #000;
            color: #fff;
            font-weight: 300;
            font-size: 10pt;
            padding: 5px 7px;
            width: 205px;
            margin-top: 100px;
            margin-bottom: 30px;
        }

        h1 {
            font-weight: 300;
            margin-bottom: 50px;
            font-size: 34pt;
            font-family: 'Open Sans';
            
        }

        .block {
            width: 170px;
            font-size: 8pt;
            float: left;
            padding: 2px 7px 5px 7px;
        }

        .light {
            background-color: #85c8e0;
            color: #fff;
        }

        .dark {
            background-color: #1c80aa;
            color: #fff;
        }

        .divider-bottom {
            height: 20px;
            width: 100%;
        }

        .divider-side {
            width: 20px;
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="inspection_number">
            <asp:Literal ID="inspectionno" runat="server">Inspection number</asp:Literal>
        </div>
        <h1>
            <asp:Literal ID="description" runat="server">Description</asp:Literal></h1>
        <!-- Block light ROW: 1 -->
        <div class="block light">Skadetyp</div>
        <div class="divider-side"></div>
        <div class="block light">Skadeplats</div>
        <div class="divider-side"></div>
        <div class="block light">Skadedatum</div>
        <div class="divider-side"></div>
        <div class="block light">Självrisk</div>
        <div style="clear: both"></div>

        <div class="block">
            <asp:Literal ID="damagetype" runat="server" />
        </div>
        <div class="divider-side"></div>
        <div class="block">
            <asp:Literal ID="address" runat="server" />
        </div>
        <div class="divider-side"></div>
        <div class="block">
            <asp:Literal ID="damagedate" runat="server" />
        </div>
        <div class="divider-side"></div>
        <div class="block">4000kr</div>
        <div style="clear: both"></div>
        <div class="divider-bottom"></div>
        <!-- Block light ROW: 2 -->
        <div class="block light">Typ av byggnad</div>
        <div class="divider-side"></div>
        <div class="block light">Storlek</div>
        <div class="divider-side"></div>
        <div class="block light">Antal och ålder på boende</div>
        <div class="divider-side"></div>
        <div class="block light">Försäkringar</div>
        <div style="clear: both"></div>

        <div class="block">
            <asp:Literal ID="buildingtype" runat="server" />
        </div>
        <div class="divider-side"></div>
        <div class="block">
            <asp:Literal ID="size" runat="server" />
            kvm
        </div>
        <div class="divider-side"></div>
        <div class="block">
            <asp:Literal ID="inhabitants" runat="server" />
        </div>
        <div class="divider-side"></div>
        <div class="block">
            <asp:Literal ID="insurance" runat="server" />
        </div>
        <div style="clear: both"></div>
        <div class="divider-bottom"></div>
        <!-- Block light ROW: 3 -->
        <div class="block dark">Försäkringstagare</div>
        <div class="divider-side"></div>
        <div class="block dark">Anmälare</div>
        <div class="divider-side"></div>
        <div class="block dark">Kontaktperson</div>
        <div class="divider-side"></div>
        <div class="block dark">Försäkringsbolag</div>
        <div style="clear: both"></div>

        <div class="block">Per Persson<br />
                        Box 3<br />
                        791 21 Falun<br />
                        070- 123 33 66<br />
                        023-454 21
        </div>
        <div class="divider-side"></div>
        <div class="block"> Greta Svärd<br />
                        023 - 123 23
        </div>
        <div class="divider-side"></div>
        <div class="block">Greta Svärd<br />
                        023 - 123 23
        </div>
        <div class="divider-side"></div>
        <div class="block"> 03-453-99 LCR<br />
                        Lotta Croner<br />
                        023 - 930 10<br />
                        skador@dalarnas.se
        </div>
        <div style="clear: both"></div>
        <div class="divider-bottom"></div>
        <!-- Block light ROW: 4 -->
                <div class="block dark">Saneringsbara objekt</div>
        <div class="divider-side"></div>
        <div class="block dark">Icke saneringsbara object</div>
        <div class="divider-side"></div>
        <div class="block"></div>
        <div class="divider-side"></div>
        <div class="block dark">Totalt värde</div>
        <div style="clear: both"></div>

        <div class="block">2140st
        </div>
        <div class="divider-side"></div>
        <div class="block"> 901st
        </div>
        <div class="divider-side"></div>
        <div class="block">
        </div>
        <div class="divider-side"></div>
        <div class="block"> 03-453-99 LCR<br />
                        Lotta Croner<br />
                        023 - 930 10<br />
                        skador@dalarnas.se
        </div>
        <div style="clear: both"></div>
        <div class="divider-bottom"></div>

    </form>
</body>
</html>
