using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class SURollNumber : BasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        string LoginID = ""; int checkcount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //GenrateRollNoSP
            if (!IsPostBack)
            {
                CollegeList();
                BranchList();
                BtnSaveRollNo.Visible = false;
            }
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //branch subject list
                string course = "";
                string SubjectType = "";
                if (ddlBranch.SelectedIndex > 0)
                {
                    course = ddlBranch.SelectedItem.Text;
                }
                DataSet dt = new DataSet();
                dt = m_AdmissionFormBLL.GetCBCSCourseSubject(course, "NA");
                if (dt != null && dt.Tables[0].Rows.Count > 0)
                {
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "SubjectName";
                    ddlSubject.DataValueField = "SubjectCode";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void CollegeList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.Get_CollegeList();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCollege.DataSource = dt;
                    ddlCollege.DataTextField = "CollegeName";
                    ddlCollege.DataValueField = "CollegeCode";
                    ddlCollege.DataBind();
                    ddlCollege.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void BranchList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetCBCSCourseLists();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlBranch.DataSource = dt;
                    ddlBranch.DataTextField = "Course";
                    ddlBranch.DataValueField = "BranchCode";
                    ddlBranch.DataBind();
                    ddlBranch.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Data();
        }

        protected void BtnSaveRollNo_Click(object sender, EventArgs e)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                //sb.AppendLine("<?xml version=\"1.0\" ?>");
                foreach (GridViewRow row in DataGridView.Rows)
                {

                    string AppID = "";
                    string RollNo = "";
                    

                    LoginID = Session["LoginID"].ToString();

                    AppID = ((HiddenField)row.FindControl("HDFAppID")).Value;
                    CheckBox ChkItem = (CheckBox)row.FindControl("CheckBox1");
                    RollNo = ((Label)row.FindControl("lblRollNo")).Text;

                    if (!ChkItem.Checked)
                        continue;
                    sb.AppendLine("<RollNoData>");
                    sb.AppendLine("<Data>");
                    sb.AppendLine("<AppID>" + AppID + "</AppID>");
                    sb.AppendLine("<RollNumber>" + RollNo + "</RollNumber>");
                    sb.AppendLine("</Data>");
                    sb.AppendLine("</RollNoData>");

                    checkcount++;

                }
                if (sb.Length > 1)
                {
                    DataTable dt = new DataTable();
                    dt = m_AdmissionFormBLL.Insert_RollNoList(sb.ToString(), LoginID);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        CitizenPortalLib.EMailSMS SMSServices = new CitizenPortalLib.EMailSMS();
                        //foreach (DataRow dr in dt.Rows)
                        //{
                        ////send to applicant
                        //if (dr["MobileNo"].ToString() != "")
                        //{
                        //    SMSServices.sendsms(dr["MobileNo"].ToString(), dr["SMSText"].ToString());
                        //}
                        //}


                        Data();
                        //RedirectPageWithMsg(this.Page, URL_t, "Transaction Refund Reference No For this Request is " + RequestNo + " Kindly Note Down for Further Reference");
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Data Save','Roll number save successfully !');", true);

                    }
                }
                else
                {
                    if (checkcount == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Checkbox Validate','Please checked atleast one rows !');", true);
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void Data()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.Get_RollNoList(ddlBranch.SelectedValue, ddlSubject.SelectedValue, ddlCollege.SelectedValue, ddlYear.SelectedValue, ddlRollNo.SelectedItem.Text);
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataGridView.Visible = true;
                    DataGridView.DataSource = dt;
                    DataGridView.DataBind();
                    if (ddlRollNo.SelectedItem.Text == "Generated")
                    {
                        BtnSaveRollNo.Visible = false;
                    }
                    else
                    {
                        BtnSaveRollNo.Visible = true;
                    }
                }
                else
                {
                    DataGridView.Visible = false;
                    BtnSaveRollNo.Visible = false;
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Not Found','No Record Found For Search Criteria !');", true);
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void DataGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    LoginID = Session["LoginID"].ToString();

                    if (ddlRollNo.SelectedItem.Text == "Generated")
                    {
                        DataGridView.HeaderRow.Cells[0].Visible = false;
                        e.Row.Cells[0].Visible = false;
                        

                    }
                    else
                    {
                        DataGridView.HeaderRow.Cells[0].Visible = true;
                        e.Row.Cells[0].Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}