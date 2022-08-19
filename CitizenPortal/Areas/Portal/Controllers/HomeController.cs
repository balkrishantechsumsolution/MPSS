using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CitizenPortal.Controllers;
using CaptchaMvc.Attributes;
using CaptchaMvc.HtmlHelpers;
using CallKarigar.Core.Crypto;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using static CitizenPortalLib.CommonFunction;

namespace CitizenPortal.Areas.Portal.Controllers
{
    public class HomeController : BaseController
    {
        private static OTP objOTP = new OTP();
        public static List<SaltKeyEntry> ObjSaltKey = new List<SaltKeyEntry>();
        private string lStrSalt = string.Empty;
        public ActionResult Index()
        {
            //Response.Redirect("/g2c/index.html");
            //if (User != null)
            //{
            //    string FullName = User.FirstName + " " + User.LastName;
            //}
            //return View();
            return Redirect("/g2c/forms/index.aspx");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public JsonResult CitizenRegistration(string UserID,string FirstName, string LastName, string Password, string EmailID, string MobileNo, string AadharNo)
        {
            string result = string.Empty;

            CitizenRegistration_DT ctzData = new CitizenRegistration_DT
            {
                UserID = UserID,
                FirstName = FirstName,
                LastName = LastName,
                MobileNo = MobileNo,
                EmailID = EmailID,
                AadharNo = AadharNo,
                Password = Password
            };

            try
            {
                CitizenRegistrationBLL ctz = new CitizenRegistrationBLL();
                ctz.CitizenShortRegistration(ctzData, null);

                result = "Y";
            }
            catch { result = "Something went wrong. Please try agian!"; }

            return Json(result);
        }

        public JsonResult GenerateOTP(string MobileNo, string CaptchaInputText, string SKV)
        {
            string result = string.Empty;

            if (Session["LoginCaptchaTest"] == null)
            {
                string lcaptcha = SaltKeyHandler.GetCaptchValue(ref ObjSaltKey);
                if (lcaptcha == "")
                {
                    // ViewData["errMessage"] = Resources.Master.Resource.CaptchaExp;
                    ModelState.Clear();
                    // return View("Login", vwlogin);
                    //TempData["Msg"] = Resources.Master.Resource.CaptchaExp;
                    return Json(result);
                }
                else
                {
                    Session["LoginCaptchaTest"] = lcaptcha;
                }
            }
            if (CaptchaInputText.ToString() == Session["LoginCaptchaTest"].ToString())
            {
                Random rnd = new Random();
                rnd.Next(1, 10000);
                //int otpass;
                objOTP = new OTP(Convert.ToUInt64(rnd.Next(1, 10000)));
                string otpass = objOTP.GetNextOTP();
                if (otpass != null)
                {
                    string msg = "OTP for Citizen Registration on Citizen Portal is " + otpass + ". Please DO NOT share it with anyone."; ;
                    try
                    {
                        SendSMS.Service1 sm = new SendSMS.Service1();
                        sm.GetDataSMS(MobileNo, msg);
                    }
                    catch { result = "SMS Was Not Sent"; }
                    result = "OTP";
                }
                else
                {
                    result = "Sorry, an error occured while creating your password. Please, try again.";
                }
            }
            else
            {
                ModelState.Clear();
                SaltKeyHandler.SaltKeyRemove(ref ObjSaltKey);
                lStrSalt = SaltKeyHandler.RandomString(16);
                SaltKeyHandler.SaltKeyAdd(ref ObjSaltKey, lStrSalt);

                result = "Captcha not matched. Please try again!";
                return Json(result);


            }

            //if (this.IsCaptchaValid("Captcha is not valid"))
            //{
            //    Random rnd = new Random();
            //    rnd.Next(1, 10000);
            //    //int otpass;
            //    objOTP = new OTP(Convert.ToUInt64(rnd.Next(1, 10000)));
            //    string otpass = objOTP.GetNextOTP();
            //    if (otpass != null)
            //    {
            //        string msg = "OTP for Citizen Registration on Citizen Portal is " + otpass + ". Please DO NOT share it with anyone."; ;
            //        try
            //        {
            //            SendSMS.Service1 sm = new SendSMS.Service1();
            //            sm.GetDataSMS(MobileNo, msg);
            //        }
            //        catch { result = "SMS Was Not Sent"; }
            //        result = "OTP";
            //    }
            //    else
            //    {
            //        result = "Sorry, an error occured while creating your password. Please, try again.";
            //    }
            //}

            return Json(result);
        }


        public JsonResult CheckUserID(string UserID)
        {
            string result = "Y";

            try
            {
                CitizenRegistrationBLL ctzBL = new CitizenRegistrationBLL();
                if (ctzBL.CheckUserID(UserID) == 0)
                {
                    result = "N";
                }
            }
            catch { }

            return Json(result);
        }
    }
}