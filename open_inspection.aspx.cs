using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class _Default : Page
{
    public int sortorder = 0;
    string sort = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
        int.TryParse(Request.QueryString["so"] ?? "0", out sortorder);        
        switch (sortorder) {
            case 0:
                sort = "ORDER BY datecreated DESC";
                break;
            case 1:
                sort = "ORDER BY datecreated ASC";
                break;
            case 2:
                sort = "ORDER BY status DESC";
                break;
            case 3:
                sort = "ORDER BY status ASC";
                break;
            case 4:
                sort = "ORDER BY inspectionno ASC";                
                break;
            case 5:
                sort = "ORDER BY inspectionno DESC";
                break;
        }

        if (!Page.IsPostBack) {
            bindListView();
        }

        //using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.*,(SELECT COUNT(*) FROM item x WHERE x.inventoryid=a.inventoryid) objects FROM inventory a WHERE a.datedeleted IS NULL " + sort)) {
        //    inspectionrepeater.DataSource = reader;
        //    inspectionrepeater.DataBind();
        //}
    }
    protected void inspectionrepeater_ItemCommand(object source, RepeaterCommandEventArgs e) {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
            int inventoryid = 0;
            if (int.TryParse(e.CommandArgument.ToString(), out inventoryid)) {
                switch (e.CommandName) {
                    case "Open":
                        Response.Redirect("inspection.aspx?id=" + inventoryid.ToString(), true);
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

    protected void bindListView() {
        string sqlstring = "SELECT a.*,(SELECT COUNT(*) FROM item x WHERE x.inventoryid=a.inventoryid) objects FROM inventory a WHERE a.datedeleted IS NULL " + sort;
        SqlDataSource1.SelectCommand = sqlstring;
    }

    protected void companylist_ItemCommand(object sender, ListViewCommandEventArgs e) {
        if (e.Item.ItemType == ListViewItemType.DataItem) {
            int inventoryid = 0;
            if (int.TryParse(e.CommandArgument.ToString(), out inventoryid)) {
                switch (e.CommandName) {
                    case "Open":
                        Response.Redirect("inspection.aspx?id=" + inventoryid.ToString(), true);
                        break;
                }
            }
        }
    }
    protected void companylist_DataBound(object sender, EventArgs e) {
        DataPager pager = (DataPager)companylist.FindControl("DataPager1");
        pager.Visible = pager.TotalRowCount > pager.MaximumRows;
    }

    protected void companylist_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e) {
        //this.datapa.DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        bindListView();
    }
}