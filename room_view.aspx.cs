using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Conf = System.Configuration.ConfigurationManager;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Amazon.S3;
using Eaztimate;
using System.Data;

public partial class room_view : System.Web.UI.Page
{
    public long inspectionid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            AmazonS3Client s3client = new AmazonS3Client();

            ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;
            int roomid = 0;            
            if (!int.TryParse((Request.QueryString["id"] ?? ""), out roomid)) {
                Response.Redirect("open_inspection.aspx", true);
            }
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.*,b.inspectionno,b.inventoryid FROM room a LEFT JOIN inventory b ON a.inventoryid=b.inventoryid WHERE a.roomid=@1", roomid)) {
                if (reader.Read()) {
                    opinion.Text = reader.GetString(reader.GetOrdinal("opinion"));
                    description.Text = reader.GetString(reader.GetOrdinal("description"));
                    title.Text = reader.GetString(reader.GetOrdinal("title"));
                    inspectionno.Text = reader.GetString(reader.GetOrdinal("inspectionno"));
                    inspectionid = reader.GetInt64(reader.GetOrdinal("inventoryid"));
                }
            }
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.itemid,b.title type FROM item a LEFT JOIN type b ON a.typeid=b.typeid WHERE a.roomid=@1", roomid)) {
                objects.DataSource = reader;
                objects.DataBind();
            }

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("image", typeof(string)));
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.image,(SELECT x.inspectionno FROM inventory x WHERE x.inventoryid=b.inventoryid) inspectionno FROM roomimage a LEFT JOIN room b ON a.roomid=b.roomid WHERE a.roomid=@1", roomid)) {
                while (reader.Read()) {
                    string url = AmazonHandler.GetPrivateImage(reader.GetString(reader.GetOrdinal("inspectionno"))+"/"+reader.GetString(reader.GetOrdinal("image")));
                    dt.Rows.Add(url);                   
                }
            }
            imagerepeater.DataSource = dt;
            imagerepeater.DataBind();
        }
    }
}