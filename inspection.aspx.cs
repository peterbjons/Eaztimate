using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class inspect_object : System.Web.UI.Page
{
    public int inspectionid = 0;
    public int sortorder = 0;
    public string sort = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!int.TryParse((Request.QueryString["id"] ?? ""), out inspectionid)) {
            Response.Redirect("open_inspection.aspx", true);
        }

        int.TryParse(Request.QueryString["so"] ?? "0", out sortorder);        
        switch (sortorder) {
            case 0:
                sort = " ORDER BY categorytitle DESC";
                break;
            case 1:
                sort = " ORDER BY categorytitle ASC";
                break;
            case 2:
                sort = " ORDER BY grouptitle DESC";
                break;
            case 3:
                sort = " ORDER BY grouptitle ASC";
                break;
            case 4:
                sort = " ORDER BY itemtitle ASC";
                break;
            case 5:
                sort = " ORDER BY itemtitle DESC";
                break;
        }        

        //string sqlstring = "SELECT a.*,(SELECT COUNT(*) FROM item x WHERE x.inventoryid=a.inventoryid) objects FROM inventory a WHERE a.datedeleted IS NULL " + sort;
        //SqlDataSource1.SelectCommand = sqlstring;

        if (!Page.IsPostBack) {
            bindListView();
            ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
            
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.* FROM inventory a WHERE a.inventoryid=@1", inspectionid)) {
                if (reader.Read()) {
                    inspectno.Text = reader.GetString(reader.GetOrdinal("inspectionno"));
                    description.Text = reader.GetString(reader.GetOrdinal("description"));
                    damagetype.Text = reader.GetString(reader.GetOrdinal("damagetype"));
                    address1.Text = reader.GetString(reader.GetOrdinal("address1"));                    
                    zipcode.Text = reader.GetString(reader.GetOrdinal("zipcode"));
                    city.Text = reader.GetString(reader.GetOrdinal("city"));
                }
            }
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.roomid,a.title FROM room a WHERE a.inventoryid=@1", inspectionid)) {
                //rooms.DataSource = reader;
                //rooms.DataBind();
            }
        }
    }    
    protected void Object_Click(object sender, EventArgs e) {
        //int itemid = 0;
        //int.TryParse(objects.SelectedItem.Value, out itemid);
        //if (itemid > 0) {
        //    Response.Redirect("object_view.aspx?id=" + objects.SelectedItem.Value, true);
        //}
    }

    protected void Room_Click(object sender, EventArgs e) {
        int roomid = 0;
        //int.TryParse(rooms.SelectedItem.Value, out roomid);
        if (roomid > 0) {
            //Response.Redirect("room_view.aspx?id=" + rooms.SelectedItem.Value, true);
        }
    }

    protected void objectlist_ItemCommand(object sender, ListViewCommandEventArgs e) {
        if (e.Item.ItemType == ListViewItemType.DataItem) {
            int inventoryid = 0;
            if (int.TryParse(e.CommandArgument.ToString(), out inventoryid)) {
                switch (e.CommandName) {
                    case "Open":
                        Response.Redirect("object_view.aspx?id=" + inventoryid.ToString(), true);
                        break;
                }
            }
        }
    }
    protected void objectlist_DataBound(object sender, EventArgs e) {
        DataPager pager = (DataPager)objectlist.FindControl("DataPager1");
        pager.Visible = pager.TotalRowCount > pager.MaximumRows;
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
        string othertype = GetGlobalResourceObject("Strings", "other").ToString();
        SqlDataSource1.SelectCommand = "SELECT a.itemid,a.dateupdated,(CASE WHEN b.title LIKE '" + othertype + "' THEN (CASE WHEN a.alttype IS NULL THEN LEFT(a.title, 50) ELSE a.alttype END) ELSE b.title END)  itemtitle, c.title grouptitle,d.title categorytitle, (SELECT TOP 1 x.image FROM itemimage x WHERE x.itemid=a.itemid ORDER BY x.itemimageid) itemimage, (SELECT x.inspectionno FROM inventory x WHERE a.inventoryid=x.inventoryid) inspectionno FROM item a LEFT JOIN type b ON a.typeid=b.typeid LEFT JOIN grupp c ON b.groupid=c.groupid LEFT JOIN category d ON c.categoryid=d.categoryid WHERE a.inventoryid=" + inspectionid.ToString() + sort;
    }
    protected void objectlist_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e) {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showhide", "expandList($('.inspection_row_1'), $('.inspection_row_2'));", true);
        bindListView();
    }
}