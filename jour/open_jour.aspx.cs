using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class openjour : Page
{
    public int sortorder = 0;
    public string markers = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {      
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;        

        if (!Page.IsPostBack) {
            jourlist.bindData();
            datestartExtender.SelectedDate = DateTime.Now.AddMonths(-1);
            dateendExtender.SelectedDate = DateTime.Now;

            bindGraphs();

            
        }
    }
    protected void jourrepeater_ItemCommand(object source, RepeaterCommandEventArgs e) {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            int inventoryid = 0;
            if (int.TryParse(e.CommandArgument.ToString(), out inventoryid)) {
                switch (e.CommandName) {
                    case "Open":
                        Response.Redirect("inspect_object.aspx?id=" + inventoryid.ToString(), true);
                        break;
                }
            }
        }
    }

    protected String setColor(bool status) {
        switch (status) {
            case false:                
                return "orange";
            case true:
                return "green";
            default:
                return "white";
        }
    }
    protected void updateDate_Click(object sender, EventArgs e) {
        DateTime sdate, edate;
        if (DateTime.TryParse(datestart.Text, out sdate) && DateTime.TryParse(dateend.Text, out edate)) {
            jourlist.datestart = sdate;
            jourlist.dateend = edate;
            datestartExtender.SelectedDate = sdate;
            dateendExtender.SelectedDate = edate;
            jourlist.bindData();
        }
    }

    protected void bindGraphs() {
        List<string> c1_title = new List<string>();
        List<decimal> c1_data = new List<decimal>();
        var dtf = CultureInfo.CurrentCulture.DateTimeFormat;        
        using (SqlDataReader reader = SQL.ExecuteQuery("SELECT TOP 6 DATEPART(Year, datecreated) Year, DATEPART(Month, datecreated) Month, COUNT(jourid) amount FROM jour GROUP BY DATEPART (Year,datecreated), DATEPART(Month, datecreated) ORDER BY Year desc, Month desc")) {            
            while (reader.Read()) {
                c1_data.Add(reader.GetInt32(2));
                c1_title.Add(dtf.GetAbbreviatedMonthName(reader.GetInt32(1)));
            }
            monthbar.Series.Add(new AjaxControlToolkit.BarChartSeries { Data = c1_data.Reverse<decimal>().ToArray(), Name = "Ärenden", BarColor = "#1c80aa" });
            monthbar.CategoriesAxis = string.Join(",", c1_title.Reverse<string>().ToArray());
        }
    }

    protected void bindMap() {
        StringBuilder sb = new StringBuilder();
        using (SqlDataReader reader = SQL.ExecuteQuery("SELECT * FROM jour WHERE datecreated > @1 AND datecreated < @2 AND latitude > 0 AND longitude > 0", datestartExtender.SelectedDate, dateendExtender.SelectedDate)) {
            while (reader.Read()) {
                if (sb.Length > 0) {
                    sb.Append(",");
                }
                sb.Append("[" + reader.GetDouble(reader.GetOrdinal("latitude")).ToString().Replace(',', '.') + "," + reader.GetDouble(reader.GetOrdinal("longitude")).ToString().Replace(',', '.') + "]");
            }
        }
        markers = sb.ToString();
    }
}