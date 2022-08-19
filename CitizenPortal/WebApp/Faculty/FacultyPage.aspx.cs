using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Faculty
{
    public partial class FacultyPage : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        
        string m_FacultyID = "", m_ProfileID = "", m_keyField = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["FacultyID"] == null) return;
            if (Request.QueryString["ProfileID"] == null) return;
            //if (Request.QueryString["KeyField"] == null) return;
            

            //m_FacultyID = Request.QueryString["FacultyID"].ToString();
            m_ProfileID = Request.QueryString["ProfileID"].ToString();
            //m_keyField = Request.QueryString["KeyField"].ToString();
            
            DataSet dt = m_AdmissionFormBLL.GetFacultyData(m_FacultyID,m_ProfileID, m_keyField);

            DataTable dtSummary = dt.Tables[0];
            DataTable dtNominatedDetail = dt.Tables[1];
            //DataTable dtSubmitted = dt.Tables[2];
            //DataTable dtPaper = dt.Tables[3];

            if (dt.Tables[0].Rows.Count != 0)
            {
                lblFacultyID.Text = dtSummary.Rows[0]["FacultyID"].ToString();
                lblEvalutorID.Text = dtSummary.Rows[0]["EvaluatorID"].ToString();
                FullName.Text = dtSummary.Rows[0]["FacultyName"].ToString();
                lblDesignation.Text = dtSummary.Rows[0]["Designation"].ToString();
                lblCollege.Text = dtSummary.Rows[0]["College"].ToString();
                lblDepartment.Text = dtSummary.Rows[0]["DepartmentName"].ToString();
                DOB.Text = dtSummary.Rows[0]["DateOfBirth"].ToString();
                lblDOJ.Text = dtSummary.Rows[0]["DateOfJoining"].ToString();
                gender.Text = dtSummary.Rows[0]["Gender"].ToString();
                lblStatus.Text = dtSummary.Rows[0]["Status"].ToString();
                EmailID.Text = dtSummary.Rows[0]["EmailID"].ToString();
                MobileNo.Text = dtSummary.Rows[0]["MobileNo"].ToString();
                lblWhatsApp.Text = dtSummary.Rows[0]["WhatsAppNo"].ToString();
                //lblSession.Text = "";// dtSummary.Rows[0][""].ToString();
                lblAadhar.Text = dtSummary.Rows[0]["AadharNo"].ToString();
                lblPAN.Text = dtSummary.Rows[0]["PANNo"].ToString();

                FullPermanentAddress.Text = dtSummary.Rows[0]["Address"].ToString();
                lblPState.Text = dtSummary.Rows[0]["State"].ToString(); ;
                lblPDistrict.Text = dtSummary.Rows[0]["DISTRICT"].ToString();
                lblPBlock.Text = dtSummary.Rows[0]["SUBDISTRICT"].ToString();
                lblPVillage.Text = dtSummary.Rows[0]["Village"].ToString();
                lblPPIN.Text = dtSummary.Rows[0]["PinCode"].ToString();

                lblSpecilization.Text = dtSummary.Rows[0]["Specialization"].ToString();
                lblUGQual.Text = dtSummary.Rows[0]["GraduationQualificationin"].ToString();
                lblPGQual.Text = dtSummary.Rows[0]["PostGraduationQualification"].ToString();
                lblDOCQual.Text = dtSummary.Rows[0]["DoctorateQualification"].ToString();
                lblPGDOCQual.Text = dtSummary.Rows[0]["PostGraduationQualification"].ToString();
                lblUGExp.Text = dtSummary.Rows[0]["ExperianceUG"].ToString();
                lblPGExp.Text = dtSummary.Rows[0]["ExperiancePG"].ToString();
                lblExp.Text = dtSummary.Rows[0]["ExperianceTotal"].ToString();
                lblIndExp.Text = dtSummary.Rows[0]["IndustrialExperiance"].ToString();

                lblBankName.Text = dtSummary.Rows[0]["BankName"].ToString();
                lblBankAddress.Text = dtSummary.Rows[0]["BankAddress"].ToString();
                lblFSO.Text = dtSummary.Rows[0]["IFISCCode"].ToString();
                lblAccount.Text = dtSummary.Rows[0]["AccountNo"].ToString();
                lblBankHolder.Text = dtSummary.Rows[0]["BankHolderName"].ToString();
                ProfilePhoto.Src = dtSummary.Rows[0]["PhotoStr"].ToString();
                ProfileSignature.Src = dtSummary.Rows[0]["SignStr"].ToString();
                if (dtNominatedDetail.Rows.Count != 0) {
                    grdPaper.DataSource = dtNominatedDetail;
                    grdPaper.DataBind();
                }

            }


        }
    }
}