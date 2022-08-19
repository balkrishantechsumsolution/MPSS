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

namespace CitizenPortal.WebApp.KIOSK.CBCS
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
            txtCollege.Text = LoginID.Substring(0, 3);
            txtCollege.Enabled = false;
            if (!IsPostBack)
            {                
                //BindGrid();
            }
        }
        

        //private void BindGrid()
        //{
        //    DataTable dt = null;
        //    dt = m_AdmissionFormBLL.GetCollegeProfile(LoginID);

        //    txtCollegeCode.Text = dt.Rows[0]["College_Code"].ToString();
        //    txtCollege.Text = dt.Rows[0]["CollegeName"].ToString();
        //    txtMobile.Text = dt.Rows[0]["MobileNo"].ToString();
        //    txtPhone.Text = dt.Rows[0]["PhoneNo"].ToString();
        //    txtEmail.Text = dt.Rows[0]["EmailID"].ToString();
        //    //ddlDistrict.SelectedItem.Text = dt.Rows[0]["DistrictCode"].ToString();
        //    ddlDistrict.SelectedIndex = ddlDistrict.Items.IndexOf(ddlDistrict.Items.FindByValue(dt.Rows[0]["DistrictCode"].ToString()));
        //    ddlType.SelectedValue = dt.Rows[0]["CollegeType"].ToString();
        //    txtAddress.Text = dt.Rows[0]["Address"].ToString();
        //    txtCollegeCode.Enabled = false;
        //    txtCollege.Enabled = false;

        //}
        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtAffiliationNo.Text == "" || ddlYear.SelectedIndex == 0 || txtFile.FileName == "")
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", " alert('Please check the mandatory fields.');", true);
                    return;
                }

                string base64String = "";
                if (txtFile.HasFile)
                {
                    //if (txtFile.) { }
                    BinaryReader br = new BinaryReader(txtFile.PostedFile.InputStream);
                    byte[] bytes = br.ReadBytes((int)txtFile.PostedFile.InputStream.Length);

                    //Convert the Byte Array to Base64 Encoded string.
                    base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                }

                string[] AFields =
                {
                     "CollegeCode"
                    ,"AffiliationNo"
                    ,"AffiliationYear"
                    ,"AffiliationFile"
                    ,"Remark"
                    ,"CreatedBy"

                };

                CollegeAffiiation_DT t_CollegeAffiiation_DT = new CollegeAffiiation_DT();
                t_CollegeAffiiation_DT.CollegeCode = LoginID.Substring(0,3);
                t_CollegeAffiiation_DT.AffiliationNo = txtAffiliationNo.Text.Trim();
                t_CollegeAffiiation_DT.AffiliationYear = ddlYear.SelectedValue;
                t_CollegeAffiiation_DT.AffiliationFile = base64String.Trim();
                t_CollegeAffiiation_DT.CreatedBy = LoginID;
                t_CollegeAffiiation_DT.Remark = txtRemark.Text;

                System.Data.DataTable result = null;
                
                result = m_AdmissionFormBLL.InserCollegeAffiliation(t_CollegeAffiiation_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                        "alert('Affiliation Updated Successfully.');location.href='/WebApp/KIOSK/CBCS/DEOAdmissionForm.aspx'", true);

                    }

                  
                    txtCollege.Text = "";
                    txtAffiliationNo.Text = "";
                    ddlYear.SelectedIndex = 0;
                    txtRemark.Text = "";
                    
                }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }

        }
              

    }
}
