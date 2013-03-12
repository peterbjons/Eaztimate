using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Membership.OpenAuth;

public partial class Account_Register : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        if (!Page.IsPostBack) {
            rolesBox.SelectedIndex = -1;
            rolesBox.DataSource = Roles.GetAllRoles();
            rolesBox.DataBind();
        }
    }

    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        Roles.AddUserToRole(RegisterUser.UserName, rolesBox.SelectedValue);
        //FormsAuthentication.SetAuthCookie(RegisterUser.UserName, createPersistentCookie: false);

        //string continueUrl = RegisterUser.ContinueDestinationPageUrl;
        //if (!OpenAuth.IsLocalUrl(continueUrl))
        //{
        //    continueUrl = "~/";
        //}
        //Response.Redirect(continueUrl);
    }
}