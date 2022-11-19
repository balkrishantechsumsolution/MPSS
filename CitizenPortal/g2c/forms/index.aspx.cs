using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System.ServiceModel;
using System.Web.Script.Services;
using System.Web.Services;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data.Common;

namespace WebApplication1.lokaseba_adhikar.forms
{
    public partial class index : System.Web.UI.Page
    {

        //string Nickname = HttpRequest.Form["VerifyOtp"];
        // string str = verifyOTP.Value;
        GetCountBLL m_GetcountBLL = new GetCountBLL();
        ServicesBLL m_ServicesBLL = new ServicesBLL();
        protected void Page_Load(object sender, EventArgs e)

        {
            
            //Session.Abandon();
            //Session.Clear();
            //Session.RemoveAll();
            Response.Redirect("~/Default.aspx");
            DataTable dt = m_GetcountBLL.Getcount();
            lblDepartment.Text = dt.Rows[0]["Department"].ToString();
            lblServices.Text = dt.Rows[0]["Services"].ToString();
            lblTrasation.Text = dt.Rows[0]["Transation"].ToString();
            lblHabisha.Text = dt.Rows[0]["Habisha"].ToString();

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
        public interface IService1Channel : IAddressService, IClientChannel
        { }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertServiceFeedBack(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            ServiceFeedBack_DT viewModel = ToObjectFromJSON<ServiceFeedBack_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {


                    text = proxy.InsertServiceFeedBack(viewModel);

                }
            }

            return text;

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string InsertRatingFeedBack(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            RatingFeedBack_DT viewModel = ToObjectFromJSON<RatingFeedBack_DT>(noNewLines);

            string URL = "";
            URL = m_ServiceURL;

            string text;

            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
                using (OperationContextScope scope = new OperationContextScope(proxy))
                {
                    //ist<Tuple<string, string>> nvc = GetSessionValues(); //new List<Tuple<string, string>>();

                    //string dbCon = HttpContext.Current.Session["DatabaseName"].ToString();
                    //string culture = HttpContext.Current.Session["CurrentCulture"].ToString();

                    //string ID = "";

                    //ID = HttpContext.Current.Session["KioskID"].ToString();

                    //nvc.Add(new Tuple<string, string>("G2GID", ID));
                    //nvc.Add(new Tuple<string, string>("KioskID", ID));
                    //nvc.Add(new Tuple<string, string>("CurrentCulture", culture));

                    //MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>();
                    //System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    //OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.InsertRatingFeedBack(viewModel);

                }
            }

            return text;

        }

        public class ListItem
        {
            public string Name { get; set; }
            public string Id { get; set; }
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static List<ListItem> ServiceData()
        {
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT * FROM ServiceMasterTb  where  IsActive='1'  ORDER BY SvcName";
                    cmd.Connection = con;
                    List<ListItem> AllState = new List<ListItem>();
                    cmd.CommandType = CommandType.Text;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            AllState.Add(new ListItem
                            {
                                Name = sdr["SvcName"].ToString(),
                                Id = sdr["SvcID"].ToString()
                            });
                        }
                    }
                    con.Close();
                    return AllState;
                }
            }
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]

        public static List<ListItem> DepartmentData(string SelServices)
        {
            List<ListItem> DepartmentName = new List<ListItem>();
            using (SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetFeedBackDepartmentSp", con))
                {
                    if (SelServices != "0")
                    {

                        cmd.Parameters.AddWithValue("@SVCID", SelServices);
                        cmd.Connection = con;
                        DepartmentName = new List<ListItem>();
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            while (sdr.Read())
                            {
                                DepartmentName.Add(new ListItem
                                {
                                    Name = sdr["DepartmentName"].ToString(),
                                    Id = sdr["DepartmentID"].ToString()
                                });
                            }
                        }

                    }
                    else
                    {
                        cmd.CommandText = "Select top 0 DepartmentName from DepartmentMasterTb";
                        cmd.Connection = con;
                        DepartmentName = new List<ListItem>();
                        cmd.CommandType = CommandType.Text;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            while (sdr.Read())
                            {
                                DepartmentName.Add(new ListItem
                                {
                                    Name = sdr["DepartmentName"].ToString(),
                                    Id = sdr["DepartmentID"].ToString()
                                });
                            }
                        }
                    }
                    con.Close();
                    return DepartmentName;
                }
            }
        }

        public static void SendSMS(string MobileNo, string Message)
        {
            CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
            if (MobileNo != null || MobileNo != "")
            {
                test.sendsms(MobileNo, Message);
                ScriptManager.RegisterClientScriptBlock((Page)(HttpContext.Current.Handler), typeof(Page), "alert", "alert('This pops up')", true);
            }
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static void SendOtpbtn(string MobileNo)
        {
            if (MobileNo != "" && MobileNo != null)
            {
                string OTPMsg;
                string SMSId = "";
                string OTPText = "";
                OTPText = GenerateOTP();
                OTPMsg = "Dear Citizen OTP " + OTPText + " For Lokaseba-Odisha  is Valid For 10 Minutes.From Odisha ";
                SendSMS(MobileNo, OTPMsg);
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertFeedbackOTPSP", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@MobileNo", MobileNo);
                cmd.Parameters.AddWithValue("@OTPCode", OTPText);
                SMSId = SMSUnqID();
                cmd.Parameters.AddWithValue("@SMSID", SMSId);
                cmd.Parameters.AddWithValue("@CreatedOn", DateTime.Now);
                cmd.Parameters.AddWithValue("@CreatedBy", MobileNo);

                cmd.ExecuteNonQuery();
                con.Close();
                return;



            }
            //Response.Write("<script LANGUAGE='JavaScript' >alert('Please Input Your Mobile No To Send OTP!!!')</script>");

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string verifyotpbtn(string MobileNo, string OTPText)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString);
            string a = "";
            DataTable dt = new DataTable();

            if (MobileNo != null)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("ValidateOTPFeedbackSP", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MobileNo", MobileNo);
                cmd.Parameters.AddWithValue("@OTPEntered", OTPText);
                //cmd.ExecuteNonQuery();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            
            if (dt.Rows.Count > 0)
            {
                a = dt.Rows[0]["SMSID"].ToString();
                return a.ToString();
            }
            else
            {
                a = "0";
            }
            return a.ToString();
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string getAppData(string AppID, string ServiceID)
        {

            string save = "";
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetAppDataSP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@serviceid", ServiceID);
            cmd.Parameters.AddWithValue("@appid", AppID);
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
           con.Close();
            if (dt.Rows.Count > 0)
            {
                return save = dt.Rows[0]["AppName"].ToString();
            }
            else {
                return save = null;
            }



        }

        public static string GenerateOTP()
        {
            Random random = new Random();
            string OTPText = "";
            int i;
            for (i = 1; i < 7; i++)
            {
                OTPText += random.Next(0, 9).ToString();
            }
            return OTPText;
        }

        public static string SMSUnqID()
        {
            Random random = new Random();
            string m_SMSID = "";
            int i;
            for (i = 1; i < 11; i++)
            {
                m_SMSID += random.Next(0, 9).ToString();
            }

            string t_GenOn = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss");


            List<object> SMSID = new List<object>();

            SMSID.Add(new
            {
                SMSUnqID = m_SMSID,
            });

            return m_SMSID;
        }

     


    }
}