using System;
using System.Collections.Generic;
using System.Linq;
using System.Security;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Master
{
    public static class AntiforgeryChecker
    {
        public static void Check(MasterPage page, HiddenField antiforgery)
        {
            //if (!page.IsPostBack)
            //{
            //    Guid antiforgeryToken = Guid.NewGuid();
            //    page.Session["AntiforgeryToken"] = antiforgeryToken;
            //    antiforgery.Value = antiforgeryToken.ToString();
            //}
            //else
            //{
            //    Guid stored = (Guid)page.Session["AntiforgeryToken"];
            //    Guid sent = new Guid(antiforgery.Value);
            //    if (sent != stored)
            //    {
            //        throw new SecurityException("XSRF Attack Detected!");
            //    }
            //}
        }
    }
    public partial class G2GMaster : System.Web.UI.MasterPage
    {

        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;


        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            AntiforgeryChecker.Check(this, antiforgery);
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            /// Added for check Cookies value with session value ...
            if (Session["AuthToken"] != null
                     && Request.Cookies["AuthToken"] != null)
            {
                if (!Session["AuthToken"].ToString().Equals(
                 Request.Cookies["AuthToken"].Value))
                {
                    HttpCookie myCookie = new HttpCookie("AuthToken");
                    myCookie.Value = "";
                    myCookie.Expires = DateTime.Now.AddMinutes(-1);
                    HttpContext.Current.Response.Cookies.Add(myCookie);
                    //HttpContext.Current.Response.Cookies.Remove("AuthToken");
                    ////Request.Cookies["AuthToken"].Expires = DateTime.Now.AddDays(-1); 
                    HttpContext.Current.Session["AuthTokenSession"] = null;
                    Response.Redirect("/g2c/forms/index.aspx");

                }
                else
                { }

            }
            else
            {
                HttpCookie myCookie = new HttpCookie("AuthToken");
                myCookie.Value = "";
                myCookie.Expires = DateTime.Now.AddMinutes(-1);
                HttpContext.Current.Response.Cookies.Add(myCookie);
                //HttpContext.Current.Response.Cookies.Remove("AuthToken");
                ////Request.Cookies["AuthToken"].Expires = DateTime.Now.AddDays(-1); 
                HttpContext.Current.Session["AuthTokenSession"] = null;
                Response.Redirect("/g2c/forms/index.aspx");
            }

            Response.Cache.SetCacheability(HttpCacheability.NoCache);  // HTTP 1.1.
            Response.Cache.AppendCacheExtension("no-store, must-revalidate");
            Response.AppendHeader("Pragma", "no-cache"); // HTTP 1.0.
            Response.AppendHeader("Expires", "0"); // Proxies.

        }

    }
}
