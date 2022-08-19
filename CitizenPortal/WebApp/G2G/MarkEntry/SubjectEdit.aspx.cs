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
    public partial class SubjectEdit : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        private AdmitCardBLL t_AdmitCardBLL = new AdmitCardBLL();

        List<string> Checked = new List<string>();
        string m_Message = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divDetails.Visible = false;
                CollegeList();
                BranchList();
            }
            LoadGridData();
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
            string SubjectType = "";

            LoginID = Convert.ToString(Session["LoginID"]);
            Department = Convert.ToInt32(Session["Department"].ToString());
            t_Year = ddlSession.SelectedValue;
            ExamType = ddlExamType.SelectedItem.Text;
            College = ddlCollege.SelectedValue;
            Semester = ddlSemester.SelectedValue;
            Branch = ddlBranch.SelectedValue.ToString();
            SubjectType = ddlSubject.SelectedValue.ToString();
            RollNo = txtRollNo.Text;

            if (College != "" || Semester != "" || Branch != "" || ExamType != "")
            {
                DataTable ds = null;
                ds = m_G2GDashboardBLL.GetEditSubjectDetails(College, ExamType, Branch, t_Year, Semester, SubjectType, RollNo);


                if (ds.Rows.Count > 0)
                {
                    DataGridView.DataSource = ds;
                    divDetails.Visible = true;
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

        protected void DataGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string SubType = "";
                string Semester = "";
                string BranchCode = "";
                string SubCode = "";

                DataTable DT = new DataTable();
                DT = null;

                DropDownList m_DropDownList = new DropDownList();
                m_DropDownList.ID = "ddlSubjectList_" + e.Row.Cells[1].Text;
                m_DropDownList.Attributes.Add("runat", "server");
                m_DropDownList.Enabled = false;

                CheckBox m_ChkBox = new CheckBox();
                m_ChkBox.ID = "chkRowID_" + e.Row.Cells[1].Text;
                m_ChkBox.Attributes.Add("runat", "server");
                m_ChkBox.ClientIDMode = ClientIDMode.Static;
                m_ChkBox.Attributes.Add("onclick", "EnableControls('" + e.Row.Cells[1].Text + "')");
                e.Row.Cells[1].Controls.Add(m_ChkBox);

                SubType = ddlSubject.SelectedValue;
                Semester = ddlSemester.SelectedValue;
                BranchCode = ddlBranch.SelectedValue;

                SubCode = e.Row.Cells[6].Text;

                m_DropDownList.Items.Clear();

                DT = m_G2GDashboardBLL.GetEditSubjectList(SubType, Semester, BranchCode);

                if (DT.Rows.Count != 0)
                {
                    m_DropDownList.Items.Clear();
                    m_DropDownList.DataTextField = "SubjectName";
                    m_DropDownList.DataValueField = "SubjectCode";
                    m_DropDownList.ClientIDMode = ClientIDMode.Static;
                    m_DropDownList.DataSource = DT;
                    m_DropDownList.DataBind();
                    m_DropDownList.Items.Insert(0, new ListItem("-Select-", "0"));
                    //m_DropDownList.Items.FindByText(SubName).Selected = true;
                    m_DropDownList.SelectedIndex = m_DropDownList.Items.IndexOf(m_DropDownList.Items.FindByValue(SubCode));
                    e.Row.Cells[e.Row.Cells.Count - 1].Controls.Add(m_DropDownList);
                }
            }



            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                //e.Row.Cells[5].Enabled = false;
                //e.Row.Cells[7].Attributes.Add("style", "display:none");
                e.Row.Cells[6].Attributes.Add("style", "display:none");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
        }

        protected void btnSave_Click_old(object sender, EventArgs e)
        {
            string SubjectName = "";
            string SubjectCode = "";
            DataTable DT = new DataTable();
            string RollNo = "";
            int Status = 0;
            int RowID = 0;
            string AppID = "";
            string t_Script = "";
            try
            {

                foreach (GridViewRow item in DataGridView.Rows)
                {
                    if (item != null)
                    {
                        GridViewRow row = item as GridViewRow;
                        RowID = Convert.ToInt32(row.Cells[1].Text);
                        RollNo = row.Cells[2].Text;
                        System.Web.UI.Control ctrl = row.FindControl("ddlSubjectList");

                        if (ctrl != null)
                        {
                            DropDownList ddl = (DropDownList)ctrl;
                            SubjectName = ddl.SelectedItem.Text;
                            SubjectCode = ddl.SelectedItem.Value;

                            if (SubjectCode == "0")
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Choose Subject From List!!!')", true);
                                return;
                            }
                            else
                            {
                                DT = null;// t_AdmitCardBLL.InsertEditStudentList(RowID, RollNo, AppID, OldSubjectCode, SubjectCode, SubjectName, txtRemarks.Text.Trim());

                                if (DT.Rows.Count != 0)
                                {
                                    if (DT.Rows[0]["Result"].ToString() == "1")
                                    {
                                        Status = 1;
                                    }
                                }
                            }
                            //break;
                        }
                    }
                }
                if (Status == 1)
                {
                    string URL = Request.Url.ToString();
                    LoadGridData();
                    m_Message = "Subject Update Sucessfully!";
                    t_Script = string.Format(t_Script, "Updated " + DataGridView.Rows.Count, m_Message.Replace("\r\n", ""));
                }

            }
            catch (Exception ee)
            {
                Status = 0;
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

            string SubjectName = "";
            string SubjectCode = "";
            DataTable DT = new DataTable();
            string RollNo = "";
            int Status = 0;
            int RowID = 0;
            string AppID = "";

            try
            {

                for (int i = 0; i < t_RowIDArr.Length; i++)
                {
                    foreach (GridViewRow rows in DataGridView.Rows)
                    {
                        CheckBox chkenroll = (CheckBox)rows.FindControl("chkRowID_" + t_RowIDArr[i]);

                        if (chkenroll != null && chkenroll.Checked)
                        {
                            //CheckBox chk = rows.Cells[1].Controls[1] as CheckBox;
                            string chk_RowID = rows.Cells[1].Text;
                            string OldSubjectCode = rows.Cells[7].Text;
                            if (chk_RowID == t_RowIDArr[i])
                            {
                                RowID = Convert.ToInt32(rows.Cells[1].Text);
                                RollNo = rows.Cells[2].Text;
                                System.Web.UI.Control ctrl = rows.FindControl("ddlSubjectList_" + t_RowIDArr[i]);

                                if (ctrl != null)
                                {
                                    DropDownList ddl = (DropDownList)ctrl;
                                    SubjectName = ddl.SelectedItem.Text;
                                    SubjectCode = ddl.SelectedItem.Value;

                                    if (SubjectCode == "0")
                                    {
                                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Choose Subject From List!!!')", true);
                                        return;
                                    }
                                    else
                                    {
                                        DT = t_AdmitCardBLL.InsertEditStudentList(RowID, RollNo, AppID, OldSubjectCode, SubjectCode, SubjectName, txtRemarks.Text.Trim(), Session["LoginID"].ToString(), ddlSubject.SelectedValue, ddlSemester.SelectedValue, ddlSession.SelectedValue, ddlExamType.SelectedValue);

                                        if (DT.Rows.Count != 0)
                                        {
                                            if (DT.Rows[0]["Result"].ToString() == "1")
                                            {
                                                Status = 1;
                                                t_UpdateCount++;
                                                t_ShowMsg = true;
                                            }
                                        }
                                    }
                                    //break;
                                }
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

        void GetSelectedRec()
        {
            if (ViewState["Checked"] != null)
            {
                Checked = (List<string>)ViewState["Checked"];
            }
            foreach (GridViewRow rows in DataGridView.Rows)
            {
                if (rows.Cells[1].Controls.Count > 0 && ((CheckBox)(rows.Cells[1].Controls[0])).Checked)
                {
                    CheckBox chk = rows.Cells[1].Controls[0] as CheckBox;
                    string t_RowID = rows.Cells[1].Text;
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

    }

}