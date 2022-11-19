using CitizenPortal.WebApp.Common.QRCode;
using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Result
{
    public partial class PrintTranscript : AdminBasePage
    {
        StudentResultBLL t_ObjBLL = new StudentResultBLL();
        public DataTable dtGlobal;
        private StudentResultBLL obj = new StudentResultBLL();
        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string word = ConvertNumbertoWords(Convert.ToInt32(infigure.Text));
                CollegeList();
                BranchList();
            }
        }

        protected void ddlBranch_SelectedIndexChanged(object sender, EventArgs e)
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

        private void GetSemester()
        {
            DataTable dt = new DataTable();
            dt = m_FacultyModuleBLL.GetSemesterCSVTU(ddlBranch.SelectedValue, ddlProgram.SelectedValue);
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlSemester.DataSource = dt;
                ddlSemester.DataTextField = "Semester";
                ddlSemester.DataValueField = "Semester";
                ddlSemester.DataBind();
                ddlSemester.Items.Insert(0, new ListItem("Select", "0"));

            }
        }

        public void ProgramList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = m_FacultyModuleBLL.GetProgramCSVTU(ddlBranch.SelectedValue);
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

        public void CollegeList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = t_ObjBLL.GetCollegeCSVTU();
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                Loadgrid();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "');", true);
            }
        }

        public void BranchList()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = t_ObjBLL.GetCourseCSVTU();
                if (dt != null && dt.Rows.Count > 0)
                {
                    ddlBranch.DataSource = dt;
                    ddlBranch.DataTextField = "CourseName";
                    ddlBranch.DataValueField = "CourseCode";
                    ddlBranch.DataBind();
                    ddlBranch.Items.Insert(0, new ListItem("Select", ""));
                }
            }
            catch (Exception ex)
            {

            }
        }
        public void Loadgrid()
        {
            DataSet ds = new DataSet();
            string m_CollegeCode = "", m_ExamType = "", m_ExamYear = "", m_Semester = "", m_Range = "", m_RollNo = "", m_coursecode = "", nextset = "", m_program = ""; ;
            if (ddlBranch.SelectedValue != "0")
            {
                m_coursecode = ddlBranch.SelectedItem.Value;
            }
            if (ddlProgram.SelectedValue != "0")
            {
                m_program = ddlProgram.SelectedItem.Value;
            }
            if (ddlCollege.SelectedValue != "0")
            {
                m_CollegeCode = ddlCollege.SelectedItem.Value;
            }
            if (ddlExamType.SelectedValue != "0")
            {
                m_ExamType = ddlExamType.SelectedItem.Text;
            }
            if (ddlSession.SelectedValue != "0")
            {
                m_ExamYear = ddlSession.SelectedItem.Text;
            }
            if (ddlSemester.SelectedValue != "0")
            {
                m_Semester = ddlSemester.SelectedItem.Value;
            }
            if (TxtRollNo.Text != "")
            {
                m_RollNo = TxtRollNo.Text;
            }

            string m_PrintFlag = "N";

            ds = obj.GetAttendentSheetDetails(m_coursecode, m_CollegeCode, m_Semester, m_ExamType, m_ExamYear, m_Range, m_RollNo, nextset, m_program);

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdAttendanceSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdAttendanceSheet.DataBind();
            }
        }
        public void PrintGrid()
        {
            DataSet ds = new DataSet();
            string m_CollegeCode = "", m_ExamType = "", m_ExamYear = "", m_Semester = "", m_Range = "", m_RollNo = "", m_coursecode = "", nextset = "";
            if (ddlBranch.SelectedValue != "0")
            {
                m_coursecode = ddlBranch.SelectedItem.Value;
            }

            if (ddlCollege.SelectedValue != "0")
            {
                m_CollegeCode = ddlCollege.SelectedItem.Value;
            }
            if (ddlExamType.SelectedValue != "0")
            {
                m_ExamType = ddlExamType.SelectedItem.Text;
            }
            if (ddlSession.SelectedValue != "0")
            {
                m_ExamYear = ddlSession.SelectedItem.Text;
            }
            if (ddlSemester.SelectedValue != "0")
            {
                m_Semester = ddlSemester.SelectedItem.Value;
            }
            if (TxtRollNo.Text != "")
            {
                m_RollNo = TxtRollNo.Text;
            }
            string m_PrintFlag = "N";
            ds = obj.GetTranscriptData(m_RollNo, m_Semester, m_ExamType, m_ExamYear);

            if (ds.Tables[0].Rows.Count > 0)
            {
                grdAttendanceSheet.DataSource = ds.Tables[0];
                dtGlobal = ds.Tables[0];
                grdAttendanceSheet.DataBind();
            }           
        }

        protected void grdAttendanceSheet_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
             e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.DataItem != null)
                {
              //      System.Web.UI.HtmlControls.HtmlImage img = (System.Web.UI.HtmlControls.HtmlImage)e.Item.FindControl("ProfilePhoto");
                 //   img.Src = "https://csvtu.digivarsity.online/StudentImages/StudentPhoto/" + dtGlobal.Rows[e.Item.ItemIndex]["photograph"].ToString();

                    string t_RollNo = dtGlobal.Rows[e.Item.ItemIndex]["RollNo"].ToString();
                }
            }
            /**/
            DataRowView drv = e.Item.DataItem as DataRowView;
            GridView innerDataList = e.Item.FindControl("GrdRslt") as GridView;
            DataSet t_DS = new DataSet();
            DataSet t_DS1 = new DataSet();
            DataSet t_DS2 = new DataSet();
            DataSet t_DS3 = new DataSet();
            DataSet t_DS4 = new DataSet();
            t_DS = obj.GetResultDataTranscript(dtGlobal.Rows[e.Item.ItemIndex]["RollNo"].ToString(), ddlSemester.SelectedItem.Value, ddlExamType.SelectedItem.Value, ddlSession.SelectedItem.Value);
            if (t_DS.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow rw in t_DS.Tables[0].Rows)
                {
                    innerDataList.DataSource = t_DS.Tables[0];
                    innerDataList.DataBind();
                }
            }
            if (e.Item.ItemType == ListItemType.Item ||
             e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.DataItem != null)
                {
                    t_DS1 = obj.GetAggregareDetetails(dtGlobal.Rows[e.Item.ItemIndex]["RollNo"].ToString(), ddlSemester.SelectedItem.Value, ddlSession.SelectedItem.Value, ddlExamType.SelectedValue.ToString());
                    t_DS3 = obj.GetQRCode(dtGlobal.Rows[e.Item.ItemIndex]["RollNo"].ToString(), ddlSemester.SelectedItem.Value, ddlExamType.SelectedValue.ToString(), ddlSession.SelectedItem.Value);
                    t_DS2 = obj.GetTotalBox(dtGlobal.Rows[e.Item.ItemIndex]["RollNo"].ToString());
                    t_DS4 = obj.GetTotalSemestersObtSP_Transcript(dtGlobal.Rows[e.Item.ItemIndex]["RollNo"].ToString(), ddlSemester.SelectedItem.Value);
                    if (t_DS1.Tables[0].Rows.Count > 0)
                    {
                        Label lblCPI = (e.Item.FindControl("lblCPI") as Label);
                        Label Figurelbl = (e.Item.FindControl("infig") as Label);
                        Label lblResult = (e.Item.FindControl("lblResult") as Label);
                        Label totalobt = (e.Item.FindControl("totalobt") as Label);
                        Label total = (e.Item.FindControl("total") as Label);
                        Label SPI = (e.Item.FindControl("lblSpi") as Label);
                        Label totmkswords = (e.Item.FindControl("totmks") as Label);
                        Label CreditPointtotal = (e.Item.FindControl("totCredits") as Label);
                        Label datetd = (e.Item.FindControl("datetoday") as Label);
                        Panel Cumubox = (e.Item.FindControl("PnlCumuBox") as Panel);

                        lblCPI.Text = t_DS1.Tables[0].Rows[0]["CPI"].ToString();
                        totalobt.Text = t_DS1.Tables[0].Rows[0]["TotalObt"].ToString();
                        total.Text = t_DS1.Tables[0].Rows[0]["total"].ToString();
                        SPI.Text = t_DS1.Tables[0].Rows[0]["SPI"].ToString();
                        lblResult.Text = t_DS1.Tables[0].Rows[0]["Result"].ToString();
                        Figurelbl.Text = t_DS1.Tables[0].Rows[0]["TotalObt"].ToString();
                        CreditPointtotal.Text = t_DS1.Tables[0].Rows[0]["CreditPoint"].ToString();
                        string word = ConvertNumbertoWords(Convert.ToInt32(Figurelbl.Text));
                        totmkswords.Text = word;
                        datetd.Text = DateTime.UtcNow.ToString("MM-dd-yyyy");
                        if(ddlSemester.SelectedValue == "8 SEMESTER")
                        {
                            Cumubox.Visible = false;
                        }
                        else
                        {
                            Cumubox.Visible = true;
                        }
                    }

                    if (t_DS2.Tables[0].Rows.Count > 0)
                    {
                        Panel paneltotal = (Panel)e.Item.FindControl("pnltotal");
                        Panel panelDivision = (Panel)e.Item.FindControl("pnlDivision");
                        Panel Cumubox = (e.Item.FindControl("PnlCumuBox") as Panel);
                        if (ddlSemester.SelectedValue.ToString() == "8 SEMESTER")
                        {
                            paneltotal.Visible = true;
                            panelDivision.Visible = true;
                            Cumubox.Visible = false;
                        }
                        else
                        {
                            paneltotal.Visible = false;
                            panelDivision.Visible = false;
                            Cumubox.Visible = true;
                        }
                        Label lblobt1 = (e.Item.FindControl("obt1") as Label);
                        Label lblobt2 = (e.Item.FindControl("obt2") as Label);
                        Label lblobt3 = (e.Item.FindControl("obt3") as Label);
                        Label lblobt4 = (e.Item.FindControl("obt4") as Label);
                        Label lblobt5 = (e.Item.FindControl("obt5") as Label);
                        Label lblobt6 = (e.Item.FindControl("obt6") as Label);
                        Label lblobt7 = (e.Item.FindControl("obt7") as Label);
                        Label totalobtofsems = (e.Item.FindControl("totalofallsem") as Label);

                        Label lbltot1 = (e.Item.FindControl("tot1") as Label);
                        Label lbltot2 = (e.Item.FindControl("tot2") as Label);
                        Label lbltot3 = (e.Item.FindControl("tot3") as Label);
                        Label lbltot4 = (e.Item.FindControl("tot4") as Label);
                        Label lbltot5 = (e.Item.FindControl("tot5") as Label);
                        Label lbltot6 = (e.Item.FindControl("tot6") as Label);
                        Label lbltot7 = (e.Item.FindControl("tot7") as Label);
                        Label totalsumofsems = (e.Item.FindControl("totalsumofsem") as Label);
                        Label LblDivision = (e.Item.FindControl("LblDivision") as Label);

                        lblobt1.Text = t_DS2.Tables[0].Rows[0]["obt1"].ToString();
                        lblobt2.Text = t_DS2.Tables[0].Rows[0]["obt2"].ToString();
                        lblobt3.Text = t_DS2.Tables[0].Rows[0]["obt3"].ToString();
                        lblobt4.Text = t_DS2.Tables[0].Rows[0]["obt4"].ToString();
                        lblobt5.Text = t_DS2.Tables[0].Rows[0]["obt5"].ToString();
                        lblobt6.Text = t_DS2.Tables[0].Rows[0]["obt6"].ToString();
                        lblobt7.Text = t_DS2.Tables[0].Rows[0]["obt7"].ToString();
                        totalobtofsems.Text = t_DS2.Tables[0].Rows[0]["totalobt"].ToString();

                        lbltot1.Text = t_DS2.Tables[0].Rows[0]["tot1"].ToString();
                        lbltot2.Text = t_DS2.Tables[0].Rows[0]["tot2"].ToString();
                        lbltot3.Text = t_DS2.Tables[0].Rows[0]["tot3"].ToString();
                        lbltot4.Text = t_DS2.Tables[0].Rows[0]["tot4"].ToString();
                        lbltot5.Text = t_DS2.Tables[0].Rows[0]["tot5"].ToString();
                        lbltot6.Text = t_DS2.Tables[0].Rows[0]["tot6"].ToString();
                        lbltot7.Text = t_DS2.Tables[0].Rows[0]["tot7"].ToString();
                        totalsumofsems.Text = t_DS2.Tables[0].Rows[0]["totalmks"].ToString();
                        string divi = t_DS2.Tables[0].Rows[0]["Division"].ToString();
                        if (divi == "")
                        {
                            LblDivision.Text = "";
                        }
                        else
                        {
                            LblDivision.Text = t_DS2.Tables[0].Rows[0]["Division"].ToString();

                        }
                    }

                    if (t_DS3.Tables[0].Rows.Count > 0)
                    {
                        string enrollme = t_DS3.Tables[0].Rows[0]["EnrollmentNo"].ToString();
                        string rollno = t_DS3.Tables[0].Rows[0]["RollNo"].ToString();
                        string namecand = t_DS3.Tables[0].Rows[0]["name"].ToString();
                        string semes = t_DS3.Tables[0].Rows[0]["name"].ToString();
                        string fath = t_DS3.Tables[0].Rows[0]["name"].ToString();
                        string colgname = t_DS3.Tables[0].Rows[0]["name"].ToString();
                        string rslt = t_DS3.Tables[0].Rows[0]["name"].ToString();
                        string noexm = t_DS3.Tables[0].Rows[0]["programname"].ToString();
                        string totmks = t_DS3.Tables[0].Rows[0]["total"].ToString();
                        string Obtmks = t_DS3.Tables[0].Rows[0]["totalObt"].ToString();
                        string date = t_DS3.Tables[0].Rows[0]["ResultDate"].ToString();
                    }

                    if (t_DS4.Tables[0].Rows.Count > 0)
                    {
                        Label maximummks = (e.Item.FindControl("maxmks") as Label);
                        Label Obtainedmks = (e.Item.FindControl("obtmks") as Label);
                        Label cumudiv = (e.Item.FindControl("cumudivision") as Label);

                        maximummks.Text = t_DS4.Tables[0].Rows[0]["Process_Maximum_Marks"].ToString();
                        Obtainedmks.Text = t_DS4.Tables[0].Rows[0]["Process_Normalized_Marks"].ToString();
                        cumudiv.Text = t_DS4.Tables[0].Rows[0]["Division"].ToString();
                    }
                }
            }
        }

        public static string ConvertNumbertoWords(int number)

        {
            if (number == 0)
                return "ZERO";
            if (number < 0)
                return "minus " + ConvertNumbertoWords(Math.Abs(number));
            string words = "";
            if ((number / 1000000) > 0)
            {
                words += ConvertNumbertoWords(number / 1000000) + " MILLION ";
                number %= 1000000;
            }
            if ((number / 1000) > 0)
            {
                words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
                number %= 1000;
            }
            if ((number / 100) > 0)
            {
                words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
                number %= 100;
            }
            if (number > 0)
            {
                if (words != "")
                    words += "";
                var unitsMap = new[] { "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN" };
                var tensMap = new[] { "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY" };

                if (number < 20)
                    words += unitsMap[number];
                else
                {
                    words += tensMap[number / 10];
                    if ((number % 10) > 0)
                        words += " " + unitsMap[number % 10];
                }
            }
            return words;
        }
    }
}