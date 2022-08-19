using System;
using System.Web.UI;
using System.Data;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System.Web.Script.Services;
using System.Web.Services;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace CitizenPortal.WebApp.G2G
{
    public partial class ChangePassword : AdminBasePage
    {
        LoginBLL l_login = new LoginBLL();
        string t_LoginID;
        string t_UserType;
        protected void Page_Load(object sender, EventArgs e)
        {
            t_LoginID = Session["LoginID"].ToString();
            t_UserType = Session["Role"].ToString();
            HdnField.Value = t_LoginID.ToString();
            //Add logic for password encryption 

            if (!Page.IsPostBack)
            {
                try
                {
                    P();
                    Session.Add("RandomNo", 0);
                    Random randomclass = new Random();
                    Session["RandomNo"] = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(randomclass.Next().ToString(), "MD5");
                    //end of md5 encryption
                    hdnRandomNo.Value = Session["RandomNo"].ToString();
                    //btnchangepass.Attributes.Add("onclick", "javascript:return md5auth('" + Convert.ToString(Session["RandomNo"]) + "');");

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else
            {


                ClientScript.RegisterClientScriptBlock(this.GetType(), Guid.NewGuid().ToString(), "isPostBack = true;", true);
            }
            //End logic

            Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
        public string CompareRandomNoPwd(string strPassword)
        {
            string strHash = null;
            string pwd1="";
            if (l_login.IsValidMD5(strPassword))
            {
                pwd1 = strPassword;
            }
            else
            {
                pwd1 = l_login.getMd5Hash(strPassword);
            }
            //string RandomNo = Session["RandomNo"].ToString();
            string RandomNo = hdnRandomNo.Value + pwd1.ToUpper();
            return strHash = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(RandomNo, "MD5");
        }
        protected void btnchangepass_Click(object sender, EventArgs e)
        {
            //lblmsg.Text = "";
            //DataTable DT = new DataTable();

            //if (captcha.Text != Session["LoginCaptchaTest"].ToString())
            //{
            //    lblmsg.Text = "*Please Refresh the Page To Genetate Fresh Captcha";
            //    lblmsg.ForeColor = System.Drawing.Color.Red;
            //    return;
            //}

            //DT = l_login.GetChangePasswordDetail(t_LoginID, txtcurrentpass.Text, txtconfirmpass.Text, t_UserType, 1);

            //if (DT.Rows.Count == 0)
            //{
            //    lblmsg.Text = "*Invalid User Id & Password.";
            //    lblmsg.ForeColor = System.Drawing.Color.Red;
            //}
            //else
            //{
            //    lblmsg.Text = "*Password Successfully Changed!!!";
            //    lblmsg.ForeColor = System.Drawing.Color.Green;
            //    string m_Message = "Password Changed. Click OK To Confirm Password On Home Page!!!";
            //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            //    //Response.Write("<script LANGUAGE='JavaScript' >alert('Password Changed. You Will Be Redirect To HomePage To Confirm Login!!!')</script>");
            //    Session.Abandon();
            //    Session.Clear();
            //    Session.RemoveAll();
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='/g2c/forms/index.aspx';", true);
            //}


            lblmsg.Text = "";

            DataTable DT = null;

            if (captcha.Text != Session["LoginCaptchaTest"].ToString())
            {
                P();
                lblmsg.Text = "*Invalid Captcha Entered. Please Enter Captcha Again!!!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                captcha.Text = "";
                return;
            }

            ////Add Logic for encryption
            //byte[] PasswordHash;
            //using (SHA512Managed sha = new SHA512Managed())
            //{
            //    if (hdnfldPass.Value != "")
            //    {
            //        byte[] dataToHashNewPwd = Encoding.UTF8.GetBytes(hdnfldPass.Value);
            //        PasswordHash = sha.ComputeHash(dataToHashNewPwd);
            //    }
            //    else
            //    {
            //        PasswordHash = null;
            //    }
            //}


            //End LOgic
            //DataTable dtPass = null;
            //if (Session["LoginID"] != null)
            //{
            //    dtPass = l_login.GetPassword(Session["LoginID"].ToString(), "Y", "", "G2G");
            //    if (dtPass.Rows.Count > 0)
            //    {
            //        string pass = dtPass.Rows[0]["Password"].ToString();
            //        if (CompareRandomNoPwd(pass).ToUpper() == txtcurrentpass.Text.ToUpper())
            //        {
            //            DT = l_login.GetChangePasswordDetailEncrypt(t_LoginID, pass, txtnewpass.Text, txtconfirmpass.Text, t_UserType, 1);

            //            if (DT.Rows.Count == 0)
            //            {
            //                lblmsg.Text = "*Invalid User Id & Password.";
            //                lblmsg.ForeColor = System.Drawing.Color.Red;
            //            }
            //            else
            //            {
            //                lblmsg.Text = "*Password Successfully Changed.";
            //                lblmsg.ForeColor = System.Drawing.Color.Green;
            //                string m_Message = "Password Changed. Click OK To Confirm Password On Home Page!!!";
            //                Session.Abandon();
            //                Session.Clear();
            //                Session.RemoveAll();
            //                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='/g2c/forms/index.aspx';", true);
            //            }
            //        }
            //    }
            //}
            LoginBLL login = new LoginBLL();

            string AuthenticateUserPass = login.AuthenticateUserEncryptPass(t_LoginID, t_UserType);
            string Curretntpass = txtcurrentpass.Text;
            string pwd1 = AuthenticateUserPass;
            string pwd3 = EncryptSHA256(Session["SaltKey"].ToString());//convert Rndno into md5
            string pwd2 = EncryptSHA256(pwd1.ToLower() + pwd3.ToLower());
            if (Curretntpass == pwd2)//match both md5 value is same
            {
                string SaltKey = "";// HDNSaltKey.Value;
                //Code after password authenticate
                DT = l_login.GetChangePasswordDetail(t_LoginID, AuthenticateUserPass, txtconfirmpass.Text, t_UserType, 1, SaltKey);
                //DT = l_login.GetChangePasswordDetail(t_LoginID, txtcurrentpass.Text, txtconfirmpass.Text, t_UserType, 1);


                if (DT.Rows.Count == 0)
                {
                    lblmsg.Text = "*Invalid User Id & Password.";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblmsg.Text = "*Password Successfully Changed.";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    string m_Message = "Password Changed. Click OK To Confirm Password On Home Page!!!";
                   
                    Session.Clear();
                    Session.Abandon();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='/Sambalpur/index.aspx';", true);
                }
            }

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetDeptUserCount(string LoginId, string Password, int Flag)
        {
            string a = "0";
           LoginBLL t_login = new LoginBLL();
            DataTable DT = null;
            string pwd1 = "";
            DataTable dtPass = t_login.GetPassword(HttpContext.Current.Session["LoginID"].ToString(), "Y", "", "G2G");
            string pass = dtPass.Rows[0]["Password"].ToString();

            if (!t_login.IsValidMD5(pass))
            {
                pwd1 = Password;
            }
            else
            {
                pwd1 = t_login.getMd5Hash(Password);
            }
            DT = t_login.ValidateLoginDetail(LoginId, pwd1, 1);
            a = DT.Rows[0]["userCount"].ToString();             
           
            return a.ToString();
        }
        public void P()
        {
            Random randomclass = new Random();
            string num = randomclass.Next().ToString();
            Session["SaltKey"] = num;
            // HDNSaltKey.Value = num;
        }
        //Encrypt string in javascript and C# by the same way sha256 to get same results
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
    }
}