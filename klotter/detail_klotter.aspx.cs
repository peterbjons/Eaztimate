using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class klotter_detail_klotter : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e) {
        if (!Page.IsPostBack) {
            for (int i = 0; i < 25; i++) {
                hour_ddl.Items.Add(new ListItem(i.ToString() + " tim", i.ToString()));
            }
            for (int i = 0; i < 60; i++) {
                minutes_ddl.Items.Add(new ListItem(i.ToString() + " min", i.ToString()));
            }
        }        
    }
    protected void Page_Load(object sender, EventArgs e)
    {        
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
        if (!Page.IsPostBack) {
            BindData();
        }        
    }

    protected void BindData() {
        int id = 0;
        int.TryParse((Request.QueryString["id"] ?? string.Empty), out id);

        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT * FROM klotter WHERE klotterid=@1", id)) {
            if (reader.Read()) {
                aonr.Text = reader.GetString(reader.GetOrdinal("orderno"));
                title.Text = reader.GetString(reader.GetOrdinal("title"));
                fastbet.Text = reader.GetString(reader.GetOrdinal("buildingno"));
                address.Text = reader.GetString(reader.GetOrdinal("address1"));
                zipcode.Text = reader.GetString(reader.GetOrdinal("zipcode"));
                city.Text = reader.GetString(reader.GetOrdinal("city"));
                clientname.Text = reader.GetString(reader.GetOrdinal("client"));
                clientno.Text = reader.GetString(reader.GetOrdinal("clientno"));
                clientaddress.Text = reader.GetString(reader.GetOrdinal("clientaddress"));
                clientaddress2.Text = reader.GetString(reader.GetOrdinal("clientaddress2"));
                clientzipcode.Text = reader.GetString(reader.GetOrdinal("clientzipcode"));
                clientcity.Text = reader.GetString(reader.GetOrdinal("clientcity"));

                description.Text = reader.GetString(reader.GetOrdinal("description"));

                policereport.SelectedValue = reader.GetBoolean(reader.GetOrdinal("policereport")) ? "1" : "0";

                hour_ddl.SelectedValue = reader.GetInt32(reader.GetOrdinal("hours")).ToString();
                minutes_ddl.SelectedValue = reader.GetInt32(reader.GetOrdinal("minutes")).ToString();

                //sb.Clear();
                //sb.Append(reader.GetBoolean(reader.GetOrdinal("pressurewasher")) ? "Högtryckstvätt<br/>" : "");
                //sb.Append(reader.GetBoolean(reader.GetOrdinal("pwrecycle")) ? "Högtryckstvätt recycle<br/>" : "");
                //sb.Append(reader.GetBoolean(reader.GetOrdinal("handwashing")) ? "Handtvätt<br/>" : "");
                //actions.Text = sb.ToString();
            }
        }

        StringBuilder sb = new StringBuilder();
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT tag FROM klotter_tag WHERE klotterid=@1", id)) {
            while (reader.Read()) {
                if (sb.Length != 0) {
                    sb.Append(", ");
                }
                sb.Append(reader.GetString(0));
            }
        }
        tags.Text = sb.ToString();


        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("image", typeof(string)));
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,b.klotterno FROM klotter_image a LEFT JOIN klotter b on a.klotterid=b.klotterid WHERE a.klotterid=@1 AND type=0", id)) {
            while (reader.Read()) {
                string url = AmazonHandler.GetPrivateImageKlotter(reader.GetString(reader.GetOrdinal("klotterno")) + "/" + reader.GetString(reader.GetOrdinal("image")));
                dt.Rows.Add(url);
            }
        }
        beforeimagerepeater.DataSource = dt;
        beforeimagerepeater.DataBind();

        dt.Clear();
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,b.klotterno FROM klotter_image a LEFT JOIN klotter b on a.klotterid=b.klotterid WHERE a.klotterid=@1 AND type=1", id)) {
            while (reader.Read()) {
                string url = AmazonHandler.GetPrivateImageKlotter(reader.GetString(reader.GetOrdinal("klotterno")) + "/" + reader.GetString(reader.GetOrdinal("image")));
                dt.Rows.Add(url);
            }
        }
        afterimagerepeater.DataSource = dt;
        afterimagerepeater.DataBind();

    }

    protected void UserEdit_Click(object sender, EventArgs e) {
        int id = 0;
        int.TryParse((Request.QueryString["id"] ?? string.Empty), out id);
        if (SaveData(id)) {

        }
    }

    protected void ReportCreate_Click(object sender, EventArgs e) {
        int id = 0;
        int.TryParse((Request.QueryString["id"] ?? string.Empty), out id);
        if (SaveData(id)) {
            KlotterSyncController.createPdf(id, klotterno.Value, Membership.GetUser().Email);
            if (policereport.SelectedValue == "1") {
                KlotterSyncController.createpolicereportPdf(id, klotterno.Value, Membership.GetUser().Email);
            }
        }
    }

    protected bool SaveData(int id) {        
        if (Roles.IsUserInRole("SuperAdministrator") || Roles.IsUserInRole("Administrator") || Roles.IsUserInRole("Klotter")) {
            if (Roles.IsUserInRole("SuperAdministrator")) {

            } else if (Roles.IsUserInRole("Administrator")) {
                using (SqlDataReader reader = SQL.ExecuteQuery("SELECT klotterid FROM klotter WHERE klotterid=@2 AND customerid=(SELECT customerid FROM customerusers WHERE userid=@1)",Membership.GetUser().ProviderUserKey,id)) {
                    if(!reader.HasRows) {
                        return false;
                    }
                }
            } else if(Roles.IsUserInRole("Klotter")) {
                using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT klotterid FROM klotter WHERE klotterid=@1 AND syncemail=@2",id, Membership.GetUser().Email)) {
                    if(!reader.HasRows) {
                        return false;
                    }
                }
            }

            if (id > 0) {
                int hours = 0,minutes = 0;
                int.TryParse(hour_ddl.SelectedValue, out hours);
                int.TryParse(minutes_ddl.SelectedValue, out minutes);
                using (SQL.ExecuteQuery("UPDATE klotter SET dateupdated=GETDATE(), orderno=@2, title=@3, address1=@4, zipcode=@5, city=@6, buildingno=@7, description=@8, policereport=@9, policereporttext=@10, client=@11, clientno=@12, clientaddress=@13, clientaddress2=@14, clientzipcode=@15, clientcity=@16, hours=@17, minutes=@18 WHERE klotterid=@1",
                    id,
                    aonr.Text,
                    title.Text,
                    address.Text,
                    zipcode.Text,
                    city.Text,
                    fastbet.Text,
                    description.Text,
                    (policereport.SelectedValue == "1" ? true : false),
                    policetext.Text,
                    clientname.Text,
                    clientno.Text,
                    clientaddress.Text,
                    clientaddress2.Text,
                    clientzipcode.Text,
                    clientcity.Text,
                    hours,
                    minutes
                    )) { }
            }
            return true;
        } else {
            return false;
        }
    }
}