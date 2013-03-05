using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    public string imageurl = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        imagetag.Src = AmazonHandler.GetPrivateImageOcab("015025/IMG_015025-2-20130211_192758.jpg");
    }
}