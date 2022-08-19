using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;


namespace CitizenPortal.WebApp.Examination
{
    public partial class StudentResetPassword : CommonBasePage
    {
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        public interface IService1Channel : IAddressService, IClientChannel
        { }

        protected void Page_Load(object sender, EventArgs e)
        {
            //sp_helptext Login_GetUserDataSP
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetApplicationDetails(string AppID)
        {
            string text;

            ChangePasswordBLL t_ChangePasswordBLL = new ChangePasswordBLL();
            System.Data.DataSet dtAppList = t_ChangePasswordBLL.GetStudentDetails(AppID);
            
            text = JsonConvert.SerializeObject(dtAppList, Newtonsoft.Json.Formatting.Indented);
            return text;
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
        public static string InsertData(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            UpdateStudentPassword_DT viewModel = ToObjectFromJSON<UpdateStudentPassword_DT>(noNewLines);
            HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            string URL = "";
            URL = m_ServiceURL;

            //if (HttpContext.Current.Session["CitizenID"] != null)
            //{
            //    viewModel.CitizenProfileID = HttpContext.Current.Session["CitizenID"].ToString();
            //}

            string text;
            BasicHttpBinding binding = new BasicHttpBinding();
            binding.MaxReceivedMessageSize = 10485760;
            binding.MaxBufferSize = 10485760;
            binding.MaxBufferPoolSize = 10485760;

            //WebHttpBinding binding1 = new WebHttpBinding();
            //binding1.MaxReceivedMessageSize = 10485760;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(binding))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.InsertPasswordDetail(viewModel);
                }
            }

            return text;
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
    }
}