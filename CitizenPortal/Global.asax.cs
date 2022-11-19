using CaptchaMvc.Infrastructure;
using CaptchaMvc.Interface;
using CitizenPortal.Controllers;
using CitizenPortal.Security;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using CitizenPortalLib.BLL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
//using CitizenPortal.WebApp.Kiosk.CCTNS;
//using System.Collections.Specialized;

namespace CitizenPortal
{
    public class MvcApplication : System.Web.HttpApplication
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(typeof(AccountController));

        OnilineVisitorsBLL objOnilineVisitorsBLL = new OnilineVisitorsBLL();

        /// <summary>
        /// Modified by : manoj dhyani
        /// Modified Descp:For website Vistiors
        /// </summary>
        protected void Application_Start()
        {
            //AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            GlobalFilters.Filters.Add(new CustomAuthorizeAttribute());
            //Database.SetInitializer<DataContext>(new DataContextInitilizer());
            log4net.Config.XmlConfigurator.Configure(new FileInfo(Server.MapPath("~/Web.config")));

            var defaultCaptchaManager = (DefaultCaptchaManager)CaptchaMvc.Infrastructure.CaptchaUtils.CaptchaManager;
            //defaultCaptchaManager.ImageUrlFactory = (helper, pair) => ImageUrlFactory(defaultCaptchaManager, helper, pair);
            //defaultCaptchaManager.RefreshUrlFactory = RefreshUrlFactory;
            //here code statrt for visting site
            //Application["OnlineUser"] = 263;//for online vistors
            //Application["TotalUser"] = objOnilineVisitorsBLL.GetAllOnlineVisitors();//for total User visitors 


            //CCTNS_APIScheduler.Start();


        }

        //void Session_Start(object sender, EventArgs e)
        //{
        //    Application.Lock();
        //    objOnilineVisitorsBLL.AddOnlineVisitor();


        //   String OnlineVisitors = objOnilineVisitorsBLL.GetAllOnlineVisitors();

        //    Application["OnlineUser"] = Convert.ToInt32(Application["OnlineUser"]) + 1;
        //    Application["TotalUser"] = OnlineVisitors; //Convert.ToInt32(Application["TotalUser"]) + 1;
        //    Application.UnLock();
        //}



        //protected void Application_BeginRequest(object sender, EventArgs e)
        //{
        //    HttpContext.Current.Response.AddHeader("x-frame-options", "SAMEORIGIN");

        //    HttpContext.Current.Response.Cache.SetAllowResponseInBrowserHistory(false);
        //    HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    HttpContext.Current.Response.Cache.SetNoStore();
        //    Response.Cache.SetExpires(DateTime.Now);
        //    Response.Cache.SetValidUntilExpires(true);
        //    //this is sufficient for click jacking.

        //    ////Check If it is a new session or not , if not then do the further checks
        //    //if (Request.Cookies["ASP.NET_SessionId"] != null && Request.Cookies["ASP.NET_SessionId"].Value != null)
        //    //{
        //    //    string newSessionID = Request.Cookies["ASP.NET_SessionID"].Value;
        //    //    //Check the valid length of your Generated Session ID
        //    //    if (newSessionID.Length <= 24)
        //    //    {
        //    //        //Log the attack details here
        //    //        Response.Cookies["TriedTohack"].Value = "True";
        //    //        throw new HttpException("Invalid Request");
        //    //    }

        //    //    //Genrate Hash key for this User,Browser and machine and match with the Entered NewSessionID
        //    //    if (GenerateHashKey() != newSessionID.Substring(24))
        //    //    {
        //    //        //Log the attack details here
        //    //        Response.Cookies["TriedTohack"].Value = "True";
        //    //        throw new HttpException("Invalid Request");
        //    //    }

        //    //    //Use the default one so application will work as usual//ASP.NET_SessionId
        //    //    Request.Cookies["ASP.NET_SessionId"].Value = Request.Cookies["ASP.NET_SessionId"].Value.Substring(0, 24);
        //    //}

        //}
        //protected void Application_PreSendRequestHeaders(object sender, EventArgs e)
        //{

        //    //Response.Headers.Remove("Server");
        //    //Response.Headers.Set("Server", "My httpd server");
        //    //Response.Headers.Remove("X-AspNet-Version");
        //    //Response.Headers.Remove("X-AspNetMvc-Version");        
        //    HttpApplication app = sender as HttpApplication;
        //    if (null != app && null != app.Request && !app.Request.IsLocal &&
        //        null != app.Context && null != app.Context.Response)
        //    {
        //        NameValueCollection headers = app.Context.Response.Headers;
        //        if (null != headers)
        //        {
        //            headers.Remove("Server");
        //        }
        //    }
        //}

        //protected void Application_EndRequest(object sender, EventArgs e)
        //{
        //    ////Pass the custom Session ID to the browser.
        //    //if (Response.Cookies["ASP.NET_SessionId"] != null)
        //    //{
        //    //    Response.Cookies["ASP.NET_SessionId"].Value = Request.Cookies["ASP.NET_SessionId"].Value + GenerateHashKey();
        //    //}

        //}

        //void Application_AcquireRequestState(object sender, EventArgs e)
        //{
        //    if (Request.Cookies["AuthToken"] != null)
        //    {
        //        HttpContext.Current.Session["AuthTokenSession"] = GenerateHashKey();

        //    }

        //    else//new visit
        //    {
        //        //HttpCookie myCookie = new HttpCookie("AuthToken");
        //        //myCookie.Value = GenerateHashKey();
        //        //myCookie.Expires = DateTime.Now.AddDays(1d);
        //        //HttpContext.Current.Response.Cookies.Add(myCookie);
        //        //HttpContext.Current.Session["AuthTokenSession"] = GenerateHashKey();

        //    }
        //}

        private string GenerateHashKey()
        {
            StringBuilder myStr = new StringBuilder();
            myStr.Append(Request.Browser.Browser);
            myStr.Append(Request.Browser.Platform);
            myStr.Append(Request.Browser.MajorVersion);
            myStr.Append(Request.Browser.MinorVersion);
            //myStr.Append(Request.LogonUserIdentity.User.Value);
            SHA1 sha = new SHA1CryptoServiceProvider();
            byte[] hashdata = sha.ComputeHash(Encoding.UTF8.GetBytes(myStr.ToString()));
            return Convert.ToBase64String(hashdata);
        }


        //void Session_End(object sender, EventArgs e)
        //{
        //    Session.Abandon();
        //    Session.RemoveAll();
        //    Session.Clear();

        //    Application.Lock();
        //    Application["OnlineUser"] = Convert.ToInt32(Application["OnlineUser"]) - 1;
        //    Application.UnLock();
        //}

        //here end code for visiting site


        private string RefreshUrlFactory(UrlHelper urlHelper, KeyValuePair<string, ICaptchaValue> keyValuePair)
        {
            return urlHelper.Action("Refresh", "DefaultCaptcha", new { area = "" });
        }

        private string ImageUrlFactory(DefaultCaptchaManager captchaManager, UrlHelper urlHelper, KeyValuePair<string, ICaptchaValue> keyValuePair)
        {
            return urlHelper.Action("Generate", "DefaultCaptcha",
                                    new RouteValueDictionary
                                        {
                                    {"area", ""},
                                    {captchaManager.TokenParameterName, keyValuePair.Key}
                                        });
        }

        //protected void Application_PostAuthenticateRequest(Object sender, EventArgs e)
        //{
        //    HttpCookie authCookie = Request.Cookies[FormsAuthentication.FormsCookieName];
        //    if (authCookie != null)
        //    {

        //        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);

        //        CustomPrincipalSerializeModel serializeModel = JsonConvert.DeserializeObject<CustomPrincipalSerializeModel>(authTicket.UserData);
        //        CustomPrincipal newUser = new CustomPrincipal(authTicket.Name);
        //        newUser.LoginID = serializeModel.LoginID;
        //        newUser.FirstName = serializeModel.FirstName;
        //        newUser.LastName = serializeModel.LastName;
        //        newUser.roles = serializeModel.roles;

        //        HttpContext.Current.User = newUser;
        //    }

        //}

        protected void Application_PostAuthorizeRequest()
        {
            System.Web.HttpContext.Current.SetSessionStateBehavior(System.Web.SessionState.SessionStateBehavior.Required);
        }

        //Start Code for errorLogging Web
        void Application_Error_off(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MasterDB"].ToString());


            string que = "select logid from Tbl_ExceptionLoggingToDataBase_Web order by logid desc";
            SqlDataAdapter da = new SqlDataAdapter(que, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                int id = int.Parse(dt.Rows[0]["logid"].ToString());
                int next = id + 1;

                //start
                Exception ex = Server.GetLastError();

                Exception exMsg = Server.GetLastError().GetBaseException();
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                string msg = exMsg.Message.ToString();

                string stackTrace = "";

                if (exMsg.StackTrace != null)
                {
                    stackTrace= exMsg.StackTrace.ToString();
                }
                

                //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CharpCorner"].ToString());

                SqlCommand com = new SqlCommand("ExceptionLoggingToDataBase_Web", con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ExceptionMsg", msg.ToString());
                com.Parameters.AddWithValue("@ExceptionType", ex.GetType().ToString());
                com.Parameters.AddWithValue("@ExceptionSource", stackTrace.ToString());
                com.Parameters.AddWithValue("@ExceptionURL", url.ToString());
                con.Open();
                com.ExecuteNonQuery();
                con.Close();

                //HttpContext.Current.Session["ErrorCode"] = next.ToString();
                HttpContext.Current.ClearError();
                Response.Redirect("~/customError.aspx?ID=" + next.ToString());
                //Response.Redirect("~/HttpErrorPage.aspx?msg=" + msg.ToString() + "&type=" + ex.GetType().ToString() + "&trace=" + Server.UrlEncode(stackTrace.ToString()) + "&url=" + url.ToString());


                //Response.Redirect("~/HttpErrorPage.aspx?msg="+msg.ToString()+"&type="+ex.GetType().ToString()+"&trace="+ex.Message.ToString());

                //end
            }
            else
            {

                //start
                Exception ex = Server.GetLastError();

                Exception exMsg = Server.GetLastError().GetBaseException();
                string url = HttpContext.Current.Request.Url.AbsoluteUri;
                string msg = exMsg.Message.ToString();

                string stackTrace = exMsg.StackTrace.ToString();

                //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CharpCorner"].ToString());

                SqlCommand com = new SqlCommand("ExceptionLoggingToDataBase_Web", con);
                com.CommandType = System.Data.CommandType.StoredProcedure;
                com.Parameters.AddWithValue("@ExceptionMsg", msg.ToString());
                com.Parameters.AddWithValue("@ExceptionType", ex.GetType().ToString());
                com.Parameters.AddWithValue("@ExceptionSource", stackTrace.ToString());
                com.Parameters.AddWithValue("@ExceptionURL", url.ToString());
                con.Open();
                com.ExecuteNonQuery();
                con.Close();


                Response.Redirect("/customError.aspx?ID=" + 1);
                //Response.Redirect("~/HttpErrorPage.aspx?msg=" + msg.ToString() + "&type=" + ex.GetType().ToString() + "&trace=" + Server.UrlEncode(stackTrace.ToString()) + "&url=" + url.ToString());


                //Response.Redirect("~/HttpErrorPage.aspx?msg="+msg.ToString()+"&type="+ex.GetType().ToString()+"&trace="+ex.Message.ToString());

                //end
            }



        }

        //End code for errorLogging Web
        protected void Application_Error_old_2(object sender, EventArgs e)
        {

            var httpContext = ((MvcApplication)sender).Context;
            var currentController = " ";
            var currentAction = " ";
            var currentRouteData = RouteTable.Routes.GetRouteData(new HttpContextWrapper(httpContext));

            log.Error("ERROR START : " + DateTime.Now);
            log.Error("Message => " + httpContext.Error.Message + Environment.NewLine +
                " :: Source => " + httpContext.Error.Source + Environment.NewLine +
                " :: Exception => " + httpContext.Error.InnerException + Environment.NewLine +
                " :: StackTrace => " + httpContext.Error.StackTrace);
            log.Error("ERROR END : " + DateTime.Now);

            if (currentRouteData != null)
            {
                if (currentRouteData.Values["controller"] != null && !String.IsNullOrEmpty(currentRouteData.Values["controller"].ToString()))
                {
                    currentController = currentRouteData.Values["controller"].ToString();
                }

                if (currentRouteData.Values["action"] != null && !String.IsNullOrEmpty(currentRouteData.Values["action"].ToString()))
                {
                    currentAction = currentRouteData.Values["action"].ToString();
                }
            }

            var ex = Server.GetLastError();
            var controller = new ErrorController();
            var routeData = new RouteData();
            var action = "Index";

            if (ex is HttpException)
            {
                var httpEx = ex as HttpException;

                switch (httpEx.GetHttpCode())
                {
                    case 404:
                        action = "NotFound";
                        break;

                        // others if any
                }
            }

            httpContext.ClearError();
            httpContext.Response.Clear();
            httpContext.Response.StatusCode = ex is HttpException ? ((HttpException)ex).GetHttpCode() : 500;
            httpContext.Response.TrySkipIisCustomErrors = true;

            routeData.Values["controller"] = "Error";
            routeData.Values["action"] = action;

            controller.ViewData.Model = new HandleErrorInfo(ex, currentController, currentAction);
            ((IController)controller).Execute(new RequestContext(new HttpContextWrapper(httpContext), routeData));
        }

        protected void Application_PreSendRequestHeaders()
        {
            HttpContext.Current.Response.Headers.Remove("X-Powered-By");
            HttpContext.Current.Response.Headers.Remove("X-AspNet-Version");
            HttpContext.Current.Response.Headers.Remove("X-AspNetMvc-Version");
            HttpContext.Current.Response.Headers.Remove("Microsoft-IIS/10.0");
            HttpContext.Current.Response.Headers.Remove("Server");
        }
    }
}
