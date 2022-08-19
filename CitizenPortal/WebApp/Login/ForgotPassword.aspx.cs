using CitizenPortalLib.BLL;
using CitizenPortalLib.ServiceInterface;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Net.Mail;
using System.Security.Cryptography;
using System.ServiceModel;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;

namespace CitizenPortal.WebApp.Login
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());
        string OTPText = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                P();
            }
        }

        public void GenerateOTP()
        {

            Random random = new Random();
            int i;
            for (i = 1; i < 7; i++)
            {
                OTPText += random.Next(0, 9).ToString();
            }
            ViewState["OTPText"] = OTPText;
        }

        private void SendSMS(string MobileNo, string Message)
        {
            try
            {
                CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();
                test.sendsms(MobileNo, Message);//TODO: SMS Logic to be improved, wherein, the ServiceID, ProfileID, Application ID is to be saved in the SMS Table, for storing details for each SMS.
            }
            catch (Exception Ex)
            {
                //throw Ex;
            }
        }
        protected void btnProceed_Click(object sender, EventArgs e)
        {
            if (txtRollNo.Text == "" && txtAdmissionNumber.Text == "")
            {
                Response.Write("<script>alert('Please Enter Roll No or Admission No...')</script>");
            }
            else
            {
                if (Session["LoginCaptchaTest"].ToString() != txtCaptcha.Text.Trim())
                {
                    string m_Message = "Incorrect Captcha Code. Please Re-Enter Captcha Code!";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                    txtCaptcha.Text = "";
                    return;
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("GetMobileNoSP", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@RollNo", SqlDbType.VarChar).Value = txtRollNo.Text;
                    cmd.Parameters.Add("@AdmissionNo", SqlDbType.VarChar).Value = txtAdmissionNumber.Text;
                    con.Open();
                    string OTPMsg;
                    GenerateOTP();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    string str = string.Empty;
                    string str1 = string.Empty;
                    string str2 = string.Empty;
                    if (dt.Rows.Count > 0)
                    {
                        step2.Visible = true;
                        step1.Visible = false;
                        step4.Visible = false;
                        OTPMsg = "Dear Student, your OTP for login is : " + OTPText + " . From: Chhattisgarh Swami Vivekanad Technical University.";
                        SendSMS(dt.Rows[0]["Mobile"].ToString(), OTPMsg);
                        str = dt.Rows[0]["Mobile"].ToString().Remove(2, 6);
                        str1 = str.Remove(0, 2);
                        str = str.Remove(2, 2);
                        str2 = str + "-XXX-XXX-" + str1;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + "OTP has sent to your registered mobile number " + str2 + "." + "');", true);
                    }
                    else
                    {
                        step2.Visible = false;
                        step1.Visible = true;
                        step4.Visible = false;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + "Enter Correct Roll No or Admission No..." + "');", true);
                    }
                }
            }
        }

        protected void btnBackLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Login#");
        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            string str = ViewState["OTPText"].ToString(); ;
            if (str == txtVerifyOTP.Text)
            {
                step4.Visible = true;
                step1.Visible = false;
                step2.Visible = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + "OTP did not match." + "');", true);
            }
        }

        public void P()
        {
            Random randomclass = new Random();
            string num = randomclass.Next().ToString();
            Session["SaltKey"] = num;
            // HDNSaltKey.Value = num;
        }
        public static string EncryptSHA256(string value)
        {
            string p = "";
            var message = Encoding.ASCII.GetBytes(value);
            SHA256Managed hashString = new SHA256Managed();
            string hex = "";

            var hashValue = hashString.ComputeHash(message);
            foreach (byte x in hashValue)
            {
                hex += String.Format("{0:x2}", x);
            }

            p = hex;

            return p;
        }
        protected void btnResetPwd_Click(object sender, EventArgs e)
        {
            LoginBLL login = new LoginBLL();
            string AuthenticateUserPass = login.AuthenticateUserEncryptPass(txtLoginID.Text, "G2G");
            string Curretntpass = txtConfPwd.Text;
            string pwd1 = AuthenticateUserPass;

            {
                string SaltKey = "";// HDNSaltKey.Value;
                                    //Code after password authenticate
                DataTable DT = null;
                DT = login.GetChangePasswordDetail(txtLoginID.Text, AuthenticateUserPass, Curretntpass, "G2G", 2, "");

                //DT = m_LogieBLL.GetChangePasswordDetail(txtUserName.Text, txtcurrentpass.Text, txtconfirmpass.Text);

                if (DT.Rows.Count == 0)
                {
                    lblMsg.Text = "*Invalid User Id & Password.";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblMsg.Text = "*Password Successfully Changed.";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
                    string m_Message = "Password Changed!!!";
                    //Session.Abandon();
                    //Session.Clear();
                    //Session.RemoveAll();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='/Account/Login#';", true);
                }
            }
        }
    }
}