using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class AccessFormB : System.Web.UI.Page
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["SvcID"] == null) return;

            //m_AppID = Request.QueryString["AppID"].ToString();
            //m_ServiceID = Request.QueryString["SvcID"].ToString();

            if (!IsPostBack)
            {
                Session.Clear();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if ((!rbtAgroFormA.Checked == true) && (!rbtFormA.Checked == true))
            {
                string m_Message = "Please select Examination Type";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (txtBirthDate.Text == "" || txtMobile.Text == "")
            {
                string m_Message = "Please enter Applicant Date of Birth, Registered Mobile Number to access the OUAT Application FORM-B.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (txtRollNO.Text == "" && txtLogin.Text == "" && txtBirthDate.Text == "" && txtAppID.Text == "" && txtMobile.Text == "") {
                string m_Message = "Please enter at least three fields to access the OUAT Application FORM-B";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (captcha.Text == "")
            {
                string m_Message = "Please enter captcha to access the OUAT Application FORM-B";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (Session["LoginCaptchaTest"] == null)
            {
                string m_Message = "Invalid Captcha. Please Refresh the Page to access the OUAT Application FORM-B";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if(captcha.Text != Session["LoginCaptchaTest"].ToString())
            {
                string m_Message = "Invalid Captcha. Please Refresh the Page to access the OUAT Application FORM-B";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            string BirthDate = "";

            if (txtBirthDate.Text != "" && txtBirthDate.Text != null)
            {
                BirthDate = Convert.ToDateTime(txtBirthDate.Text).ToString("yyyy-MM-dd");                
            }

            string ExamType = "";

            if (rbtAgroFormA.Checked == true)
            {
                ExamType = "Agro";
            }
            else { ExamType = "OUAT"; }

            DataTable t_Result = null;

            //int result = 0;

            try
            {
                t_Result = m_OUATBLL.GetOUATAccesFormB(txtLogin.Text, BirthDate, txtAppID.Text, txtMobile.Text, txtRollNO.Text, ExamType);

                if (t_Result != null && t_Result.Rows.Count > 0)
                {
                    if (t_Result.Rows[0]["Result"].ToString() != "")
                    {
                        string LoginID = "";
                        string ProfileID = "";
                        m_ServiceID = t_Result.Rows[0]["ServiceID"].ToString(); 
                        m_AppID = t_Result.Rows[0]["Result"].ToString();
                        LoginID = t_Result.Rows[0]["LoginID"].ToString();
                        ProfileID = t_Result.Rows[0]["ProfileID"].ToString();
                        System.Data.DataTable t_DT;

                        
                        LoginBLL login = new LoginBLL();
                        t_DT = login.GetCitizenDetail(LoginID);

                        Session["CitizenID"] = t_DT.Rows[0]["LoginID"].ToString();
                        Session["LoginID"] = t_DT.Rows[0]["LoginID"].ToString();
                        Session["FullName"] = t_DT.Rows[0]["FullName"].ToString();
                        //Session["G2GRole"] = t_DT.Rows[0]["G2GRole"].ToString();
                        Session["Role"] = t_DT.Rows[0]["Role"].ToString();
                        Session["CurrentCulture"] = "en-GB";
                        Session["__SessionHelper__"] = "";
                        Session["sRole"] = t_DT.Rows[0]["Role"].ToString();
                        Session["UserType"] = "CITIZEN";

                        if (Session["HomePage"] == null)
                        {
                            Session["HomePage"] = "/WebApp/Citizen/Forms/Dashboard.aspx?UID=" + ProfileID;
                        }

                        Response.Redirect("/WebApp/Kiosk/OUAT/AgroFormB.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID + "&UID=" + ProfileID + "&ProfileID=" + ProfileID);
                    }
                    else
                    {                        
                        string m_Message = "Sorry! No record found against the entered value. You can also access Form-B using your Login Credentials.";
                        divErr.InnerHtml = m_Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                    }
                }
                else
                {
                    string m_Message = "No record found againt the data entered. Please enter correct information to access the OUAT Application FORM-B. You can also access Form-B using your Login Credentials.";
                    divErr.InnerHtml = m_Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                }
            }
            catch (Exception ex)
            {
                btnSubmit.Visible = false;
                divErr.InnerHtml = ex.Message;
                divErr.Style.Add("display", "");
                divErr.Attributes.Add("class", "error");
            }

        }

        protected void btnHome_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("/WebApp/Kiosk/OUAT/OUATHome.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID +
                              "&UID=" + Session["CitizenID"].ToString());
        }
    }
}