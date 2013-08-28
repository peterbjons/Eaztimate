using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class klotter_map_klotter : System.Web.UI.Page
{
    public string markers = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;

        if (!Page.IsPostBack) {
            datestartExtender.SelectedDate = DateTime.Now.AddMonths(-1);
            dateendExtender.SelectedDate = DateTime.Now;
            bindMap();
        }
    }

    protected void updateDate_Click(object sender, EventArgs e) {
        DateTime sdate, edate;
        if (DateTime.TryParse(datestart.Text, out sdate) && DateTime.TryParse(dateend.Text, out edate)) {
           
            datestartExtender.SelectedDate = sdate;
            dateendExtender.SelectedDate = edate;
            bindMap();
        }
    }

    protected void bindMap() {
        StringBuilder sb = new StringBuilder();
        using (SqlDataReader reader = SQL.ExecuteQuery("SELECT * FROM klotter WHERE datecreated > @1 AND datecreated < @2 AND latitude > 0 AND longitude > 0", datestartExtender.SelectedDate, dateendExtender.SelectedDate)) {
            while (reader.Read()) {
                if (sb.Length > 0) {
                    sb.Append(",");
                }
                sb.Append("[" + reader.GetDouble(reader.GetOrdinal("latitude")).ToString().Replace(',', '.') + "," + reader.GetDouble(reader.GetOrdinal("longitude")).ToString().Replace(',', '.') + ",\"" + reader.GetString(reader.GetOrdinal("title")) + "<br/>" + reader.GetString(reader.GetOrdinal("address1")) + "<br/>" + reader.GetString(reader.GetOrdinal("zipcode")) + ", " + reader.GetString(reader.GetOrdinal("city")) + "<br/><a href='detail_klotter.aspx?id=" + reader.GetInt64(reader.GetOrdinal("klotterid")).ToString() + "'>Öppna</a>\"" + "]");
            }
        }
        markers = sb.ToString();
    }
}