using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class admin_Company : System.Web.UI.Page
{
    public int id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Roles.IsUserInRole("SuperAdministrator") || Roles.IsUserInRole("Administrator")) {
            if (!Page.IsPostBack) {
                //int id = 0;
                if(Roles.IsUserInRole("SuperAdministrator")) {
                    int.TryParse((Request.QueryString["id"] ?? string.Empty), out id);
                    rolepanel.Visible = true;
                    roleslink.Visible = true;
                } else {
                    using (SqlDataReader reader = SQL.ExecuteQuery("SELECT customerid FROM customerusers WHERE userid=@1", Membership.GetUser().ProviderUserKey)) {
                        if (reader.Read()) {
                            id = reader.GetInt32(0);
                        } else {
                            Response.Redirect("/", true);
                        }
                    }
                }
                string action = (id == 0 ? "Create" : "Edit");
                Page.Title = action + " Company";
                CompanyCreate.Text = action + " Company";

                if (id > 0) {
                    using (SqlDataReader reader = SQL.ExecuteQuery("SELECT * FROM customer WHERE customerid = @1;SELECT userid FROM customerusers WHERE customerid=@1", id)) {
                        if (reader.Read()) {
                            if(id > 0) {
                                titleh2.InnerText = reader.GetString(reader.GetOrdinal("title"));
                                topmenudiv.Visible = true;
                            }            
                            CompanyNameText.Text = reader.GetString(reader.GetOrdinal("title"));
                            CompanyAdress1Text.Text = reader.GetString(reader.GetOrdinal("address1"));
                            CompanyAdress2Text.Text = reader.GetString(reader.GetOrdinal("address2"));
                            CompanyZipText.Text = reader.GetString(reader.GetOrdinal("zip"));
                            CompanyCityText.Text = reader.GetString(reader.GetOrdinal("city"));
                            CompanyContactPersonText.Text = reader.GetString(reader.GetOrdinal("contactperson"));
                            CompanyEmailText.Text = reader.GetString(reader.GetOrdinal("email"));
                            CompanyPhoneText.Text = reader.GetString(reader.GetOrdinal("phone"));
                            CompanyOrgNo.Text = reader.GetString(reader.GetOrdinal("orgno"));
                        }
                        List<Guid> guidlist = new List<Guid>();
                        reader.NextResult();
                        while (reader.Read()) {
                            guidlist.Add((Guid)reader.GetSqlGuid(0));
                        }

                        companylist.DataSource = Membership.GetAllUsers().Cast<MembershipUser>().Where(x => guidlist.Contains((Guid)x.ProviderUserKey)).OrderBy(x => x.UserName).ToList();
                        companylist.DataBind();
                        usersheader.Visible = true;

                        updateRoles();
                    }
                }
            }
        } else {
            Response.Redirect("/",true);
        }
    }

    protected void updateRoles() {
        using (SqlDataReader reader = SQL.ExecuteQuery("SELECT rolename FROM customerroles WHERE customerid=@1", id)) {
            
            List<String> roleslist = new List<String>();
            
            while (reader.Read()) {
                roleslist.Add(reader.GetString(0));
            }

            rolesaddedBox.DataSource = roleslist;
            rolesaddedBox.DataBind();

            rolesBox.DataSource = Roles.GetAllRoles().Cast<String>().Where(x => !roleslist.Contains(x));
            rolesBox.DataBind();
        }
    }

    protected void CompanyCreate_Click(object sender, EventArgs e) {
        if (id > 0) {
            using (SQL.ExecuteQuery("UPDATE customer SET title=@1, address1=@2, address2=@3, zip=@4, city=@5, email=@6, phone=@7, contactperson=@8, orgno=@10 WHERE customerid=@9",
                CompanyNameText.Text,
                CompanyAdress1Text.Text,
                CompanyAdress2Text.Text,
                CompanyZipText.Text,
                CompanyCityText.Text,
                CompanyEmailText.Text,
                CompanyPhoneText.Text,
                CompanyContactPersonText.Text,
                id.ToString(),
                CompanyOrgNo.Text)) { }
        } else {
            using(SqlDataReader reader = SQL.ExecuteQuery("INSERT INTO customer(title,datecreated,dateupdated,modifiedadminid,address1,address2,zip,city,email,phone,companyid,contactperson,orgno) VALUES(@1,GETDATE(),GETDATE(),0,@2,@3,@4,@5,@6,@7,0,@8,@9);SELECT CAST(@@IDENTITY AS INT)",
                CompanyNameText.Text,
                CompanyAdress1Text.Text,
                CompanyAdress2Text.Text,
                CompanyZipText.Text,
                CompanyCityText.Text,
                CompanyEmailText.Text,
                CompanyPhoneText.Text,
                CompanyContactPersonText.Text,
                CompanyOrgNo.Text)) {
                    if (reader.Read()) {
                        id = reader.GetInt32(0);
                    }
                    Response.Redirect("company.aspx?id=" + id.ToString());
            }
        }
    }
    protected void addroleButton_Click(object sender, EventArgs e) {
        if (id>0) {
            for (int i = 0; i < rolesBox.Items.Count; i++) {
                if (rolesBox.Items[i].Selected == true) {
                    using (SQL.ExecuteQuery("INSERT INTO customerroles(customerid,rolename) VALUES(@1,@2)", id, rolesBox.Items[i].Value)) { }
                }
            }
            updateRoles();
        }
    }

    protected void removeroleButton_Click(object sender, EventArgs e) {
        if (id > 0) {
            for (int i = 0; i < rolesaddedBox.Items.Count; i++) {
                if (rolesaddedBox.Items[i].Selected == true) {
                    using (SQL.ExecuteQuery("DELETE FROM customerroles WHERE customerid=@1 AND rolename=@2", id, rolesaddedBox.Items[i].Value)) { }
                }
            }
            updateRoles();
        }
    }
}