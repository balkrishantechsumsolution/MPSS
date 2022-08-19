using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortal.Services;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using CitizenPortalLib;
using System.Data;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class DMASForm : System.Web.UI.Page// BasePage
    {
        MigrationSUBLL m_MigrationBLL = new MigrationSUBLL();
                
        private string m_ServiceID, m_AppID;
        string LoginID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //DocumentVerification.StudentDetailsWSSoapClient m_DocumentVerification = new DocumentVerification.StudentDetailsWSSoapClient();
            //m_DocumentVerification.ViewStudentDetails()

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            LoginID = Session["LoginID"].ToString();

            if (!IsPostBack) {
                GetBranch();
                GetCollege();

                GetSUAppDetails(m_AppID, m_ServiceID);
            }

        }

        private void GetBranch()
        {
            DataTable dtBranch = m_MigrationBLL.GetBranchMaster();

            if (dtBranch.Rows.Count != 0)
            {
                ddlBranch.DataValueField = "BranchCode";
                ddlBranch.DataTextField = "CourseName";
                ddlBranch.DataSource = dtBranch;


                ddlBranch.DataBind();
            }
        }

        private void GetCollege()
        {
            DataTable dtInstitute = m_MigrationBLL.GetCollegeMaster();

            if (dtInstitute.Rows.Count != 0)
            {
                ddlCollege.DataValueField = "CollegeCode";
                ddlCollege.DataTextField = "CollegeName";
                ddlCollege.DataSource = dtInstitute;
                ddlCollege.DataBind();
            }
        }

        private void GetSUAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable l_dt = m_MigrationBLL.GetSUAppDetails(m_AppID, m_ServiceID);

            if (l_dt.Rows.Count != 0)
            {
                txtRegistration.Value = l_dt.Rows[0]["RegistrationNo"].ToString();
                txtRollNo.Value = l_dt.Rows[0]["RollNo"].ToString();
                ddlAdmission.SelectedIndex = ddlAdmission.Items.IndexOf(ddlAdmission.Items.FindByValue(l_dt.Rows[0]["admissionyear"].ToString()));
                ddlPassing.SelectedIndex = ddlPassing.Items.IndexOf(ddlPassing.Items.FindByValue(l_dt.Rows[0]["passingyear"].ToString()));
                ddlBranch.SelectedIndex = ddlBranch.Items.IndexOf(ddlBranch.Items.FindByValue(l_dt.Rows[0]["Branch"].ToString()));
                ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(l_dt.Rows[0]["Collegecode"].ToString()));
                txtName.Value = l_dt.Rows[0]["ApplicantName"].ToString();
                txtFather.Value = l_dt.Rows[0]["FatherName"].ToString();
                ddlClass.SelectedIndex = ddlClass.Items.IndexOf(ddlClass.Items.FindByText(l_dt.Rows[0]["Class"].ToString()));
                ddlStudent.SelectedIndex = ddlStudent.Items.IndexOf(ddlStudent.Items.FindByText(l_dt.Rows[0]["StudentType"].ToString()));
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string[] AFields =
            {
                  "ServiceID"
                , "AppID"
                , "StudentType"
                , "RegistrationNo"
                , "RollNo"
                , "AdmissionYear"
                , "PassingYear"
                , "BranchName"
                , "Class"
                , "CollegeName"
                , "StudentName"
                , "FatherName"
                , "Division"
                , "CreatedBy"
                
            };

            SUManualData_DT t_SUManualData_DT = new SUManualData_DT();

            t_SUManualData_DT.AdmissionYear = ddlAdmission.SelectedValue;
            t_SUManualData_DT.ServiceID = m_ServiceID;
            t_SUManualData_DT.AppID = m_AppID;
            t_SUManualData_DT.StudentType = ddlStudent.SelectedValue;
            t_SUManualData_DT.BranchName = Request.Form["ddlBranch"].ToString();
            t_SUManualData_DT.CreatedBy = LoginID;
            t_SUManualData_DT.Division = ddlDivision.SelectedValue; // TODO: A new field to be included in Form.
            t_SUManualData_DT.FatherName = txtFather.Value;
            t_SUManualData_DT.CollegeName = Request.Form["ddlCollege"].ToString();
            t_SUManualData_DT.PassingYear = ddlPassing.SelectedValue;
            t_SUManualData_DT.RegistrationNo = txtRegistration.Value;
            t_SUManualData_DT.RollNo = txtRollNo.Value;
            t_SUManualData_DT.Class = ddlClass.SelectedValue;
            t_SUManualData_DT.ServiceID = m_ServiceID;
            t_SUManualData_DT.BranchName = ddlBranch.SelectedValue;
            t_SUManualData_DT.StudentName = txtName.Value;

            System.Data.DataTable result = null;
            string UID = "";

            result = m_MigrationBLL.InsertSUManualData(t_SUManualData_DT, AFields);

            if (result != null && result.Rows.Count > 0)
            {
                if (result.Rows[0]["Result"].ToString() == "1")
                {
                    string m_Message = "Record Saved Sucessfully!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
                }
            }

        }




    }
}