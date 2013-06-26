using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Security;
using Eaztimate;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using WebSupergoo.ABCpdf9;

public class KlotterSyncController : ApiController
{

    private static string SYNCCODE = "sdjfgjkdsgh4y87sh7f783g673gyag";

    // GET api/<controller>/5
    public CounterObject GetById(string email, string pw)
    {
        CounterObject counter = new CounterObject();
        //int synccount = 0;
        //bool update = false;


        

        //FormsAuthentication.HashPasswordForStoringInConfigFile((email+caseid+"datum"+SYNCCOUNTERCODE), "SHA1");

        
        //FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPassword.Text.Trim(), "SHA1");
        //var counter = counters.FirstOrDefault((p) => p.caseid == caseid);
        //if (counter == null) {
        //    throw new HttpResponseException(HttpStatusCode.NotFound);
        //}
        return counter;        
        
    }

    // POST api/<controller>
    public CounterObject Post(string caseid, string sysid, string email, string sha)
    {
        string hash = Security.SHA1(email + caseid + DateTime.Now.ToUniversalTime().ToString("yyyy-MM-dd") + SYNCCODE).ToLower();
      
        CounterObject counter = new CounterObject();
        if (hash.Equals(sha)) {
            try {
                var jsonSerializer = new JsonSerializer();
                long id = 0;
                
                string data = Request.Content.ReadAsStringAsync().Result;
                JObject klotter = JObject.Parse(data);

                string klotterno = klotter["caseid"].ToString();
                string pw = klotter["password"].ToString();

                string username = Membership.GetUserNameByEmail(email);
                MembershipUser user = Membership.GetUser(username);

                using (SqlDataReader reader = SQL.ExecuteQuery("SELECT token FROM logintokens WHERE dateexpires > GETDATE() AND userid=@1", user.ProviderUserKey)) {
                    if (reader.Read()) {
                        //counter.data = reader.GetGuid(0).ToString();
                        hash = Security.SHA1(email + reader.GetGuid(0).ToString() + DateTime.Now.ToUniversalTime().ToString("yyyy-MM-dd") + caseid).ToLower();
                        if (!hash.Equals(pw)) {
                            counter.success = "Error";
                            counter.message = "Wrong hash";
                            return counter;
                        }
                        //ccase.email+settings.getString("token", null)+EaztimateSecurity.GetUTCdatetimeAsString()+ccase.caseid

                    } else {
                        counter.success = "Expired";
                        counter.message = "Token Expired";
                        return counter;
                    }
                }

                //---------------------------------------------------------------------
                int customerid = 1; //fix later
                //---------------------------------------------------------------------

                //string lccaseid = klotter["lc_caseno"].ToString();

                //string contactname = klotter["contactname"].ToString();
                string title = klotter["title"] != null ? klotter["title"].ToString() : "";
                string caseno = klotter["caseno"] != null ? klotter["caseno"].ToString() : "";
                string buildingno = klotter["buildingno"] != null ? klotter["buildingno"].ToString() : "";
                string address = klotter["address"] != null ? klotter["address"].ToString() : "";
                string contactzipcode = klotter["zipcode"] != null ? klotter["zipcode"].ToString() : "";
                string contactcity = klotter["city"] != null ? klotter["city"].ToString() : "";
                double latitude = 0, longitude = 0, accuracy = 0;
                double.TryParse(klotter["latitude"] != null ? klotter["latitude"].ToString() : "", out latitude);
                double.TryParse(klotter["longitude"] != null ? klotter["longitude"].ToString() : "", out longitude);
                double.TryParse(klotter["locaccuracy"] != null ? klotter["locaccuracy"].ToString() : "", out accuracy);

                string desc =  klotter["workdescription"] != null ? klotter["workdescription"].ToString() : "";

                string client = klotter["client"] != null ? klotter["client"].ToString() : "";
                string clientno = klotter["clientno"] != null ?  klotter["clientno"].ToString() : "";
                string clientaddress = klotter["clientaddress"] != null ? klotter["clientaddress"].ToString() : "";
                string clientaddress2 = klotter["clientaddress2"] != null ? klotter["clientaddress2"].ToString() : "";
                string clientzip = klotter["clientzipcode"] != null ? klotter["clientzipcode"].ToString() : "";
                string clientcity = klotter["clientcity"] != null ? klotter["clientcity"].ToString() : "";

                bool policereport = (klotter["policereport"] != null ? (bool)klotter["policereport"] : false);
                string policereporttext = klotter["policereporttext"] != null ? klotter["policereporttext"].ToString() : "";

                int hours = 0, minutes = 0;
                int.TryParse(klotter["hours"] != null ? klotter["hours"].ToString() : "", out hours);
                int.TryParse(klotter["minutes"] != null ? klotter["minutes"].ToString() : "", out minutes);

                bool pressurewasher = (klotter["pressurewasher"] != null ? (bool)klotter["pressurewasher"] : false);
                bool pressurewasherRecycle = (klotter["pressurewasherRecycle"] != null ? (bool)klotter["pressurewasherRecycle"] : false);
                bool handwash = (klotter["handwashing"] != null ? (bool)klotter["handwashing"] : false);

                JObject chem = (JObject)klotter["chem"];

                string chemname = string.Empty;
                int amount = 0;
                if (chem != null) {
                    chemname = chem["name"] != null ? chem["name"].ToString() : "";
                    int.TryParse(chem["amount"] != null ? chem["amount"].ToString() : "", out amount);
                }                                

                bool klotterexists = false;

                using (SqlDataReader reader = SQL.ExecuteQuery("SELECT klotterid FROM klotter WHERE klotterno LIKE @1", klotterno)) {
                    if (reader.Read()) {
                        klotterexists = true;
                        id = reader.GetInt64(0);
                    }
                }

                if (klotterexists) {
                    using (SQL.ExecuteQuery("DELETE FROM klotter WHERE klotterno LIKE @1", klotterno)) { }
                }

               //if (!klotterexists) {
                    using (SqlConnection con = SQL.CreateConnection()) {
                        using (SqlTransaction trans = con.BeginTransaction(IsolationLevel.ReadCommitted)) {
                            try {
                                using (SqlDataReader reader = SQL.ExecuteTransQuery(con, trans, "INSERT INTO klotter(klotterno,syncemail,datecreated,dateupdated,title,address1,zipcode,city,latitude,longitude,accuracy,buildingno,description," +
                                    "client,clientno,clientaddress,clientaddress2,clientzipcode,clientcity,policereport,policereporttext,hours,minutes,pressurewasher,pwrecycle,handwashing,customerid,orderno)" +
                                    " VALUES(@1,@2,GETDATE(),GETDATE(),@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@24,@25,@26);SELECT CAST(@@IDENTITY AS BIGINT)",
                                    klotterno, email, title, address, contactzipcode, contactcity, latitude, longitude, accuracy, buildingno, desc,
                                        client, clientno, clientaddress, clientaddress2, clientzip, clientcity, policereport, policereporttext,
                                        hours, minutes, pressurewasher, pressurewasherRecycle, handwash, customerid, caseno)) {
                                    if (reader.Read()) {
                                        id = reader.GetInt64(0);
                                    }
                                }

                                using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO klotter_chem (klotterid,title,amount) SELECT klotterid, @2,@3 FROM klotter WHERE klotterno LIKE @1", klotterno, chemname, amount)) { }

                                JArray images = (JArray)klotter["beforeimages"];
                                if (images != null) {
                                    foreach (String image in images) {
                                        using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO klotter_image (klotterid,image,type) SELECT klotterid ,@2,@3 FROM klotter WHERE klotterno LIKE @1", klotterno, new FileInfo(image).Name, 0)) { }
                                    }
                                }

                                images = (JArray)klotter["afterimages"];
                                if (images != null) {
                                    foreach (String image in images) {
                                        using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO klotter_image (klotterid,image,type) SELECT klotterid ,@2,@3 FROM klotter WHERE klotterno LIKE @1", klotterno, new FileInfo(image).Name, 1)) { }
                                    }
                                }

                                JArray tags = (JArray)klotter["tags"];
                                if (tags != null) {
                                    foreach (String tag in tags) {
                                        using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO klotter_tag (klotterid,tag) SELECT klotterid ,@2 FROM klotter WHERE klotterno LIKE @1", klotterno, tag)) { }
                                    }
                                }

                                DateTime timestamp;

                                JArray logs = (JArray)klotter["loglist"];
                                if (logs != null) {
                                    foreach (JObject log in logs) {
                                        DateTime.TryParse((log["timestamp"] != null ? log["timestamp"].ToString() : ""), out timestamp);
                                        if (timestamp < (DateTime)SqlDateTime.MinValue) {
                                            timestamp = DateTime.Now;
                                        }
                                        string activity = log["activity"] != null ? log["activity"].ToString() : "";
                                        string comment =  log["comment"] != null ? log["comment"].ToString() : "";

                                        using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO klotter_log (klotterid,timestamp,dateupdated,activity,comment) SELECT klotterid ,@2, GETDATE(),@3,@4 FROM klotter WHERE klotterno LIKE @1", klotterno, timestamp, activity, comment)) { }
                                    }
                                }

                                trans.Commit();
                            } catch (Exception ex) {
                                trans.Rollback();
                                //throw ex;
                                counter.success = "FAIL";
                                counter.message = ex.Message;
                            }
                        }
                    }
               // }

               bool success = false;
               if (id > 0) {
                   success = createPdf(id, klotterno, email);
                   if (policereport && success) {
                       success = createpolicereportPdf(id, klotterno, email);
                   }
                   //success = true;
               }

               if (success) {
                   counter.success = "OK";
                   counter.message = "Success";
               } else {
                   counter.success = "FAIL";
                   counter.message = "Couldn't crreate PDF";
               }


               //string success = string.Empty;
               //if (id > 0) {
               //    success = createPdf(id, journo, email);
               //}
               //if (success.Length == 0) {
               //    counter.success = "OK";
               //    counter.message = "Success";
               //} else {
               //    counter.success = "FAIL";
               //    counter.message = success;
               //}
            } catch (Exception ex) {
                //if (!System.Diagnostics.EventLog.SourceExists("Eaztimate")) {
                //    System.Diagnostics.EventLog.CreateEventSource("Eaztimate", "Application");
                //}
                counter.success = "FAIL";
                //System.Diagnostics.EventLog log = new System.Diagnostics.EventLog();
                //log.Source = "Eaztimate";
                //log.WriteEntry(String.Format("\r\n\r\nApplication Error\r\n\r\n" +
                //                             "MESSAGE: {0}\r\n" +
                //                             "SOURCE: {1}\r\n" +
                //                             "TARGETSITE: {4}\r\n" +
                //                             "STACKTRACE: {5}\r\n",
                //                             ex.Message,
                //                             ex.Source,
                //                             ex.TargetSite,
                //                             ex.StackTrace),
                //                             System.Diagnostics.EventLogEntryType.Error);
                
                counter.message = ex.Message;
                //throw ex;
            }
        } else {
            counter.success = "FAIL";
            counter.message = "fel hash...";
        }

        return counter;
    }

    // PUT api/<controller>/5
    public void Put(string caseid, string sysid, string email, string sha, [FromBody]string value)
    {
        //string hash = Security.SHA1(email + caseid + DateTime.Now.ToUniversalTime().ToString("yyyy-MM-dd") + SYNCCODE).ToLower();

        //int a = 0;
        //CounterObject counter = new CounterObject();
        //if (hash.Equals(sha)) {
        //    try {
        //        //using (SqlDataReader reader = SQL.ExecuteQuery("SELECT * FROM ocabpayment WHERE caseid LIKE @1 AND sysid=@2 AND ocabreportid=@3", caseid, sysid, reportid)) {
        //        //    if (reader.Read()) {
        //        //        synccount = reader.GetInt32(reader.GetOrdinal("synccounter")) + 1;
        //        //        update = true;
        //        //    }
        //        //}
        //        //if (update) {
        //        //    using (SQL.ExecuteQuery("UPDATE ocabpayment SET synccounter=@1 WHERE caseid LIKE @2 AND sysid=@3 AND ocabreportid=@4", synccount, caseid, sysid, reportid)) { }
        //        //} else {
        //        //    using (SQL.ExecuteQuery("INSERT INTO ocabpayment (caseid,sysid,email,datecreated,datelastsync,synccounter,ocabreportid) VALUES(@1,@2,@3,GETDATE(),GETDATE(),1,@4)", caseid, sysid, email, reportid)) { }
        //        //}

        //        counter.success = "OK";
        //        counter.message = "Success";
        //    } catch (Exception ex) {
        //        counter.success = "FAIL";
        //        counter.message = ex.Message;
        //    }
        //} else {
        //    counter.success = "FAIL";
        //    counter.message = "fel hash...";
        //}

        //return counter;
    }

    public static bool createPdf(long kid,string klotterno,string email) {
        string contents = string.Empty;

        MemoryStream ms = new MemoryStream();

        try {
            int id;
            Doc doc = new Doc();

            doc.MediaBox.String = "A4";
            doc.Rect.String = doc.MediaBox.String;
            //doc.Rect. = doc.CropBox;
            doc.HtmlOptions.BrowserWidth = 980;
            doc.HtmlOptions.FontEmbed = true;
            doc.HtmlOptions.FontSubstitute = false;
            doc.HtmlOptions.FontProtection = false;
            doc.HtmlOptions.ImageQuality = 33;
            Random rnd = new Random();
            id = doc.AddImageUrl("http://" + HttpContext.Current.Request.Url.Host + "/Documents/klotter_pdf.aspx?id=" + kid.ToString() + "&uid="+ email +"&rnd=" + rnd.Next(50000));

            while (true) {
                //doc.FrameRect();
                if (!doc.Chainable(id)) {
                    break;
                }
                doc.Page = doc.AddPage();
                id = doc.AddImageToChain(id);
            }                        

            for (int i = 0; i < doc.PageCount; i++) {
                doc.PageNumber = i;
                doc.Flatten();
            }

            //doc.AddImageHtml(contents);
            //doc.Save(Server.MapPath("htmlimport.pdf"));
            doc.Save(ms);
            //doc.SaveOptions.
            doc.Clear();

            bool mail = Common.PdfMail(ms, email, "Klotter");
            if (mail) {
                return AmazonHandler.PutPdfKlotter(ms, klotterno, 0);
            }
            return false;

            //}
        } catch (Exception ex) {
            return false;
        }
    }

    public static bool createpolicereportPdf(long kid, string klotterno, string email) {
        string contents = string.Empty;

        MemoryStream ms = new MemoryStream();

        try {
            int id;
            Doc doc = new Doc();

            doc.MediaBox.String = "A4";
            doc.Rect.String = doc.MediaBox.String;
            //doc.Rect. = doc.CropBox;
            doc.HtmlOptions.BrowserWidth = 980;
            doc.HtmlOptions.FontEmbed = true;
            doc.HtmlOptions.FontSubstitute = false;
            doc.HtmlOptions.FontProtection = false;
            doc.HtmlOptions.ImageQuality = 33;
            Random rnd = new Random();
            id = doc.AddImageUrl("http://" + HttpContext.Current.Request.Url.Host + "/Documents/polisrapport_pdf.aspx?id=" + kid.ToString() + "&uid=" + email + "&rnd=" + rnd.Next(50000));

            while (true) {
                //doc.FrameRect();
                if (!doc.Chainable(id)) {
                    break;
                }
                doc.Page = doc.AddPage();
                id = doc.AddImageToChain(id);
            }

            //doc.Rect.String = "10 780 595 840";
            //doc.HPos = 0.5;
            //doc.VPos = 0.0;
            //doc.Color.String = "0 255 0";
            //doc.FontSize = 36;
            //for (int i = 1; i <= doc.PageCount; i++) {
            //    doc.PageNumber = i;
            //    id = doc.AddImageUrl("http://" + HttpContext.Current.Request.Url.Host + "/Documents/header.aspx?id=" + kid.ToString() + "&rnd=" + rnd.Next(50000));                    
            //}

            //doc.Rect.String = "10 0 585 100";
            //doc.HPos = 0.5;
            //doc.VPos = 1.0;
            ////doc.FontSize = 36;
            ////for (int i = 1; i <= doc.PageCount; i++) {
            //    doc.PageNumber = 1;
            //    id = doc.AddImageUrl("http://" + HttpContext.Current.Request.Url.Host + "/Documents/footer.aspx?rnd=" + rnd.Next(50000));
            //    //doc.AddText("Page " + i.ToString() + " of " + doc.PageCount.ToString());
            //    //doc.FrameRect();
            ////}

            for (int i = 0; i < doc.PageCount; i++) {
                doc.PageNumber = i;
                doc.Flatten();
            }

            //doc.AddImageHtml(contents);
            //doc.Save(Server.MapPath("htmlimport.pdf"));
            doc.Save(ms);
            //doc.SaveOptions.
            doc.Clear();

            bool mail = Common.PdfMail(ms, email, "Polisanmälan");
            if (mail) {
                return AmazonHandler.PutPdfKlotter(ms, klotterno, 1);
            }
            return false;

            //}
        } catch (Exception ex) {
            return false;
        }
    }
}
