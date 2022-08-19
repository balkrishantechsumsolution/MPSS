using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;

namespace CitizenPortal.WebApp.Login
{
    public partial class ChangePassword : BasePage
    {
        LoginBLL t_login = new LoginBLL();
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
                    //btnchangepass.Attributes.Add("onclick", "javascript:return md5authlogin('" + Convert.ToString(Session["RandomNo"]) + "');");

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
            //string RandomNo = Session["RandomNo"].ToString();
            string RandomNo = hdnRandomNo.Value + strPassword;
            return strHash = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(RandomNo, "MD5");
        }

        //protected void txtcurrentpass_TextChanged(object sender, EventArgs e)
        //{
        //    DataTable DT = null;

        //    DT = t_login.ValidateLoginDetail(t_LoginID, txtcurrentpass.Text, 2);

        //    if (DT.Rows[0]["usercount"].ToString() == "0")
        //    {
        //        lblmsg.Text = "*Current Password Not Matched In Database.";
        //        lblmsg.ForeColor = System.Drawing.Color.Red;
        //        return;
        //    }
        //    lblmsg.Text = "";
        //}

        protected void btnchangepass_Click(object sender, EventArgs e)
        {
            //lblmsg.Text = "";
            //string strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;
            //SqlDataAdapter SQLAdapter = new SqlDataAdapter("select * from CitizenUserMasterTB where Password='" + txtcurrentpass.Text + "'", strConnString);
            //DataTable DT = new DataTable();
            //SQLAdapter.Fill(DT);

            //if (captcha.Text != Session["LoginCaptchaTest"].ToString())
            //{
            //    lblmsg.Text= "*Please Refresh the Page Genetate Fresh Captcha";
            //    lblmsg.ForeColor = System.Drawing.Color.Red;
            //    return;
            //}

            //if (DT.Rows.Count == 0)
            //{
            //    lblmsg.Text = "Invalid current password";
            //    lblmsg.ForeColor = System.Drawing.Color.Red;
            //}
            //else
            //{
            //    SQLAdapter = new SqlDataAdapter("update CitizenUserMasterTB set Password='" + txtnewpass.Text + "' where LoginId='" + t_LoginID + "'", strConnString);
            //    SQLAdapter.Fill(DT);
            //    lblmsg.Text = "Password Changed Successfully";
            //    lblmsg.ForeColor = System.Drawing.Color.Green;
            //    //string m_Message = "Password Changed. You Will Redirect To HomePage To Confirm Login";
            //    //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
            //    Response.Write("<script LANGUAGE='JavaScript' >alert('Password Changed. You Will Be Redirect To HomePage To Confirm Login!!!')</script>");
            //    Session.Abandon();
            //    Session.Clear();
            //    Session.RemoveAll();
            //    Response.Redirect("~/g2c/forms/index.aspx");
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
                DT = login.GetChangePasswordDetail(t_LoginID, AuthenticateUserPass, txtconfirmpass.Text, t_UserType, 2, SaltKey);
                //DT = t_login.GetChangePasswordDetail(t_LoginID, txtcurrentpass.Text, txtconfirmpass.Text, t_UserType, 2);
                //DT = t_login.GetChangePasswordDetailEncrypt(t_LoginID, txtcurrentpass.Text, hdnfldPass.Value, txtconfirmpass.Text, t_UserType, 2);

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
                    //Session.Abandon();
                    //Session.Clear();
                    //Session.RemoveAll();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='/g2c/forms/index.aspx';", true);
                }
            }
        }


        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string GetCitizenUserCount(string LoginId, string Password, int Flag)
        {
            LoginBLL t_login = new LoginBLL();
            DataTable DT = null;
            DT = t_login.ValidateLoginDetail(LoginId, Password, 2);
            string a=DT.Rows[0]["userCount"].ToString();
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