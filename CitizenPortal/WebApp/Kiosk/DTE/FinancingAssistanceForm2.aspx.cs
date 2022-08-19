using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace CitizenPortal.WebApp.Kiosk.DTE
{
    public partial class FinancingAssistanceForm2 : BasePage
    {
        ServicesBLL m_ServicesBLL = new ServicesBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
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
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }
        public interface IService1Channel : IAddressService, IClientChannel
        {

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertFinancialAssistance2(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            FinancialAssistance2_DT viewModel = ToObjectFromJSON<FinancialAssistance2_DT>(noNewLines);

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

                    text = proxy.InsertFinancialAssistance2(viewModel);
                }
            }
            return text;
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<ListItem> InstituteData(string InstituteType)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    if (InstituteType == "Government")
                    {
                        cmd.CommandText = "Select InstituteId,InstituteName from GovernmentInstituteTb Order By InstituteName";
                    }
                    else if (InstituteType == "Private")
                    {
                        cmd.CommandText = "Select InstituteId,InstituteName from PrivateInstituteTb Order By InstituteName";
                    }
                    else
                    {
                        cmd.CommandText = "Select top 0 InstituteName from GovernmentInstituteTb";
                    }
                    cmd.Connection = con;
                    List<ListItem> InstituteName = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            InstituteName.Add(new ListItem
                            {
                                Name = sdr["InstituteName"].ToString(),
                                Id = sdr["InstituteId"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return InstituteName;
                }
            }
        }

        public class ListItem
        {
            public string Name { get; set; }
            public string Id { get; set; }
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<ListItem> BranchData(string InstituteType)
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    if (InstituteType != "0")
                    {
                        cmd.CommandText = "Select BranchId,BranchName from BranchIntituteTb Order By BranchName";
                    }
                    else
                    {
                        cmd.CommandText = "Select top 0 BranchName from BranchIntituteTb";
                    }
                    cmd.Connection = con;
                    List<ListItem> BranchName = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            BranchName.Add(new ListItem
                            {
                                Name = sdr["BranchName"].ToString(),
                                Id = sdr["BranchId"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return BranchName;
                }
            }
        }
    }
}