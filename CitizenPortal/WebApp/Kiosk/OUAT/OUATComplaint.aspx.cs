using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortal.DocumentVerification;
using System.Data;
using System.Data.SqlClient;
using CitizenPortalLib.BLL;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class OUATComplaint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["UID"] == null) return;
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
        public static string getAppDetail(string m_AppID, string m_ServiceID)
        {
            OUATBLL m_OUATBLL = new OUATBLL();
            DataSet dt = new DataSet();
            if (m_AppID == "403")
            {
                dt = m_OUATBLL.GetOUATAppDetails(m_AppID, m_ServiceID);
            }

            if (m_AppID == "409")
            {
                dt = m_OUATBLL.GetOUATAgroAppDetails(m_AppID, m_ServiceID);
            }
            
            DataTable dtApp = dt.Tables[0];
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dtApp.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dtApp.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return serializer.Serialize(rows);
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string AppIDValidation(string m_AppID, string m_ServiceID)
        {
            DataTable DT = new DataTable();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ValidateAppIDSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ServiceID", m_AppID);
                cmd.Parameters.AddWithValue("@AppID", m_ServiceID);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(DT);
                string a = DT.Rows[0][0].ToString();
                return a.ToString();
            }

            finally
            {
                con.Close();
            }
        }


        public interface IService1Channel : IAddressService, IClientChannel
        { }

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
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertComplaint(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            OUATComplaint_DT viewModel = ToObjectFromJSON<OUATComplaint_DT>(noNewLines);
            string URL = "";
            URL = m_ServiceURL;
            string text;
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    //List<Tuple<string, string>> nvc = GetSessionValues();
                    //MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    //System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    //OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.InsertComplaint(viewModel);
                }
            }
            return text;
        }

        protected void btnFetch_Click(object sender, EventArgs e)
        {
            //if (Session["LoginCaptchaTest"] != null)
            //{
            //    if (txtcaptcha.Text != Session["LoginCaptchaTest"].ToString())
            //    {
            //        txtcaptcha.BorderColor = System.Drawing.Color.Red;
            //        Response.Write("<script LANGUAGE='JavaScript' >alert('Please Re-Enter Captcha!!!')</script>");
            //        txtcaptcha.Text = "";
            //        return;
            //    }
            //}
        }
    }
}