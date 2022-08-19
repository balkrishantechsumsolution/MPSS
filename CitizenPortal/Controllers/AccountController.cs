using System;
using System.Globalization;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using CitizenPortal.Models;
using CitizenPortal.DAL;
using CitizenPortal.Security;
using System.Web.Security;
using Newtonsoft.Json;
using System.Collections.Generic;
using CitizenPortalLib.DataStructs;
using static CitizenPortalLib.CommonFunction;
using CitizenPortalLib.PortalViewModel;
using CitizenPortalLib.BLL;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Web.Configuration;
using System.Drawing;
using CaptchaMvc;
using System.Text;
using System.Text.RegularExpressions;
using System.Security.Cryptography;

namespace CitizenPortal.Controllers
{
    [Authorize]
    [RouteArea("")]
    [RoutePrefix("Account")]
    [SessionState(System.Web.SessionState.SessionStateBehavior.Default)]
    public class AccountController : Controller
    {
        OTP OBJotp = new OTP();
        CSCConnectBLL m_CSCConnectBLL = new CSCConnectBLL();
        string Newpasswod = "";
        string UserName = "";
        string Password = "";
        string Mobile = "";
        DataTable dt = new DataTable();
        DataTable dt2 = new DataTable();

        int i = 6;
        string Validtill = System.DateTime.Now.ToString();
        string Message = "";
        private ApplicationSignInManager _signInManager;
        private ApplicationUserManager _userManager;
        DataContext Context = new DataContext();
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(typeof(AccountController));

        public static List<SaltKeyEntry> ObjSaltKey = new List<SaltKeyEntry>();
        private string lStrSalt = string.Empty;
        public static string SaltkeyVal
        {
            get
            {
                return System.Web.HttpContext.Current.Application["SaltkeyVal"] as string;
            }
            set
            {
                System.Web.HttpContext.Current.Application["SaltkeyVal"] = value;
            }
        }
        public AccountController()
        {
        }

        public AccountController(ApplicationUserManager userManager, ApplicationSignInManager signInManager)
        {
            UserManager = userManager;
            SignInManager = signInManager;
        }

        public ApplicationSignInManager SignInManager
        {
            get
            {
                return _signInManager ?? HttpContext.GetOwinContext().Get<ApplicationSignInManager>();
            }
            private set
            {
                _signInManager = value;
            }
        }

        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }
        //
        // GET: /Account/
        public ActionResult Index()
        {
            TempData.Keep("Saltkey");
            //log.Info("Index Action has been fired.");
            return View();
        }
        //
        // GET: /Account/Login
        [AllowAnonymous]
        [Route("Login")]
        public ActionResult Login(string returnUrl)
        {

            // Cookie Cookies = new Cookie();
            // Cookies["__csc_connect__inf0_"] = "cscid=PY040700101&name=puducherry&loc=puducherry&scaid=SCA094&scaname=Test SCA&vlename=TEST_Raj Kishore&tmtu=../cscconnect/cscconnectresponse.aspx&llr=14Mar2016_054026PM";
            // CookieVal = "cscid=PY040700101&name=puducherry&loc=puducherry&scaid=SCA094&scaname=Test SCA&vlename=TEST_Raj Kishore&tmtu=../cscconnect/cscconnectresponse.aspx&llr=14Mar2016_054026PM";
            LoginModel vwlogin = new LoginModel();
            // start here apply for csc response

            if (Request.Cookies["__csc_connect__inf0_"] != null)
            {

                string CSCID, CookieVal;
                CSCID = "";
                HttpCookie aCookie = Request.Cookies["__csc_connect__inf0_"];
                CookieVal = Server.HtmlEncode(aCookie.Value);
                //CookieVal = "cscid=PY040700101&name=puducherry&loc=puducherry&scaid=SCA094&scaname=Test SCA&vlename=TEST_Raj Kishore&tmtu=../cscconnect/cscconnectresponse.aspx&llr=14Mar2016_054026PM";
                CSCID = CookieVal.Substring(6, 11);

                if (CSCID != null)
                {

                    if (Regex.IsMatch(CSCID, "^[a-zA-Z]{2}[0-9]{9}"))
                    {
                        string[] split = CookieVal.Split('&');

                        Session["Id"] = CSCID;
                        Session["role"] = "vle";
                        string user = Session["Id"].ToString();
                        string role = Session["role"].ToString();

                        Response.Cookies["Id"].Value = user;

                        Session["CurrentCulture"] = "en-GB";
                        Session["SCAID"] = split[3].Replace("scaid=", "");
                        Session["SCALoginID"] = split[4].Replace("scaname=", "");
                        Session["__SessionHelper__"] = "";
                        Session["KioskID"] = split[0].Replace("cscid=", "");
                        Session["LoginID"] = CSCID;
                        Session["FullName"] = split[5].Replace("vlename=", "");
                        Session["PaymentFlag"] = "S";
                        Session["Role"] = role;
                        Session["sRole"] = role;
                        Session["Balance"] = 0;
                        Session["UserType"] = "KIOSK";
                        Session["HomePage"] = "/WebApp/Kiosk/Forms/DashboardChart.aspx";
                        DataTable t_Result;
                        try
                        {
                            string[] AFields = {
                            "CAID"
                            ,"SCAName"
                            ,"SCALoginID"
                            ,"LoginID"
                            ,"FullName"
                            ,"KioskID"
                            ,"OMTID"
                            ,"Role"
                            ,"CookieValue"
                            ,"CreatedBy"
                            };

                            CSCConnect_DT objCSCConnect = new CSCConnect_DT();

                            objCSCConnect.CAID = CSCID;
                            objCSCConnect.SCAName = Session["SCALoginID"].ToString();
                            objCSCConnect.SCALoginID = Session["SCALoginID"].ToString();
                            objCSCConnect.LoginID = CSCID;
                            objCSCConnect.FullName = Session["FullName"].ToString();
                            objCSCConnect.KioskID = Session["KioskID"].ToString();
                            objCSCConnect.OMTID = CSCID;
                            objCSCConnect.Role = role;
                            objCSCConnect.CookieValue = CookieVal;
                            objCSCConnect.CreatedBy = "CSCConnect";

                            t_Result = m_CSCConnectBLL.InsertCSCLoginDetails(objCSCConnect, AFields);
                        }
                        catch (Exception ex)
                        {

                        }

                        //Response.Write(CookieVal);

                        //Response.Write("Culture"+Session["CurrentCulture"].ToString() + " SCAID" + Session["SCAID"].ToString()+ " SCALoginID" + Session["SCALoginID"].ToString() + "KioskID " + Session["KioskID"].ToString() + " FullName" + Session["FullName"].ToString() + "PaymentFlag" + Session["PaymentFlag"].ToString());

                        Response.Redirect("/WebApp/Kiosk/Forms/DashboardChart.aspx", false);

                    }

                    else
                    {
                        Response.Write("Please Clear The Browser Cookies and  Login Again .....");
                    }
                }
                else
                {
                    Response.Write("Please Clear The Browser Cookies and  Login Again .....");
                }
            }//end here logic of response csc
            else
            {



                //log.Info("Login View has been fired.");



                string viewData = "";
                if (ViewData["errMessage"] != null)
                    viewData = ViewData["errMessage"].ToString();

                if (TempData["Msg"] != null)
                    viewData = TempData["Msg"].ToString();

                if (Session["Tokenno_CSRF"] == null)
                {
                    System.Web.SessionState.SessionIDManager manager = new System.Web.SessionState.SessionIDManager();
                    Session.Abandon();
                    Session.Clear();
                    Session.RemoveAll();
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
                   

                    ViewData["errMessage"] = viewData;

                }

                //string stateID = GetUniqueKey(18);
                //Session["state"] = stateID;
                //string url = ConfigurationManager.AppSettings["CONNECT_SERVER_URI"] + ConfigurationManager.AppSettings["AUTHORIZATION_ENDPOINT"] + "?state=" + stateID + "&response_type=code&client_id=" + ConfigurationManager.AppSettings["CLIENT_ID"] + "&redirect_uri=" + ConfigurationManager.AppSettings["CLIENT_CALLBACK_URI"];

                //ViewBag.SevaURL = url;

                Random randomclass = new Random();
                string num = randomclass.Next().ToString();
                ViewBag.SaltKeyValue = num;
                vwlogin.SaltKeyValue = num;
                SaltKeyHandler.SaltKeyAdd(ref ObjSaltKey, num);

                Session["SaltKey"] = num;

                ViewBag.ReturnUrl = returnUrl;
                return View();
            }

            return View(vwlogin);
        }
        [AllowAnonymous]
        [Route("ForgotPassword")]
        public ActionResult ForgotPassword()
        {
            ViewBag.Message = "A fresh CAPTCHA image is being displayed!";
            return View();
        }




        [AllowAnonymous]
        [Route("ForgotPassword")]
        [HttpPost]
        public ActionResult ForgotPassword(FogotModel ObjFogotModel)
        {

            string email = ObjFogotModel.EmailID;
            string Profileid = ObjFogotModel.ProfileID;
            if (Profileid == null || Profileid == "")
            {
                ViewBag.Verify = "Plz Fill Profile ID";
                return View(ObjFogotModel);
            }
            else
            {
                string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;

                SqlConnection con = new SqlConnection(connStr);
                con.Open();
                SqlCommand cmd1 = new SqlCommand("CItitzenFetchMobileDataSP", con);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.AddWithValue("@Emailid", email);
                cmd1.Parameters.AddWithValue("@ProfileId", Profileid);

                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                da.Fill(dt);

                con.Close();
                if (dt.Rows.Count > 0)
                {
                    UserName = dt.Rows[0][0].ToString();
                    Password = dt.Rows[0][1].ToString();
                    Mobile = dt.Rows[0][2].ToString();
                }

                else
                {
                    ViewBag.Verify = "You Are Not Register";
                    return RedirectToAction("Login", "Account");
                }

                if (Request.Form["Command"] == "Generate OTP")
                {

                    string otp = GenerateRandomOTP();
                    HttpContext.Session["OTP"] = otp;
                    OBJotp.insertDatatable(Message, otp, Mobile);


                    Message = "OTP for Odisha Lokaseba Adhikara is " + otp +
              " and is valid for 10 minutes. Generated at '" + Validtill + "' From Odisha Lokaseba Adhikara -CAP, Odisha Govt.";


                    CitizenPortalLib.EMailSMS test = new CitizenPortalLib.EMailSMS();

                    test.sendsms(Mobile, Message);//TODO: SMS Logic to 

                    return View(ObjFogotModel);//    SendSMS(Mobile, "OTP for Odisha Lokaseba Adhikara is " + OTP +
                                               //" and is valid for 10 minutes. Generated at " + VallidTill + " From Odisha Lokaseba Adhikara -CAP, Odisha Govt.");
                }
                if (Request.Form["Command"] == "Send Mail")
                {
                    if (ObjFogotModel.OTP == "" || ObjFogotModel.OTP == null)
                    {
                        ViewBag.Message = "Please Filled OTP value!";

                        return View(ObjFogotModel);
                    }

                }

                if (ObjFogotModel.OTP == HttpContext.Session["OTP"].ToString())
                {

                    if (ObjFogotModel.CaptchaText == HttpContext.Session["captchastring"].ToString())
                    {
                        ViewBag.Message = "CAPTCHA verification successful!";
                        Newpasswod = CreateRandomPassword(i);
                        OBJotp.ForgetLogMaintain(Profileid, Mobile, Password, Newpasswod);
                        UpdateLog(UserName, Newpasswod, email, Profileid);

                        SendEmail(email, UserName, Newpasswod);
                    }
                    else
                    {
                        ViewBag.Message = "CAPTCHA verification failed!";

                        return View(ObjFogotModel);

                    }

                }
                else
                {
                    ViewBag.Message = "OTP Verification failed";
                    return View(ObjFogotModel);
                }

            }


            return RedirectToAction("Login", "Account");





        }




        [AllowAnonymous]
        [Route("ShowCaptchaImage")]
        public CaptchaImage ShowCaptchaImage()
        {
            return new CaptchaImage();
        }

        private string GenerateRandomOTP()
        {
            int iOTPLength = 6;
            string[] saAllowedCharacters = { "0", "1", "2", "3", "4", "6", "7", "8", "9" };

            string sOTP = String.Empty;

            string sTempChars = String.Empty;

            Random rand = new Random();

            for (int i = 0; i < iOTPLength; i++)

            {

                int p = rand.Next(0, saAllowedCharacters.Length);

                sTempChars = saAllowedCharacters[rand.Next(0, saAllowedCharacters.Length)];

                sOTP += sTempChars;

            }

            return sOTP;

        }



        private static string CreateRandomPassword(int passwordLength)
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789!@$?_-";
            char[] chars = new char[passwordLength];
            Random rd = new Random();

            for (int i = 0; i < passwordLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }
        protected void SendEmail(string EmailID, string UserName, string Newpasswod)
        {

            if (!string.IsNullOrEmpty(Newpasswod))
            {
                MailMessage mm = new MailMessage("sender@gmail.com", EmailID.Trim());
                mm.Subject = "Password Recovery";
                mm.Body = string.Format("Hi {0},<br /><br />Your password is {1}    <br /><br />Thank You.", UserName, Newpasswod);
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                NetworkCredential NetworkCred = new NetworkCredential();
                NetworkCred.UserName = WebConfigurationManager.AppSettings["SMTPUserName2"].ToString(); ;
                NetworkCred.Password = WebConfigurationManager.AppSettings["SMTPPassword2"].ToString(); ;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = NetworkCred;
                smtp.Port = 587;
                smtp.Send(mm);
                ViewBag.SomeMeg = Color.Green;
                ViewBag.SomeMeg = "Password has been sent to your email address.";
            }
            else
            {
                ViewBag.SomeMeg = Color.Red;
                ViewBag.SomeMeg = "This email address does not match our records";


            }
        }
        protected bool UpdateLog(string UserName, string password, string Emailid, string ProfileID)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MasterDB"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            con.Open();
            SqlCommand cmd1 = new SqlCommand("UpdateForFogetCititZenMasterSb", con);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.AddWithValue("@Password", password);
            cmd1.Parameters.AddWithValue("@Username", UserName);
            cmd1.Parameters.AddWithValue("@ProfileId", ProfileID);
            cmd1.Parameters.AddWithValue("@Emailid", Emailid);
            try
            {



                cmd1.ExecuteNonQuery();

                return true;



            }
            catch (Exception ex)
            {
                // trans.Rollback();
                return false;

            }
            finally
            {
                // trans.Dispose();
                // con.Dispose();
                con.Close();

            }

        }
        public void FillCapctha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                    captcha.Append(combination[random.Next(combination.Length)]);
                Session["captcha"] = captcha.ToString();
                // imgCaptcha.ImageUrl = "AddCapcha.aspx?" + DateTime.Now.Ticks.ToString();
            }
            catch
            {

                throw;
            }
        }
        //
        // ReturnHash
        [NonAction]
        public string ReturnHash(string strPassword, string token)
        {
            string strHash = null;
            string RandomNo = token;
#pragma warning disable 618
            return strHash = FormsAuthentication.HashPasswordForStoringInConfigFile((RandomNo + strPassword), "MD5");
#pragma warning restore 618
        }

        ////////
        //////// POST: /Account/Login
        //////[HttpPost]
        //////[AllowAnonymous]
        //////[ValidateAntiForgeryToken]
        //////public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        //////{
        //////    if (!ModelState.IsValid)
        //////    {
        //////        return View(model);
        //////    }

        //////    // This doesn't count login failures towards account lockout
        //////    // To enable password failures to trigger account lockout, change to shouldLockout: true
        //////    var result = await SignInManager.PasswordSignInAsync(model.Email, model.Password, model.RememberMe, shouldLockout: false);
        //////    switch (result)
        //////    {
        //////        case SignInStatus.Success:
        //////            return RedirectToLocal(returnUrl);
        //////        case SignInStatus.LockedOut:
        //////            return View("Lockout");
        //////        case SignInStatus.RequiresVerification:
        //////            return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = model.RememberMe });
        //////        case SignInStatus.Failure:
        //////        default:
        //////            ModelState.AddModelError("", "Invalid login attempt.");
        //////            return View(model);
        //////    }
        //////}

        //
        // GET: /Account/VerifyCode
        [AllowAnonymous]
        public async Task<ActionResult> VerifyCode(string provider, string returnUrl, bool rememberMe)
        {
            // Require that the user has already logged in via username/password or external login
            if (!await SignInManager.HasBeenVerifiedAsync())
            {
                return View("Error");
            }
            return View(new VerifyCodeViewModel { Provider = provider, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/VerifyCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> VerifyCode(VerifyCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            // The following code protects for brute force attacks against the two factor codes. 
            // If a user enters incorrect codes for a specified amount of time then the user account 
            // will be locked out for a specified amount of time. 
            // You can configure the account lockout settings in IdentityConfig
            var result = await SignInManager.TwoFactorSignInAsync(model.Provider, model.Code, isPersistent: model.RememberMe, rememberBrowser: model.RememberBrowser);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(model.ReturnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "Invalid code.");
                    return View(model);
            }
        }

        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);

                    // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
                    // Send an email with this link
                    // string code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
                    // var callbackUrl = Url.Action("ConfirmEmail", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                    // await UserManager.SendEmailAsync(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>");

                    return RedirectToAction("Index", "Home");
                }
                AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ConfirmEmail
        [AllowAnonymous]
        public async Task<ActionResult> ConfirmEmail(string userId, string code)
        {
            if (userId == null || code == null)
            {
                return View("Error");
            }
            var result = await UserManager.ConfirmEmailAsync(userId, code);
            return View(result.Succeeded ? "ConfirmEmail" : "Error");
        }

        //
        // GET: /Account/ForgotPassword


        //
        // POST: /Account/ForgotPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        //public async Task<ActionResult> ForgotPassword(ForgotPasswordViewModel model)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var user = await UserManager.FindByNameAsync(model.Email);
        //        if (user == null || !(await UserManager.IsEmailConfirmedAsync(user.Id)))
        //        {
        //            // Don't reveal that the user does not exist or is not confirmed
        //            return View("ForgotPasswordConfirmation");
        //        }

        //        // For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
        //        // Send an email with this link
        //        // string code = await UserManager.GeneratePasswordResetTokenAsync(user.Id);
        //        // var callbackUrl = Url.Action("ResetPassword", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);		
        //        // await UserManager.SendEmailAsync(user.Id, "Reset Password", "Please reset your password by clicking <a href=\"" + callbackUrl + "\">here</a>");
        //        // return RedirectToAction("ForgotPasswordConfirmation", "Account");
        //    }

        //    // If we got this far, something failed, redisplay form
        //    return View(model);
        //}

        //
        // GET: /Account/ForgotPasswordConfirmation
        // [AllowAnonymous]
        public ActionResult ForgotPasswordConfirmation()
        {
            return View();
        }

        //
        // GET: /Account/ResetPassword
        [AllowAnonymous]
        public ActionResult ResetPassword(string code)
        {
            return code == null ? View("Error") : View();
        }

        //
        // POST: /Account/ResetPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var user = await UserManager.FindByNameAsync(model.Email);
            if (user == null)
            {
                // Don't reveal that the user does not exist
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            var result = await UserManager.ResetPasswordAsync(user.Id, model.Code, model.Password);
            if (result.Succeeded)
            {
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            AddErrors(result);
            return View();
        }

        //
        // GET: /Account/ResetPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ResetPasswordConfirmation()
        {
            return View();
        }

        //
        // POST: /Account/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            // Request a redirect to the external login provider
            return new ChallengeResult(provider, Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/SendCode
        [AllowAnonymous]
        public async Task<ActionResult> SendCode(string returnUrl, bool rememberMe)
        {
            var userId = await SignInManager.GetVerifiedUserIdAsync();
            if (userId == null)
            {
                return View("Error");
            }
            var userFactors = await UserManager.GetValidTwoFactorProvidersAsync(userId);
            var factorOptions = userFactors.Select(purpose => new SelectListItem { Text = purpose, Value = purpose }).ToList();
            return View(new SendCodeViewModel { Providers = factorOptions, ReturnUrl = returnUrl, RememberMe = rememberMe });
        }

        //
        // POST: /Account/SendCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SendCode(SendCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            // Generate the token and send it
            if (!await SignInManager.SendTwoFactorCodeAsync(model.SelectedProvider))
            {
                return View("Error");
            }
            return RedirectToAction("VerifyCode", new { Provider = model.SelectedProvider, ReturnUrl = model.ReturnUrl, RememberMe = model.RememberMe });
        }

        //
        // GET: /Account/ExternalLoginCallback
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                return RedirectToAction("Login");
            }

            // Sign in the user with this external login provider if the user already has a login
            var result = await SignInManager.ExternalSignInAsync(loginInfo, isPersistent: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(returnUrl);
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresVerification:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl, RememberMe = false });
                case SignInStatus.Failure:
                default:
                    // If the user does not have an account, then prompt the user to create an account
                    ViewBag.ReturnUrl = returnUrl;
                    ViewBag.LoginProvider = loginInfo.Login.LoginProvider;
                    return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { Email = loginInfo.Email });
            }
        }

        //
        // POST: /Account/ExternalLoginConfirmation
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Manage");
            }

            if (ModelState.IsValid)
            {
                // Get the information about the user from the external login provider
                var info = await AuthenticationManager.GetExternalLoginInfoAsync();
                if (info == null)
                {
                    return View("ExternalLoginFailure");
                }
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user);
                if (result.Succeeded)
                {
                    result = await UserManager.AddLoginAsync(user.Id, info.Login);
                    if (result.Succeeded)
                    {
                        await SignInManager.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                        return RedirectToLocal(returnUrl);
                    }
                }
                AddErrors(result);
            }

            ViewBag.ReturnUrl = returnUrl;
            return View(model);
        }

        ////
        //// POST: /Account/LogOff
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult LogOff()
        //{
        //    AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        //    return RedirectToAction("Index", "Home");
        //}

        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (_userManager != null)
                {
                    _userManager.Dispose();
                    _userManager = null;
                }

                if (_signInManager != null)
                {
                    _signInManager.Dispose();
                    _signInManager = null;
                }
            }

            base.Dispose(disposing);
        }

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "Home");
        }

        internal class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion


        // POST: /Account/Login
        //[HttpPost]
        //[AllowAnonymous]
        //[ValidateAntiForgeryToken]
        //public ActionResult Login_old(LoginViewModel model, string returnUrl)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var user = Context.Users.Where(u => u.Username == model.Username && u.Password == model.Password).FirstOrDefault();
        //        if (user != null)
        //        {
        //            var roles = user.Roles.Select(m => m.RoleName).ToArray();

        //            CustomPrincipalSerializeModel serializeModel = new CustomPrincipalSerializeModel();
        //            serializeModel.UserId = user.UserId;
        //            serializeModel.FirstName = user.FirstName;
        //            serializeModel.LastName = user.LastName;
        //            serializeModel.roles = roles;

        //            string userData = JsonConvert.SerializeObject(serializeModel);
        //            FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
        //                     1,
        //                    user.Email,
        //                     DateTime.Now,
        //                     DateTime.Now.AddMinutes(15),
        //                     false,
        //                     userData);

        //            string encTicket = FormsAuthentication.Encrypt(authTicket);
        //            HttpCookie faCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encTicket);
        //            Response.Cookies.Add(faCookie);

        //            if (roles.Contains("Admin"))
        //            {
        //                return RedirectToAction("Index", "Admin", new { area = "Admin" });
        //            }
        //            else if (roles.Contains("User"))
        //            {
        //                return RedirectToAction("Index", "Home", new { area = "Citizen" });
        //            }
        //            else
        //            {
        //                return RedirectToAction("Index", "Home");
        //            }
        //        }

        //        ModelState.AddModelError("", "Incorrect username and/or password");
        //    }

        //    return View(model);
        //}


        public string GetUniqueKey(int maxSize)
        {
            char[] chars = new char[62];
            chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".ToCharArray();
            byte[] data = new byte[1];
            RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
            crypto.GetNonZeroBytes(data);
            data = new byte[maxSize];
            crypto.GetNonZeroBytes(data);
            StringBuilder result = new StringBuilder(maxSize);
            foreach (byte b in data)
            {
                result.Append(chars[b % (chars.Length)]);
            }
            return result.ToString().ToUpper();
        }

        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [Route("Login")]
        public ActionResult Login(LoginModel objModel)
        {
            string CSCconnect = null;
            LoginModel vwlogin = new LoginModel();
            ////// CSRF token no check (Start)
            int loginStatus = 1;

            string test = Request.Form["hdrDigitalSeva"];
            if (Request.Form["CSCsubmit"] == null)
            {
                CSCconnect = "Login with Digital Seva Connect";
            }
            if (Request.Form["CSCsubmit"] == "Login with Digital Seva Connect" || CSCconnect != null)
            {
                string stateID = GetUniqueKey(18);
                Session["state"] = stateID;
                string url = ConfigurationManager.AppSettings["CONNECT_SERVER_URI"] + ConfigurationManager.AppSettings["AUTHORIZATION_ENDPOINT"] + "?state=" + stateID + "&response_type=code&client_id=" + ConfigurationManager.AppSettings["CLIENT_ID"] + "&redirect_uri=" + ConfigurationManager.AppSettings["CLIENT_CALLBACK_URI"];
                return Redirect(url);
            }
            // this checks the captcha validation 
            if (Session["LoginCaptchaTest"] == null)
            {
                string lcaptcha = SaltKeyHandler.GetCaptchValue(ref ObjSaltKey);
                if (lcaptcha == null || lcaptcha == "")
                {
                    //"Captcha Expired. Please re-load the Page.";
                    //ViewData["errMessage"] = Resources.Master.Resource.CaptchaExp;
                    ViewData["errMessage"] = "Captcha Expired. Please re-load the Page.";
                    ModelState.Clear();
                    // return View("Login", vwlogin);
                    //TempData["Msg"] = Resources.Master.Resource.CaptchaExp;
                    TempData["Msg"] = "Captcha Expired. Please re-load the Page.";
                    
                    SaltKeyHandler.SaltKeyRemove(ref ObjSaltKey);
                    lStrSalt = SaltKeyHandler.RandomString(16);

                    Random randomclass = new Random();
                    string num = randomclass.Next().ToString();
                    ViewBag.SaltKeyValue = num;
                    vwlogin.SaltKeyValue = num;
                    SaltKeyHandler.SaltKeyAdd(ref ObjSaltKey, num);                    
                    objModel = vwlogin;

                    //return RedirectToAction("Login");
                    return View("Login", objModel);
                }
                else
                {
                    Session["LoginCaptchaTest"] = lcaptcha;
                }
            }
            if (objModel.captcha.ToString() != Session["LoginCaptchaTest"].ToString())
            {
                ModelState.Clear();
                SaltKeyHandler.SaltKeyRemove(ref ObjSaltKey);
                lStrSalt = SaltKeyHandler.RandomString(16);
                SaltKeyHandler.SaltKeyAdd(ref ObjSaltKey, lStrSalt);
                vwlogin.SaltKeyValue = lStrSalt;
                objModel = vwlogin;
                //ViewData["errMessage"] = Resources.Master.Resource.CaptchaMisMatch;
                //return View("Login", objModel);

                //TempData["Msg"] = Resources.Master.Resource.CaptchaMisMatch;

                ViewData["errMessage"] = "Incorrect Captcha";
                TempData["Msg"] = "Incorrect Captcha";

                SaltKeyHandler.SaltKeyRemove(ref ObjSaltKey);
                lStrSalt = SaltKeyHandler.RandomString(16);

                Random randomclass = new Random();
                string num = randomclass.Next().ToString();
                ViewBag.SaltKeyValue = num;
                vwlogin.SaltKeyValue = num;
                SaltKeyHandler.SaltKeyAdd(ref ObjSaltKey, num);
                objModel = vwlogin;

                //return RedirectToAction("Login");
                return View("Login", objModel);
            }
            //////LoginBal login = new LoginBal();
            //////string strSaltKy = SaltKeyHandler.SaltKeyGet(ref ObjSaltKey);
            //////loginStatus = login.AuthenticateUser(objModel.LoginId, objModel.Password, strSaltKy);

            //////if (loginStatus == 0)
            //////{
            //////    Session["LoginCaptchaTest"] = null;
            //////    int status = new UserBAL().CheckAccountStatus(objModel.LoginId);
            //////    if (status != 1)
            //////    {
            //////        return RedirectToAction("ActivateAccount", "User", new { area = "Master", loginId = Encryption.EncryptQueryString(objModel.LoginId), flag = Encryption.EncryptQueryString("A") });
            //////    }
            //////    else
            //////    {
            //////        return RedirectToAction("Index", "Home", new { area = "Master" });
            //////    }
            //////}
            //////else
            //////{
            //////    //ViewData["errMessage"] = Resources.Master.Resource.UserIdMisMatch;
            //////    //CommonFunction.AuditLog();
            //////    ModelState.Clear();
            //////    //TempData["Msg"] = Resources.Master.Resource.UserIdMisMatch;
            //////}

            //var user = Context.Users.Where(u => u.UserId == objModel.LoginID && u.Password == objModel.Password).FirstOrDefault();

            //LoginBLL login = new LoginBLL();
            //string strSaltKy = SaltKeyHandler.SaltKeyGet(ref ObjSaltKey);            
            //loginStatus = login.AuthenticateUser(objModel.LoginID, objModel.Password, strSaltKy, objModel.UserType);
            DataSet ds = new DataSet();
            LoginBLL login = new LoginBLL();
            int Flag = 1;
            if (objModel.UserType == "Citizen")
            {
                Flag = 2;
            }
            else
            {
                Flag = 1;
            }

            ds = login.UserSaltKeyAndPass(objModel.LoginID, Flag);
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                string dbPassword = ds.Tables[0].Rows[0]["EncryptPass"].ToString();
                string SaltKey = ds.Tables[0].Rows[0]["SaltKey"].ToString();
                string strSaltKy = SaltKeyHandler.SaltKeyGet(ref ObjSaltKey);
                //string strSaltKy = SaltKeyHandler.SaltKeyGet(ref ObjSaltKey);

                string pwd1 = dbPassword.ToLower();
                //use same process as on .aspx page.
                string pwd2 = pwd1;//getMd5Hash(pwd1);
                string pwd3 = EncryptSHA256(strSaltKy);//convert Rndno into md5
                string enterdpass = objModel.Password;
                //pwd2 = EncryptSHA256(pwd2.ToLower() + pwd3.ToLower());//now convert both value into md5 again
                pwd2 = dbPassword;
                if (enterdpass == pwd2)//match both md5 value is same
                {
                    //Code after password authenticate
                    //successfullyLogin = 0;
                    loginStatus = 0;
                    login.AuditTrialStatus(Request.UserHostAddress, objModel.LoginID, objModel.LoginID, "Success", "CSVTU");
                }
                else
                {
                    login.AuditTrialStatus(Request.UserHostAddress, objModel.LoginID, objModel.LoginID, "Fail", "CSVTU");
                }

                if (loginStatus == 0)
                {
                    string UserHomePage = "";

                    System.Data.DataSet dtUser = login.GetUserData(objModel.LoginID, objModel.UserType);
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
                    //Response.Cookies.Add(faCookie);
                    // Set the cookie's expiration time to the tickets expiration time
                    if (authTicket.IsPersistent) faCookie.Expires = authTicket.Expiration;

                    // Add the cookie to the list for outgoing response
                    Response.Cookies.Add(faCookie);

                    //// Solution for Session Fixation Step 1 
                    string strAuthToken = Guid.NewGuid().ToString();
                    Session["AuthToken"] = strAuthToken;
                    Response.Cookies.Add(new HttpCookie("AuthToken", strAuthToken));

                    if (serializeModel.roles.Contains("Admin"))
                    {
                        return RedirectToAction("Index", "Admin", new { area = "Admin" });
                    }
                    else if (serializeModel.roles.Contains("User"))
                    {
                        return RedirectToAction("Index", "Home", new { area = "Citizen" });
                    }
                    else
                    {
                        if (serializeModel.roles.Contains("Citizen"))
                        {
                            AssignSessionValuesCitizen(objModel.LoginID);
                        }
                        else if (serializeModel.roles.Contains("Desk1") || serializeModel.roles.Contains("Desk2") || serializeModel.roles.Contains("Desk3") || serializeModel.roles.Contains("Desk4") || serializeModel.roles.Contains("Desk5"))
                        {
                            AssignSessionValuesG2G(objModel.LoginID);
                        }
                        else
                        {
                            AssignSessionValues(objModel.LoginID);
                        }
                        Session["HomePage"] = UserHomePage;
                        //return RedirectToAction("Index", "Home");
                        return Redirect(UserHomePage);
                    }

                }
                else
                {
                    //ViewData["errMessage"] = Resources.Master.Resource.UserIdMisMatch;
                    //CommonFunction.AuditLog();
                    ViewData["errMessage"] = "Incorrect LoginID or Password";
                    TempData["Msg"] = "Incorrect LoginID or Password";
                    ModelState.Clear();

                    SaltKeyHandler.SaltKeyRemove(ref ObjSaltKey);
                    lStrSalt = SaltKeyHandler.RandomString(16);

                    Random randomclass = new Random();
                    string num = randomclass.Next().ToString();
                    ViewBag.SaltKeyValue = num;
                    vwlogin.SaltKeyValue = num;
                    SaltKeyHandler.SaltKeyAdd(ref ObjSaltKey, num);
                    Session["SaltKey"] = num;

                    objModel = vwlogin;

                    //TempData["Msg"] = Resources.Master.Resource.UserIdMisMatch;
                }
            }

            return View("Login", objModel);
            //return RedirectToAction("Login", objModel);
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
            Session["ProfileID"] = t_DT.Rows[0]["ProfileID"].ToString();

        }

        void AssignSessionValuesG2G(string LoginID)
        {
            System.Data.DataTable t_DT;

            LoginBLL login = new LoginBLL();
            t_DT = login.GetG2GDetail(LoginID);

            Session["G2GID"] = t_DT.Rows[0]["LoginID"].ToString();
            Session["LoginID"] = t_DT.Rows[0]["LoginID"].ToString();
            Session["FullName"] = t_DT.Rows[0]["FullName"].ToString();
            Session["MenuRole"] = t_DT.Rows[0]["MenuRole"].ToString();
            Session["Role"] = t_DT.Rows[0]["Role"].ToString();
            Session["CurrentCulture"] = "en-GB";
            Session["__SessionHelper__"] = "";
            Session["sRole"] = t_DT.Rows[0]["Role"].ToString();
            Session["UserType"] = "G2G";
            Session["Department"] = t_DT.Rows[0]["Department"].ToString();
        }

        void AssignSessionValues(string LoginID)
        {
            string p_SCAID, p_KioskID, p_WebServiceURL, p_VLEID, p_SCA;
            string t_SQLQuery = "", t_SCAID = "", t_KioskID = "", t_PaymentFlag = "";

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


        [AllowAnonymous]
        //[ValidateAntiForgeryToken]
        [Route("LogOff")]
        public ActionResult LogOff()
        {
            if (Request.Cookies["__csc_connect__inf0_"] != null)
            {
                var c = new HttpCookie("__csc_connect__inf0_");
                c.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(c);
                Request.Cookies.Clear();
                Response.Cookies.Clear();
            }
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Cookies["ASP.NET_SessionId"].Expires = DateTime.Now.AddDays(-30);
            //Response.Cookies.Clear();
            return RedirectToAction("Login", "Account", new { area = "" });
        }

        /// <summary>
        ///  This method is used to generate the Captcha on the screen.
        /// </summary>
        /// <returns>Binary image to the calling control </returns>
        [AllowAnonymous]
        [Route("GetCaptcha")]
        public ActionResult GetCaptcha()
        {
            FileContentResult captchaImageResult = null;

            System.Drawing.Bitmap objBmp = new System.Drawing.Bitmap(100, 30);
            System.Drawing.Graphics objGraphics = System.Drawing.Graphics.FromImage(objBmp);
            // System.Drawing.Color.FromName("E9E9E9");
            objGraphics.Clear(System.Drawing.Color.White);// ("E9E9E9"));
            objGraphics.TextRenderingHint = System.Drawing.Text.TextRenderingHint.AntiAlias;
            System.Drawing.Font objFont = new System.Drawing.Font("Arial", 16, System.Drawing.FontStyle.Bold);
            string strRandom = "";
            string[] strArray = new string[26];
            strArray = new string[] { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" };
            // strArray = new string[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
            Random autoRand = new Random();
            int x;
            for (x = 0; x < 6; x++)
            {
                int i = Convert.ToInt32(autoRand.Next(0, 36));
                strRandom += strArray[i].ToString();
            }
            System.IO.MemoryStream mystream = new System.IO.MemoryStream();
            Session.Add("LoginCaptchaTest", strRandom);
            objGraphics.DrawString(strRandom, objFont, System.Drawing.Brushes.Black, 1, 1);
            objBmp.Save(mystream, System.Drawing.Imaging.ImageFormat.Gif);

            captchaImageResult = base.File(mystream.GetBuffer(), "image/jpeg");
            return captchaImageResult;
        }

        public ActionResult ForgotPass()
        {
            return RedirectToAction("ForgotPwd", "ForgotPwd");
        }


        public ActionResult Logout()
        {
            //CommonFunction.AuditLog();
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }

        public ActionResult CheckAjaxSessionExpired()
        {
            bool _sessionExpired = false;
            if (System.Web.HttpContext.Current.Session["UserSession"] == null)
            {
                _sessionExpired = true;
            }
            return Content(_sessionExpired.ToString());
        }
        //public string ForgetPassword()
        //{

        //}
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