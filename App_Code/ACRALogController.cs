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

public class ACRALogController : ApiController
{
    // GET api/<controller>/5
    public CounterObject GetById(string id)
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
    public HttpResponseMessage Post(string id)
    {
        try {
            var jsonSerializer = new JsonSerializer();
            long _id = 0;
                
            string data = Request.Content.ReadAsStringAsync().Result;
            JObject jour = JObject.Parse(data);

            string androidVersion = jour["ANDROID_VERSION"].ToString();
            int appVersionCode = 0;
            int.TryParse(jour["APP_VERSION_CODE"].ToString(), out appVersionCode);
            string appVersionName = jour["APP_VERSION_NAME"].ToString();
            string reportId = jour["REPORT_ID"].ToString();
            string package = jour["PACKAGE_NAME"].ToString();
            string brand = jour["BRAND"].ToString();
            string model = jour["PHONE_MODEL"].ToString();

            bool logexists = false;

            using (SqlDataReader reader = SQL.ExecuteQuery("SELECT app_crashreportid FROM app_crashreport WHERE reportid LIKE @1", reportId)) {
                if (reader.Read()) {
                    logexists = true;
                    _id = reader.GetInt64(0);                        
                }
            }

            if (!logexists) {
                using (SqlConnection con = SQL.CreateConnection()) {
                    using (SqlTransaction trans = con.BeginTransaction(IsolationLevel.ReadCommitted)) {
                        try {
                            if (AmazonHandler.PutACRALog(data, reportId)) {
                                using (SQL.ExecuteTransQuery(con, trans, "INSERT INTO app_crashreport(reportid, package, appversioncode, appversionname, datecreated, androidversion, brand, model) VALUES(@1,@2,@3,@4,GETDATE(),@5,@6,@7);",
                                    reportId, package, appVersionCode, appVersionName, androidVersion, brand, model)) { }
                                trans.Commit();                                
                            }
                        } catch (Exception ex) {
                            trans.Rollback();
                        }
                    }
                }
            }            
        } catch (Exception ex) {            
        }
        return this.Request.CreateResponse(HttpStatusCode.OK);
    }

    // PUT api/<controller>/5
    public void Put()
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