using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Degree
{
    public partial class PrintDegreeCertificate : System.Web.UI.Page
    {
        MigrationBLL m_MigrationBLLL = new MigrationBLL();
        DuplicateDiplomaBLL m_DuplicateDiplomaBLL = new DuplicateDiplomaBLL();
        string m_AppID = "", m_ServiceID = "", RegNo = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["Flag"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
            if (Request.QueryString["Flag"].ToString() != "P") return;

            DataSet ds = m_MigrationBLLL.DegreeCertificate(m_ServiceID, m_AppID, RegNo, "Print");
            DataTable dt = ds.Tables[0];
            DataTable dtResult = ds.Tables[1];

            if (dt.Rows.Count != 0)
            {
                lblDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
                //lblAppDate.Text = dt.Rows[0]["CreatedOn"].ToString();
                lblEnrollment.Text = dt.Rows[0]["EnrollmentNo"].ToString();
                lblRollNo.Text = dt.Rows[0]["RollNo"].ToString();

                lblRollNo.Text = dt.Rows[0]["RollNo"].ToString();                
                lblName.Text = dt.Rows[0]["StudentName"].ToString();;
                lblBranch.Text = dt.Rows[0]["ProgramName"].ToString();
                lblBranchE.Text = dt.Rows[0]["Course"].ToString();
                lblSession.Text = dtResult.Rows[0]["ExamSession"].ToString();
                lblDivision.Text = dtResult.Rows[0]["Result"].ToString();

                lblNameH.Text = dt.Rows[0]["StudentNameHindi"].ToString(); ;
                lblBranchH1.Text = dt.Rows[0]["CourseHindiName"].ToString();
                lblBranchH2.Text = dt.Rows[0]["ProgramNameHindi"].ToString();
                lblSessionH.Text = dtResult.Rows[0]["ExamSessionH"].ToString();
                lblDivisionH.Text = dtResult.Rows[0]["Result"].ToString();


                lblCertificateHindi.Text = dt.Rows[0]["CourseHindi"].ToString();
                lblBranchH1.Text = dt.Rows[0]["ProgramHindi"].ToString();
                //lblDivisionH.Text = dt.Rows[0]["DivisionHindi"].ToString();
                lblBranchH2.Text = dt.Rows[0]["ProgramHindi"].ToString();

                lblCertificate.Text = dt.Rows[0]["CourseEnglish"].ToString();
                lblBranch.Text = dt.Rows[0]["ProgramEnglish"].ToString();
                lblDivisionH.Text = dtResult.Rows[0]["ResultHindi"].ToString();
                lblBranchE.Text = dt.Rows[0]["ProgramEnglish"].ToString();

            }

            try
            {
                QRCode1.GenerateQRCodeDegree(m_ServiceID, m_AppID);
            }
            catch { }

        }

        private void CheckForManualData(string m_AppID)
        {
            DataTable l_dt = m_MigrationBLLL.GetManualDataMigration(m_AppID, m_ServiceID);

            if (l_dt.Rows.Count != 0)
            {                
                lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                
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