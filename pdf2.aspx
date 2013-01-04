<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="pdf2.cs" Inherits="pdf" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
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
                    <p>4000kr</p>
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
    <div class="a4_paper">
        <div class="room_paper">
            <div class="ensurance_company_logo">
                <img src="Images/forsak1.png" />
            </div>
            <div class="sanerings_company_logo">
                <img src="Images/forsak2.png" />
            </div>
            <div style="clear: both"></div>
            <h2 class="room_h2">Thomas rum</h2>
            <div class="room_images">
                <img src="Images/room1.png" /><img src="Images/room2.jpg" /><img src="Images/room3.jpg" /><img src="Images/room4.jpg" />
            </div>
            <ul class="dark">
                <li>
                    <h4>Rumstyp</h4>
                    <p>Sovrum</p>
                </li>
                <li>
                    <h4>Skadegrad</h4>
                    <p>Tungt nedsmutsat</p>
                </li>
                <li>
                    <h4>Storlek</h4>
                    <p>24kvm</p>
                </li>
                <li>
                    <h4>Antal objekt</h4>
                    <p>42</p>
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
            <table cellpadding="0px" cellspacing="0px">
                <thead>
                    <tr class="tr_green">
                        <td class="id">ID</td>
                        <td style="width: 6px;"></td>
                        <td class="type">Möbler</td>
                        <td style="width: 6px;"></td>
                        <td>Antal</td>
                        <td style="width: 6px;"></td>
                        <td class="comment">Beskrivning</td>
                        <td style="width: 6px;"></td>
                        <td>Inköpsår</td>
                        <td style="width: 6px;"></td>
                        <td class="price">Pris</td>
                        <td style="width: 6px;"></td>
                        <td class="price">Pris</td>
                        <td style="width: 6px;"></td>
                        <td class="price">Pris</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>001</td>
                        <td></td>
                        <td>Stol</td>
                        <td></td>
                        <td class="text-align-center">1</td>
                        <td></td>
                        <td>Ful som fan men säkert skön</td>
                        <td></td>
                        <td class="text-align-center">1999</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>

                    </tr>
                    <tr>
                        <td>001</td>
                        <td></td>
                        <td>Stol</td>
                        <td></td>
                        <td class="text-align-center">1</td>
                        <td></td>
                        <td>Ful som fan men säkert skön</td>
                        <td></td>
                        <td class="text-align-center">1999</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>


                    </tr>
                    <tr>
                        <td>001</td>
                        <td></td>
                        <td>Stol</td>
                        <td></td>
                        <td class="text-align-center">1</td>
                        <td></td>
                        <td>Ful som fan men säkert skön</td>
                        <td></td>
                        <td class="text-align-center">1999</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>


                    </tr>
                    <tr>
                        <td>001</td>
                        <td></td>
                        <td>Stol</td>
                        <td></td>
                        <td class="text-align-center">1</td>
                        <td></td>
                        <td>Ful som fan men säkert skön</td>
                        <td></td>
                        <td class="text-align-center">1999</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>


                    </tr>
                </tbody>

                <tfoot>
                    <tr>
                        <td colspan="14"></td>
                        <td>1200kr</td>
                    </tr>
                </tfoot>
            </table>
            <table cellpadding="0px" cellspacing="0px">
                <thead>
                    <tr class="tr_red">
                        <td class="id">ID</td>
                        <td style="width: 6px;"></td>
                        <td class="type">Möbler</td>
                        <td style="width: 6px;"></td>
                        <td>Antal</td>
                        <td style="width: 6px;"></td>
                        <td class="comment">Beskrivning</td>
                        <td style="width: 6px;"></td>
                        <td>Inköpsår</td>
                        <td style="width: 6px;"></td>
                        <td class="price">Pris</td>
                        <td style="width: 6px;"></td>
                        <td class="price">Pris</td>
                        <td style="width: 6px;"></td>
                        <td class="price">Pris</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>001</td>
                        <td></td>
                        <td>Stol</td>
                        <td></td>
                        <td class="text-align-center">1</td>
                        <td></td>
                        <td>Ful som fan men säkert skön</td>
                        <td></td>
                        <td class="text-align-center">1999</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>

                    </tr>
                    <tr>
                        <td>001</td>
                        <td></td>
                        <td>Stol</td>
                        <td></td>
                        <td class="text-align-center">1</td>
                        <td></td>
                        <td>Ful som fan men säkert skön</td>
                        <td></td>
                        <td class="text-align-center">1999</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>

                    </tr>
                    <tr>
                        <td>001</td>
                        <td></td>
                        <td>Stol</td>
                        <td></td>
                        <td class="text-align-center">1</td>
                        <td></td>
                        <td>Ful som fan men säkert skön</td>
                        <td></td>
                        <td class="text-align-center">1999</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>

                    </tr>
                    <tr>
                        <td>001</td>
                        <td></td>
                        <td>Stol</td>
                        <td></td>
                        <td class="text-align-center">1</td>
                        <td></td>
                        <td>Ful som fan men säkert skön</td>
                        <td></td>
                        <td class="text-align-center">1999</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td>1200kr</td>
                        <td></td>
                        <td class="accepted_prize">1200kr</td>

                    </tr>
                </tbody>

                <tfoot>
                    <tr>
                        <td colspan="14"></td>
                        <td>1200kr</td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <asp:Button ID="printbutton" runat="server" Text="Print" OnClick="printbutton_Click" />
    </div>
</asp:Content>

