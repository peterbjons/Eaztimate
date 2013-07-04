using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class openklotter : Page
{
    public int sortorder = 0;
    protected void Page_Load(object sender, EventArgs e)
    {      
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;        

        if (!Page.IsPostBack) {
            klotterlist.bindData();
            datestartExtender.SelectedDate = DateTime.Now.AddMonths(-1);
            dateendExtender.SelectedDate = DateTime.Now;
        }
    }
    //protected void klotterrepeater_ItemCommand(object source, RepeaterCommandEventArgs e) {
    //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) {
    //        int inventoryid = 0;
    //        if (int.TryParse(e.CommandArgument.ToString(), out inventoryid)) {
    //            switch (e.CommandName) {
    //                case "Open":
    //                    Response.Redirect("detail_klotter.aspx?id=" + inventoryid.ToString(), true);
    //                    break;
    //            }
    //        }
    //    }
    //}

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
    protected void updateDate_Click(object sender, EventArgs e) {
        DateTime sdate, edate;
        if (DateTime.TryParse(datestart.Text, out sdate) && DateTime.TryParse(dateend.Text, out edate)) {
            klotterlist.datestart = sdate;
            klotterlist.dateend = edate;
            datestartExtender.SelectedDate = sdate;
            dateendExtender.SelectedDate = edate;
            klotterlist.bindData();
        }        
    }
}