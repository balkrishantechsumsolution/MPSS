using CitizenPortalLib.DataStructs;
using iTextSharp.text.pdf;
using java.lang;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SqlHelper;
using sun.net.www.content.text;
using sun.security.jca;
using sun.swing;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using Exception = System.Exception;
namespace CitizenPortal.WebApp.Kiosk.MPSS
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        static data sqlhelper = new data();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            var UserName = txtUserName.Text.Trim();
            var Password = txtPassword.Text.Trim();

            SqlParameter[] parameter = {
                        new SqlParameter("@UserName",UserName),
                        new SqlParameter("@Password",Password)
            };
            dt = sqlhelper.ExecuteDataTable("GetMPBOCLoginSP", parameter);

            if (dt.Rows.Count > 0)
            {
                Session["LoginID"] = dt.Rows[0]["UserName"].ToString(); ;
                Response.Redirect("MISReports.aspx");
            }
            else
            {
                Label1.Text = "Your username and Password is incorrect";
                Label1.ForeColor = System.Drawing.Color.Red;

            }
        }
    }
}