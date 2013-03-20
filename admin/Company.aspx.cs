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
        if (!Page.IsPostBack) {
            string action = ((Request.QueryString["id"] ?? string.Empty) == string.Empty ? "Create" : "Edit");
            Page.Title = action + " Company";
            CompanyCreate.Text = action + " Company";
            
            if (int.TryParse((Request.QueryString["id"] ?? string.Empty), out id)) {
                using (SqlDataReader reader = SQL.ExecuteQuery("SELECT * FROM customer WHERE customerid = @1;SELECT userid FROM customerusers WHERE customerid=@1", id)) {
                    if (reader.Read()) {
                        CompanyNameText.Text = reader.GetString(reader.GetOrdinal("title"));
                        CompanyAdress1Text.Text = reader.GetString(reader.GetOrdinal("address1"));
                        CompanyAdress2Text.Text = reader.GetString(reader.GetOrdinal("address2"));
                        CompanyZipText.Text = reader.GetString(reader.GetOrdinal("zip"));
                        CompanyCityText.Text = reader.GetString(reader.GetOrdinal("city"));
                        CompanyContactPersonText.Text = reader.GetString(reader.GetOrdinal("contactperson"));
                        CompanyEmailText.Text = reader.GetString(reader.GetOrdinal("email"));
                        CompanyPhoneText.Text = reader.GetString(reader.GetOrdinal("phone"));
                    }
                    List<Guid> guidlist = new List<Guid>();
                    reader.NextResult();
                    while (reader.Read()) {
                        guidlist.Add((Guid)reader.GetSqlGuid(0));
                    }
                    companylist.DataSource = Membership.GetAllUsers().Cast<MembershipUser>().Where(x => guidlist.Contains((Guid)x.ProviderUserKey)).OrderBy(x => x.UserName).ToList();
                    companylist.DataBind();
                    usersheader.Visible = true;
                }
            }
        }
    }
    protected void CompanyCreate_Click(object sender, EventArgs e) {
        if (int.TryParse(Request.QueryString["id"] ?? string.Empty, out id)) {
            using (SQL.ExecuteQuery("UPDATE customer SET title=@1, address1=@2, address2=@3, zip=@4, city=@5, email=@6, phone=@7, contactperson=@8 WHERE customerid=@9",
                CompanyNameText.Text,
                CompanyAdress1Text.Text,
                CompanyAdress2Text.Text,
                CompanyZipText.Text,
                CompanyCityText.Text,
                CompanyEmailText.Text,
                CompanyPhoneText.Text,
                CompanyContactPersonText.Text,
                id.ToString())) { }
        } else {
            using(SqlDataReader reader = SQL.ExecuteQuery("INSERT INTO customer(title,datecreated,dateupdated,modifiedadminid,address1,address2,zip,city,email,phone,companyid,contactperson) VALUES(@1,GETDATE(),GETDATE(),0,@2,@3,@4,@5,@6,@7,0,@8);SELECT CAST(@@IDENTITY AS INT)",
                CompanyNameText.Text,
                CompanyAdress1Text.Text,
                CompanyAdress2Text.Text,
                CompanyZipText.Text,
                CompanyCityText.Text,
                CompanyEmailText.Text,
                CompanyPhoneText.Text,
                CompanyContactPersonText.Text)) {
                    if (reader.Read()) {
                        id = reader.GetInt32(0);
                    }
                    Response.Redirect("company.aspx?id=" + id.ToString());
            }
        }
    }
}