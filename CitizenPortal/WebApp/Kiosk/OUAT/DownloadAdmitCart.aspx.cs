﻿using CitizenPortalLib;
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
    public partial class DownloadAdmitCart : System.Web.UI.Page
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.QueryString["AppID"] == null) return;
            //if (Request.QueryString["SvcID"] == null) return;

            //m_AppID = Request.QueryString["AppID"].ToString();
            //m_ServiceID = Request.QueryString["SvcID"].ToString();

            //if (!IsPostBack)
            //{
            //    divErr.Style.Add("display", "none");
            //}
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
                string m_Message = "Please enter Applicant Date of Birth, Registered Mobile Number to access Provisional Weightage & Rank for OUAT UG Course.";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (txtRollNO.Text == "" && txtLogin.Text == "" && txtBirthDate.Text == "" && txtAppID.Text == "" && txtMobile.Text == "")
            {
                string m_Message = "Please enter at least three fields to access Provisional Weightage & Rank for OUAT UG Course";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (captcha.Text == "")
            {
                string m_Message = "Please enter captcha to access Provisional Weightage & Rank for OUAT UG Course";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (Session["LoginCaptchaTest"] == null)
            {
                string m_Message = "Invalid Captcha. Please Refresh the Page to access Provisional Weightage & Rank for OUAT UG Course";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                return;
            }

            if (captcha.Text != Session["LoginCaptchaTest"].ToString())
            {
                string m_Message = "Invalid Captcha. Please Refresh the Page to access Provisional Weightage & Rank for OUAT UG Course";
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
                t_Result = m_OUATBLL.GetOUATAppID(txtLogin.Text, BirthDate, txtAppID.Text, txtMobile.Text, txtRollNO.Text, ExamType);

                if (t_Result != null && t_Result.Rows.Count > 0)
                {
                    if (t_Result.Rows[0]["Result"].ToString() != "")
                    {
                        m_ServiceID = t_Result.Rows[0]["ServiceID"].ToString();
                        m_AppID = t_Result.Rows[0]["Result"].ToString();
                        Response.Redirect("/WebApp/Kiosk/OUAT/ProvisionalMark.aspx?SvcID=" + m_ServiceID + "&AppID=" + m_AppID);
                    }
                    else
                    {
                        string m_Message = "Sorry! Provisional Weightage & Rank for OUAT UG Course not found.";
                        divErr.InnerHtml = m_Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                    }
                }
                else
                {
                    string m_Message = "No record found againt the data entered. Please enter correct information to access Provisional Weightage & Rank for OUAT UG Course.";
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