using CitizenPortalLib.BLL;
using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Entrance.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                try
                {
                    P();

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable DT = null;
            lblmsg.Text = "";

            if (captcha.Text != Session["LoginCaptchaTest"].ToString())
            {
                P();
                lblmsg.Text = "*Invalid Captcha Entered. Please Enter Captcha Again!!!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Attributes.Add("style", "margin-bottom: 10px; display: block;");
                captcha.Text = "";
                return;
            }

            LoginBLL login = new LoginBLL();
            int Flag = 1;
            int loginStatus = 1;

            DataSet ds = new DataSet();


            Flag = 1;


            ds = login.UserSaltKeyAndPassCSVTU(txtLoginID.Text, Flag);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                string dbPassword = ds.Tables[0].Rows[0]["EncryptPass"].ToString();
                string SaltKey = ds.Tables[0].Rows[0]["SaltKey"].ToString();

                string pwd1 = dbPassword;
                //use same process as on .aspx page.
                string pwd2 = pwd1;//getMd5Hash(pwd1);
                string pwd3 = EncryptSHA256(Session["SaltKey"].ToString());
                string enterdpass = txtPassword.Text;
                pwd2 = EncryptSHA256(pwd2.ToLower() + pwd3.ToLower());//now convert both value into md5 again
                if (enterdpass == pwd2)//match both md5 value is same
                {
                    //Code after password authenticate
                    //successfullyLogin = 0;
                    loginStatus = 0;
                    login.AuditTrialStatus(Request.UserHostAddress, txtLoginID.Text, txtLoginID.Text, "Success", "OCAP OUAT");
                }
                else
                {
                    lblmsg.Text = "*Invalid Username or Password!!!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    lblmsg.Attributes.Add("style", "margin-bottom: 10px; display: block;");
                    captcha.Text = "";

                    login.AuditTrialStatus(Request.UserHostAddress, txtLoginID.Text, txtLoginID.Text, "Fail", "OCAP OUAT");
                }


                if (loginStatus == 0)
                {
                    string ReturnURL = "";
                    //// Solution for Session Fixation Step 1 
                    string strAuthToken = Guid.NewGuid().ToString();
                    Session["AuthToken"] = strAuthToken;
                    Response.Cookies.Add(new HttpCookie("AuthToken", strAuthToken));
                    AssignSessionValuesCitizen(txtLoginID.Text);
                    ReturnURL = ds.Tables[0].Rows[0]["ReturnURL"].ToString();
                    if (Session["HomePage"] == null)
                    {
                        Session["HomePage"] = ReturnURL;
                    }
                    Response.Redirect(ReturnURL);

                    //Response.Redirect("~/WebApp/Citizen/Forms/Dashboard.aspx?UID="+ Session["ProfileID"].ToString());
                }
            }
            else
            {
                lblmsg.Text = "*Invalid Username or Password!!!";
                lblmsg.ForeColor = System.Drawing.Color.Red;
                lblmsg.Attributes.Add("style", "margin-bottom: 10px; display: block;");
                captcha.Text = "";
            }

        }
        void AssignSessionValuesCitizen(string LoginID)
        {
            System.Data.DataTable t_DT;

            LoginBLL login = new LoginBLL();
            t_DT = login.GetCitizenDetailCSVTU(LoginID);

            Session["CitizenID"] = t_DT.Rows[0]["LoginID"].ToString();
            Session["LoginID"] = t_DT.Rows[0]["LoginID"].ToString();
            Session["FullName"] = t_DT.Rows[0]["FullName"].ToString();
            //Session["G2GRole"] = t_DT.Rows[0]["G2GRole"].ToString();
            Session["Role"] = t_DT.Rows[0]["Role"].ToString();
            Session["CurrentCulture"] = "en-GB";
            Session["__SessionHelper__"] = "";
            Session["sRole"] = t_DT.Rows[0]["Role"].ToString();
            Session["UserType"] = "CITIZEN";
            Session["ProfileID"] = t_DT.Rows[0]["ProfileID"].ToString();
            Session["ApplicationType"] = "OUAT";

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