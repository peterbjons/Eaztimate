using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_User_groups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            bindData();
        }
    }

    protected void bindData() {
        rolesBox.SelectedIndex = -1;
        rolesBox.DataSource = Roles.GetAllRoles();
        rolesBox.DataBind();
    }

    protected void UserGroupCreate_Click(object sender, EventArgs e) {
        if(UserGroupNameText.Text.Length > 2) {
            Roles.CreateRole(UserGroupNameText.Text);
            bindData();
            UserGroupNameText.Text = "";
        }        
    }
    protected void UserGroupDelete_Click(object sender, EventArgs e) {
        for (int i = 0; i < rolesBox.Items.Count; i++) {
            if (rolesBox.Items[i].Selected == true) {
                Roles.DeleteRole(rolesBox.Items[i].Value);
            }
        }        
        bindData();
    }
}