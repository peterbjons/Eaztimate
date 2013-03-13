using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Web.Http;
using System.Web.Security;
using Eaztimate;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public class JourSyncController : ApiController
{

    private static string SYNCCODE = "sdjfgjkdsgh4y87sh7f783g673gyag";

    // GET api/<controller>/5
    public CounterObject GetById(string caseid, string sysid, string email, string sha, [FromBody]string value)
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

        
        //HttpContent requestContent = Request.Content.;        
        CounterObject counter = new CounterObject();
        if (hash.Equals(sha)) {
            try {            
                var jsonSerializer = new JsonSerializer();
                
                string data = Request.Content.ReadAsStringAsync().Result;
                JObject jour = JObject.Parse(data);

                string journo = jour["caseid"].ToString();
                string pw = jour["password"].ToString();

                //---------------------------------------------------------------------
                int customerid = 1; //fix later
                //---------------------------------------------------------------------

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
                using (SQL.ExecuteQuery("INSERT INTO jour(journo,syncemail,datecreated,dateupdated,contactname,contactaddress,contactaddress2,contactzipcode,contactcity,contactpersonalnumber,insurancenumber,insurancetype,damagetype,actiondescription,externalentrepeneur,damagedescription,contactinformed,contactaction,action_otherliving,action_cash,action_transport,action_helpcontact,building_power,building_lockable,building_climatesafe,building_function,customerid,contactphone1,contactphone2)" +
                    " VALUES(@1,@2,GETDATE(),GETDATE(),@3,@4,@5,@6,@7,@8,@9,@10,@11,@12,@13,@14,@15,@16,@17,@18,@19,@20,@21,@22,@23,@24,@25,@26,@27)",
                    journo, email, contactname, contactaddress, contactaddress2, contactzipcode, contactcity, contactpersonalnumber, insurancenumber,
                    insurancetype, damagetype, actiondescription, externalentrepeneur, damagedescription, contactinformed, action,
                    action_otherliving, action_cash, action_transport, action_helpcontact, building_power, building_lockable, building_climatesafe, building_function, customerid, contactphone1, contactphone2)) { }

                JArray images = (JArray)jour["images"];
                foreach (String image in images) {
                    using (SQL.ExecuteQuery("INSERT INTO jourimage (jourid,image) SELECT jourid ,@2 FROM jour WHERE journo LIKE @1", journo, new FileInfo(image).Name)) { }                    
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

                    using (SQL.ExecuteQuery("INSERT INTO jour_room (jourid,uuid,datecreated,dateupdated,title,description,problem_water,problem_humidity,problem_odor,problem_contamination)" +
                        " SELECT jourid, @2, GETDATE(), GETDATE(), @3,@4,@5,@6,@7,@8 FROM jour WHERE journo LIKE @1",
                        journo, roomid, title, desc, water, humidity, odor, contamination)) { }

                    JArray roomimages = (JArray)room["images"];
                    foreach (String image in roomimages) {
                        using (SQL.ExecuteQuery("INSERT INTO jour_roomimage (roomid,image) SELECT roomid ,@2 FROM jour_room WHERE uuid LIKE @1", roomid, new FileInfo(image).Name)) { }
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

                    using (SQL.ExecuteQuery("INSERT INTO jour_log (jourid,timestamp,dateupdated,activity,comment) SELECT jourid ,@2, GETDATE(),@3,@4 FROM jour WHERE journo LIKE @1", journo, timestamp, activity, comment)) { }
                }

                counter.success = "OK";
                counter.message = "Success";
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
}
