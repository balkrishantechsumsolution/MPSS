using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Web.Script.Serialization;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Kiosk.CBCS
{
    public partial class DEOAdmissionForm : CommonBasePage
    {
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        string LoginID = "";
        public interface IService1Channel : IAddressService, IClientChannel
        { }
        protected void Page_Load(object sender, EventArgs e)
        {
            string culture = "en-GB";
            Session["CurrentCultureLabels"] = culture;
            HDFUserID.Value = Session["LoginID"].ToString();
            GetCollegeDetail(HDFUserID.Value);
            CheckCollegeAffiliation(HDFCCode.Value);
        }

        private void CheckCollegeAffiliation(string value)
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable dt = new System.Data.DataTable();

            dt = m_AdmissionFormBLL.CollegeAffiliation(value);

            if (dt.Rows.Count > 0)
            {
                hdfAffiliationNo.Value = "1";
                
            }
            else {
                hdfAffiliationNo.Value = "0";
            }
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
        public static string InsertAdmissionFormByDEO(string prefix, string Data)
        {
            string text;

            string noNewLines = Data.Replace("\n", "");
            CBCSAdmissionForm_DT viewModel = ToObjectFromJSON<CBCSAdmissionForm_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            if (HttpContext.Current.Session["CitizenID"] != null)
            {
                viewModel.ProfileID = HttpContext.Current.Session["CitizenID"].ToString();
            }


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

                    text = proxy.InsertAdmissionFormDataByDEO(viewModel);
                }
            }

            return text;


        }


        public void GetCollegeDetail(string UserID)
        {
            try
            {
                CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
                System.Data.DataTable dt = new System.Data.DataTable();
                dt = m_AdmissionFormBLL.Get_CollegeDetail(UserID);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (Convert.ToString(dt.Rows[0]["IsAllowed"]) == "False" && Convert.ToString(dt.Rows[0]["DeptType"]) == "Admin")
                    {
                        string m_Message = "Currently this service is not available !";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
                        //Response.Redirect("/WebApp/G2G/SU/SUDashboard.aspx", true);

                    }
                    else
                    {
                        HDFCCode.Value = dt.Rows[0]["College_Code"].ToString();
                        HDFCName.Value = dt.Rows[0]["CollegeName"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {

            }

        }
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string BindCollegeList(string UserID)
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable dt = new System.Data.DataTable();
            dt = m_AdmissionFormBLL.Get_CollegeDetail(UserID);
            List<object> CollegeList = new List<object>();
            using (System.Data.DataTableReader sdr = dt.CreateDataReader())
            {
                while (sdr.Read())
                {
                    CollegeList.Add(new
                    {
                        CollegeName = sdr["CollegeName"],
                        CollegeCode = sdr["College_Code"],
                        IsAllowed = sdr["IsAllowed"],
                        DeptType = sdr["DeptType"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(CollegeList));
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string ValidateMobile(string MobileNo)
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable dt = new System.Data.DataTable();
            dt = m_AdmissionFormBLL.MobileValidation(MobileNo);
            List<object> Message = new List<object>();
            using (System.Data.DataTableReader sdr = dt.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Message.Add(new
                    {
                        Status = sdr["Status"],
                        Messeage = sdr["Message"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Message));
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string CollegeAffiliation_old()
        {
            CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
            System.Data.DataTable dt = new System.Data.DataTable();
            
            dt = m_AdmissionFormBLL.CollegeAffiliation(HttpContext.Current.Session["LoginID"].ToString());
            List<object> Message = new List<object>();
            using (System.Data.DataTableReader sdr = dt.CreateDataReader())
            {
                while (sdr.Read())
                {
                    Message.Add(new
                    {
                        Status = sdr["AffiliationNo"]

                    });
                }
            }
            return (new JavaScriptSerializer().Serialize(Message));
        }
    }
}