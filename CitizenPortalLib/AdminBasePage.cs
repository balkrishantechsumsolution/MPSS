using CitizenPortalLib.BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.WebControls;

namespace CitizenPortalLib
{
    public class AdminBasePage : System.Web.UI.Page
    {
        CommonBLL m_CommonBLL;

        public AdminBasePage()
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

            //It appears from testing that the Request and Response both share the 
            // same cookie collection.  If I set a cookie myself in the Reponse, it is 
            // also immediately visible to the Request collection.  This just means that 
            // since the ASP.Net_SessionID is set in the Session HTTPModule (which 
            // has already run), thatwe can't use our own code to see if the cookie was 
            // actually sent by the agent with the request using the collection. Check if 
            // the given page supports session or not (this tested as reliable indicator 
            // if EnableSessionState is true), should not care about a page that does 
            // not need session
            if (Context.Session != null)
            {
                //Tested and the IsNewSession is more advanced then simply checking if 
                // a cookie is present, it does take into account a session timeout, because 
                // I tested a timeout and it did show as a new session
                if (Session.IsNewSession)
                {
                    // If it says it is a new session, but an existing cookie exists, then it must 
                    // have timed out (can't use the cookie collection because even on first 
                    // request it already contains the cookie (request and response
                    // seem to share the collection)
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
                Response.Redirect("~/Account/Login");
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
                        string UserType = Session["UserType"].ToString();
                        string mRoles = Convert.ToString(Session["menuRole"]);
                        string ID = Session["LoginID"].ToString();
                        string ReqURL = HttpContext.Current.Request.Url.AbsolutePath;
                        
                        if (UserType == "G2G")
                        {
                            m_CommonBLL = new CommonBLL();
                            
                            string Roles = Convert.ToString(Session["Role"]);
                            
                            DataTable dt = new DataTable();
                            dt = m_CommonBLL.SaveUserRoleAccessPage(ID, Roles, UserType, ReqURL, ID);


                            DataTable dta = new DataTable();
                            dta = m_CommonBLL.GetUserMenuAccess(mRoles, ReqURL, ID, UserType);

                            if (dta != null && dta.Rows[0]["Result"].ToString() == "0")
                            {
                                Response.Redirect("~/Account/Login");
                            }

                            //DataTable dt = null;
                            //if (dt != null && dt.Rows[0]["UserPage"].ToString().Contains(ReqURL))
                            //{

                            //}         
                            //foreach(DataRow dr in dt.Rows)
                            //{
                            //    if (dr["UserPage"].ToString().Contains(ReqURL))
                            //    {
                            //        break;
                            //    }
                            //}     

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
