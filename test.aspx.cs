using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Eaztimate;

public partial class test : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT code,email+'-'+app email FROM gcm_codes")) {
                emailddl.DataSource = reader;
                emailddl.DataBind();
            }
            messageddl.Items.Add(new ListItem("Info", "info_item"));
            messageddl.Items.Add(new ListItem("Update", "update_item"));
            messageddl.Items.Add(new ListItem("Case", "case_item"));
        }
    }
    protected void sendbutton_Click(object sender, EventArgs e) {
        string regId = emailddl.SelectedItem.Value;
 // applicationID means google Api key                                                                                                     
        var applicationID = "AIzaSyAXlinMv3YBJL5SqZaGX1CpyfyeD1pfDYg";
        var SENDER_ID = "77xxxxx625";

        var value = messagebox.Text; //message text box 
        WebRequest tRequest;
        tRequest = WebRequest.Create("https://android.googleapis.com/gcm/send");
        tRequest.Method = "post";
        tRequest.ContentType = " application/x-www-form-urlencoded;charset=UTF-8";
        tRequest.Headers.Add(string.Format("Authorization: key={0}", applicationID));
        tRequest.Headers.Add(string.Format("Sender: id={0}", SENDER_ID));

        string postData =
            (messageddl.SelectedItem.Value == "Update" ? "collapse_key=update&" : "") + "time_to_live=108&delay_while_idle=1&data.message="
               + value + "&data.time=" + System.DateTime.Now.ToString() + "&data.messagetype=" + messageddl.SelectedItem.Value + "&registration_id=" +
                  regId + "";

        Console.WriteLine(postData);

        Byte[] byteArray = Encoding.UTF8.GetBytes(postData);

        tRequest.ContentLength = byteArray.Length;

        Stream dataStream = tRequest.GetRequestStream();

        dataStream.Write(byteArray, 0, byteArray.Length);

        dataStream.Close();

        WebResponse tResponse = tRequest.GetResponse();

        dataStream = tResponse.GetResponseStream();

        StreamReader tReader = new StreamReader(dataStream);

        String sResponseFromServer = tReader.ReadToEnd();   //Get response from GCM server.

        resultlabel.Text = sResponseFromServer;      //Assigning GCM response to Label text 

        tReader.Close();

        dataStream.Close();
        tResponse.Close();        
    }
}