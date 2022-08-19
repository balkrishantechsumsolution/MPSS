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

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class CollegeProfile : BasePage
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

        string LoginID = "";
        int Department;
        string t_strFilename = "", RawPath = "";
        string t_Path = "", t_File = "";
        string StrKeyField = Guid.NewGuid().ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                BindDistrict("22");
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
            dt = m_AdmissionFormBLL.GetCollegeProfile(LoginID);
            if (dt.Rows.Count > 0)
            {
                txtCollegeCode.Text = dt.Rows[0]["College_Code"].ToString();
                txtCollege.Text = dt.Rows[0]["CollegeName"].ToString();
                txtMobile.Text = dt.Rows[0]["MobileNo"].ToString();
                txtPhone.Text = dt.Rows[0]["PhoneNo"].ToString();
                txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
                //ddlDistrict.SelectedItem.Text = dt.Rows[0]["DistrictCode"].ToString();
                ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(dt.Rows[0]["DistrictCode"].ToString()));
                ddlType.SelectedValue = dt.Rows[0]["CollegeType"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtCollegeCode.Enabled = false;
                txtCollege.Enabled = false;
            }
        }
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string[] AFields =
                {
                     "CollegeCode"
                    ,"CollegeName"
                    ,"MobileNo"
                    ,"PhoneNo"
                    ,"EmailID"
                    ,"District"
                    ,"DistrictCode"
                    ,"CollegeType"
                    ,"Address"
                    ,"CreatedBy"

                };

                SUCollege_DT t_SUCollege_DT = new SUCollege_DT();
                t_SUCollege_DT.CollegeCode = txtCollegeCode.Text.Trim();
                t_SUCollege_DT.CollegeName = txtCollege.Text.Trim();
                t_SUCollege_DT.MobileNo = txtMobile.Text.Trim();
                t_SUCollege_DT.PhoneNo = txtPhone.Text.Trim();
                t_SUCollege_DT.EmailID = txtEmail.Text.Trim();
                t_SUCollege_DT.District = ddlDistrict.SelectedItem.Text;
                t_SUCollege_DT.DistrictCode = ddlDistrict.SelectedValue;
                t_SUCollege_DT.CollegeType = ddlType.SelectedValue;
                t_SUCollege_DT.Address = txtAddress.Text.Trim();
                t_SUCollege_DT.CreatedBy = LoginID;

                System.Data.DataTable result = null;
                string UID = "";

                result = m_AdmissionFormBLL.UpdateCollegeProfile(t_SUCollege_DT, AFields);

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

                    txtCollegeCode.Text = "";
                    txtCollege.Text = "";
                    txtMobile.Text = "";
                    txtPhone.Text = "";
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
