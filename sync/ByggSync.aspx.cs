using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public partial class Sync_ByggSync : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String data;
        if (Request.RequestType == "POST") {
            using (StreamReader sr = new StreamReader(Request.InputStream)) {
                data = sr.ReadToEnd();
            }
        }

        // do some with the requestStream


        
        if (Request.Form["data"] != null) {
            bool error= false;
            var jsonSerializer = new JsonSerializer();
            JObject constructioncase = JObject.Parse(Request.Form["data"]);
            string invid = constructioncase["inventoryid"].ToString();

            /*
            
            //UPDATE OR INSERT INVENTORY
            try {
                string damagetype = constructioncase["damagetype"].ToString();
                string description = constructioncase["description"].ToString();
                string address = constructioncase["customeradress"].ToString();
                string zip = constructioncase["customerzip"].ToString();

                DateTime datedamage;
                DateTime.TryParse((constructioncase["datedamage"] != null ? constructioncase["datedamage"].ToString() : ""), out datedamage);
                if (datedamage < (DateTime)SqlDateTime.MinValue) {
                    datedamage = DateTime.Now;
                }
                string terms = constructioncase["terms"].ToString();
                string city = constructioncase["customercity"].ToString();
                string tel = constructioncase["customertel"].ToString();
                string areatype = constructioncase["areatype"].ToString();
                string icompany = constructioncase["insurancecompany"].ToString();
                string icontact = constructioncase["insurancecontact"].ToString();
                string iemail = constructioncase["insuranceemail"].ToString();
                string itel = constructioncase["insurancetel"].ToString();
                int area1 = 0, area2 = 0, adults = 0, teens = 0, kids = 0;
                int.TryParse(constructioncase["area1"].ToString(), out area1);
                int.TryParse(constructioncase["area2"].ToString(), out area2);
                int.TryParse(constructioncase["adults"].ToString(), out adults);
                int.TryParse(constructioncase["teens"].ToString(), out teens);
                int.TryParse(constructioncase["kids"].ToString(), out kids);

                Eaztimate.SQL.ExecuteProcedureNoReader("inventorycontrol", "@Damagetype", damagetype, "@InspectionNo", invid, "@Description", description,
                    "@Address", address, "@Zip", zip, "@Damagedate", datedamage, "@City", city,
                    "@Tel", tel, "@Areatype", areatype, "@ICompany", icompany,
                    "@IContact", icontact, "@IEmail", iemail, "@ITel", itel,
                    "@Area1", area1, "@Area2", area2, "@Adults", adults, "@Teens", teens, "@Kids", kids, "@Terms", terms);

            } catch (Exception ex) {
                throw;
            }
            Dictionary<string,int> cats = new Dictionary<string,int>();
            Dictionary<int, Dictionary<String,int>> groups = new Dictionary<int, Dictionary<string,int>>();
            Dictionary<int, Dictionary<String, int>> types = new Dictionary<int, Dictionary<string, int>>();

            using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT categoryid,title FROM category")) {
                while (reader.Read()) {
                    cats.Add(reader.GetString(1),reader.GetInt32(0));
                    groups.Add(reader.GetInt32(0), new Dictionary<string,int>());
                }
            }

            using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT groupid,categoryid,title FROM grupp")) {
                while (reader.Read()) {
                    groups[reader.GetInt32(1)].Add(reader.GetString(2),reader.GetInt32(0));
                    types.Add(reader.GetInt32(0), new Dictionary<string,int>());
                }
            }

            using (SqlDataReader reader = Eaztimate.SQL.ExecuteQuery("SELECT typeid,groupid,title FROM type")) {
                while (reader.Read()) {
                    types[reader.GetInt32(1)].Add(reader.GetString(2),reader.GetInt32(0));
                }
            }


            //LOOP TROUGH ROOM
            JArray rooms = (JArray)constructioncase["rooms"];
            foreach (JObject room in rooms) {
                int roomtype = int.Parse(room["roomtype"].ToString());
                int floor = int.Parse(room["floor"].ToString());
                int size = 0;
                int.TryParse(room["size"].ToString(),out size);
                string title = (room["title"] != null ? room["title"].ToString() : "");                
                string desc = (room["description"] != null ? room["description"].ToString() : "");
                string opinion = (room["opinion"] != null ? room["opinion"].ToString() : "");
                string damage = (room["damage"] != null ? room["damage"].ToString() : "");
                string uuid = (room["roomid"] != null ? room["roomid"].ToString() : "");

                Eaztimate.SQL.ExecuteProcedureNoReader("roomcontrol", 
                    "@Title", title,
                    "@InspectionNo", invid,
                    "@Description", desc,
                    "@Floor", floor,                    
                    "@UUID", uuid,
                    "@Opinion", opinion,
                    "@RoomTypeId", roomtype,
                    "@Damage", damage,
                    "@Size", size);


                //ROOM IMAGES
                JArray images = (JArray)room["images"];
                foreach (String image in images) {
                    Eaztimate.SQL.ExecuteProcedureNoReader("roomimagecontrol",
                        "@Title", new FileInfo(image).Name,
                        "@RoomUUID", uuid);
                }               


                //ITEMS
                JObject jo = (JObject)room["items"];
                IList<JToken> results = jo.Children().ToList();                
                try {
                    foreach (JToken j in results) {
                        string itemtitle = (((JObject)j.Children().ToList()[0])["title"] != null ? ((JObject)j.Children().ToList()[0])["title"].ToString() : "");
                        string itemid = ((JObject)j.Children().ToList()[0])["itemid"].ToString();
                        int price = (int)((JObject)j.Children().ToList()[0])["omd_price"];
                        int age = (int)((JObject)j.Children().ToList()[0])["omd_age"];
                        int usage = (int)((JObject)j.Children().ToList()[0])["omd_usage"];
                        int other = (int)((JObject)j.Children().ToList()[0])["omd_other"];
                        bool salvable = (((JObject)j.Children().ToList()[0])["salvable"] != null ? (bool)((JObject)j.Children().ToList()[0])["salvable"] : false);
                        string catname = ((JObject)j.Children().ToList()[0])["heritage"]["categoryname"].ToString();
                        string groupname = ((JObject)j.Children().ToList()[0])["heritage"]["groupname"].ToString();
                        string typename = ((JObject)j.Children().ToList()[0])["heritage"]["typename"].ToString();
                        
                        //NEW CATEGORY
                        if (!cats.ContainsKey(catname) && !error) {
                            using (SqlDataReader reader2 = Eaztimate.SQL.ExecuteQuery("INSERT INTO category (title, datecreated, dateupdated) VALUES(@1,GETDATE(),GETDATE());SELECT CAST(@@IDENTITY AS INT)", catname)) {
                                if (reader2.Read()) {
                                    cats.Add(catname, reader2.GetInt32(0));
                                    groups.Add(reader2.GetInt32(0), new Dictionary<string, int>());
                                } else {
                                    error = true;
                                }
                            }
                        }

                        //NEW GROUP
                        if (!groups[cats[catname]].ContainsKey(groupname) && !error) {
                            using (SqlDataReader reader2 = Eaztimate.SQL.ExecuteQuery("INSERT INTO grupp (title, categoryid, datecreated, dateupdated) VALUES(@1,@2,GETDATE(),GETDATE());SELECT CAST(@@IDENTITY AS INT)", groupname, cats[catname])) {
                                if (reader2.Read()) {
                                    groups[cats[catname]].Add(groupname, reader2.GetInt32(0));
                                    types.Add(reader2.GetInt32(0), new Dictionary<string, int>());
                                } else {
                                    error = true;
                                }
                            }
                        }

                        //NEW TYPE
                        int groupid= 0;
                        groups[cats[catname]].TryGetValue(groupname, out groupid);
                        if (!types[groupid].ContainsKey(typename) && !error) {
                            using (SqlDataReader reader2 = Eaztimate.SQL.ExecuteQuery("INSERT INTO type (title, groupid, datecreated, dateupdated) VALUES(@1,@2,GETDATE(),GETDATE());SELECT CAST(@@IDENTITY AS INT)", typename, groupid)) {
                                if (reader2.Read()) {
                                    types[groupid].Add(typename, reader2.GetInt32(0));
                                } else {
                                    error = true;
                                }
                            }
                        }

                        int typeid = 0;
                        types[groupid].TryGetValue(typename, out typeid);
                        //insert item



                        Eaztimate.SQL.ExecuteProcedureNoReader("itemcontrol",
                            "@Title", itemtitle,
                            "@InspectionNo", invid,
                            "@RoomUUID", uuid,
                            "@TypeId", typeid,
                            "@UUID", itemid,
                            "@Price", price,
                            "@Age", age,
                            "@Usage", usage,
                            "@Other", other,
                            "@Salvable", (salvable ? 1 : 0));
                        
                        //ITEM IMAGES
                        JArray itemimages = (JArray)((JObject)j.Children().ToList()[0])["images"];
                        foreach (String image in itemimages) {
                            Eaztimate.SQL.ExecuteProcedureNoReader("itemimagecontrol",
                                "@Title", new FileInfo(image).Name,
                                "@ItemUUID", itemid);
                        }


                    }
                } catch (Exception ex) {
                    error = true;
                }                
            }
            */
            if (!error) {
                Response.StatusCode = (int)HttpStatusCode.OK;
                Response.End();
            }             
        } 
        Response.StatusCode = (int)HttpStatusCode.BadRequest;
        Response.End();
    }
}