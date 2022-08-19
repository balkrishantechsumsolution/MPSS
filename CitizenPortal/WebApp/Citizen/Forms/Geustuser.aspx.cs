using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Citizen.Forms
{
    public partial class Geustuser : System.Web.UI.Page
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
            //// Solution for Session Fixation Step 1 
            string strAuthToken = Guid.NewGuid().ToString();
            Session["AuthToken"] = strAuthToken;
            Response.Cookies.Add(new HttpCookie("AuthToken", strAuthToken));

            if (Request.QueryString["SvcID"] == "1466")
            {
                Response.Redirect("/WebApp/Entrance/PhD/PGPhDApplication.aspx?SvcID=1466");
                Session["HomePage"] = "/WebApp/Entrance/PhD/PGPhDApplication.aspx?SvcID=1466";
            }

            if (Request.QueryString["SvcID"] == "1467")
            {
                if (Request.QueryString["Mode"] != null && Request.QueryString["Mode"].ToString() == "C" && Request.QueryString["AppID"] != null)
                {
                    Session["HomePage"] = "/WebApp/Citizen/Forms/Dashboard.aspx?SvcID=1467&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
                    Response.Redirect("/WebApp/Enrollment/StudentForm.aspx?SvcID=1467&AppID=" + Convert.ToString(Request.QueryString["AppID"]));
                }
            }

            if (Request.QueryString["SvcID"] == "1468")
            {
                Response.Redirect("/WebApp/Examination/StudentResetPassword.aspx?AppID=" + Request.QueryString["AppID"] + "&SvcID=1468");
                Session["HomePage"] = "/WebApp/Examination/StudentResetPassword.aspx?AppID=" + Request.QueryString["AppID"] + "&SvcID=1468";
            }

            if (Request.QueryString["SvcID"] == "1469")
            {
                Response.Redirect("/WebApp/Enrollment/EnrollmentForm.aspx?SvcID=" + Request.QueryString["SvcID"].ToString());
                Session["HomePage"] = "/WebApp/Citizen/Forms/Dashboard.aspx?SvcID=1467&DPT=104&DIST=0&BLK=0&PAN=0&OFC=0&OFR=0";
               
            }
        }
    }
}