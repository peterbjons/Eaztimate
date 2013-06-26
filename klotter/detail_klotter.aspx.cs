using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class klotter_detail_klotter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id=0;
        int.TryParse((Request.QueryString["id"] ?? string.Empty), out id);
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT * FROM klotter WHERE klotterid=@1", id)) {
            if(reader.Read()) {
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

                policereport.SelectedValue = reader.GetBoolean(reader.GetOrdinal("policereport")) ? "1" : "0";

                //sb.Clear();
                //sb.Append(reader.GetBoolean(reader.GetOrdinal("pressurewasher")) ? "Högtryckstvätt<br/>" : "");
                //sb.Append(reader.GetBoolean(reader.GetOrdinal("pwrecycle")) ? "Högtryckstvätt recycle<br/>" : "");
                //sb.Append(reader.GetBoolean(reader.GetOrdinal("handwashing")) ? "Handtvätt<br/>" : "");
                //actions.Text = sb.ToString();
            }
        }

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

    }
}