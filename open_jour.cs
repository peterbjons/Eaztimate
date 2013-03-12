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
                sort = "ORDER BY status DESC";
                break;
            case 2:
                sort = "ORDER BY inspectionno";                
                break;
        }
        using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.*,(SELECT COUNT(*) FROM item x WHERE x.inventoryid=a.inventoryid) objects FROM inventory a WHERE a.datedeleted IS NULL " + sort)) {
            inspectionrepeater.DataSource = reader;
            inspectionrepeater.DataBind();
        }
    }
    protected void inspectionrepeater_ItemCommand(object source, RepeaterCommandEventArgs e) {
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

    protected String setColor(int status) {
        switch (status) {
            case 0:
                return "blue";
            case 1:
                return "orange";
            case 2:
                return "green";
            default:
                return "white";
        }
    }
}