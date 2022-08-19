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
    public partial class ApproveFaculty : AdminBasePage
    {
        //G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        //CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();

        List<string> Checked = new List<string>();

        bool m_DispCheckBox = true;
        string LoginID = "";
        int Department;
        string m_Flag = "";
        //string StrKeyField = Guid.NewGuid().ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());
            
            //txtExperiance.Text = hdnExperience.Value;
            if (!IsPostBack)
            {
                //ProgramList();
                //CollegeList();
                GetDepartment();
                CourseList();
                //divTeacher.Visible = true ;
                divBtn.Visible = true;
                btnSubmit.Enabled = false;
                divSearch.Visible = false;
            }

            BindData();
        }

        public void GetDepartment()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetDepartment();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlDepartment.DataSource = dt;
                    ddlDepartment.DataTextField = "DepartmentName";
                    ddlDepartment.DataValueField = "DepartmentCode";
                    ddlDepartment.DataBind();
                    ddlDepartment.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void GetSubject()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetFacultySubjectCSVTU(ddlCourse.SelectedValue, ddlProgram.SelectedValue, ddlSemester.SelectedValue, ddlSession.SelectedValue, "Theory");
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

        public void BindData()
        {
            string Status = "";
            
            try
            {
                gvDetail.Columns.Clear();

                DataTable t_DT = new DataTable();

                if (ddlStatus.SelectedIndex != 0)
                {
                    if (ddlSession.SelectedIndex == 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Mandatory Selection','Please select Department, Exam Session, Semester & Subject!');", true);
                        return;
                    }

                }

                t_DT = m_FacultyModuleBLL.GetNominatedFaculty(LoginID, ddlDepartment.SelectedValue, ddlCourse.SelectedValue, ddlProgram.SelectedValue, ddlSubject.SelectedValue, ddlSession.SelectedValue,ddlSemester.SelectedValue, ddlStatus.SelectedValue, "");
                if (t_DT != null && t_DT.Rows.Count > 0)
                {
                    if (ddlStatus.SelectedValue == "R")
                    {divSearch.Visible = true;}
                    else { divSearch.Visible = false; }

                    BoundField t_BoundField;
                    ButtonField t_ButtonField;
                    divBtn.Visible = true;
                    if (m_DispCheckBox)
                    {
                        t_BoundField = new BoundField();
                        //t_BoundField.HeaderText = "Select";
                        gvDetail.Columns.Add(t_BoundField);
                    }

                    for (int i = 0; i < t_DT.Columns.Count; i++)
                    {
                        t_BoundField = new BoundField();
                        t_BoundField.DataField = t_DT.Columns[i].ColumnName;
                        t_BoundField.SortExpression = t_DT.Columns[i].ColumnName;

                        if (t_DT.Columns[i].DataType.Equals(typeof(int)) ||
                            t_DT.Columns[i].DataType.Equals(typeof(decimal)))
                        {
                            t_BoundField.ItemStyle.CssClass = "tdRT";
                            t_BoundField.HeaderStyle.CssClass = "tdRT";
                        }
                        else
                        {
                            t_BoundField.ItemStyle.CssClass = "tdLT";
                            t_BoundField.HeaderStyle.CssClass = "tdLT";
                        }
                        t_BoundField.HeaderText = t_DT.Columns[i].ColumnName;

                        gvDetail.Columns.Add(t_BoundField);
                    }

                    t_ButtonField = new ButtonField();
                    t_ButtonField.HeaderText = "Detail";
                    gvDetail.Columns.Add(t_ButtonField);

                    gvDetail.DataSource = t_DT;
                    gvDetail.DataBind();


                }
                else
                {
                    if (ddlStatus.SelectedIndex != 0)
                    {
                        divSearch.Visible = false;
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Not Found','No Record Found For Search Criteria !');", true);
                    }
                }

            }
            catch (Exception ex)
            {

            }
        }

        void GetSelectedRec()
        {
            if (ViewState["Checked"] != null)
            {
                Checked = (List<string>)ViewState["Checked"];
            }
            foreach (GridViewRow rows in gvDetail.Rows)
            {
                if (rows.Cells[0].Controls.Count > 0 && rows.Cells[0].Controls[0].GetType().FullName.Equals(typeof(CheckBox).FullName))
                {
                    CheckBox chk = rows.Cells[0].Controls[0] as CheckBox;
                    if (chk.Checked == true)
                    {
                        if (!Checked.Contains(chk.ID))
                            Checked.Add(chk.ID);
                    }
                    else
                    {
                        if (Checked.Contains(chk.ID))
                            Checked.Remove(chk.ID);
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

        DataControlFieldCell GetCellByName(GridViewRow Row, String CellName)
        {
            foreach (DataControlFieldCell Cell in Row.Cells)
            {
                if (Cell.ContainingField.ToString() == CellName)
                    return Cell;
            }
            return null;
        }

        protected void gvDetail_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                //e.Row.Cells[0].Attributes.Add("Style", "text-align:center");
                ////e.Row.Cells[12].Attributes.Add("Style", "text-align:center");

                //if (m_DispCheckBox)
                //    e.Row.Cells[1].Attributes.Add("Style", "Display:none");
                //else
                //    e.Row.Cells[0].Attributes.Add("Style", "Display:none");

                //if (rbt_Pending.Checked)
                //{
                //    e.Row.Cells[13].Attributes.Add("Style", "Display:none");
                //}

            }
        }

        protected void gvDetail_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int i = 0;
            HtmlAnchor t_Anchor = null;
            HtmlAnchor t_LetterLink = null;
            i = e.Row.Cells.Count;

            if (e.Row.RowType == DataControlRowType.Header|| e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[i-2].Attributes.Add("style", "display:none");
            }
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //    e.Row.Cells[0].Controls.Clear();

                //    CheckBox t_chk = new CheckBox();

                //    t_chk.ID = e.Row.Cells[1].Text + "_ChkHdr";
                //    t_chk.Enabled = true;

                //    e.Row.Cells[0].Controls.Add(t_chk);
                if (ddlStatus.SelectedValue != "R")
                {
                    e.Row.Cells[0].Attributes.Add("style", "display:none");
                }
            }
            e.Row.Cells[1].Attributes.Add("style", "display:none");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (ddlStatus.SelectedValue == "R")
                {
                    e.Row.Cells[0].Controls.Clear();

                    CheckBox t_chk = new CheckBox();

                    t_chk.ID = e.Row.Cells[1].Text + "_Chk";
                    t_chk.Enabled = true;
                    if (ViewState["Checked"] != null && ((List<string>)ViewState["Checked"]).Contains(t_chk.ID))
                    {
                        t_chk.Checked = true;
                    }
                    else
                    {
                        t_chk.Checked = false;
                    }
                    
                    if (m_DispCheckBox)
                    {
                        e.Row.Cells[0].Controls.Add(t_chk);
                    }
                }
                else
                {
                    if (ddlStatus.SelectedValue != "R")
                    {
                        e.Row.Cells[0].Attributes.Add("style", "display:none");
                    }
                    if (e.Row.RowType == DataControlRowType.DataRow)
                    {
                        e.Row.Cells[0].Attributes.Add("style", "display:none");
                    }
                }
            }

            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {                
                //-------------------------------//                
                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";
                
                t_Anchor.Attributes.Add("onclick", "TakeAction('', '" + e.Row.Cells[i - 3].Text + "', '" + e.Row.Cells[i-2].Text + "')");
                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i-1].Controls.Add(t_Anchor);
                e.Row.Cells[i-1].Attributes.Add("Title", "View");
                e.Row.Cells[i-1].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                //e.Row.Cells[16].Attributes.Add("style", "display:none");
                i++;
                
            }
            t_Anchor = null;
            t_LetterLink = null;

        }

        protected void gvDetail_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GetSelectedRec();
            gvDetail.PageIndex = e.NewPageIndex;
            gvDetail.DataBind();
            BindData();
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            int t_UpdateCount = 0;

            if (ddlStatus.SelectedIndex == 0 || ddlSession.SelectedIndex == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Mandatory Selection','Please select Exam Session & Status!');", true);
                return;
            }

            if ((rbt_Rejected.Checked == false) && (rbt_Approve.Checked == false))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please select Acceptance radio button');", true);
                return;
            }

            string t_RowID = GetRecords();
            
            if (string.IsNullOrEmpty(t_RowID))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Select Records to continue');", true);
                return;
            }
            string[] SubjectCode;
            string Status = "";
            string[] t_RowIDArr = t_RowID.Split(',');
            string Comment = txt_Remarks.Text.Replace("'", "''");
            string KeyField = Guid.NewGuid().ToString();
            bool t_ShowMsg = false;
            string t_Script = "";
            bool t_status = false;
            string m_Message = " Record/s updated";
            int cellCount = 0;

            string MailID = ""; string CCMailID = ""; string BCCMailID = ""; string Subject = ""; string MailText = ""; 

            try
            {

                for (int i = 0; i < t_RowIDArr.Length; i++)
                {
                    foreach (GridViewRow rows in gvDetail.Rows)
                    {
                        CheckBox chkenroll = (CheckBox)rows.FindControl(t_RowIDArr[i]+"_chk");

                        if (chkenroll != null)
                        {
                            //CheckBox chk = rows.Cells[1].Controls[1] as CheckBox;
                            //HiddenField RowID = rows.Cells[0].Controls[1] as HiddenField;
                            //string chk_RowID = RowID.Value;

                            if (chkenroll.Checked)//if (chk_RowID == t_RowIDArr[i])
                            {
                                if (rbt_Approve.Checked)
                                {
                                    Status = "R";
                                }

                                string[] AFields =
                                    {
                                     "ProfileID"
                                    ,"FacultyID"
                                    ,"Semester"
                                    ,"Session"
                                    ,"DepartmentCode"
                                    ,"BranchCode"
                                    ,"CourseCode"
                                    ,"ProgramCode"
                                    ,"SubjectCode"
                                    ,"Remark"
                                    ,"CreatedBy"
                                    ,"KeyField"
                                    ,"Status"
                                    ,"RowID"
                                };
                                SubjectCode = rows.Cells[4].Text.Split('-');
                                NominateFaculty_TB objNominateFaculty_TB = new NominateFaculty_TB();
                                DataSet result = null;
                                cellCount = rows.Cells.Count;
                                objNominateFaculty_TB.ProfileID = rows.Cells[cellCount - 2].Text;
                                objNominateFaculty_TB.FacultyID = rows.Cells[7].Text;
                                objNominateFaculty_TB.Semester = rows.Cells[5].Text;
                                objNominateFaculty_TB.Session = ddlSession.SelectedValue;
                                objNominateFaculty_TB.DepartmentCode = ddlDepartment.SelectedValue;
                                objNominateFaculty_TB.BranchCode = "";
                                objNominateFaculty_TB.CourseCode = ddlCourse.SelectedValue;
                                objNominateFaculty_TB.ProgramCode = ddlProgram.SelectedValue;
                                objNominateFaculty_TB.SubjectCode = SubjectCode[0].Trim();
                                objNominateFaculty_TB.Remark = Comment;
                                objNominateFaculty_TB.CreatedBy = Session["LoginID"].ToString();
                                objNominateFaculty_TB.KeyField = KeyField;
                                objNominateFaculty_TB.Status = Status;
                                objNominateFaculty_TB.RowID = t_RowIDArr[i];

                                result = m_FacultyModuleBLL.InsertApprovedFaculty(objNominateFaculty_TB, AFields);

                                DataTable t_App = result.Tables[0];
                                DataTable t_Faculty = result.Tables[1];
                                DataTable t_Subject = result.Tables[2];

                                if (result != null && t_App.Rows.Count > 0)
                                {
                                    if (t_App.Rows[0]["Result"].ToString() == "1")
                                    {
                                        MailID = t_Faculty.Rows[0]["EmailID"].ToString();
                                        CCMailID = t_Faculty.Rows[0]["CCMailID"].ToString();
                                        BCCMailID = t_Faculty.Rows[0]["BCCMailID"].ToString();
                                        Subject = t_Faculty.Rows[0]["Subject"].ToString();
                                        MailText = t_Faculty.Rows[0]["EmailText"].ToString();

                                        if (MailID != null || MailID != "")
                                        {
                                            string strSubject = "";
                                            string QuestionDetail = "";
                                            strSubject = @"<table style=""border: 1px solid #999999;width:100%"" cellpadding=""0"" cellspacing=""0"">";
                                            strSubject = strSubject + "<tr>";
                                            strSubject = strSubject +    @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Sl. No.</th>";
                                            //strSubject = strSubject +    @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Subject Code</th>";
                                            strSubject = strSubject +    @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Subject Name</th>";
                                            strSubject = strSubject +    @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Semester</th>";
                                            strSubject = strSubject +    @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Program</th>";
                                            strSubject = strSubject +    @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Course</th>";
                                            strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Maximum Mark</th>";
                                            strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Minimum Mark</th>";
                                            strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Duration</th>";
                                            strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Schema</th>";
                                            strSubject = strSubject +@"</tr>";
                                            for (int j = 0; j < t_Subject.Rows.Count; j++)
                                            {
                                                strSubject = strSubject +@"<tr>";
                                                strSubject = strSubject + @"<td style=""border: 1px solid #999999"">"+t_Subject.Rows[j]["Sl"].ToString()+"</td>";
                                                //strSubject = strSubject + @"<td style=""border: 1px solid #999999"">"+t_Subject.Rows[0]["SubjectCode"].ToString()+"</td>";
                                                strSubject = strSubject + @"<td style=""border: 1px solid #999999"">"+t_Subject.Rows[j]["Subject"].ToString()+"</td>";
                                                strSubject = strSubject + @"<td style=""border: 1px solid #999999"">"+t_Subject.Rows[j]["Semester"].ToString()+"</td>";
                                                strSubject = strSubject + @"<td style=""border: 1px solid #999999"">"+t_Subject.Rows[j]["Program"].ToString()+"</td>";
                                                strSubject = strSubject + @"<td style=""border: 1px solid #999999"">"+t_Subject.Rows[j]["Course"].ToString()+"</td>";
                                                strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Maximum"].ToString() + "</td>";
                                                strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Minimum"].ToString() + "</td>";
                                                strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Duration"].ToString() + "</td>";
                                                strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Scheme"].ToString() + "</td>";
                                                strSubject = strSubject + @" </tr>";
                                            }
                                            strSubject = strSubject + @"</table>";

                                            for (int j = 0; j < t_Subject.Rows.Count; j++)
                                            {
                                                QuestionDetail = @"<div style=""page-break-after: always""></div>";
                                                QuestionDetail = QuestionDetail + @"<div style=""font-family: Arial; padding: 1px; margin: 0 auto; border: 2px solid #b0b0b0;"">";
                                                QuestionDetail = QuestionDetail + @"<div style=""background-image: url(''); background-size: 590px; border: 1px solid #b0b0b0; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; margin: 2px auto;"">";
                                                QuestionDetail = QuestionDetail + @"<div style=""width: 100%;"">";
                                                QuestionDetail = QuestionDetail + @"<table style=""width: 100%;"">";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td colspan=""2"" style=""text-align: center; font-size: 10px"">&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"<tr style="""">";
                                                QuestionDetail = QuestionDetail + @"<td style=""width: 150px;"">";
                                                QuestionDetail = QuestionDetail + @"<div style=""width: 150px; margin: 5px 0 0 5px; float: left;"">";
                                                QuestionDetail = QuestionDetail + @"<img src=""http://csvtu.digivarsity.online/Sambalpur/img/sambalpur-university-logo.png"" alt=""Logo"" style=""width: 75px; margin: 5px 30px"" />";
                                                QuestionDetail = QuestionDetail + @"</div>";
                                                QuestionDetail = QuestionDetail + @"</td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""font-size: 22px; font-weight: bold; text-align: center; white-space: nowrap;"">";
                                                QuestionDetail = QuestionDetail + @"CHHATTISGARH SWAMI VIVEKANAND<br/><span>TECHNICAL UNIVERSITY, BHILAI</span><br />";
                                                QuestionDetail = QuestionDetail + @"<span style=""font-weight: normal; font-size: 20px"">Newai, PO Newai, Distt. Durg (CG) 491107</span><br />";
                                                QuestionDetail = QuestionDetail + @"<span style=""font-size: 15px;"">Exam Cell: 0788-2445017, 0788-2445024 (Phone)</span>";
                                                QuestionDetail = QuestionDetail + @"</td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"</table>";
                                                QuestionDetail = QuestionDetail + @"</div>";
                                                QuestionDetail = QuestionDetail + @"<div style=""background-color: #808080; border: 1px solid #565555; border-left: none; border-right: none; color: #fff;"">";
                                                QuestionDetail = QuestionDetail + @"</div>";
                                                QuestionDetail = QuestionDetail + @"<div style=""margin: 10px; width: 100%; height: auto; font-size: 13px;"">";
                                                QuestionDetail = QuestionDetail + @"<div>";
                                                QuestionDetail = QuestionDetail + @"<table style=""width: 98%"">";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td style="""">";
                                                QuestionDetail = QuestionDetail + @"<table style=""float: left"">";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align: left"">Course &amp; Semester: </td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align: left""><b>" + t_Subject.Rows[j]["Semester"].ToString() + "</b></td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align: left"">Program :</td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align: left""><b>" + t_Subject.Rows[j]["Program"].ToString() + "</b></td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"</table>";
                                                QuestionDetail = QuestionDetail + @"<table style=""float: right"">";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align: left"">Subject Code : </td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align: left""><b>" + t_Subject.Rows[j]["SubjectCode"].ToString() + "</b></td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align: left"">Part Time Subject :</td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align: left""><b>#Parttime</b></td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"</table>";
                                                QuestionDetail = QuestionDetail + @"</td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td>Subject : <b>" + t_Subject.Rows[j]["Subject"].ToString() + "</b></td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td>";
                                                QuestionDetail = QuestionDetail + @"<table style=""width: 100%"">";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align left"">Max Marks:<b>" + t_Subject.Rows[j]["Maximum"].ToString() + "</b></td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align center"">Minimum Pass Mark: <b>" + t_Subject.Rows[j]["Minimum"].ToString() + "</b></td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align center"">Duration: <b>" + t_Subject.Rows[j]["Duration"].ToString() + "</b></td>";
                                                QuestionDetail = QuestionDetail + @"<td style=""text-align right"">Scheme: <b>" + t_Subject.Rows[j]["Scheme"].ToString() + "</b></td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"</table>";
                                                QuestionDetail = QuestionDetail + @"</td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"</tr> ";
                                                QuestionDetail = QuestionDetail + @"<tr>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td> ";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                                                QuestionDetail = QuestionDetail + @"<td>&nbsp;</td> ";
                                                QuestionDetail = QuestionDetail + @"</tr>";
                                                QuestionDetail = QuestionDetail + @"</table> ";
                                                QuestionDetail = QuestionDetail + @"</div>";
                                                QuestionDetail = QuestionDetail + @"</div> ";
                                                QuestionDetail = QuestionDetail + @"</div>";
                                                QuestionDetail = QuestionDetail + @"</div>";
                                            }
                                            #region emailText

                                            //QuestionDetail = "";
                                            MailText = @"
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset=""utf-8"" />
</head>
<body>
    <div id=""divPrint"" style=""margin: 0 auto; width: 90%; /*height: 1220px; overflow: auto; */"">
        <div style=""width: 100%; height: auto; font-family: Arial; border: 2px solid #b0b0b0; padding: 1px; margin: 0 auto;"">
            <div style=""background-image: url(''); background-size: 590px; border: 1px solid #b0b0b0; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; margin: 2px auto;"">
                <div style=""width: 100%;"">
                    <table style=""width: 100%;"">
                        <tr>
                            <td colspan=""2"" style=""text-align: center; font-size: 10px"">Confidential & most Urgent</td>
                        </tr>
                        <tr style="""">
                            <td style=""width: 150px;"">
                                <div style=""width: 150px; margin: 5px 0 0 5px; float: left;"">
                                    <img src=""http://csvtu.digivarsity.online/Sambalpur/img/sambalpur-university-logo.png"" alt=""Logo"" style=""width: 75px; margin: 5px 30px"" />
                                </div>
                            </td>
                            <td style=""font-size: 19px; font-weight: bold; text-align: center; white-space: nowrap;"">
                                CHHATTISGARH SWAMI VIVEKANAND <br/>TECHNICAL UNIVERSITY, BHILAI<br />
                                <span style=""font-weight: bold; font-size: 12px"">Newai, PO Newai, Distt. Durg (CG) 491107</span><br />
                                <span style=""font-size: 12px;font-weight: normal;"">Exam Cell: 0788-2445017, 0788-2445024 (Phone)</span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style=""background-color: #808080; border: 1px solid #565555; border-left: none; border-right: none; color: #fff;"">
                </div>
                <div style=""margin: 10px; width: 100%; height: auto; font-size: 13px;"">
                    <div style=""text-align: left"">
                        <table style=""width: 98%"">
                            <tr>
                                <td style=""width: 24%; text-align: left; white-space: nowrap"">Letter No.:&nbsp;<b>#LetterNo</b> </td>
                                <td style=""width: 24%; text-align: center"">&nbsp;</td>
                                <td style=""width: 24%; text-align: center"">&nbsp;</td>
                                <td style=""width: 24%; text-align: left; white-space: nowrap"">Issue Date: <b>#LetterDate</b></td>
                            </tr>
                        </table>
                    </div>
                    <div>

                        <table>
                            <tr>
                                <td style=""width: 50px"">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style=""width: 50px; text-align: right"">To,</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style=""width: 50px"">&nbsp;</td>
                                <td>
                                    #Faculty
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    #Designation
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>#Address </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </div>
                    <div>

                        <table style=""width: 98%"">
                            <tr>
                                <td style=""width: 50px"">&nbsp;</td>
                                <td>
                                    Subject : 
                                    <span style=""font-weight bold; font-style italic;"">Appointment for setting of Question Paper & providing solution to the Questions.</span>
                                </td>
                                <td style=""width: 50px"">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>#salutation</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>I have been directed to inform you that you are appointed as Question Paper setter for CSVTU end semester exam.</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Course & Semester: <b>#CurseSemester</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Branch : <b>#Branch</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table style=""width: 100%;display:none;"">
                                        <tr>
                                            <td style=""text-align: left"">Max Marks:<b>#Maximum</b></td>
                                            <td style=""text-align: center"">Minimum Pass Mark: <b>#Minimum</b></td>
                                            <td style=""text-align: center"">Duration: <b>#Duration</b></td>
                                            <td style=""text-align: right"">Scheme: <b>#Scheme</b></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Presuming that you will be accepting the appointment, enclosed herewith are all the relevant papers on the subject.</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    #SubjectDetail
                                </td>
                                <td>&nbsp;</td>
                            </tr>                                
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    Sir/Madam, to provide your acceptance or refusal you are requested as to login into below university portal, the details are as below:

                                    <br />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table style=""width: 100%"">
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style=""white-space:nowrap"">Web portal URL</td>
                                            <td style=""white-space:nowrap"">#WebSiteURL</td>
                                            <td rowspan=""4"" style=""text-align: center; color: maroon"">* For assistance in using the portal you are requested to call at #HelpNo</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style=""white-space:nowrap"">Login Type</td>
                                            <td style=""white-space:nowrap"">#LoginType</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style=""white-space:nowrap"">Login ID</td>
                                            <td style=""white-space:nowrap"">#LoginID</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>Password</td>
                                            <td>#Password</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>In case you are unable to accept the appointment, it is requested that all the papers sent may please be returned with your refusal letter in enclosed format with genuine reason which will be intimated to HVC for further action.</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="""">
                                    It is requested that only one question paper be prepared in accordance with the enclosed syllabus.
                                    It may kindly be noted that for Diploma courses of Polytechnic, <b>Hindi version of each question is to be given immediately below the English version</b>.
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>PLEASE SET QUESTIONS FROM EACH UNIT WITH INTERNAL CHOICE. Please try to accommodate all questions of the Paper within the following framework-</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table style=""width: 100%"">
                                        <tr>
                                            <td>(i) </td>
                                            <td>Average Level - </td>
                                            <td>&nbsp;40%</td>
                                            <td rowspan=""3"" style=""text-align: center"">Please go through the syllabus of the subject before setting the questions.</td>
                                        </tr>
                                        <tr>
                                            <td>(ii)</td>
                                            <td>&nbsp;Medium Level - </td>
                                            <td>&nbsp;40%</td>
                                        </tr>
                                        <tr>
                                            <td>(iii)</td>
                                            <td>&nbsp;Difficult Level - </td>
                                            <td>20%</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>The manuscript of the question paper & solution to the questions should be kept in separate envelope marked ‘C’ & ‘E’respectively.These should be sealed & kept in envelop ‘B’, in which the declaration form duly filled in should ‘also be kept. The envelope containing all the above documents should be sealed properly and delivered in person or sent through registered post insured for Rs.100/- to the undersigned by the due date. </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Please return all the documents in case of refusal or if any relative is appearing in the said Examination. Inform the Undersigned if you come to know in future that some relative is appearing.</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>Please read & follow the “Instructions for paper setters” very carefully.</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>Due Date of Receipt of Manuscript at CSVTU: #DueDate</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>Please supply solution to NUMERICAL PROBLEMS</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>And STEP MARKING scheme in envelop ‘E.’</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Set Q.P. is to be send in softcopy at email ""<b style=""font-size:15px;"">gopniya@csvtu.ac.in</b>""</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>Hard copy of the set Q.P. is not to be sent seperately.<b/></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>Yours Faithfully</td>
                                        </tr>
                                        <tr>
                                            <td>Exam Controller</td>
                                        </tr>
                                        <tr>
                                            <td>CSVTU, Bhilai</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </div>

                </div>
            </div>

        </div>
        #QuestionDetail
    </div>
</body>
</html>
";

                                            #endregion

                                            MailText = MailText.Replace("#LetterNo", t_Faculty.Rows[0]["LetterNo"].ToString())
                                                .Replace("#LetterDate", t_Faculty.Rows[0]["LetterDate"].ToString())
                                                .Replace("#Designation", t_Faculty.Rows[0]["Designation"].ToString())
                                                .Replace("#CurrentSemester", t_Subject.Rows[0]["CurrentSemester"].ToString())
                                                .Replace("#Branch", t_Subject.Rows[0]["Course"].ToString())
                                                .Replace("#Maximum", t_Subject.Rows[0]["Maximum"].ToString())
                                                .Replace("#Minimum", t_Subject.Rows[0]["Minimum"].ToString())
                                                .Replace("#Duration", t_Subject.Rows[0]["Duration"].ToString())
                                                .Replace("#Scheme ", t_Subject.Rows[0]["Scheme"].ToString())
                                                .Replace("#SubjectCode", t_Subject.Rows[0]["SubjectCode"].ToString())
                                                .Replace("#Faculty", t_Faculty.Rows[0]["Faculty"].ToString())
                                                .Replace("#Address", t_Faculty.Rows[0]["Address"].ToString())
                                                .Replace("#CurseSemester", t_Subject.Rows[0]["CurrentSemester"].ToString())
                                                //.Replace("#Maxium ", t_Faculty.Rows[0]["Maxium "].ToString())
                                                //.Replace("#Minimum ", t_Faculty.Rows[0]["Minimum "].ToString())
                                                .Replace("#salutation", t_Faculty.Rows[0]["salutation"].ToString())
                                                .Replace("#WebSiteURL", t_Faculty.Rows[0]["WebSiteURL"].ToString())
                                                .Replace("#LoginType", t_Faculty.Rows[0]["LoginType"].ToString())

                                                .Replace("#LoginID", t_Faculty.Rows[0]["LoginID"].ToString())
                                                .Replace("#Password", t_Faculty.Rows[0]["Password"].ToString())
                                                .Replace("#Scheme", t_Faculty.Rows[0]["Scheme"].ToString())
                                                .Replace("#Parttime", t_Faculty.Rows[0]["Parttime"].ToString())
                                                .Replace("#SubjectDetail", strSubject)
                                                .Replace("#QuestionDetail", QuestionDetail)
                                                .Replace("#HelpNo", t_Faculty.Rows[0]["HelpNo"].ToString())
                                                .Replace("#DueDate", t_Faculty.Rows[0]["DueDate"].ToString());
                                            ;
                                                
                                            if (rbt_Approve.Checked)
                                            {
                                                CitizenPortalLib.CommonUtility.SendEmailWithAttachment("", "", "", MailID, CCMailID, BCCMailID, Subject, MailText, true, null);
                                            }
                                        }
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
                    ddlStatus.SelectedIndex = ddlStatus.Items.IndexOf(ddlStatus.Items.FindByValue("C"));
                    rbt_Approve.Checked = false;
                    rbt_Rejected.Checked = false;
                    BindData();
                    t_Script = "alert('\"{0}\" {1}');";
                    t_Script = string.Format(t_Script, t_UpdateCount, m_Message);
                }


            }
            catch (Exception ee)
            {

                t_status = false;
                m_Message = ee.Message.Replace("\\", "").Replace("\\r\\n", "").Replace(Environment.NewLine, "").Replace("'", "").Replace("\"", "");
                t_Script = "alert('\"{0}\" {1}')";
                t_Script = string.Format(t_Script, "Error " + gvDetail.Rows.Count, m_Message.Replace("\r\n", ""));

                //ScriptManager.RegisterClientScriptBlock(Page, this.GetType(), "Message", "alert('" + ee.Message.Replace("'", "") + ee.StackTrace.Replace(Environment.NewLine, "<br />") + "')", true);
            }
            finally
            {

            }

            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", t_Script, true);
        }
        
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //divTeacher.Visible = false;
            divBtn.Visible = true;
            btnSubmit.Enabled = true;
        }
        
        protected void grdView_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //string ProfileID = "";
            
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    ProfileID = e.Row.Cells[19].Text;
            //    //e.Row.Cells[1].Attributes.Add("style", "display:none");
            //    //Attach click event to each row in Gridview
            //    e.Row.Cells[e.Row.Cells.Count - 1].Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.grdView, "Select$" + e.Row.RowIndex);
            //    //EditTeachersProfile(ProfileID);
            //}
        }
        
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            if (ddlDepartment.SelectedIndex == 0 || ddlSession.SelectedIndex == 0 || ddlSemester.SelectedIndex == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Mandatory Selection','Please select Department, Exam Session & Semester!');", true);
                return;
            }
            else {

                string t_URL = "/WebApp/Faculty/Acknowledgement.aspx?EY=" + ddlSession.SelectedValue + "&SE=" + ddlSemester.SelectedValue + "&DC=" + ddlDepartment.SelectedValue + "&CC=" + ddlCourse.SelectedValue + "&PC=" + ddlProgram.SelectedValue + "&SC=" + ddlSubject.SelectedValue;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('" + t_URL + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1200,height=600');", true);
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
    }
}
