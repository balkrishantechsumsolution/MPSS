using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.Forms
{
    public partial class Download : System.Web.UI.Page
    {
        string m_db = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request["file"] != null)
            {
                string file = Request["file"].ToString();
                if (Request.QueryString["a"] != null)
                {
                    m_db = Convert.ToString(Request.QueryString["a"]);
                }
                fileDownload(file);
            }
        }
        private void fileDownload(string file)
        {
            DocumentBriefcaseBLL t_DocumentBriefcaseBLL = new DocumentBriefcaseBLL();
            DataTable dtDoc = t_DocumentBriefcaseBLL.GetSavedDocumentDetailsById(file, m_db);
            if (dtDoc.Rows.Count > 0)
            {
                if (dtDoc.Rows[0]["keyfield"].ToString() == file)
                {
                    this.ifImg.Attributes["src"] = dtDoc.Rows[0]["path"].ToString();
                }
            }

        }
    }
}