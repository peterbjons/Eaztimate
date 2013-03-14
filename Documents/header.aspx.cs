using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Documents_header : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int jourid= 0;
        int.TryParse(Request.QueryString["id"] ?? "32", out jourid);

        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT *,(SELECT TOP 1 timestamp FROM jour_log WHERE jourid=@1 ORDER BY timestamp ASC) timestamp FROM jour WHERE jourid=@1", jourid)) {
            if (reader.Read()) {
                insurancenumber.Text = reader.GetString(reader.GetOrdinal("insurancenumber"));
                jourdate.Text = reader.GetDateTime(reader.GetOrdinal("timestamp")).ToString("yyyy-MM-dd");
                address.Text = reader.GetString(reader.GetOrdinal("contactaddress")) + ", " + reader.GetString(reader.GetOrdinal("contactcity"));
            }
        }
    }
}