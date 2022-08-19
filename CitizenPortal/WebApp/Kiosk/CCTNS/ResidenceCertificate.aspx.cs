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
    public partial class ResidenceCertificate : System.Web.UI.Page
    {
        static ResidenceBAL residenceBAL = null;
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

        #region Bind Address Detail
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //[WebMethod]
        //public static string GetState()
        //{
        //    string URL = "";
        //    URL = m_AddressServiceURL;
        //    HttpContext.Current.Session["DatabaseName"] = "MasterDB";
        //    string text;
        //    using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
        //    {
        //        IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
        //        using (OperationContextScope scope = new OperationContextScope(proxy))
        //        {
        //            List<Tuple<string, string>> nvc = GetSessionValues();
        //            MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
        //            System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
        //            OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
        //            text = proxy.GetState_OUAT();
        //        }
        //    }
        //    return text;
        //}

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
                    text = proxy.GetCCTNSDistrict();
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
            int discode = Convert.ToInt32(DistrictCode);
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
                    text = proxy.GetCCTNSSubDiv(discode);
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetTahsil(string prefix, string DistrictCode, string SubDistrictCode)
        {
            string URL = "";
            URL = m_AddressServiceURL;
            HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            string text;
            int discode = Convert.ToInt32(DistrictCode);
            int SubDistCode = Convert.ToInt32(SubDistrictCode);
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
                    text = proxy.GetCCTNSTahsil(discode, SubDistCode);
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetBlock(string prefix, string DistrictCode, string SubDistrictCode)
        {
            string URL = "";
            URL = m_AddressServiceURL;
            HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            string text;
            int discode = Convert.ToInt32(DistrictCode);
            int SubDistCode = Convert.ToInt32(SubDistrictCode);
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
                    text = proxy.GetCCTNSBlock(discode, SubDistCode);
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetRI(string prefix, string DistrictCode, string SubDistrictCode, string TahsilCode)
        {
            string URL = "";
            URL = m_AddressServiceURL;
            HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            string text;
            int discode = Convert.ToInt32(DistrictCode);
            int SubDistCode = Convert.ToInt32(SubDistrictCode);
            int tahasilCode = Convert.ToInt32(TahsilCode);
            using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
            {
                IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
                    text = proxy.GetCCTNSRI(discode, SubDistCode, tahasilCode);
                }
            }
            return text;
        }


        #endregion

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDetailAdhaar(string UID)
        {
            residenceBAL = new ResidenceBAL();
            DataTable dt = null;
            dt = residenceBAL.CheckLocalAadhaar(UID);
            string JSONString = string.Empty;
            JSONString = JsonConvert.SerializeObject(dt);
            return JSONString;
        }

        #region Page Information Insert/Get
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string RegisterResidence(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            CCTNSResidence viewModel = ToObjectFromJSON<CCTNSResidence>(noNewLines);
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
                    text = proxy.InsertResidence(viewModel);
                }
            }
            return text;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string RegisterResidenceAPI(string prefix, string Data)
        {
            string res = "";
            try
            {
                string noNewLines = Data.Replace("\n", "");
                CitizenEnrollment_DT objCitizenEnrollment = ToObjectFromJSON<CitizenEnrollment_DT>(noNewLines);

                objCitizenEnrollment.APIKEY = APICommon.ComputeHash(objCitizenEnrollment.IDCMGI);
                TestCitizenResult oRootObject = new TestCitizenResult();
                NameValueCollection formFields = APICommon.ConvertObjectToNameValueCollection(objCitizenEnrollment);
                oRootObject = APICommon.Post<TestCitizenResult>("http://164.164.87.35/edistrict/API/CAP_CitizenEnrollment.php", formFields);
                res = JsonConvert.SerializeObject(oRootObject);
                return res;
            }
            catch (Exception ex)
            {
                return "Error in Service call ." + ex.Message;
            }
        }


        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //[WebMethod]
        //public static string RegisterResidence(string prefix, string Data)
        //{
        //    string noNewLines = Data.Replace("\n", "");
        //    CTTNSCharacter viewModel = ToObjectFromJSON<CTTNSCharacter>(noNewLines);
        //    string URL = "", text = "";
        //    URL = m_AddressServiceURL;
        //    using (ChannelFactory<IService1Channe2> factory = new ChannelFactory<IService1Channe2>(new BasicHttpBinding()))
        //    {
        //        IService1Channe2 proxy = factory.CreateChannel(new EndpointAddress(URL));
        //        using (OperationContextScope scope = new OperationContextScope(proxy))
        //        {
        //            List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();
        //            MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
        //            System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
        //            OperationContext.Current.OutgoingMessageHeaders.Add(untyped);
        //            //text = proxy.InsertCharaterCertificate(viewModel);
        //        }
        //    }
        //    return text;
        //}
        #endregion
    }
}