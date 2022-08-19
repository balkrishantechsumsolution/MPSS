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

namespace CitizenPortal.WebApp.G2G.DTE
{
    public partial class DMASForm : AdminBasePage
    {
        MigrationBLL m_MigrationBLLL = new MigrationBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
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
                GetDTEBranch();
                GetInstitute();

                GetDTEAppDetails(m_AppID, m_ServiceID);
            }

        }

        private void GetDTEBranch()
        {
            DataTable dtBranch = m_MigrationBLLL.GetBranchMaster();

            if (dtBranch.Rows.Count != 0)
            {
                ddlBranch.DataValueField = "BranchCode";
                ddlBranch.DataTextField = "BranchName";
                ddlBranch.DataSource = dtBranch;


                ddlBranch.DataBind();
            }
        }

        private void GetInstitute()
        {
            DataTable dtInstitute = m_MigrationBLLL.GetInstituteMaster();

            if (dtInstitute.Rows.Count != 0)
            {
                ddlInstitute.DataValueField = "InstitueCode";
                ddlInstitute.DataTextField = "InstituteName";
                ddlInstitute.DataSource = dtInstitute;
                ddlInstitute.DataBind();
            }
        }

        private void GetDTEAppDetails(string m_AppID, string m_ServiceID)
        {
            DataTable l_dt = m_MigrationBLLL.GetDTEAppDetails(m_AppID, m_ServiceID);

            if (l_dt.Rows.Count != 0)
            {
                txtRegistration.Value = l_dt.Rows[0]["RegistrationNo"].ToString();
                ddlSession.Items.IndexOf(ddlSession.Items.FindByValue(l_dt.Rows[0]["session"].ToString()));
                ddlAdmission.SelectedIndex = ddlAdmission.Items.IndexOf(ddlAdmission.Items.FindByValue(l_dt.Rows[0]["admissionyear"].ToString()));
                ddlPassing.SelectedIndex = ddlPassing.Items.IndexOf(ddlPassing.Items.FindByValue(l_dt.Rows[0]["passingyear"].ToString()));
                ddlBranch.SelectedIndex = ddlBranch.Items.IndexOf(ddlBranch.Items.FindByValue(l_dt.Rows[0]["BranchCode"].ToString()));
                ddlInstitute.SelectedIndex = ddlInstitute.Items.IndexOf(ddlInstitute.Items.FindByValue(l_dt.Rows[0]["Institutecode"].ToString()));
                txtName.Value = l_dt.Rows[0]["ApplicantName"].ToString();
                txtFather.Value = l_dt.Rows[0]["FatherName"].ToString();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string[] AFields =
            {
                "ServiceID",
                "AppID",
                "RegistrationNo",
                "Session",
                "AdmissionYear",
                "PassingYear",
                "BranchName",
                "InstituteName",
                "StudentName",
                "FatherName",
                "Division",
                "CreatedBy"
            };

            DTEManualData_DT t_DTEManualData_DT = new DTEManualData_DT();

            t_DTEManualData_DT.AdmissionYear = ddlAdmission.SelectedValue;
            t_DTEManualData_DT.AppID = m_AppID;
            t_DTEManualData_DT.BranchName = Request.Form["ddlBranch"].ToString();
            t_DTEManualData_DT.CreatedBy = LoginID;
            t_DTEManualData_DT.Division = ddlDivision.SelectedValue; // TODO: A new field to be included in Form.
            t_DTEManualData_DT.FatherName = txtFather.Value;
            t_DTEManualData_DT.InstituteName = Request.Form["ddlInstitute"].ToString();
            t_DTEManualData_DT.PassingYear = ddlPassing.SelectedValue;
            t_DTEManualData_DT.RegistrationNo = txtRegistration.Value;
            t_DTEManualData_DT.ServiceID = m_ServiceID;
            t_DTEManualData_DT.Session = ddlSession.SelectedValue;
            t_DTEManualData_DT.StudentName = txtName.Value;

            System.Data.DataTable result = null;
            string UID = "";

            result = m_G2GDashboardBLL.InsertDTEManualData(t_DTEManualData_DT, AFields);

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