using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.ServiceModel;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.OUAT
{
    public partial class Diplomadmission : BasePage// System.Web.UI.Page //
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            m_ServiceID = "405";
            Session["LoginID"] = "OUATAdmin";
            Session["Department"] = "0";
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
            string AppID = txtAppID.Text;
            string RollNo = txtAppID.Text;

            lblCollegeName.Text = "";
            lblCollege.Text = "";

            lblCourse.Text = "";
            lblCourseName.Text = "";
            lblAdmission.Text = "";
            lblAdmissionNo.Text = "";
            lblDate.Text = "";
            lblMsg.Text = "";
            txtAddNo.Text = "";
            ddlCollege.SelectedIndex = 0;
            ddlCourse.SelectedIndex = 0;

            chkCLC.Checked = false;
            chkCC.Checked = false;
            chkMC.Checked = false;
            chkMFC.Checked = false;

            if (txtAppID.Text != "")
            {
                GetStudentDetails(AppID);
                GetOUATAgroAdmissionData(txtAppID.Text);
                divStudentDetails.Visible = true;
            }
            else
            {
                divStudentDetails.Visible = false;
                string m_Message = "Enter Roll Number, to fetch record";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            }
        }

        private void GetStudentDetails(string AppID)
        {
            DataSet t_DS = null;

            t_DS = m_OUATBLL.GetOUATAgroStudentDetails(AppID);

            DataTable dtApp = t_DS.Tables[0];
            DataTable dtMarks = t_DS.Tables[1];

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
                lblCategory.Text = dtApp.Rows[0]["Category"].ToString();
                //ProfilePhoto.Src = "data:image/png;base64," + dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfilePhoto.Src = dtApp.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSign.Src = dtApp.Rows[0]["ImageSign"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["AppID"].ToString();
                //lblDate.Text = Convert.ToDateTime(dtApp.Rows[0]["AllocationTime"]).ToString("dd/MM/yyyy");
                lblGender.Text = dtApp.Rows[0]["Gender"].ToString();
                lblMother.Text = dtApp.Rows[0]["mothername"].ToString();
                lblAddress.Text = dtApp.Rows[0]["CurrentFullAddress"].ToString();
                lblDistrict.Text = dtApp.Rows[0]["CurrentDistrict"].ToString();
                lblSubdistrict.Text = dtApp.Rows[0]["CurrentBlock"].ToString();
                lblVillage.Text = dtApp.Rows[0]["CurrentPanchayat"].ToString();
                lblPin.Text = dtApp.Rows[0]["CurrentPinCode"].ToString();
                lblMarks.Text = dtMarks.Rows[0]["TotalWeightage"].ToString();
                lblRank.Text = dtMarks.Rows[0]["Rank"].ToString();
                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, lblAppID.Text);
                }
                catch { }
            }
            else
            {
                divSubmit.Visible = false;
                divStudentDetails.Visible = false;
                divDoc.Visible = false;
                divStudentDetails.Visible = false;
                string m_Message = "Sorry! No record found " + m_AppID + " please check the Roll Number.";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);

                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //lblProgram ddlProgram.SelectedItem.Text;
            if (txtAddNo.Text == "")
            {
                string m_Message = @"Please enter Admission No.";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlCollege.SelectedValue == "0" || ddlCollege.SelectedValue == "")
            {
                string m_Message = @"Please select College";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlCourse.SelectedValue == "0" || ddlCourse.SelectedValue == "")
            {
                string m_Message = @"Please select Course";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }
            

            //if (txtAddNo.Text !="" || ddlProgram.SelectedValue !="0" || ddlCollege.SelectedValue != "0" || ddlDegree.SelectedValue != "0" || ddlSubject.SelectedValue != "0")
            {

                lblCollegeName.Text = ddlCollege.SelectedItem.Text;
                lblCollege.Text = ddlCollege.SelectedItem.Text;

                lblCourse.Text = ddlCourse.SelectedItem.Text;
                lblCourseName.Text = ddlCourse.SelectedItem.Text;
                
                lblAdmission.Text = txtAddNo.Text;
                lblAdmissionNo.Text = txtAddNo.Text;
                lblDate.Text = System.DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
                string[] AFields =
                {

                 "AppID"
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

                OUATAgroAdmissionData_DT t_OUATAgroAdmissionData_DT = new OUATAgroAdmissionData_DT();
                                
                t_OUATAgroAdmissionData_DT.AppID = lblAppID.Text;
                t_OUATAgroAdmissionData_DT.AadhaarNumber = lblAadhaar.Text;
                t_OUATAgroAdmissionData_DT.AdmissionNo = lblAdmission.Text;
                t_OUATAgroAdmissionData_DT.CreatedBy = Session["LoginID"].ToString();
                t_OUATAgroAdmissionData_DT.CollegeLeavingCertificate = t_CLC;
                t_OUATAgroAdmissionData_DT.ConductCertificate = t_CC;
                t_OUATAgroAdmissionData_DT.MigrationCertificate = t_MC;
                t_OUATAgroAdmissionData_DT.MedicalFitnessCertificate = t_MFC;                
                t_OUATAgroAdmissionData_DT.CollegeName = lblCollege.Text;
                t_OUATAgroAdmissionData_DT.CourseName = lblCourse.Text;

                System.Data.DataTable result = null;
                string UID = "";

                result = m_OUATBLL.InsertOUATAgroAdmissionData(t_OUATAgroAdmissionData_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string m_Message = "Record Saved Sucessfully!";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);

                        GetOUATAgroAdmissionData(txtAppID.Text);
                    }
                }
            }
            //else {

            //    string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
            //    lblMsg.Text = m_Message;
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            //}
        }
    
        private void GetOUATAgroAdmissionData(string RollNo)
        {
            //trRank.Visible = false;
            lblAdmission.Text = "";
            lblAdmissionNo.Text = "";
            lblCollege.Text = "";
            lblCollegeName.Text = "";
            lblCourse.Text = "";
            lblCourseName.Text = "";
            //lblDate.Text = System.DateTime.Now.ToString("DD-MM-YYYY HH:MM:SS");
            lblDate.Text = "";
            
            lblCLCYN.Text = "";
            lblCCYN.Text = "";
            lblMCYN.Text = "";
            lblMFCYN.Text = "";

            DataTable dtApp = m_OUATBLL.GetOUATAgroAdmissionData(RollNo);

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

                lblMsg.Text = "College and Course assiged to APP. NO.: " + txtAppID.Text.ToUpper() + " with Admission No.:" + lblAdmissionNo.Text.ToUpper();
            }
            
        }
        
        protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCollege.Text = ddlCollege.SelectedItem.Text;
            lblCollegeName.Text = ddlCollege.SelectedItem.Text;
        }
        
        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCourse.Text = ddlCourse.SelectedItem.Text;
            lblCourseName.Text = ddlCourse.SelectedItem.Text;
        }

        public interface IService1Channel : IAddressService, IClientChannel
        { }


        /*
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
        */
    }
}
