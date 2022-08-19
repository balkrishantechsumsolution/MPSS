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

namespace CitizenPortal.WebApp.Result
{
    public partial class ResultData : AdminBasePage
    {
        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();

        StudentResultBLL t_ObjBLL = new StudentResultBLL();

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

                    //if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    //{
                    //    ddlCourse.Enabled = true;
                    //}
                    //else
                    //{
                    //    string t_CourseCode = Session["LoginID"].ToString().Split('.')[1];
                    //    ddlCourse.SelectedIndex = ddlCourse.Items.IndexOf(ddlCourse.Items.FindByValue(t_CourseCode));
                    //    ddlCourse.Enabled = false;
                    //    ProgramList();
                    //}

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

                    //if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    //{
                    //    ddlProgram.Enabled = true;
                    //}
                    //else
                    //{
                    //    string t_ProgramCode = Session["LoginID"].ToString().Split('.')[2];

                    //    ddlProgram.SelectedIndex = ddlProgram.Items.IndexOf(ddlProgram.Items.FindByValue(t_ProgramCode));
                    //    ddlProgram.Enabled = false;
                    //    GetSemester();
                    //}
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

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());

            ExamType = ddlExamType.SelectedItem.Text;
            College = ddlCollege.SelectedValue;

            CourseCode = ddlCourse.SelectedValue.ToString();
            ProgramCode = ddlProgram.SelectedValue.ToString();
            t_Year = ddlSession.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            
            RollNo = txtRollNo.Text;

            DataTable ds = null;
            DataTable t_dt = null;
            DataSet t_Ds = null;
            DataSet t_DS = null;
            ds = t_ObjBLL.StudentResultData(College,CourseCode,ProgramCode, RollNo, t_Year, ExamType, Semester);
            //ds = t_Ds.Tables[1];
            //t_dt = t_Ds.Tables[0];

            if (ds.Rows.Count > 0)
            {
                if (ds.Rows.Count > 0)
                {
                    grdResult.DataSource = ds;                   

                    
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    grdResult.DataSource = null;
                    grdResult.DataBind();
                    divDetails.Visible = false;
                }
            }
            else
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                grdResult.DataSource = null;
                grdResult.DataBind();
                divDetails.Visible = false;
            }
            grdResult.DataBind();
        }     

        protected void grdResult_PreRender(object sender, EventArgs e)
        {
            if (grdResult.Rows.Count > 0)
            {
                grdResult.UseAccessibleHeader = true;
                grdResult.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdResult.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            int i = 0;
            HtmlAnchor t_Anchor = null;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                //if (ddlStatus.SelectedValue == "P")
                {
                    t_Anchor.Attributes.Add("onclick", "TakeAction('"+ e.Row.Cells[1].Text + "', '', '" + e.Row.Cells[i].Text + "')");
                    e.Row.Cells[i - 1].Attributes.Add("style", "display:none");
                }

                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                //e.Row.Cells[0].Attributes.Add("style", "display:none");
                i++;
            }
            t_Anchor = null;
            /*
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
                

            }*/
            /*
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
                */
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
            foreach (GridViewRow rows in grdResult.Rows)
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
                    foreach (GridViewRow rows in grdResult.Rows)
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
                                TextBox t_TheoryMO_CT = (TextBox)rows.FindControl("txtTheoryMO_CT");
                                TextBox t_SessionalMO_TA = (TextBox)rows.FindControl("txtSessionalMO_TA");
                                TextBox t_PracticalMarkObtain = (TextBox)rows.FindControl("txtPracticalMarkObtain");
                                TextBox t_TheoryMarkObtain = (TextBox)rows.FindControl("txtTheoryMarkObtain");

                                string[] AFields =
                                {
                                  "RowID"
                                , "RollNo"
                                , "SubjectCode"
                                , "ExamType"
                                , "ExamSession"
                                , "Semester"
                                , "CreatedBy"
                                , "TheoryMO_CT"
                                , "SessionalMO_TA"
                                , "PracticalMarkObtain"
                                , "TheoryMarkObtain"
                                , "IsAbsent"

                            };

                                CSVTUMarkEntry_DT t_CSVTUMarkEntry_DT = new CSVTUMarkEntry_DT();

                                t_CSVTUMarkEntry_DT.RowID = RowID.Value;
                                t_CSVTUMarkEntry_DT.RollNo = RollNo.Text;
                                t_CSVTUMarkEntry_DT.SubjectCode = SubjectCode.Text;
                                t_CSVTUMarkEntry_DT.ExamType = ddlExamType.SelectedValue;
                                t_CSVTUMarkEntry_DT.ExamSession = ddlSession.SelectedValue;
                                t_CSVTUMarkEntry_DT.Semester = ddlSemester.SelectedValue;
                                t_CSVTUMarkEntry_DT.CreatedBy = Session["LoginID"].ToString();
                                if (!chkAbent.Checked) {

                                    /*
                                    if ((Convert.ToInt32(t_txtMarks.Text) > 50) && t_txtMarks.Text.ToUpper() != "AB")
                                    {
                                        LoadGridData();
                                        string m_Message = "Mark can not be greater than 50.!";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);
                                        return;
                                    }
                                    */
                                    t_CSVTUMarkEntry_DT.IsAbsent = "0";
                                    t_CSVTUMarkEntry_DT.TheoryMO_CT = t_TheoryMO_CT.Text;
                                    t_CSVTUMarkEntry_DT.PracticalMarkObtain = t_PracticalMarkObtain.Text;
                                    t_CSVTUMarkEntry_DT.SessionalMO_TA = t_SessionalMO_TA.Text;
                                    t_CSVTUMarkEntry_DT.TheoryMarkObtain = t_TheoryMarkObtain.Text;
                                }
                                else
                                {
                                    t_CSVTUMarkEntry_DT.IsAbsent = "1";
                                    t_CSVTUMarkEntry_DT.TheoryMO_CT = "0";
                                }


                                FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
                                System.Data.DataTable result = null;
                                string UID = "";

                                result = m_FacultyModuleBLL.CSVTUMarkEntryData(t_CSVTUMarkEntry_DT, AFields);

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
                t_Script = string.Format(t_Script, "Error " + grdResult.Rows.Count, m_Message.Replace("\r\n", ""));

                //ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Message", "alert('" + ee.Message.Replace("'", "") + ee.StackTrace.Replace(Environment.NewLine, "<br />") + "')", true);
            }
            finally
            {
                
            }

            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", t_Script, true);
        }
        
        protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlProgram.Items.Clear();
            ddlProgram.Items.Insert(0, new ListItem("Select", "0"));
            ddlSemester.Items.Clear();
            ddlSemester.Items.Insert(0, new ListItem("Select", "0"));           
            ProgramList();
        }

        protected void ddlProgram_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlSemester.Items.Clear();
            ddlSemester.Items.Insert(0, new ListItem("Select", "0"));           
            GetSemester();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            //string t_URL = "/WebApp/Faculty/MarkEntryAcknowledgement.aspx?CC=" + ddlCollege.SelectedValue + "&BC=" + ddlCourse.SelectedValue + "&SS=" + ddlSubject.SelectedValue + "&SC=" + ddlSemester.SelectedValue + "&ET=" + ddlExamType.SelectedValue + "&EY=" + ddlSession.SelectedItem.Text + "&PC=" + ddlProgram.SelectedValue;
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('"+ t_URL + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1200,height=600');", true);
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "window.open('../../DataControlManager/Online complain/frmComplaintRevision.aspx?ID=" + _cId + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=30,height=30');", true);


        }
    }
    
}