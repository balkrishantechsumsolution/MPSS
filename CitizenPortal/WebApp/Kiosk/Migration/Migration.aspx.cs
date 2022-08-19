using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Migration
{
    public partial class Migration : System.Web.UI.Page //BasePage
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
            //HFServiceID.Value = "113";
            //ngServiceID.Value = "113";

            if (Request.QueryString["UID"] != null)
            {
                string UID = Request.QueryString["UID"].ToString();
                if (UID == "GUEST")
                {

                    btnCancel.Text = "Home";

                    Session["Id"] = "GuestUser";
                    Session["role"] = "Citizen";
                    string user = Session["Id"].ToString();
                    string role = Session["role"].ToString();
                    string URL = "";

                    Response.Cookies["Id"].Value = user;

                    Session["CurrentCulture"] = "en-GB";
                    Session["SCAID"] = "";
                    Session["SCALoginID"] = "";
                    Session["__SessionHelper__"] = "";
                    Session["KioskID"] = Session["Id"].ToString();
                    Session["LoginID"] = Session["Id"].ToString();
                    Session["FullName"] = "Guest User";
                    Session["PaymentFlag"] = "C";
                    Session["Role"] = role;
                    Session["sRole"] = role;
                    Session["Balance"] = 0;
                    Session["UserType"] = "CITIZEN";
                    Session["HomePage"] = "/GSP/index.aspx";
                    //// Solution for Session Fixation Step 1 
                    string strAuthToken = Guid.NewGuid().ToString();
                    Session["AuthToken"] = strAuthToken;
                    Response.Cookies.Add(new HttpCookie("AuthToken", strAuthToken));
                }
                else
                {
                    BasicDetailsBLL t_BasicDetailsBLL = new BasicDetailsBLL();
                    System.Data.DataSet ds = t_BasicDetailsBLL.GetDeclaration(UID);
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count != 0)
                    {
                        txtCandidate.Value = dt.Rows[0]["FullName"].ToString();
                    }
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            MigrationSUBLL m_MigrationSUBLL = new MigrationSUBLL();

            if (txtRegistration.Value != "" && txtRegistration.Value != "")
            {
                DataSet ds = null;
                var DOBConverted = "";

                if (txtDOB.Value != "")
                {
                    string dateval = txtDOB.Value;
                    var DOBArr = dateval.Split('/');
                    DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

                }

                DataSet dsd = m_MigrationSUBLL.GetStudentDetailBasedOnRollNo(txtRoll.Value, DOBConverted, txtRegistration.Value);
                DataTable dtd = dsd.Tables[0];

                DataSet dsStatus = m_MigrationSUBLL.GetMigrationSUApplication(txtRoll.Value, DOBConverted, txtRegistration.Value);
                DataTable dtstatus = dsStatus.Tables[0];
                if (dtstatus.Rows.Count == 0)
                {
                    divApplication.Attributes.Add("style", "display:none;");
                    divDecease.Attributes.Add("style", "display:block;");

                    if (dtd.Rows.Count > 0)
                    {
                        divApplication.Visible = true;
                        txtRoll.Value= dtd.Rows[0]["RollNo"].ToString();
                        txtRegistration.Value= dtd.Rows[0]["RollNo"].ToString();
                        txtCandidate.Value = dtd.Rows[0]["Name"].ToString();
                        myImg.Attributes.Add("src", dtd.Rows[0]["ApplicantImageStr"].ToString());
                        mySign.Attributes.Add("src", dtd.Rows[0]["ImageSign"].ToString());
                        DateTime dtst = DateTime.ParseExact(dtd.Rows[0]["DOB"].ToString(), "dd-MM-yyyy", CultureInfo.InvariantCulture);
                        string stDate = dtst.ToString("dd/MM/yyyy");
                        txtDOB.Value = stDate;

                        HFb64.Value = dtd.Rows[0]["ApplicantImageStr"].ToString();
                        HFb64Sign.Value = dtd.Rows[0]["ImageSign"].ToString();

                        
                    }

                    }
                else
                {
                    divApplication.Attributes.Add("style", "display:block;");
                    divDecease.Attributes.Add("style", "display:none;");


                    BindGrid(txtRoll.Value, DOBConverted, txtRegistration.Value);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                        "alert('Please enter University Registration No. & Date of Birth as registered with university');", true);
                divApplication.Attributes.Add("style", "display:none;");
                divDecease.Attributes.Add("style", "display:block;");
            }

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
        public static string InsertMigrationSU(string prefix, string Data)
        {
            string noNewLines = Data.Replace("\n", "");
            MigrationSU_DT viewModel = ToObjectFromJSON<MigrationSU_DT>(noNewLines);

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

                    text = proxy.InsertMigrationSU(viewModel);

                }
            }

            return text;

        }

        [WebMethod]
        public static string GetCollegeMaster(string prefix)
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

        [WebMethod]
        public static string GetCourseMasterITI(string prefix)
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

                    text = proxy.GetITICourseMaster();

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
            using (ChannelFactory<IService1Channel> factory = new ChannelFactory<IService1Channel>(new BasicHttpBinding()))
            {
                IService1Channel proxy = factory.CreateChannel(new EndpointAddress(URL));
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
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //[WebMethod]
        //public static string EditStudentDetail(string prefix, string RollNo, string DOB, string RegNo)
        //{

        //    DataSet ds = new DataSet();
        //    DataSet dsStatus = new DataSet();

        //    MigrationSUBLL m_MigrationSUBLL = new MigrationSUBLL();
        //    studentDetails sd = new studentDetails();


        //    if (RollNo != "" && DOB != "")
        //    {
        //        DateTime dtstart = DateTime.ParseExact(DOB, "dd/MM/yyyy", CultureInfo.InvariantCulture);
        //        string startDate = dtstart.ToString("yyyy-MM-dd");

        //        ds = m_MigrationSUBLL.GetStudentDetailBasedOnRollNo(RollNo, startDate, RegNo);
                

        //        DataTable dt = ds.Tables[0];
        //        if (dt.Rows.Count > 0)
        //        {
        //            sd.RollNo = dt.Rows[0]["RollNo"].ToString();
        //            sd.DOB = dt.Rows[0]["DOB"].ToString().Replace('-', '/');
        //            sd.RegNo = dt.Rows[0]["RegNo"].ToString();
        //            sd.ImageSign = dt.Rows[0]["ImageSign"].ToString();
        //            sd.ApplicantImageStr = dt.Rows[0]["ApplicantImageStr"].ToString();
        //            sd.Name = dt.Rows[0]["Name"].ToString();
        //            sd.Gender = dt.Rows[0]["Gender"].ToString();
                   

        //        }
        //    }

        //    return (new JavaScriptSerializer().Serialize(sd));
        //}

        public class studentDetails
        {
            public string RollNo;
            
            public string DOB, RegNo, ImageSign, ApplicantImageStr, Name, Gender;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["UID"] != null)
            {
                string UID = Request.QueryString["UID"].ToString();
                if (UID == "GUEST")
                {
                    Response.Redirect("/Sambalpur/index.aspx");
                }
            }
        }
        public void BindGrid(string RollNo, string DOB, string RegNo)
        {
            
            MigrationSUBLL m_MigrationSUBLL = new MigrationSUBLL();
            DataSet ds = m_MigrationSUBLL.GetMigrationSUApplication(RollNo,DOB,RegNo);
            grdView1.DataSource = ds.Tables[0];

            grdView1.DataBind();

        }
        protected void grdView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                int i = 0;
                HtmlAnchor t_Anchor = null;
                string p_PaymentStatus = e.Row.Cells[5].Text;

                t_Anchor = null;

                //-------------------------------//
                TableCell Cell = GetCellByName(e.Row, "View");
                string t_AckURL = "";

                if (Cell != null && Cell.Text != "" && Cell.Text != "&nbsp;")
                {
                    t_AckURL = Cell.Text.Replace("&nbsp;", "");
                }


                i = 6;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction1_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                t_Anchor.Attributes.Add("onclick","TakeAction('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "','" + p_PaymentStatus + "', '" + t_AckURL + "')");

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                t_Anchor = null;



            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                //e.Row.Cells[8].Attributes.Add("style", "display:none");
                //e.Row.Cells[9].Attributes.Add("style", "display:none");

            }
        }
        DataControlFieldCell GetCellByName(GridViewRow Row, String CellName)
        {
            foreach (DataControlFieldCell Cell in Row.Cells)
            {
                if (Cell.ContainingField.ToString() == CellName)
                    return Cell;
            }
            return null;
        }
    }
}