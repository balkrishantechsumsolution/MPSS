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
    public partial class RecommendFacultyNew : AdminBasePage
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
                dt = m_FacultyModuleBLL.GetFacultySubjectCSVTU(ddlCourse.SelectedValue, ddlProgram.SelectedValue, ddlSemester.SelectedValue, ddlSession.SelectedValue,"Theory");
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

                    ddlFacultyProg.DataSource = dt;
                    ddlFacultyProg.DataTextField = "ProgramName";
                    ddlFacultyProg.DataValueField = "ProgramCode";
                    ddlFacultyProg.DataBind();
                    ddlFacultyProg.Items.Insert(0, new ListItem("Faculty Program", "0"));
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

                //t_DT = m_FacultyModuleBLL.GetNominatedFaculty(LoginID, ddlDepartment.SelectedValue, ddlCourse.SelectedValue, ddlProgram.SelectedValue, ddlSubject.SelectedValue, ddlSession.SelectedValue,ddlSemester.SelectedValue, ddlStatus.SelectedValue, "");
                //t_DT = m_FacultyModuleBLL.GetNominatedFacultyNew(LoginID, ddlDepartment.SelectedValue, ddlCourse.SelectedValue, ddlFacultyProg.SelectedValue, ddlFacultySubject.SelectedValue, ddlSession.SelectedValue, ddlSemester.SelectedValue, ddlStatus.SelectedValue, "");
                t_DT = m_FacultyModuleBLL.GetNominatedFacultyNew(LoginID, ddlDepartment.SelectedValue, ddlCourse.SelectedValue, ddlProgram.SelectedValue, ddlSubject.SelectedValue, ddlSession.SelectedValue, ddlSemester.SelectedValue, ddlStatus.SelectedValue, ddlFacultyProg.SelectedValue,ddlFacultySubject.SelectedValue);
                if (t_DT != null && t_DT.Rows.Count > 0)
                {
                    if (ddlStatus.SelectedValue == "P")
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
                        t_DT = null;
                        gvDetail.DataSource = t_DT;
                        divSearch.Visible = false;
                        //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Not Found','No Record Found For Search Criteria !');", true);
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
                if (ddlStatus.SelectedValue != "P")
                {
                    e.Row.Cells[0].Attributes.Add("style", "display:none");
                }
            }
            e.Row.Cells[1].Attributes.Add("style", "display:none");
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (ddlStatus.SelectedValue == "P")
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

                    //if (e.Row.Cells[16].Text == "Y")
                    //{
                    //    t_chk.Checked = true;
                    //}

                    if (m_DispCheckBox)
                    {
                        e.Row.Cells[0].Controls.Add(t_chk);
                    }
                }
                else
                {
                    
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
                
                t_Anchor.Attributes.Add("onclick", "TakeAction('', '', '" + e.Row.Cells[i-2].Text + "')");
                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i-1].Controls.Add(t_Anchor);
                e.Row.Cells[i-1].Attributes.Add("Title", "View");
                e.Row.Cells[i-1].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                //e.Row.Cells[16].Attributes.Add("style", "display:none");
                i++;
            }
            t_Anchor = null;

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

            if (ddlDepartment.SelectedIndex == 0 || ddlSession.SelectedIndex == 0 || ddlSemester.SelectedIndex == 0 || ddlCourse.SelectedIndex == 0 || ddlFacultyProg.SelectedIndex == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Mandatory Selection','Please select Exam Session, Semester, Department, Course & Faculty Program!');", true);
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

            string Status = "";
            string[] t_RowIDArr = t_RowID.Split(',');
            string Comment = txt_Remarks.Text.Replace("'", "''");
            string KeyField = Guid.NewGuid().ToString();
            bool t_ShowMsg = false;
            string t_Script = "";
            bool t_status = false;
            string m_Message = " Record/s updated";
            int cellCount = 0;
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
                                    ,"RowId"
                                };

                                NominateFaculty_TB objNominateFaculty_TB = new NominateFaculty_TB();
                                DataTable result = null;
                                cellCount = rows.Cells.Count;
                                objNominateFaculty_TB.ProfileID = rows.Cells[cellCount - 2].Text;
                                objNominateFaculty_TB.FacultyID = rows.Cells[7].Text;
                                objNominateFaculty_TB.Semester = ddlSemester.SelectedValue;
                                objNominateFaculty_TB.Session = ddlSession.SelectedValue;
                                objNominateFaculty_TB.DepartmentCode = ddlDepartment.SelectedValue;
                                objNominateFaculty_TB.BranchCode = "";
                                objNominateFaculty_TB.CourseCode = ddlCourse.SelectedValue;
                                objNominateFaculty_TB.ProgramCode = ddlProgram.SelectedValue;
                                objNominateFaculty_TB.SubjectCode = ddlSubject.SelectedValue;
                                objNominateFaculty_TB.Remark = Comment;
                                objNominateFaculty_TB.CreatedBy = Session["LoginID"].ToString();
                                objNominateFaculty_TB.KeyField = KeyField;
                                objNominateFaculty_TB.Status = Status;
                                objNominateFaculty_TB.RowID = t_RowIDArr[i];

                                result = m_FacultyModuleBLL.InsertRecommendedFaculty(objNominateFaculty_TB, AFields);

                                if (result != null && result.Rows.Count > 0)
                                {
                                    if (result.Rows[0]["Result"].ToString() == "1")
                                    {
                                        t_UpdateCount++;
                                        t_ShowMsg = true;
                                    }
                                    ddlStatus.SelectedIndex = ddlStatus.Items.IndexOf(ddlStatus.Items.FindByValue("A"));
                                }

                                break;
                            }

                        }
                    }
                }
                if (t_ShowMsg == true)
                {
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
               
        protected void ddlFacultyProg_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetFacultySubjectCSVTU(ddlCourse.SelectedValue, ddlFacultyProg.SelectedValue, ddlSemester.SelectedValue, ddlSession.SelectedValue, "Theory");
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlFacultySubject.DataSource = dt;
                    ddlFacultySubject.DataTextField = "Subject";
                    ddlFacultySubject.DataValueField = "Code";
                    ddlFacultySubject.DataBind();
                    ddlFacultySubject.Items.Insert(0, new ListItem("Select", "0"));

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Exception!','" + ex.Message.ToString() + "');", true);
            }
        }
    }
}
