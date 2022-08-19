using CitizenPortalLib;
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

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class OfficeOfficer : BasePage
    {
        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
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
        public static string GetServices(string prefix)
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

                    text = proxy.GetServices("");

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDeptServices(string prefix, string DepartmentCode)
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

                    text = proxy.GetDeptServices("", DepartmentCode);

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDepartmentCode(string prefix, string DepartmentCode)
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

                    text = proxy.GetDepartmentCode("", DepartmentCode);

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDepartment(string prefix)
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

                    text = proxy.GetDepartment("");

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetOffice(string prefix, string DistrictCode, string SubDistrictCode, string VillageCode, string ServiceCode, string DepartmentCode)
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

                    text = proxy.GetOffice("", DistrictCode, SubDistrictCode, VillageCode, ServiceCode, DepartmentCode);

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetOfficer(string prefix, string OfficeCode, string ServiceCode, string DistrictCode, string BlockCode)
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

                    text = proxy.GetOfficer("", OfficeCode, ServiceCode, DistrictCode, BlockCode);

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string BindAppleteAuthority(string prefix, string ServiceCode)
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

                    text = proxy.BindAppleteAuthority("", ServiceCode);

                }
            }

            return text;
        }
    }
}