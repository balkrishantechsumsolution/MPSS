using System;
using System.Web;
using System.ServiceModel;
using System.Web.Services;
using System.Collections.Generic;
using System.Web.Script.Services;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using CitizenPortalLib.BLL;
using CitizenPortalLib;
using Newtonsoft.Json;
using System.Web.Script.Serialization;

namespace CitizenPortal.WebApp.Enrollment
{
    public partial class EnrollmentForm : System.Web.UI.Page
    {
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        string LoginID = "", AppID = "", ServiceID = "";
        public interface IService1Channel : IAddressService, IClientChannel
        { }
        protected void Page_Load(object sender, EventArgs e)
        {
            //string culture = "en-GB";
            //Session["CurrentCultureLabels"] = culture;
            //if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["SvcID"] == null) return;

            //if (Session["role"].ToString().ToUpper() == "VLE")
            //{
                
            //}
            //else
            //{
                
            //}

            //GetCollegeDetail(Session["LoginID"].ToString());
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
        public static string InsertEnrollmentData(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            EnrollmentData_DT viewModel = ToObjectFromJSON<EnrollmentData_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            if (HttpContext.Current.Session["CitizenID"] != null)
            {
                viewModel.ProfileID = HttpContext.Current.Session["CitizenID"].ToString();
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

                    text = proxy.InsertEnrollmentPartTime(viewModel);
                }
            }

            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetCBCSCourseList()
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

                    text = proxy.GetCBCSCourseLists();
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetCBCSSubjecteList(string CourseName, string SubjectType)
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

                    text = proxy.GetCBCSSubjectLists(CourseName, SubjectType);
                }
            }
            return text;
        }
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetApplicationDetails(string AppID)
        {
            string text;

            //string URL = "";
            //URL = m_ServiceURL;
            //HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            //System.Data.DataTable result = null;
            
            //using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            //{
            //    IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
            //    using (OperationContextScope scope = new OperationContextScope(proxy))
            //    {
            //        List<Tuple<string, string>> nvc = GetSessionValues();

            //        MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
            //        System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
            //        OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

            //        text = proxy.GetApplicationDetails(AppID);
            //    }
            //}

            CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataSet dtAppList = t_CBCSAdmissionFormBLL.GetApplicationDetails(AppID);
            //dtAppList = t_CBCSAdmissionFormBLL.GetApplicationDetails(AppID);

            text = JsonConvert.SerializeObject(dtAppList, Newtonsoft.Json.Formatting.Indented);
            return text;
        }
        //public void GetCollegeDetail(string UserID)
        //{
        //    try
        //    {
        //        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        //        System.Data.DataTable dt = new System.Data.DataTable();
        //        dt = m_AdmissionFormBLL.Get_CollegeDetail(UserID);
        //        if (dt != null && dt.Rows.Count > 0)
        //        {
        //            HDFCCode.Value = dt.Rows[0]["College_Code"].ToString();
        //            HDFCName.Value = dt.Rows[0]["CollegeName"].ToString();
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //    }

        //}

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string ValidateEnrollmentAge(string CourseCode, string ProgramCode, string Category, string Gender, string Age, string Domicile)
        {
            string text;

            EnrollmentBLL t_EnrollmentBLL = new EnrollmentBLL();
            System.Data.DataSet dtAppList = t_EnrollmentBLL.ValidateEnrollmentAge(CourseCode, ProgramCode, Category, Gender, Age, Domicile);

            text = JsonConvert.SerializeObject(dtAppList, Newtonsoft.Json.Formatting.Indented);
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetCollege()
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

                    text = proxy.GetCollegeMaster();
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetCourse(string CollegeCode)
        {
            string text;
            FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
            System.Data.DataTable dtAppList = m_FacultyModuleBLL.GetCourseCSVTU(CollegeCode);

            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAppList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["CourseCode"],
                        Name = sdr["CourseName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
            //text = JsonConvert.SerializeObject(dtAppList, Newtonsoft.Json.Formatting.Indented);
            //return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetProgram(string CourseCode)
        {
            string text;
            FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
            System.Data.DataTable dtAppList = m_FacultyModuleBLL.GetProgramCSVTU(CourseCode);

            List<object> Category = new List<object>();
            using (System.Data.DataTableReader sdr = dtAppList.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Category.Add(new
                    {
                        Id = sdr["ProgramCode"],
                        Name = sdr["ProgramName"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Category));
            //text = JsonConvert.SerializeObject(dtAppList, Newtonsoft.Json.Formatting.Indented);
            //return text;
        }
    }
}