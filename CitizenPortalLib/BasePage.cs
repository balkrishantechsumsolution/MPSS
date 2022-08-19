using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Globalization;
using System.Threading;
using CitizenPortalLib.BLL;
using System.Collections;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web;

namespace CitizenPortalLib
{
    public class BasePage : System.Web.UI.Page
    {
        CommonBLL m_CommonBLL;

        public BasePage()
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

            if (false && Session["sRole"].ToString() != "MolAdmin")
            {

                if (Request.QueryString["str"] != null)
                {
                    QueryStringEncryptDecrypt.QryStringsCollection qs = QueryStringEncryptDecrypt.DecryptQueryString(Request.QueryString["str"]);
                    if (qs.Count > 0)
                    {
                        if (qs["LoginID"] != null)
                            LoginID = qs["LoginID"].ToString();

                        if (qs["KioskID"] != null)
                            KioskID = qs["KioskID"].ToString();

                        if (qs["AppID"] != null)
                            AppID = qs["AppID"].ToString();

                        if (qs["ServiceID"] != null)
                            ServiceID = qs["ServiceID"].ToString();

                        if (qs["ReturnURL"] != null)
                            ReturnURL = qs["ReturnURL"].ToString();
                    }
                }
                else
                {
                    if (Request.QueryString["LoginID"] != null)
                        LoginID = Request.QueryString["LoginID"].ToString();

                    if (Request.QueryString["KioskID"] != null)
                        KioskID = Request.QueryString["KioskID"].ToString();

                    if (Request.QueryString["AppID"] != null)
                        AppID = Request.QueryString["AppID"].ToString();

                    if (Request.QueryString["ServiceID"] != null)
                        ServiceID = Request.QueryString["ServiceID"].ToString();

                    if (Request.QueryString["ReturnURL"] != null)
                        ReturnURL = Request.QueryString["ReturnURL"].ToString();
                }

                if ((ServiceID != null))
                {

                    if (!string.IsNullOrEmpty(ServiceID))
                    {
                        string con = ConfigurationManager.ConnectionStrings["Frame"].ConnectionString.ToString();
                        //DataSet ds = default(DataSet);
                        DataTable dt = new DataTable();
                        string t_SQLQuery = null;
                        string Role = null;

                        Role = Session["sRole"].ToString();
                        //t_SQLQuery = "Select Ser from mstServices Nolock where Active='True' and Role Like '%" + Role + "%' And IsNull(AffidavitServiceID, SvcID) = '" + ServiceID + "'"
                        t_SQLQuery = "Select SvcID from mstServices where AffidavitServiceID = '" + ServiceID + "'";
                        dt = ExecuteCommand(t_SQLQuery);
                        //ds = CommonFunction.ExecuteQuery(con, t_SQLQuery);

                        if ((dt != null) && dt.Rows.Count > 0)
                        {
                            ServiceID = dt.Rows[0]["SvcID"].ToString();
                        }

                        t_SQLQuery = "Select Ser from mstServices Nolock where Active='True' and Role Like '%" + Role + "%' And SvcID = '" + ServiceID + "'";
                        dt = ExecuteCommand(t_SQLQuery);
                        //ds = CommonFunction.ExecuteQuery(con, t_SQLQuery);

                        if ((dt != null) && dt.Rows.Count == 0)
                        {
                            //Response.Redirect("~/Home/DispCustomMessage.aspx?Msg=You do not have access to this Service")
                            Response.Redirect("~/Home/DispCustomMessage.aspx?Msg=You do not have access to this Service");

                        }
                    }
                }
                else
                {
                    //Response.Redirect("~/Home/DispCustomMessage.aspx?Msg=You do not have access to this Service");
                }
            }


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
                Response.Redirect("~/Home/Login.aspx");
            }
            else if(false)
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
                        else if (UserType.ToUpper() == "KIOSK")
                        {
                            string ReqURL = HttpContext.Current.Request.Url.AbsolutePath;
                            DataTable dt = new DataTable();
                            dt = m_CommonBLL.SaveUserRoleAccessPage(Session["LoginID"].ToString(), Session["Role"].ToString(), UserType, ReqURL, Session["LoginID"].ToString());

                        }
                        //else if (UserType.ToUpper() == "G2G")//for testing only
                        //{
                        //    string ReqURL = HttpContext.Current.Request.Url.AbsolutePath;
                        //    string Roles = Convert.ToString(Session["Role"]);
                        //    string ID = Session["LoginID"].ToString();
                        //    DataTable dt = new DataTable();
                        //    dt = m_CommonBLL.SaveUserRoleAccessPage(ID, Roles, UserType, ReqURL, ID);
                        //}
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
