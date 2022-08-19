using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.MigrationSU
{
    public partial class MigrationCertificateSU : CommonBasePage
    {
        MigrationSUBLL m_MigrationSUBLLL = new MigrationSUBLL();
        string m_AppID = "", m_ServiceID = "", RegNo = "", RollNo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["RegNo"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            DataSet dt = m_MigrationSUBLLL.GetMigrationSU(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];

            string t_Year = "";
            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = m_AppID;
                t_Year = dt.Tables[0].Rows[0]["AdmissionYear"].ToString();
                RegNo = dt.Tables[0].Rows[0]["RegistrationNo"].ToString().ToUpper();
                RollNo = dt.Tables[0].Rows[0]["RollNo"].ToString().ToUpper();
                lblName.Text = dt.Tables[0].Rows[0]["ApplicantName"].ToString();
                lblInstitute.Text = dt.Tables[0].Rows[0]["CollegeName"].ToString();
                lblBranch.Text = dt.Tables[0].Rows[0]["Program"].ToString();

                lblDate.Text = "Date : " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
                lblPlace.Text = "Place : Sambalpur";

                DataTable t_Dt = m_MigrationSUBLLL.GetlegacyData(m_AppID, RegNo, RollNo);

                if (t_Dt.Rows.Count != 0)
                {
                    lblAppID.Text = m_AppID;
                    lblRegistration.Text = t_Dt.Rows[0]["RegistrationNo"].ToString();
                    lblReg.Text = t_Dt.Rows[0]["RegistrationNo"].ToString();
                    lblName.Text = t_Dt.Rows[0]["ApplicantName"].ToString();
                    lblInstitute.Text = t_Dt.Rows[0]["CollegeName"].ToString();
                    lblBranch.Text = t_Dt.Rows[0]["Program"].ToString();
                    t_Year = t_Dt.Rows[0]["AdmissionYear"].ToString();
                }
                else
                {
                    lblAppID.Text = m_AppID;
                    lblRegistration.Text = dtApp.Rows[0]["RegistrationNo"].ToString();
                    lblReg.Text = dtApp.Rows[0]["RegistrationNo"].ToString();
                    lblName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                    lblInstitute.Text = dtApp.Rows[0]["CollegeName"].ToString();
                    lblBranch.Text = dtApp.Rows[0]["Program"].ToString();
                    t_Year = dtApp.Rows[0]["AdmissionYear"].ToString();
                }
            }
            else
            {
                lblAppID.Text = m_AppID;
                lblRegistration.Text = dtApp.Rows[0]["RegistrationNo"].ToString();
                lblReg.Text = dtApp.Rows[0]["RegistrationNo"].ToString();
                lblName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                lblInstitute.Text = dtApp.Rows[0]["CollegeName"].ToString();
                lblBranch.Text = dtApp.Rows[0]["Program"].ToString();
                t_Year = dtApp.Rows[0]["AdmissionYear"].ToString();
            }

            try
            {
                QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
            }
            catch { }

        }

        private void CheckForManualData(string m_AppID)
        {
            DataTable l_dt = m_MigrationSUBLLL.GetManualDataSU(m_AppID, m_ServiceID, RegNo, RollNo);

            if (l_dt.Rows.Count != 0)
            {
                lblRegistration.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblReg.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                //lblfname.Text = l_dt.Rows[0]["FatherName"].ToString();
                lblInstitute.Text = l_dt.Rows[0]["CollegeName"].ToString();
                lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();
                //lblDivision.Text = l_dt.Rows[0]["Division"].ToString();
                //t_Year = l_dt.Rows[0]["YearofPassing"].ToString();
                //lblSession.Text = l_dt.Rows[0]["Session"].ToString() + " - " + t_Year;


            }
            else
            {
                string t_URL = "/WebApp/G2G/SU/DMASForm.aspx?SvcID="+ m_ServiceID + "&AppID=" + m_AppID;
                string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Migration Certificate.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
            }
        }
    }
}