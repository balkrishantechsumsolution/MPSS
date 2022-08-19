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

namespace CitizenPortal.WebApp.G2G.MarkEntry
{
    public partial class AssignExaminer : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        List<string> Checked = new List<string>();
        string m_Message = "";
        string m_LoginID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            m_LoginID = Session["LoginID"].ToString();
            //if ((!Session["LoginID"].ToString().Contains("Admin")) && (!Session["LoginID"].ToString().Contains("Zone")))
            if (Session["menuRole"].ToString() == "College" || Session["menuRole"].ToString() == "Principal")
            {                
                return;
            }
                
            if (!IsPostBack)
            {
                divAddH.Visible = false;
                divAddD.Visible = false;
                divButton.Visible = false;
                divDetailH.Visible = false;
                divDetail.Visible = false;
                GetZone();
                //CollegeList();
                BranchList();
            }
        }

        public void CollegeList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetZoneCollegeList(ddlSemester.SelectedValue, ddlSession.SelectedValue, ddlZone.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlCollege.DataSource = dt;
                    ddlCollege.DataTextField = "CollegeName";
                    ddlCollege.DataValueField = "CollegeCode";
                    ddlCollege.DataBind();
                    ddlCollege.Items.Insert(0, new ListItem("Select", "0"));
                    //if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    //{
                    //    //btnSave.Visible = false;
                    //    btnSubmit.Text = "Re-open for Marks Entry";
                    //}
                    //else {
                    //    ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(Session["LoginID"].ToString().Substring(0, 3)));
                    //    ddlCollege.Enabled = false;
                    //    btnSubmit.Text = "Submitted to University";
                    //}
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
                    ddlBranch.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void PaperList()
        {

            DataTable dt = new DataTable();
            dt = m_AdmissionFormBLL.GetTheoryPaperLists(ddlBranch.SelectedValue.ToString(), ddlSemester.SelectedValue.ToString(), ddlSession.SelectedValue.ToString(), ddlSubject.SelectedValue, ddlZone.SelectedValue);
            //if (dt != null && dt.Rows.Count > 0)
            {
                ddlPaper.DataSource = dt;
                ddlPaper.DataTextField = "PaperName";
                ddlPaper.DataValueField = "PaperCode";
                ddlPaper.DataBind();
                ddlPaper.Items.Insert(0, new ListItem("Select", "0"));
            }

        }

        public void LoadGridData()
        {
            divAddH.Visible = false;
            divAddD.Visible = false;
            string LoginID = "";
            int Department;
            string ExamType = "";
            string Branch = "";
            string College = "";
            string RollNo = "";
            string t_Year = "";
            string Semester = "";
            string PaperCode = "";
            string t_Range = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());
          
            ExamType = ddlExamType.SelectedItem.Text;
            College = ddlCollege.SelectedValue;

            Branch = ddlBranch.SelectedValue.ToString();
            t_Year = ddlSession.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            PaperCode = ddlPaper.SelectedValue.ToString();
            RollNo = txtRollNo.Text;
            t_Range = ddlRange.SelectedValue;
            
            DataTable ds = null;
            //ds = m_AdmissionFormBLL.GetStudentTheoryPaperDetails(College, ExamType, Branch, t_Year, Semester, PaperCode, RollNo,ddlSubject.SelectedValue, t_Range);
            ds = m_AdmissionFormBLL.GetRollNoRange(Branch, t_Year, Semester, PaperCode, College);
            if (ds.Rows.Count > 0)
            {
                if (ds.Rows.Count > 0)
                {
                    DataGridView.DataSource = ds;
                    divButton.Visible = true;
                    divDetailH.Visible = true;
                    divDetail.Visible = true;

                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        btnSubmit.Visible = true;
                        btnSave.Visible = true;
                        //btnSubmit.Text = "Send For Approval";
                    }
                    else
                    {
                        btnSubmit.Visible = true;
                        btnSave.Visible = true;
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataGridView.DataSource = null;
                    DataGridView.DataBind();
                    divAddH.Visible = false;
                    divAddD.Visible = false;
                    divButton.Visible = false;
                    divDetailH.Visible = false;
                    divDetail.Visible = false;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataGridView.DataSource = null;
                DataGridView.DataBind();
                divAddH.Visible = false;
                divAddD.Visible = false;
                divButton.Visible = false;
                divDetailH.Visible = false;
                divDetail.Visible = false;
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
                    //e.Row.Cells[8].Enabled = false;
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
                    //e.Row.Cells[1].Enabled = true;
                    //e.Row.Cells[8].Enabled = true;
                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        btnSave.Visible = true;
                        btnSubmit.Visible = true;
                        e.Row.Cells[1].Enabled = true;
                        //e.Row.Cells[8].Enabled = true;
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

                //e.Row.Cells[0].Attributes.Add("style", "display:none");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
            //GetRollRange();
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
            if ((ddlZone.SelectedIndex == 0) || (ddlBranch.SelectedIndex == 0) || (ddlSemester.SelectedIndex == 0) || (ddlSession.SelectedIndex == 0) || (ddlSubject.SelectedIndex == 0) || (ddlPaper.SelectedIndex == 0) || (ddlExaminer.SelectedIndex == 0))
            {
                divAddH.Visible = false;
                divAddD.Visible = false;
                divButton.Visible = false;
                divDetailH.Visible = false;
                divDetail.Visible = false;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please select ALL MANDATORY fields');", true);
                return;
            }

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
                                Label RollNo = (Label)rows.FindControl("RollNoRange");
                                Label PaperCode = (Label)rows.FindControl("PaperCode");
                                Label SetID = (Label)rows.FindControl("SetID");
                                Label Examiner = (Label)rows.FindControl("Examiner");

                                string[] AFields =
                                {                                  
                                  "RollNoRange"
                                , "PaperCode"
                                , "Session"
                                , "Semester"
                                , "CreatedBy"
                                , "ExaminerID"
                                , "SetID"
                            };

                                TheoryMark_DT t_TheoryMark_DT = new TheoryMark_DT();
                                                                
                                t_TheoryMark_DT.RollNoRange = RollNo.Text;
                                t_TheoryMark_DT.PaperCode = PaperCode.Text;
                                t_TheoryMark_DT.SetID = "";
                                t_TheoryMark_DT.Session = ddlSession.SelectedValue;
                                t_TheoryMark_DT.Semester = ddlSemester.SelectedValue;
                                t_TheoryMark_DT.CreatedBy = Session["LoginID"].ToString();
                                t_TheoryMark_DT.ExaminerID = ddlExaminer.SelectedValue;

                                CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

                                System.Data.DataTable result = null;
                                string UID = "";

                                result = m_AdmissionFormBLL.AssignExaminerData(t_TheoryMark_DT, AFields);

                                if (result != null && result.Rows.Count > 0)
                                {
                                    if (result.Rows[0]["Result"].ToString() != "0")
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
                string ZoneID = ddlZone.SelectedValue;
                string College = ddlCollege.SelectedValue;
                string Branch = ddlBranch.SelectedValue;
                string ExamType = ddlExamType.SelectedItem.Text;
                string ExamYear = ddlSession.SelectedValue;
                string Semester = ddlSemester.SelectedValue;
                string Paper = ddlPaper.SelectedValue;
                string CreatedBy = Session["LoginID"].ToString();
                result = m_AdmissionFormBLL.TheoryMarkSubmitted(College, Branch, ExamType, ExamYear, Semester, Paper, UID, CreatedBy, ZoneID);

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
                        m_Message = "Record Submitted to University!";
                    }
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');", true);


                }
            }
            else { 
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please Save the selected Marks then click - Send for Approval');", true);
            return;
            }
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaperList();
            
            DataGridView.DataSource = null;
            DataGridView.DataBind();
            divAddH.Visible = false;
            divAddD.Visible = false;
            divButton.Visible = false;
            divDetailH.Visible = false;
            divDetail.Visible = false;

            //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('/WebApp/G2G/MarkEntry/Acknowledgement.aspx?CC='"+ddlCollege.SelectedValue+ "'&BC='" + ddlBranch.SelectedValue + "'&PC='" + ddlPaper.SelectedValue + "'&SC='" + ddlSemester.SelectedValue + "'&ET='" + ddlExamType.SelectedValue + "'&EY='" + ddlSession.SelectedValue + "'');", true);
            //return;
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            if (ddlZone.SelectedIndex == 0 || ddlBranch.SelectedIndex == 0 && ddlSemester.SelectedIndex == 0 && ddlSession.SelectedIndex == 0 && ddlPaper.SelectedIndex == 0 && ddlExaminer.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please select ALL fields');", true);
                return;
            }
            string t_URL = "/WebApp/G2G/MarkEntry/PrintMarkFile.aspx?BC=" + ddlBranch.SelectedValue + "&PC=" + ddlPaper.SelectedValue + "&SC=" + ddlSemester.SelectedValue + "&EY=" + ddlSession.SelectedItem.Text + "&ZI=" + ddlZone.SelectedValue + "&EI=" + ddlExaminer.SelectedValue;
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('"+ t_URL + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1200,height=600');", true);
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "window.open('../../DataControlManager/Online complain/frmComplaintRevision.aspx?ID=" + _cId + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=30,height=30');", true);


        }

        private void GetSubjectType()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetPaperSubjectType(ddlBranch.SelectedValue, ddlSemester.SelectedValue);
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

        private void GetZone()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetZone(m_LoginID);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlZone.DataSource = dt;
                    ddlZone.DataTextField = "ZoneName";
                    ddlZone.DataValueField = "ZoneID";
                    ddlZone.DataBind();
                    ddlZone.Items.Insert(0, new ListItem("Select", "0"));
                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        //btnSave.Visible = false;
                        btnSubmit.Text = "Re-open for Marks Entry";
                    }
                    else
                    {
                        string ZoneID = Session["LoginID"].ToString().ToUpper();
                        ddlZone.SelectedIndex = ddlZone.Items.IndexOf(ddlZone.Items.FindByValue(ZoneID));
                        //ddlZone.Items.IndexOf(new ListItem("USA"));
                        //ddlZone.SelectedIndex = ddlZone.Items.IndexOf(ddlZone.Items.FindByValue(ZoneID));
                        ddlZone.Enabled = false;
                        btnSubmit.Text = "Submitted to University";
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void ddlBranch_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GetSubjectType();
            //CollegeList();
            divDetail.Visible = false;
            divButton.Visible = false;
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaperList();
            divDetail.Visible = false;
            divButton.Visible = false;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if ((ddlZone.SelectedIndex == 0) || (ddlBranch.SelectedIndex == 0) || (ddlSemester.SelectedIndex == 0) || (ddlSession.SelectedIndex == 0) || (ddlSubject.SelectedIndex == 0) || (ddlPaper.SelectedIndex == 0))
            {
                divAddH.Visible = false;
                divAddD.Visible = false;
                divButton.Visible = false;
                divDetailH.Visible = false;
                divDetail.Visible = false;
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please select ALL MANDATORY fields');", true);
                return;
            }
            else
            {
                divAddH.Visible = true;
                divAddD.Visible = true;
                divButton.Visible = false;
                divDetailH.Visible = false;
                divDetail.Visible = false;
            }
        }

        protected void btnSaveExaminer_Click(object sender, EventArgs e)
        {
            if (ddlZone.SelectedIndex == 0 && ddlBranch.SelectedIndex == 0 && ddlSemester.SelectedIndex == 0 && ddlSession.SelectedIndex == 0 && ddlSubject.SelectedIndex == 0 && ddlPaper.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please select ALL fields');", true);
                return;
            }

            if (txtExaminerName.Text != "")
            {
                string[] AFields =
                        {
                            "ZoneID"
                            ,"Semester"
                            ,"ExamYear"
                            ,"BranchCode"
                            ,"SubjectType"
                            ,"SubjectCode"
                            ,"PaperCode"
                            ,"ExaminerCode"
                            ,"ExaminerName"
                            ,"CreatedBy"

                    };

                Examiner_DT t_Examiner_DT = new Examiner_DT();

                t_Examiner_DT.RowID = "";
                t_Examiner_DT.ZoneID = ddlZone.SelectedValue;
                t_Examiner_DT.CreatedBy = Session["LoginID"].ToString();
                t_Examiner_DT.Semester = ddlSemester.SelectedValue;
                t_Examiner_DT.ExamYear = ddlSession.SelectedValue;
                t_Examiner_DT.BranchCode = ddlBranch.SelectedValue;
                t_Examiner_DT.SubjectType = ddlSubject.SelectedValue;
                t_Examiner_DT.SubjectCode = "";
                t_Examiner_DT.PaperCode = ddlPaper.SelectedValue;
                t_Examiner_DT.ExaminerCode = txtExaminerCode.Text.Trim();
                t_Examiner_DT.ExaminerName = txtExaminerName.Text.Trim();

                CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

                System.Data.DataTable result = null;
                string UID = "";

                result = m_AdmissionFormBLL.InsertExaminer(t_Examiner_DT, AFields);

                if (result.Rows.Count == 1)
                {
                    divAddH.Visible = false;
                    divAddD.Visible = false;
                    txtExaminerCode.Text = "";
                    txtExaminerName.Text = "";

                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Examiner Name Saved Sucessfully!');", true);
                }
                GetExaminer();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Examiner Code & Name cannot be blank');", true);
                return;
            }
        }

        private void GetExaminer()
        {
            string LoginID = "";
            int Department;
            string Branch = "";
            string t_Year = "";
            string Semester = "";
            string PaperCode = "";
            string Examiner = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());

            Branch = ddlBranch.SelectedValue.ToString();
            t_Year = ddlSession.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            PaperCode = ddlPaper.SelectedValue.ToString();

            DataTable ds = null;
            ds = m_AdmissionFormBLL.GetExaminer(LoginID, Branch, t_Year, Semester, ddlSubject.SelectedItem.Text, ddlSubject.SelectedValue, PaperCode, Examiner);

            //if (ds.Rows.Count > 0)
            {
                ddlExaminer.DataSource = ds;
                ddlExaminer.DataTextField = "Examiner";
                ddlExaminer.DataValueField = "ExaminerID";
                ddlExaminer.DataBind();
                ddlExaminer.Items.Insert(0, new ListItem("Select", "0"));
            }
        }

        protected void ddlPaper_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetExaminer();
            divDetail.Visible = false;
            divButton.Visible = false;
        }

        private void GetRollRange()
        {
            string LoginID = "";
            int Department;
            string Branch = "";
            string t_Year = "";
            string Semester = "";
            string PaperCode = "";
            string t_College = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());

            Branch = ddlBranch.SelectedValue.ToString();
            t_Year = ddlSession.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            PaperCode = ddlPaper.SelectedValue.ToString();
            t_College = ddlCollege.SelectedValue;

            DataTable ds = null;
            ds = m_AdmissionFormBLL.GetRollNoRange(Branch, t_Year, Semester, PaperCode, t_College);

            if (ds.Rows.Count > 0)
            {
                ddlRange.DataSource = ds;
                ddlRange.DataTextField = "RangeID";
                ddlRange.DataValueField = "RollNo";
                ddlRange.DataBind();
                ddlRange.Items.Insert(0, new ListItem("Select", "0"));
            }
        }

        protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetRollRange();
        }
    }
    
}