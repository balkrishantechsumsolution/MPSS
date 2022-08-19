using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.RegistrationReceiptSU
{
    public partial class RegistrationReceipt : CommonBasePage
    {
        MigrationSUBLL m_MigrationSUBLL = new MigrationSUBLL();
        RegistrationReceiptSUBLL m_RegistrationReceiptSUBLL = new RegistrationReceiptSUBLL();
        string m_AppID = "", m_ServiceID = "", RegNo = "", RollNo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            lblAppID.Text = m_AppID;
            lblDate.Text = "Date : " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            lblPlace.Text = "Place : BHUBANESWAR";
            string t_Year = "";

            DataSet dt = m_RegistrationReceiptSUBLL.GetRegistrationReceiptCertificateSU(m_ServiceID, m_AppID);
            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = m_AppID;
                t_Year = dt.Tables[0].Rows[0]["AdmissionYear"].ToString();
                RegNo = dt.Tables[0].Rows[0]["RegistrationNo"].ToString().ToUpper();
                RollNo = dt.Tables[0].Rows[0]["RollNo"].ToString().ToUpper();

                DataTable t_Dt = m_MigrationSUBLL.GetlegacyData(m_AppID, RegNo, RollNo);

                if (t_Dt.Rows.Count != 0)
                {
                    lblReg.Text = t_Dt.Rows[0]["REGDNO"].ToString();
                    lblRegNo.Text = t_Dt.Rows[0]["REGDNO"].ToString();
                    lblReg.Text = t_Dt.Rows[0]["REGDNO"].ToString();
                    lblName.Text = t_Dt.Rows[0]["FUNAME"].ToString();
                    lblCollege.Text = t_Dt.Rows[0]["CENTRE"].ToString();
                    lblBranch.Text = t_Dt.Rows[0]["BranchName"].ToString();
                    t_Year = t_Dt.Rows[0]["PYEAR"].ToString();
                }
                else
                {
                    CheckForManualData(m_AppID);
                }

            }
            else {
                DataTable t_Dt = null;
                t_Dt = dt.Tables[0];                

                t_Year = dt.Tables[0].Rows[0]["AdmissionYear"].ToString();
                RegNo = dt.Tables[0].Rows[0]["RegistrationNo"].ToString();

                lblReg.Text = t_Dt.Rows[0]["RegistrationNo"].ToString();
                lblName.Text = t_Dt.Rows[0]["StudentName"].ToString();

                lblCollege.Text = t_Dt.Rows[0]["CollegeName"].ToString();
                lblBranch.Text = t_Dt.Rows[0]["BranchName"].ToString();
                lblRegNo.Text = t_Dt.Rows[0]["RegistrationNo"].ToString();
            }
            
            try { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
            catch { }
        }

        private void CheckForManualData(string m_AppID)
        {
            DataTable l_dt = m_MigrationSUBLL.GetManualDataSU(m_AppID, m_ServiceID, RegNo, RollNo);
            if (l_dt.Rows.Count != 0)
            {
                lblRegNo.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblReg.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblName.Text = l_dt.Rows[0]["StudentName"].ToString();                
                lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();
            }
            else
            {
                string t_URL = "/WebApp/G2G/SU/DMASForm.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
                string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Duplicate Registration Receipt.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
            }
        }
    }
}

