using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace CitizenPortal.WebApp.Kiosk.CCTNS
{
    public partial class ComplaintRegistration : System.Web.UI.Page
    {
        static ComplaintRegBAL ComplaintRegBAL = null;
        static ServicesBLL m_ServicesBLL = new ServicesBLL();
        static string m_AddressServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        public interface IService1Channe2 : IClientChannel, IAddressService
        {
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
        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = new JavaScriptSerializer().Deserialize<T>(jsonString); //(T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }

        #region Bind Master Data
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
                    text = proxy.GetCCTNSMState();
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
                    text = proxy.GetCCTNSMDistrict(Convert.ToInt32(StateCode));
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetNationality()
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
                    text = proxy.GetCCTNSMNationality();
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetIdentity()
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
                    text = proxy.GetCCTNSMIdentity();
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetRelation()
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
                    text = proxy.GetCCTNSMRelation();
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetPoliceStation(string StateID, string DisID)
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
                    text = proxy.GetCCTNSMPoliceStation(Convert.ToInt32(StateID), Convert.ToInt32(DisID));
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetOffice(string StateID, string DisID)
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
                    text = proxy.GetCCTNSMOffice(Convert.ToInt32(StateID), Convert.ToInt32(DisID));
                }
            }
            return text;
        }

        #endregion

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDetailAdhaar(string UID)
        {
            ComplaintRegBAL = new ComplaintRegBAL();
            DataTable dt = null;
            dt = ComplaintRegBAL.CheckLocalAadhaar(UID);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(dt);
            return JSONString;
        }

        #region Page Information Insert/Get
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertData(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            ComplaintReg viewModel = ToObjectFromJSON<ComplaintReg>(noNewLines);
            string URL = "", text = "";
            URL = m_AddressServiceURL;
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
                    text = proxy.InsComplaintReg(viewModel);
                }
            }
            return text;
        }

        #endregion
    }
}