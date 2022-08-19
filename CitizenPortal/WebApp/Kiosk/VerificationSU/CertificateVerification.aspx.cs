using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.VerificationSU
{
    public partial class CertificateVerification : CommonBasePage
    {
        DivisionalCertificateBLL m_DivisionalCertificateBLL = new DivisionalCertificateBLL();
        string m_AppID = "", m_ServiceID = "", RegNo = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDate.Text = "Date : " + Convert.ToString(DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"));
            lblPrinted.Text = "Printed On : " + Convert.ToString(DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"));
            lblPlace.Text = "Place : Bhubhubaneswar";
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
            //RegNo = Request.QueryString["RegNo"].ToString();

            DataSet dt = m_DivisionalCertificateBLL.GetDocumentVerification(RegNo, m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];
            DataTable dtAdd = dt.Tables[1];

            string t_Name = "", t_Year = "";
            if (dt.Tables[1].Rows.Count != 0)
            {
                RegNo = dtAdd.Rows[0]["RegNo"].ToString();
                t_Name = dtAdd.Rows[0]["Name"].ToString();
                t_Year = dtAdd.Rows[0]["CYEAR"].ToString();
                appId.Text = dtAdd.Rows[0]["AppID"].ToString();
                lblAppID.Text = dtAdd.Rows[0]["AppID"].ToString();
                lblAppDate.Text = Convert.ToDateTime(dtAdd.Rows[0]["CreatedOn"].ToString()).ToString("dd-MM-yyyy hh:mm:ss");

                lblCompany.Text = dtAdd.Rows[0]["CompanyApplicantName"].ToString();
                lblAddress.Text = dtAdd.Rows[0]["FullAddress"].ToString();
                lblAddress0.Text = dtAdd.Rows[0]["VillageName"].ToString() + ", " + dtAdd.Rows[0]["Blockname"].ToString() + ", " + dtAdd.Rows[0]["DistrictName"].ToString() + ", " + dtAdd.Rows[0]["StateName"].ToString() + ", " + dtAdd.Rows[0]["PinCode"].ToString() + ". ";

                Random t_Random = new Random();
                string t_UnqNo = "";
                int i;
                for (i = 1; i < 7; i++)
                {
                    t_UnqNo += t_Random.Next(0, 9).ToString();
                }

                DocumentVerification.StudentDetailsWS m_DocumentVerification = new DocumentVerification.StudentDetailsWS();
                DataTable t_Dt = m_DocumentVerification.ViewStudentDetails(RegNo, t_Name, t_Year, "Diploma", t_UnqNo);
                if (t_Dt.Rows.Count != 0)
                {
                    if (t_Dt.Rows[0]["RegistrationNumber"].ToString() == null || t_Dt.Rows[0]["RegistrationNumber"].ToString() == "")
                    {

                        DataTable l_dt = m_DivisionalCertificateBLL.GetlegacyVerification(m_AppID);

                        if (l_dt.Rows.Count != 0)
                        {
                            lblRegistration.Text = l_dt.Rows[0]["RegistrationNumber"].ToString();
                            lblName.Text = l_dt.Rows[0]["StudentName"].ToString();
                            //lblfname.Text = l_dt.Rows[0]["FatherName"].ToString();
                            lblInstitute.Text = l_dt.Rows[0]["InstituteName"].ToString();
                            lblBranch.Text = l_dt.Rows[0]["BranchName"].ToString();
                            lblDivision.Text = l_dt.Rows[0]["Division"].ToString();
                            lblYear.Text = l_dt.Rows[0]["YearofPassing"].ToString();
                            //lblSession.Text = l_dt.Rows[0]["Session"].ToString() + " - " + t_Year;
                        }
                        else
                        {
                            string t_URL = "/WebApp/G2G/DTE/DMASForm.aspx?SvcID=371";
                            string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Document Verification.";
                            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);

                        }
                    }
                    else
                    {

                        lblRegistration.Text = t_Dt.Rows[0]["RegistrationNumber"].ToString();
                        lblName.Text = t_Dt.Rows[0]["StudentName"].ToString();
                        lblInstitute.Text = t_Dt.Rows[0]["NameofInstitute"].ToString();
                        lblBranch.Text = t_Dt.Rows[0]["Branch"].ToString();
                        lblDivision.Text = t_Dt.Rows[0]["Division"].ToString();
                        lblYear.Text = t_Dt.Rows[0]["YearofPassing"].ToString();

                        

                    }
                    try { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
                    catch { }
                }

            }
        }
    }
}