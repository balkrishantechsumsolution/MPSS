using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static CitizenPortal.Services.AddressService;

namespace CitizenPortal.WebApp.G2G.Sample
{
    public partial class SampleDrillDownReport : System.Web.UI.Page
    {
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public interface IService1Channel : IAddressService, IClientChannel
        { }

        private static List<Tuple<string, string>> GetSessionValues()
        {
            List<Tuple<string, string>> nvc = new List<Tuple<string, string>>();

            if (HttpContext.Current.Session["CurrentCulture"].ToString() == null)
            {
                //return ;
            }
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
        public static string GetStudentCount(string prefix, string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, string HonsCode, int ReportType)
        {
            string URL = "";
            URL = m_ServiceURL;

            string text;
            //BasicHttpBinding binding = new BasicHttpBinding();
            //binding.MaxReceivedMessageSize = 819200000;
            //binding.MaxBufferSize = 819200000;
            //binding.MaxBufferPoolSize = 819200000;

            //using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(binding))
            //{
            //    IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
            //    using (OperationContextScope scope = new OperationContextScope(proxy))
            //    {
            //        List<Tuple<string, string>> nvc = GetSessionValues();

            //        MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
            //        System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
            //        OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

            //        text = proxy.GetStudentCount(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);
            //    }
            //}

            NoticeData_DT Data = new NoticeData_DT();

            System.Data.DataTable result = null;
            string UID = "";
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            DrillDownGrid t_DrillDownGrid = new DrillDownGrid();
            //LoginID = GetKioskID(objSessionTuple);
            //string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType
            result = m_G2GDashboardBLL.GetChartData(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);

            text = JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented);
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDrillSemFee()
        {
            string prefix = ""; string LoginID = ""; int AdmissionYear = 0; string CollegeCode = ""; string BranchCode = ""; int ReportType = 0;
            string URL = "";
            URL = m_ServiceURL;

            string text;
            //BasicHttpBinding binding = new BasicHttpBinding();
            //binding.MaxReceivedMessageSize = 819200000;
            //binding.MaxBufferSize = 819200000;
            //binding.MaxBufferPoolSize = 819200000;

            //using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(binding))
            //{
            //    IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
            //    using (OperationContextScope scope = new OperationContextScope(proxy))
            //    {
            //        List<Tuple<string, string>> nvc = GetSessionValues();

            //        MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
            //        System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
            //        OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

            //        text = proxy.GetDrillSemFee(LoginID, AdmissionYear, CollegeCode, BranchCode, ReportType);
            //    }
            //}

            NoticeData_DT Data = new NoticeData_DT();

            System.Data.DataTable result = null;
            string UID = "";
            G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
            DrillDownGrid t_DrillDownGrid = new DrillDownGrid();
            //LoginID = GetKioskID(objSessionTuple);
            //string LoginID, int AdmissionYear, string CollegeCode, string BranchCode, int ReportType
            result = m_G2GDashboardBLL.GetDrillSemFee(LoginID, AdmissionYear, CollegeCode, BranchCode, ReportType);

            text = JsonConvert.SerializeObject(result, Newtonsoft.Json.Formatting.Indented);

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetSemFeeCount(string prefix, string LoginID, int ExamYear, string CollegeCode, string Semester, string BranchCode, string ExamType, int ReportType)
        {
            string URL = "";
            URL = m_ServiceURL;

            string text;
            BasicHttpBinding binding = new BasicHttpBinding();
            binding.MaxReceivedMessageSize = 819200000;
            binding.MaxBufferSize = 819200000;
            binding.MaxBufferPoolSize = 819200000;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(binding))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetSemFeeCount(LoginID, ExamYear, CollegeCode, Semester, BranchCode, ExamType, ReportType);
                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetStudentChart()
        {
            string prefix = ""; string LoginID = ""; int AdmissionYear = 0; string CollegeCode = ""; string BranchCode = ""; string HonsCode = ""; int ReportType = 0;
            string URL = "";
            URL = m_ServiceURL;

            string text;
            BasicHttpBinding binding = new BasicHttpBinding();
            binding.MaxReceivedMessageSize = 819200000;
            binding.MaxBufferSize = 819200000;
            binding.MaxBufferPoolSize = 819200000;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(binding))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetStudentChart(LoginID, AdmissionYear, CollegeCode, BranchCode, HonsCode, ReportType);
                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetStudentInternal()
        {
            string prefix = ""; string LoginID = ""; string AdmissionYear = ""; string CollegeCode = ""; string BranchCode = ""; string HonsCode = ""; int ReportType = 0;
            string URL = "";
            URL = m_ServiceURL;

            string text;
            BasicHttpBinding binding = new BasicHttpBinding();
            binding.MaxReceivedMessageSize = 819200000;
            binding.MaxBufferSize = 819200000;
            binding.MaxBufferPoolSize = 819200000;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(binding))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetStudentInternal(LoginID);
                }
            }

            return text;
        }
    }
}