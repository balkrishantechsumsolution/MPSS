using CitizenPortal.Services;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.ServiceModel;
using System.ServiceModel.Description;
using System.ServiceModel.Web;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Registration
{
    public partial class KioskRegistration : System.Web.UI.Page
    {
        //static string m_ServiceURL = "http://citizenportalservice.azurewebsites.net/AddressService.svc";
        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        //static string m_ServiceURL = "http://localhost:52349/AddressService.svc";

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CurrentCulture"] = "en-GB";
        }

        static IAddressService GetProxy()
        {
            string URL = "";
            //if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("localhost"))
            //    URL = "http://localhost:52349/AddressService.svc";
            //else
            //    URL = "http://citizenportalservice.azurewebsites.net/AddressService.svc";

            URL = m_ServiceURL;

            //BasicHttpBinding binding = new BasicHttpBinding();

            HttpTransportSecurity sec = new HttpTransportSecurity();
            sec.ProxyCredentialType = HttpProxyCredentialType.Basic;

            WSHttpSecurity sec2 = new WSHttpSecurity();
            sec2.Transport = sec;
            sec2.Transport.ClientCredentialType = HttpClientCredentialType.None;

            WSHttpBinding binding = new WSHttpBinding();
            binding.AllowCookies = true;

            //OptionalReliableSession session = new OptionalReliableSession();
            //session.Enabled = false;

            //binding.ReliableSession = session;
            //binding.Security.Mode = SecurityMode.None;
            //binding.Security.Message.EstablishSecurityContext = true;

            //binding.MessageEncoding = WSMessageEncoding.Text;
            //binding.Security.Mode = SecurityMode.None;
            //binding.ReliableSession.Enabled = true;
            //binding.Security.Transport.ClientCredentialType = HttpClientCredentialType.None;
            //binding.Security.Transport.ProxyCredentialType = HttpProxyCredentialType.None;
            //binding.Security.Transport.Realm = "";

            //binding.TextEncoding.

            //binding.Security = sec2;

            //ServiceMetadataBehavior behavior = new ServiceMetadataBehavior();
            //behavior.HttpsGetEnabled = true;
            //behavior.HttpsGetUrl = new Uri(URL);            

            EndpointAddress endpointAddress = new EndpointAddress(URL);

            binding.OpenTimeout = new TimeSpan(0, 10, 0);
            binding.CloseTimeout = new TimeSpan(0, 10, 0);
            binding.SendTimeout = new TimeSpan(0, 10, 0);
            binding.ReceiveTimeout = new TimeSpan(0, 10, 0);

            IAddressService _proxy = ChannelFactory<IAddressService>.CreateChannel(binding, endpointAddress);

            ////Create the Proxy
            //ChannelFactory<IAddressService> _proxy = new ChannelFactory<IAddressService>(binding, endpointAddress);

            ////Sets the MaxItemsInObjectGraph, so that client can receive large objects
            //foreach (var operation in _proxy.Endpoint.Contract.Operations)
            //{
            //    DataContractSerializerOperationBehavior operationBehavior = operation.Behaviors.Find<DataContractSerializerOperationBehavior>();
            //    //If DataContractSerializerOperationBehavior is not present in the Behavior, then add
            //    if (operationBehavior == null)
            //    {
            //        operationBehavior = new DataContractSerializerOperationBehavior(operation);
            //        operation.Behaviors.Add(operationBehavior);
            //    }
            //    //IMPORTANT: As 'operationBehavior' is a reference, changing anything here will automatically update the value in list, so no need to add this behavior to behaviorlist
            //    operationBehavior.MaxItemsInObjectGraph = 2147483647;
            //}




            return _proxy;
        }

        [WebMethod]
        public static List<string> GetSvcName(string prefix, string SvcName)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetDistrict("", StateCode);
            //return text;
            string URL = "";

            //if (HttpContext.Current.Request.Url.AbsoluteUri.Contains("localhost"))
            //    URL = "http://localhost:52349/AddressService.svc";
            //else
            //    URL = "http://citizenportalservice.azurewebsites.net/AddressService.svc";

            URL = m_ServiceURL;
            
            List<string> text;
            //using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new WSHttpBinding(SecurityMode.None, false)))
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetServiceName("", SvcName);

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

            //nvc.Add(new Tuple<string, string>("G2GID", ID));
            //nvc.Add(new Tuple<string, string>("KioskID", ID));
            nvc.Add(new Tuple<string, string>("ID", ID));
            nvc.Add(new Tuple<string, string>("UserType", userType));
            nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

            return nvc;
        }

        [WebMethod]
        public static string GetDistrict(string prefix, string StateCode)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetDistrict("", StateCode);
            //return text;
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
                    List<Tuple<string, string>> nvc = GetSessionValues();// new List<Tuple<string, string>>();

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

                    text = proxy.GetDistrict("", StateCode);

                }
            }

            return text;

        }

        [WebMethod]
        public static string GetState(string prefix)
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

                    text = proxy.GetState("");

                }
            }

            return text;
        }

        public interface IService1Channel : IAddressService, IClientChannel
        { }

        [WebMethod]
        public static string GetSubDistrict_old(string prefix, string DistrictCode)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetSubDistrict("", DistrictCode);
            //return text;
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
                    List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();

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

                    text = proxy.GetSubDistrict("", DistrictCode);

                }
            }

            return text;

        }

        [WebMethod]
        public static string GetSubDistrict(string prefix, string DistrictCode)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetSubDistrict("", DistrictCode);
            //return text;
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
                    List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();

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

                    text = proxy.GetBlock("", DistrictCode);

                }
            }

            return text;

        }

        [WebMethod]
        public static string GetVillage(string prefix, string SubDistrictCode)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetVillage("", SubDistrictCode);
            //return text;
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
                    List<Tuple<string, string>> nvc = GetSessionValues(); // new List<Tuple<string, string>>();

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

                    text = proxy.GetPanchayat("", SubDistrictCode);

                }
            }

            return text;
        }

        [WebMethod]
        public static string GetVillage_old(string prefix, string SubDistrictCode)
        {
            //IAddressService _proxy = GetProxy();
            //string text = _proxy.GetVillage("", SubDistrictCode);
            //return text;
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
                    List<Tuple<string, string>> nvc = GetSessionValues(); // new List<Tuple<string, string>>();

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

                    text = proxy.GetVillage("", SubDistrictCode);

                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertData(string prefix, string Data)
        {
            IAddressService _proxy = GetProxy();
            string noNewLines = Data.Replace("\n", "");
            KioskRegistrationV2_DT viewModel = ToObjectFromJSON<KioskRegistrationV2_DT>(noNewLines);

            var text = _proxy.InsertData(viewModel);
            return text.ToString();
        }

        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertSeniorCitizen(string prefix, string Data)
        {
            //IAddressService _proxy = GetProxy();
            string noNewLines = Data.Replace("\n", "");
            SeniorCitizen_DT viewModel = ToObjectFromJSON<SeniorCitizen_DT>(noNewLines);

            //var text = _proxy.InsertSeniorCitizen(viewModel);
            //return text.ToString();

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
                    List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();

                    //string dbCon = HttpContext.Current.Session["DatabaseName"].ToString();
                    //string culture = HttpContext.Current.Session["CurrentCulture"].ToString();

                    //string ID = "";

                    ////if (HttpContext.Current.Session["G2GID"] != null)
                    ////{
                    ////    ID = HttpContext.Current.Session["G2GID"].ToString();
                    ////}
                    ////else
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

                    text = proxy.InsertSeniorCitizen(viewModel);

                }
            }

            return text;
        }
        
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertNFBSForm(string prefix, string Data)
        {
            //IAddressService _proxy = GetProxy();
            string noNewLines = Data.Replace("\n", "");
            NFBS_DT viewModel = ToObjectFromJSON<NFBS_DT>(noNewLines);

            //var text = _proxy.InsertSeniorCitizen(viewModel);
            //return text.ToString();

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
                    List<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();

                    //string dbCon = HttpContext.Current.Session["DatabaseName"].ToString();
                    //string culture = HttpContext.Current.Session["CurrentCulture"].ToString();

                    //string ID = "";

                    ////if (HttpContext.Current.Session["G2GID"] != null)
                    ////{
                    ////    ID = HttpContext.Current.Session["G2GID"].ToString();
                    ////}
                    ////else
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

                    text = proxy.InsertNFBSForm(viewModel);
                    text = "";
                }
            }

            return text;
        }

        [WebMethod]
        public static string UploadImage(string fileName, Stream stream)
        {
            BasicHttpBinding binding = new BasicHttpBinding();
            EndpointAddress endpointAddress = new EndpointAddress("http://localhost:52349/ImageUpload.svc");
            binding.OpenTimeout = new TimeSpan(0, 10, 0);
            binding.CloseTimeout = new TimeSpan(0, 10, 0);
            binding.SendTimeout = new TimeSpan(0, 10, 0);
            binding.ReceiveTimeout = new TimeSpan(0, 10, 0);
            IImageUpload _proxy = ChannelFactory<IImageUpload>.CreateChannel(binding, endpointAddress);

            byte[] bytearray = null;
            string name = "";
            //throw new NotImplementedException();
            //if (FileUpload1.HasFile)
            //{
            //    name = FileUpload1.FileName;
            //    Stream stream = FileUpload1.FileContent;
            //    stream.Seek(0, SeekOrigin.Begin);
            //    bytearray = new byte[stream.Length];
            //    int count = 0;
            //    while (count < stream.Length)
            //    {
            //        bytearray[count++] = Convert.ToByte(stream.ReadByte());
            //    }

            //}

            //_proxy.FileUpload("Temp1", )

            string baseAddress = "http://localhost:52349/ImageUpload.svc/FileUpload/";
            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(baseAddress + name);
            request.Method = "POST";
            request.ContentType = "text/plain";
            Stream serverStream = request.GetRequestStream();
            serverStream.Write(bytearray, 0, bytearray.Length);
            serverStream.Close();
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                int statusCode = (int)response.StatusCode;
                StreamReader reader = new StreamReader(response.GetResponseStream());

            }

            return "";
        }


        [WebMethod]
        public static string GetUser(string UserName, string Password)
        {
            IAddressService _proxy = GetProxy();
            string text = "";
            //string text = _proxy.GetUserName(UserName, Password);
            return text;
        }

    }

    public static class TupleListExtensions
    {
        public static void Add<T1, T2>(this IList<Tuple<T1, T2>> list,
                T1 item1, T2 item2)
        {
            list.Add(Tuple.Create(item1, item2));
        }

        public static void Add<T1, T2, T3>(this IList<Tuple<T1, T2, T3>> list,
                T1 item1, T2 item2, T3 item3)
        {
            list.Add(Tuple.Create(item1, item2, item3));
        }

        // and so on...
    }

    //public static class BigIntegerListExtensions
    //{
    //    public static void Add(this IList<BigInteger> list,
    //        params byte[] value)
    //    {
    //        list.Add(new BigInteger(value));
    //    }

    //    public static void Add(this IList<BigInteger> list,
    //        string value)
    //    {
    //        list.Add(BigInteger.Parse(value));
    //    }
    //}

}