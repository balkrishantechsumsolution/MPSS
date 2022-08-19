using System;
using System.Data;
using System.Web.Script.Services;
using System.Web.Services;
using System.Collections.Generic;
using System.ServiceModel;
using System.Web;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using Newtonsoft.Json;
using CitizenPortalLib.ServiceInterface;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Kiosk.OUAT.PGPhD
{
    public partial class EditPGPhdApplication : BasePage
    {
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        public interface IService1Channel : IAddressService, IClientChannel
        { }
        public static string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
        }

        [WebMethod]
        public static string GetOUATBlock(string prefix, string DistrictCode)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
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

        [WebMethod]
        public static string GetOUATCollege(string SelCollege)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetOUATCollege(SelCollege);
                }
            }
            return text;
        }

        [WebMethod]
        public static string GetOUATDegree(string SelPrograme)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetOUATDegree(SelPrograme);
                }
            }
            return text;
        }

        [WebMethod]
        public static string GetOUATDistrict(string prefix, string StateCode)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
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

        [WebMethod]
        public static string GetOUATPanchayat(string prefix, string SubDistrictCode)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
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

        [WebMethod]
        public static string GetOUATState()
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
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

        [WebMethod]
        public static string GetOUATSubject(string SubjectId)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetOUATSubject(SubjectId);
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string UpdateData(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            OUATPHDForm_DT viewModel = ToObjectFromJSON<OUATPHDForm_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            if (HttpContext.Current.Session["CitizenID"] != null)
            {
                viewModel.CitizenProfileID = HttpContext.Current.Session["CitizenID"].ToString();
            }

            string text;
            BasicHttpBinding binding = new BasicHttpBinding();
            binding.MaxReceivedMessageSize = 10485760;
            binding.MaxBufferSize = 10485760;
            binding.MaxBufferPoolSize = 10485760;

            //WebHttpBinding binding1 = new WebHttpBinding();
            //binding1.MaxReceivedMessageSize = 10485760;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(binding))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = "";// proxy.UpdateOUATPHDFormDataV2(viewModel);
                }
            }

            return text;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string ValidateOUATPhdOTP(string prefix, string Data, string EnteredOTP)
        {
            string noNewLines = Data.Replace("\n", "");

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.ValidateOUATPhdOTP(Data, EnteredOTP);
                }
            }
            return text;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetOUATAadhaarCount(string MobileNo, string AadhaarNo)
        {
            OUATBLL m_OUATBLL = new OUATBLL();
            DataTable DT = new DataTable();
            DT= m_OUATBLL.GetOUATAadhaarCount(MobileNo, AadhaarNo);
            string a = DT.Rows[0][0].ToString();
            return a.ToString();
        }


        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }

        private static List<Tuple<string, string>> GetSessionValues()
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
            public string Id { get; set; }
            public string Name { get; set; }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static string GetStudentDetail()
        {
            OUATBLL m_OUATBLL = new OUATBLL();
            DataSet DS = new DataSet();
            //DS = m_OUATBLL.GetOUATPGPhDAppDetails(m_ServiceID, m_AppID);
            string JSONString = JsonConvert.SerializeObject(DS, Formatting.Indented);
            return JSONString;
        }
    }
}