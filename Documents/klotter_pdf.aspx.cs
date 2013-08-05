using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Documents_klotter_pdf : System.Web.UI.Page
{
    public string klotterno;
    public string title;
    public string address;
    public string zipcode;
    public string city;
    public string clientaddress;
    public string clientaddress2;
    public string clientzipcode;
    public string clientcity;
    public string buildingno;
    public string createdby;
    public string phone1;
    public string time;
    public string policereport;
    public string comment;
    public string client;
    public string clientno;
    public string tags;
    public DateTime datecreated;

    protected void Page_Load(object sender, EventArgs e)
    {
        int klotterid = 0;
        int.TryParse(Request.QueryString["id"] ?? "5", out klotterid);

        StringBuilder sb = new StringBuilder();

        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,(SELECT TOP 1 timestamp FROM klotter_log WHERE klotterid=@1 ORDER BY timestamp ASC) timestamp FROM klotter a WHERE klotterid=@1", klotterid)) {
            if (reader.Read()) {
                //string klotternos = reader.GetString(reader.GetOrdinal("orderno"));
                klotterno = reader.GetString(reader.GetOrdinal("orderno"));
                title = reader.GetString(reader.GetOrdinal("title"));
                buildingno = reader.GetString(reader.GetOrdinal("buildingno"));
                datecreated = reader.GetDateTime(reader.GetOrdinal("datecreated"));

                address = reader.GetString(reader.GetOrdinal("address1"));
                zipcode = reader.GetString(reader.GetOrdinal("zipcode"));
                city = reader.GetString(reader.GetOrdinal("city"));

                string username = Membership.GetUserNameByEmail(reader.GetString(reader.GetOrdinal("syncemail")));
                MembershipUser user = Membership.GetUser(username);

                using (SqlDataReader reader2 = Eaztimate.SQL.ExecuteQuery("SELECT * FROM userdata WHERE userid=@1", user.ProviderUserKey)) {
                    if (reader2.Read()) {
                        createdby = reader2.GetString(reader2.GetOrdinal("fname")) + " " + reader2.GetString(reader2.GetOrdinal("lname"));
                        phone1 = reader2.GetString(reader2.GetOrdinal("tel1"));
                        //tel1.Text = reader2.GetString(reader2.GetOrdinal("tel1"));
                        //tel2.Text = reader2.GetString(reader2.GetOrdinal("tel2"));
                    }
                }

                int hours = reader.GetInt32(reader.GetOrdinal("hours"));
                int minutes = reader.GetInt32(reader.GetOrdinal("minutes"));
                time = (hours > 0 ? hours.ToString() + " timmar " : "") + (minutes > 0 ? minutes.ToString() + " min" : "");

                policereport = reader.GetBoolean(reader.GetOrdinal("policereport")) ? "Ja" : "Nej";

                sb.Clear();
                sb.Append(reader.GetBoolean(reader.GetOrdinal("pressurewasher")) ? "Högtryckstvätt<br/>" : "");
                sb.Append(reader.GetBoolean(reader.GetOrdinal("pwrecycle")) ? "Högtryckstvätt recycle<br/>" : "");
                sb.Append(reader.GetBoolean(reader.GetOrdinal("handwashing")) ? "Handtvätt<br/>" : "");
                actions.Text = sb.ToString();

                comment = reader.GetString(reader.GetOrdinal("description"));

                client = reader.GetString(reader.GetOrdinal("client"));
                clientno = reader.GetString(reader.GetOrdinal("clientno"));

                clientaddress = reader.GetString(reader.GetOrdinal("clientaddress"));
                clientaddress2 = reader.GetString(reader.GetOrdinal("clientaddress2"));
                clientzipcode = reader.GetString(reader.GetOrdinal("clientzipcode"));
                clientcity = reader.GetString(reader.GetOrdinal("clientcity"));

            }
        }


        sb.Clear();
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT tag FROM klotter_tag a WHERE klotterid=@1", klotterid)) {
            while (reader.Read()) {
                sb.Append(sb.Length > 0 ? ", " : "");
                sb.Append(reader.GetString(0));
            }
        }
        tags = sb.ToString();

        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("image", typeof(string)));
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,b.klotterno FROM klotter_image a LEFT JOIN klotter b on a.klotterid=b.klotterid WHERE a.klotterid=@1 AND type=0", klotterid)) {
            while (reader.Read()) {
                string url = AmazonHandler.GetPrivateImageKlotter(reader.GetString(reader.GetOrdinal("klotterno")) + "/" + reader.GetString(reader.GetOrdinal("image")));
                dt.Rows.Add(url);
            }
        }
        beforeimagerepeater.DataSource = dt;
        beforeimagerepeater.DataBind();

        dt.Clear();
        using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT a.*,b.klotterno FROM klotter_image a LEFT JOIN klotter b on a.klotterid=b.klotterid WHERE a.klotterid=@1 AND type=1", klotterid)) {
            while (reader.Read()) {
                string url = AmazonHandler.GetPrivateImageKlotter(reader.GetString(reader.GetOrdinal("klotterno")) + "/" + reader.GetString(reader.GetOrdinal("image")));
                dt.Rows.Add(url);
            }
        }
        afterimagerepeater.DataSource = dt;
        afterimagerepeater.DataBind();
    }
}