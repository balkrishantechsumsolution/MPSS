using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Data;
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

namespace CitizenPortal.WebApp.Kiosk.BackExam
{
    public partial class StudentForm : AdminBasePage
    {
        BackExamBLL m_BackExamBLL = new BackExamBLL();
        DataSet ds = new DataSet();
        private static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();
        static string m_BranchName = "", m_RollNo = "", m_ServiceID = "", m_StudentName = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_BranchName = Request.QueryString["BID"].ToString();
            m_RollNo = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
            //m_StudentName = Request.QueryString["StudentName"].ToString();
            //DateTime LastDate = Convert.ToDateTime("16/03/2018");
            //string diff2 = (DateTime.Today - LastDate).TotalDays.ToString(); decimal diff = Convert.ToDecimal(diff2);

            var m_LateFee = 0;
            
            //if (diff <= 7 && diff >= 0)
            //{
            //    m_LateFee = 2;
            //}
            //else if(diff > 7 && diff <= 30)
            //{
            //    m_LateFee = 3;
            //}
            //else if(diff > 30)
            //{
            //    m_LateFee = 4;
            //}
            //else
            //{

            //}
            if (!IsPostBack)
            {
                ds = m_BackExamBLL.Get_BackStudentDtls(m_RollNo, m_BranchName);
                DataTable dt = ds.Tables[0];
                DataTable dtrow = ds.Tables[1];
                ViewState["paper"] = ds.Tables[3];
                DataTable dtfee = ds.Tables[2];
                LblRollNo.Text = m_RollNo;

                if (dt.Rows.Count != 0)
                {
                    TxtFirstName.Text = dt.Rows[0]["FUNAME"].ToString();
                    LblRollNo.Text = dt.Rows[0]["RollNo"].ToString();
                    if (dt.Rows[0]["REGDNO"].ToString() == null || dt.Rows[0]["REGDNO"].ToString() != "")
                    {
                        txtRedgNo.Text = dt.Rows[0]["REGDNO"].ToString();
                        txtRedgNo.ReadOnly = true;
                        txtRedgNo.Enabled = false;
                    }
                    else
                        txtRedgNo.Text = "";

                    if (dt.Rows[0]["SEX"].ToString() == null || dt.Rows[0]["SEX"].ToString() == "")
                    {
                        ddlGender.SelectedValue = "M";
                    }
                    else
                    {
                        ddlGender.SelectedValue = "F";
                    }
                    ddlCategory.SelectedIndex = ddlCategory.Items.IndexOf(ddlCategory.Items.FindByValue(dt.Rows[0]["CAT"].ToString()));  
                    HFCollegecode.Value = dt.Rows[0]["COLLEGECODE"].ToString();
                    TxtCollegeName.Text = dt.Rows[0]["COLLEGE"].ToString();
                    ddlCategory.Enabled = false;
                    TxtFirstName.Enabled = false;
                    ddlGender.Enabled = false;
                    TxtCollegeName.Enabled = false;
                    divAppID.Visible = false;
                    if (dt.Rows[0]["AppID"].ToString()!="")
                    {
                        divAppID.Visible = true;
                        txtAppID.Text = dt.Rows[0]["AppID"].ToString();
                        UID.Text = dt.Rows[0]["aadhaarNumber"].ToString();
                        UID.Enabled = false;
                        TxtFatherName.Text= dt.Rows[0]["FatherName"].ToString();
                        TxtFatherName.Enabled = false;
                        TxtMotherName.Text = dt.Rows[0]["MotherName"].ToString();
                        TxtMotherName.Enabled = false;
                        txtMobileNo.Text = dt.Rows[0]["MobileNo"].ToString();
                        txtMobileNo.Enabled = false;
                        txtEmailID.Text = dt.Rows[0]["EmailID"].ToString();
                        txtEmailID.Enabled = false;
                        TxtDOB.Text = dt.Rows[0]["DOB"].ToString();
                        TxtDOB.Enabled = false;
                        ddlreligion.SelectedIndex = ddlreligion.Items.IndexOf(ddlreligion.Items.FindByValue(dt.Rows[0]["religion"].ToString()));
                        ddlreligion.Enabled = false;
                        ddlTongue.SelectedIndex = ddlTongue.Items.IndexOf(ddlTongue.Items.FindByValue(dt.Rows[0]["Tongue"].ToString()));
                        ddlTongue.Enabled = false;
                        HFb64.Value= dt.Rows[0]["ApplicantImageStr"].ToString();
                        HFb64Sign.Value = dt.Rows[0]["ImageSign"].ToString();

                        if (dt.Rows[0]["PayFlag"].ToString() != null)
                        {
                            
                            if (dt.Rows[0]["PayFlag"].ToString() == "N")
                            {
                                btnSubmit.Visible = false;
                                btnPayment.Visible = true;
                                divPay.Visible = true;
                                lblStatus.Text = "Examination Form has been filled. Please make payment.";
                                string t_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=1451&AppID=" + dt.Rows[0]["AppID"].ToString();
                                //Response.Redirect(t_URL);
                            }
                            else
                            {
                                divPay.Visible = false;
                                lblStatus.Text = "Examination Form has been filled and PAYMENT processed in the System";
                            }
                        }

                    }

                    
                    
                }
                if (dtrow.Rows.Count != 0)
                {
                    GV.DataSource = dtrow;
                    GV.DataBind();
                }
                if (dtfee.Rows.Count != 0)
                {
                    GV1.DataSource = dtfee;
                    GV1.DataBind();
                    decimal totalAmt = dtfee.AsEnumerable().Sum(row => row.Field<decimal>("AMOUNT"));
                    GV1.FooterRow.Cells[0].Text = "Total Amount";
                    GV1.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Left;
                    GV1.FooterRow.Cells[1].Text = totalAmt.ToString("N2");

                }
                else
                {
                    string m_Message = "No record found.";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
                }
            }
        }
        public interface IService1Channel : IAddressService, IClientChannel
        { }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            string t_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=1451&AppID=" + txtAppID.Text;
            Response.Redirect(t_URL);
        }

        public static T ToObjectFromJSON<T>(string jsonString)
        {
            var serializer = new System.Runtime.Serialization.Json.DataContractJsonSerializer(typeof(T));
            var memoryStream = new System.IO.MemoryStream(System.Text.Encoding.Unicode.GetBytes(jsonString));
            var newObject = (T)serializer.ReadObject(memoryStream);
            memoryStream.Close();
            return newObject;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {

                BackExamForm_DT vm = new BackExamForm_DT();
                vm.AadhaarNumber = UID.Text;
                vm.Image = HFb64.Value;
                vm.ImageSign = HFb64Sign.Value;
                vm.AppName = TxtFirstName.Text;
                vm.Branch = m_BranchName;
                vm.Category = ddlCategory.SelectedValue;
                vm.DOB = Convert.ToDateTime(TxtDOB.Text).ToString("yyyy-MM-dd");
                vm.EmailId = txtEmailID.Text;
                vm.FatherName = TxtFatherName.Text;
                vm.Gender = ddlGender.SelectedValue;
                vm.MobileNo = txtMobileNo.Text;
                vm.MotherName = TxtMotherName.Text;
                vm.nationality = ddlnationality.SelectedValue;
                vm.religion = ddlreligion.SelectedValue;
                vm.RollNo = m_RollNo;
                vm.RedgNo = txtRedgNo.Text.Trim();
                vm.Tongue = ddlTongue.SelectedValue;
                vm.TotalAmount = GV1.FooterRow.Cells[1].Text.Replace(",", "");
                vm.CollegeCode = HFCollegecode.Value;
                vm.userType = HttpContext.Current.Session["UserType"].ToString();
                vm.ServiceID = m_ServiceID;
                if (m_ServiceID == "1451")
                {
                    //vm.Exam_Freq = "2nd";
                    //vm.Exam_Type = "Back";
                    vm.Exam_Freq = "5SEM";
                    vm.Exam_Type = "Regular";
                }
                else
                {
                    vm.Exam_Type = "Regular";
                }
                DataTable dt = (DataTable)ViewState["paper"];
                bool a = false;
                bool b = false;

                if (dt.Rows.Count > 7) {
                    a = true;
                    b = true;
                }

                if (dt.Rows.Count > 6)
                {
                    b = true;
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert(" + dt.Rows.Count + ");", true);

                for (int i = 0; i <= dt.Rows.Count; i++)
                {
                    if (i == 0)
                    {
                        vm.Paper1 = dt.Rows[i]["PaperCode"].ToString();
                        vm.UPaper1 = dt.Rows[i]["UCode"].ToString();
                        vm.SubCode1 = dt.Rows[i]["SubjectCode"].ToString();
                    }
                    if (i == 1)
                    {
                        vm.Paper2 = dt.Rows[i]["PaperCode"].ToString();
                        vm.UPaper2 = dt.Rows[i]["UCode"].ToString();
                        vm.SubCode2 = dt.Rows[i]["SubjectCode"].ToString();
                    }
                    if (i == 2)
                    {
                        vm.Paper3 = dt.Rows[i]["PaperCode"].ToString();
                        vm.UPaper3 = dt.Rows[i]["UCode"].ToString();
                        vm.SubCode3 = dt.Rows[i]["SubjectCode"].ToString();
                    }
                    if (i == 3)
                    {
                        vm.Paper4 = dt.Rows[i]["PaperCode"].ToString();
                        vm.UPaper4 = dt.Rows[i]["UCode"].ToString();
                        vm.SubCode4 = dt.Rows[i]["SubjectCode"].ToString();
                    }
                    if (i == 4)
                    {
                        vm.Paper5 = dt.Rows[i]["PaperCode"].ToString();
                        vm.UPaper5 = dt.Rows[i]["UCode"].ToString();
                        vm.SubCode5 = dt.Rows[i]["SubjectCode"].ToString();
                    }
                    if (b == true)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('In i 5 block');", true);
                        
                        if (i == 5)
                        {
                            vm.Paper6 = dt.Rows[i]["PaperCode"].ToString();
                            vm.UPaper6 = dt.Rows[i]["UCode"].ToString();
                            vm.SubCode6 = dt.Rows[i]["SubjectCode"].ToString();
                        }
                    }
                    if (b == true)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('In i 6 block');", true);

                        if (i == 6)
                        {
                            vm.Paper7 = dt.Rows[i]["PaperCode"].ToString();
                            vm.UPaper7 = dt.Rows[i]["UCode"].ToString();
                            vm.SubCode7 = dt.Rows[i]["SubjectCode"].ToString();
                        }
                    }
                    if (a == true)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('In i 7 block');", true);

                        if (i == 7)
                        {
                            vm.Paper8 = dt.Rows[i]["PaperCode"].ToString();
                            vm.UPaper8 = dt.Rows[i]["UCode"].ToString();
                            vm.SubCode8 = dt.Rows[i]["SubjectCode"].ToString();
                        }
                    }
                    //if (a == true)
                    //{
                    //    if (i == 8)
                    //    {
                    //        vm.Paper9 = dt.Rows[i]["PaperCode"].ToString();
                    //        vm.UPaper9 = dt.Rows[i]["UCode"].ToString();
                    //        vm.SubCode9 = dt.Rows[i]["SubjectCode"].ToString();
                    //    }
                    //}
                }

                string URL = "";
                URL = m_ServiceURL;

                if (HttpContext.Current.Session["CitizenID"] != null)
                {
                    vm.ProfileID = HttpContext.Current.Session["CitizenID"].ToString();
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
                        text = proxy.InsertBackExamFormDataByDEO(vm);
                        CitizenPortal.Services.AddressService.ServiceResult App = ToObjectFromJSON<CitizenPortal.Services.AddressService.ServiceResult>(text);
                        string t_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=1451&AppID=" + App.AppID;
                        if (App.AppID != null)
                        {
                            Response.Redirect(t_URL);
                            //string m_Message =  "Data of Roll NO. "+ App.RollNo + " saved sucessfuly.";
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.opener.document.forms[0].submit();window.close();", true);

                        }
                        else
                        {
                            string m_Message = "Data Not Saved!!";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                //btnSubmit.Visible = false;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
                return;
            }

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