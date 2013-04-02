using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Eaztimate;
using Microsoft.AspNet.Membership.OpenAuth;

public partial class Account_Register : Page
{
    int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!int.TryParse(Request.QueryString["id"] ?? string.Empty, out id)) {
            Response.Redirect("list_company.aspx", true);
        }

        if (!Page.IsPostBack) {
            rolesBox.SelectedIndex = -1;

            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT rolename FROM customerroles WHERE customerid=@1", id)) {

                rolesBox.DataSource = reader;
                rolesBox.DataBind();
            }


            //rolesBox.DataSource = Roles.GetAllRoles();
            //rolesBox.DataBind();
        }
    }

    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser(RegisterUser.UserName);
        using (Eaztimate.SQL.ExecuteQuery("INSERT INTO customerusers(customerid,userid) VALUES(@1,@2)", id, (Guid)user.ProviderUserKey)) { }

        List<string> roles = new List<string>();
        for (int i = 0; i < rolesBox.Items.Count; i++) {
            if (rolesBox.Items[i].Selected == true) {
                roles.Add(rolesBox.Items[i].Value);
            }
        }

        Roles.AddUserToRoles(RegisterUser.UserName, roles.ToArray());
        Response.Redirect("company.aspx?id=" + id.ToString());        
    }
}