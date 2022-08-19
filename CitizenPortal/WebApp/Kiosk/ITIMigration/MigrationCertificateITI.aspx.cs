using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.ITIMigrationCertificate
{
    public partial class MigrationCertificateITI : System.Web.UI.Page
    {
        MigrationBLL m_MigrationBLLL = new MigrationBLL();
        string m_AppID = "", m_ServiceID = "", RegNo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["RegNo"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();           

            DataSet dt = m_MigrationBLLL.GetMigrationCertificateITI(m_ServiceID, m_AppID, RegNo);
            DataTable dtApp = dt.Tables[0];
            
            string t_Year = "", t_Session = "";
            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = m_AppID;
                t_Year = dt.Tables[0].Rows[0]["AdmissionYear"].ToString();
                RegNo = dt.Tables[0].Rows[0]["RegistrationNo"].ToString().ToUpper();
                lblDate.Text = "Date : " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
                lblPlace.Text = "Place : BHUBANESWAR";
                //DocumentVerification.StudentDetailsWS m_DocumentVerification = new DocumentVerification.StudentDetailsWS();
                SCTEVTITI.MigrationCertITI m_MigrationCertITI = new SCTEVTITI.MigrationCertITI();

                DataSet t_DS = m_MigrationCertITI.MigrationCertificate(RegNo, t_Year);

                DataTable t_Dt = t_DS.Tables[0];
//DataTable t_Dt = m_DocumentVerification.MigrationCertificate(RegNo, t_Year);
                if (t_Dt.Rows.Count != 0)
                {

                    //if (t_Dt.Rows[0][0].ToString() == "No Record Found")
                    if (t_Dt.Rows[0]["Status"].ToString() == "Record Not Found")
                    {
                        DataTable l_dt = m_MigrationBLLL.GetlegacyDataMigration(m_AppID);

                        if (l_dt.Rows.Count != 0)
                        {
                            lblRegistration.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                            lblReg.Text = t_Dt.Rows[0]["RegistrationNumber"].ToString();
                            lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                            //lblfname.Text = l_dt.Rows[0]["FatherName"].ToString();
                            lblInstitute.Text = l_dt.Rows[0]["InstituteName"].ToString();
                            lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();
                            //lblDivision.Text = l_dt.Rows[0]["Division"].ToString();
                            t_Year = l_dt.Rows[0]["YearofPassing"].ToString();
                            //lblSession.Text = l_dt.Rows[0]["Session"].ToString() + " - " + t_Year;
                        }
                        else
                        {
                            CheckForManualData(m_AppID);
                        }
                       
                    }
                    else
                    {
                        lblRegistration.Text = t_Dt.Rows[0]["RegistrationNumber"].ToString();
                        lblReg.Text = t_Dt.Rows[0]["RegistrationNumber"].ToString();
                        lblName.Text = t_Dt.Rows[0]["StudentName"].ToString();
                        lblInstitute.Text = t_Dt.Rows[0]["InstituteName"].ToString();
                        lblBranch.Text = t_Dt.Rows[0]["BranchName"].ToString();
                        //lblDivision.Text = t_Dt.Rows[0]["Division"].ToString();
                        t_Year = t_Dt.Rows[0]["YearOfAdmission"].ToString();
                        //lblSession.Text = t_Dt.Rows[0]["Session"].ToString() + " - " + t_Year;

                        
                    }

                    try
                    {
                        QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID);
                    }
                    catch { }
                }
            }
        }

        private void CheckForManualData(string m_AppID)
        {
            DataTable l_dt = m_MigrationBLLL.GetManualDataMigration(m_AppID, m_ServiceID);

            if (l_dt.Rows.Count != 0)
            {
                lblRegistration.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblReg.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                //lblfname.Text = l_dt.Rows[0]["FatherName"].ToString();
                lblInstitute.Text = l_dt.Rows[0]["InstituteName"].ToString();
                lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();
                //lblDivision.Text = l_dt.Rows[0]["Division"].ToString();
                //t_Year = l_dt.Rows[0]["YearofPassing"].ToString();
                //lblSession.Text = l_dt.Rows[0]["Session"].ToString() + " - " + t_Year;


            }
            else
            {
                string t_URL = "/WebApp/G2G/ITI/ITIForm.aspx?SvcID=425&AppID=" + m_AppID;
                string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Migration Certificate.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
            }
        }
    }
}