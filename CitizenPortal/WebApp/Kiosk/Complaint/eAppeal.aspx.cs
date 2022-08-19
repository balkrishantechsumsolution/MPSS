using CitizenPortalLib;
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

namespace CitizenPortal.WebApp.Kiosk.Complaint
{
    public partial class eAppeal : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            HFServiceID.Value = "399";
            if (!IsPostBack)
            {
                BindDummyGridrow();
            }
        }

        public void BindDummyGridrow()
        {
            DataTable dt = new DataTable();
            //dt.Columns.Add("Select");
            dt.Columns.Add("Service Name");
            dt.Columns.Add("Time Limit");
            dt.Columns.Add("Designated Officer");
            dt.Columns.Add("Appellate Authority");
            dt.Columns.Add("Revisional Authority");

            grdViewAppeal.DataSource = dt;
            grdViewAppeal.DataBind();
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

        public interface IService1Channel : IAddressService, IClientChannel
        { }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertEAppeal(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            EAppeal_DT viewModel = ToObjectFromJSON<EAppeal_DT>(noNewLines);

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

                    text = proxy.InsertEAppeal(viewModel);

                }
            }

            return text;

        }



        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetEAppealServices(string prefix)
        {
            string URL = "";

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

                    text = proxy.GetEAppealServices("");

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetEAppealDepartment(string prefix)
        {
            string URL = "";

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

                    text = proxy.GetEAppealDepartment("");

                }
            }

            return text;
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetEAppealDeptServices(string prefix, string DepartmentCode)
        {
            string URL = "";

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

                    text = proxy.GetEAppealDeptServices("", DepartmentCode);

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetEAppealDepartmentCode(string prefix, string DepartmentCode)
        {
            string URL = "";

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

                    text = proxy.GetEAppealDepartmentCode("", DepartmentCode);

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetOfficeName(string prefix, string ServiceCode, string DepartmentCode,string DistrictCode)
        {
            string URL = "";

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

                    text = proxy.GetOfficeName("", ServiceCode, DepartmentCode, DistrictCode);

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string BindEAppealAppleteAuthority(string prefix, string ServiceCode)
        {
            string URL = "";

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

                    text = proxy.BindEAppealAppleteAuthority("", ServiceCode);

                }
            }

            return text;
        }
    }
}