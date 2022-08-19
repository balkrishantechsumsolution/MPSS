using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CitizenPortalLib.BLL;
using System.Web.UI.HtmlControls;
using System.Text;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Examination
{
    public partial class OffLineExamForm : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divDetails.Visible = false;
                //BindService("132");
                CollegeList();
                CourseList();
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
                    //if (!Session["LoginID"].ToString().Contains("Admin"))
                    if (Session["menuRole"].ToString() == "College" || Session["menuRole"].ToString() == "Principal")
                    {
                        ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(Session["LoginID"].ToString().Substring(0, 3)));
                        ddlCollege.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void CourseList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetCourseCSVTU("");
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCourse.DataSource = dt;
                    ddlCourse.DataTextField = "CourseName";
                    ddlCourse.DataValueField = "CourseCode";
                    ddlCourse.DataBind();
                    ddlCourse.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void ProgramList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetProgramCSVTU(ddlCourse.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlProgram.DataSource = dt;
                    ddlProgram.DataTextField = "ProgramName";
                    ddlProgram.DataValueField = "ProgramCode";
                    ddlProgram.DataBind();
                    ddlProgram.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Exception!','" + ex.Message.ToString() + "');", true);
            }
        }

        private void GetSemester()
        {
            DataTable dt = new DataTable();
            dt = m_FacultyModuleBLL.GetSemesterCSVTU(ddlCourse.SelectedValue, ddlProgram.SelectedValue);
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlSemester.DataSource = dt;
                ddlSemester.DataTextField = "Semester";
                ddlSemester.DataValueField = "Semester";
                ddlSemester.DataBind();
                ddlSemester.Items.Insert(0, new ListItem("Select", "0"));

            }
        }
        public void LoadGridData()
        {
            string LoginID = "";
            int Department;
            string ExamType = "";
            string PayStatus = "";
            string Course = "";
            string Program = "";
            string College = "";
            string RollNo = "";
            string Semester = "";
            string ExamSession = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());
          
            ExamType = ddlExamType.SelectedItem.Text;
            College = ddlCollege.SelectedValue;
            Program = ddlProgram.SelectedValue;
            PayStatus = ddlPayStatus.SelectedValue.ToString();
            Course = ddlCourse.SelectedValue.ToString();
            RollNo = txtRollNo.Text;
            Semester = ddlSemester.SelectedValue;
            ExamSession = ddlSession.SelectedValue;
            DataTable ds = null;
            ds = m_FacultyModuleBLL.GetOfflineExamData(LoginID, College, ExamType, ExamSession, Course,Program, PayStatus, RollNo, Semester);
            
            if (ds.Rows.Count > 0)
            {
                if (ds.Rows.Count > 0)
                {
                    DataGridView.DataSource = ds;
                    divDetails.Visible = true;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataTable dt = null;
                    DataGridView.DataSource = dt;
                    divDetails.Visible = false;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataTable dt = null;
                DataGridView.DataSource = dt;
                divDetails.Visible = false;
            }
            DataGridView.DataBind();
        }     

        protected void DataGridView_PreRender(object sender, EventArgs e)
        {
            if (DataGridView.Rows.Count > 0)
            {
                DataGridView.UseAccessibleHeader = true;
                DataGridView.HeaderRow.TableSection = TableRowSection.TableHeader;
                DataGridView.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                //CheckBox chk = new CheckBox();
                //chk.ID = "chk" + e.Row.RowIndex;
                //e.Row.Cells[i].Controls.Add(chk);
                CheckBox chk = (CheckBox)e.Row.FindControl("chkappid");
                HyperLink hypLnk = (HyperLink)e.Row.FindControl("View");
                HiddenField hfPayFlag = (HiddenField)e.Row.FindControl("hfPayFlag");
                if (hfPayFlag.Value.ToUpper() == "Y")
                {
                    chk.Visible = false;
                    hypLnk.Visible = true;
                    //e.Row.Cells[e.Row.Cells.Count - 1].Visible = true;
                }
                else {
                    chk.Visible = true;
                    //e.Row.Cells[e.Row.Cells.Count - 1].Visible = false;
                    hypLnk.Visible = false;
                }

            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {

                //e.Row.Cells[0].Attributes.Add("style", "display:none");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
        }

        protected void GenrateBatch_Click(object sender, EventArgs e)
        {
            try
            {
                int checkcount = 0;
                string Service = "0";
                string AppID = "";
                string BranchName = "";
                string ExamType = "";
                string Semester = "";
                string PortalFee = "";
                string ExamFee = "";
                string LateFee = "";
                string OtherCharges = "";

                DataTable dt = new DataTable();

                BranchName = Convert.ToString(ddlCourse.SelectedValue);
                ExamType = Convert.ToString(ddlExamType.SelectedItem.Text);
                Semester = ddlSemester.SelectedValue;

                Service = "1473";
                
                StringBuilder sb = new StringBuilder();

                foreach (GridViewRow item in DataGridView.Rows)
                {
                    CheckBox chk = new CheckBox();
                    chk = (CheckBox)item.FindControl("chkappid") as CheckBox;

                    if (!chk.Checked)
                        continue;
                    AppID = ((HiddenField)item.FindControl("HdfAppID") as HiddenField).Value; //item.Cells[1].Text;
                    PortalFee = ((Label)item.FindControl("lbltotalamt") as Label).Text;
                    //ExamFee = ((Label)item.FindControl("lblExamFee") as Label).Text;
                    //LateFee = ((Label)item.FindControl("lblLateFee") as Label).Text;
                    //OtherCharges = ((Label)item.FindControl("OtherCharges") as Label).Text;

                    sb.AppendLine("<BatchData>");
                    sb.AppendLine("<Data>");
                    sb.AppendLine("<SvcID>" + Service + "</SvcID>");
                    sb.AppendLine("<AppID>" + AppID + "</AppID>");
                    sb.AppendLine("<PortalFee>" + PortalFee + "</PortalFee>");
                    //sb.AppendLine("<OtherCharges>" + OtherCharges + "</OtherCharges>");
                    //sb.AppendLine("<ExamFee>" + ExamFee + "</ExamFee>");
                    //sb.AppendLine("<LateFee>" + LateFee + "</LateFee>");
                    sb.AppendLine("</Data>");
                    sb.AppendLine("</BatchData>");
                    checkcount++;
                   
                }
                if (sb.Length > 0 && checkcount > 0)
                {

                    dt = m_FacultyModuleBLL.GenerateBatch_BulkPay(sb.ToString(), txtRemarks.Text, Service, Convert.ToString(Session["LoginID"]),BranchName,ExamType, Semester,ddlSession.SelectedValue);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["Result"].ToString() == "1")
                        {
                            //LoadGridData();
                            txtRemarks.Text = "";
                            //Response.Write("<script>alert('Batch NO. " + dt.Rows[0]["BatchID"].ToString() + " generated successfully for selected service !.')</script>");
                            Response.Redirect("/WebApp/G2G/Bulkpayment/Acknowledgement.aspx?SvcID=" + dt.Rows[0]["ServiceID"].ToString() + "&AppID=" + dt.Rows[0]["AppID"].ToString() + "&PayFlag=" + dt.Rows[0]["PayFlag"].ToString());

                            //Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + dt.Rows[0]["ServiceID"].ToString() + "&AppID=" + dt.Rows[0]["AppID"].ToString());
                        }
                        else
                        {
                            Response.Write("<script>alert('Selected Application batch already generated please check with Batch NO. " + dt.Rows[0]["BatchID"].ToString() + " !.')</script>");
                        }
                    }

                }
                else
                {
                    //please select atleast one rows..
                    Response.Write("<script>alert('Please select atleast one rows.!')</script>");
                }
            }
            catch (Exception ex)
            {
                string m_Message = ex.Message.Replace("\\", "").Replace("\\r\\n", "").Replace(Environment.NewLine, "").Replace("'", "").Replace("\"", "");
                //Response.Write("<script>alert('Please try later \n.error log--" + m_Message + "----')</script>");
                Response.Write("<script>alert('" + m_Message + "')</script>");
                //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", m_Message, true);
            }

        }

        //protected void BulkPayment_Click(object sender, EventArgs e)
        //{

        //}

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProgram.Items.Clear();
            ddlProgram.Items.Insert(0, new ListItem("Select", "0"));
            //ddlSemester.Items.Clear();
            //ddlSemester.Items.Insert(0, new ListItem("Select", "0"));            
            ProgramList();
        }

        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSemester.Items.Clear();
            ddlSemester.Items.Insert(0, new ListItem("Select", "0"));           
            GetSemester();
        }
    }
}