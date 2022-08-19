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
    public partial class PGAdmissionCard : BasePage//System.Web.UI.Page 
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //m_ServiceID = "405";
            //Session["LoginID"] = "OUATAdmin";
            //Session["Department"] = "0";
            if (!IsPostBack)
            {
                divSubmit.Visible = false;
                divStudentDetails.Visible = false;
                //GetOUATPGCollege(ddlProgram.SelectedValue);
                //Get
            }
        }

        private void GetOUATPGCollege(string ProgrameValue)
        {
            DataTable dt_College = null;
            dt_College = m_OUATBLL.GetOUATCollege(ProgrameValue);
            ddlCollege.Items.Clear();
            ddlCollege.DataSource = dt_College;
            ddlCollege.DataTextField = "PGCollegeName";
            ddlCollege.DataValueField = "PGCollegeID";
            ddlCollege.DataBind();
            ddlCollege.Items.Insert(0, new ListItem("--Select College--", "0"));
        }

        private void GetOUATDegree(string CollegeID)
        {
            DataTable dt_Degree = null;
            dt_Degree = m_OUATBLL.GetOUATDegree(CollegeID);
            ddlDegree.Items.Clear();
            ddlDegree.DataSource = dt_Degree;
            ddlDegree.DataTextField = "PGDegreeName";
            ddlDegree.DataValueField = "PGDegreeId";
            ddlDegree.DataBind();
            ddlDegree.Items.Insert(0, new ListItem("--Select Degree--", "0"));
        }

        private void GetOUATSubject(string DegreeID)
        {
            DataTable dt_Subject = null;
            dt_Subject = m_OUATBLL.GetOUATSubject(DegreeID);
            ddlSubject.Items.Clear();
            ddlSubject.DataSource = dt_Subject;
            ddlSubject.DataTextField = "PGDegreeSubject";
            ddlSubject.DataValueField = "RoWID";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, new ListItem("--Select Subject--", "0"));
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
            txtAddNo.Text = "";
            ddlCollege.SelectedIndex = 0;
            ddlDegree.Items.Clear();
            ddlSubject.Items.Clear();

            chkCLC.Checked = false;
            chkCC.Checked = false;
            chkMC.Checked = false;
            chkMFC.Checked = false;

            if (txtRoll.Text != "")
            {
                GetStudentDetails(RollNo);
                GetOUATPGAdmissionData(txtRoll.Text);
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

        private void GetStudentDetails(string RollNo)
        {
            DataTable dtApp = null;

            dtApp = m_OUATBLL.GetOUATPGPHDStudentDetails(RollNo);

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
                lblCategory.Text = dtApp.Rows[0]["Category"].ToString();
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
                lblSubject.Text = dtApp.Rows[0]["subjectname"].ToString();
                lblStream.Text = dtApp.Rows[0]["stream"].ToString();
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

                string m_Message = "Sorry! No record found " + m_AppID + " please check the Roll Number.";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //lblProgram ddlProgram.SelectedItem.Text;
            if (txtAddNo.Text == "")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlProgram.SelectedValue == "0")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlCollege.SelectedValue == "0" || ddlCollege.SelectedValue == "")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlDegree.SelectedValue == "0" || ddlDegree.SelectedValue == "")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (ddlSubject.SelectedValue == "0" || ddlSubject.SelectedValue == "")
            {
                string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            //if (txtAddNo.Text !="" || ddlProgram.SelectedValue !="0" || ddlCollege.SelectedValue != "0" || ddlDegree.SelectedValue != "0" || ddlSubject.SelectedValue != "0")
            {

                lblCollegeName.Text = ddlCollege.SelectedItem.Text;
                lblCollege.Text = ddlCollege.SelectedItem.Text;

                lblCourse.Text = ddlDegree.SelectedItem.Text;
                lblCourseName.Text = ddlDegree.SelectedItem.Text;

                lblProgramme.Text = ddlProgram.SelectedItem.Text;
                lblSubjectName.Text = ddlSubject.SelectedItem.Text;

                lblAdmission.Text = txtAddNo.Text;
                lblAdmissionNo.Text = txtAddNo.Text;
                lblDate.Text = System.DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
                string[] AFields =
                {

                 "RollNo"
                ,"AppID"
                ,"AadhaarNumber"
                ,"AdmissionNo"
                ,"CollegeName"
                ,"CourseName"
                ,"CreatedBy"
                ,"CollegeLeavingCertificate"
                ,"ConductCertificate"
                ,"MigrationCertificate"
                ,"MedicalFitnessCertificate"
                ,"Subject"
                ,"Programme"

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

                OUATPGAdmissionData_DT t_OUATPGAdmissionData_DT = new OUATPGAdmissionData_DT();

                t_OUATPGAdmissionData_DT.RollNo = lblRollNo.Text;
                t_OUATPGAdmissionData_DT.AppID = lblAppID.Text;
                t_OUATPGAdmissionData_DT.AadhaarNumber = lblAadhaar.Text;
                t_OUATPGAdmissionData_DT.AdmissionNo = lblAdmission.Text;
                t_OUATPGAdmissionData_DT.CreatedBy = Session["LoginID"].ToString();
                t_OUATPGAdmissionData_DT.CollegeLeavingCertificate = t_CLC;
                t_OUATPGAdmissionData_DT.ConductCertificate = t_CC;
                t_OUATPGAdmissionData_DT.MigrationCertificate = t_MC;
                t_OUATPGAdmissionData_DT.MedicalFitnessCertificate = t_MFC;
                t_OUATPGAdmissionData_DT.Programme = lblProgramme.Text;
                t_OUATPGAdmissionData_DT.Subject = lblSubjectName.Text;
                t_OUATPGAdmissionData_DT.CollegeName = lblCollege.Text;
                t_OUATPGAdmissionData_DT.CourseName = lblCourse.Text;

                System.Data.DataTable result = null;
                string UID = "";

                result = m_OUATBLL.InsertOUATPGAdmissionData(t_OUATPGAdmissionData_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string m_Message = "Record Saved Sucessfully!";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);

                        GetOUATPGAdmissionData(txtRoll.Text);
                    }
                }
            }
            //else {

            //    string m_Message = @"Please select PROGRAMME / COLLEGE / DEGREE / SUBJECT";
            //    lblMsg.Text = m_Message;
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            //}
        }
    

        private void GetOUATPGAdmissionData(string RollNo)
        {
            trRank.Visible = false;
            lblAdmission.Text = "";
            lblAdmissionNo.Text = "";
            lblCollege.Text = "";
            lblCollegeName.Text = "";
            lblCourse.Text = "";
            lblCourseName.Text = "";
            //lblDate.Text = System.DateTime.Now.ToString("DD-MM-YYYY HH:MM:SS");
            lblDate.Text = "";
            lblSubjectName.Text = "";
            lblProgramme.Text = "";

            lblCLCYN.Text = "";
            lblCCYN.Text = "";
            lblMCYN.Text = "";
            lblMFCYN.Text = "";

            DataTable dtApp = m_OUATBLL.GetOUATPGAdmissionData(RollNo);

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
                lblSubjectName.Text = dtApp.Rows[0]["Subject"].ToString();
                lblProgramme.Text = dtApp.Rows[0]["Programme"].ToString();

                lblCLCYN.Text = dtApp.Rows[0]["CollegeLeavingCertificateText"].ToString();
                lblCCYN.Text = dtApp.Rows[0]["ConductCertificateText"].ToString();
                lblMCYN.Text = dtApp.Rows[0]["MigrationCertificateText"].ToString();
                lblMFCYN.Text = dtApp.Rows[0]["MedicalFitnessCertificateText"].ToString();



                try
                {
                    QRCode1.GenerateQRCodeApplication(m_ServiceID, m_AppID);
                }
                catch { }

                lblMsg.Text = "College and Course assiged to ROLL NO.: " + txtRoll.Text.ToUpper() + " with Admission No.:" + lblAdmissionNo.Text.ToUpper();
            }
            
        }


        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblProgramme.Text = ddlProgram.SelectedItem.Text;
            GetOUATPGCollege(ddlProgram.SelectedValue);
        }

        protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCollegeName.Text = ddlCollege.SelectedItem.Text;
            lblCollege.Text = ddlCollege.SelectedItem.Text;
            GetOUATDegree(ddlCollege.SelectedValue);
        }

        protected void ddlDegree_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCourse.Text = ddlDegree.SelectedItem.Text;
            lblCourseName.Text = ddlDegree.SelectedItem.Text;
            GetOUATSubject(ddlDegree.SelectedValue);
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblSubjectName.Text = ddlSubject.SelectedItem.Text;
        }


        static string m_ServiceURL = System.Configuration.ConfigurationManager.AppSettings["AddressService"].ToString();


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
