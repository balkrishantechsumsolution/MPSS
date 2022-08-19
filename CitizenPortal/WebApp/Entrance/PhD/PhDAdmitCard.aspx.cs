using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Entrance.PhD
{
    public partial class PhDAdmitCard : System.Web.UI.Page
    {
        OUATBLL m_OUATBLL = new OUATBLL();
        string m_AppID, m_ServiceID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();


            DataSet dt = m_OUATBLL.CSVTUPhDAdmitCard(m_ServiceID, m_AppID);
            DataTable dtApp = null;
            DataTable dtImage = null;

            if (dt.Tables[0].Rows.Count != 0)
            {
                dtApp = dt.Tables[0];
                dtImage = dt.Tables[1];
            }

            if (dtApp.Rows.Count != 0)
            {
                AppID.Text = dtApp.Rows[0]["AppID"].ToString();
                lblRollNo.Text = dtApp.Rows[0]["RollNo"].ToString();
                ApplicantName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                gender.Text = dtApp.Rows[0]["Gender"].ToString();
                Category.Text = dtApp.Rows[0]["category"].ToString();
                DOBConverted.Text = dtApp.Rows[0]["DOB"].ToString();
                lblDiscipline.Text = dtApp.Rows[0]["DisciplineName"].ToString();
                lblSpecialization.Text = dtApp.Rows[0]["Specialization"].ToString();
                ProfilePhoto.Src = dtImage.Rows[0]["Photograph"].ToString();
                //ProfileSign.Src = dtImage.Rows[0]["Signature"].ToString();
                lblExamCenter.Text = dtApp.Rows[0]["CenterName"].ToString();
                lblType0.Text = dtApp.Rows[0]["IsEntranceExempted"].ToString();
                lblType.Text = dtApp.Rows[0]["IsEntranceExempted"].ToString();
                AppID0.Text = dtApp.Rows[0]["AppID"].ToString();
                lblRollNo0.Text = dtApp.Rows[0]["RollNo"].ToString();
                ApplicantName0.Text = dtApp.Rows[0]["ApplicantName"].ToString();
                gender0.Text = dtApp.Rows[0]["Gender"].ToString();
                Category0.Text = dtApp.Rows[0]["category"].ToString();
                DOBConverted0.Text = dtApp.Rows[0]["DOB"].ToString();
                lblDiscipline0.Text = dtApp.Rows[0]["DisciplineName"].ToString();
                lblSpecialization0.Text = dtApp.Rows[0]["Specialization"].ToString();
                ProfilePhoto0.Src = dtImage.Rows[0]["Photograph"].ToString();
                ProfileSign0.Src = dtImage.Rows[0]["Signature"].ToString();
                lblAddress.Text = dtApp.Rows[0]["CurrentFullAddress"].ToString();
            }
            else
            {
                string m_Message = "Sorry! Admit Card for Applicantion No. " + m_AppID + " not announced. ";
                lblMsg.Text = m_Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);
            }
        }
    }
}