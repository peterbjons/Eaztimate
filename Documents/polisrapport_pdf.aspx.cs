using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Documents_polisrapport_pdf : System.Web.UI.Page
{

    public string aonr;
    public string clientname;
    public string clientaddress;
    public string clientaddress2;
    public string clientzipcode;
    public string clientcity;
    public string clientorgno;
    public string clientcontact;
    public string address;
    public string zipcode;
    public string city;
    public string buildingno;
    public string createdby;
    public string createdphone;
    public string createdcompany;
    public string createdorgno;
    public string createdaddress;
    public string createdaddress2;
    public string createdzipcode;
    public string createdcity;
    public DateTime timestamp;

    protected void Page_Load(object sender, EventArgs e) {

        int klotterid = 0;
        int.TryParse(Request.QueryString["id"] ?? "5", out klotterid);

        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,(SELECT TOP 1 timestamp FROM klotter_log WHERE klotterid=@1 ORDER BY timestamp ASC) timestamp FROM klotter a WHERE klotterid=@1", klotterid)) {
            if (reader.Read()) {

                clientname = reader.GetString(reader.GetOrdinal("client"));
                clientaddress = reader.GetString(reader.GetOrdinal("clientaddress"));
                clientaddress2 = reader.GetString(reader.GetOrdinal("clientaddress2"));
                clientzipcode = reader.GetString(reader.GetOrdinal("clientzipcode"));
                clientcity = reader.GetString(reader.GetOrdinal("clientcity"));

                timestamp = reader.GetDateTime(reader.GetOrdinal("timestamp"));

                address = reader.GetString(reader.GetOrdinal("address1"));
                zipcode = reader.GetString(reader.GetOrdinal("zipcode"));
                city = reader.GetString(reader.GetOrdinal("city"));
                buildingno = reader.GetString(reader.GetOrdinal("buildingno"));

                aonr = reader.GetString(reader.GetOrdinal("orderno"));


                string username = Membership.GetUserNameByEmail(reader.GetString(reader.GetOrdinal("syncemail")));
                MembershipUser user = Membership.GetUser(username);

                using (SqlDataReader reader2 = Eaztimate.SQL.ExecuteQuery("SELECT a.*,b.* FROM userdata a LEFT JOIN customerusers c ON a.userid = c.userid LEFT JOIN customer b ON c.customerid = b.customerid WHERE a.userid=@1", user.ProviderUserKey)) {
                    if (reader2.Read()) {
                        createdby = reader2.GetString(reader2.GetOrdinal("fname")) + " " + reader2.GetString(reader2.GetOrdinal("lname"));
                        createdphone = (reader2.GetString(reader2.GetOrdinal("tel1")).Length > 0 ? reader2.GetString(reader2.GetOrdinal("tel1")) : "") + (reader2.GetString(reader2.GetOrdinal("tel2")).Length > 0 ? ", " + reader2.GetString(reader2.GetOrdinal("tel2")) : "");
                        createdcompany = reader2.GetString(reader2.GetOrdinal("title"));
                        createdorgno = reader2.GetString(reader2.GetOrdinal("orgno"));
                        createdaddress = reader2.GetString(reader2.GetOrdinal("address1"));
                        createdaddress2 = reader2.GetString(reader2.GetOrdinal("address2"));
                        createdzipcode = reader2.GetString(reader2.GetOrdinal("zip"));
                        createdcity = reader2.GetString(reader2.GetOrdinal("city"));
                        //tel1.Text = reader2.GetString(reader2.GetOrdinal("tel1"));
                        //tel2.Text = reader2.GetString(reader2.GetOrdinal("tel2"));
                    }
                }
            }

        }
    }
}