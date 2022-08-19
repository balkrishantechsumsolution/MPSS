using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Examination
{
    public partial class SearchStudent : System.Web.UI.Page
    {
        ChangePasswordBLL t_ChangePasswordBLL = new ChangePasswordBLL();
        CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //sp_helptext Login_GetUserDataSP
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string dob = "";
                if (txtBirthDate.Text != "")
                {
                    dob = Convert.ToDateTime(txtBirthDate.Text).ToString("yyyy-MM-dd");
                }
                if (Session["LoginCaptchaTest"] != null)
                {
                    if (Session["LoginCaptchaTest"].ToString() == captcha.Text.Trim())
                    {
                        DataTable dt = t_ChangePasswordBLL.StudentSearch(txtRegNo.Text.Trim(), dob, txtStudentName.Text.Trim(),
                            txtRollNo.Text.Trim(), txtFather.Text.Trim());
                        if (dt != null && dt.Rows.Count > 0)
                        {                            
                            if (dt.Rows[0]["Status"].ToString() == "2")
                            {
                                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", " alertPopup('"+ dt.Rows[0]["Title"].ToString() + "', '"+ dt.Rows[0]["AltMsg"].ToString() + "');", true);
                                //Response.Redirect(dt.Rows[0]["ReturnURL"].ToString());
                            }
                            else
                            {
                                if (Session["role"] != null && Session["role"].ToString().ToUpper() == "VLE") {
                                    Response.Redirect("/WebApp/Enrollment/StudentForm.aspx?SvcID=1468&AppID=" + Convert.ToString(dt.Rows[0]["RollNo"]+"&ReturnURL ="+  Convert.ToString(dt.Rows[0]["ReturnURL"]))); }
                                else
                                {
                                    Response.Redirect("/WebApp/Citizen/Forms/Geustuser.aspx?SvcID=1468&Mode=C&AppID=" + Convert.ToString(dt.Rows[0]["RollNo"]));
                                }
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", " alertPopup('Invalid Request', 'Please provide valid details.');", true);
                            captcha.Text = "";
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", " alertPopup('Invalid Captcha', 'Please enter valid captcha code.');", true);
                        captcha.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                captcha.Text = "";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", " alertPopup('Exception!', '"+ ex.Message + "');", true);
            }
        }
    }
}