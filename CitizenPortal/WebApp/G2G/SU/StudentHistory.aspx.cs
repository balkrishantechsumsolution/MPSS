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
    public partial class StudentHistory : CommonBasePage
    {
        CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
        string m_AppID, m_ServiceID;

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
            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();
            DataSet dt = t_CBCSAdmissionFormBLL.GetStudentHistoryData(m_ServiceID, m_AppID);
            DataTable StudentDT = dt.Tables[0];
            DataTable LastCourseDT = dt.Tables[1];
            DataTable SubjectListDT = dt.Tables[2];
            DataTable DOBDT = dt.Tables[3];
            DataTable TB_Payment = dt.Tables[5];
            DataTable TB_Paper = dt.Tables[6];

            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {
                //try
                //{
                    ProfilePhoto.Src = StudentDT.Rows[0]["ApplicantImageStr"].ToString();
                    ProfileSignature.Src = StudentDT.Rows[0]["ImageSign"].ToString();
                
                    FullName.Text = StudentDT.Rows[0]["Name"].ToString();
                    DateTime date = Convert.ToDateTime(StudentDT.Rows[0]["DOB"]);
                    DOBConverted.Text = date.ToString("dd-MM-yyyy");
                    DateTime AsOndate = Convert.ToDateTime(StudentDT.Rows[0]["CreatedOn"]);
                
                    lblBrnachName.Text = StudentDT.Rows[0]["CourseName"].ToString();
                lblProgram.Text = StudentDT.Rows[0]["ProgramName"].ToString();

                AgeYear.Text = DOBDT.Rows[0]["Years"].ToString() + " years";//Years.ToString();
                    AgeMonth.Text = DOBDT.Rows[0]["Months"].ToString() + " months";//Months.ToString();
                    AgeDay.Text = DOBDT.Rows[0]["Days"].ToString() + " days";//Days.ToString();
                lblAgeAsOn.Text = StudentDT.Rows[0]["AgeAsOn"].ToString();
                gender.Text = StudentDT.Rows[0]["Gender"].ToString();

                    EmailID.Text = StudentDT.Rows[0]["email"].ToString();
                    MobileNo.Text = StudentDT.Rows[0]["Mobile"].ToString();
                    
                    lblFather.Text = StudentDT.Rows[0]["Father"].ToString();
                    lblMother.Text = StudentDT.Rows[0]["Mother"].ToString();
                    Category.Text = StudentDT.Rows[0]["Category"].ToString();
                                                        
                    lblCareTakerCollege.Text = StudentDT.Rows[0]["CareTakerCollege"].ToString();
                    lblCollege.Text = StudentDT.Rows[0]["CollegeName"].ToString();

                    lblRegistrationNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                    lblRoll.Text = StudentDT.Rows[0]["RollNo"].ToString();
                    lblAadhaar.Text = StudentDT.Rows[0]["EnrollmentNo"].ToString();
                    lblRegNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                    lblRegd.Text = StudentDT.Rows[0]["RegNo"].ToString();
                lblAdmissionYear.Text = StudentDT.Rows[0]["AdmissionYear"].ToString();
                lblSession.Text = StudentDT.Rows[0]["CurrentSemester"].ToString();

                //}
                //catch (Exception ex)
                //{

                //}

                if (LastCourseDT != null && LastCourseDT.Rows.Count > 0)
                {
                    GridViewCourse.DataSource = LastCourseDT;
                    GridViewCourse.DataBind();
                }

                if (SubjectListDT != null && SubjectListDT.Rows.Count > 0)
                {
                    lblBrnachName.Text = SubjectListDT.Rows[0]["Course"].ToString();

                    GridViewSubject.DataSource = SubjectListDT;
                    GridViewSubject.DataBind();
                }

                if (TB_Payment != null && TB_Payment.Rows.Count > 0)
                {
                    grdPayment.DataSource = TB_Payment;
                    grdPayment.DataBind();
                }
                else { divPayment.Visible = false; }

                if (TB_Paper != null && TB_Paper.Rows.Count > 0)
                {
                    grdPaper.DataSource = TB_Paper;
                    grdPaper.DataBind();
                    divExam.Visible = true;
                }
                else
                { divExam.Visible = false; }

                //display document list
                DataTable dtDocument = dt.Tables[4];
                DataTable dtDoc = new DataTable();
                dtDoc.Columns.AddRange(new DataColumn[4] { new DataColumn("Sr No", typeof(int)),
                            new DataColumn("Document Name", typeof(string)),
                            new DataColumn("Status",typeof(string)),
                            new DataColumn("View",typeof(string))
                });
                string t_Status = "";
                for (int i = 0; i < dtDocument.Rows.Count; i++)
                {
                    if (dtDocument.Rows[i]["IsUploaded"].ToString() == "1")
                        t_Status = "Attached";
                    else
                        t_Status = "Not Attached";

                    dtDoc.Rows.Add(i + 1, dtDocument.Rows[i]["DocDesc"].ToString(), t_Status, dtDocument.Rows[i]["Path"].ToString());
                }

                grdView.DataSource = dtDoc;
                grdView.DataBind();
            }

            try
            {

                QRCode.GenerateQRCodePayment(m_ServiceID, m_AppID);

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
                t_Anchor.Attributes.Add("onclick", "ViewDoc('" + m_AppID + "', '" + m_ServiceID + "','" + e.Row.Cells[3].Text + "')");
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