using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Documents_klotter_pdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int klotterid = 0;
        int.TryParse(Request.QueryString["id"] ?? "5", out klotterid);
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,(SELECT TOP 1 timestamp FROM jour_log WHERE jourid=@1 ORDER BY timestamp ASC) timestamp,(SELECT TOP 1 x.image FROM jourimage x WHERE x.jourid=@1 order by image) jourimage FROM jour a WHERE jourid=@1;SELECT title FROM jour_room WHERE jourid=@1", jourid)) {
            if (reader.Read()) {
            }
        }

    }
}