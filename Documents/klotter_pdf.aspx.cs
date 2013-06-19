using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Documents_klotter_pdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int klotterid = 0;
        int.TryParse(Request.QueryString["id"] ?? "5", out klotterid);


    }
}