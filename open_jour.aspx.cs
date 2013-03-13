using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class openjour : Page
{
    public int sortorder = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
        int.TryParse(Request.QueryString["so"] ?? "0", out sortorder);
        string sort = string.Empty;
        switch (sortorder) {
            case 0:
                sort = "ORDER BY datecreated DESC";
                break;
            case 1:
                sort = "ORDER BY pdf_synced";
                break;
            case 2:
                sort = "ORDER BY jourid";                
                break;
        }
        using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.*,ISNULL((SELECT TOP 1 image FROM jourimage x WHERE x.jourid=a.jourid), 'empty') image FROM jour a WHERE a.datedeleted IS NULL " + sort)) {
            jourrepeater.DataSource = reader;
            jourrepeater.DataBind();
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
}