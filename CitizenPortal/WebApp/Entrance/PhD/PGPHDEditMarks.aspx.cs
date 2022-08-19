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
    public partial class PGPHDEditMarks : BasePage
    {
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        public interface IService1Channel : IAddressService, IClientChannel
        { }

        OUATBLL m_OUATBLL = new OUATBLL();
        public static string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            //DataSet dt = m_OUATBLL.GetOUATPHDAppDetails(m_ServiceID, m_AppID);
            //DataTable dtApp = dt.Tables[0];
            //DataTable dtTransDetail = dt.Tables[1];
            //DataTable dtTrackStatus = dt.Tables[2];
            //DataTable dtEducationDetails = dt.Tables[3];
            //DataTable dtSign = dt.Tables[4];
            //DataTable dtAge = dt.Tables[5];

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

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertPGPHDMarks(string prefix, string Data)
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


            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(binding))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = "";// proxy.InsertPGPHDMarks(viewModel);
                }
            }

            return text;
        }
    }
}