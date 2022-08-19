using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.HtmlControls;
using System.Text;
using CitizenPortalLib;
using CitizenPortalLib.DataStructs;
using System;

namespace CitizenPortal.WebApp.Kiosk.CBCS
{
    public partial class BankDetail : System.Web.UI.Page
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

        string LoginID = "";
        int Department;
        string m_Flag = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            //txtExperiance.Text = hdnExperience.Value;
            if (!IsPostBack)
            {
                CollegeList();
                GetBankName();
            }
        }

        public void CollegeList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.Get_CollegeList();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCollege.DataSource = dt;
                    ddlCollege.DataTextField = "CollegeName";
                    ddlCollege.DataValueField = "CollegeCode";
                    ddlCollege.DataBind();
                    ddlCollege.Items.Insert(0, new ListItem("Select", "0"));
                    //if (!Session["LoginID"].ToString().Contains("Admin"))
                    if (Session["menuRole"].ToString() == "College" || Session["menuRole"].ToString() == "Principal")
                    {
                        ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(Session["LoginID"].ToString().Substring(0, 3)));
                        ddlCollege.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void GetBankName()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetBankName();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlBank.DataSource = dt;
                    ddlBank.DataTextField = "BankName";
                    ddlBank.DataValueField = "BankCode";
                    ddlBank.DataBind();
                    ddlBank.Items.Insert(0, new ListItem("Select", "0"));                    
                }
            }
            catch (Exception ex)
            {

            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlCollege.SelectedValue == "0" || ddlBank.SelectedValue == "0" 
                    || txtName.Text.Trim() == "" || txtAccount.Text.Trim() == "" || txtReAccount.Text.Trim() == "" ||txtIFSCCode.Text.Trim() == "" || txtAddress.Text.Trim() == "" || txtPin.Text.Trim() == "" )
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter all mandatory fields');", true);
                    return;
                }            

                if(txtAccount.Text.Trim() != txtReAccount.Text.Trim())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Re-enter Account No does not match with Account No.');", true);
                    return;
                }  

                string[] AFields =
                {
                     "CollegeCode"
                    ,"BankCode"
                    ,"BankName"
                    ,"BankHolderName"
                    ,"AccountNo"
                    ,"BankAddress"
                    ,"PinCode"
                    ,"CreatedBy"
                    ,"IFISCCode"
                };

                BankDetail_DT t_BankDetail_DT = new BankDetail_DT();


                t_BankDetail_DT.CollegeCode = ddlCollege.SelectedValue;
                t_BankDetail_DT.BankCode = ddlBank.SelectedValue;
                t_BankDetail_DT.BankName = ddlBank.SelectedItem.Text;
                t_BankDetail_DT.BankHolderName = txtName.Text.Trim();
                t_BankDetail_DT.AccountNo = txtReAccount.Text;
                //t_BankDetail_DT.DistrictCode = ddlDistrict.SelectedValue;
                //t_BankDetail_DT.TalukaCode = ddlBlock.SelectedValue;
                //t_BankDetail_DT.VillageCode = ddlVillage.SelectedValue;
                t_BankDetail_DT.BankAddress = txtAddress.Text.Trim();
                t_BankDetail_DT.PinCode = txtPin.Text.Trim();
                t_BankDetail_DT.CreatedBy = LoginID;
                t_BankDetail_DT.IFISCCode = txtIFSCCode.Text.Trim();

                System.Data.DataTable result = null;

                result = m_AdmissionFormBLL.InsertCollegeBankDetail(t_BankDetail_DT, AFields);

                if (result != null && result.Rows.Count > 0)
                {
                    if (result.Rows[0]["Result"].ToString() == "1")
                    {
                        string t_Message = result.Rows[0]["AlertMsg"].ToString();

                        ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message",
                        "alert('" + t_Message + "');window.location.href = '/WebApp/G2G/SU/SUDashboardNew.aspx';", true);
                    }

                }
                else { ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Unable to Add/Update Record');", true); }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }

        }
    }
}