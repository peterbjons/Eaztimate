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
    public int roomsortorder = 0;
    public string sort = string.Empty;    
    public string roomselect = string.Empty;
    public string roomsort = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!int.TryParse((Request.QueryString["id"] ?? ""), out inspectionid)) {
            Response.Redirect("open_inspection.aspx", true);
        }

        objectlist.inspectionid = inspectionid;
        objectlist.bindData();

        roomlist.inspectionid = inspectionid;
        roomlist.bindData();

        //int.TryParse(Request.QueryString["so"] ?? "0", out sortorder);        
        //switch (sortorder) {
        //    case 0:
        //        sort = " ORDER BY categorytitle DESC";
        //        break;
        //    case 1:
        //        sort = " ORDER BY categorytitle ASC";
        //        break;
        //    case 2:
        //        sort = " ORDER BY grouptitle DESC";
        //        break;
        //    case 3:
        //        sort = " ORDER BY grouptitle ASC";
        //        break;
        //    case 4:
        //        sort = " ORDER BY itemtitle ASC";
        //        break;
        //    case 5:
        //        sort = " ORDER BY itemtitle DESC";
        //        break;
        //}                

        if (!Page.IsPostBack) {
            //bindListView();
            //bindRoomView();
            ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
            
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.* FROM inventory a WHERE a.inventoryid=@1", inspectionid)) {
                if (reader.Read()) {
                    inspectno.Text = reader.GetString(reader.GetOrdinal("inspectionno"));
                    description.Text = reader.GetString(reader.GetOrdinal("description"));
                    damagetype.Text = reader.GetString(reader.GetOrdinal("damagetype"));
                    address1.Text = reader.GetString(reader.GetOrdinal("address1"));                    
                    zipcode.Text = reader.GetString(reader.GetOrdinal("zipcode"));
                    city.Text = reader.GetString(reader.GetOrdinal("city"));
                    area.Text = reader.GetInt32(reader.GetOrdinal("livingarea")).ToString() + "/" + reader.GetInt32(reader.GetOrdinal("otherarea")).ToString();
                    inhabitants.Text = reader.GetInt32(reader.GetOrdinal("adults")) + "/" + reader.GetInt32(reader.GetOrdinal("teens")) + "/" + reader.GetInt32(reader.GetOrdinal("kids"));
                    phoneno.Text = reader.GetString(reader.GetOrdinal("tel"));
                    terms.Text = reader.GetString(reader.GetOrdinal("terms"));
                }
            }
            //using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.roomid,a.title FROM room a WHERE a.inventoryid=@1", inspectionid)) {
            //    room_cblist.DataSource = reader;
            //    room_cblist.DataBind();
            //    //rooms.DataSource = reader;
            //    //rooms.DataBind();
            //}

            //using (SqlDataReader reader = SQL.ExecuteQuery("SELECT d.categoryid,d.title FROM item a RIGHT JOIN type b ON a.typeid=b.typeid RIGHT JOIN grupp c ON b.groupid=c.groupid RIGHT JOIN category d ON c.categoryid=d.categoryid WHERE a.inventoryid=@1 GROUP BY d.categoryid,d.title", inspectionid)) {
            //    cat_cblist.DataSource = reader;
            //    cat_cblist.DataBind();                
            //}
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

    //protected void objectlist_ItemCommand(object sender, ListViewCommandEventArgs e) {
    //    if (e.Item.ItemType == ListViewItemType.DataItem) {
    //        int inventoryid = 0;
    //        if (int.TryParse(e.CommandArgument.ToString(), out inventoryid)) {
    //            switch (e.CommandName) {
    //                case "Open":
    //                    Response.Redirect("object_view.aspx?id=" + inventoryid.ToString(), true);
    //                    break;
    //            }
    //        }
    //    }
    //}

    //protected void objectlist_DataBound(object sender, EventArgs e) {
    //    DataPager pager = (DataPager)objectlist.FindControl("DataPager1");
    //    if (pager != null) {
    //        pager.Visible = pager.TotalRowCount > pager.MaximumRows;
    //    }        
    //}

    protected void roomlist_ItemCommand(object sender, ListViewCommandEventArgs e) {
        if (e.Item.ItemType == ListViewItemType.DataItem) {
            int inventoryid = 0;
            if (int.TryParse(e.CommandArgument.ToString(), out inventoryid)) {
                switch (e.CommandName) {
                    case "Open":
                        Response.Redirect("room_view.aspx?id=" + inventoryid.ToString(), true);
                        break;
                }
            }
        }
    }

    //protected void roomlist_DataBound(object sender, EventArgs e) {
    //    DataPager pager = (DataPager)roomlist.FindControl("DataPager2");
    //    if (pager != null) {
    //        pager.Visible = pager.TotalRowCount > pager.MaximumRows;
    //    }        
    //}

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

    //protected void bindRoomView() {
    //    int.TryParse(roomsortorderhidden.Value, out roomsortorder);
    //    RoomSqlDataSource.SelectCommand = "SELECT a.*,b.inspectionno, (SELECT TOP 1 x.image FROM roomimage x WHERE x.roomid=a.roomid ORDER BY x.roomimageid) roomimage FROM room a LEFT JOIN inventory b ON a.inventoryid=b.inventoryid WHERE a.inventoryid=" + inspectionid.ToString();
    //}

    //protected void bindListView() {
    //    int.TryParse(sortorderhidden.Value, out sortorder);
    //    switch (sortorderhidden.Value) {
    //        case "0":
    //            sort = " ORDER BY categorytitle DESC";
    //            break;
    //        case "1":
    //            sort = " ORDER BY categorytitle ASC";
    //            break;
    //        case "2":
    //            sort = " ORDER BY grouptitle DESC";
    //            break;
    //        case "3":
    //            sort = " ORDER BY grouptitle ASC";
    //            break;
    //        case "4":
    //            sort = " ORDER BY itemtitle ASC";
    //            break;
    //        case "5":
    //            sort = " ORDER BY itemtitle DESC";
    //            break;
    //    }

    //    int selectedcount =  room_cblist.Items.Cast<ListItem>().Where(item => item.Selected).Count();
    //    if (selectedcount > 0) {
    //        var s = room_cblist.Items.Cast<ListItem>()
    //               .Where(item => item.Selected)
    //               .Aggregate("", (current, item) => current + (item.Value + ", "));
    //        roomselect = " AND a.roomid IN (" + s.TrimEnd(new[] { ',', ' ' }) + ")";
    //    } else {
    //        roomselect = string.Empty;
    //    }

    //    string othertype = GetGlobalResourceObject("Strings", "other").ToString();
    //    SqlDataSource1.SelectCommand = "SELECT a.itemid,a.price,a.usage,a.age,a.other,a.dateupdated,(CASE WHEN b.title LIKE '" + othertype + "' THEN (CASE WHEN a.alttype IS NULL THEN LEFT(a.title, 50) ELSE a.alttype END) ELSE b.title END)  itemtitle, c.title grouptitle,d.title categorytitle, (SELECT TOP 1 x.image FROM itemimage x WHERE x.itemid=a.itemid ORDER BY x.itemimageid) itemimage, (SELECT x.inspectionno FROM inventory x WHERE a.inventoryid=x.inventoryid) inspectionno FROM item a LEFT JOIN type b ON a.typeid=b.typeid LEFT JOIN grupp c ON b.groupid=c.groupid LEFT JOIN category d ON c.categoryid=d.categoryid WHERE a.inventoryid=" + inspectionid.ToString() + roomselect + sort;
    //}

    //protected void roomlist_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e) {
    //    //registerScripts();
    //    bindRoomView();
    //}

    //protected void objectlist_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e) {
    //    registerScripts();
    //    bindListView();
    //}

    protected void Sort_Command(object sender, CommandEventArgs e) {
        int.TryParse(e.CommandName, out sortorder);
        //registerScripts();
        //sortorderhidden.Value = e.CommandName;
        ((LinkButton)sender).CommandName = (sortorder % 2 == 0 ? (sortorder + 1).ToString() : (sortorder - 1).ToString());  //switch command
        //bindListView();
    }
    //protected void room_cblist_SelectedIndexChanged(object sender, EventArgs e) {
    //    registerScripts();
    //    bindListView();
    //}

    //protected void cat_cblist_SelectedIndexChanged(object sender, EventArgs e) {
    //    registerScripts();
    //    bindListView();
    //}

    //protected void registerScripts() {
    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "showhide", "expandList($('.inspection_row_1'), $('.inspection_row_2'));", true);
    //    ScriptManager.RegisterStartupScript(this, this.GetType(), "showhideurval", "expandSort($('.row_rum1'), $('.row_rum2'));expandSort($('.row_kategori1'), $('.row_kategori2'));", true);
    //}
}