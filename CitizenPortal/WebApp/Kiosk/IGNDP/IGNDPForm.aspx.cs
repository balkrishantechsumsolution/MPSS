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


namespace CitizenPortal.WebApp.Kiosk.IGNDP
{
   // CitizenDashboardBLL Login = new CitizenDashboardBLL();

    public partial class IGNDPForm : BasePage
    {
        
        string UID = "";
        
        ServicesBLL m_ServicesBLL = new ServicesBLL();

       
        protected void Page_Load(object sender, EventArgs e)
        {




            /*
             * UID=102000000046&

SvcID=108&

DPT=103&

DIST=115&

BLK=2115154&
PAN=2115154004&
OFC=15&
OFR=2
             * 
             * 
             */

            // 22/11/2016 : logic commented as it is still untested.
            //if (Request.QueryString["UID"] == null || Request.QueryString["SvcID"] == null || Request.QueryString["DPT"] == null || Request.QueryString["DIST"] == null
            //    || Request.QueryString["BLK"] == null || Request.QueryString["PAN"] == null || Request.QueryString["OFC"] == null || Request.QueryString["OFR"] == null)
            //{
            //    return;
            //}

            //if (Request.QueryString["UID"].ToString() == "" || Request.QueryString["SvcID"].ToString() == "" || Request.QueryString["DPT"].ToString() == "" 
            //    || Request.QueryString["DIST"].ToString() == "" || Request.QueryString["BLK"].ToString() == "" 
            //    || Request.QueryString["PAN"].ToString() == "" || Request.QueryString["OFC"].ToString() == "" || Request.QueryString["OFR"].ToString() == "")
            //{
            //    return;
            //}





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
            HiddenIGNDPAGE.Value = dt.Rows[0]["dateOfBirth"].ToString();
            HiddenIGNDPGENDER.Value = dt.Rows[0]["gender"].ToString();

            Session["CurrentCulture"] = culture;
            HFServiceID.Value = "108";
            ngServiceID.Value = "108";


            btnHome.PostBackUrl = Session["HomePage"].ToString();

           // 22 / 11 / 2016 : logic commented as it is still untested.
            //if (UID != "" && UID != null)
            //{

            //    btnHome.PostBackUrl = Session["HomePage"].ToString();
            //}
            //else
            //{
            //    btnHome.PostBackUrl = "/WebApp/Citizen/Forms/Dashboard.aspx?UID = " + UID;

            //}

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

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertIGNDP(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            IGNDP_DT viewModel = ToObjectFromJSON<IGNDP_DT>(noNewLines);

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

                    text = proxy.InsertIGNDP(viewModel);

                }
            }

            return text;

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
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string binddetails(string uid)
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

                    text = proxy.binddetails(uid);

                }
            }

            return text;
        }
       





    }
}