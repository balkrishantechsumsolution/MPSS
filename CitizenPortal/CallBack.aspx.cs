using BridgePG;
using CitizenPortal.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;

namespace CitizenPortal
{
    public partial class CallBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["Mode"] != null && Request.QueryString["Mode"].ToString() == "Test")
            {
                string t_resultdata =
                    "{\"User\":{\"username\":\"500100100013\",\"email\":\"rajnisingh200812@gmail.com\",\"csc_id\":\"500100100013\",\"state_code\":\"AP\",\"active_status\":\"1\",\"user_type\":\"VLE\",\"last_active\":\"2017-03-05 09:57:33\",\"RAP\":\"12345\"}}";

                var result = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(t_resultdata.Trim());


                /*
                 * 
                 * {"User":{"username":"500100100013","email":"rajnisingh200812@gmail.com","csc_id":"500100100013","state_code":"AP","active_status":"1","user_type":"VLE","last_active":"2017-03-05 09:57:33","RAP":"12345"}}
                 * 
                 * 
                 * lblsessiondata.Text = "</br> Name : " + result["User"]["username"].Value + "<br />"
                                     + "Email Id : " + result["User"]["email"].Value + "<br />"
                                     + "CSC Id : " + result["User"]["csc_id"].Value + "<br />"
                                     + "Status :" + result["User"]["active_status"].Value + "<br />"
                                     + "Type : " + result["User"]["user_type"].Value + "<br />"
                                     + "last_active : " + result["User"]["last_active"].Value + "<br />"
                                    ;
                 * 
                 */
                if (t_resultdata != null)
                {
                    Session["Id"] = result["User"]["csc_id"].Value;
                    Session["role"] = "vle";
                    string user = Session["Id"].ToString();
                    string role = Session["role"].ToString();

                    Session["CurrentCulture"] = "en-GB";
                    Session["SCAID"] = "";
                    Session["SCALoginID"] = "";
                    Session["__SessionHelper__"] = "";
                    Session["KioskID"] = result["User"]["csc_id"].Value;
                    Session["LoginID"] = result["User"]["csc_id"].Value;
                    Session["FullName"] = result["User"]["username"].Value;
                    Session["PaymentFlag"] = "S";
                    Session["Role"] = role;
                    Session["sRole"] = role;
                    Session["Balance"] = 0;
                    Session["UserType"] = "KIOSK";
                    Session["HomePage"] = "/WebApp/Kiosk/Forms/DashboardChart.aspx";
                    Session["CSCEmail"] = result["User"]["email"].Value;
                    Session["Connectdata"] = t_resultdata;

                    DataTable t_Result;
                    try
                    {
                        string[] AFields =
                        {
                            "CSCID"
                            , "UserName"
                            , "Email"
                            , "State_Code"
                            , "Active_Status"
                            , "User_Type"
                            , "Last_Active"
                            , "RAP"
                            , "CreatedBy"

                        };

                        CSCConnectBLL t_CSCConnectBLL = new CSCConnectBLL();
                        CSCConnectV2_DT objCSCConnect = new CSCConnectV2_DT();
                        //CSCID, UserName, Email, State_Code, Active_Status, User_Type, Last_Active, RAP, CreatedBy

                        objCSCConnect.CSCID = result["User"]["csc_id"].Value;
                        objCSCConnect.UserName = result["User"]["username"].Value;
                        objCSCConnect.Email = result["User"]["email"].Value;
                        objCSCConnect.State_Code = result["User"]["state_code"].Value;
                        objCSCConnect.Active_Status = result["User"]["active_status"].Value;
                        objCSCConnect.User_Type = result["User"]["user_type"].Value;
                        objCSCConnect.Last_Active = result["User"]["last_active"].Value;
                        objCSCConnect.RAP = result["User"]["RAP"].Value;
                        objCSCConnect.CreatedBy = result["User"]["csc_id"].Value;

                        t_Result = t_CSCConnectBLL.InsertCSCLoginDetailsV2(objCSCConnect, AFields);
                    }
                    catch (Exception ex)
                    {

                    }
                    //string URL = Session["HomePage"].ToString();
                    //Response.Write(CookieVal);

                    //Response.Write("Culture"+Session["CurrentCulture"].ToString() + " SCAID" + Session["SCAID"].ToString()+ " SCALoginID" + Session["SCALoginID"].ToString() + "KioskID " + Session["KioskID"].ToString() + " FullName" + Session["FullName"].ToString() + "PaymentFlag" + Session["PaymentFlag"].ToString());

                    Response.Redirect("/WebApp/Kiosk/Forms/DashboardChart.aspx", false);
                    
                    return;
                }
            }

            try
            {
                string Svalue = Session["state"].ToString();
                string Rvalue = Request.QueryString["state"].ToString();
                if (Svalue == Rvalue)
                {
                    Session["state"] = Request.QueryString["state"];
                    string secret = "12:" + ConfigurationManager.AppSettings["CLIENT_SECRET"].ToString() + "@1234";
                    Response.Write(secret + "<br/>");
                    WebRequest request =
                    WebRequest.Create(ConfigurationManager.AppSettings["CONNECT_SERVER_URI"] + ConfigurationManager.AppSettings["TOKEN_ENDPOINT"]);
                    // Set the Method property of the request to POST.
                    request.Method = "POST";

                    // Create POST data and convert it to a byte array.
                    StringBuilder postData = new StringBuilder();

                    postData.Append("code=" + Request.QueryString["code"] + "&");
                    postData.Append("client_id=" + ConfigurationManager.AppSettings["client_id"] + "&");

                    /////aes 
                    string aesSecret = "";
                    try
                    {
                        aesSecret = Crypto.AESEncrypt(secret, ConfigurationManager.AppSettings["CLIENT_TOKEN"].ToString());
                    }
                    catch (Exception ex)
                    {

                        Response.Write(ex.Message);
                    }

                    Response.Write(aesSecret);

                    /////
                    postData.Append("client_secret=" + aesSecret + "&");
                    postData.Append("grant_type=" + "authorization_code" + "&");
                    postData.Append("redirect_uri=" + ConfigurationManager.AppSettings["CLIENT_CALLBACK_URI"]);

                    string posd = postData.ToString();
                    // Response.Write(posd);
                    byte[] byteArray = Encoding.UTF8.GetBytes(posd);
                    // Set the ContentType property of the WebRequest.
                    request.ContentType = "application/x-www-form-urlencoded";
                    // Set the ContentLength property of the WebRequest.
                    request.ContentLength = byteArray.Length;
                    // Get the request stream.
                    Stream dataStream = request.GetRequestStream();
                    // Write the data to the request stream.
                    dataStream.Write(byteArray, 0, byteArray.Length);
                    // Close the Stream object.
                    dataStream.Close();
                    // Get the response.
                    WebResponse response = request.GetResponse();
                    // Display the status.
                    // Console.WriteLine(((HttpWebResponse)response).StatusDescription);
                    // Get the stream containing content returned by the server.
                    // Response.Write(((HttpWebResponse)response).StatusDescription+"ppp");
                    dataStream = response.GetResponseStream();
                    // Open the stream using a StreamReader for easy access.
                    StreamReader reader = new StreamReader(dataStream);
                    // Read the content.
                    string responseFromServer = reader.ReadToEnd();
                    // Display the content.
                    // Console.WriteLine(responseFromServer);
                    //  Response.Write(responseFromServer);
                    Dictionary<string, string> s = myjson.jsonParse(responseFromServer);
                    // Response.Write("token="+ s["access_token"]);
                    if (s.ContainsKey("access_token"))
                    {

                        string content = "";
                        HttpWebRequest req = (HttpWebRequest)(HttpWebRequest.Create(ConfigurationManager.AppSettings["CONNECT_SERVER_URI"] + ConfigurationManager.AppSettings["RESOURCE_URL"]));
                        req.Method = "POST";
                        req.ProtocolVersion = HttpVersion.Version11;
                        // req.ContentType = "application/json";
                        req.Headers.Set(HttpRequestHeader.Authorization, "Bearer " + s["access_token"]);
                        req.ContentLength = content.Length;
                        Stream wri = req.GetRequestStream();
                        // byte[] array = Encoding.UTF8.GetBytes(content);
                        // wri.Write(array, 0, array.Length);
                        // wri.Flush();
                        // wri.Close();
                        HttpWebResponse HttpWResp = (HttpWebResponse)req.GetResponse();
                        int resCode = (int)HttpWResp.StatusCode;
                        StreamReader reader1 = new StreamReader(HttpWResp.GetResponseStream(), System.Text.Encoding.UTF8);
                        string resultData = reader1.ReadToEnd();

                        //  if(Session["state"]  very session
                        Session["Connectdata"] = resultData;
                        // Session["logedin"] = "true";
                        // string url = Session["page"].ToString();
                        //Response.Redirect("/WebApp/CSCv2/TestPay.aspx", true);


                        //string t_resultdata =
                        //    "{\"User\":{\"username\":\"500100100013\",\"email\":\"rajnisingh200812@gmail.com\",\"csc_id\":\"500100100013\",\"state_code\":\"AP\",\"active_status\":\"1\",\"user_type\":\"VLE\",\"last_active\":\"2017-03-05 09:57:33\",\"RAP\":\"12345\"}}";

                        var result = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(resultData.Trim());


                        /*
                         * 
                         * {"User":{"username":"500100100013","email":"rajnisingh200812@gmail.com","csc_id":"500100100013","state_code":"AP","active_status":"1","user_type":"VLE","last_active":"2017-03-05 09:57:33","RAP":"12345"}}
                         * 
                         * 
                         * lblsessiondata.Text = "</br> Name : " + result["User"]["username"].Value + "<br />"
                                             + "Email Id : " + result["User"]["email"].Value + "<br />"
                                             + "CSC Id : " + result["User"]["csc_id"].Value + "<br />"
                                             + "Status :" + result["User"]["active_status"].Value + "<br />"
                                             + "Type : " + result["User"]["user_type"].Value + "<br />"
                                             + "last_active : " + result["User"]["last_active"].Value + "<br />"
                                            ;
                         * 
                         */
                        if (resultData != null)
                        {
                            Session["Id"] = result["User"]["csc_id"].Value;
                            Session["role"] = "vle";
                            string user = Session["Id"].ToString();
                            string role = Session["role"].ToString();

                            Session["CurrentCulture"] = "en-GB";
                            Session["SCAID"] = "";
                            Session["SCALoginID"] = "";
                            Session["__SessionHelper__"] = "";
                            Session["KioskID"] = result["User"]["csc_id"].Value;
                            Session["LoginID"] = result["User"]["csc_id"].Value;
                            Session["FullName"] = result["User"]["username"].Value;
                            Session["PaymentFlag"] = "S";
                            Session["Role"] = role;
                            Session["sRole"] = role;
                            Session["Balance"] = 0;
                            Session["UserType"] = "KIOSK";
                            //Session["HomePage"] = "/WebApp/Kiosk/Forms/DashboardChart.aspx";
                            Session["CSCEmail"] = result["User"]["email"].Value;
                            DataTable t_Result;
                            try
                            {
                                string[] AFields = {
                                    "CSCID"
                                    , "UserName"
                                    , "Email"
                                    , "State_Code"
                                    , "Active_Status"
                                    , "User_Type"
                                    , "Last_Active"
                                    , "RAP"
                                    , "CreatedBy"

                                };

                                CSCConnectBLL t_CSCConnectBLL = new CSCConnectBLL();
                                CSCConnectV2_DT objCSCConnect = new CSCConnectV2_DT();
                                //CSCID, UserName, Email, State_Code, Active_Status, User_Type, Last_Active, RAP, CreatedBy

                                objCSCConnect.CSCID = result["User"]["csc_id"].Value;
                                objCSCConnect.UserName = result["User"]["username"].Value;
                                objCSCConnect.Email = result["User"]["email"].Value;
                                objCSCConnect.State_Code = result["User"]["state_code"].Value;
                                objCSCConnect.Active_Status = result["User"]["active_status"].Value;
                                objCSCConnect.User_Type = result["User"]["user_type"].Value;
                                objCSCConnect.Last_Active = result["User"]["last_active"].Value;
                                objCSCConnect.RAP = result["User"]["RAP"].Value;
                                objCSCConnect.CreatedBy = result["User"]["csc_id"].Value;

                                t_Result = t_CSCConnectBLL.InsertCSCLoginDetailsV2(objCSCConnect, AFields);
                            }
                            catch (Exception ex)
                            {

                            }

                            //Response.Write(CookieVal);

                            //Response.Write("Culture"+Session["CurrentCulture"].ToString() + " SCAID" + Session["SCAID"].ToString()+ " SCALoginID" + Session["SCALoginID"].ToString() + "KioskID " + Session["KioskID"].ToString() + " FullName" + Session["FullName"].ToString() + "PaymentFlag" + Session["PaymentFlag"].ToString());

                            //Response.Redirect("/WebApp/Kiosk/Forms/DashboardChart.aspx", false);
                            Response.Redirect(Session["HomePage"].ToString(), false);

                        }
                        else
                        {
                            Response.Write("Please Clear The Browser Cookies and  Login Again .....");
                        }


                        // Response.Write(resultData);
                    }
                    else
                    {
                        Response.Write("Error occurred");

                    }

                    // if (responseFromServer.Length == 0) Response.Write("Empty");
                    // Clean up the streams.
                    reader.Close();
                    dataStream.Close();
                    response.Close();
                }
                else
                {
                }
                //  Request.QueryString("code")
            }
            catch (Exception) { }
        }
    }
}