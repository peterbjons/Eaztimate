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
    public int sortorder;
    string sort = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
        //int.TryParse(Request.QueryString["so"] ?? "0", out sortorder);        
        //switch (sortorder) {
        //    case 0:
        //        sort = "ORDER BY dateupdated ASC";
        //        break;
        //    case 1:
        //        sort = "ORDER BY dateupdated DESC";
        //        break;
        //    case 2:
        //        sort = "ORDER BY status DESC";
        //        break;
        //    case 3:
        //        sort = "ORDER BY status ASC";
        //        break;
        //    case 4:
        //        sort = "ORDER BY inspectionno ASC";                
        //        break;
        //    case 5:
        //        sort = "ORDER BY inspectionno DESC";
        //        break;
        //    default:
        //        sort = "ORDER BY dateupdated ASC";
        //        sortorder = 0;
        //        break;
        //}

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
        int.TryParse(sortorderhidden.Value, out sortorder);
        switch (sortorderhidden.Value) {
            case "0":
                sort = "ORDER BY dateupdated ASC";                
                break;
            case "1":
                sort = "ORDER BY dateupdated DESC";                
                break;
            case "2":
                sort = "ORDER BY status DESC";                
                break;
            case "3":
                sort = "ORDER BY status ASC";               
                break;
            case "4":
                sort = "ORDER BY inspectionno ASC";                
                break;
            case "5":
                sort = "ORDER BY inspectionno DESC";                
                break;
        }
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
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showhide", "expandList($('.inspection_row_1'), $('.inspection_row_2'));", true);
        bindListView();

    }
    protected void Sort_Command(object sender, CommandEventArgs e) {
        int.TryParse(e.CommandName, out sortorder);
        sortorderhidden.Value = e.CommandName;
        ((LinkButton)sender).CommandName = (sortorder % 2 == 0 ? (sortorder + 1).ToString() : (sortorder - 1).ToString());  //switch command
        bindListView();
    }
}