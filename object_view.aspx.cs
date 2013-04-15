using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Amazon.S3;
using Eaztimate;

public partial class object_view : System.Web.UI.Page
{
    public long inspectionid = 0;
    public long roomid = 0;

    public int slider_price = 0;
    public int slider_usage = 0;
    public int slider_age = 0;
    public int slider_other = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        ((HtmlGenericControl)Master.FindControl("slider")).Visible = false;

        if (!Page.IsPostBack) {

            AmazonS3Client s3client = new AmazonS3Client();
            
            int objectid = 0;
            if (!int.TryParse((Request.QueryString["id"] ?? ""), out objectid)) {
                Response.Redirect("open_inspection.aspx", true);
            }

            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.*,b.inspectionno,b.inventoryid,(SELECT x.title FROM room x WHERE x.roomid=a.roomid) roomname,(SELECT x.title FROM type x WHERE x.typeid=a.typeid) typename FROM item a LEFT JOIN inventory b ON a.inventoryid=b.inventoryid WHERE a.itemid=@1", objectid)) {
                if (reader.Read()) {
                    roomname.Text = reader.GetString(reader.GetOrdinal("roomname"));
                    itemtitle.Text = reader.GetString(reader.GetOrdinal("title"));
                    typename.Text = reader.GetString(reader.GetOrdinal("typename"));
                    //description.Text = reader.GetString(reader.GetOrdinal("description"));
                    //title.Text = reader.GetString(reader.GetOrdinal("title"));
                    slider_price = reader.GetInt32(reader.GetOrdinal("price"));
                    slider_age = reader.GetInt32(reader.GetOrdinal("age"));
                    slider_usage = reader.GetInt32(reader.GetOrdinal("usage"));
                    slider_other = reader.GetInt32(reader.GetOrdinal("other"));
                    roomid = reader.GetInt64(reader.GetOrdinal("roomid"));
                    inspectionno.Text = reader.GetString(reader.GetOrdinal("inspectionno"));
                    inspectionid = reader.GetInt64(reader.GetOrdinal("inventoryid"));
                }
            }

            //using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.itemid,b.title type FROM item a LEFT JOIN type b ON a.typeid=b.typeid WHERE a.roomid=@1", roomid)) {
            //    objects.DataSource = reader;
            //    objects.DataBind();
            //}

            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("image", typeof(string)));
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT a.image,(SELECT x.inspectionno FROM inventory x WHERE x.inventoryid=b.inventoryid) inspectionno FROM itemimage a LEFT JOIN item b ON a.itemid=b.itemid WHERE a.itemid=@1", objectid)) {
                while (reader.Read()) {
                    string url = AmazonHandler.GetPrivateImage(reader.GetString(reader.GetOrdinal("inspectionno")) + "/" + reader.GetString(reader.GetOrdinal("image")));
                    dt.Rows.Add(url);
                }
            }
            imagerepeater.DataSource = dt;
            imagerepeater.DataBind();
        }
    }

    protected void Object_Click(object sender, EventArgs e) {
        //int itemid = 0;
        //int.TryParse(objects.SelectedItem.Value, out itemid);
        //if (itemid > 0) {
        //    Response.Redirect("object_view.aspx?id=" + objects.SelectedItem.Value, true);
        //}
    }
}