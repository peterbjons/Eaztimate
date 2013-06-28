using System;
using System.Collections.Generic;
using System.Collections.Specialized;
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
    public bool typeselection { get; set; }
    public bool catselection { get; set; }
    public int sortorder = 0;
    public string sort = string.Empty;
    public string typeselect = string.Empty;
    public string catselect = string.Empty;

    protected void Page_Load(object sender, EventArgs e) {
        if (!Page.IsPostBack) {
            registerScripts();
            ScriptManager.RegisterStartupScript(Parent.Page, Parent.Page.GetType(), "showhideurval", "expandSort($('.row_rum1'), $('.row_rum2'));expandSort($('.row_kategori1'), $('.row_kategori2'));", true);
        }
    }

    public void bindData() {
        typeselection = true;
        roomdiv.Visible = typeselection;
        if (typeselection) {
            //span for styled checkboxes!
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT DISTINCT damagetype, '<span></span>'+damagetype title FROM jour")) {
                type_cblist.DataSource = reader;
                type_cblist.DataBind();
            }
        }
        catselection = true;

        catdiv.Visible = catselection;
        if (catselection) {
            List<KeyValuePair<int, string>> data = new List<KeyValuePair<int, string>>();
            data.Add(new KeyValuePair<int, string>(1, "<span></span>Telefonsupport"));
            data.Add(new KeyValuePair<int, string>(2, "<span></span>FT löser problemet"));
            data.Add(new KeyValuePair<int, string>(3, "<span></span>Insats på plats"));
            data.Add(new KeyValuePair<int, string>(4, "<span></span>Insats annan entrepenör"));
            //span for styled checkboxes!
            //using (SqlDataReader reader = SQL.ExecuteQuery("SELECT d.categoryid,'<span></span>'+d.title title FROM item a RIGHT JOIN type b ON a.typeid=b.typeid RIGHT JOIN grupp c ON b.groupid=c.groupid RIGHT JOIN category d ON c.categoryid=d.categoryid WHERE " + (inspectionid > 0 ? "a.inventoryid" : "a.roomid") + "=@1 GROUP BY d.categoryid,d.title", (inspectionid > 0 ? inspectionid : roomid))) {
                cat_cblist.DataSource = data;
                cat_cblist.DataBind();
            //}
        }
        bindListView();
        //room_hf.Value = roomid.ToString();
        //inspection_hf.Value = inspectionid.ToString();
    }

    protected void jourlist_ItemCommand(object sender, ListViewCommandEventArgs e) {
        if (e.Item.ItemType == ListViewItemType.DataItem) {
            int inventoryid = 0;
            if (int.TryParse(e.CommandArgument.ToString(), out inventoryid)) {
                switch (e.CommandName) {
                    case "Open":
                        Response.Redirect("detail_jour.aspx?id=" + inventoryid.ToString(), true);
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

        switch (sortorder) {
            case 0:
                sort = "ORDER BY datecreated DESC";
                break;
            case 1:
                sort = "ORDER BY datecreated ASC";
                break;
            case 2:
                sort = "ORDER BY jourid";
                break;
        }

        int selectedcount = type_cblist.Items.Cast<ListItem>().Where(item => item.Selected).Count();
        if (selectedcount > 0) {
            var s = type_cblist.Items.Cast<ListItem>()
                   .Where(item => item.Selected)
                   .Aggregate("", (current, item) => current + ("'" + item.Value + "', "));
            typeselect = " AND a.damagetype IN (" + s.TrimEnd(new[] { ',', ' ' }) + ")";
        } else {
            typeselect = string.Empty;
        }

        selectedcount = cat_cblist.Items.Cast<ListItem>().Where(item => item.Selected).Count();
        if (selectedcount > 0) {
            var s = cat_cblist.Items.Cast<ListItem>()
                   .Where(item => item.Selected)
                   .Aggregate("", (current, item) => current + (item.Value + ", "));
            catselect = " AND a.contactaction IN (" + s.TrimEnd(new[] { ',', ' ' }) + ")";
        } else {
            catselect = string.Empty;
        }

        SqlDataSource1.SelectCommand = "SELECT a.*,a.journo,(SELECT TOP 1 image FROM jourimage x WHERE x.jourid=a.jourid) image FROM jour a WHERE a.datedeleted IS NULL " + catselect + typeselect + sort;
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

    protected void type_cblist_SelectedIndexChanged(object sender, EventArgs e) {
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