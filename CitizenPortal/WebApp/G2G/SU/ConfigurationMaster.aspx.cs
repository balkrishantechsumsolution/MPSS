using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using CitizenPortalLib;
using CitizenPortalLib.DataStructs;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class ConfigurationMaster : System.Web.UI.Page
    {
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

        string LoginID = "";
        int Department;
        protected void Page_Load(object sender, EventArgs e)
        {

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        

        private void BindGrid()
        {
            DataTable dt = null;
            dt = m_G2GDashboardBLL.GetConfigDetail();

            grdView.DataSource = dt;
            grdView.DataBind();
        }

        protected void grdView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdView.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void grdView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            /*
            GridViewRow row = (GridViewRow)grdView.Rows[e.RowIndex];

            Label lblAPPIDValue = (Label)row.FindControl("lblAPPID");

            TextBox txtEducationalAchievementValue = (TextBox)row.FindControl("txtEducationalAchievement");
            TextBox txtSportAchievementValue = (TextBox)row.FindControl("txtSportAchievement");
            TextBox txtNCCValue = (TextBox)row.FindControl("txtNCC");
            TextBox txtWrittenExamValue = (TextBox)row.FindControl("txtWrittenExam");

            bool result = m_G2GDashboardBLL.UpdateConfigDetails("WRB2", lblAPPIDValue.Text, txtEducationalAchievementValue.Text, txtSportAchievementValue.Text, txtNCCValue.Text, txtWrittenExamValue.Text, "", "", "", "", "");

            grdView.EditIndex = -1;
            if (result)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record Updated Successfully !!!')", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Record Updated !!!')", true);
            }

            */
        }

        protected void grdView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdView.EditIndex = -1;
            BindGrid();
        }


    }
}
