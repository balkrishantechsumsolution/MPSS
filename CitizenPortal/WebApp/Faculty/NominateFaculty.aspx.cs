using CitizenPortalLib;
using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Faculty
{
    public partial class NominateFaculty : AdminBasePage
    {
        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
        
        string LoginID = ""; int checkcount = 0;

        List<string> Checked = new List<string>();

        bool m_DispPanel = false;
        string m_Status = "";
        bool m_DispCheckBox = true;
        string m_ServiceID = "";
        string m_Message = "";        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CollegeList();
                GetDepartment();
                CourseList();             
                pnlApproval.Visible = false;
                divApp.Visible = false;
            }
            
                string Status = "";                
                
                if (ddlStatus.SelectedIndex != 0)
                {
                    Status = ddlStatus.SelectedValue;
                }

                if(Status == "P")
                {
                    m_DispCheckBox = true;
                }
                else
                {
                    m_DispCheckBox = false;
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
        public void CollegeList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetCollegeCSVTU();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCollege.DataSource = dt;
                    ddlCollege.DataTextField = "CollegeName";
                    ddlCollege.DataValueField = "CollegeCode";
                    ddlCollege.DataBind();
                    ddlCollege.Items.Insert(0, new ListItem("Select", "0"));
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
        
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //BindData();
        }
               
        public void BindData()
        {            
            string FromDate = "";
            string ToDate = "";
            string Service = "";
            string Status = "";
            if (ddlStatus.SelectedValue == "P")
            {
                if (ddlCollege.SelectedIndex == 0 || ddlDepartment.SelectedIndex == 0 || ddlSession.SelectedIndex == 0 || ddlSemester.SelectedIndex == 0 || ddlSubject.SelectedIndex == 0)
                {
                    return;
                }

            }
            else {
                if (ddlCollege.SelectedIndex == 0 || ddlDepartment.SelectedIndex == 0 || ddlSession.SelectedIndex == 0 || ddlSemester.SelectedIndex == 0)
                {
                    return;
                }
            }

            if (ddlStatus.SelectedIndex != 0)
            {
                Status = ddlStatus.SelectedValue;
            }
            else { return; }
            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }
            
            try
            {
                gvDetail.Columns.Clear();

                DataTable t_DT = new DataTable();
                
                t_DT = m_FacultyModuleBLL.GetNominateFacultyData(LoginID, ddlCollege.SelectedValue, ddlDepartment.SelectedValue, ddlCourse.SelectedValue, ddlProgram.SelectedValue,
                    ddlSession.SelectedValue, ddlSemester.SelectedValue, ddlSubject.SelectedValue, Status, txtFacultyID.Text.Trim());
                if (t_DT != null && t_DT.Rows.Count > 0)
                {
                    divApp.Visible = true;

                    BoundField t_BoundField;
                    ButtonField t_ButtonField;

                    if (m_DispCheckBox)
                    {
                        t_BoundField = new BoundField();
                        t_BoundField.HeaderText = "Select";
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
                    divApp.Visible = false;
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Not Found','No Record Found For Search Criteria !');", true);
                }

                if (ddlStatus.SelectedItem.Value == "P")
                {
                    pnlApproval.Visible = true;
                }
                else
                {
                    pnlApproval.Visible = false;
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
                e.Row.Cells[0].Attributes.Add("Style", "text-align:center");
                //e.Row.Cells[12].Attributes.Add("Style", "text-align:center");

                if (m_DispCheckBox)
                    e.Row.Cells[1].Attributes.Add("Style", "Display:none");
                else
                    e.Row.Cells[0].Attributes.Add("Style", "Display:none");

                //if (rbt_Pending.Checked)
                //{
                //    e.Row.Cells[13].Attributes.Add("Style", "Display:none");
                //}

            }
        }

        protected void gvDetail_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                //e.Row.Cells[0].Controls.Clear();

                //CheckBox t_chk = new CheckBox();

                //t_chk.ID = e.Row.Cells[1].Text + "_ChkHdr";
                //t_chk.Enabled = true;

                //e.Row.Cells[0].Controls.Add(t_chk);
                e.Row.Cells[11].Attributes.Add("style", "display:none");


                if (e.Row.Cells[0].Text == "")
                { e.Row.Cells[0].Attributes.Add("style", "display:none"); }
                //e.Row.Cells[16].Attributes.Add("style", "display:none");

                if (ddlStatus.SelectedValue == "P")
                {
                    
                }
                else
                {                   
                    if (e.Row.Cells[0].Text == "")
                    { e.Row.Cells[0].Attributes.Add("style", "display:none"); }                    
                }
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
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

            int i = 0;
            HtmlAnchor t_Anchor = null;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //    int t_Column = e.Row.Cells.Count - 1;
                //    e.Row.Cells[t_Column].Controls.Clear();

                //    HtmlAnchor t_Anchor = new HtmlAnchor();
                //    t_Anchor.ID = e.Row.Cells[1].Text + "_lbtn";
                //    t_Anchor.InnerHtml = "View";

                //t_LinkButton.ClientIDMode = ClientIDMode.Static;
                //t_LinkButton.CommandArgument = e.Row.Cells[1].Text;
                //t_LinkButton.CommandName = "ViewReceipt";            
                //t_LinkButton.Enabled = true;

                //t_LinkButton.Command += new CommandEventHandler(t_LinkButton_Command);

                //string t_URL = Page.ResolveUrl("~/Handler/ShowReceipt.ashx");

                //if (rbt_Pending.Checked)
                //{
                //    t_Anchor.Attributes.Add("onclick", "DisplayImage('" + e.Row.Cells[1].Text + "','" + t_URL + "')");
                //    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //}
                //else
                //{
                //    t_Anchor.Attributes.Add("onclick", "DisplayImage('" + e.Row.Cells[0].Text + "','" + t_URL + "')");
                //    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //}
                //t_LinkButton.Click += new EventHandler(t_LinkButton_Click);

                //if (e.Row.Cells[12].Text != "" && e.Row.Cells[12].Text != null)
                //{
                //    t_LinkButton.Enabled = true;
                //    t_LinkButton.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //}
                //else
                //{
                //    t_LinkButton.Enabled = false;
                //    t_LinkButton.Attributes.Add("style", "display:none;");
                //}

                // e.Row.Cells[t_Column].Controls.Add(t_Anchor);
                //}
                //t_Anchor = null;

                //-------------------------------//
                i = e.Row.Cells.Count - 1;

                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                t_Anchor.InnerHtml = "View";

                if (ddlStatus.SelectedValue == "P")
                {                    
                    t_Anchor.Attributes.Add("onclick", "TakeAction('', '', '" + e.Row.Cells[15].Text + "')");
                    //e.Row.Cells[15].Attributes.Add("style", "display:none");
                }
                else
                {
                    t_Anchor.Attributes.Add("onclick", "TakeAction('', '', '" + e.Row.Cells[16].Text + "')");
                    if(e.Row.Cells[0].Text == "")
                    { e.Row.Cells[0].Attributes.Add("style", "display:none"); }
                    //e.Row.Cells[16].Attributes.Add("style", "display:none");
                }
                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                e.Row.Cells[11].Attributes.Add("style", "display:none");
                
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
            string t_RowID = GetRecords();

            if (string.IsNullOrEmpty(t_RowID))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Select Records to continue');", true);
                return;
            }

            bool t_ShowMsg = false;
            string m_Message = "";
            string KeyField = Guid.NewGuid().ToString();
            int t_UpdateCount = 0;
            string t_Status = "R";
            m_Message = "Rejected";
            string t_Script = "";

            if (rbt_Approve.Checked)
            {
                t_Status = "A";
                m_Message = "Approved";
            }

            string[] t_RowIDArr = t_RowID.Split(',');

            string Comment = txt_Remarks.Text.Replace("'", "''");
            /*
            for (int i = 0; i < t_RowIDArr.Length; i++)
            {
                Admission_DT objAdmission_DT = new Admission_DT();
                DataTable t_DT = null;

                if (m_ServiceID != "1449")
                {
                    string[] AFields =
                    {
                        "AppID"
                    , "RowID"
                    , "CreatedBy"
                    , "KeyField"
                    , "Action"
                    , "Remarks"
                    };

                    objAdmission_DT.KeyField = KeyField;
                    objAdmission_DT.CreatedBy = LoginID;
                    objAdmission_DT.Action = t_Status;
                    objAdmission_DT.RowID = t_RowIDArr[i];
                    objAdmission_DT.Remarks = Comment;

                    t_DT = m_AdmissionFormBLL.SubmitAdmitData(objAdmission_DT, AFields);
                }
                else
                {
                    string[] AFields =
                    {
                        "AppID"
                    , "RowID"
                    , "CreatedBy"
                    , "KeyField"
                    , "Action"
                    , "Remarks"
                    };

                    objAdmission_DT.KeyField = KeyField;
                    objAdmission_DT.CreatedBy = LoginID;
                    objAdmission_DT.Action = t_Status;
                    objAdmission_DT.RowID = t_RowIDArr[i];
                    objAdmission_DT.Remarks = Comment;

                    t_DT = m_AdmissionFormBLL.SubmitG2GAdmissionData(objAdmission_DT, AFields);
                }



            }
            */

            if (ddlCollege.SelectedIndex == 0 || ddlDepartment.SelectedIndex == 0 || ddlSession.SelectedIndex == 0 || ddlSemester.SelectedIndex == 0 || ddlSubject.SelectedIndex == 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Mandatory Selection','Please select College, Department, Exam Session & Semester!');", true);
                return;
            }
            for (int i = 0; i < t_RowIDArr.Length; i++)
            {
                foreach (GridViewRow rows in gvDetail.Rows)
                {
                    CheckBox chkenroll = (CheckBox)rows.FindControl(t_RowIDArr[i] + "_chk");

                    if (chkenroll != null)
                    {
                       
                        if (chkenroll.Checked)//if (chk_RowID == t_RowIDArr[i])
                        {
                            
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
                                };

                            NominateFaculty_TB objNominateFaculty_TB = new NominateFaculty_TB();
                            DataTable result = null;

                            objNominateFaculty_TB.ProfileID = rows.Cells[15].Text;
                            objNominateFaculty_TB.FacultyID = rows.Cells[6].Text;
                            objNominateFaculty_TB.Semester = ddlSemester.SelectedValue;
                            objNominateFaculty_TB.Session = ddlSession.SelectedValue;
                            objNominateFaculty_TB.DepartmentCode = ddlDepartment.SelectedValue;
                            objNominateFaculty_TB.BranchCode = "";
                            objNominateFaculty_TB.CourseCode = ddlCourse.SelectedValue;
                            objNominateFaculty_TB.ProgramCode = ddlProgram.SelectedValue;
                            objNominateFaculty_TB.SubjectCode =  ddlSubject.SelectedValue;
                            objNominateFaculty_TB.Remark = Comment;
                            objNominateFaculty_TB.CreatedBy = Session["LoginID"].ToString();
                            objNominateFaculty_TB.KeyField = KeyField;

                            result = m_FacultyModuleBLL.InsertNominatedFaculty(objNominateFaculty_TB, AFields);

                            if (result != null && result.Rows.Count > 0)
                            {
                                if (result.Rows[0]["Result"].ToString() == "1")
                                {
                                    //ddlStatus.SelectedIndex = ddlStatus.Items.IndexOf(ddlStatus.Items.FindByValue("A"));
                                    //ddlStatus.SelectedValue = "A";
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
                DataTable DT = new DataTable();
                gvDetail.DataSource = DT;
                gvDetail.DataBind();
                ddlStatus.Items.IndexOf(ddlStatus.Items.FindByValue("0"));
                //BindData();
                t_Script = "alert('\"{0}\" {1}');";
                t_Script = string.Format(t_Script, t_UpdateCount, m_Message);
            }

            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", t_Script, true);
            //BindData();
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

        public void CourseList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetCourseCSVTU(ddlCollege.SelectedValue);
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
                    ddlProgram.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Exception!','" + ex.Message.ToString() + "');", true);
            }
        }
    }
}