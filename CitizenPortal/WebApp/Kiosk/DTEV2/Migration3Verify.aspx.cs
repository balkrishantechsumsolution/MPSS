using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortal.DocumentVerification;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;

namespace CitizenPortal.WebApp.Kiosk.DTEV2
{
    public partial class Migration3Verify : System.Web.UI.Page
    {
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
            Session["CurrentCulture"] = culture;
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
        public static string InsertNewMigration(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            NewMigrationVerify_DT viewModel = ToObjectFromJSON<NewMigrationVerify_DT>(noNewLines);
            string URL = "";
            URL = m_ServiceURL;
            string text;
            using (ChannelFactory<Migration3.IService1Channel> factory = new ChannelFactory<Migration3.IService1Channel>(new BasicHttpBinding()))
            {
                Migration3.IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.InsertNewMigrationVerify(viewModel);
                }
            }
            return text;
        }

        [WebMethod]
        public static string GetInstituteMaster(string prefix)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<Migration3.IService1Channel> factory = new ChannelFactory<Migration3.IService1Channel>(new BasicHttpBinding()))
            {
                Migration3.IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();
                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetInstituteMaster();
                }
            }
            return text;
        }

        [WebMethod]
        public static string GetMigrationData(string regno)
        {
            //string URL = "";
            //URL = m_ServiceURL;
            //HttpContext.Current.Session["DatabaseName"] = "MasterDB";
            //StudentDetailsWS detailsWs = new StudentDetailsWS();
            //System.Data.DataTable dt = detailsWs.MigrationCertificate(regno, AdmisionYr);
            //MigrationResultVerify mr = new MigrationResultVerify();
            //mr.RegistrationNumber = dt.Rows[0]["RegistrationNumber"].ToString();
            //mr.StudentName = dt.Rows[0]["StudentName"].ToString();
            //mr.Branch = dt.Rows[0]["Branch"].ToString();
            //mr.InstituteName = dt.Rows[0]["InstituteName"].ToString();
            //mr.Session = dt.Rows[0]["Session"].ToString();
            //mr.YearofAdmission = dt.Rows[0]["YearofAdmission"].ToString();
            //mr.Status = dt.Rows[0]["Status"].ToString();
            //return (new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(mr));

            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetVerifyMigrationSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@RollNo", regno);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }

                    return serializer.Serialize(rows);
                }

            }
        }

        class MigrationResultVerify
        {
            public string RegistrationNumber;
            public string StudentName;
            public string Branch;
            public string InstituteName;
            public string Session;
            public string YearofAdmission;
            public string Status;
        }

        [WebMethod]
        public static string GetBranchMaster(string prefix)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<Migration3.IService1Channel> factory = new ChannelFactory<Migration3.IService1Channel>(new BasicHttpBinding()))
            {
                Migration3.IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetBranchMaster();

                }
            }
            return text;
        }

        [WebMethod]
        public static string GetSubject(string prefix, string SemesterCode, string BranchCode)
        {
            string URL = "";

            URL = m_ServiceURL;

            HttpContext.Current.Session["DatabaseName"] = "MasterDB";

            string text;
            using (ChannelFactory<Migration3.IService1Channel> factory = new ChannelFactory<Migration3.IService1Channel>(new BasicHttpBinding()))
            {
                Migration3.IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    List<Tuple<string, string>> nvc = GetSessionValues();

                    MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.GetSubject(SemesterCode, BranchCode);
                }
            }
            return text;
        }

        [WebMethod]
        public static string GetRollNoDetails(string AppIDRollNo)
        {
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetMigration3DataSP", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ServiceID", 388);
                    cmd.Parameters.AddWithValue("@AppID", AppIDRollNo);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ds);
                    dt = ds.Tables[0];
                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }

                    dt = ds.Tables[4];
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }

                    return serializer.Serialize(rows);
                }
            }
        }
    }
}