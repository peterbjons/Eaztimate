﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Documents_klotter_pdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int klotterid = 0;
        int.TryParse(Request.QueryString["id"] ?? "5", out klotterid);
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,(SELECT TOP 1 timestamp FROM klotter_log WHERE klotterid=@1 ORDER BY timestamp ASC) timestamp FROM klotter a WHERE klotterid=@1", klotterid)) {
            if (reader.Read()) {
                klotterno.Text = reader.GetString(reader.GetOrdinal("orderno"));
                title.Text = reader.GetString(reader.GetOrdinal("title"));
                buildingno.Text = reader.GetString(reader.GetOrdinal("buildingno"));

                address.Text = reader.GetString(reader.GetOrdinal("address1"));
                zipcode.Text = reader.GetString(reader.GetOrdinal("zipcode"));
                city.Text = reader.GetString(reader.GetOrdinal("city"));

                StringBuilder sb = new StringBuilder();
                sb.Append(reader.GetBoolean(reader.GetOrdinal("pressurewasher")) ? "Högtryckstvätt" : "");
                sb.Append(reader.GetBoolean(reader.GetOrdinal("pwrecycle")) ? "Högtryckstvätt recycle" : "");
                sb.Append(reader.GetBoolean(reader.GetOrdinal("handwash")) ? "Handtvätt" : "");
            }
        }

    }
}