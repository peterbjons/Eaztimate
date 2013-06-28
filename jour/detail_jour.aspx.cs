using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class jour_detail_jour : System.Web.UI.Page
{

    public int inspectionid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;

        if (!int.TryParse((Request.QueryString["id"] ?? ""), out inspectionid))
        {
            Response.Redirect("open_jour.aspx", true);

        }
        if (!Page.IsPostBack) {

            registerScripts();
        }
    }
    protected void registerScripts()
    {
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "showhide", "expandList($('.room_row_1'), $('.room_row_2'));", true);
    }
}