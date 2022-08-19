using CitizenPortalLib;
using CitizenPortalLib.BLL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Examination
{
    public partial class AddSemesterData : CommonBasePage
    {
        //CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
        ExamFormBLL t_ExamFormBLL = new ExamFormBLL();
        string m_RollNo, m_Semester, m_ExamYear, m_ProfileID, m_ServiceID;

        protected void btnHome_Click(object sender, EventArgs e)
        {
            try
            {
                string url = Session["HomePage"].ToString();
                //Response.Redirect(url);
            }
            catch (Exception ex)
            {

            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginID"] == null) {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Time Out!','Idea Time out!');", true);
                return;
            }
            if (!IsPostBack) { divSearch.Visible = false; }
            
        }
        protected void grdPayment_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int i = 0;
            i = e.Row.Cells.Count - 1;
            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[i - 1].Attributes.Add("style", "display:none");
                e.Row.Cells[i].Attributes.Add("style", "display:none");
                e.Row.Cells[4].Attributes.Add("style", "display:none");
            }
        }

        private void GetRTRRVSemester()
        {
            DataTable dt = new DataTable();
            dt = t_ExamFormBLL.GetRTRRVSemester(m_RollNo, lblRegNo.Text);
            if (dt != null && dt.Rows.Count > 0)
            {
                ddlSemester.DataSource = dt;
                ddlSemester.DataTextField = "Semester";
                ddlSemester.DataValueField = "Semester";
                ddlSemester.DataBind();
                ddlSemester.Items.Insert(0, new ListItem("Select", "0"));

            }
        }
        
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GetStudentDetail();
            
        }

        private void GetStudentDetail()
        {
            DataSet dt = t_ExamFormBLL.GetStudentExamData(ddlSemester.SelectedValue,ddlSession.SelectedValue,ddlExamType.SelectedValue, txtRollNo.Text.Trim(), txtEnrollment.Text.Trim(), ddlSchema.SelectedValue, Session["LoginID"].ToString());
            DataTable StudentDT = dt.Tables[0];
            DataTable SubjectTB = dt.Tables[1];
            DataTable PaymentTB = dt.Tables[2];
            DataTable DateTB = dt.Tables[3];

            if (PaymentTB != null && PaymentTB.Rows.Count > 0)
            {
                if (PaymentTB.Rows[0]["PayFlag"].ToString() == "Y")
                {
                    Response.Redirect(PaymentTB.Rows[0]["AckURL"].ToString());
                }

                if (PaymentTB.Rows[0]["TotalAmount"].ToString() != "")
                {
                    lblTotalAmount.Text = Convert.ToString(Convert.ToDecimal(PaymentTB.Rows[0]["TotalAmount"].ToString()));
                    btnSubmit.Text = "Payable Amount Rs. " + Convert.ToString(Convert.ToDecimal(PaymentTB.Rows[0]["TotalAmount"].ToString()));
                }
                //DataView view = new DataView();
                //view.Table = PaymentTB;
            }
            else
            {
                if (DateTB != null && DateTB.Rows.Count > 0)
                {
                    lblTotalAmount.Text = Convert.ToString(Convert.ToDecimal(DateTB.Rows[0]["Total"].ToString()));
                    btnSubmit.Text = "Payable Amount Rs. " + Convert.ToString(Convert.ToDecimal(DateTB.Rows[0]["Total"].ToString()));
                }
            }

            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {

                try
                {
                    divSearch.Visible = true;
                    lblAppType.Text = ddlSemester.SelectedValue + " " + ddlSession.SelectedValue + " ("+ ddlExamType.SelectedValue +")";
                    ProfilePhoto.Src = StudentDT.Rows[0]["Photograph"].ToString();
                    ProfileSignature.Src = StudentDT.Rows[0]["Signature"].ToString();

                    FullName.Text = StudentDT.Rows[0]["Name"].ToString();

                    lblBrnachName.Text = StudentDT.Rows[0]["CourseName"].ToString();
                    lblProgram.Text = StudentDT.Rows[0]["ProgramName"].ToString();

                    gender.Text = StudentDT.Rows[0]["Gender"].ToString();

                    EmailID.Text = StudentDT.Rows[0]["email"].ToString();
                    MobileNo.Text = StudentDT.Rows[0]["Mobile"].ToString();
                    Category.Text = StudentDT.Rows[0]["Category"].ToString();
                    lblCollege.Text = StudentDT.Rows[0]["CollegeName"].ToString();

                    lblRegNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                    lblRoll.Text = StudentDT.Rows[0]["RollNo"].ToString();
                    lblRegNo.Text = StudentDT.Rows[0]["RegNo"].ToString();

                    if (StudentDT.Rows[0]["DOB"].ToString() != "")
                    {
                        lblDOB.Text = StudentDT.Rows[0]["DOB"].ToString();
                        lblDOB.Enabled = false;
                    }


                    lblAdmissionYear.Text = StudentDT.Rows[0]["AdmissionYear"].ToString();
                    lblSession.Text = StudentDT.Rows[0]["Session"].ToString();

                    
                    if (SubjectTB != null && SubjectTB.Rows.Count > 0)
                    {
                        grdSubject.DataSource = SubjectTB;
                        grdSubject.DataBind();
                        lblSubjectCount.Text = SubjectTB.Rows.Count.ToString();
                        
                        DataView view = new DataView();
                        view.Table = SubjectTB;
                        view.RowFilter = "ToAppear = 'Y'";

                        lblSubjectSelected.Text = view.ToTable().Rows.Count.ToString();

                        divSearch.Visible = true;
                    }
                    else
                    {
                        divSearch.Visible = true;
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Subject Check!','Subject detail of " + lblRoll.Text + " does not exist for selected filter!');", true);
                        return;
                    }

                    if (DateTB.Rows.Count == 0)
                    {
                        divSearch.Visible = true;
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Form Fillup Date!','Either Form Fill-up date is closed or not yet anounced!');", true);
                        divSearch.Visible = false;
                        return;
                    }

                    if (DateTB != null && DateTB.Rows.Count > 0)
                    {
                        //lblTotalAmount.Text = "356.00";
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Record Not Found!','Please select & enter the correct information!');", true);
                        return;

                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alertPopup('Exception!','" + ex.Message + "');", true);
                    return;
                }


            }
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

        int cnt = 0; 
        protected void grdSubject_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                
                CheckBox chk = (CheckBox)e.Row.FindControl("chkSubject");               

                Label lblToAppear = (Label)e.Row.FindControl("lblToAppear");
               
                if (lblToAppear.Text == "Y")
                {
                    chk.Checked = true;
                    cnt = cnt + 1;
                }

                if (ddlExamType.SelectedValue == "Regular")
                {
                    chk.Checked = true;
                }

            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                
            }
                        
            lblSubjectCount.Text = Convert.ToString(cnt);
           

            //btnSubmit.Text = "Payable Amount Rs. " + Convert.ToString(Convert.ToInt16(lblTotalAmount.Text));
        }

        protected void GenrateBatch_Click(object sender, EventArgs e)
        {
            if (MobileNo.Text == "" ) {
                MobileNo.Focus();
                Response.Write("<script>alert('Please enter Mobile No.!')</script>");
                return;
            }

            if (EmailID.Text == "")
            {
                EmailID.Focus();
                Response.Write("<script>alert('Please enter Email ID.!')</script>");
                return;
            }

            if (lblDOB.Text == "")
            {
                lblDOB.Focus();
                Response.Write("<script>alert('Please select Date of Birth.!')</script>");
                return;
            }

            if (chkDeclaration.Checked == false)
            {
                chkDeclaration.Focus();
                Response.Write("<script>alert('Please select declaration.!')</script>");
                return;
            }


            try
            {
                int checkcount = 0;
                string Service = "";
                string AppID = "";
                string RollNo = "";
                string EnrollmentNo = "";
                string Semester = "";
                string ExamYear = "";
                string ExamType = "";
                string SubjectCode = "";
                string SubjectType = "";
                string t_DOB = "";
                string t_MobileNo = "";
                string t_EmailID = "";
                decimal ExamFees = 0;
                decimal LateFees = 0;
                decimal MarkSheetFees = 0;
                decimal StudentWelfareFees = 0;
                decimal ExamFormFees = 0;
                decimal TotalFees = 0;
                string PayableAmount = "";
                string AppType = "";

                t_DOB = Convert.ToDateTime(lblDOB.Text.Trim()).ToString("yyyy-MM-dd");
                t_MobileNo = MobileNo.Text.Trim();
                t_EmailID = EmailID.Text.Trim();

                RollNo = lblRoll.Text;
                EnrollmentNo = lblRegNo.Text;

                DataTable dt = new DataTable();
                
                StringBuilder sb = new StringBuilder();

                foreach (GridViewRow item in grdSubject.Rows)
                {
                    CheckBox chk = new CheckBox();
                    CheckBox chkRT = new CheckBox();
                    CheckBox chkRV = new CheckBox();

                    chk = (CheckBox)item.FindControl("chkSubject") as CheckBox;

                    if (!chk.Checked)
                        continue;

                    AppID = ((HiddenField)item.FindControl("HdfAppID") as HiddenField).Value;

                    Semester = ((Label)item.FindControl("lblSemester") as Label).Text;
                    ExamYear = ((Label)item.FindControl("lblExamYear") as Label).Text;
                    ExamType = ((Label)item.FindControl("lblExamType") as Label).Text;
                    SubjectCode = ((Label)item.FindControl("lblSubjectCode") as Label).Text;
                    SubjectType = ((Label)item.FindControl("lblSubjectType") as Label).Text;
                    
                    sb.AppendLine("<BatchData>");
                    sb.AppendLine("<Data>");
                    sb.AppendLine("<SvcID>" + Service + "</SvcID>");
                    sb.AppendLine("<AppID>" + AppID + "</AppID>");
                    sb.AppendLine("<RollNo>" + RollNo + "</RollNo>");
                    sb.AppendLine("<EnrollmentNo>" + EnrollmentNo + "</EnrollmentNo>");
                    sb.AppendLine("<Semester>" + Semester + "</Semester>");
                    sb.AppendLine("<ExamYear>" + ddlSession.SelectedValue + "</ExamYear>");
                    sb.AppendLine("<ExamType>" + ddlExamType.SelectedValue + "</ExamType>");
                    sb.AppendLine("<SubjectCode>" + SubjectCode + "</SubjectCode>");
                    sb.AppendLine("<SubjectType>" + SubjectType + "</SubjectType>");
                    sb.AppendLine("<ExamFees>" + ExamFees + "</ExamFees>");
                    sb.AppendLine("<LateFees>" + LateFees + "</LateFees>");
                    sb.AppendLine("<MarkSheetFees>" + MarkSheetFees + "</MarkSheetFees>");
                    sb.AppendLine("<StudentWelfareFees>" + StudentWelfareFees + "</StudentWelfareFees>");
                    sb.AppendLine("<ExamFormFees>" + ExamFormFees + "</ExamFormFees>");
                    sb.AppendLine("<TotalFees>" + lblTotalAmount.Text + "</TotalFees>"); 
                    sb.AppendLine("<SubjectCount>" + checkcount + "</SubjectCount>");
                    sb.AppendLine("<RowID>" + AppID + "</RowID>");
                    sb.AppendLine("</Data>");
                    sb.AppendLine("</BatchData>");
                    checkcount++;

                }

                if (sb.Length == 0 && checkcount == 0)
                {
                    string m_Message = "Please select Subject by check the checkbox!";
                    //Response.Write("<script>alert('Please try later \n.error log--" + m_Message + "----')</script>");
                    Response.Write("<script>alert('" + m_Message + "')</script>");
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", m_Message, true);
                    return;
                }

                //if (sb.Length > 0 && checkcount > 0)
                {

                    dt = t_ExamFormBLL.GenerateStudentExamData(sb.ToString(), Service, Convert.ToString(Session["LoginID"]), RollNo, ddlExamType.SelectedValue, Semester, ddlSession.SelectedValue, PayableAmount,t_MobileNo,t_EmailID, t_DOB, AppType);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["Result"].ToString() == "1" && dt.Rows[0]["PayFlag"].ToString() == "N")
                        {
                            Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + dt.Rows[0]["ServiceID"].ToString() + "&AppID=" + dt.Rows[0]["AppID"].ToString() + "&PayFlag=N");

                            //Response.Redirect("/WebApp/Kiosk/Forms/Acknowledgement.aspx?SvcID=" + dt.Rows[0]["ServiceID"].ToString() + "&AppID=" + dt.Rows[0]["AppID"].ToString());
                        }
                        else if (dt.Rows[0]["PayFlag"].ToString() == "Y")
                        {
                            Response.Redirect("/WebApp/Kiosk/Forms/Acknowledgement.aspx?SvcID=" + dt.Rows[0]["ServiceID"].ToString() + "&AppID=" + dt.Rows[0]["AppID"].ToString() + "&PayFlag=Y");                            
                        }
                        else
                        {
                            Response.Write("<script>alert('Selected Application batch already generated please check with Batch NO. " + dt.Rows[0]["BatchID"].ToString() + " !.')</script>");
                        }
                    }
                    else {
                        Response.Write("<script>alert('Something went wrong! Please contact support desk!')</script>");
                    }
                }
                //else
                //{
                //    //please select atleast one rows..
                //    Response.Write("<script>alert('Please select atleast one rows.!')</script>");
                //}
            }
            catch (Exception ex)
            {
                string m_Message = ex.Message.Replace("\\", "").Replace("\\r\\n", "").Replace(Environment.NewLine, "").Replace("'", "").Replace("\"", "");
                //Response.Write("<script>alert('Please try later \n.error log--" + m_Message + "----')</script>");
                Response.Write("<script>alert('" + m_Message + "')</script>");
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Message", m_Message, true);
            }

        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public static string CalculateExamFees(string RollNo, string ExamType, string SubjectCount)
        {
            string ExamFees;

            ExamFormBLL t_ExamFormBLL = new ExamFormBLL();
            System.Data.DataSet dtAppList = t_ExamFormBLL.CalculateExamFees(RollNo, ExamType, SubjectCount);

            ExamFees = JsonConvert.SerializeObject(dtAppList, Newtonsoft.Json.Formatting.Indented);
            return ExamFees;
        }
    }
}