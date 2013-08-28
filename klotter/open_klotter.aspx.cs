using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class openklotter : Page
{

    public enum selectors {
        map, graph
    }

    public int sortorder = 0;

    public string markers = string.Empty;
    public string selection = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {      
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;        

        if (!Page.IsPostBack) {
            klotterlist.bindData();
            datestartExtender.SelectedDate = DateTime.Now.AddMonths(-1);
            dateendExtender.SelectedDate = DateTime.Now;
            if (Roles.IsUserInRole("Administrator")) {
                using (SqlDataReader reader = SQL.ExecuteQuery("SELECT DISTINCT syncemail FROM klotter WHERE customerid=(SELECT customerid FROM customerusers WHERE userid=@1)", Membership.GetUser().ProviderUserKey)) {
                    person.DataSource = reader;
                    person.DataBind();
                    person.Visible = true;
                    person.Items.Insert(0, new ListItem("Alla", "0"));
                }
            }

            bindMap();
            bindGraphs();
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
            klotterlist.datestart = sdate;
            klotterlist.dateend = edate;
            klotterlist.person = (person.SelectedIndex > 0 ? person.SelectedValue : string.Empty);
            datestartExtender.SelectedDate = sdate;
            dateendExtender.SelectedDate = edate;
            if (person.SelectedItem.Value != "0" && person.SelectedItem.Value.Length > 1) {
            }
            klotterlist.bindData();
            bindGraphs();
            bindMap();
        }        
    }

    protected void bindGraphs() {
        List<string> c1_title = new List<string>();
        List<decimal> c1_data = new List<decimal>();
        var dtf = CultureInfo.CurrentCulture.DateTimeFormat;
        string sql, variable, email;
        email = (person.SelectedItem.Value != "0" && person.SelectedItem.Value.Length > 1 ? person.SelectedItem.Value : string.Empty);
        if (SelectData(selectors.graph, out sql, out variable)) {
            using (SqlDataReader reader = SQL.ExecuteQuery(sql, variable, email)) {
                while (reader.Read()) {
                    c1_data.Add(reader.GetInt32(2));
                    c1_title.Add(dtf.GetAbbreviatedMonthName(reader.GetInt32(1)));
                }
                if (c1_data.Count < 6) {
                    for (int i = c1_data.Count; i < 6; i++) {
                        c1_data.Add(0m);
                        c1_title.Add(string.Empty);
                    }
                }
                monthbar.Series.Add(new AjaxControlToolkit.BarChartSeries { Data = c1_data.Reverse<decimal>().ToArray(), Name = "Ärenden", BarColor = "#1c80aa" });
                monthbar.CategoriesAxis = string.Join(",", c1_title.Reverse<string>().ToArray());
            }
        }
    }

    protected void bindMap() {
        string sql, variable, email;
        if (SelectData(selectors.map, out sql, out variable)) {
            StringBuilder sb = new StringBuilder();
            email = (person.SelectedItem.Value != "0" && person.SelectedItem.Value.Length > 1 ? person.SelectedItem.Value : string.Empty);
            using (SqlDataReader reader = SQL.ExecuteQuery(sql, datestartExtender.SelectedDate, dateendExtender.SelectedDate, variable, email)) {
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
    
    protected bool SelectData(selectors id, out string sql, out string variable) {
        if (Roles.IsUserInRole("SuperAdministrator") || Roles.IsUserInRole("Administrator") || Roles.IsUserInRole("Klotter")) {
            if (Roles.IsUserInRole("SuperAdministrator")) {
                switch (id) {
                    case selectors.map:
                        sql = "SELECT * FROM klotter WHERE datecreated > @1 AND datecreated < @2 AND latitude > 0 AND longitude > 0" + (person.SelectedItem.Value != "0" && person.SelectedItem.Value.Length > 1 ? "AND syncemail=@4" : "");
                        variable = string.Empty;
                        return true;
                    case selectors.graph:
                        sql = "SELECT TOP 6 DATEPART(Year, datecreated) Year, DATEPART(Month, datecreated) Month, COUNT(klotterid) amount FROM klotter" + (person.SelectedItem.Value != "0" && person.SelectedItem.Value.Length > 1 ? " WHERE syncemail LIKE @2" : "") + " GROUP BY DATEPART (Year,datecreated), DATEPART(Month, datecreated) ORDER BY Year desc, Month desc";
                        variable = string.Empty;
                        return true;
                }
            } else if (Roles.IsUserInRole("Administrator") && person.SelectedValue == "0") {
                switch (id) {
                    case selectors.map:
                        sql = "SELECT * FROM klotter WHERE datecreated > @1 AND datecreated < @2 AND latitude > 0 AND longitude > 0 AND customerid=(SELECT customerid FROM customerusers WHERE userid=@3)" + (person.SelectedItem.Value != "0" && person.SelectedItem.Value.Length > 1 ? " AND syncemail LIKE @4" : "");
                        variable = (string)Membership.GetUser().ProviderUserKey;
                        return true;
                    case selectors.graph:
                        sql = "SELECT TOP 6 DATEPART(Year, datecreated) Year, DATEPART(Month, datecreated) Month, COUNT(klotterid) amount FROM klotter GROUP BY DATEPART (Year,datecreated), DATEPART(Month, datecreated) AND customerid=(SELECT customerid FROM customerusers WHERE userid=@1) " + (person.SelectedItem.Value != "0" && person.SelectedItem.Value.Length > 1 ? " AND syncemail LIKE @2" : "") + " ORDER BY Year desc, Month desc";
                        variable = (string)Membership.GetUser().ProviderUserKey;
                        return true;
                }
            } else if (Roles.IsUserInRole("Klotter")) {
                switch (id) {
                    case selectors.map:
                        sql = "SELECT * FROM klotter WHERE datecreated > @1 AND datecreated < @2 AND latitude > 0 AND longitude > 0 AND syncemail LIKE @3";
                        variable = Membership.GetUser().Email;
                        return true;
                    case selectors.graph:
                        sql = "SELECT TOP 6 DATEPART(Year, datecreated) Year, DATEPART(Month, datecreated) Month, COUNT(klotterid) amount FROM klotter GROUP BY DATEPART (Year,datecreated), DATEPART(Month, datecreated) WHERE syncemail LIKE @1 ORDER BY Year desc, Month desc";
                        variable = Membership.GetUser().Email;
                        return true;
                }
            }
        }
        sql = string.Empty;
        variable = string.Empty;
        return false;
    }
}