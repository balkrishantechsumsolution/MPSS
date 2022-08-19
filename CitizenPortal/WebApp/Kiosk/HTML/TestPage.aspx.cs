using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.HTML
{
    public partial class TestPage : System.Web.UI.Page
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            GetSubjectType();
        }

        private void GetSubjectType()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetPaperSubjectType("AH", "5SEM");
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "SubjectType";
                    ddlSubject.DataValueField = "SubjectType";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void Submit(object sender, EventArgs e)
        {
            string message = "";
            foreach (ListItem item in ddlSubject.Items)
            {
                if (item.Selected)
                {
                    message += item.Text + " " + item.Value + "\\n";
                }
            }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
        }
    }
}