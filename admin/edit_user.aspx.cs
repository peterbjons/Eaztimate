using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class admin_edit_user : System.Web.UI.Page
{
    public Guid guid;
    public int companyid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {            
            if (!Guid.TryParse((Request.QueryString["id"] ?? ""), out guid) || (!int.TryParse((Request.QueryString["cid"] ?? ""), out companyid))) {
                Response.Redirect("company.aspx", true);                
            }

            System.Web.Security.MembershipUser user = Membership.GetUser(guid);
            titleh2.InnerText = user.UserName;
            Email.Text = user.Email;

            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT * FROM userdata WHERE userid=@1", guid)) {
                if (reader.Read()) {
                    userdataexists.Value = "true";
                    fname.Text = reader.GetString(reader.GetOrdinal("fname"));
                    lname.Text = reader.GetString(reader.GetOrdinal("lname"));
                    tel1.Text = reader.GetString(reader.GetOrdinal("tel1"));
                    tel2.Text = reader.GetString(reader.GetOrdinal("tel2"));
                }
            }

            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT rolename FROM customerroles WHERE customerid=@1", companyid)) {
                rolesBox.DataSource = reader;
                rolesBox.DataBind();
            }

            foreach (string s in Roles.GetRolesForUser(user.UserName).Cast<String>()) {
                ListItem li = rolesBox.Items.FindByText(s);
                if (li != null) {
                    li.Selected = true;
                }
            }
        }

        //using (SqlDataReader reader = SQL.ExecuteQuery("SELECT * FROM userroles WHERE userid=@1", guid)) {
        //    while (reader.Read()) {
        //        ListItem li = rolesBox.Items.FindByText(reader.GetString(reader.GetOrdinal("")));
        //    }
        //}

    }
    protected void UserEdit_Click(object sender, EventArgs e) {
        Guid guid;
        if (Guid.TryParse((Request.QueryString["id"] ?? ""), out guid)) {
            if (userdataexists.Value.Equals("true")) {
                using (SQL.ExecuteQuery("UPDATE userdata SET fname=@1,lname=@2,tel1=@3,tel2=@4 WHERE userid=@5", fname.Text, lname.Text, tel1.Text, tel2.Text, guid)) { }
            } else {
                using (SQL.ExecuteQuery("INSERT INTO userdata (fname,lname,tel1,tel2,userid) VALUES (@1,@2,@3,@4,@5)", fname.Text, lname.Text, tel1.Text, tel2.Text, guid)) { }
            }
        }
        System.Web.Security.MembershipUser user = Membership.GetUser(guid);
        user.Email = Email.Text;

        List<string> roles = new List<string>();
        foreach (ListItem li in rolesBox.Items) {
            if (li.Selected) {
                roles.Add(li.Text);
            }
        }
        Roles.RemoveUserFromRoles(user.UserName, Roles.GetRolesForUser(user.UserName));
        Roles.AddUserToRoles(user.UserName, roles.ToArray());

    }
}