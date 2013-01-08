﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;
using System.Collections;
using WebSupergoo.ABCpdf9;

public partial class pdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
        int inspectionid = 11;
        //if (!int.TryParse((Request.QueryString["id"] ?? ""), out inspectionid)) {
        //    Response.Redirect("open_inspection.aspx", true);
        //}
        if (!Page.IsPostBack) {
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.* FROM inventory a WHERE a.inventoryid=@1", inspectionid)) {
                if (reader.Read()) {
                    inspectionno.Text = reader.GetString(reader.GetOrdinal("inspectionno"));
                    description.Text = reader.GetString(reader.GetOrdinal("description"));
                    damagetype.Text = reader.GetString(reader.GetOrdinal("damagetype"));
                    address.Text = reader.GetString(reader.GetOrdinal("address1")) + ", " + reader.GetString(reader.GetOrdinal("zipcode")) + " " + reader.GetString(reader.GetOrdinal("city"));
                    damagedate.Text = reader.GetDateTime(reader.GetOrdinal("datedamage")).ToString("yyyy-MM-dd");
                    size.Text = reader.GetInt32(reader.GetOrdinal("livingarea")) + " + " + reader.GetInt32(reader.GetOrdinal("otherarea"));
                    int adults = reader.GetInt32(reader.GetOrdinal("adults"));
                    int teens = reader.GetInt32(reader.GetOrdinal("teens"));
                    int kids = reader.GetInt32(reader.GetOrdinal("kids"));
                    inhabitants.Text = adults + " vux" + (adults > 1 ? "ar" : "en") + (teens > 0 ? ", " + teens.ToString() + " tonåring" + (teens > 1 ? "ar" : "") : "") + (kids > 0 ? ", " + kids.ToString() + "barn" : "");
                }
            }        
        }
    }
    protected void printbutton_Click(object sender, EventArgs e) {

        string contents = string.Empty;

        MemoryStream ms = new MemoryStream();
        using (StringWriter sw = new StringWriter()) {
            Server.Execute("Documents/report.aspx", sw);
            contents = sw.ToString();
            sw.Close();
        }       

        try {

            Doc doc = new Doc();
            doc.EmbedFont(Server.MapPath("Fonts/") + "OpenSans-Regular.ttf");
            doc.HtmlOptions.BrowserWidth = 960;
            //doc.AddImageUrl("http://192.168.1.100/documents/report.aspx");
            doc.AddImageHtml(contents);
            //doc.Save(Server.MapPath("htmlimport.pdf"));
            doc.Save(ms);
            //doc.SaveOptions.
            doc.Clear(); 



                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", string.Format("attachment;filename=File-{0}.pdf", 1));
                Response.BinaryWrite(ms.ToArray());

            //}
        } catch (Exception ex) {
            Response.Write(ex.Message);
        }
    }
}