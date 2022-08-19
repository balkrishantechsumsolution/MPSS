using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Transcript
{
    public partial class TranscriptCertificate : System.Web.UI.Page
    {
        MigrationBLL m_MigrationBLLL = new MigrationBLL();
        DuplicateDiplomaBLL m_DuplicateDiplomaBLL = new DuplicateDiplomaBLL();
        string m_AppID = "", m_ServiceID = "", RegNo = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["RegNo"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet ds = m_MigrationBLLL.ProvisionalCertificate(m_ServiceID, m_AppID, RegNo);
            DataTable dt = ds.Tables[0];
            DataTable dtResult = ds.Tables[1];

            if (dt.Rows.Count != 0)
            {
                lblAppDate.Text = m_AppID;
                lblDate.Text = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");

                lblSerilNo.Text = dt.Rows[0]["SlNo"].ToString();
                lblEnrollmentNo.Text = dt.Rows[0]["EnrollmentNo"].ToString();
                lblRollNo.Text = dt.Rows[0]["RollNo"].ToString();
                lblName.Text = dt.Rows[0]["StudentName"].ToString();
                lblfname.Text = dt.Rows[0]["FatherName"].ToString();
                lblInstitute.Text = dt.Rows[0]["CollegeName"].ToString();
                lblBranch.Text = dt.Rows[0]["Course"].ToString();
                lblDegree.Text = dt.Rows[0]["Degree"].ToString();

                lblSession.Text = dtResult.Rows[0]["ExamSession"].ToString();
                lblPercentage .Text = dtResult.Rows[0]["Result"].ToString();
                lblDivision.Text = dtResult.Rows[0]["Semester"].ToString();
                lblCPI.Text = dtResult.Rows[0]["Semester"].ToString();

            }

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }

        }

        private void CheckForManualData(string m_AppID)
        {
            DataTable l_dt = m_MigrationBLLL.GetManualDataMigration(m_AppID, m_ServiceID);

            if (l_dt.Rows.Count != 0)
            {
                //lblRegistration.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblEnrollmentNo.Text = l_dt.Rows[0]["EnrollmentNo"].ToString();
                //lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                //lblfname.Text = l_dt.Rows[0]["FatherName"].ToString();
                //lblInstitute.Text = l_dt.Rows[0]["InstituteName"].ToString();
                //lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();
                //lblDivision.Text = l_dt.Rows[0]["Division"].ToString();
                //t_Year = l_dt.Rows[0]["YearofPassing"].ToString();
                //lblSession.Text = l_dt.Rows[0]["Session"].ToString() + " - " + t_Year;

                lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                lblfname.Text = l_dt.Rows[0]["FatherName"].ToString();
                lblInstitute.Text = l_dt.Rows[0]["InstituteName"].ToString();
                lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();
                lblDivision.Text = l_dt.Rows[0]["Division"].ToString();
                string t_Year = l_dt.Rows[0]["YearofPassing"].ToString();
                lblSession.Text = l_dt.Rows[0]["Session"].ToString() + " - " + t_Year;


            }
            else
            {
                //string t_URL = "/WebApp/G2G/DTE/DMASForm.aspx?SvcID=368&AppID=" + m_AppID;
                //string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Migration Certificate.";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);

                string t_URL = "/WebApp/G2G/DTE/DMASForm.aspx?SvcID=369&AppID=" + m_AppID;
                string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Duplicate Diploma Certificate.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
            }
        }
    }
}