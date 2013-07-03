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

public class JourSyncController : ApiController
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
                JObject jour = JObject.Parse(data);

                string journo = jour["caseid"].ToString();
                string pw = jour["password"].ToString();

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

                string lccaseid = jour["lc_caseno"].ToString();

                string contactname = jour["contactname"].ToString();
                string contactaddress = jour["contactaddress1"].ToString();
                string contactaddress2 = jour["contactaddress2"].ToString();
                string contactpersonalnumber = jour["contactpersonalnumber"].ToString();
                string contactphone1 = jour["contactphone1"].ToString();
                string contactphone2 = jour["contactphone2"].ToString();
                string contactzipcode = jour["contactzipcode"].ToString();
                string contactcity = jour["city"].ToString();                
                
                string damagedescription = jour["damagedescription"].ToString();
                string damagetype = jour["damagetype"].ToString();
                
                string insurancetype = jour["insurancetype"].ToString();
                string insurancenumber = jour["insurancenumber"].ToString();

                string actiondescription = jour["actiondescription"].ToString();
                string externalentrepeneur = jour["externalentrepeneur"].ToString();

                int action = 0;
                int.TryParse(jour["contact_action"].ToString(), out action);
                bool contactinformed = (jour["contactinformed"] != null ? (bool)jour["contactinformed"] : false);

                bool building_power = (jour["buildingpower"] != null ? (bool)jour["buildingpower"] : false);
                bool building_lockable = (jour["buildinglockable"] != null ? (bool)jour["buildinglockable"] : false);
                bool building_function = (jour["buildingfunction"] != null ? (bool)jour["buildingfunction"] : false);
                bool building_climatesafe = (jour["buildingclimatesafe"] != null ? (bool)jour["buildingclimatesafe"] : false);

                bool action_transport = (jour["action_transport"] != null ? (bool)jour["action_transport"] : false);
                bool action_otherliving = (jour["action_otherliving"] != null ? (bool)jour["action_otherliving"] : false);
                bool action_helpcontact = (jour["buildingpower"] != null ? (bool)jour["action_helpcontact"] : false);
                bool action_cash = (jour["action_cash"] != null ? (bool)jour["action_cash"] : false);

                //INSERT INTO jour

                bool jourexists = false;

                using (SqlDataReader reader = SQL.ExecuteQuery("SELECT jourid FROM jour WHERE journo LIKE @1", journo)) {
                    if (reader.Read()) {
                        jourexists = true;
                        id = reader.GetInt64(0);                        
                    }
                }

               if (!jourexists) {
                    using (SqlConnection con = SQL.CreateConnection()) {
                        using (SqlTransaction trans = con.BeginTransaction(IsolationLevel.ReadCommitted)) {
                            try {
                                using (SqlDataReader reader = SQL.ExecuteTransQuery(con, trans, "INSERT INTO jour(journo,syncemail,datecreated,dateupdated,contactname,contactaddress,contactaddress2,contactzipcode,contactcity,contactpersonalnumber,insurancenumber,insurancetype,damagetype,actiondescription,externalentrepeneur,damagedescription,contactinformed,contactaction,action_otherliving,action_cash,action_transport,action_helpcontact,building_power,building_lockable,building_climatesafe,building_function,customerid,contactphone1,contactphone2,lccaseid)" +
                                    " VALUES(@1,@2,GETDATE(),GETDATE(),@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@24,@25,@26,@27,@28);SELECT CAST(@@IDENTITY AS BIGINT)",
                                    journo, email, contactname, contactaddress, contactaddress2, contactzipcode, contactcity, contactpersonalnumber, insurancenumber,
                                    insurancetype, damagetype, actiondescription, externalentrepeneur, damagedescription, contactinformed, action,
                                    action_otherliving, action_cash, action_transport, action_helpcontact, building_power, building_lockable, building_climatesafe, building_function, customerid, contactphone1, contactphone2, lccaseid)) {
                                    if (reader.Read()) {
                                        id = reader.GetInt64(0);
                                    }
                                }

                                JArray images = (JArray)jour["images"];
                                foreach (String image in images) {
                                    using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO jourimage (jourid,image) SELECT jourid ,@2 FROM jour WHERE journo LIKE @1", journo, new FileInfo(image).Name)) { }
                                }

                                JArray rooms = (JArray)jour["rooms"];
                                foreach (JObject room in rooms) {
                                    string desc = room["description"].ToString();
                                    string roomid = room["roomid"].ToString();
                                    string title = room["title"].ToString();

                                    bool humidity = (room["roomhumidity"] != null ? (bool)room["roomhumidity"] : false);
                                    bool odor = (room["roomodor"] != null ? (bool)room["roomodor"] : false);
                                    bool water = (room["roomwater"] != null ? (bool)room["roomwater"] : false);
                                    bool contamination = (room["roomcontamination"] != null ? (bool)room["roomcontamination"] : false);

                                    JArray actions = (JArray)room["roomactions"];
                                    StringBuilder actionsb = new StringBuilder();
                                    foreach (String roomaction in actions) {
                                        actionsb.Append(roomaction + "|");
                                    }


                                    using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO jour_room (jourid,uuid,datecreated,dateupdated,title,description,problem_water,problem_humidity,problem_odor,problem_contamination,roomaction)" +
                                        " SELECT jourid, @2, GETDATE(), GETDATE(), @3,@4,@5,@6,@7,@8,@9 FROM jour WHERE journo LIKE @1",
                                        journo, roomid, title, desc, water, humidity, odor, contamination, actionsb.ToString())) { }

                                    JArray roomimages = (JArray)room["images"];
                                    foreach (String image in roomimages) {
                                        using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO jour_roomimage (roomid,image) SELECT roomid ,@2 FROM jour_room WHERE uuid LIKE @1", roomid, new FileInfo(image).Name)) { }
                                    }
                                }

                                DateTime timestamp;

                                JArray logs = (JArray)jour["loglist"];
                                foreach (JObject log in logs) {
                                    DateTime.TryParse((log["timestamp"] != null ? log["timestamp"].ToString() : ""), out timestamp);
                                    if (timestamp < (DateTime)SqlDateTime.MinValue) {
                                        timestamp = DateTime.Now;
                                    }
                                    string activity = log["activity"].ToString();
                                    string comment = log["comment"].ToString();

                                    using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO jour_log (jourid,timestamp,dateupdated,activity,comment) SELECT jourid ,@2, GETDATE(),@3,@4 FROM jour WHERE journo LIKE @1", journo, timestamp, activity, comment)) { }
                                }

                                trans.Commit();
                            } catch (Exception ex) {
                                trans.Rollback();
                                counter.success = "FAIL";
                                counter.message = ex.Message;
                            }
                        }
                    }
                }

               bool success = false;
               if (id > 0) {
                   success = createPdf(id, journo, email);
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
                counter.success = "FAIL";
                counter.message = ex.Message;
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

    public static bool createPdf(long jid,string journo,string email) {
        string contents = string.Empty;

        MemoryStream ms = new MemoryStream();

        try {
            int id;
            Doc doc = new Doc();

            doc.MediaBox.String = "A4";
            doc.HtmlOptions.BrowserWidth = 980;
            doc.HtmlOptions.FontEmbed = true;
            doc.HtmlOptions.FontSubstitute = false;
            doc.HtmlOptions.FontProtection = false;
            doc.HtmlOptions.ImageQuality = 33;
            Random rnd = new Random();
            id = doc.AddImageUrl("http://" + HttpContext.Current.Request.Url.Host + "/Documents/jour_pdf.aspx?id=" + jid.ToString() + "&uid="+ email +"&rnd=" + rnd.Next(50000));

            while (true) {
                //doc.FrameRect();
                if (!doc.Chainable(id)) {
                    break;
                }
                doc.Page = doc.AddPage();
                id = doc.AddImageToChain(id);
            }

            doc.Rect.String = "10 780 595 840";
            doc.HPos = 0.5;
            doc.VPos = 0.0;
            doc.Color.String = "0 255 0";
            doc.FontSize = 36;
            for (int i = 1; i <= doc.PageCount; i++) {
                doc.PageNumber = i;
                id = doc.AddImageUrl("http://" + HttpContext.Current.Request.Url.Host + "/Documents/header.aspx?id=" + jid.ToString() + "&rnd=" + rnd.Next(50000));                    
            }

            doc.Rect.String = "10 0 585 100";
            doc.HPos = 0.5;
            doc.VPos = 1.0;
            //doc.FontSize = 36;
            //for (int i = 1; i <= doc.PageCount; i++) {
                doc.PageNumber = 1;
                id = doc.AddImageUrl("http://" + HttpContext.Current.Request.Url.Host + "/Documents/footer.aspx?rnd=" + rnd.Next(50000));
                //doc.AddText("Page " + i.ToString() + " of " + doc.PageCount.ToString());
                //doc.FrameRect();
            //}

            for (int i = 0; i < doc.PageCount; i++) {
                doc.PageNumber = i;
                doc.Flatten();
            }

            //doc.AddImageHtml(contents);
            //doc.Save(Server.MapPath("htmlimport.pdf"));
            doc.Save(ms);
            //doc.SaveOptions.
            doc.Clear();

            bool mail = Common.PdfMail(ms, email);
            if (mail) {
                return AmazonHandler.PutPdfJour(ms, journo);
            }
            return false;

            //}
        } catch (Exception ex) {
            return false;
        }
    }
}
