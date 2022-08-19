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

namespace CitizenPortal.WebApp.Citizen.Forms
{
    public partial class CreateProfile : System.Web.UI.Page
    {
        CitizenRegistrationBLL m_CitizenRegistrationBLL = new CitizenRegistrationBLL();
        string m_UserID, ProfileID;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserType"] = "CITIZEN";
            HFServiceID.Value = "995";

            //TextBox text1 = (TextBox)PersonalDetail.FindControl("FirstName");
            //text1.Text = "Niraj Gupta";
            if (!IsPostBack)
            {
                //if (Request.QueryString["UserID"] == null) return;

                //m_UserID = Request.QueryString["UserID"].ToString();

                //DataSet dt = m_CitizenRegistrationBLL.GetUserDetails(m_UserID);
                //DataTable dtApp = dt.Tables[0];

                //TextBox t_FirstName = (TextBox)this.PersonalDetail.FindControl("FirstName");
                //t_FirstName.Text ="Niraj Gupta";
                //TextBox FirstName = (TextBox)this.Page.FindControl("FirstName");

                //TextBox FirstName = (TextBox)PersonalDetail.Parent.FindControl("FirstName");
                //TextBox MobileNo = (TextBox)PersonalDetail.Parent.FindControl("MobileNo");
                //TextBox EmailID = (TextBox)PersonalDetail.Parent.FindControl("EmailID");

                //ProfileID = dtApp.Rows[0]["ProfileID"].ToString();
                //FirstName.Text = dtApp.Rows[0]["FirstName"].ToString();
                //FirstName.Enabled = false;
                //MobileNo.Text = dtApp.Rows[0]["Mobile"].ToString();
                //MobileNo.Enabled = false;
                //EmailID.Text = dtApp.Rows[0]["Email"].ToString();
                //EmailID.Enabled = false;
            }
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

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertCreateProfile(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            CreateProfile_DT viewModel = ToObjectFromJSON<CreateProfile_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.InsertCreateProfile(viewModel);

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
        public static string BindCategory()
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

                    text = proxy.BindCategory();

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string BindReligion()
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

                    text = proxy.BindReligion();

                }
            }

            return text;
        }
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string BindMaritalstatus()
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

                    text = proxy.BindMaritalstatus();

                }
            }

            return text;
        }

       
    }
}