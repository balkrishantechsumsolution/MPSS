using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.NFBS
{
   
    public partial class NFBS : BasePage
    {
        string UID = "";
        ServicesBLL m_ServicesBLL = new ServicesBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string culture = "en-GB";

            if (((HiddenField)Page.Master.FindControl("HFLang")).Value != "")
            {
                if (((HiddenField)Page.Master.FindControl("HFLang")).Value == "1")
                {
                    culture = "en-GB";
                }
                else if (((HiddenField)Page.Master.FindControl("HFLang")).Value == "2")
                {
                    culture = "hi-IN";
                }
            }
            UID = Request.QueryString["UID"];
            DataTable dt = m_ServicesBLL.binddetails(UID);
            HiddenNFBSAge.Value = dt.Rows[0]["dateOfBirth"].ToString();
            HiddenNFBSGender.Value = dt.Rows[0]["gender"].ToString();

            Session["CurrentCulture"] = culture;
            HFServiceID.Value = "105";
            ngServiceID.Value = "105";

            //CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
            //test.sendsms("9650020439", "Hello test NFBS Form." + DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss"));

            //if (Session["json"] != null)
            //{
            //    HFUIDData.Value = Session["json"].ToString();
            //}

            btnHome.PostBackUrl = Session["HomePage"].ToString();
        }

        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        //static string m_ServiceURL = "http://localhost:52349/AddressService.svc";

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
        public static string InsertNFBS(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            NFBS_DT viewModel = ToObjectFromJSON<NFBS_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            string text;

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

                    text = proxy.InsertNFBS(viewModel);

                }
            }

            return text;

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string BindBPLYear(int ServiceId, string State, string District, string Taluka, string Village)
        {
            //IAddressService _proxy = GetProxy();
            //_proxy.Endpoint.ListenUri = new Uri("http://localhost:52349/AddressService.svc");
            //string text = _proxy.GetState("");

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
                    //List<string> nvc = new List<string>();
                    List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();
                    //nvc.Add("Value1");
                    //nvc.Add("Value2");

                    //string dbCon = HttpContext.Current.Session["DatabaseName"].ToString();
                    //string culture = HttpContext.Current.Session["CurrentCulture"].ToString();

                    //string ID = "";

                    //if (HttpContext.Current.Session["G2GID"] != null)
                    //{
                    //    ID = HttpContext.Current.Session["G2GID"].ToString();
                    //}
                    //else if (HttpContext.Current.Session["KioskID"] != null)
                    //{
                    //    ID = HttpContext.Current.Session["KioskID"].ToString();
                    //}


                    //nvc.Add(new Tuple<string, string>("G2GID", ID));
                    //nvc.Add(new Tuple<string, string>("KioskID", ID));
                    //nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

                    //MessageHeader<string> mhg = new MessageHeader<string>(dbCon);
                    //System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("SQLServer", "DB");
                    //OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    //mhg = new MessageHeader<string>(culture);
                    //untyped = mhg.GetUntypedHeader("Session", "CurrentCulture");
                    //OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    //mhg = new MessageHeader<string>(ID);
                    //untyped = mhg.GetUntypedHeader("Session", "KioskID");
                    //OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.BindBPLYear(ServiceId, State, District, Taluka, Village);

                }
            }

            return text;
        }

    }
}