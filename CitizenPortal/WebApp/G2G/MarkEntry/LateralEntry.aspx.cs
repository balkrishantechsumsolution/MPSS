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
    public partial class Lateralentry : AdminBasePage
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
                //divAddH.Visible = false;
                //divAddD.Visible = false;                
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
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetTheoryPaperLists(ddlBranch.SelectedValue.ToString(),ddlSemester.SelectedValue.ToString(),ddlSession.SelectedValue.ToString(),ddlSubject.SelectedValue, ddlZone.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlPaper.DataSource = dt;
                    ddlPaper.DataTextField = "PaperName";
                    ddlPaper.DataValueField = "PaperCode";
                    ddlPaper.DataBind();
                    ddlPaper.Items.Insert(0, new ListItem("Select", "0"));
                }
            }
            catch (Exception ex)
            {

            }
        }

     
        
        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaperList();
            
            //divAddH.Visible = false;
            //divAddD.Visible = false;
            
            //ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('/WebApp/G2G/MarkEntry/Acknowledgement.aspx?CC='"+ddlCollege.SelectedValue+ "'&BC='" + ddlBranch.SelectedValue + "'&PC='" + ddlPaper.SelectedValue + "'&SC='" + ddlSemester.SelectedValue + "'&ET='" + ddlExamType.SelectedValue + "'&EY='" + ddlSession.SelectedValue + "'');", true);
            //return;
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string t_URL = "/WebApp/G2G/MarkEntry/TheoryAcknowledgement.aspx?CC=" + ddlCollege.SelectedValue + "&BC=" + ddlBranch.SelectedValue + "&PC=" + ddlPaper.SelectedValue + "&SC=" + ddlSemester.SelectedValue + "&ET=" + ddlExamType.SelectedValue + "&EY=" + ddlSession.SelectedItem.Text + "&CB=" + ddlZone.SelectedValue + "&EI=" + ddlExaminer.SelectedValue;
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "window.open('"+ t_URL + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=1200,height=600');", true);
            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "newWindow", "window.open('../../DataControlManager/Online complain/frmComplaintRevision.aspx?ID=" + _cId + "','_blank','status=1,toolbar=0,menubar=0,location=1,scrollbars=1,resizable=1,width=30,height=30');", true);


        }

        private void GetSubjectType()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_AdmissionFormBLL.GetPaperSubjectType(ddlBranch.SelectedValue, ddlSemester.SelectedValue);
                //if (dt != null && dt.Rows.Count > 0)
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
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void ddlBranch_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GetSubjectType();
            CollegeList();
            //divAddH.Visible = false;
            //divAddD.Visible = false;           
        }

        protected void ddlSubject_SelectedIndexChanged(object sender, EventArgs e)
        {
            PaperList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if ((ddlZone.SelectedIndex == 0) || (ddlBranch.SelectedIndex == 0) || (ddlSemester.SelectedIndex == 0) || (ddlSession.SelectedIndex == 0) || (ddlSubject.SelectedIndex == 0) || (ddlPaper.SelectedIndex == 0))
            {
                divAddH.Visible = false;
                divAddD.Visible = false;               
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please select ALL MANDATORY fields');", true);
                return;
            }
            else
            {
                divAddH.Visible = true;
                divAddD.Visible = true;
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
            //divAddH.Visible = false;
            //divAddD.Visible = false;           
        }

        protected void btnLateral_Click(object sender, EventArgs e)
        {
            if ((ddlZone.SelectedIndex == 0) || (ddlBranch.SelectedIndex == 0) || (ddlSemester.SelectedIndex == 0) || (ddlSession.SelectedIndex == 0) || (ddlSubject.SelectedIndex == 0) || (ddlPaper.SelectedIndex == 0) || (ddlExaminer.SelectedIndex == 0))
            {
                //divAddH.Visible = false;
                //divAddD.Visible = false;
                
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please select ALL MANDATORY fields');", true);
                return;
            }
            if (txtMark.Text.Trim() != "" && txtTotal.Text.Trim() !="") {

                if (Convert.ToInt32(txtMark.Text.Trim()) > Convert.ToInt32(txtTotal.Text.Trim())) {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Please enter valid marks');", true);
                    return;
                }
                try
                {
                    string[] AFields =
                                        {
                                  "RowID"
                                , "RollNo"
                                , "PaperCode"
                                , "ExamType"
                                , "Session"
                                , "Semester"
                                , "CreatedBy"
                                , "TheoryMark"
                                , "TotalMark"
                                , "IsAbsent"
                                , "ExaminerID"
                                , "SubjectType"
                            };

                    TheoryMark_DT t_TheoryMark_DT = new TheoryMark_DT();

                    t_TheoryMark_DT.RowID = "";
                    t_TheoryMark_DT.RollNo = txtRollNo.Text;
                    t_TheoryMark_DT.PaperCode = ddlPaper.SelectedValue;
                    t_TheoryMark_DT.ExamType = ddlExamType.SelectedValue;
                    t_TheoryMark_DT.Session = ddlSession.SelectedValue;
                    t_TheoryMark_DT.Semester = ddlSemester.SelectedValue;
                    t_TheoryMark_DT.CreatedBy = Session["LoginID"].ToString();
                    t_TheoryMark_DT.TheoryMark = txtMark.Text;
                    t_TheoryMark_DT.TotalMark = txtTotal.Text;
                    t_TheoryMark_DT.ExaminerID = ddlExaminer.SelectedValue;
                    t_TheoryMark_DT.SubjectType = ddlSubject.SelectedValue;

                    CBCSAdmissionFormBLL m_AdmissionFormBLL = new CBCSAdmissionFormBLL();

                    System.Data.DataTable result = null;
                    string UID = "";

                    result = m_AdmissionFormBLL.InsertLateralMark(t_TheoryMark_DT, AFields);

                    if (result != null && result.Rows.Count > 0)
                    {
                        if (result.Rows[0]["Result"].ToString() == "1")
                        {
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('Marks updated sucessfully');", true);
                        }
                    }
                }
                catch (Exception ex) {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", "alert('" + ex.Message.ToString() + "');", true);
                }
            }
        }
    }
    
}