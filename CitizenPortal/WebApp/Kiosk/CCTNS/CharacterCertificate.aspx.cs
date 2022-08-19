using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.ServiceModel;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.CCTNS
{
    public partial class CharacterCertificate : System.Web.UI.Page
    {
        static string UID = "", m_UserID = "";
        CitizenRegistrationBLL m_CitizenRegistrationBLL = new CitizenRegistrationBLL();
        static ServicesBLL m_ServicesBLL = new ServicesBLL();
        //static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["FisheriesService"].ToString();
        static string m_AddressServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        //public interface IService1Channel : IFisheriesService, IClientChannel
        //{

        //}

        public interface IService1Channe2 : IClientChannel, IAddressService
        {
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

            nvc.Add(new Tuple<string, string>("ID", ID));
            nvc.Add(new Tuple<string, string>("UserType", userType));
            nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

            return nvc;
        }
        public class ListItem
        {
            public string Name { get; set; }
            public string Id { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            btnCancel.PostBackUrl = Session["HomePage"].ToString();
        }

        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = new JavaScriptSerializer().Deserialize<T>(jsonString); //(T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }

        /// <summary>
        /// Insert CheraterCerificate Data
        /// </summary>
        /// <param name="prefix"></param>
        /// <param name="Data"></param>
        /// <returns></returns>
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string CharaterCertificates(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            CTTNSCharacter viewModel = ToObjectFromJSON<CTTNSCharacter>(noNewLines);
            string URL = "", text = "";
            URL = m_AddressServiceURL;

            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.InsertCharaterCertificate(viewModel);
                }
            }
            return text;
        }

        /// <summary>
        /// Get Citizen Profile Data
        /// </summary>
        /// <param name="prefix"></param>
        /// <param name="Data"></param>
        /// <returns></returns>
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetCitizenProfileData(string prefix, string Data)
        {
            string URL = "";
            URL = m_AddressServiceURL;
            HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            string text;
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
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

        /// <summary>
        /// Get Local Aadhar Data
        /// </summary>
        /// <param name="UID"></param>
        /// <returns></returns>
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDetailAdhaar(string UID)
        {
            CharacterCertificateBAL characterCertificateBAL = new CharacterCertificateBAL();
            DataTable dt = null;
            dt = characterCertificateBAL.CheckLocalAadhaar(UID);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(dt);
            return JSONString;
        }

        #region Address
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetState()
        {
            string URL = "";

            URL = m_AddressServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetState_OUAT();
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDistrict(string prefix, string StateCode)
        {
            string URL = "";
            URL = m_AddressServiceURL;
            HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            string text;
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
                    text = proxy.GetDistrict_OUAT("", StateCode);
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetSubDistrict(string prefix, string DistrictCode)
        {
            string URL = "";
            URL = m_AddressServiceURL;
            HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            string text;
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
                    text = proxy.GetBlock_OUAT("", DistrictCode);
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetVillage(string prefix, string SubDistrictCode)
        {
            string URL = "";
            URL = m_AddressServiceURL;
            HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            string text;
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
                    text = proxy.GetPanchayat_OUAT("", SubDistrictCode);
                }
            }
            return text;
        }
        #endregion

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDistrictPloiceStation(string prefix, string DistrictCode)
        {
            string URL = "";

            URL = m_AddressServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetDistrictPoliceStations("", DistrictCode);
                }
            }
            return text;
        }

    }
}