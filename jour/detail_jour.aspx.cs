using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class jour_detail_jour : System.Web.UI.Page
{

    public int jourid = 0;

    protected void Page_Init(object seneder, EventArgs e) {
        if (!Page.IsPostBack) {
            using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT DISTINCT damagetype FROM jour")) {
                damagetype_ddl.DataSource = reader;
                damagetype_ddl.DataBind();
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {        

        registerScripts();   

        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;


        if (!int.TryParse((Request.QueryString["id"] ?? ""), out jourid))
        {
            Response.Redirect("open_jour.aspx", true);

        }
        if (!Page.IsPostBack) {
            bindData();
        }
    }
    protected void registerScripts()
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "showhide", "expandList($('.room_row_1'), $('.room_row_2'));", true);
    }

    protected void bindData() {
        int jourid = 0;
        int.TryParse(Request.QueryString["id"] ?? "32", out jourid);
        int contactaction = 0;
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,(SELECT TOP 1 timestamp FROM jour_log WHERE jourid=@1 ORDER BY timestamp ASC) timestamp,(SELECT TOP 1 x.image FROM jourimage x WHERE x.jourid=@1 order by image) jourimage FROM jour a WHERE jourid=@1; SELECT a.image,b.journo FROM jourimage a LEFT JOIN jour b ON a.jourid=b.jourid WHERE a.jourid=@1", jourid)) {
            if (reader.Read()) {
                insurancenumber.Text = reader.GetString(reader.GetOrdinal("insurancenumber"));
                insurancetype.Text = reader.GetString(reader.GetOrdinal("insurancetype"));
                //lccaseid.Text = reader.GetString(reader.GetOrdinal("lccaseid"));
                damagetype.Value = reader.GetString(reader.GetOrdinal("damagetype"));
                damagetype_ddl.SelectedValue = reader.GetString(reader.GetOrdinal("damagetype"));
                //damagetype_ddl.Items.FindByValue(reader.GetString(reader.GetOrdinal("damagetype"))).Selected = true;

                journo.Value = reader.GetString(reader.GetOrdinal("journo"));
                //damagetype.Text = reader.GetString(reader.GetOrdinal("damagetype"));
                //jourdate.Text = logdate.Text = reader.GetDateTime(reader.GetOrdinal("timestamp")).ToString("yyyy-MM-dd");
                clientname.Text = reader.GetString(reader.GetOrdinal("contactname"));
                clientaddress.Text = reader.GetString(reader.GetOrdinal("contactaddress"));
                clientno.Text = reader.GetString(reader.GetOrdinal("contactpersonalnumber"));
                if (reader.GetString(reader.GetOrdinal("contactaddress2")).Length > 1) {
                    clientaddress2.Text = reader.GetString(reader.GetOrdinal("contactaddress2"));
                }
                clientzipcode.Text = reader.GetString(reader.GetOrdinal("contactzipcode"));
                clientcity.Text = reader.GetString(reader.GetOrdinal("contactcity"));
                if (reader.GetString(reader.GetOrdinal("contactphone1")).Length > 1) {
                    clientphone1.Text = reader.GetString(reader.GetOrdinal("contactphone1"));
                }
                if (reader.GetString(reader.GetOrdinal("contactphone2")).Length > 1) {
                    clientphone2.Text = reader.GetString(reader.GetOrdinal("contactphone2"));
                }
                //syncemail.Text = reader.GetString(reader.GetOrdinal("syncemail"));

                //string username = Membership.GetUserNameByEmail(reader.GetString(reader.GetOrdinal("syncemail")));
                //MembershipUser user = Membership.GetUser(username);

                //using (SqlDataReader reader2 = Eaztimate.SQL.ExecuteQuery("SELECT * FROM userdata WHERE userid=@1", user.ProviderUserKey)) {
                //    if (reader2.Read()) {
                //        fname.Text = reader2.GetString(reader2.GetOrdinal("fname"));
                //        lname.Text = reader2.GetString(reader2.GetOrdinal("lname"));
                //        tel1.Text = reader2.GetString(reader2.GetOrdinal("tel1"));
                //        tel2.Text = reader2.GetString(reader2.GetOrdinal("tel2"));
                //    }
                //}


                description.Text = reader.GetString(reader.GetOrdinal("damagedescription"));

                contactaction = reader.GetInt32(reader.GetOrdinal("contactaction"));

                //actiondesc.Text = reader.GetString(reader.GetOrdinal("actiondescription"));
                //entrepeneur.Text = reader.GetString(reader.GetOrdinal("externalentrepeneur"));

                lcno.Text = reader.GetString(reader.GetOrdinal("lccaseid"));

                skalskydd.Value = (reader.GetBoolean(reader.GetOrdinal("building_lockable")) ? "1" : "0");
                skalskydd_ddl.Items.FindByValue((reader.GetBoolean(reader.GetOrdinal("building_lockable")) ? "1" : "0")).Selected = true;
                el_varme.Value = (reader.GetBoolean(reader.GetOrdinal("building_power")) ? "1" : "0");
                el_varme_ddl.Items.FindByValue((reader.GetBoolean(reader.GetOrdinal("building_power")) ? "1" : "0")).Selected = true;
                klimatskydd.Value = (reader.GetBoolean(reader.GetOrdinal("building_climatesafe")) ? "1" : "0");
                klimatskydd_ddl.Items.FindByValue((reader.GetBoolean(reader.GetOrdinal("building_climatesafe")) ? "1" : "0")).Selected = true;
                funktion.Value = (reader.GetBoolean(reader.GetOrdinal("building_function")) ? "1" : "0");
                funktion_ddl.Items.FindByValue((reader.GetBoolean(reader.GetOrdinal("building_function")) ? "1" : "0")).Selected = true;

                //StringBuilder sb = new StringBuilder();
                if (reader.GetBoolean(reader.GetOrdinal("action_otherliving"))) {
                    otherneeds.Items.FindByValue("1").Selected = true;
                    //sb.Append("<li>Tillfälligt boende</li>");
                }
                if (reader.GetBoolean(reader.GetOrdinal("action_cash"))) {
                    otherneeds.Items.FindByValue("2").Selected = true;
                    //sb.Append("<li>Kontanter</li>");
                }
                if (reader.GetBoolean(reader.GetOrdinal("action_transport"))) {
                    otherneeds.Items.FindByValue("3").Selected = true;
                    //sb.Append("<li>Transport</li>");
                }
                if (reader.GetBoolean(reader.GetOrdinal("action_helpcontact"))) {
                    otherneeds.Items.FindByValue("4").Selected = true;
                    //sb.Append("<li>Förmedling av kontakt vid ej ersättningsbar skada</li>");
                }
                //otherneeds.Text = sb.ToString();

                //switch (contactaction) {
                //    case 1:
                //        action.Text = "Telefonsupport";
                //        break;
                //    case 2:
                //        action.Text = "Försäkringstagaren löser problemet";
                //        break;
                //    case 3:
                //        action.Text = "Insats Ocab";
                //        break;
                //    case 4:
                //        action.Text = "Insats annan entrepenör";
                //        break;
                //}
            }
            reader.NextResult();
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("image", typeof(string)));
            while (reader.Read()) {
                string url = AmazonHandler.GetPrivateImageJour(reader.GetString(reader.GetOrdinal("journo")) + "/" + reader.GetString(reader.GetOrdinal("image")));
                dt.Rows.Add(url);
            }
            jourimagerepeater.DataSource = dt;
            jourimagerepeater.DataBind();
        }

        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT * FROM jour_room WHERE jourid=@1 ORDER BY roomid ASC", jourid)) {
            roomrepeater.DataSource = reader;
            roomrepeater.DataBind();
        }
    }

    protected void roomrepeater_ItemDataBound(object sender, RepeaterItemEventArgs e) {

        RepeaterItem item = e.Item;
        HiddenField roomidHidden = (HiddenField)item.FindControl("roomidHidden");
        int roomid = 0;
        if (roomidHidden != null) {
            int.TryParse(roomidHidden.Value, out roomid);
        }

        try {
            
            if ((item.ItemType == ListItemType.Item) || (item.ItemType == ListItemType.AlternatingItem)) {   
                CheckBoxList cbl = (CheckBoxList)item.FindControl("areadamage");
                DbDataRecord data = (DbDataRecord)item.DataItem;
                cbl.Items.FindByValue("1").Selected = data.GetBoolean(data.GetOrdinal("problem_water"));
                cbl.Items.FindByValue("2").Selected = data.GetBoolean(data.GetOrdinal("problem_humidity"));
                cbl.Items.FindByValue("3").Selected = data.GetBoolean(data.GetOrdinal("problem_odor"));
                cbl.Items.FindByValue("4").Selected = data.GetBoolean(data.GetOrdinal("problem_contamination"));

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
        } catch (Exception ex) {

        }
    }

    protected string formatRoomAction(string s) {
        string[] strarray = s.Split('|');
        StringBuilder sb = new StringBuilder();
        foreach (string str in strarray) {
            if (str.Length > 0) {
                sb.Append("<li>" + str + "</li>");
            }
        }
        return sb.ToString();
    }
    


    protected void detailEditButton_Click(object sender, EventArgs e) {
        int id = 0;
        int.TryParse((Request.QueryString["id"] ?? string.Empty), out id);
        if (SaveData(id)) {
            bindData();
        }
    }
    protected void reportEditButton_Click(object sender, EventArgs e) {
        int id = 0;
        int.TryParse((Request.QueryString["id"] ?? string.Empty), out id);
        if (SaveData(id)) {
            JourSyncController.createPdf(id, journo.Value, Membership.GetUser().Email);
            bindData();
        }
    }

    protected bool SaveData(int id) {
        if (Roles.IsUserInRole("SuperAdministrator") || Roles.IsUserInRole("Administrator") || Roles.IsUserInRole("Jour")) {
            if (Roles.IsUserInRole("SuperAdministrator")) {

            } else if (Roles.IsUserInRole("Administrator")) {
                using (SqlDataReader reader = SQL.ExecuteQuery("SELECT jourid FROM jour WHERE jourid=@2 AND customerid=(SELECT customerid FROM customerusers WHERE userid=@1)", Membership.GetUser().ProviderUserKey, id)) {
                    if (!reader.HasRows) {
                        return false;
                    }
                }
            } else if (Roles.IsUserInRole("Jour")) {
                using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT jourid FROM jour WHERE jourid=@1 AND syncemail=@2", id, Membership.GetUser().Email)) {
                    if (!reader.HasRows) {
                        return false;
                    }
                }
            }

            if (id > 0) {
                using (SQL.ExecuteQuery("UPDATE jour SET dateupdated=GETDATE(), lccaseid=@2, contactname=@3, contactaddress=@4, contactaddress2=@5, contactzipcode=@6, contactcity=@7, contactphone1=@8, contactphone2=@9, contactpersonalnumber=@10, damagedescription=@11, damagetype=@12, insurancetype=@13, insurancenumber=@14,action_otherliving=@15, action_cash=@16, action_transport=@17, action_helpcontact=@18, building_power=@19, building_lockable=@20, building_climatesafe=@21, building_function=@22 WHERE jourid=@1",
                    id,
                    lcno.Text,
                    clientname.Text,
                    clientaddress.Text,
                    clientaddress2.Text,
                    clientzipcode.Text,
                    clientcity.Text,
                    clientphone1.Text,
                    clientphone2.Text,
                    clientno.Text,
                    description.Text,
                    damagetype.Value,
                    insurancetype.Text,     
                    insurancenumber.Text,
                    otherneeds.Items.FindByValue("1").Selected,
                    otherneeds.Items.FindByValue("2").Selected,
                    otherneeds.Items.FindByValue("3").Selected,
                    otherneeds.Items.FindByValue("4").Selected,
                    (el_varme.Value == "1" ? true : false),
                    skalskydd.Value == "1",
                    klimatskydd.Value == "1",
                    funktion.Value == "1"                    
                    )) { }
            }
            return true;
        } else {
            return false;
        }
    }
    protected void RoomSave_Click(object sender, EventArgs e) {
        
    }
    protected void roomrepeater_ItemCommand(object source, RepeaterCommandEventArgs e) {
        switch (e.CommandName) {
            case "save":
                TextBox tb = (TextBox)e.Item.FindControl("notes");
                CheckBoxList cbl = (CheckBoxList)e.Item.FindControl("areadamage");
                int i = 0;
                if (int.TryParse(e.CommandArgument.ToString(), out i)) {
                    using (SQL.ExecuteQuery("UPDATE jour_room SET description=@2, problem_water=@3, problem_humidity=@4, problem_odor=@5, problem_contamination=@6 WHERE roomid=@1", 
                        i, 
                        tb.Text,
                        cbl.Items.FindByValue("1").Selected,
                        cbl.Items.FindByValue("2").Selected,
                        cbl.Items.FindByValue("3").Selected,
                        cbl.Items.FindByValue("4").Selected
                        )) { }
                }
                break;
        }
    }
}