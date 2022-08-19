using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Enrolement
{
    public partial class SearchForm : System.Web.UI.Page
    {
        EnrolementBLL enrolementBAL = new EnrolementBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBranch();
            }
        }


        protected void BindBranch()
        {
            DataTable dtBranch = enrolementBAL.GetBranchList();
            ddlBranch.DataValueField = "BranchCode";
            ddlBranch.DataTextField = "BranchName";
            ddlBranch.DataSource = dtBranch;
            ddlBranch.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["LoginCaptchaTest"] != null)
            {
                if (Session["LoginCaptchaTest"].ToString() == captcha.Text.Trim())
                {
                    string SvcID = "1456";
                    string DOB = string.Empty;
                    if (txtBirthDate.Text.Trim() == "" || txtBirthDate.Text.Trim() == null)
                    {
                        DOB = System.DateTime.Now.ToString();
                    }
                    else
                    {
                        DOB = Convert.ToDateTime(txtBirthDate.Text.Trim()).ToString();
                    }
                    DataTable dt = enrolementBAL.SearchStudentEnrolementSP(txtEnrolementNumber.Text.Trim(), txtStudentName.Text.Trim(), txtMobileNo.Text.Trim(), Convert.ToDateTime(DOB), ddlBranch.SelectedValue);
                    if (dt.Rows.Count >= 1)
                    {
                        if (dt.Rows[0]["Count"].ToString() == "2")
                        {
                            Response.Write("<script>alert('You are already registered, Please Login.')</script>");
                        }
                        else
                        {
                            //gvShow.DataSource = dt;
                            //gvShow.DataBind();
                            Response.Redirect("~/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=" + SvcID + "&RollNo=" + txtEnrolementNumber.Text.Trim() + "&BranchCode=" + ddlBranch.SelectedValue);
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Roll Number or Name.')</script>");
                    }
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", " alertPopup('Invalid Captcha', 'Please enter valid captcha code.');", true);
                }
            }
        }
    }
}