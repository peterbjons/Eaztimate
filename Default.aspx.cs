using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using WebSupergoo.ABCpdf9;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["showStart"] == null) {
            Response.Redirect("start.aspx", true);
        }

        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
        }
        //Response.Write(BitConverter.ToString(result));
    }
