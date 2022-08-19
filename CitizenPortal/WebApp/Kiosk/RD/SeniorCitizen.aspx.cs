using System;
using System.Web;
using System.ServiceModel;
using System.Web.Services;
using System.Collections.Generic;
using System.Web.Script.Services;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System.Data;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.Kiosk.RD
{
    public partial class SeniorCitizen : System.Web.UI.Page
    {
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        string LoginID = "";
        public interface IService1Channel : IAddressService, IClientChannel
        { }
        protected void Page_Load(object sender, EventArgs e)
        {
            string culture = "en-GB";

            if (HFCurrentLang.Value == "")
            {
                HFCurrentLang.Value = "1";
                btnLang.Value = "ଓଡ଼ିଆ";
            }

            if (HFCurrentLang.Value != "")
            {
                if (HFCurrentLang.Value == "1")
                {
                    culture = "en-GB";
                    HFCurrentLang.Value = "1";
                    btnLang.Value = "Odia";
                }
                else if (HFCurrentLang.Value == "2")
                {
                    culture = "or-IN";
                    HFCurrentLang.Value = "2";
                    btnLang.Value = "English";
                }
            }

            Session["CurrentCultureLabels"] = culture;
           
                LoginID = Session["LoginID"].ToString();
                if (LoginID.Contains("NO."))
                {
                    GetPS();
                }
                else if (LoginID.Contains("ANO."))
                {
                    GetPS();
                }
            
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

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertSeniorCitizenData(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            SeniorCitizenIDCard_DT viewModel = ToObjectFromJSON<SeniorCitizenIDCard_DT>(noNewLines);

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

                    text = proxy.InsertSeniorCitizenIDCardData(viewModel);
                }
            }

            return text;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string ValidateCitizenOTP(string prefix, string Data, string EnteredOTP)
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

                    text = proxy.ValidateCitizenOTP(Data, EnteredOTP);
                }
            }
            return text;
        }
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDistrictPloiceStation(string prefix, string DistrictCode)
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

                    text = proxy.GetDistrictPoliceStations("", DistrictCode);
                }
            }
            return text;
        }

        protected void BtnHome_Click(object sender, EventArgs e)
        {
            try
            {
                //redirect to current user dashboard home page
                string Url = Session["HomePage"].ToString();
                Response.Redirect(Url, false);
            }
            catch (Exception ex)
            {

            }
        }
        [WebMethod]
        public static string GetSeniorCitizenOdishaDistrict(string prefix, string StateCode)
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

                    text= proxy.GetSeniorCitizenOdishaDist("", StateCode);
                }
            }
            return text;
        }
        public void GetPS()
        {
            try
            {
                DataTable dt = new DataTable();
                SeniorCitizenBLL ScBll = new SeniorCitizenBLL();
                 LoginID = Session["LoginID"].ToString();
                dt = ScBll.GetDistrictAndPS(LoginID);
                if (dt != null && dt.Rows.Count > 0)
                {
                    HDFDistrict.Value = dt.Rows[0]["DistrictCode"].ToString();
                    HDFPS.Value = dt.Rows[0]["PoliceStation"].ToString();
                }
                //GetDistrictAndPSSP
            }
            catch (Exception ex)
            {

            }
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string ValidateAadhaarNo(string AadhaarNumber)
        {
            string noNewLines = AadhaarNumber.Replace("\n", "");

            string URL = "";
            URL = m_ServiceURL;

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

                    text = proxy.ValidateAadhaarNo(AadhaarNumber);
                }
            }

            return text;
        }
    }
}