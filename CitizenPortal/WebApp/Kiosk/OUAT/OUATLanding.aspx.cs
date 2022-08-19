using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.OUAT
{
    public partial class OUATLanding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Id"] = "GuestUser";
            Session["role"] = "Citizen";
            string user = Session["Id"].ToString();
            string role = Session["role"].ToString();
            string URL = "";

            Response.Cookies["Id"].Value = user;

            Session["CurrentCulture"] = "en-GB";
            Session["SCAID"] = "";
            Session["SCALoginID"] = "";
            Session["__SessionHelper__"] = "";
            Session["KioskID"] = Session["Id"].ToString();
            Session["LoginID"] = Session["Id"].ToString();
            Session["FullName"] = "Guest User";
            Session["PaymentFlag"] = "C";
            Session["Role"] = role;
            Session["sRole"] = role;
            Session["Balance"] = 0;
            Session["UserType"] = "CITIZEN";
            Session["HomePage"] = "/g2c/forms/index.aspx";

            if (Request.QueryString["SvcID"] == "403")
            {
                Session["HomePage"] = "/WebApp/Kiosk/OUAT/FORMA.aspx?SvcID=403&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
                Response.Redirect("/WebApp/Kiosk/OUAT/FORMA.aspx?SvcID=403&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0");
            }
            else if (Request.QueryString["SvcID"] == "409")
            {
                Session["HomePage"] =
                    "/WebApp/Kiosk/OUAT/AgroFORMA.aspx?SvcID=409&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
                Response.Redirect("/WebApp/Kiosk/OUAT/AgroFORMA.aspx?SvcID=409&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0");
            }
            else
            {
                //if (Request.QueryString["Mode"] != null && Request.QueryString["Mode"].ToString() == "C")
                //{
                //}
                //else if (Request.QueryString["Mode"] != null && Request.QueryString["Mode"].ToString() == "D")
                //{
                //}
                //else
                {
                    Session["HomePage"] =
                        "/WebApp/Kiosk/OUAT/OUATPage.aspx?SvcID=403&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
                    Response.Redirect(
                        "/WebApp/Kiosk/OUAT/OUATPage.aspx?SvcID=403&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0");
                }
            }


        }
    }
}