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
    public partial class InternalMarks : AdminBasePage
    {
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
                BranchList();
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
                        //btnSave.Visible = false;
                        btnSubmit.Text = "Re-open for Marks Entry";
                    }
                    else {
                        ddlCollege.SelectedIndex = ddlCollege.Items.IndexOf(ddlCollege.Items.FindByValue(Session["LoginID"].ToString().Substring(0, 3)));
                        ddlCollege.Enabled = false;
                        btnSubmit.Text = "Send For Approval";
                    }
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

        public void PaperList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetPaperLists(ddlBranch.SelectedValue.ToString(),ddlSemester.SelectedValue.ToString(),ddlSession.SelectedValue.ToString());
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlPaper.DataSource = dt;
                    ddlPaper.DataTextField = "PaperName";
                    ddlPaper.DataValueField = "PaperCode";
                    ddlPaper.DataBind();
                    ddlPaper.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void LoadGridData()
        {
            string LoginID = "";
            int Department;
            string ExamType = "";
            string PayStatus = "";
            string Branch = "";
            string College = "";
            string RollNo = "";
            string t_Year = "";
            string Semester = "";
            string PaperCode = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());
          
            ExamType = ddlExamType.SelectedItem.Text;
            College = ddlCollege.SelectedValue;

            Branch = ddlBranch.SelectedValue.ToString();
            t_Year = ddlSession.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            PaperCode = ddlPaper.SelectedValue.ToString();
            RollNo = txtRollNo.Text;

            DataTable ds = null;
            DataSet t_Ds = null;
            t_Ds = m_G2GDashboardBLL.GetStudentPaperDetails(College, ExamType, Branch,"", t_Year, Semester, PaperCode, RollNo);
            ds = t_Ds.Tables[0];
            if (ds.Rows.Count > 0)
            {
                if (ds.Rows.Count > 0)
                {
                    DataGridView.DataSource = ds;
                    divDetails.Visible = true;

                    if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("SOEC"))
                    {
                        btnSubmit.Visible = false;
                        //btnSave.Visible = false;
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
                    divDetails.Visible = false;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
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
                        btnSubmit.Visible = false;
                        e.Row.Cells[1].Enabled = false;
                        e.Row.Cells[8].Enabled = false;
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
        }
        /*
        protected void GenrateBatch_Click(object sender, EventArgs e)
        {
            try
            {
                int checkcount = 0;
                string Service = "0";
                string AppID = "";
                string BranchName = "";
                string ExamType = "";
                DataTable dt = new DataTable();

                BranchName = Convert.ToString(ddlBranch.SelectedValue);
                ExamType = Convert.ToString(ddlExamType.SelectedItem.Text);
                //if (ddlService.SelectedIndex != 0)
                //{
                //    string t_Service = ddlService.SelectedValue;
                //    string[] t_temp = t_Service.Split('_');
                //    Service = t_temp[0];
                //}
                if (ExamType == "Regular")
                {
                    Service = "1449";
                }
                else if (ExamType == "Back")
                {
                    Service = "1451";
                }               

                StringBuilder sb = new StringBuilder();

                foreach (GridViewRow item in DataGridView.Rows)
                {
                    CheckBox chk = new CheckBox();
                    chk = (CheckBox)item.FindControl("chkappid") as CheckBox;

                    if (!chk.Checked)
                        continue;
                    AppID = ((HiddenField)item.FindControl("HdfAppID") as HiddenField).Value; //item.Cells[1].Text;

                    sb.AppendLine("<BatchData>");
                    sb.AppendLine("<Data>");
                    sb.AppendLine("<SvcID>" + Service + "</SvcID>");
                    sb.AppendLine("<AppID>" + AppID + "</AppID>");
                    sb.AppendLine("</Data>");
                    sb.AppendLine("</BatchData>");
                    checkcount++;
                   
                }
                if (sb.Length > 0 && checkcount > 0)
                {

                    dt = m_G2GDashboardBLL.GenerateBatch_BulkPay(sb.ToString(), "", Service, Convert.ToString(Session["LoginID"]),BranchName,ExamType, ddlSemester.SelectedValue);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["Result"].ToString() == "1")
                        {
                            //LoadGridData();
                            
                            //Response.Write("<script>alert('Batch NO. " + dt.Rows[0]["BatchID"].ToString() + " generated successfully for selected service !.')</script>");

                            Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + dt.Rows[0]["ServiceID"].ToString() + "&AppID=" + dt.Rows[0]["AppID"].ToString());
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
                Response.Write("<script type=text/javascript>alert('Please try later \n.error log--" + ex.Message + "----')</script>");
            }

        }
        */
        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaperList();
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
                                Label PaperCode = (Label)rows.FindControl("PaperCode");
                                CheckBox chkAbent = (CheckBox)rows.FindControl("chkIsAbsent");
                                TextBox t_txtMarks = (TextBox)rows.FindControl("txtMarks");

                                string[] AFields =
                                {
                                  "RowID"
                                , "RollNo"
                                , "PaperCode"
                                , "ExamType"
                                , "Session"
                                , "Semester"
                                , "CreatedBy"
                                , "MarksObtained"
                                , "IsAbsent"

                            };

                                InternalMark_DT t_InternalMark_DT = new InternalMark_DT();

                                t_InternalMark_DT.RowID = RowID.Value;
                                t_InternalMark_DT.RollNo = RollNo.Text;
                                t_InternalMark_DT.PaperCode = PaperCode.Text;
                                t_InternalMark_DT.ExamType = ddlExamType.SelectedValue;
                                t_InternalMark_DT.Session = ddlSession.SelectedValue;
                                t_InternalMark_DT.Semester = ddlSemester.SelectedValue;
                                t_InternalMark_DT.CreatedBy = Session["LoginID"].ToString();
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
                                    t_InternalMark_DT.IsAbsent = "0";
                                    t_InternalMark_DT.MarksObtained = t_txtMarks.Text;
                                }
                                else
                                {
                                    t_InternalMark_DT.IsAbsent = "1";
                                    t_InternalMark_DT.MarksObtained = "0";
                                }

                                CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

                                System.Data.DataTable result = null;
                                string UID = "";

                                result = m_AdmissionFormBLL.InternalMarkData(t_InternalMark_DT, AFields);

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
                string Branch = ddlBranch.SelectedValue;
                string ExamType = ddlExamType.SelectedItem.Text;
                string ExamYear = ddlSession.SelectedValue;
                string Semester = ddlSemester.SelectedValue;
                string Paper = ddlPaper.SelectedValue;

                result = m_AdmissionFormBLL.InternalMarkSubmitted(College, Branch, ExamType, ExamYear, Semester, Paper, UID);

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
                        m_Message = "Record Send to Approval to SOEC!";
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
            divDetails.Visible = false;

            //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('/WebApp/G2G/MarkEntry/Acknowledgement.aspx?CC='"+ddlCollege.SelectedValue+ "'&BC='" + ddlBranch.SelectedValue + "'&PC='" + ddlPaper.SelectedValue + "'&SC='" + ddlSemester.SelectedValue + "'&ET='" + ddlExamType.SelectedValue + "'&EY='" + ddlSession.SelectedValue + "'');", true);
            //return;
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string t_URL = "/WebApp/G2G/MarkEntry/Acknowledgement.aspx?CC=" + ddlCollege.SelectedValue + "&BC=" + ddlBranch.SelectedValue + "&PC=" + ddlPaper.SelectedValue + "&SC=" + ddlSemester.SelectedValue + "&ET=" + ddlExamType.SelectedValue + "&EY=" + ddlSession.SelectedItem.Text;
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('"+ t_URL + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1200,height=600');", true);
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "window.open('../../DataControlManager/Online complain/frmComplaintRevision.aspx?ID=" + _cId + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=30,height=30');", true);


        }
    }
    
}