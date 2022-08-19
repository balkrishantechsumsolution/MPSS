using CitizenPortal.Security;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CitizenPortalLib.CommonFunction;


namespace CitizenPortal.WebApp.Login
{
    public partial class Login : System.Web.UI.Page
    {
        private string lStrSalt = string.Empty;

        public static List<SaltKeyEntry> ObjSaltKey = new List<SaltKeyEntry>();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //System.Web.SessionState.SessionIDManager manager = new System.Web.SessionState.SessionIDManager();
                //Session.Abandon();
                //Session.Clear();
                //Session.RemoveAll();
                //return;
            }

            if (Session["Tokenno_CSRF"] == null)
            {
                SaltKeyHandler.SaltKeyRemove(ref ObjSaltKey);
                lStrSalt = SaltKeyHandler.RandomString(16);
                //SaltKeyHandler.SaltKeyAdd(ref ObjSaltKey, lStrSalt);
                //vwlogin.SaltKeyValue = lStrSalt;
                //ViewBag.SaltKeyValue = lStrSalt;
                //Session.Add("RandomNo", 0);
                //Random randomclass = new Random();
                //Session["RandomNo"] = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(randomclass.Next().ToString(), "MD5");
                ////end of md5 encryption
                //ViewBag.SaltKeyValue = Session["RandomNo"].ToString();

                //                Random objRandom = new Random();

                //#pragma warning disable 618
                //                var Seed = FormsAuthentication.HashPasswordForStoringInConfigFile(Convert.ToString(objRandom.Next()), "MD5");
                //#pragma warning restore 618

                Random randomclass = new Random();
                string num = randomclass.Next().ToString();
                hdnsaltkey.Value = num;
                hdrandomSeed.Value = num;
                Session["Tokenno_CSRF"] = num;
                SaltKeyHandler.SaltKeyAdd(ref ObjSaltKey, num);
            }
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            ////// CSRF token no check (Start)
            int loginStatus = 1;

            // this checks the captcha validation 

            if (Session["LoginCaptchaTest"] == null)
            {
                string lcaptcha = SaltKeyHandler.GetCaptchValue(ref ObjSaltKey);
                if (lcaptcha == null || lcaptcha == "")
                {
                    //"Captcha Expired. Please re-load the Page.";
                    //ViewData["errMessage"] = Resources.Master.Resource.CaptchaExp;
                    //ViewData["errMessage"] = "Captcha Expired. Please re-load the Page.";// Display Error Message to User
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Captcha Expired. Please re-load the Page.!!!')</script>");
                    captcha.Text = "";
                    return;
                }
                else
                {
                    Session["LoginCaptchaTest"] = lcaptcha;
                }
            }
            if (Session["LoginCaptchaTest"].ToString() != captcha.Text.ToString())
            //if (captcha.Text.ToString() != Session["LoginCaptchaTest"])//Captcha to verify
            {
                ModelState.Clear();
                SaltKeyHandler.SaltKeyRemove(ref ObjSaltKey);
                lStrSalt = SaltKeyHandler.RandomString(16);
                SaltKeyHandler.SaltKeyAdd(ref ObjSaltKey, lStrSalt);
                Response.Write("<script LANGUAGE='JavaScript' >alert('Captcha Not Matched!!!')</script>");
                //ViewData["errMessage"] = "Incorrect Captcha";/// Display Error Message to User
                captcha.Text = "";
                captcha.Focus();
                return;
            }

            string UserType = "";
            if (UserTypeCitizen.Checked)
                UserType = "Citizen";
            else if (UserTypeDept.Checked)
                UserType = "G2G";
            else
                UserType = "Kiosk";

            LoginBLL login = new LoginBLL();
            string strSaltKy = hdnsaltkey.Value;
            loginStatus = login.AuthenticateUser(LoginID.Text, Password.Text, strSaltKy, UserType);

            if (loginStatus == 0)
            {
                string UserHomePage = "";

                System.Data.DataSet dtUser = login.GetUserData(LoginID.Text, UserType);
                System.Data.DataTable user = dtUser.Tables[0];
                System.Data.DataTable roles = dtUser.Tables[1];

                CustomPrincipalSerializeModel serializeModel = new CustomPrincipalSerializeModel();
                serializeModel.UserID = user.Rows[0]["UserID"].ToString();
                serializeModel.LoginID = user.Rows[0]["Username"].ToString();
                serializeModel.FirstName = user.Rows[0]["FirstName"].ToString();
                serializeModel.LastName = user.Rows[0]["LastName"].ToString();
                serializeModel.roles = roles.Rows[0]["Roles"].ToString().Split(',');

                UserHomePage = user.Rows[0]["HomePage"].ToString();

                string userData = JsonConvert.SerializeObject(serializeModel);
                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
                         1,
                        user.Rows[0]["Email"].ToString(),
                         DateTime.Now,
                         DateTime.Now.AddMinutes(15),
                         false,
                         userData);

                string encTicket = FormsAuthentication.Encrypt(authTicket);
                HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
                Response.Cookies.Add(faCookie);

                if (serializeModel.roles.Contains("Admin"))
                {
                    //return RedirectToAction("Index", "Admin", new { area = "Admin" });
                }
                else if (serializeModel.roles.Contains("User"))
                {
                    //return RedirectToAction("Index", "Home", new { area = "Citizen" });
                }
                else
                {
                    if (serializeModel.roles.Contains("Citizen"))
                    {
                        AssignSessionValuesCitizen(LoginID.Text);
                    }
                    else if (serializeModel.roles.Contains("Desk1") || serializeModel.roles.Contains("Desk2") || serializeModel.roles.Contains("Desk3") || serializeModel.roles.Contains("Desk4") || serializeModel.roles.Contains("Desk5"))
                    {
                        AssignSessionValuesG2G(LoginID.Text);
                    }
                    else
                    {
                        AssignSessionValues(LoginID.Text);
                    }

                    //return RedirectToAction("Index", "Home");
                    Response.Redirect(UserHomePage);
                }
            }
            else
            {
                //ViewData["errMessage"] = Resources.Master.Resource.UserIdMisMatch;
                //CommonFunction.AuditLog();
                //ViewData["errMessage"] = "Incorrect LoginID or Password";// Display Error Message to User
                //TempData["Msg"] = "Incorrect LoginID or Password";
                //ModelState.Clear();
                //TempData["Msg"] = Resources.Master.Resource.UserIdMisMatch;
                Response.Write("<script LANGUAGE='JavaScript' >alert('Incorrect LoginID or Password!!!')</script>");
                Password.Text = "";
                captcha.Text = "";
                Password.Focus();
            }
        }

        void AssignSessionValuesCitizen(string LoginID)
        {
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

        }

        void AssignSessionValuesG2G(string LoginID)
        {
            System.Data.DataTable t_DT;

            LoginBLL login = new LoginBLL();
            t_DT = login.GetG2GDetail(LoginID);

            Session["G2GID"] = t_DT.Rows[0]["LoginID"].ToString();
            Session["LoginID"] = t_DT.Rows[0]["LoginID"].ToString();
            Session["FullName"] = t_DT.Rows[0]["FullName"].ToString();
            //Session["G2GRole"] = t_DT.Rows[0]["G2GRole"].ToString();
            Session["Role"] = t_DT.Rows[0]["Role"].ToString();
            Session["CurrentCulture"] = "en-GB";
            Session["__SessionHelper__"] = "";
            Session["sRole"] = t_DT.Rows[0]["Role"].ToString();
            Session["UserType"] = "G2G";
            Session["Department"] = t_DT.Rows[0]["Department"].ToString();
        }

        void AssignSessionValues(string LoginID)
        {
            //string p_SCAID, p_KioskID, p_WebServiceURL, p_VLEID, p_SCA;
            //string t_SQLQuery = "", t_SCAID = "", t_KioskID = "", t_PaymentFlag = "";
            String t_PaymentFlag = "";

            System.Data.DataTable t_DT;
            string t_Balance = "0";


            LoginBLL login = new LoginBLL();
            t_DT = login.GetKioskDetail(LoginID);

            //t_SCAID = p_SCAID;

            //t_KioskID = p_KioskID;

            //t_SQLQuery = "Select * From mstUsers Where UserType = 'Kiosk' And KioskID = '" + t_KioskID + "' ";

            //t_DT = GetResult(t_SQLQuery, "mstUsers").Tables[0];

            //if (t_DT.Rows.Count == 0)
            //{
            //    Response.Write("Invalid CSC Details");
            //    return;
            //}

            Session["CurrentCulture"] = "en-GB";
            Session["SCAID"] = t_DT.Rows[0]["KioskID"].ToString().Substring(0, 2);
            Session["SCALoginID"] = "";//p_SCAID;
            Session["__SessionHelper__"] = "";
            //if (p_VLEID != "")
            //{
            //    Session["VLEID"] = p_VLEID;
            //}

            Session["KioskID"] = t_DT.Rows[0]["KioskID"].ToString();
            Session["LoginID"] = t_DT.Rows[0]["LoginID"].ToString();
            Session["FullName"] = t_DT.Rows[0]["FullName"].ToString();
            //Session["sName"] = t_DT.Rows[0]["FullName"].ToString();
            //Session["sNameLL"] = t_DT.Rows[0]["FullName_LL"].ToString();

            //if (p_WebServiceURL != "")
            //{
            //    Session["SCAPayAckURL"] = p_WebServiceURL;
            //}

            //Session["sLogin"] = t_DT.Rows[0]["LoginID"].ToString();

            t_PaymentFlag = t_DT.Rows[0]["PaymentFlag"].ToString();

            Session["PaymentFlag"] = t_PaymentFlag;

            Session["Role"] = t_DT.Rows[0]["Role"].ToString();
            Session["sRole"] = t_DT.Rows[0]["Role"].ToString();
            //Session["sRoleLL"] = t_DT.Rows[0]["Role"].ToString();

            //Session["sUnq"] = t_DT.Rows[0]["Unq"].ToString();
            //Session["UNQ"] = t_DT.Rows[0]["Unq"].ToString();

            //Session["UserType"] = "KIOSK";
            //Session["ShowPost"] = "True";
            //Session["ShowRole"] = "True";
            //Session["ShowUnq"] = "True";
            //Session["ShowLogID"] = "True";
            //Session["ShowDist"] = "True";
            //Session["ShowTaluka"] = "True";
            //Session["ShowVillage"] = "True";
            //Session["ShowBal"] = "True";
            //Session["ShowOut"] = "True";
            //Session["ShowExit"] = "True";

            //Session["SessionID"] = Session.SessionID;
            //Session["IPAddress"] = IPAddress();
            //if (t_PaymentFlag.ToUpper() == "S")
            //{
            //    t_SQLQuery = "Select DC_Clo_Bal From DC_Ledger Where Channel_ID = '" + t_KioskID.Substring(0, 2) + "' ";
            //}
            //else
            //{
            //    t_SQLQuery = "Select DC_Clo_Bal From DC_Ledger Where Channel_ID = '" + t_KioskID + "' ";
            //}

            //t_DT = GetResult(t_SQLQuery, "DC_Ledger").Tables[0];

            //if (t_DT.Rows.Count > 0)
            //{
            //    t_SCABalance = t_DT.Rows[0]["DC_Clo_Bal"].ToString();
            //}

            t_Balance = t_DT.Rows[0]["Balance"].ToString();
            Session["Balance"] = t_Balance;
            Session["UserType"] = "KIOSK";

        }
    }
}