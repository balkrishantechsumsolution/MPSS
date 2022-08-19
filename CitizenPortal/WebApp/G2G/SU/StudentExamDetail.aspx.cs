using CitizenPortalLib;
using CitizenPortalLib.BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.G2G.SU
{
    public partial class StudentExamDetail : CommonBasePage
    {
        CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
        string m_RollNo, m_Semester, m_ExamYear;

        protected void btnHome_Click(object sender, EventArgs e)
        {
            try
            {
                string url = Session["HomePage"].ToString();
                Response.Redirect(url);
            }
            catch (Exception ex)
            {

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["RollNo"] == null) return;
            if (Request.QueryString["Semester"] == null) return;
            if (Request.QueryString["ExamYear"] == null) return;

            m_RollNo = Request.QueryString["RollNo"].ToString();
            m_Semester = Request.QueryString["Semester"].ToString();
            m_ExamYear = Request.QueryString["ExamYear"].ToString();
            DataSet dt = t_CBCSAdmissionFormBLL.GetStudentExamDetail(m_RollNo, m_Semester, m_ExamYear);
            DataTable StudentDT = dt.Tables[0];
            DataTable ExamDataTB = dt.Tables[1];
            DataTable ResultDataTB = dt.Tables[2];
            DataTable FinalResultTB = dt.Tables[3];

            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {
                //try
                //{
                ProfilePhoto.Src = StudentDT.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSignature.Src = StudentDT.Rows[0]["ImageSign"].ToString();

                FullName.Text = StudentDT.Rows[0]["Name"].ToString();               

                lblBrnachName.Text = StudentDT.Rows[0]["CourseName"].ToString();
                lblProgram.Text = StudentDT.Rows[0]["ProgramName"].ToString();
                
                gender.Text = StudentDT.Rows[0]["Gender"].ToString();

                EmailID.Text = StudentDT.Rows[0]["email"].ToString();
                MobileNo.Text = StudentDT.Rows[0]["Mobile"].ToString();               
                Category.Text = StudentDT.Rows[0]["Category"].ToString();                
                lblCollege.Text = StudentDT.Rows[0]["CollegeName"].ToString();

                lblRegistrationNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                lblRoll.Text = StudentDT.Rows[0]["RollNo"].ToString();                
                lblRegNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                lblRegd.Text = StudentDT.Rows[0]["RegNo"].ToString();
                
                

                if (ExamDataTB != null && ExamDataTB.Rows.Count > 0)
                {
                    lblAdmissionYear.Text = StudentDT.Rows[0]["AdmissionYear"].ToString();
                    lblSession.Text = StudentDT.Rows[0]["CurrentSemester"].ToString();

                    GridViewSubject.DataSource = ExamDataTB;
                    GridViewSubject.DataBind();
                }

                if (ResultDataTB != null && ResultDataTB.Rows.Count > 0)
                {
                    //lblAdmissionYear.Text = StudentDT.Rows[0]["AdmissionYear"].ToString();
                    //lblSession.Text = StudentDT.Rows[0]["CurrentSemester"].ToString();
                    lblExamYear.Text = ResultDataTB.Rows[0]["Exam Year"].ToString();
                    lblExamType.Text = ResultDataTB.Rows[0]["Exam Type"].ToString();
                    grdResult.DataSource = ResultDataTB;
                    grdResult.DataBind();
                }

                if (FinalResultTB != null && FinalResultTB.Rows.Count > 0)
                {
                    lblPercentage.Text = FinalResultTB.Rows[0]["Percentage"].ToString();
                    lblDivision.Text = FinalResultTB.Rows[0]["Division"].ToString();
                    lblExamSemester.Text = FinalResultTB.Rows[0]["ExamSemester"].ToString();
                    lblResult.Text = FinalResultTB.Rows[0]["Result"].ToString();
                }
            }

            try
            {

                QRCode.GenerateQRCodePayment(m_Semester, m_RollNo);

            }
            catch (Exception ex) { }
        }

        public void AdmissionSubjectList(DataTable dt)
        {
            try
            {
                //Building an HTML string.
                StringBuilder html = new StringBuilder();

                //Table start.
                html.Append("<table class='table-bordered' cellspacing='0' style='width:100%; border:1;'>");

                //Building the Header row.
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<th style='padding:5px;'>");
                    html.Append(column.ColumnName);
                    html.Append("</th>");
                }
                html.Append("</tr>");

                //Building the Data rows.
                foreach (DataRow row in dt.Rows)
                {
                    html.Append("<tr>");
                    foreach (DataColumn column in dt.Columns)
                    {
                        html.Append("<td style='padding:5px;border:1;aligen:center;'>");
                        html.Append(row[column.ColumnName]);
                        html.Append("</td>");
                    }
                    html.Append("</tr>");
                }

                //Table end.
                html.Append("</table>");

                //Append the HTML string to Placeholder.
                //PLHSubjectList.Controls.Add(new Literal { Text = html.ToString() });
            }
            catch (Exception ex)
            {

            }
        }

        protected void grdResult_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Attributes.Add("style", "display:none");
                e.Row.Cells[1].Attributes.Add("style", "display:none");
                e.Row.Cells[2].Attributes.Add("style", "display:none");
                e.Row.Cells[14].Attributes.Add("style", "display:none");
            }
        }

        protected void grdPayment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;

                i = e.Row.Cells.Count - 1;
                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "ViewPayment_" + e.Row.RowIndex;
                t_Anchor.InnerHtml = "View";
                t_Anchor.Attributes.Add("onclick", "ViewReceipt('" + e.Row.Cells[1].Text + "', '" + e.Row.Cells[2].Text + "','" + e.Row.Cells[i].Text + "')");
                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "Receipt");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                i++;

                t_Anchor = null;
            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {                
                e.Row.Cells[1].Attributes.Add("style", "display:none");
            }
        }

        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                HtmlAnchor t_Anchor = null;
                if (e.Row.Cells[2].Text == "Attached") {
                i = e.Row.Cells.Count - 1;
                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "ViewDoc_" + e.Row.RowIndex;
                t_Anchor.InnerHtml = "View";
                t_Anchor.Attributes.Add("onclick", "ViewDoc('" + m_RollNo + "', '" + m_Semester + "','" + e.Row.Cells[3].Text + "')");
                t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                e.Row.Cells[i].Controls.Add(t_Anchor);
                e.Row.Cells[i].Attributes.Add("Title", "View");
                e.Row.Cells[i].Style.Add(HtmlTextWriterStyle.Cursor, "Pointer");
                i++;
                }
                t_Anchor = null;
            }
        }
    }
}