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
    public partial class FeeConfiguration : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        List<string> Checked = new List<string>();
        string m_Message = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MenuRole"].ToString() != "University")  {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid User!!", "alert('"+Session["LoginID"].ToString() + " is not a valid user to use this page.');window.close();", true);
                return;
            }
            if (!IsPostBack)
            {
                divDetails.Visible = false;
            }
            
        }

        public void LoadGridData(string p_ActionType)
        {
            string LoginID = "";
            int Department;
            string ExamType = "";
            string Branch = "";
            string t_Year = "";
            string Semester = "";
            

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());                    

            if (ddlBranch.SelectedIndex != 0)
            {
                Branch = ddlBranch.SelectedValue;
            }

            if (ddlExamType.SelectedIndex != 0)
            {
                ExamType = ddlExamType.SelectedValue;
            }

            if (ddlExamType.SelectedIndex != 0)
            {
                ExamType = ddlExamType.SelectedValue;
            }
            if (ddlSession.SelectedIndex != 0)
            {
                t_Year = ddlSession.SelectedValue;
            }

            if (ddlSemester.SelectedIndex != 0)
            {
                Semester = ddlSemester.SelectedValue;
            }
                        

            DataTable ds = null;
            ds = m_G2GDashboardBLL.GetSemesterFeeDetails(Semester,Branch, ExamType, t_Year, hdfActionType.Value);
            
            if (ds.Rows.Count > 0)
            {
                DataGridView.DataSource = ds;
                divDetails.Visible = true;                
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
                string t_Semester = "";
                CheckBox chk = (CheckBox)e.Row.FindControl("chkappid");
                HyperLink hypLnk = (HyperLink)e.Row.FindControl("View");
                HiddenField hfPayFlag = (HiddenField)e.Row.FindControl("hfPayFlag");
                Label IsSubmitted = (Label)e.Row.FindControl("IsSubmitted");
                
                //DropDownList m_DropDownList = new DropDownList();
                //m_DropDownList.ID = "ddlExamSeme_" + e.Row.Cells[1].Text;
                //m_DropDownList.Attributes.Add("runat", "server");
                //m_DropDownList.Enabled = false;
                //t_Semester = e.Row.Cells[26].Text;

                //m_DropDownList.SelectedIndex = m_DropDownList.Items.IndexOf(m_DropDownList.Items.FindByValue(t_Semester));

                
                e.Row.Cells[6].Enabled = false;
                e.Row.Cells[7].Enabled = false;
                e.Row.Cells[8].Enabled = false;
                e.Row.Cells[9].Enabled = false;
                e.Row.Cells[10].Enabled = false;
                e.Row.Cells[11].Enabled = false;
                e.Row.Cells[12].Enabled = false;
                e.Row.Cells[13].Enabled = false;
                e.Row.Cells[14].Enabled = false;
                e.Row.Cells[15].Enabled = false;
                e.Row.Cells[16].Enabled = false;
                e.Row.Cells[17].Enabled = false;
                e.Row.Cells[18].Enabled = false;
                e.Row.Cells[19].Enabled = false;
                e.Row.Cells[20].Enabled = false;
                e.Row.Cells[21].Enabled = false;
                e.Row.Cells[22].Enabled = false;
                e.Row.Cells[23].Enabled = false;
                e.Row.Cells[24].Enabled = false;
                e.Row.Cells[25].Enabled = false;
                if (hdfActionType.Value == "0")
                {
                    e.Row.Cells[1].Attributes.Add("style", "display:none");
                    e.Row.Cells[3].Attributes.Add("style", "display:none");
                    e.Row.Cells[1].Enabled = false;
                    e.Row.Cells[2].Enabled = false;
                    e.Row.Cells[5].Enabled = false;
                }
                else if (hdfActionType.Value == "2")
                {
                    e.Row.Cells[2].Attributes.Add("style", "display:none");
                    e.Row.Cells[1].Enabled = true; e.Row.Cells[3].Enabled = false;
                }
                else if (hdfActionType.Value == "1")
                {
                    //e.Row.Cells[1].Attributes.Add("style", "display:none");
                    e.Row.Cells[3].Attributes.Add("style", "display:none");
                    e.Row.Cells[1].Enabled = true;
                    e.Row.Cells[2].Enabled = false;
                    e.Row.Cells[5].Enabled = false;
                }
            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                if (hdfActionType.Value == "2")
                {                    
                    e.Row.Cells[2].Attributes.Add("style", "display:none");
                }
                else if (hdfActionType.Value == "1")
                {
                    //e.Row.Cells[1].Attributes.Add("style", "display:none");
                    e.Row.Cells[3].Attributes.Add("style", "display:none");
                }
                else if (hdfActionType.Value == "0")
                {
                    e.Row.Cells[1].Attributes.Add("style", "display:none");
                    //e.Row.Cells[2].Attributes.Add("style", "display:none");
                    e.Row.Cells[3].Attributes.Add("style", "display:none");
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            hdfActionType.Value = "0";
            LoadGridData(hdfActionType.Value);
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
            string FromDate = "";
            string ToDate = "";

            //FromDate = Convert.ToDateTime(StartDate.Text).ToString("yyyy-MM-dd");
            //ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");

            int t_UpdateCount = 0;
            string t_RowID = GetRecords();

            if (string.IsNullOrEmpty(t_RowID))
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Select Records to continue');", true);
                return;
            }

            string[] t_RowIDArr = t_RowID.Split(',');
            string t_Semester = "";
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
                        GridViewRow row = rows as GridViewRow;
                        CheckBox chkenroll = (CheckBox)rows.FindControl("chkRollNo");
                        System.Web.UI.Control ctrl = row.FindControl("ExamSemester");

                        if (chkenroll.Checked)
                        {
                            CheckBox chk = rows.Cells[1].Controls[1] as CheckBox;
                            HiddenField RowID = rows.Cells[0].Controls[1] as HiddenField;
                            string chk_RowID = RowID.Value;
                            
                            if(chk_RowID == t_RowIDArr[i])
                            {
                                HiddenField hfRowID = (HiddenField)rows.FindControl("HdfAppID");
                                if (hdfActionType.Value == "2")
                                {
                                    DropDownList ddl = (DropDownList)ctrl;
                                    t_Semester = ddl.SelectedItem.Value;
                                }
                                else
                                {
                                    Label t_txtExamSemester = (Label)rows.FindControl("lblExamSemester");
                                    t_Semester = t_txtExamSemester.Text;
                                }
                                Label t_txtExam_Type = (Label)rows.FindControl("Exam_Type");
                                Label t_txtBranchStream = (Label)rows.FindControl("BranchStream");
                                TextBox t_txtExamYear = (TextBox)rows.FindControl("txtExamYear");
                                Label t_txtCreatedOn = (Label)rows.FindControl("CreatedOn");

                                TextBox t_txtExamination_fees = (TextBox)rows.FindControl("txtExamination_fees");
                                TextBox t_txtCentre_Charges = (TextBox)rows.FindControl("txtCentre_Charges");
                                TextBox t_txtSupervision_Charge = (TextBox)rows.FindControl("txtSupervision_Charges");
                                TextBox t_txtSubsequent_Appearace = (TextBox)rows.FindControl("txtSubsequent_Appearance");
                                TextBox t_txtPortalFee = (TextBox)rows.FindControl("txtPortalFee");

                                TextBox t_txtPaper1_FeesAmount = (TextBox)rows.FindControl("txtPaper1_FeesAmount");
                                TextBox t_txtPaper2_FeesAmount = (TextBox)rows.FindControl("txtPaper2_FeesAmount");
                                TextBox t_txtPaper3_FeesAmount = (TextBox)rows.FindControl("txtPaper3_FeesAmount");
                                TextBox t_txtPaperAll_FeesAmount = (TextBox)rows.FindControl("txtPaperAll_FeesAmount");

                                TextBox t_txtLateFeesAmount = (TextBox)rows.FindControl("txtLateFeesAmount");
                                TextBox t_txtLateFeesAmount2 = (TextBox)rows.FindControl("txtLateFeesAmount2");
                                TextBox t_txtLateFeesAmount3 = (TextBox)rows.FindControl("txtLateFeesAmount3");

                                TextBox t_txtFeesDate = (TextBox)rows.FindControl("txtFeesDate");
                                TextBox t_txtFeesDate2 = (TextBox)rows.FindControl("txtFeesDate2");
                                TextBox t_txtFeesDate3 = (TextBox)rows.FindControl("txtFeesDate3");

                                TextBox t_txtStartDate = (TextBox)rows.FindControl("txtStartDate");
                                TextBox t_txtEndDate = (TextBox)rows.FindControl("txtEndDate");

                                TextBox t_txtPCM_PCG_Fee = (TextBox)rows.FindControl("txtPCM_PCG_Fee");
                                TextBox t_txtDiploma_Fee = (TextBox)rows.FindControl("txtDiploma_Fee");

                                //Conditation Validation

                                if (t_Semester == "" || t_Semester == "0")
                                {
                                    t_Script = "Please select Semester of the Exam!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Examination Semester", "alert('" + t_Script + "');", true);
                                    return;
                                }
                                if (t_txtExam_Type.Text == "" || (t_txtExam_Type.Text != "REGULAR" && t_txtExam_Type.Text != "BACK" && t_txtExam_Type.Text != "Improvement")) { t_Script = "Exam Type cannot be blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Exam type", "alert('" + t_Script + "');", true); return; }
                                if (t_txtBranchStream.Text == "" || (t_txtBranchStream.Text != "HONOURS" && t_txtBranchStream.Text != "PASS")) { t_Script = "Branch Stream can only be HONOURS / PASS!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Branch Stram", "alert('" + t_Script + "');", true); return; }
                                if (t_txtExamYear.Text == "" || t_txtExamYear.Text.Length != 4) { t_Script = "Exam year can not be blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Exam Year", "alert('" + t_Script + "');", true); return; }
                                if (t_txtCentre_Charges.Text == "") { t_Script = "Exam Center Fee is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Exam Center Fee", "alert('" + t_Script + "');", true); return; }
                                if (t_txtExam_Type.Text.ToUpper() == "BACK")
                                {
                                    if (t_txtSubsequent_Appearace.Text == "") { t_Script = "Subsequent Appearence Fee is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Subsequent Appearence Fee", "alert('" + t_Script + "');", true); return; }

                                    if (t_txtPaper1_FeesAmount.Text == "") { t_Script = "Fail in 1 Paper Fee Amount is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Examination Fee", "alert('" + t_Script + "');", true); return; }
                                    if (t_txtPaper2_FeesAmount.Text == "") { t_Script = "Fail in 2 Paper Fee Amount is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Examination Fee", "alert('" + t_Script + "');", true); return; }
                                    if (t_txtPaper3_FeesAmount.Text == "") { t_Script = "Fail in 3 Paper Fee Amount is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Examination Fee", "alert('" + t_Script + "');", true); return; }
                                    if (t_txtPaperAll_FeesAmount.Text == "") { t_Script = "Fail in All Paper Fee Amount is blank!!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Examination Fee", "alert('" + t_Script + "');", true); return; }
                                }
                                else if (t_txtExam_Type.Text.ToUpper() == "REGULAR")
                                {
                                    if (t_txtExamination_fees.Text == "") { t_Script = "Examination Fee is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Examination Fee", "alert('" + t_Script + "');", true); return; }

                                    //t_txtExamination_fees.Text = "0.00";
                                    //t_txtCentre_Charges.Text = "0.00";
                                    //t_txtSubsequent_Appearace.Text = "0.00";
                                    
                                    //t_txtPaper1_FeesAmount.Text = "0.00";
                                    //t_txtPaper2_FeesAmount.Text = "0.00";
                                    //t_txtPaper3_FeesAmount.Text = "0.00";
                                    //t_txtPaperAll_FeesAmount.Text = "0.00";
                                }
                                if (t_txtPortalFee.Text == "") { t_Script = "Portal Fee / Support Charges is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Portal Fee", "alert('" + t_Script + "');", true); return; }
                                if (t_txtSupervision_Charge.Text == "") { t_Script = "Supervision Charges is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Supervision Charges", "alert('" + t_Script + "');", true); return; }

                                if (t_txtLateFeesAmount.Text == "") { t_Script = "1st Late Fee Amount is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Late Fee", "alert('" + t_Script + "');", true); return; }
                                if (t_txtLateFeesAmount2.Text == "") { t_Script = "2nd Late Fee Amount is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Late Fee", "alert('" + t_Script + "');", true); return; }
                                if (t_txtLateFeesAmount3.Text == "") { t_Script = "3rd Late Fee Amount is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Late Fee", "alert('" + t_Script + "');", true); return; }

                                if (t_txtFeesDate.Text == "") { t_Script = "1st Late Fee Date is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Late Fee Date", "alert('" + t_Script + "');", true); return; }
                                if (t_txtFeesDate2.Text == "") { t_Script = "2nd Late Fee Date is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Late Fee Date", "alert('" + t_Script + "');", true); return; }
                                if (t_txtFeesDate3.Text == "") { t_Script = "3rd Late Fee Date is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Late Fee Date", "alert('" + t_Script + "');", true); return; }

                                if (t_txtStartDate.Text == "") { t_Script = "Examination Start Date is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Examination Start Date", "alert('" + t_Script + "');", true); return; }
                                if (t_txtEndDate.Text == "") { t_Script = "Examination End Date is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Examination End Date", "alert('" + t_Script + "');", true); return; }
                                if (t_Semester == "6SEM")
                                {
                                    if (t_txtPCM_PCG_Fee.Text == "" || t_txtPCM_PCG_Fee.Text == "0.00") { t_Script = "PCM & PCG Fee is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Date", "alert('" + t_Script + "');", true); return; }
                                    if (t_txtDiploma_Fee.Text == "" || t_txtDiploma_Fee.Text == "0.00") { t_Script = "Charges for Diploma is blank!"; ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Diploma Fee", "alert('" + t_Script + "');", true); return; }
                                }
                                else {
                                    t_txtPCM_PCG_Fee.Text = "0.00";
                                    t_txtDiploma_Fee.Text = "0.00";
                                }

                                DateTime FeesDate = Convert.ToDateTime(t_txtFeesDate.Text);
                                DateTime FeesDate2 = Convert.ToDateTime(t_txtFeesDate2.Text);
                                DateTime FeesDate3 = Convert.ToDateTime(t_txtFeesDate3.Text);

                                DateTime StartDate = Convert.ToDateTime(t_txtStartDate.Text);
                                DateTime EndDate = Convert.ToDateTime(t_txtEndDate.Text);

                                if (StartDate.CompareTo(FeesDate) > 0)
                                {
                                    t_Script = "1st Late Fee Date should be greated then Examination Start Date!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Date", "alert('" + t_Script + "');", true);
                                    return;
                                }

                                if (StartDate.CompareTo(FeesDate2) > 0)
                                {
                                    t_Script = "2nd Late Fee Date should be greated then Examination Start Date!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Date", "alert('" + t_Script + "');", true);
                                    return;
                                }

                                if (StartDate.CompareTo(FeesDate3) > 0)
                                {
                                    t_Script = "3rd Late Fee Date should be greated then Examination Start Date!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Date", "alert('" + t_Script + "');", true);
                                    return;
                                }

                                if (EndDate.CompareTo(FeesDate) < 0)
                                {
                                    t_Script = "1st Late Fee Date should be less then Examination End Date!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Date", "alert('" + t_Script + "');", true);
                                    return;
                                }

                                if (EndDate.CompareTo(FeesDate2) < 0)
                                {
                                    t_Script = "2nd Late Fee Date should be less then Examination End Date!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Date", "alert('" + t_Script + "');", true);
                                    return;
                                }

                                if (EndDate.CompareTo(FeesDate3) < 0)
                                {
                                    t_Script = "3rd Late Fee Date should be less then Examination End Date!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Date", "alert('" + t_Script + "');", true);
                                    return;
                                }

                                if (StartDate.CompareTo(EndDate) > 0)
                                {
                                    t_Script = "End Date should be greated then Start Date!";
                                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Invalid Date", "alert('" + t_Script + "');", true);
                                    return;
                                }

                                string[] AFields =
                                {
                                    "RowID"
                                    ,"ExamSemester"
                                    ,"Exam_Type"
                                    ,"BranchStream"
                                    ,"ExamYear"
                                    ,"CreatedOn"
                                    ,"CreatedBy"
                                    ,"Examination_fees"
                                    ,"Centre_Charges"
                                    ,"Supervision_Charges"
                                    ,"Subsequent_Appearance"
                                    ,"PortalFee"

                                    ,"Paper1_FeesAmount"
                                    ,"Paper2_FeesAmount"
                                    ,"Paper3_FeesAmount"
                                    ,"PaperAll_FeesAmount"

                                    ,"LateFeesAmount"
                                    ,"LateFeesAmount2"
                                    ,"LateFeesAmount3"

                                    ,"FeesDate"
                                    ,"FeesDate2"
                                    ,"FeesDate3"

                                    ,"StartDate"
                                    ,"EndDate"

                                    ,"PCM_PCG_Fee"
                                    ,"Diploma_Fee"
                                    ,"ActionType"

                            };

                                SemesterFee_DT t_SemesterFee_DT = new SemesterFee_DT();

                                t_SemesterFee_DT.RowID = RowID.Value;                                
                                t_SemesterFee_DT.CreatedBy = Session["LoginID"].ToString();


                                t_SemesterFee_DT.ExamSemester = t_Semester;
                                t_SemesterFee_DT.Exam_Type = t_txtExam_Type.Text;
                                t_SemesterFee_DT.BranchStream = t_txtBranchStream.Text;
                                t_SemesterFee_DT.ExamYear = t_txtExamYear.Text;
                                t_SemesterFee_DT.CreatedOn = t_txtCreatedOn.Text;

                                t_SemesterFee_DT.Examination_fees = t_txtExamination_fees.Text;
                                t_SemesterFee_DT.Centre_Charges = t_txtCentre_Charges.Text;
                                t_SemesterFee_DT.Supervision_Charges = t_txtSupervision_Charge.Text;
                                t_SemesterFee_DT.Subsequent_Appearance = t_txtSubsequent_Appearace.Text;
                                t_SemesterFee_DT.PortalFee = t_txtPortalFee.Text;

                                t_SemesterFee_DT.Paper1_FeesAmount = t_txtPaper1_FeesAmount.Text;
                                t_SemesterFee_DT.Paper2_FeesAmount = t_txtPaper2_FeesAmount.Text;
                                t_SemesterFee_DT.Paper3_FeesAmount = t_txtPaper3_FeesAmount.Text;
                                t_SemesterFee_DT.PaperAll_FeesAmount = t_txtPaperAll_FeesAmount.Text;

                                t_SemesterFee_DT.LateFeesAmount = t_txtLateFeesAmount.Text;
                                t_SemesterFee_DT.LateFeesAmount2 = t_txtLateFeesAmount2.Text;
                                t_SemesterFee_DT.LateFeesAmount3 = t_txtLateFeesAmount3.Text;

                                t_SemesterFee_DT.FeesDate = Convert.ToDateTime(t_txtFeesDate.Text).ToString("yyyy-MM-dd HH:mm:ss");
                                t_SemesterFee_DT.FeesDate2 = Convert.ToDateTime(t_txtFeesDate2.Text).ToString("yyyy-MM-dd HH:mm:ss");
                                t_SemesterFee_DT.FeesDate3 = Convert.ToDateTime(t_txtFeesDate3.Text).ToString("yyyy-MM-dd HH:mm:ss");

                                t_SemesterFee_DT.StartDate = Convert.ToDateTime(t_txtStartDate.Text).ToString("yyyy-MM-dd HH:mm:ss");
                                t_SemesterFee_DT.EndDate = Convert.ToDateTime(t_txtEndDate.Text).ToString("yyyy-MM-dd HH:mm:ss");

                                t_SemesterFee_DT.PCM_PCG_Fee = t_txtPCM_PCG_Fee.Text;
                                t_SemesterFee_DT.Diploma_Fee = t_txtDiploma_Fee.Text;
                                t_SemesterFee_DT.ActionType = hdfActionType.Value;

                                CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

                                System.Data.DataTable result = null;
                                string UID = "";

                                result = m_AdmissionFormBLL.InsertSemesterFee(t_SemesterFee_DT, AFields);

                                if (result != null && result.Rows.Count > 0)
                                {
                                    if (result.Rows[0]["Result"].ToString() != "0")
                                    {
                                        t_UpdateCount++;
                                        t_ShowMsg = true;
                                    }
                                    m_Message = result.Rows[0]["MSGText"].ToString();
                                }

                                break;
                            }

                        }
                    }
                }
                if (t_ShowMsg == true)
                {
                    
                    t_Script = "alert('\"{0}\" {1}');";
                    //if (hdfActionType.Value  != "1")
                    //    m_Message = "Record inserted sucessfully.";
                    hdfActionType.Value = "0";
                    LoadGridData("0");
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            hdfActionType.Value = "2";
            LoadGridData("2");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (ddlSemester.SelectedValue == "0" && ddlSession.SelectedValue == "0")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select Semester & Exam Year to edit record!!!')", true);
                return;
            }
            else
            {
                hdfActionType.Value = "1";
                LoadGridData("1");
            }
        }
    }
    
}