using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.DegreeSU
{
    public partial class DiplomaCertificate : CommonBasePage
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
            //RegNo = Request.QueryString["SvcID"].ToString();
            lblDate.Text = "Date : " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            lblPlace.Text = "Place : BHUBANESWAR";

            DataSet dt = m_DuplicateDiplomaBLL.GetStudentDetail(m_AppID);
            DataTable dtApp = dt.Tables[0];
            
            string t_Year = "", t_Session="";
            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = m_AppID;

                t_Year = dt.Tables[0].Rows[0]["LeavingYear"].ToString();
                RegNo = dt.Tables[0].Rows[0]["RegistrationNo"].ToString();

                DocumentVerification.StudentDetailsWS m_DocumentVerification = new DocumentVerification.StudentDetailsWS();
                DataTable t_Dt = m_DocumentVerification.DuplicateDivisionalCertificate(RegNo, t_Year);
                if (t_Dt.Rows.Count != 0)
                {
                    //if (t_Dt.Rows[0][0].ToString() == "No Record Found")
                    if (t_Dt.Rows[0]["Status"].ToString() == "No Record Found")
                    {

                        DataTable l_dt = m_DuplicateDiplomaBLL.GetlegacyData(m_AppID);

                        if (l_dt.Rows.Count != 0)
                        {
                            lblReg.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                            lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                            lblfname.Text = l_dt.Rows[0]["FatherName"].ToString();
                            lblInstitute.Text = l_dt.Rows[0]["InstituteName"].ToString();
                            lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();
                            lblDivision.Text = l_dt.Rows[0]["Division"].ToString();
                            t_Year = l_dt.Rows[0]["YearofPassing"].ToString();
                            lblSession.Text = l_dt.Rows[0]["Session"].ToString() + " - " + t_Year;
                        }
                        else
                        {
                            CheckForManualData(m_AppID);
                            //string t_URL = "/WebApp/G2G/DTE/DMASForm.aspx?SvcID=371&AppID=" + m_AppID;
                            //string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Duplicate Diploma Certificate.";
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);

                        }
                    }
                    else
                    {
                        lblReg.Text = t_Dt.Rows[0]["RegistrationNumber"].ToString();
                        lblName.Text = t_Dt.Rows[0]["StudentName"].ToString();
                        lblfname.Text = t_Dt.Rows[0]["FatherName"].ToString();
                        lblInstitute.Text = t_Dt.Rows[0]["InstituteName"].ToString();
                        lblBranch.Text = t_Dt.Rows[0]["BranchName"].ToString();
                        lblDivision.Text = t_Dt.Rows[0]["Division"].ToString();
                        t_Year = t_Dt.Rows[0]["YearofPassing"].ToString();
                        lblSession.Text = t_Dt.Rows[0]["Session"].ToString();// + " - " + t_Year;
                                                
                    }
                    try { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
                    catch { }
                }
            }
        }

        private void CheckForManualData(string m_AppID)
        {
            DataTable l_dt = m_MigrationBLLL.GetManualDataMigration(m_AppID, m_ServiceID);

            if (l_dt.Rows.Count != 0)
            {
                //lblRegistration.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                lblReg.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
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