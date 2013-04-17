using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class controls_jourlist : System.Web.UI.UserControl
{
    public long inspectionid { get; set; }
    public long roomid { get; set; }
    public bool roomselection { get; set; }
    public bool catselection { get; set; }
    public int sortorder = 0;
    public string sort = string.Empty;
    public string roomselect = string.Empty;
    public string catselect = string.Empty;

    protected void Page_Load(object sender, EventArgs e) {
        if (!Page.IsPostBack) {
            registerScripts();
            ScriptManager.RegisterStartupScript(Parent.Page, Parent.Page.GetType(), "showhideurval", "expandSort($('.row_rum1'), $('.row_rum2'));expandSort($('.row_kategori1'), $('.row_kategori2'));", true);
        }
    }

    public void bindData() {
        roomdiv.Visible = roomselection;
        if (roomselection) {
            //span for styled checkboxes!
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.roomid, '<span></span>'+a.title title FROM room a WHERE " + (inspectionid > 0 ? "a.inventoryid" : "a.roomid") + "=@1", (inspectionid > 0 ? inspectionid : roomid))) {
                room_cblist.DataSource = reader;
                room_cblist.DataBind();
            }
        }

        catdiv.Visible = catselection;
        if (catselection) {
            //span for styled checkboxes!
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT d.categoryid,'<span></span>'+d.title title FROM item a RIGHT JOIN type b ON a.typeid=b.typeid RIGHT JOIN grupp c ON b.groupid=c.groupid RIGHT JOIN category d ON c.categoryid=d.categoryid WHERE " + (inspectionid > 0 ? "a.inventoryid" : "a.roomid") + "=@1 GROUP BY d.categoryid,d.title", (inspectionid > 0 ? inspectionid : roomid))) {
                cat_cblist.DataSource = reader;
                cat_cblist.DataBind();
            }
        }
        bindListView();
        room_hf.Value = roomid.ToString();
        inspection_hf.Value = inspectionid.ToString();
    }

    protected void jourlist_ItemCommand(object sender, ListViewCommandEventArgs e) {
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

    protected void jourlist_DataBound(object sender, EventArgs e) {
        DataPager pager = (DataPager)jourlist.FindControl("DataPager1");
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
                sort = " ORDER BY categorytitle DESC";
                break;
            case "1":
                sort = " ORDER BY categorytitle ASC";
                break;
            case "2":
                sort = " ORDER BY grouptitle DESC";
                break;
            case "3":
                sort = " ORDER BY grouptitle ASC";
                break;
            case "4":
                sort = " ORDER BY itemtitle ASC";
                break;
            case "5":
                sort = " ORDER BY itemtitle DESC";
                break;
        }

        int selectedcount = room_cblist.Items.Cast<ListItem>().Where(item => item.Selected).Count();
        if (selectedcount > 0) {
            var s = room_cblist.Items.Cast<ListItem>()
                   .Where(item => item.Selected)
                   .Aggregate("", (current, item) => current + (item.Value + ", "));
            roomselect = " AND a.roomid IN (" + s.TrimEnd(new[] { ',', ' ' }) + ")";
        } else {
            roomselect = string.Empty;
        }

        selectedcount = cat_cblist.Items.Cast<ListItem>().Where(item => item.Selected).Count();
        if (selectedcount > 0) {
            var s = cat_cblist.Items.Cast<ListItem>()
                   .Where(item => item.Selected)
                   .Aggregate("", (current, item) => current + (item.Value + ", "));
            catselect = " AND d.categoryid IN (" + s.TrimEnd(new[] { ',', ' ' }) + ")";
        } else {
            catselect = string.Empty;
        }

        string othertype = GetGlobalResourceObject("Strings", "other").ToString();
        SqlDataSource1.SelectCommand = "SELECT a.itemid,a.price,a.usage,a.age,a.other,a.dateupdated,(CASE WHEN b.title LIKE '" + othertype + "' THEN (CASE WHEN a.alttype IS NULL THEN LEFT(a.title, 50) ELSE a.alttype END) ELSE b.title END)  itemtitle, c.title grouptitle,d.title categorytitle,d.categoryid, (SELECT TOP 1 x.image FROM itemimage x WHERE x.itemid=a.itemid ORDER BY x.itemimageid) itemimage, (SELECT x.inspectionno FROM inventory x WHERE a.inventoryid=x.inventoryid) inspectionno FROM item a LEFT JOIN type b ON a.typeid=b.typeid LEFT JOIN grupp c ON b.groupid=c.groupid LEFT JOIN category d ON c.categoryid=d.categoryid WHERE " + (inspectionid > 0 ? "a.inventoryid=" + inspectionid.ToString() : "a.roomid=" + roomid.ToString()) + roomselect + catselect + sort;
    }

    protected void jourlist_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e) {
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
        ScriptManager.RegisterStartupScript(Parent.Page, Parent.Page.GetType(), "showhide", "expandList($('.inspection_row_1'), $('.inspection_row_2'));", true);
    }
}