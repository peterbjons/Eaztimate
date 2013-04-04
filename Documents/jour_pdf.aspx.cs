using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class Documents_jour_pdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int jourid= 0;
        int contactaction = 0;
        int.TryParse(Request.QueryString["id"] ?? "32", out jourid);

        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,(SELECT TOP 1 timestamp FROM jour_log WHERE jourid=@1 ORDER BY timestamp ASC) timestamp,(SELECT TOP 1 x.image FROM jourimage x WHERE x.jourid=@1 order by image) jourimage FROM jour a WHERE jourid=@1;SELECT title FROM jour_room WHERE jourid=@1", jourid)) {
            if (reader.Read()) {
                insuranceno.Text = reader.GetString(reader.GetOrdinal("insurancenumber"));
                insurancetype.Text = reader.GetString(reader.GetOrdinal("insurancetype"));
                lccaseid.Text = reader.GetString(reader.GetOrdinal("lccaseid"));
                damagetype.Text = reader.GetString(reader.GetOrdinal("damagetype"));
                jourdate.Text = logdate.Text = reader.GetDateTime(reader.GetOrdinal("timestamp")).ToString("yyyy-MM-dd");
                contactname.Text = reader.GetString(reader.GetOrdinal("contactname"));
                contactaddress.Text = contactaddress_header.Text = reader.GetString(reader.GetOrdinal("contactaddress"));
                contactpn.Text = reader.GetString(reader.GetOrdinal("contactpersonalnumber"));
                if (reader.GetString(reader.GetOrdinal("contactaddress2")).Length > 1) {
                    contactaddress2.Text = reader.GetString(reader.GetOrdinal("contactaddress2")) + "<br/>";
                }
                contactzipcode.Text = reader.GetString(reader.GetOrdinal("contactzipcode"));
                contactcity.Text = contactcity_header.Text = reader.GetString(reader.GetOrdinal("contactcity"));
                if (reader.GetString(reader.GetOrdinal("contactphone1")).Length > 1) {
                    contactphone1.Text = reader.GetString(reader.GetOrdinal("contactphone1")) + "<br/>";
                }
                if (reader.GetString(reader.GetOrdinal("contactphone2")).Length > 1) {
                    contactphone2.Text = reader.GetString(reader.GetOrdinal("contactphone2")) + "<br/>";
                }
                syncemail.Text = reader.GetString(reader.GetOrdinal("syncemail"));
                damagedescription.Text = damagedescription_case2.Text = reader.GetString(reader.GetOrdinal("damagedescription"));

                contactaction = reader.GetInt32(reader.GetOrdinal("contactaction"));

                actiondesc.Text = reader.GetString(reader.GetOrdinal("actiondescription"));
                entrepeneur.Text = reader.GetString(reader.GetOrdinal("externalentrepeneur"));

                skalskyddlit.Text = (reader.GetBoolean(reader.GetOrdinal("building_lockable")) ? "Nedsatt" : "Ej påverkad");
                elvarmelit.Text = (reader.GetBoolean(reader.GetOrdinal("building_power")) ? "Nedsatt" : "Ej påverkad");
                klimatskarmlit.Text = (reader.GetBoolean(reader.GetOrdinal("building_climatesafe")) ? "Nedsatt" : "Ej påverkad");
                funktionlit.Text = (reader.GetBoolean(reader.GetOrdinal("building_function")) ? "Nedsatt i berörda utrymmen" : "Ej påverkad");

                if(!reader.IsDBNull(reader.GetOrdinal("jourimage"))) {
                    jourimage.Src = AmazonHandler.GetPrivateImageJour(reader.GetString(reader.GetOrdinal("journo")) + "/" + reader.GetString(reader.GetOrdinal("jourimage")));
                } else {
                    jourimage.Visible = false;
                }

                StringBuilder sb = new StringBuilder();
                if (reader.GetBoolean(reader.GetOrdinal("action_otherliving"))) {
                    sb.Append("<li>Tillfälligt boende</li>");
                }
                if (reader.GetBoolean(reader.GetOrdinal("action_cash"))) {
                    sb.Append("<li>Kontanter</li>");
                }
                if (reader.GetBoolean(reader.GetOrdinal("action_transport"))) {
                    sb.Append("<li>Transport</li>");
                }
                if (reader.GetBoolean(reader.GetOrdinal("action_helpcontact"))) {
                    sb.Append("<li>Förmedling av kontakt vid ej ersättningsbar skada</li>");
                }
                otherneeds.Text = sb.ToString();

                switch (contactaction) {
                    case 1:
                        action.Text = "Telefonsupport";
                        break;
                    case 2:
                        action.Text = "Försäkringstagaren löser problemet";
                        break;
                    case 3:
                        action.Text = "Insats Ocab";
                        break;
                    case 4:
                        action.Text = "Insats annan entrepenör";
                        break;
                }
            }
            reader.NextResult();
            StringBuilder strb = new StringBuilder();
            while (reader.Read()) {
                strb.Append((strb.Length == 0 ? "" : ", "));
                strb.Append(reader.GetString(reader.GetOrdinal("title")));
            }
            roomslist.Text = strb.ToString();
        }

        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("image", typeof(string)));        
        using (SqlDataReader reader = SQL.ExecuteQuery("SELECT TOP 3 a.roomid, (SELECT TOP 1 image FROM jour_roomimage x WHERE x.roomid=a.roomid ORDER BY roomimage ) image,b.journo FROM jour_room a LEFT JOIN jour b ON a.jourid=b.jourid WHERE a.jourid=@1", jourid)) {
            while (reader.Read()) {
                string url = AmazonHandler.GetPrivateImageJour(reader.GetString(reader.GetOrdinal("journo")) + "/" + reader.GetString(reader.GetOrdinal("image")));
                dt.Rows.Add(url);
            }
        }
        jourimagerepeater.DataSource = dt;
        jourimagerepeater.DataBind();

        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT * FROM jour_log WHERE jourid=@1 ORDER BY timestamp ASC", jourid)) {
            logrepeater.DataSource = reader;
            logrepeater.DataBind();
        }

        if (contactaction == 3) {
            using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT * FROM jour_room WHERE jourid=@1 ORDER BY roomid ASC", jourid)) {
                roomrepeater.DataSource = reader;
                roomrepeater.DataBind();
            }
            actiondescdiv.Visible = actiondescdiv2.Visible = false;
            entrepreneurdiv.Visible = false;
        } else {
            room_pages.Visible = false;
            imagetext.Visible = false;
            damagelistdiv.Visible = false;
            if (contactaction != 4) {
                entrepreneurdiv.Visible = false;
            }
        }
    }
   
    protected void roomrepeater_ItemDataBound(object sender, RepeaterItemEventArgs e) {

        RepeaterItem item = e.Item;
        HiddenField roomidHidden = (HiddenField)item.FindControl("roomidHidden");
        int roomid=0;
        if (roomidHidden != null) {
            int.TryParse(roomidHidden.Value, out roomid);
        }

        try {
            if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem)) {
                DataTable dt = new DataTable();
                dt.Columns.Add(new DataColumn("image", typeof(string)));
                using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.*,c.journo FROM jour_roomimage a LEFT JOIN jour_room b on a.roomid=b.roomid LEFT JOIN jour c ON b.jourid=c.jourid WHERE a.roomid=@1", roomid)) {
                    while (reader.Read()) {
                        string url = AmazonHandler.GetPrivateImageJour(reader.GetString(reader.GetOrdinal("journo")) + "/" + reader.GetString(reader.GetOrdinal("image")));
                        dt.Rows.Add(url);
                    }
                }
                Repeater ImageRepeater = (Repeater)item.FindControl("roomimagerepeater");
                ImageRepeater.DataSource = dt;
                ImageRepeater.DataBind();
                if (dt.Rows.Count > 1) {
                    Literal ImageLiteral = (Literal)item.FindControl("possibleenddiv");
                    ImageLiteral.Text = "</div>";
                }
            }
        } catch(Exception ex) {

        }
    }

    protected string formatRoomAction(string s) {
        string[] strarray = s.Split('|');
        StringBuilder sb = new StringBuilder();
        foreach (string str in strarray) {
            sb.Append("<li>" + str + "</li>");
        }
        return sb.ToString();
    }
}