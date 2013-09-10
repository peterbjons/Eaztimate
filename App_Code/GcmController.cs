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
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public class GcmController : ApiController {

    private static string SYNCCOUNTERCODE = "sdjfgjkdsgh4y87sh7f783g673gyag";

    public CounterObject GetById(string email, string app, string sha) {
        CounterObject counter = new CounterObject();

        string hash = Security.SHA1(email + DateTime.Now.ToUniversalTime().ToString("yyyy-MM-dd") + SYNCCOUNTERCODE).ToLower();

        if (hash.Equals(sha)) {
            //string username = Membership.GetUserNameByEmail(email);
            //if (!string.IsNullOrEmpty(username)) {
                //using (SQL.ExecuteQuery("INSERT INTO test(code) VALUES(@1)", code)) { }
                counter.success = "OK";
                counter.message = "Success";
                //if (Membership.ValidateUser(username, pw)) {
                //    System.Web.Security.MembershipUser user = Membership.GetUser(username);
                //    counter.success = "OK";
                //    counter.message = "Success";
                //    using (SqlDataReader reader = SQL.ExecuteQuery("SELECT token FROM logintokens WHERE dateexpires > GETDATE() AND userid=@1", user.ProviderUserKey)) {
                //        if (reader.Read()) {
                //            counter.data = reader.GetGuid(0).ToString();
                //        } else {
                //            Guid guid = Guid.NewGuid();
                //            using (SQL.ExecuteQuery("DELETE FROM logintokens WHERE userid=@1; INSERT INTO logintokens(userid,datecreated,dateexpires,token) VALUES(@1,GETDATE(),(GETDATE() + 365),@2)", user.ProviderUserKey, guid)) { }
                //            counter.data = guid.ToString();
                //        }
                //    }
                //} else {
                //    counter.success = "FAIL";
                //    counter.message = "fel pw...";
                //}
            //} else {
            //    counter.success = "FAIL";
            //    counter.message = "fel email...";
            //}

            //    } catch (Exception ex) {
            //        counter.success = "FAIL";
            //        counter.message = ex.Message;
            //    }
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
    [HttpPost]
    public CounterObject PostGCM(string email, string pw, string sha) {
        CounterObject counter = new CounterObject();

        string hash = Security.SHA1(email + DateTime.Now.ToUniversalTime().ToString("yyyy-MM-dd") + SYNCCOUNTERCODE).ToLower();

        if (hash.Equals(sha)) {
            //string username = Membership.GetUserNameByEmail(email);
            //if (!string.IsNullOrEmpty(username)) {
                try {
                    var jsonSerializer = new JsonSerializer();
                    long id = 0;

                    string data = Request.Content.ReadAsStringAsync().Result;
                    JObject gcm = JObject.Parse(data);

                    string code = gcm["code"].ToString();

                    using (SqlDataReader reader = SQL.ExecuteQuery("SELECT * FROM gcm_codes WHERE email LIKE @1 AND app LIKE @2", email, pw)) {
                        if (reader.HasRows) {
                            using (SQL.ExecuteQuery("UPDATE gcm_codes SET code=@1 WHERE email LIKE @2 AND app LIKE @3", code, email, pw)) { }
                        } else {
                            using (SQL.ExecuteQuery("INSERT INTO gcm_codes(code,email,app) VALUES(@1,@2,@3)", code, email, pw)) { }
                        }
                    }
                    counter.success = "OK";
                    counter.message = "Success";
                } catch (Exception ex) {
                    counter.success = "FAIL";
                    counter.message = ex.Message;
                }
            //} else {
            //    counter.success = "FAIL";
            //    counter.message = "Email finns ej";
            //}
        } else {
            counter.success = "FAIL";
            counter.message = "Ogiltig hash";
        }

        return counter;
    }    

    // PUT api/<controller>/5
    public void Put(int id, [FromBody]string value) {
    }
}
