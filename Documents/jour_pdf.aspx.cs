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

        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT *,(SELECT TOP 1 timestamp FROM jour_log WHERE jourid=@1 ORDER BY timestamp ASC) timestamp FROM jour WHERE jourid=@1", jourid)) {
            if (reader.Read()) {
                insuranceno.Text = reader.GetString(reader.GetOrdinal("insurancenumber"));
                insurancetype.Text = reader.GetString(reader.GetOrdinal("insurancetype"));
                damagetype.Text = reader.GetString(reader.GetOrdinal("damagetype"));
                jourdate.Text = logdate.Text = reader.GetDateTime(reader.GetOrdinal("timestamp")).ToString("yyyy-MM-dd");
                contactname.Text = reader.GetString(reader.GetOrdinal("contactname"));
                contactaddress.Text = reader.GetString(reader.GetOrdinal("contactaddress"));
                contactpn.Text = reader.GetString(reader.GetOrdinal("contactpersonalnumber"));
                if (reader.GetString(reader.GetOrdinal("contactaddress2")).Length > 1) {
                    contactaddress2.Text = reader.GetString(reader.GetOrdinal("contactaddress2")) + "<br/>";
                }
                contactzipcode.Text = reader.GetString(reader.GetOrdinal("contactzipcode"));
                contactcity.Text = reader.GetString(reader.GetOrdinal("contactcity"));
                if (reader.GetString(reader.GetOrdinal("contactphone1")).Length > 1) {
                    contactphone1.Text = reader.GetString(reader.GetOrdinal("contactphone1")) + "<br/>";
                }
                if (reader.GetString(reader.GetOrdinal("contactphone2")).Length > 1) {
                    contactphone2.Text = reader.GetString(reader.GetOrdinal("contactphone2")) + "<br/>";
                }
                syncemail.Text = reader.GetString(reader.GetOrdinal("syncemail"));
                damagedescription.Text = reader.GetString(reader.GetOrdinal("damagedescription"));

                contactaction = reader.GetInt32(reader.GetOrdinal("contactaction"));

                actiondesc.Text = reader.GetString(reader.GetOrdinal("actiondescription"));
                entrepeneur.Text = reader.GetString(reader.GetOrdinal("externalentrepeneur"));

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
        }

        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("image", typeof(string)));
        using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.image,b.journo FROM jourimage a LEFT JOIN jour b ON a.jourid=b.jourid WHERE a.jourid=@1", jourid)) {
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
            actiondescdiv.Visible = false;
            entrepreneurdiv.Visible = false;
        } else {
            room_pages.Visible = false;
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