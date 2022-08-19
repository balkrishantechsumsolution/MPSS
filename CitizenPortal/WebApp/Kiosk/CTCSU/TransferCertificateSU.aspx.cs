using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.CTCSU
{
    public partial class TransferCertificateSU : CommonBasePage
    {
        MigrationSUBLL m_MigrationSUBLL = new MigrationSUBLL();
        TransferSUBLL m_TransferSUBLL = new TransferSUBLL();
        string m_AppID = "", m_ServiceID = "", RegNo = "", RollNo="";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["RegNo"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            lblAppID.Text = m_AppID;
            lblDate.Text = "Date : " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            lblPlace.Text = "Place : BURLA, SAMBALPUR";

            DataSet ds = m_TransferSUBLL.GetCollegeTransferSU(m_ServiceID, m_AppID);
            DataTable dtApp = ds.Tables[0];

            string t_Year = "";
            if (ds.Tables[0].Rows.Count != 0)
            {
                lblsubjects.Text = ds.Tables[0].Rows[0]["SubjectName"].ToString(); 
                t_Year = ds.Tables[0].Rows[0]["AdmissionYear"].ToString();
                RegNo = ds.Tables[0].Rows[0]["RegistrationNo"].ToString().ToUpper();
                RollNo = ds.Tables[0].Rows[0]["RollNo"].ToString().ToUpper();

                DataTable t_Dt = m_MigrationSUBLL.GetlegacyData(m_AppID, RegNo, RollNo);

                if (t_Dt.Rows.Count != 0)
                {
                    lblRegistration.Text = t_Dt.Rows[0]["REGDNO"].ToString();
                    lblReg.Text = t_Dt.Rows[0]["REGDNO"].ToString();
                    lblName.Text = t_Dt.Rows[0]["FUNAME"].ToString();
                    lblInstitute.Text = t_Dt.Rows[0]["CENTRE"].ToString();
                    lblBranch.Text = t_Dt.Rows[0]["BranchName"].ToString();
                    lblClass.Text = t_Dt.Rows[0]["Class"].ToString();
                    t_Year = t_Dt.Rows[0]["PYEAR"].ToString();
                }
                else
                {
                    CheckForManualData(m_AppID);
                }

            }
            else
            {
                lblRegistration.Text = dtApp.Rows[0]["RegistrationNumber"].ToString();
                lblReg.Text = dtApp.Rows[0]["RegistrationNumber"].ToString();
                lblName.Text = dtApp.Rows[0]["StudentName"].ToString();
                lblInstitute.Text = dtApp.Rows[0]["InstituteName"].ToString();
                lblBranch.Text = dtApp.Rows[0]["BranchName"].ToString();
                lblClass.Text = dtApp.Rows[0]["Class"].ToString();
                t_Year = dtApp.Rows[0]["YearOfAdmission"].ToString();
            }

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }
        }
        
        private void CheckForManualData(string m_AppID)
        {
            DataTable l_dt = m_MigrationSUBLL.GetManualDataSU(m_AppID, m_ServiceID, RegNo, RollNo);

            if (l_dt.Rows.Count != 0)
            {
                lblRegistration.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblReg.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                lblInstitute.Text = l_dt.Rows[0]["CollegeName"].ToString();
                lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();
                lblClass.Text = l_dt.Rows[0]["Class"].ToString();

            }
            else
            {
                string t_URL = "/WebApp/G2G/SU/DMASForm.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
                string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue College Transfer Certificate.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
            }
        }
    }
}