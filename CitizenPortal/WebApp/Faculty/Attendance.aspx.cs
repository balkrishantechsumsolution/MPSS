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
using CitizenPortalLib.DataStructs;

namespace CitizenPortal.WebApp.Faculty
{
    public partial class Attendance : AdminBasePage
    {
        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        List<string> Checked = new List<string>();
        string m_Message = "";
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
                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        btnSave.Visible = true;
                        btnSubmit.Visible = true;
                        btnSubmit.Text = "Re-open for Marks Entry";
                    }
                    else {
                        ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(Session["LoginID"].ToString().Substring(0, 3)));
                        ddlCollege.Enabled = false;
                        btnSubmit.Text = "Submit Save Marks to University";
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

        public void GetSubject()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetFacultySubjectCSVTU(ddlCourse.SelectedValue, ddlProgram.SelectedValue, ddlSemester.SelectedValue, ddlSession.SelectedValue,"");
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlSubject.DataSource = dt;
                    ddlSubject.DataTextField = "Subject";
                    ddlSubject.DataValueField = "Code";
                    ddlSubject.DataBind();
                    ddlSubject.Items.Insert(0, new ListItem("Select", "0"));

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
            string CourseCode = "";
            string ProgramCode = "";
            string College = "";
            string RollNo = "";
            string t_Year = "";
            string Semester = "";
            string SubjectCode = "";
            string SubjectType = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());

            ExamType = ddlExamType.SelectedValue;
            College = ddlCollege.SelectedValue;
            SubjectType = ddlSubjectType.SelectedValue;
            CourseCode = ddlCourse.SelectedValue.ToString();
            ProgramCode = ddlProgram.SelectedValue.ToString();
            t_Year = ddlSession.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            SubjectCode = ddlSubject.SelectedValue.ToString();
            RollNo = txtRollNo.Text;

            DataTable ds = null;
            DataTable t_dt = null;
            DataSet t_Ds = null;
            t_Ds = m_FacultyModuleBLL.GetAttendanceStudentDetail(College, ExamType, CourseCode, ProgramCode, t_Year, Semester, SubjectCode, RollNo, SubjectType);
            ds = t_Ds.Tables[1];
            t_dt = t_Ds.Tables[0];

            if (ds.Rows.Count > 0)
            {
                if (ds.Rows.Count > 0)
                {
                    DataGridView.DataSource = ds;
                    divDetails.Visible = true;


                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        btnSubmit.Enabled = true;
                        btnSave.Visible = true;
                        btnSubmit.Text = "Submit Save Marks to University";
                    }
                    else
                    {
                        //    btnSubmit.Visible = true;
                        //    btnSave.Visible = true;
                        //}

                        string PaidStudent = "", PaperStudent = "", InternalTotal = "", InternalCount = "", PracticalTotal = "", PracticalCount = "";
                        if (t_dt.Rows.Count != 0)
                        {
                            PaidStudent = t_dt.Rows[0]["PaidStudent"].ToString();
                            PaperStudent = t_dt.Rows[0]["PaperStudent"].ToString();
                            InternalTotal = t_dt.Rows[0]["InternalTotal"].ToString();
                            InternalCount = t_dt.Rows[0]["InternalCount"].ToString();
                            PracticalTotal = t_dt.Rows[0]["PracticalTotal"].ToString();
                            PracticalCount = t_dt.Rows[0]["PracticalCount"].ToString();

                            if (t_dt.Rows[0]["IsEnableButton"].ToString() == "1")
                            {
                                btnSubmit.Enabled = true;
                                btnPrint.Text = "Print Submitted Marks";
                            }
                            else
                            { btnSubmit.Enabled = false; btnPrint.Text = "Verification Print"; }
                        }
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataGridView.DataSource = null;
                    DataGridView.DataBind();
                    divDetails.Visible = false;
                }
            }
            else
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataGridView.DataSource = null;
                DataGridView.DataBind();
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
                Label IsSubmitted = (Label)e.Row.FindControl("IsSubmitted");
                

                if (IsSubmitted.Text == "Y")
                {
                    e.Row.Cells[1].Enabled = false;
                    e.Row.Cells[8].Enabled = false;
                    btnSave.Visible = false;
                    btnSubmit.Visible = false;
                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        btnSubmit.Visible = true;
                        btnSubmit.Text = "Re-open for Marks Entry";
                    }
                }
                else
                {
                    e.Row.Cells[1].Enabled = true;
                    e.Row.Cells[8].Enabled = true;
                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        //btnSave.Visible = false;
                        //btnSubmit.Visible = false;
                        //e.Row.Cells[1].Enabled = false;
                        //e.Row.Cells[8].Enabled = false;
                    }
                    else
                    {
                        btnSave.Visible = true;
                        btnSubmit.Visible = true;
                    }
                    
                }
                /*
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
                */

            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                //if (ddlSemester.SelectedValue == "4SEM" || ddlSemester.SelectedValue == "5SEM" || ddlSemester.SelectedValue == "6SEM")
                //{
                    
                //    e.Row.Cells[7].Visible = false;
                //    e.Row.Cells[8].Visible = false;
                //}
                //e.Row.Cells[0].Attributes.Add("style", "display:none");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
        }
                
        public string isApproved(string flg, string req4)
        {
            bool isEnable = false;
            string show = "";

            switch (req4.Trim())
            {
                case "U":
                    {
                        if (flg.Trim().Substring(0, 1) == "U" || flg.Trim().Substring(3, 1) == "U" || flg.Trim().Substring(0, 1) == "A" || flg.Trim().Substring(3, 1) == "A")
                        {
                            isEnable = false;
                            show = "submitted";
                        }
                        else
                        {
                            isEnable = true;
                            show = "Not submitted";
                        }
                        break;
                    }
                case "A":
                    {
                        //if (flg.Trim().Substring(0, 1) == "U" || flg.Trim().Substring(3, 1) == "U")
                        //{
                        //    isEnable = true;
                        //    show = "Not approved";
                        //}
                        if (flg.Trim().Substring(0, 1) == "A" || flg.Trim().Substring(3, 1) == "A")
                        {
                            isEnable = false;
                            show = "approved";
                        }
                        else
                        {
                            isEnable = true;
                            show = "Not approved";
                        }
                        break;
                    }
                default:
                    {
                        isEnable = false;
                        show = "";
                        break;
                    }
            }
            //return isEnable;
            return show;
        }

        public bool isAbsent(string marks)
        {
            if (marks.Trim().ToUpper() == "Y")
            { return true; }
            else { return false; }
        }

        public bool isApplicable(string flg, string chk4)
        {
            bool isApply = false;

            switch (chk4.Trim())
            {


                case "int":
                    {
                        if (flg.Trim().Substring(0, 1) == "N")
                        {
                            isApply = true;
                        }
                        else { isApply = false; }

                        break;
                    }               

                default:
                    {
                        isApply = false;
                        break;
                    }
            }
            return isApply;
        }

        void GetSelectedRec()
        {
            if (ViewState["Checked"] != null)
            {
                Checked = (List<string>)ViewState["Checked"];
            }
            foreach (GridViewRow rows in DataGridView.Rows)
            {
                if (rows.Cells[0].Controls.Count > 0 && rows.Cells[1].Controls[1].GetType().FullName.Equals(typeof(CheckBox).FullName))
                {
                    CheckBox chk = rows.Cells[1].Controls[1] as CheckBox;
                    HiddenField RowID = rows.Cells[0].Controls[1] as HiddenField;
                    string t_RowID = RowID.Value;
                    if (chk.Checked == true)
                    {
                        if (!Checked.Contains(t_RowID))
                            Checked.Add(t_RowID);
                    }
                    else
                    {
                        if (Checked.Contains(t_RowID))
                            Checked.Remove(t_RowID);
                    }
                }
            }
            ViewState.Remove("Checked");
            ViewState["Checked"] = Checked;
        }

        string GetRecords()
        {
            GetSelectedRec();
            string t_RowID = "";
            if (ViewState["Checked"] != null)
            {
                Checked = (List<string>)ViewState["Checked"];
                int t_itemcount = Checked.Count;
                if (t_itemcount == 0)
                {
                    //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "PageScript", "alert('Please Select a Record');", true);
                    return "";
                }
                for (int i = 0; i < t_itemcount; i++)
                {
                    if (i > 0)
                        t_RowID = t_RowID + ",";

                    t_RowID += Checked[i].Split('_')[0];
                }
                Checked.Clear();
                ViewState["Checked"] = Checked;
                return t_RowID;
            }
            return "";
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int t_UpdateCount = 0;
            string t_RowID = GetRecords();

            if (string.IsNullOrEmpty(t_RowID))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Select Records to continue');", true);
                return;
            }

            string[] t_RowIDArr = t_RowID.Split(',');

            bool t_ShowMsg = false;
            string t_Script = "";
            bool t_status = false;
            m_Message = " Record/s updated";
          
            try
            {

                for (int i = 0; i < t_RowIDArr.Length; i++)
                {
                    foreach (GridViewRow rows in DataGridView.Rows)
                    {
                        CheckBox chkenroll = (CheckBox)rows.FindControl("chkRollNo");

                        if (chkenroll.Checked)
                        {
                            CheckBox chk = rows.Cells[1].Controls[1] as CheckBox;
                            HiddenField RowID = rows.Cells[0].Controls[1] as HiddenField;
                            string chk_RowID = RowID.Value;
                            
                            if(chk_RowID == t_RowIDArr[i])
                            {
                                HiddenField hfRowID = (HiddenField)rows.FindControl("HdfAppID");
                                Label RollNo = (Label)rows.FindControl("RollNo");
                                Label SubjectCode = (Label)rows.FindControl("SubjectCode");
                                CheckBox chkAbent = (CheckBox)rows.FindControl("chkIsAbsent");
                                TextBox t_Attendance = (TextBox)rows.FindControl("txtAttendance");
                                TextBox t_AttendanceRemark = (TextBox)rows.FindControl("txtAttendanceRemark");
                                //TextBox t_PracticalMarkObtain = (TextBox)rows.FindControl("txtPracticalMarkObtain");
                                //TextBox t_TheoryMarkObtain = (TextBox)rows.FindControl("txtTheoryMarkObtain");

                                string[] AFields =
                                {
                                  "RowID"
                                , "RollNo"
                                , "SubjectCode"
                                , "ExamType"
                                , "ExamSession"
                                , "Semester"
                                , "CreatedBy"
                                , "AttendanceRemark"
                                , "AttendaceMark"
                                , "IsAbsent"

                            };

                                MarkAttendance_DT t_MarkAttendance_DT = new MarkAttendance_DT();

                                t_MarkAttendance_DT.RowID = RowID.Value;
                                t_MarkAttendance_DT.RollNo = RollNo.Text;
                                t_MarkAttendance_DT.SubjectCode = SubjectCode.Text;
                                t_MarkAttendance_DT.ExamType = ddlExamType.SelectedValue;
                                t_MarkAttendance_DT.ExamSession = ddlSession.SelectedValue;
                                t_MarkAttendance_DT.Semester = ddlSemester.SelectedValue;
                                t_MarkAttendance_DT.CreatedBy = Session["LoginID"].ToString();
                                if (!chkAbent.Checked) {

                                    /**/
                                    if (t_Attendance.Text.ToUpper() == "")
                                    {
                                        //LoadGridData();
                                        string m_Message = "Please entered attendance!!";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                                        return;
                                    }
                                    
                                    t_MarkAttendance_DT.IsAbsent = "0";
                                    t_MarkAttendance_DT.AttendanceRemark = t_AttendanceRemark.Text;
                                    t_MarkAttendance_DT.AttendaceMark = t_Attendance.Text;
                                    
                                }
                                else
                                {
                                    t_MarkAttendance_DT.IsAbsent = "1";
                                    t_MarkAttendance_DT.AttendaceMark = "0";
                                }


                                FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
                                System.Data.DataTable result = null;
                                string UID = "";

                                result = m_FacultyModuleBLL.MarkedAttendanceData(t_MarkAttendance_DT, AFields);

                                if (result != null && result.Rows.Count > 0)
                                {
                                    if (result.Rows[0]["Result"].ToString() == "1")
                                    {
                                        t_UpdateCount++;
                                        t_ShowMsg = true;
                                    }
                                }

                                break;
                            }

                        }
                    }
                }
                if (t_ShowMsg == true)
                {
                    LoadGridData();
                    t_Script = "alert('\"{0}\" {1}');";
                    t_Script = string.Format(t_Script, t_UpdateCount, m_Message);
                }


            }
            catch (Exception ee)
            {

                t_status = false;
                m_Message = ee.Message.Replace("\\", "").Replace("\\r\\n", "").Replace(Environment.NewLine, "").Replace("'", "").Replace("\"", "");
                t_Script = "alert('\"{0}\" {1}')";
                t_Script = string.Format(t_Script, "Error " + DataGridView.Rows.Count, m_Message.Replace("\r\n", ""));

                //ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Message", "alert('" + ee.Message.Replace("'", "") + ee.StackTrace.Replace(Environment.NewLine, "<br />") + "')", true);
            }
            finally
            {
                
            }

            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", t_Script, true);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string t_RowID = GetRecords();

            if (string.IsNullOrEmpty(t_RowID))
            {
                CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

                System.Data.DataTable result = null;
                string UID = Convert.ToString(Session["LoginID"]);

                string College = ddlCollege.SelectedValue;
                string Coursre = ddlCourse.SelectedValue;
                string ExamType = ddlExamType.SelectedValue;
                string ExamYear = ddlSession.SelectedValue;
                string Semester = ddlSemester.SelectedValue;
                string Subject = ddlSubject.SelectedValue;

                result = m_AdmissionFormBLL.InternalMarkSubmitted(College, Coursre, ExamType, ExamYear, Semester, Subject, UID);

                if (result != null && result.Rows.Count > 0)
                {
                    LoadGridData();
                    string m_Message = "";
                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        m_Message = "Record re-opened for Marks Entry!";
                    }
                    else
                    {
                        m_Message = "Record Submitted to SOEC!";
                    }
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);


                }
            }
            else { 
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please Save the selected Marks then click - Submit the mark to University');", true);
            return;
            }
        }

        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSubject.Items.Clear();
            ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
            GetSubject();
        }

        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProgram.Items.Clear();
            ddlProgram.Items.Insert(0, new ListItem("Select", "0"));
            ddlSemester.Items.Clear();
            ddlSemester.Items.Insert(0, new ListItem("Select", "0"));
            ddlSubject.Items.Clear();
            ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
            ProgramList();
        }

        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSemester.Items.Clear();
            ddlSemester.Items.Insert(0, new ListItem("Select", "0"));
            ddlSubject.Items.Clear();
            ddlSubject.Items.Insert(0, new ListItem("Select", "0"));
            GetSemester();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string t_URL = "/WebApp/Faculty/AttendanceAcknowledgement.aspx?CC=" + ddlCollege.SelectedValue + "&BC=" + ddlCourse.SelectedValue + "&SS=" + ddlSubject.SelectedValue + "&SC=" + ddlSemester.SelectedValue + "&ET=" + ddlExamType.SelectedValue + "&EY=" + ddlSession.SelectedItem.Text + "&PC=" + ddlProgram.SelectedValue;
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('"+ t_URL + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1200,height=600');", true);
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "window.open('../../DataControlManager/Online complain/frmComplaintRevision.aspx?ID=" + _cId + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=30,height=30');", true);


        }
    }
    
}