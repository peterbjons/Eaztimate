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

        if (!Page.IsPostBack) {            

            objectlist.inspectionid = inspectionid;
            objectlist.bindData();

            roomlist.inspectionid = inspectionid;
            roomlist.bindData();

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

    protected void Sort_Command(object sender, CommandEventArgs e) {
        int.TryParse(e.CommandName, out sortorder);
        //registerScripts();
        //sortorderhidden.Value = e.CommandName;
        ((LinkButton)sender).CommandName = (sortorder % 2 == 0 ? (sortorder + 1).ToString() : (sortorder - 1).ToString());  //switch command
        //bindListView();
    }    
}