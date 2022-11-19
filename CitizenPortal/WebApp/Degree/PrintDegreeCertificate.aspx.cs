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
    public partial class PrintDegreeCertificate : AdminBasePage
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
            DataTable dtDivision = ds.Tables[2];
            if (dt.Rows.Count != 0)
            {
                lblDate.Text = dt.Rows[0]["ApprovedDate"].ToString();
                //lblAppDate.Text = dt.Rows[0]["CreatedOn"].ToString();
                lblEnrollment.Text = dt.Rows[0]["EnrollmentNo"].ToString();
                lblRollNo.Text = dt.Rows[0]["RollNo"].ToString();

                lblRollNo.Text = dt.Rows[0]["RollNo"].ToString();
                lblName.Text = dt.Rows[0]["StudentName"].ToString(); ;
                lblBranch.Text = dtResult.Rows[0]["DegreeEnglish"].ToString();
                lblBranchE.Text = dt.Rows[0]["Course"].ToString();
                lblSession.Text = dtResult.Rows[0]["ExamSession"].ToString();
                lblDivision.Text = dtResult.Rows[0]["Result"].ToString();

                lblNameH.Text = dt.Rows[0]["StudentNameHindi"].ToString(); ;
                lblBranchH1.Text = dtResult.Rows[0]["CourseHindiName"].ToString();
                lblBranchH2.Text = dtResult.Rows[0]["ProgramNameHindi"].ToString();
                lblSessionH.Text = dtResult.Rows[0]["ExamSessionH"].ToString();
                lblDivisionH.Text = dtResult.Rows[0]["Result"].ToString();


                lblCertificateHindi.Text = dtResult.Rows[0]["CourseHindi"].ToString();
                lblBranchH1.Text = dtResult.Rows[0]["ProgramHindi"].ToString();
                //lblDivisionH.Text = dt.Rows[0]["DivisionHindi"].ToString();
                lblBranchH2.Text = dtResult.Rows[0]["ProgramHindi"].ToString();

                lblCertificate.Text = dtResult.Rows[0]["CourseEnglish"].ToString();
                lblBranch.Text = dtResult.Rows[0]["DegreeEnglish"].ToString();
                lblDivisionH.Text = dtResult.Rows[0]["ResultHindi"].ToString();
                lblBranchE.Text = dtResult.Rows[0]["ProgramEnglish"].ToString();

            }

            if (dtDivision.Rows.Count != 0)
            {
                string m_Division = dtDivision.Rows[0]["Division"].ToString().Trim();

                if (m_Division.Contains("DISTINCTION"))
                { lblDivisionH.Text = "डिस्टिंक्शन"; }
                if (m_Division.Contains("FIRST"))
                { lblDivisionH.Text = "प्रथम"; }
                if (m_Division.Contains("FIRST (HONORS)"))
                { lblDivisionH.Text = "प्रथम (आनर्स)"; }

                if (m_Division.Contains("SECOND"))
                { lblDivisionH.Text = "द्वितीय"; }

                if (m_Division.Contains("PASS"))
                { lblDivisionH.Text = "उत्तीर्ण"; }

                lblDivision.Text = m_Division.Replace("DIVISION","");
            }

            try
            {
                string QRText = "";
                QRText = "CSVTU - DEGREE CERTIFICATE" +
                " \n Enrollment No:" + lblEnrollment.Text +
                " \n Roll No: " + lblRollNo.Text +
                " \n Name: " + lblName.Text +
                " \n Father's Name: " + dt.Rows[0]["FatherName"].ToString() +
                " \n Institute Name: " + dt.Rows[0]["CollegeName"].ToString() +
                " \n Course: " + lblCertificate.Text +
                " \n Program: " + lblBranchE.Text +
                " \n Passing Session:" + lblSession.Text +
                " \n Result: Pass" +
                " \n Division: " + lblDivision.Text +
                " \n Date: " + lblDate.Text;
                QRCode1.GenerateQRCodeDegree(m_ServiceID, m_AppID, QRText);
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