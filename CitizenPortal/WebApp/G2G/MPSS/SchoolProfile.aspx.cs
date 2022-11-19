using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.DataStructs;
using CitizenPortal.Services;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System.IO;

namespace CitizenPortal.WebApp.G2G.MPSS
{
    public partial class CollegeProfile : System.Web.UI.Page //BasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        MPSSBLL m_MPSSBLL = new MPSSBLL();

        string LoginID = "";
        int Department;
        string t_strFilename = "", RawPath = "";
        string t_Path = "", t_File = "";
        string StrKeyField = Guid.NewGuid().ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();
            //Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                BindDistrict("23");
                BindGrid();
            }
        }
        private void BindDistrict(string districtcode)
        {
            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState(districtcode);

            ddlDistrict.DataTextField = "DistrictName";
            ddlDistrict.DataValueField = "DistrictCode";
            ddlDistrict.DataSource = dtDistrict;
            ddlDistrict.DataBind();

            ddlDistrict.Items.Insert(0, new ListItem("-Select-", "0"));
        }

        private void BindGrid()
        {
            DataTable dt = null;
            dt = m_AdmissionFormBLL.GetSchoolProfile(LoginID);
            if (dt.Rows.Count > 0)
            {
                txtSchoolCode.Text = dt.Rows[0]["SchoolCode"].ToString();
                txtSchoolE.Text = dt.Rows[0]["SchoolNameEnglish"].ToString();
                txtSchoolH.Text = dt.Rows[0]["SchoolNameHindi"].ToString();
                txtMobile.Text = dt.Rows[0]["PrincipalMobile"].ToString();
                txtFax.Text = dt.Rows[0]["SchoolFax"].ToString();
                txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
                //ddlDistrict.SelectedItem.Text = dt.Rows[0]["DistrictCode"].ToString();
                ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(dt.Rows[0]["DistrictCode"].ToString()));
                ddlType.SelectedValue = dt.Rows[0]["SchoolType"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtSchoolCode.Enabled = false;
                txtCertificateNo.Text = dt.Rows[0]["CertificateNumber"].ToString();
                txtIssueDate.Text = dt.Rows[0]["CertificateIssuedDate"].ToString();
                txtPrincipal.Text = dt.Rows[0]["PrincipalName"].ToString();                
                txtURL.Text = dt.Rows[0]["SchoolURL"].ToString();
                txtPin.Text = dt.Rows[0]["PinCode"].ToString();
            }
        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string[] AFields =
                {
                     "SchoolCode",
                        "SchoolEnglish",
                        "SchoolHindi",
                        "MobileNo",
                        "PhoneNo",
                        "EmailID",
                        "District",
                        "DistrictCode",
                        "CollegeType",
                        "Address",
                        "CreatedBy"

                };

                SchoolDetail_DT t_ObjDT = new SchoolDetail_DT();
                t_ObjDT.SchoolCode = txtSchoolCode.Text.Trim();
                t_ObjDT.SchoolEnglish = txtSchoolE.Text.Trim();
                t_ObjDT.SchoolHindi = txtSchoolH.Text.Trim();
                t_ObjDT.MobileNo = txtMobile.Text.Trim();
                t_ObjDT.PhoneNo = txtFax.Text.Trim();
                t_ObjDT.EmailID = txtEmail.Text.Trim();
                t_ObjDT.District = ddlDistrict.SelectedItem.Text;
                t_ObjDT.DistrictCode = ddlDistrict.SelectedValue;
                t_ObjDT.CollegeType = ddlType.SelectedValue;
                t_ObjDT.Address = txtAddress.Text.Trim();
                t_ObjDT.CreatedBy = LoginID;

                System.Data.DataTable result = null;
                string UID = "";

                result = m_MPSSBLL.UpdateSchoolProfile(t_ObjDT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string text;
                        string m_Mobile = result.Rows[0]["MobileNo"].ToString();
                        string m_SMSText = result.Rows[0]["SMSText"].ToString();
                        string m_EmailID = result.Rows[0]["EmailID"].ToString();
                        string m_Subject = result.Rows[0]["Subject"].ToString();
                        string m_MailText = result.Rows[0]["MailText"].ToString();

                        string CCMailID = result.Rows[0]["CCMailID"].ToString();
                        string BCCMailID = result.Rows[0]["BCCMailID"].ToString();

                        if (m_Mobile != null || m_Mobile != "")
                        {
                            CommonUtility.SendSMSSU(m_Mobile, m_SMSText);
                        }

                        if (m_EmailID != "" && m_Subject != "" && m_MailText != "")
                        {
                            CitizenPortalLib.CommonUtility.SendEmailWithAttachment("", "", "", m_EmailID, CCMailID, BCCMailID,
                                m_Subject, m_MailText, true, null);
                        }

                        //string m_Message = "Record Saved Sucessfully!";
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);

                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                        "alert('Profile Updated Successfully.');location.href='/WebApp/G2G/SU/SUDashboard.aspx'", true);

                    }

                    txtSchoolCode.Text = "";
                    txtSchoolE.Text = "";
                    txtSchoolH.Text = "";
                    txtMobile.Text = "";
                    txtFax.Text = "";
                    txtEmail.Text = "";
                    ddlDistrict.SelectedValue = "0";
                    ddlType.SelectedValue = "0";
                    txtAddress.Text = "";
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }

        }
              

    }
}
