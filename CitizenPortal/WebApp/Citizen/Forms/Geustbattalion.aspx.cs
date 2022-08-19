using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Citizen.Forms
{
    public partial class Geustbattalion : System.Web.UI.Page
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

            if (Request.QueryString["SvcID"] == "386")
            {
                Response.Redirect("/WebApp/KIOSK/FORMS/BasicDetail.aspx?SvcID=386&URL=/WebApp/Kiosk/Complaint/Complaint.aspx");
            }
            else if (Request.QueryString["SvcID"] == "387")
            {
                Response.Redirect("/WebApp/KIOSK/FORMS/BasicDetail.aspx?SvcID=387&URL=/WebApp/Kiosk/Habisha/Habisha.aspx");
            }
            else if (Request.QueryString["SvcID"] == "388")
            {
                if (Request.QueryString["Mode"] != null && Request.QueryString["Mode"].ToString() == "C")
                {
                    Session["HomePage"] = "/WebApp/Kiosk/OISF/battalionForm.aspx?SvcID=388&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
                    Response.Redirect("/WebApp/Kiosk/OISF/battalionForm.aspx?SvcID=388&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0");
                }
                else
                {
                    Session["HomePage"] = "/WebApp/Kiosk/OISF/initial_page.aspx?SvcID=388&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
                    Response.Redirect("/WebApp/Kiosk/OISF/initial_page.aspx?SvcID=388&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0");
                }
            }
            else if (Request.QueryString["SvcID"] == "389")
            {
                URL = "/WebApp/KIOSK/MenialStaff/GroupD.aspx?SvcID=389&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
                Session["HomePage"] = URL;
                Response.Redirect(URL);
            }
            else if (Request.QueryString["SvcID"] == "390")
            {
                URL = "/WebApp/KIOSK/TPSC/TPSC.aspx?SvcID=390&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
                Session["HomePage"] = URL;
                Response.Redirect(URL);
            }
            else
            {

                if (Request.QueryString["SvcID"] != null && Request.QueryString["SvcID"].ToString() != "")
                {

                    Response.Redirect("/WebApp/KIOSK/FORMS/OfficeOfficer.aspx?SvcID=" + Request.QueryString["SvcID"].ToString());

                }
                else
                    Response.Redirect("/WebApp/KIOSK/FORMS/OfficeOfficer.aspx");
            }
        }
    }
}