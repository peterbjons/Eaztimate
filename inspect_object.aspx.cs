﻿using System;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        int inspectionid = 0;
        if (!int.TryParse((Request.QueryString["id"] ?? ""), out inspectionid)) {
            Response.Redirect("open_inspection.aspx", true);
        }
        string othertype = GetGlobalResourceObject("Strings", "other").ToString();

        SqlDataSource1.SelectCommand = "SELECT a.itemid,(CASE WHEN b.title LIKE '" + othertype + "' THEN (CASE WHEN a.alttype IS NULL THEN LEFT(a.title, 50) ELSE a.alttype END) ELSE b.title END)  itemtitle, c.title grouptitle,d.title categorytitle FROM item a LEFT JOIN type b ON a.typeid=b.typeid LEFT JOIN grupp c ON b.groupid=c.groupid LEFT JOIN category d ON c.categoryid=d.categoryid WHERE a.inventoryid=" + inspectionid.ToString();
        if (!Page.IsPostBack) {
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
            //using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.itemid,b.title itemtitle, c.title grouptitle,d.title categorytitle FROM item a LEFT JOIN type b ON a.typeid=b.typeid LEFT JOIN grupp c ON b.groupid=c.groupid LEFT JOIN category d ON c.categoryid=d.categoryid WHERE a.inventoryid=@1", inspectionid)) {
            //    objectgrid.DataSource = reader;
            //    objectgrid.DataBind();
            //}            
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.roomid,a.title FROM room a WHERE a.inventoryid=@1", inspectionid)) {
                rooms.DataSource = reader;
                rooms.DataBind();
            }
            rooms.Items.Insert(0, new ListItem("All Rooms", "0"));
        }
    }
    protected void rooms_SelectedIndexChanged(object sender, EventArgs e) {
        int roomid = 0;
        int.TryParse(rooms.SelectedItem.Value, out roomid);
        int inspectionid = 0;
        if (!int.TryParse((Request.QueryString["id"] ?? ""), out inspectionid)) {
            Response.Redirect("open_inspection.aspx", true);
        }
        //using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.itemid,b.title type FROM item a LEFT JOIN type b ON a.typeid=b.typeid WHERE a.inventoryid=@1"+ (roomid > 0 ? " AND a.roomid=@2" : ""), inspectionid, roomid)) {
        //    objects.DataSource = reader;
        //    objects.DataBind();
        //}
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
        int.TryParse(rooms.SelectedItem.Value, out roomid);
        if (roomid > 0) {
            Response.Redirect("room_view.aspx?id=" + rooms.SelectedItem.Value, true);
        }
    }
    protected void objectgrid_RowDataBound(object sender, GridViewRowEventArgs e) {
        //e.Row.Cells[0].Visible = false; //hide the ID

        int itemid = 0;
        int.TryParse(e.Row.Cells[0].Text, out itemid);
        e.Row.Cells[0].Visible = false;

        if (e.Row.RowType == DataControlRowType.DataRow) {
            if (itemid > 0) {
                e.Row.Attributes["onclick"] = "document.location = 'object_view.aspx?id=" + itemid.ToString() +"';"; /*"alert('hej');";*/ //this.Page.ClientScript.GetPostBackClientHyperlink(this.objectgrid, "Select$" + e.Row.RowIndex);
            }
        }
    }
}