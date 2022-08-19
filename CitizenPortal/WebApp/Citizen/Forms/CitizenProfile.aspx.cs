using CitizenPortalLib;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security;
using System.ServiceModel;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Helpers;
using System.Web.Http.Controllers;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CitizenPortal.Services.AddressService;

namespace CitizenPortal.WebApp.Citizen.Forms
{ 

    public partial class CitizenProfile : System.Web.UI.Page
    {
        public string strSecTckt;
        protected void Page_Load(object sender, EventArgs e)
        {
            HFServiceID.Value = "932";
            Random randomobj = new Random();
            Session["CSRFVal"] = randomobj.Next();
            CSRFVal.Value = Session["CSRFVal"].ToString();
            Session["CSRFValue"] = TokenHeaderValue();
           
            if (Session["AuthToken"] == null)
            {
                //// Solution for Session Fixation Step 1 
                string strAuthToken = Guid.NewGuid().ToString();
                Session["AuthToken"] = strAuthToken;
                Response.Cookies.Add(new HttpCookie("AuthToken", strAuthToken));
                Session["Role"] = "CITIZEN";
            }
            GenerateTicket();
        }

        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();


        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }

        public interface IService1Channel : IAddressService, IClientChannel
        { }

        private void GenerateTicket()
        {
            string Key = "SecurityTicket:" + Session.SessionID;
            //string Key = "SecurityTicket:" + Guid.NewGuid().ToString();
            strSecTckt = Guid.NewGuid().ToString();
            Session[Key] = strSecTckt;
            Token.Value = strSecTckt;
        }
        private static void ValidateTicket()
        {
            HttpContext context = HttpContext.Current;
            if (context != null)
            {
                string headerTicket = context.Request.Headers["STicket"];
                if (string.IsNullOrEmpty(headerTicket))
                    throw new System.Security.SecurityException("Security ticket must be present.");

                string Key = "SecurityTicket:" + context.Session.SessionID;
                string ServerTicket = Convert.ToString(context.Session[Key]);

                if (string.Compare(headerTicket, ServerTicket, false) != 0)
                    throw new System.Security.SecurityException("Security ticket  mismatched.");
            }
            else
                throw new System.Security.SecurityException("Not authorized.");
        }
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertCitizenProfile(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            CitizenProfile_DT viewModel = ToObjectFromJSON<CitizenProfile_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            string text;
            ServiceResult t_ServiceResult = new ServiceResult();


            ValidateTicket();

            string[] replaceThese = { "data:image/png;base64,", "data:image/jpeg;base64,", "data:image/jpg;base64," };
            string data = viewModel.Image;

            bool iAlpha = IsAlphabets(viewModel.residentName);

            foreach (string curr in replaceThese)
            {
                data = data.Replace(curr, string.Empty);
            }

            byte[] toBytes = System.Convert.FromBase64String(data);

            //byte[] toBytes = System.Convert.FromBase64String(viewModel.Image);
            System.Drawing.Image newImage = ByteArrayToImage(toBytes);

            if (newImage != null && iAlpha)
            {
                using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
                {
                    IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                    using (OperationContextScope scope = new OperationContextScope(proxy))
                    {
                        List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();

                        //string dbCon = HttpContext.Current.Session["DatabaseName"].ToString();
                        //string culture = HttpContext.Current.Session["CurrentCulture"].ToString();

                        //string ID = "";

                        //ID = HttpContext.Current.Session["KioskID"].ToString();

                        //nvc.Add(new Tuple<string, string>("G2GID", ID));
                        //nvc.Add(new Tuple<string, string>("KioskID", ID));
                        //nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

                        MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                        System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                        OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                        text = proxy.InsertCitizenProfile(viewModel);

                    }
                }
            }
            else
            {

                t_ServiceResult.AppID = "";
                if (!iAlpha)
                {
                    t_ServiceResult.Status = "Invaild Full Name!";
                }
                else
                {
                    t_ServiceResult.Status = "Invaild Image!";
                }
                t_ServiceResult.intStatus = 4;
                text = (new JavaScriptSerializer().Serialize(t_ServiceResult));
            }
            return text;

        }
        public static bool IsAlphabets(string inputString)
        {
            Regex r = new Regex("^[a-zA-Z ]+$");
            if (r.IsMatch(inputString))
                return true;
            else
                return false;
        }
        public static System.Drawing.Image ByteArrayToImage(byte[] bArray)
        {
            if (bArray == null)
                return null;

            System.Drawing.Image newImage;

            try
            {
                using (MemoryStream ms = new MemoryStream(bArray, 0, bArray.Length))
                {
                    ms.Write(bArray, 0, bArray.Length);
                    newImage = System.Drawing.Image.FromStream(ms, true);
                }
            }
            catch (Exception ex)
            {
                newImage = null;

                //Log an error here
            }

            return newImage;
        }
        static List<Tuple<string, string>> GetSessionValues()
        {
            List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();
            string culture = HttpContext.Current.Session["CurrentCulture"].ToString();
            string userType = HttpContext.Current.Session["UserType"].ToString();
            string ID = "";

            if (HttpContext.Current.Session["G2GID"] != null)
            {
                ID = HttpContext.Current.Session["G2GID"].ToString();
            }
            else if (HttpContext.Current.Session["KioskID"] != null)
            {
                ID = HttpContext.Current.Session["KioskID"].ToString();
            }
            else if (HttpContext.Current.Session["CitizenID"] != null)
            {
                ID = HttpContext.Current.Session["CitizenID"].ToString();
            }

            //nvc.Add(new Tuple<string, string>("G2GID", ID));
            //nvc.Add(new Tuple<string, string>("KioskID", ID));
            nvc.Add(new Tuple<string, string>("ID", ID));
            nvc.Add(new Tuple<string, string>("UserType", userType));
            nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

            return nvc;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetCitizenProfileData(string prefix, string Data)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetVillage("", SubDistrictCode);
            //return text;
            string URL = "";

            //if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("localhost"))
            //    URL = "http://localhost:52349/AddressService.svc";
            //else
            //    URL = "http://citizenportalservice.azurewebsites.net/AddressService.svc";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            //using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new WSHttpBinding(SecurityMode.None, false)))
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();

                    string dbCon = HttpContext.Current.Session["DatabaseName"].ToString();
                    string culture = HttpContext.Current.Session["CurrentCulture"].ToString();

                    string ID = "";

                    if (HttpContext.Current.Session["G2GID"] != null)
                    {
                        ID = HttpContext.Current.Session["G2GID"].ToString();
                    }
                    else if (HttpContext.Current.Session["KioskID"] != null)
                    {
                        ID = HttpContext.Current.Session["KioskID"].ToString();
                    }

                    nvc.Add(new Tuple<string, string>("G2GID", ID));
                    nvc.Add(new Tuple<string, string>("KioskID", ID));
                    nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetCitizenProfileData("", Data);

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDeclaration(string prefix, string UID)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetVillage("", SubDistrictCode);
            //return text;
            string URL = "";

            //if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("localhost"))
            //    URL = "http://localhost:52349/AddressService.svc";
            //else
            //    URL = "http://citizenportalservice.azurewebsites.net/AddressService.svc";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            //using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new WSHttpBinding(SecurityMode.None, false)))
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();

                    string dbCon = HttpContext.Current.Session["DatabaseName"].ToString();
                    string culture = HttpContext.Current.Session["CurrentCulture"].ToString();

                    string ID = "";

                    if (HttpContext.Current.Session["G2GID"] != null)
                    {
                        ID = HttpContext.Current.Session["G2GID"].ToString();
                    }
                    else if (HttpContext.Current.Session["KioskID"] != null)
                    {
                        ID = HttpContext.Current.Session["KioskID"].ToString();
                    }

                    nvc.Add(new Tuple<string, string>("G2GID", ID));
                    nvc.Add(new Tuple<string, string>("KioskID", ID));
                    nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetDeclaration("", UID);

                }
            }

            return text;
        }
        public string TokenHeaderValue()
        {
            string cookieToken, formToken;
            AntiForgery.GetTokens(null, out cookieToken, out formToken);
            return cookieToken + ":" + formToken;
        }
        public static void OnActionExecuting(string tokenHeaders)
        {
            string cookieToken = "";
            string formToken = "";

            
            if (tokenHeaders!=null)
            {
                string[] tokens = tokenHeaders.Split(':');
                if (tokens.Length == 2)
                {
                    cookieToken = tokens[0].Trim();
                    formToken = tokens[1].Trim();
                }
            }
            AntiForgery.Validate(cookieToken, formToken);
        }
    }
}