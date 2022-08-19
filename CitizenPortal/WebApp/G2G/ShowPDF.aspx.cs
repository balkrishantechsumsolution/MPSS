using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G
{
    public partial class ShowPDF : System.Web.UI.Page
    {
        string m_AppID, m_FileName;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["AppID"] == null) return;            
            if (Request.QueryString["FName"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();            
            m_FileName = Request.QueryString["FName"].ToString();

            string t_Directory = "";
            string t_PDFPath = "";
            t_Directory = "/Uploads";

            t_PDFPath = t_Directory + "/" + m_AppID + "/" + m_FileName + "#zoom=100";
            iframepdf.Attributes["src"] = t_PDFPath;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("G2GDashboard.aspx");
        }
    }
}