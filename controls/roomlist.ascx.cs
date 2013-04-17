using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class controls_roomlist : System.Web.UI.UserControl
{
    public long inspectionid { get; set; }
    public long roomid { get; set; }
    public bool roomselection { get; set; }
    public bool catselection { get; set; }
    public int sortorder = 0;
    public string sort = string.Empty;
    public string roomselect = string.Empty;

    protected void Page_Load(object sender, EventArgs e) {
        if (!Page.IsPostBack) {
            registerScripts();
        }
    }

    public void bindData() {
        //roomdiv.Visible = roomselection;
        //if (roomselection) {
        //    using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.roomid,a.title FROM room a WHERE "+ (inspectionid > 0 ? "a.inventoryid" : "a.roomid") + "=@1", (inspectionid > 0 ? inspectionid : roomid))) {
        //        room_cblist.DataSource = reader;
        //        room_cblist.DataBind();
        //    }
        //}

        //catdiv.Visible = catselection;
        //if (catselection) {
        //    using (SqlDataReader reader = SQL.ExecuteQuery("SELECT d.categoryid,d.title FROM item a RIGHT JOIN type b ON a.typeid=b.typeid RIGHT JOIN grupp c ON b.groupid=c.groupid RIGHT JOIN category d ON c.categoryid=d.categoryid WHERE " + (inspectionid > 0 ? "a.inventoryid" : "a.roomid") + "=@1 GROUP BY d.categoryid,d.title", (inspectionid > 0 ? inspectionid : roomid))) {
        //        cat_cblist.DataSource = reader;
        //        cat_cblist.DataBind();
        //    }
        //}
        bindListView();
        room_hf.Value = roomid.ToString();
        inspection_hf.Value = inspectionid.ToString();
    }

    protected void objectlist_ItemCommand(object sender, ListViewCommandEventArgs e) {
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

    protected void objectlist_DataBound(object sender, EventArgs e) {
        DataPager pager = (DataPager)objectlist.FindControl("DataPager1");
        if (pager != null) {
            pager.Visible = pager.TotalRowCount > pager.MaximumRows;
        }
    }

    protected void bindListView() {
        int.TryParse(sortorderhidden.Value, out sortorder);
        long rid = 0, iid = 0;

        //postback??
        long.TryParse(room_hf.Value, out rid);
        long.TryParse(inspection_hf.Value, out iid);
        roomid = (roomid > 0 ? roomid : rid);
        inspectionid = (inspectionid > 0 ? inspectionid : iid);

        switch (sortorderhidden.Value) {
            case "0":
                sort = " ORDER BY title ASC";
                break;
            case "1":
                sort = " ORDER BY title DESC";
                break;
            case "2":
                sort = " ORDER BY items DESC";
                break;
            case "3":
                sort = " ORDER BY items ASC";
                break;            
        }

        //int selectedcount = room_cblist.Items.Cast<ListItem>().Where(item => item.Selected).Count();
        //if (selectedcount > 0) {
        //    var s = room_cblist.Items.Cast<ListItem>()
        //           .Where(item => item.Selected)
        //           .Aggregate("", (current, item) => current + (item.Value + ", "));
        //    roomselect = " AND a.roomid IN (" + s.TrimEnd(new[] { ',', ' ' }) + ")";
        //} else {
        //    roomselect = string.Empty;
        //}

        string othertype = GetGlobalResourceObject("Strings", "other").ToString();
        RoomSqlDataSource.SelectCommand = RoomSqlDataSource.SelectCommand = "SELECT a.*,b.inspectionno, (SELECT TOP 1 x.image FROM roomimage x WHERE x.roomid=a.roomid ORDER BY x.roomimageid) roomimage, (SELECT count(x.itemid) FROM item x WHERE x.roomid=a.roomid) items FROM room a LEFT JOIN inventory b ON a.inventoryid=b.inventoryid WHERE a.inventoryid=" + inspectionid.ToString();
    }    

    protected void objectlist_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e) {
        registerScripts();
        bindListView();
    }

    protected void Sort_Command(object sender, CommandEventArgs e) {
        int.TryParse(e.CommandName, out sortorder);
        registerScripts();
        sortorderhidden.Value = e.CommandName;
        ((LinkButton)sender).CommandName = (sortorder % 2 == 0 ? (sortorder + 1).ToString() : (sortorder - 1).ToString());  //switch command
        bindListView();
    }

    protected void room_cblist_SelectedIndexChanged(object sender, EventArgs e) {
        registerScripts();
        bindListView();
    }

    protected void cat_cblist_SelectedIndexChanged(object sender, EventArgs e) {
        registerScripts();
        bindListView();
    }

    protected void registerScripts() {
        ScriptManager.RegisterStartupScript(Parent.Page, Parent.Page.GetType(), "showhideroom", "expandList($('.room_row_1'), $('.room_row_2'));", true);
        //ScriptManager.RegisterStartupScript(Parent.Page, Parent.Page.GetType(), "showhideurval", "expandSort($('.row_rum1'), $('.row_rum2'));expandSort($('.row_kategori1'), $('.row_kategori2'));", true);
    }
}