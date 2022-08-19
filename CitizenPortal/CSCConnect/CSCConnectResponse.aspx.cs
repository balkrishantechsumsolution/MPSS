using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.CSCConnect
{
    public partial class CSCConnectResponse : System.Web.UI.Page
    {
        CSCConnectBLL m_CSCConnectBLL = new CSCConnectBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoginCheckOMT();
        }

        protected void LoginCheckOMT()
        {
           
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
            }

        }
    }
}