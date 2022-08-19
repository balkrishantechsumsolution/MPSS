using CitizenPortalLib.BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.WebControls;

namespace CitizenPortalLib
{
    public class CommonBasePage : System.Web.UI.Page
    {
        CommonBLL m_CommonBLL;
        public CommonBasePage()
        {

            this.PreInit += new EventHandler(BasePage_PreInit); //TODO: To be activated later
            this.Load += new EventHandler(BasePage_Load); //TODO: To be activated later

            CultureInfo cultureInfo = new CultureInfo("en-GB");
            cultureInfo.DateTimeFormat.ShortDatePattern = "dd/MM/yyyy";
            cultureInfo.DateTimeFormat.DateSeparator = "/";
            cultureInfo.DateTimeFormat.ShortTimePattern = "";
            cultureInfo.DateTimeFormat.LongTimePattern = "";
            Thread.CurrentThread.CurrentCulture = cultureInfo;
            Thread.CurrentThread.CurrentUICulture = cultureInfo;
        }

        void BasePage_Load(object sender, EventArgs e)
        {
            string test = "";
            string LoginID = "";
            string KioskID = "";
            string AppID = "";
            string ServiceID = "";
            string ReturnURL = "";

        }

        void BasePage_PreInit(object sender, EventArgs e)
        {


            if (Context.Session != null)
            {

                if (Session.IsNewSession)
                {

                    string szCookieHeader = Request.Headers["Cookie"];
                    if ((null != szCookieHeader) && (szCookieHeader.IndexOf("ASP.NET_SessionId") >= 0))
                    {
                        this.Page.Response.Redirect(Page.ResolveUrl("~\\SessionTimeout.aspx"));
                    }
                }
            }


            if (System.Web.HttpContext.Current.Session["__SessionHelper__"] == null)
            {
                this.Page.Response.Redirect(Page.ResolveUrl("~\\Default.aspx"));
            }

            if (Session["LoginID"] == null)
            {
                Response.Redirect("~/Home/Login.aspx");
            }
            else
            {
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
                        Session["AuthToken"] = null;
                        Response.Redirect("/g2c/forms/index.aspx");

                    }
                    else
                    {
                        //-------------if validate then-----------
                        m_CommonBLL = new CommonBLL();
                        string UserType = Session["UserType"].ToString();
                        if (UserType.ToUpper() == "CITIZEN")
                        {
                            string ReqURL = HttpContext.Current.Request.Url.AbsolutePath;
                            DataTable dt = new DataTable();
                            dt = m_CommonBLL.SaveUserRoleAccessPage(Session["LoginID"].ToString(), Session["Role"].ToString(), UserType, ReqURL, Session["LoginID"].ToString());

                        }
                        else if (UserType.ToUpper() == "KIOSK")
                        {
                            string ReqURL = HttpContext.Current.Request.Url.AbsolutePath;
                            DataTable dt = new DataTable();
                            dt = m_CommonBLL.SaveUserRoleAccessPage(Session["LoginID"].ToString(), Session["Role"].ToString(), UserType, ReqURL, Session["LoginID"].ToString());

                        }
                        else if (UserType.ToUpper() == "G2G")//for testing ol
                        {
                            string ReqURL = HttpContext.Current.Request.Url.AbsolutePath;
                            string Roles = Convert.ToString(Session["Role"]);
                            string ID = Session["LoginID"].ToString();
                            DataTable dt = new DataTable();
                            dt = m_CommonBLL.SaveUserRoleAccessPage(ID, Roles, UserType, ReqURL, ID);

                            string mRoles = Convert.ToString(Session["menuRole"]);
                            DataTable dta = new DataTable();
                            dta = m_CommonBLL.GetUserMenuAccess(mRoles, ReqURL, ID, UserType);

                            if (dta != null && dta.Rows[0]["Result"].ToString() == "0")
                            {
                                Response.Redirect("~/Account/Login");
                            }
                        }
                        else
                        {
                            Response.Redirect("~/Account/Login");
                        }
                    }

                }
                else
                {
                    HttpCookie myCookie = new HttpCookie("AuthToken");
                    myCookie.Value = "";
                    myCookie.Expires = DateTime.Now.AddMinutes(-1);
                    HttpContext.Current.Response.Cookies.Add(myCookie);
                    //HttpContext.Current.Response.Cookies.Remove("AuthToken");
                    ////Request.Cookies["AuthToken"].Expires = DateTime.Now.AddDays(-1); 
                    Session["AuthToken"] = null;
                    Response.Redirect("/g2c/forms/index.aspx");
                }

            }

            Response.Cache.SetCacheability(HttpCacheability.NoCache);  // HTTP 1.1.
            Response.Cache.AppendCacheExtension("no-store, must-revalidate");
            Response.AppendHeader("Pragma", "no-cache"); // HTTP 1.0.
            Response.AppendHeader("Expires", "0"); // Proxies.

            m_CommonBLL = new CommonBLL();
        }

        protected System.Data.DataTable ExecuteCommand(string Query)
        {
            return m_CommonBLL.ExecuteCommand(Query);
        }

        public void SetUICulture(Hashtable controls)
        {
            string cultureName = null;
            try
            {
                cultureName = (string)Session["CurrentCulture"];
                Page.UICulture = cultureName;

                foreach (DictionaryEntry entry in controls)
                {
                    switch (entry.Key.GetType().ToString())
                    {
                        case "System.Web.UI.WebControls.Button":
                            ((Button)entry.Key).Text = GetGlobalResourceObject("ConfirmPayment", entry.Value.ToString()).ToString();
                            break; // TODO: might not be correct. Was : Exit Select

                        case "System.Web.UI.WebControls.Label":
                            ((Label)entry.Key).Text = GetGlobalResourceObject("ConfirmPayment", entry.Value.ToString()).ToString();
                            break; // TODO: might not be correct. Was : Exit Select

                        case "System.Web.UI.RadioButtonList":
                            ((RadioButtonList)entry.Key).Text = GetGlobalResourceObject("ConfirmPayment", entry.Value.ToString()).ToString();
                            break; // TODO: might not be correct. Was : Exit Select

                        case "System.Web.UI.RadioButton":
                            ((RadioButton)entry.Key).Text = GetGlobalResourceObject("ConfirmPayment", entry.Value.ToString()).ToString();
                            break; // TODO: might not be correct. Was : Exit Select

                        case "System.Web.UI.WebControls.LinkButton":
                            ((LinkButton)entry.Key).Text = GetGlobalResourceObject("ConfirmPayment", entry.Value.ToString()).ToString();
                            break; // TODO: might not be correct. Was : Exit Select

                        case "System.Web.UI.WebControls.DataControlFieldHeaderCell":
                            ((DataControlFieldHeaderCell)entry.Key).Text = GetGlobalResourceObject("ConfirmPayment", entry.Value.ToString()).ToString();
                            break; // TODO: might not be correct. Was : Exit Select

                        case "System.Web.UI.WebControls.WizardStep":
                            ((WizardStep)entry.Key).Title = GetGlobalResourceObject("ConfirmPayment", entry.Value.ToString()).ToString();
                            break; // TODO: might not be correct. Was : Exit Select

                        case "System.Web.UI.WebControls.DataControlRowType.Header":
                            ((DataControlFieldHeaderCell)entry.Key).Text = GetGlobalResourceObject("ConfirmPayment", entry.Value.ToString()).ToString();
                            break; // TODO: might not be correct. Was : Exit Select

                        case "System.Web.UI.WebControls.Panel":
                            ((Panel)entry.Key).GroupingText = GetGlobalResourceObject("ConfirmPayment", entry.Value.ToString()).ToString();
                            break; // TODO: might not be correct. Was : Exit Select
                    }

                }
            }
            catch (Exception ex)
            {

            }

        }

    }
}
