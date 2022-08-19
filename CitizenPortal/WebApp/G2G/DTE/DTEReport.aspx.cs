using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.DTE
{
    public partial class DTEReport : AdminBasePage
    {
        CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();
        G2GDashboardBLL m_G2GDashboardBLL = new G2GDashboardBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string LoginID = "";
            int Department;

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                BindDistrict("21");
                BindService("132");
                CollegeList();
                BranchList();
            }
            else { }
                //LoadGridData();


            //BindGrid(LoginID, Department);
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
                    //if (!Session["LoginID"].ToString().Contains("Admin") && !Session["LoginID"].ToString().Contains("Univ") && !Session["LoginID"].ToString().Contains("SOEC"))
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
        private void BindGrid(string LoginID, int Department)
        {
            string FromDate = "";
            string ToDate = "";
            string Service = "";
            string District = "";
            string Status = "";
            string Branch = "";
            string College = "";
            string RollNo="";
            string ExamType = "";
            string t_Year = "";
            string Semester = "";
            string Paper = "";

            if (ddlServices.SelectedIndex != 0)
            {
                string t_Service = ddlServices.SelectedValue;
                string[] t_temp = t_Service.Split('_');
                Service = t_temp[0];
            }

            if (ddlDistrict.SelectedIndex != 0)
            {
                District = ddlDistrict.SelectedValue;
            }

            if (ddlStatus.SelectedIndex != 0)
            {
                Status = ddlStatus.SelectedValue;
            }
            if (ddlBranch.SelectedIndex != 0)
            {
                Branch = ddlBranch.SelectedValue;
            }
            if (ddlCollege.SelectedIndex != 0)
            {
                College = ddlCollege.SelectedValue;
            }
            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }
            if (TxtRollNo.Text != "" )
            {
                RollNo = TxtRollNo.Text.ToString();
            }


            if (ddlExamType.SelectedIndex != 0)
            {
                ExamType = ddlExamType.SelectedItem.Text;
            }
            if (ddlSession.SelectedIndex != 0)
            {
                t_Year = ddlSession.SelectedValue;
            }

            if (ddlSemester.SelectedIndex != 0)
            {
                Semester = ddlSemester.SelectedValue;
            }

            if (ddlPaper.SelectedIndex != 0)
            {
                Paper = ddlPaper.SelectedValue;
            }


            DataTable dt = null;
            dt = m_G2GDashboardBLL.GetDTEG2GDashboardDetails(LoginID, Department, Service,FromDate,ToDate, District, Status, Branch, College, RollNo, ExamType, t_Year, Semester, Paper);

            //grdView.DataSource = dt;
            //grdView.DataBind();

            //lblTotalRecords.InnerText = dt.Rows.Count.ToString();
        }

        private void BindService(string departmentcode)
        {
            ServicesBLL t_ServicesBLL = new ServicesBLL();
            System.Data.DataTable dtServices = t_ServicesBLL.GetDeptServices(departmentcode);

            ddlServices.DataTextField = "ServiceName";
            ddlServices.DataValueField = "ServiceCode";
            ddlServices.DataSource = dtServices;
            ddlServices.DataBind();

            ddlServices.Items.Insert(0, new ListItem("-Select Services-", "0"));
        }

        private void BindDistrict(string districtcode)
        {
            KioskRegistrationBLL t_KioskRegistrationBLL = new KioskRegistrationBLL();
            System.Data.DataTable dtDistrict = t_KioskRegistrationBLL.GetDistrictFromState(districtcode);

            ddlDistrict.DataTextField = "DistrictName";
            ddlDistrict.DataValueField = "DistrictCode";
            ddlDistrict.DataSource = dtDistrict;
            ddlDistrict.DataBind();

            ddlDistrict.Items.Insert(0, new ListItem("-Select-", "0"));
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


        public void LoadGridData()
        {
            string LoginID = "";
            int Department;
            string FromDate = "";
            string ToDate = "";

            LoginID = Session["LoginID"].ToString();
            Department = Convert.ToInt32(Session["Department"].ToString());

            if (!IsPostBack)
            {
                BindDistrict("21");
                BindService("121");
            }
            string Service = "";
            string District = "";
            string Status = "";
            string Branch = "";
            string College = "";
            string RollNo = "";
            string ExamType = "";
            string t_Year = "";
            string Semester = "";
            string Paper = "";

            if (ddlServices.SelectedIndex != 0)
            {
                string t_Service = ddlServices.SelectedValue;
                string[] t_temp = t_Service.Split('_');
                Service = t_temp[0];
            }

            if (ddlDistrict.SelectedIndex != 0)
            {
                District = ddlDistrict.SelectedValue;
            }

            if (ddlStatus.SelectedIndex != 0)
            {
                Status = ddlStatus.SelectedValue;
            }

            if (ddlBranch.SelectedIndex != 0)
            {
                Branch = ddlBranch.SelectedValue;
            }

            if (ddlCollege.SelectedIndex != 0)
            {
                College = ddlCollege.SelectedValue;
            }

            if (ddlExamType.SelectedIndex != 0)
            {
                ExamType = ddlExamType.SelectedItem.Text;
            }
            if (ddlSession.SelectedIndex != 0)
            {
                t_Year = ddlSession.SelectedValue;
            }

            if (ddlSemester.SelectedIndex != 0)
            {
                Semester = ddlSemester.SelectedValue;
            }

            if (ddlPaper.SelectedIndex != 0)
            {
                Paper = ddlPaper.SelectedValue;
            }

            if (txtFromDate.Text != "" && txtToDate.Text != "")
            {
                FromDate = Convert.ToDateTime(txtFromDate.Text).ToString("yyyy-MM-dd");
                ToDate = Convert.ToDateTime(txtToDate.Text).ToString("yyyy-MM-dd");
            }
            if (TxtRollNo.Text != "")
            {
                RollNo = TxtRollNo.Text.ToString();
            }
            DataTable ds = null;
            ds = m_G2GDashboardBLL.GetDTEG2GDashboardDetails(LoginID, Department, Service, FromDate, ToDate, District, Status, Branch, College, RollNo,ExamType,t_Year, Semester,Paper);

            //DataTable ds = m_G2GDashboardBLL.GetDTEG2GDashboardDetails(LoginID, Department, Service, District, Status);

            if (ds.Rows.Count > 0)
            {
                if (ds.Rows.Count > 0)
                {
                    DataGridView.DataSource = ds;
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                    DataTable dt = null;
                    DataGridView.DataSource = dt;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Data Found!!!')", true);
                DataTable dt = null;
                DataGridView.DataSource = dt;
            }
            DataGridView.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            LoadGridData();
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
                HtmlAnchor t_Anchor = null;
                HtmlAnchor t_ViewOutput = null;
                HtmlAnchor t_ViewOutput1 = null;

                TableCell Cell = GetCellByName(e.Row, "Document");
                if (Cell != null)
                {
                    //t_Anchor = new HtmlAnchor();
                    //t_Anchor.ID = "ViewDocument_" + e.Row.RowIndex;

                    //t_Anchor.InnerHtml = "Student History";

                    //t_Anchor.Attributes.Add("onclick", "StudentHistory()");

                    //t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    //Cell.Controls.Add(t_Anchor);
                    //Cell.Attributes.Add("Title", "Click to see the ouput of the certificate which will be send/given to applicant");
                    //Cell.Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                    //t_Anchor = null;
                }
                int j = 0;
                int k = 0;
                j = e.Row.Cells.Count - 1;
                k = e.Row.Cells.Count - 2;
                

                t_ViewOutput = new HtmlAnchor();
                t_ViewOutput.ID = "View_Output" + e.Row.RowIndex;

                t_ViewOutput1 = new HtmlAnchor();
                t_ViewOutput1.ID = "View_Output1" + e.Row.RowIndex;

                if (ddlBranch.SelectedIndex != 0)
                {
                    string [] svcID = ddlServices.SelectedValue.Split('_');
                    string temp_svcID= svcID[0];
                    if (temp_svcID == "1449")
                    {
                        //if (Session["LoginID"].ToString().Contains("Admin") || Session["LoginID"].ToString().Contains("Univ"))
                        if (e.Row.Cells[16].Text != "" && e.Row.Cells[16].Text != "&nbsp;")
                        {
                            t_ViewOutput1.InnerHtml = "Edit";
                            t_ViewOutput1.Attributes.Add("onclick", "EditOutput('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "')");
                            e.Row.Cells[j].Attributes.Add("Title", "Click to Edit applicant");

                            t_ViewOutput.InnerHtml = "View";
                            t_ViewOutput.Attributes.Add("onclick", "ViewOutput('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "')");
                            e.Row.Cells[k].Attributes.Add("Title", "Click to view applicant");
                        }
                        else
                        {
                            t_ViewOutput.InnerHtml = "View";
                            t_ViewOutput.Attributes.Add("onclick", "ViewOutput('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "')");
                            e.Row.Cells[k].Attributes.Add("Title", "Click to view applicant");
                        }
                    }
                    //else
                    //{
                    //    t_ViewOutput.InnerHtml = "View";
                    //    t_ViewOutput.Attributes.Add("onclick", "ViewOutput('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");
                    //    e.Row.Cells[j].Attributes.Add("Title", "Click to view applicant");
                    //}
                    if (temp_svcID == "1450")
                    {
                        t_ViewOutput1.InnerHtml = "View";
                        t_ViewOutput1.Attributes.Add("onclick", "AdmitCard('" + e.Row.Cells[j].Text + "', '" + e.Row.Cells[1].Text + "')");
                        e.Row.Cells[j].Attributes.Add("Title", "Download Admit Card");
                    }                    
                    if (temp_svcID == "1458")
                    {
                        t_ViewOutput.InnerHtml = "View";
                        t_ViewOutput.Attributes.Add("onclick", "EditSubject('" + e.Row.Cells[j].Text + "', '" + e.Row.Cells[1].Text + "')");
                        e.Row.Cells[j].Attributes.Add("Title", "Edit SEC-B subject");
                    }
                    if (temp_svcID == "1451")
                    {
                            //Session["Branch"] = ddlBranch.SelectedValue;
                            //Session["SvcID"] = temp_svcID;
                            t_ViewOutput.InnerHtml = "View";
                            t_ViewOutput.Attributes.Add("onclick", "ExamForm('" + e.Row.Cells[j].Text+ "', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "', '" + e.Row.Cells[5].Text + "')");
                            e.Row.Cells[j].Attributes.Add("Title", "Fill Exam Form");
                    }
                    if (temp_svcID == "1455")
                    {
                        //Session["Branch"] = ddlBranch.SelectedValue;
                        //Session["SvcID"] = temp_svcID;
                        t_ViewOutput.InnerHtml = "View";
                        t_ViewOutput.Attributes.Add("onclick", "ShowScore('" + e.Row.Cells[j].Text + "', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "', '" + e.Row.Cells[5].Text + "')");
                        e.Row.Cells[j].Attributes.Add("Title", "Fill Exam Form");
                    }
                    if (temp_svcID == "1456")
                    {
                        string Str = e.Row.Cells[j].Text;
                        Str = Str.Replace("&nbsp;", " ");
                        if (Str == "&nbsp;" || Str == " ")
                        {

                        }
                        else {
                            t_ViewOutput.InnerHtml = "View";
                            t_ViewOutput.Attributes.Add("onclick", "ViewOutput('" + HttpUtility.HtmlDecode(e.Row.Cells[j].Text) + "', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");
                            e.Row.Cells[j].Attributes.Add("Title", "Click to view applicant");

                            e.Row.Cells[j].Controls.Add(t_ViewOutput);
                            t_ViewOutput.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                            e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                        }
                        
                        t_ViewOutput1.InnerHtml = "Edit";
                        t_ViewOutput1.Attributes.Add("onclick", "EditOutput('" + HttpUtility.HtmlDecode(e.Row.Cells[k].Text) + "', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "')");
                        e.Row.Cells[k].Attributes.Add("Title", "Click to Edit applicant");                      
                        
                    }
                    else
                    {
                        t_ViewOutput.InnerHtml = "Action";
                        t_ViewOutput.Attributes.Add("onclick", "OtherView('" + e.Row.Cells[j].Text + "', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[2].Text + "', '" + e.Row.Cells[9].Text + "')");
                        e.Row.Cells[j].Attributes.Add("Title", "FORM");
                    }
                }
                //else
                //{
                //    t_ViewOutput.InnerHtml = "View";
                //    t_ViewOutput.Attributes.Add("onclick", "ViewOutput('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");
                //    e.Row.Cells[j].Attributes.Add("Title", "Click to view applicant");
                //}

                e.Row.Cells[j].Controls.Add(t_ViewOutput);
                t_ViewOutput.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[j].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                e.Row.Cells[k].Controls.Add(t_ViewOutput1);
                t_ViewOutput1.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[k].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");


                j++;
                k++;

                t_Anchor = null;

                ////-------------------------------//
                //i = e.Row.Cells.Count - 1;

                //t_Anchor = new HtmlAnchor();
                //t_Anchor.ID = "TakeAction_" + e.Row.RowIndex;

                //t_Anchor.InnerHtml = "View";

                //t_Anchor.Attributes.Add("onclick", "TakeAction('', '" + e.Row.Cells[0].Text + "', '" + e.Row.Cells[1].Text + "')");

                //t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                //e.Row.Cells[i].Controls.Add(t_Anchor);
                //e.Row.Cells[i].Attributes.Add("Title", "View");
                //e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");

                //i++;

                //t_Anchor = null;
            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {

                //e.Row.Cells[10].Attributes.Add("style", "display:none");
                e.Row.Cells[0].Attributes.Add("style", "display:none");
            }
        }

        protected void grdView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ////GetSelectedRec();
            //grdView.PageIndex = e.NewPageIndex;
            //grdView.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadGridData();
        }

        public void PaperList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetPaperLists(ddlBranch.SelectedValue.ToString(), ddlSemester.SelectedValue.ToString(), ddlSession.SelectedValue.ToString());
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

        protected void ddlSemester_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaperList();
        }
    }
}