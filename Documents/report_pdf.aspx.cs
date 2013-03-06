using Eaztimate;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Documents_report_pdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int inspectionid = 11;
        //if (!int.TryParse((Request.QueryString["id"] ?? ""), out inspectionid)) {
        //    Response.Redirect("open_inspection.aspx", true);
        //}
        if (!Page.IsPostBack)
        {
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.* FROM inventory a WHERE a.inventoryid=@1", inspectionid))
            {
                if (reader.Read())
                {
                    inspectionno.Text = reader.GetString(reader.GetOrdinal("inspectionno"));
                    description.Text = reader.GetString(reader.GetOrdinal("description"));
                    damagetype.Text = reader.GetString(reader.GetOrdinal("damagetype"));
                    address.Text = reader.GetString(reader.GetOrdinal("address1")) + ", " + reader.GetString(reader.GetOrdinal("zipcode")) + " " + reader.GetString(reader.GetOrdinal("city"));
                    damagedate.Text = reader.GetDateTime(reader.GetOrdinal("datedamage")).ToString("yyyy-MM-dd");
                    size.Text = reader.GetInt32(reader.GetOrdinal("livingarea")) + " + " + reader.GetInt32(reader.GetOrdinal("otherarea"));
                    int adults = reader.GetInt32(reader.GetOrdinal("adults"));
                    int teens = reader.GetInt32(reader.GetOrdinal("teens"));
                    int kids = reader.GetInt32(reader.GetOrdinal("kids"));
                    inhabitants.Text = adults + " vux" + (adults > 1 ? "ar" : "en") + (teens > 0 ? ", " + teens.ToString() + " tonåring" + (teens > 1 ? "ar" : "") : "") + (kids > 0 ? ", " + kids.ToString() + "barn" : "");
                }
            }
        }
    }
}