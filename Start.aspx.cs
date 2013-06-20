﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Start : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie myCookie = new HttpCookie("showStart");
        myCookie["version"] = "1";
        myCookie.Expires = DateTime.Now.AddDays(30d);
        Response.Cookies.Add(myCookie);
    }
}