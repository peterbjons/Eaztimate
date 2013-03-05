using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography;
using System.Web.Http;
using System.Web.Security;
using Eaztimate;

public class CounterController : ApiController
{

    private static string SYNCCOUNTERCODE = "sdjfgjkdsgh4y87sh7f783g673gyag";

    // GET api/<controller>/5
    public CounterObject GetById(string caseid,string sysid, string email,string sha,int reportid)
    {
        CounterObject counter = new CounterObject();
        int synccount = 0;
        bool update = false;


        string hash = Security.SHA1(email + caseid + DateTime.Now.ToUniversalTime().ToString("yyyy-MM-dd") + SYNCCOUNTERCODE).ToLower();

        //FormsAuthentication.HashPasswordForStoringInConfigFile((email+caseid+"datum"+SYNCCOUNTERCODE), "SHA1");

        if (hash.Equals(sha)) {
            try {
                using (SqlDataReader reader = SQL.ExecuteQuery("SELECT * FROM ocabpayment WHERE caseid LIKE @1 AND sysid=@2 AND ocabreportid=@3", caseid, sysid, reportid)) {
                    if (reader.Read()) {
                        synccount = reader.GetInt32(reader.GetOrdinal("synccounter")) + 1;
                        update = true;
                    }
                }
                if (update) {
                    using (SQL.ExecuteQuery("UPDATE ocabpayment SET synccounter=@1 WHERE caseid LIKE @2 AND sysid=@3 AND ocabreportid=@4", synccount, caseid, sysid, reportid)) { }
                } else {
                    using (SQL.ExecuteQuery("INSERT INTO ocabpayment (caseid,sysid,email,datecreated,datelastsync,synccounter,ocabreportid) VALUES(@1,@2,@3,GETDATE(),GETDATE(),1,@4)", caseid, sysid, email, reportid)) { }
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
        //FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPassword.Text.Trim(), "SHA1");
        //var counter = counters.FirstOrDefault((p) => p.caseid == caseid);
        //if (counter == null) {
        //    throw new HttpResponseException(HttpStatusCode.NotFound);
        //}
        //return counter;        
        
    }

    // POST api/<controller>
    public void Post([FromBody]string value)
    {
    }

    // PUT api/<controller>/5
    public void Put(int id, [FromBody]string value)
    {
    }    
}
