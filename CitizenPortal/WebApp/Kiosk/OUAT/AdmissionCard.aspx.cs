using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ServiceModel;
using System.Web.Services;
using CitizenPortalLib.ServiceInterface;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class AdmissionCard :  BasePage//System.Web.UI.Page
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            m_ServiceID = "405";
            //Session["LoginID"] = "OUATAdmin";
            //Session["Department"] = "0";
            if (!IsPostBack)
            {
                divSubmit.Visible = false;
                divStudentDetails.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string LoginID = Session["LoginID"].ToString();
            int Department = Convert.ToInt32(Session["Department"].ToString());
            string AppID = "";
            string RollNo = txtRoll.Text;

            lblCollegeName.Text = "";
            lblCollege.Text = "";

            lblCourse.Text = "";
            lblCourseName.Text = "";
            lblAdmission.Text = "";
            lblAdmissionNo.Text = "";
            lblDate.Text = "";
            lblMsg.Text = "";

            DataTable dt = null;
            //dt = m_G2GDashboardBLL.GetOUATG2GData(LoginID, Department, "405", "", "2017-04-01", "2017-07-01", "", "", RollNo);

            dt = m_OUATBLL.GetOUATUGCounselData(RollNo);

            AppID = dt.Rows[0]["FormAAppID"].ToString();
            m_ServiceID = dt.Rows[0]["ServiceID"].ToString();

            if (dt.Rows.Count != 0)
            {
                GetStudentDetails(AppID, m_ServiceID);
                GetOUATUGAdmissionData(txtRoll.Text);
                divStudentDetails.Visible = true;
            }
            else
            {
                divStudentDetails.Visible = false;
                string m_Message = "Sorry! No Record found " + RollNo + ". Please check the entered ROLL NUMBER";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            }
        }

        private void GetStudentDetails(string AppID, string ServiceID)
        {
            DataSet dt = null;
            //OUATGetAgroAdmit
            if (ServiceID == "405")
            {
                dt = m_OUATBLL.OUATGetEAdmit("405", AppID);
            }
            else
            { dt = m_OUATBLL.OUATGetAgroAdmit("409", AppID); }
            DataTable dtApp = dt.Tables[0];
            //DataTable dtTransDetail = dt.Tables[1];
            if (dtApp.Rows.Count != 0)
            {
                divSubmit.Visible = true;
                divStudentDetails.Visible = true;
                divDoc.Visible = false;

                lblAppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblAadhaar.Text = dtApp.Rows[0]["aadhaarNumber"].ToString();
                lblAppname.Text = dtApp.Rows[0]["FullName"].ToString();
                lblFather.Text = dtApp.Rows[0]["FatherName"].ToString();
                lblMobile.Text = dtApp.Rows[0]["Mobile"].ToString();
                lblEmail.Text = dtApp.Rows[0]["EmailId"].ToString();
                lblDOB.Text = dtApp.Rows[0]["DOB"].ToString();
                lblAge.Text = dtApp.Rows[0]["Age"].ToString() + " years";
                lblCategory.Text =  dtApp.Rows[0]["Category"].ToString();
                ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNumber"].ToString();
                //lblDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AllocationTime"]).ToString("dd/MM/yyyy");
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblMother.Text = dtApp.Rows[0]["mothername"].ToString();
                lblAddress.Text = dtApp.Rows[0]["CurrentFullAddress"].ToString();
                lblDistrict.Text = dtApp.Rows[0]["CurrentDistrict"].ToString();
                lblSubdistrict.Text = dtApp.Rows[0]["CurrentBlock"].ToString();
                lblVillage.Text = dtApp.Rows[0]["CurrentPanchayat"].ToString();
                lblPin.Text = dtApp.Rows[0]["CurrentPinCode"].ToString();

                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, AppID);
                }
                catch { }
            }
            else
            {
                divSubmit.Visible = false;
                divStudentDetails.Visible = false;
                divDoc.Visible = false;

                string m_Message = "Sorry! No record found " + m_AppID + " please check the Roll Number.";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblCollegeName.Text = ddlCollege.SelectedItem.Text;
            lblCollege.Text = ddlCollege.SelectedItem.Text;

            lblCourse.Text = txtCourse.Text;
            lblCourseName.Text = txtCourse.Text;
            lblAdmission.Text = txtAddNo.Text;
            lblAdmissionNo.Text = txtAddNo.Text;
            lblDate.Text = System.DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            string[] AFields =
            {
                
                 "RollNo"
                ,"FormAAppID"
                ,"AadhaarNumber"
                ,"AdmissionNo"
                ,"CollegeName"
                ,"CourseName"
                ,"CreatedBy"
                ,"CollegeLeavingCertificate"
                ,"ConductCertificate"
                ,"MigrationCertificate"
                ,"MedicalFitnessCertificate"

            };

            string t_CLC = "0", t_CC = "0", t_MC = "0", t_MFC = "0";

            if (chkCLC.Checked)
                t_CLC = "1";
            else
                t_CLC = "0";
            if (chkCC.Checked)
                t_CC = "1";
            else
                t_CC = "0";
            if (chkMC.Checked)
                t_MC = "1";
            else
                t_MC = "0";
            if (chkMFC.Checked)
                t_MFC = "1";
            else
                t_MFC = "0";

            OUATAdmissionData_DT t_OUATAdmissionData_DT = new OUATAdmissionData_DT();

            t_OUATAdmissionData_DT.RollNo = lblRollNo.Text;
            t_OUATAdmissionData_DT.FormAAppID = lblAppID.Text;
            t_OUATAdmissionData_DT.AadhaarNumber = lblAadhaar.Text;
            t_OUATAdmissionData_DT.AdmissionNo = lblAdmission.Text;
            t_OUATAdmissionData_DT.CollegeName = ddlCollege.SelectedItem.Text;
            t_OUATAdmissionData_DT.CourseName = txtCourse.Text;
            t_OUATAdmissionData_DT.CreatedBy = Session["LoginID"].ToString();
            t_OUATAdmissionData_DT.CollegeLeavingCertificate = t_CLC;
            t_OUATAdmissionData_DT.ConductCertificate = t_CC;
            t_OUATAdmissionData_DT.MigrationCertificate = t_MC;
            t_OUATAdmissionData_DT.MedicalFitnessCertificate = t_MFC;


            System.Data.DataTable result = null;
            string UID = "";

            result = m_OUATBLL.InsertOUATAdmissionData(t_OUATAdmissionData_DT, AFields);

            if (result != null && result.Rows.Count > 0)
            {
                if (result.Rows[0]["Result"].ToString() == "1")
                {
                    string m_Message = "Record Saved Sucessfully!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);

                    GetOUATUGAdmissionData(txtRoll.Text);
                }
            }
        }

        private void GetOUATUGAdmissionData(string RollNo)
        {
            DataTable dtApp = m_OUATBLL.GetOUATUGAdmissionData(RollNo);

            if (dtApp.Rows.Count != 0)
            {
                divSubmit.Visible = false;
                divStudentDetails.Visible = true;
                divDoc.Visible = true;

                lblAdmission.Text = dtApp.Rows[0]["AdmissionNo"].ToString();
                lblAdmissionNo.Text = dtApp.Rows[0]["AdmissionNo"].ToString();
                lblCollege.Text = dtApp.Rows[0]["CollegeName"].ToString();
                lblCollegeName.Text = dtApp.Rows[0]["CollegeName"].ToString();
                lblCourse.Text = dtApp.Rows[0]["CourseName"].ToString();
                lblCourseName.Text = dtApp.Rows[0]["CourseName"].ToString();
                //lblDate.Text = System.DateTime.Now.ToString("DD-MM-YYYY HH:MM:SS");
                lblDate.Text = dtApp.Rows[0]["CreatedOn"].ToString();

                lblCLCYN.Text = dtApp.Rows[0]["CollegeLeavingCertificateText"].ToString();
                lblCCYN.Text = dtApp.Rows[0]["ConductCertificateText"].ToString();
                lblMCYN.Text = dtApp.Rows[0]["MigrationCertificateText"].ToString();
                lblMFCYN.Text = dtApp.Rows[0]["MedicalFitnessCertificateText"].ToString();



                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }

                lblMsg.Text = "College and Course assiged to ROLL NO.: " + txtRoll.Text +" with Admission No.:" + lblAdmissionNo.Text;
            }
        }

        protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCourse.Text = ddlCollege.SelectedValue.Replace("2", "").Replace("3","");
        }
        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        public interface IService1Channel : IAddressService, IClientChannel
        { }

        

        [WebMethod]
        public static string PrintAdmitLog(string prefix, string RollNo, string AppID)
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
                    //List<Tuple<string, string>> nvc = GetSessionValues();

                    //MessageHeader<List<Tuple<string, string>>> mhg = new MessageHeader<List<Tuple<string, string>>>(nvc);
                    //System.ServiceModel.Channels.MessageHeader untyped = mhg.GetUntypedHeader("Session", "SessionTuple");
                    //OperationContext.Current.OutgoingMessageHeaders.Add(untyped);

                    text = proxy.PrintAdmitLog(RollNo, AppID);

                }
            }

            return text;

        }
    }
}