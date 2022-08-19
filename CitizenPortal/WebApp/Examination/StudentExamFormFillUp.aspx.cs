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
    public partial class StudentExamFormFillUp : CommonBasePage
    {
        //CBCSAdmissionFormBLL t_CBCSAdmissionFormBLL = new CBCSAdmissionFormBLL();
        ExamFormBLL t_ExamFormBLL = new ExamFormBLL();
        string m_RollNo, m_Semester, m_ExamYear, m_KeyField, m_ServiceID;

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
            if (Request.QueryString["KeyField"] == null) return;
            m_KeyField = Request.QueryString["KeyField"].ToString();
            //m_ServiceID = Request.QueryString["SvcID"].ToString();
            if (Request.QueryString["KeyField"].ToString() != null)
            {
                //m_RollNo = Request.QueryString["RollNo"].ToString();
                m_Semester = Request.QueryString["Semester"].ToString();
                m_ExamYear = Request.QueryString["ExamYear"].ToString();
            }


            DataSet dt = t_ExamFormBLL.GetStudentSemesterExamDetail(m_RollNo, m_ExamYear, m_KeyField, m_Semester);
            DataTable StudentDT = dt.Tables[0];
            DataTable SubjectTB = dt.Tables[1];
            DataTable SubjectBackTB = dt.Tables[2];
            DataTable SubjectAggTB = dt.Tables[3];
            DataTable PaymentTB = dt.Tables[4];


            if (!IsPostBack && StudentDT != null && StudentDT.Rows.Count > 0)
            {
                //try
                //{
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
                lblExamYear.Text = StudentDT.Rows[0]["ExamYear"].ToString();
                lblCurrentSemester.Text = StudentDT.Rows[0]["CurrentSemester"].ToString();




                if (SubjectTB != null && SubjectTB.Rows.Count > 0)
                {
                    PrintRegular.Visible = true;
                    GridViewSubject.DataSource = SubjectTB;
                    GridViewSubject.DataBind();

                    lblRegularCount.Text = SubjectTB.Rows.Count.ToString();
                    lblRegularSelected.Text = SubjectTB.Rows.Count.ToString();
                    lblRegularAmount.Text = PaymentTB.Rows[0]["Total"].ToString();
                    hdfRegularAmt.Value = PaymentTB.Rows[0]["Total"].ToString();

                }
                else { PrintRegular.Visible = false;                    
                    lblRegularAmount.Text = "0";
                    lblRegularSelected.Text = "0";
                }

                if (SubjectBackTB != null && SubjectBackTB.Rows.Count > 0)
                {
                    PrintBacklog.Visible = true;
                    grdBacklog.DataSource = SubjectBackTB;
                    grdBacklog.DataBind();
                    lblBacklogCount.Text = SubjectBackTB.Rows.Count.ToString();

                    DataView view = new DataView();                    
                    view.Table = SubjectBackTB;
                    view.RowFilter = "ToAppear = 'Y'";               
                    
                    lblBacklogSelected.Text = view.ToTable().Rows.Count.ToString();
                }
                else { PrintBacklog.Visible = false; lblBacklogSelected.Text = "0"; }
                if (SubjectAggTB != null && SubjectAggTB.Rows.Count > 0)
                {
                    PrintAggregate.Visible = true;
                    grdAgg.DataSource = SubjectAggTB;
                    grdAgg.DataBind();

                    lblAggregateCount.Text = SubjectAggTB.Rows.Count.ToString();
                    
                    DataView view = new DataView();                    
                    view.Table = SubjectAggTB;
                    view.RowFilter = "ToAppear = 'Y'";

                    lblAggregateSelected.Text = view.ToTable().Rows.Count.ToString();

                }
                else { PrintAggregate.Visible = false; lblAggregateSelected.Text = "0"; }

                if (PaymentTB != null && PaymentTB.Rows.Count > 0)
                {
                    grdPayment.DataSource = PaymentTB;
                    grdPayment.DataBind();
                    
                    lblTotalAmount.Text = Convert.ToString(Convert.ToDecimal(PaymentTB.Rows[0]["Total"].ToString()));
                    btnSubmit.Text = "Payable Amount Rs. " + Convert.ToString(Convert.ToDecimal(PaymentTB.Rows[0]["Total"].ToString()));
                    DataView view = new DataView();
                    view.Table = PaymentTB;
                    
                    //Backlog Amount
                    if (lblBacklogSelected.Text != "0")
                    {

                        //view.RowFilter = "' and "+ lblBacklogSelected.Text + "' between MinSubjectCount and MaxSubjectCount'";
                        //view.RowFilter = " MinSubjectCount >= " + Convert.ToInt32(lblBacklogSelected.Text) + " and MaxSubjectCount <= " + Convert.ToInt32(lblBacklogSelected.Text);
                        //DataTable dt2 = PaymentTB.Select().Where(p => (p["Exam Type"].ToString() == "Backlog") && (p["MinSubjectCount"] != null) && (Convert.ToInt32(p["MinSubjectCount"]) >= Convert.ToInt32(lblBacklogSelected.Text)) && (Convert.ToInt32(p["MaxSubjectCount"]) >= Convert.ToInt32(lblBacklogSelected.Text))).CopyToDataTable();


                        //DataTable dt2 = PaymentTB.Select().Where(p => (p["Exam Type"].ToString() == "Backlog") && (p["MinSubjectCount"].ToString() != "") && (Convert.ToInt32(p["MinSubjectCount"]) >= Convert.ToInt32(lblBacklogSelected.Text)) && (Convert.ToInt32(p["MaxSubjectCount"]) >= Convert.ToInt32(lblBacklogSelected.Text))).CopyToDataTable();

                        //Working one
                        //DataTable dt2 = PaymentTB.Select().Where(p => (p["Exam Type"].ToString() == "Backlog") && (p["MinSubjectCount"].ToString() != "") && (Convert.ToInt32(p["MaxSubjectCount"]) <= Convert.ToInt32(lblBacklogSelected.Text))).CopyToDataTable();


                        DataTable dt2 = PaymentTB.Select().Where(p => (p["Exam Type"].ToString() == "Backlog") && (p["MinSubjectCount"].ToString() != "") && Convert.ToInt32(lblBacklogSelected.Text) >= Convert.ToInt32(p["MinSubjectCount"]) && Convert.ToInt32(lblBacklogSelected.Text) <= Convert.ToInt32(p["MaxSubjectCount"])).CopyToDataTable();

                        //view.RowFilter = "[Exam Type] = 'Backlog' and SubjectCount <= " + Convert.ToInt32(lblBacklogSelected.Text);
                        //view.RowFilter = "[Exam Type] = 'Backlog' and " + Convert.ToInt32(lblBacklogSelected.Text) + " between  MinSubjectCount and MaxSubjectCount";
                        if (dt2 != null && dt2.Rows.Count > 0)
                        {
                            lblBacklogAmount.Text = dt2.Rows[0]["Total"].ToString();
                        }
                    }
                    else
                    {
                        lblBacklogAmount.Text = "00.00";
                    }

                    //Aggregate Fail Amount
                    if (lblAggregateSelected.Text != "0")
                    {
                        view.RowFilter = "SubjectCount <= '" + lblAggregateSelected.Text + "'";
                        if (view.Count > 0)
                        {
                            lblAggregateAmount.Text = view[0]["Total"].ToString();
                        }
                    }
                    else
                    {
                        lblAggregateAmount.Text = "00.00";
                    }

                    

                }

                lblTotalCount.Text = Convert.ToString(SubjectTB.Rows.Count + SubjectBackTB.Rows.Count + SubjectAggTB.Rows.Count);
                lblSelectTotal.Text = Convert.ToString(Convert.ToInt16(lblRegularSelected.Text) + Convert.ToInt16(lblBacklogSelected.Text) + Convert.ToInt16(lblAggregateSelected.Text));

                lblTotalAmount.Text = Convert.ToString(Convert.ToDecimal(lblRegularAmount.Text) + Convert.ToDecimal(lblBacklogAmount.Text) + Convert.ToDecimal(lblAggregateAmount.Text));

                btnSubmit.Text = "Payable Amount Rs. " + Convert.ToString(Convert.ToDecimal(lblRegularAmount.Text) + Convert.ToDecimal(lblBacklogAmount.Text) + Convert.ToDecimal(lblAggregateAmount.Text)); ;


            }

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

        protected void grdBacklog_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int i = 0;
                
                CheckBox chk = (CheckBox)e.Row.FindControl("chkBacklog");
                Label lblToAppear = (Label)e.Row.FindControl("lblToAppear");
                

                if (lblToAppear.Text == "Y")
                {
                    chk.Checked = true;
                }

            }

            if (e.Row.RowType == DataControlRowType.DataRow
            || e.Row.RowType == DataControlRowType.Header
            || e.Row.RowType == DataControlRowType.Footer)
            {
                
            }
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
                string Service = m_ServiceID;
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

                t_DOB = Convert.ToDateTime(lblDOB.Text.Trim()).ToString("yyyy-MM-dd");
                t_MobileNo = MobileNo.Text.Trim();
                t_EmailID = EmailID.Text.Trim();

                RollNo = lblRoll.Text;
                EnrollmentNo = lblRegNo.Text;

                DataTable dt = new DataTable();
                
                StringBuilder sb = new StringBuilder();

                foreach (GridViewRow item in GridViewSubject.Rows)
                {
                    CheckBox chk = new CheckBox();
                    chk = (CheckBox)item.FindControl("chkRegular") as CheckBox;
                    //chk = (CheckBox)((item.Controls[2]).Controls[1]);

                    if (!chk.Checked)
                        continue;

                    AppID = ((HiddenField)item.FindControl("HdfAppID") as HiddenField).Value;

                    Semester = ((Label)item.FindControl("lblSemester") as Label).Text;
                    ExamYear = ((Label)item.FindControl("lblExamYear") as Label).Text;
                    ExamType = ((Label)item.FindControl("lblExamType") as Label).Text;
                    SubjectCode = ((Label)item.FindControl("lblSubjectCode") as Label).Text;
                    SubjectType = ((Label)item.FindControl("lblSubjectType") as Label).Text;

                }

                 foreach (GridViewRow item in grdBacklog.Rows)
                {
                    CheckBox chk = new CheckBox();
                    chk = (CheckBox)item.FindControl("chkBacklog") as CheckBox;
                    //chk = (CheckBox)((item.Controls[2]).Controls[1]);

                    if (!chk.Checked)
                        continue;

                    AppID = ((HiddenField)item.FindControl("HdfAppID") as HiddenField).Value;

                    Semester = ((Label)item.FindControl("lblSemester") as Label).Text;
                    ExamYear = ((Label)item.FindControl("lblExamYear") as Label).Text;
                    ExamType = ((Label)item.FindControl("lblExamType") as Label).Text;
                    SubjectCode = ((Label)item.FindControl("lblSubjectCode") as Label).Text;
                    SubjectType = ((Label)item.FindControl("lblSubjectType") as Label).Text;


                    //foreach (GridViewRow pay in grdPayment.Rows)
                    //{
                        
                    //}
                    //    if (checkcount <= 3)
                    //{
                    //    ExamFees = 173;
                    //    ExamFormFees = 50;
                    //}
                    //else { ExamFees = 353;
                    //    ExamFormFees = 100; }

                    
                    //LateFees = 0;
                    //MarkSheetFees = 50;
                    //StudentWelfareFees = 0;

                    //TotalFees = ExamFees + ExamFormFees + LateFees + MarkSheetFees + StudentWelfareFees;

                    sb.AppendLine("<BatchData>");
                    sb.AppendLine("<Data>");
                    sb.AppendLine("<SvcID>" + Service + "</SvcID>");
                    sb.AppendLine("<AppID>" + AppID + "</AppID>");
                    sb.AppendLine("<RollNo>" + RollNo + "</RollNo>");
                    sb.AppendLine("<EnrollmentNo>" + EnrollmentNo + "</EnrollmentNo>");
                    sb.AppendLine("<Semester>" + Semester + "</Semester>");
                    sb.AppendLine("<ExamYear>" + ExamYear + "</ExamYear>");
                    sb.AppendLine("<ExamType>" + ExamType + "</ExamType>");
                    sb.AppendLine("<SubjectCode>" + SubjectCode + "</SubjectCode>");
                    sb.AppendLine("<SubjectType>" + SubjectType + "</SubjectType>");
                    sb.AppendLine("<ExamFees>" + ExamFees + "</ExamFees>");
                    sb.AppendLine("<LateFees>" + LateFees + "</LateFees>");
                    sb.AppendLine("<MarkSheetFees>" + MarkSheetFees + "</MarkSheetFees>");
                    sb.AppendLine("<StudentWelfareFees>" + StudentWelfareFees + "</StudentWelfareFees>");
                    sb.AppendLine("<ExamFormFees>" + ExamFormFees + "</ExamFormFees>");
                    sb.AppendLine("<TotalFees>" + TotalFees + "</TotalFees>"); 
                    sb.AppendLine("<SubjectCount>" + checkcount + "</SubjectCount>");
                    sb.AppendLine("<RowID>" + AppID + "</RowID>");

                    sb.AppendLine("</Data>");
                    sb.AppendLine("</BatchData>");
                    checkcount++;

                }

                foreach (GridViewRow item in grdAgg.Rows)
                {
                    CheckBox chk = new CheckBox();
                    chk = (CheckBox)item.FindControl("chkAgg") as CheckBox;
                    //chk = (CheckBox)((item.Controls[2]).Controls[1]);

                    if (!chk.Checked)
                        continue;

                    AppID = ((HiddenField)item.FindControl("HdfAppID") as HiddenField).Value;

                    Semester = ((Label)item.FindControl("lblSemester") as Label).Text;
                    ExamYear = ((Label)item.FindControl("lblExamYear") as Label).Text;
                    ExamType = ((Label)item.FindControl("lblExamType") as Label).Text;
                    SubjectCode = ((Label)item.FindControl("lblSubjectCode") as Label).Text;
                    SubjectType = ((Label)item.FindControl("lblSubjectType") as Label).Text;


                    //foreach (GridViewRow pay in grdPayment.Rows)
                    //{

                    //}
                    //    if (checkcount <= 3)
                    //{
                    //    ExamFees = 173;
                    //    ExamFormFees = 50;
                    //}
                    //else { ExamFees = 353;
                    //    ExamFormFees = 100; }


                    //LateFees = 0;
                    //MarkSheetFees = 50;
                    //StudentWelfareFees = 0;

                    //TotalFees = ExamFees + ExamFormFees + LateFees + MarkSheetFees + StudentWelfareFees;

                    sb.AppendLine("<BatchData>");
                    sb.AppendLine("<Data>");
                    sb.AppendLine("<SvcID>" + Service + "</SvcID>");
                    sb.AppendLine("<AppID>" + AppID + "</AppID>");
                    sb.AppendLine("<RollNo>" + RollNo + "</RollNo>");
                    sb.AppendLine("<EnrollmentNo>" + EnrollmentNo + "</EnrollmentNo>");
                    sb.AppendLine("<Semester>" + Semester + "</Semester>");
                    sb.AppendLine("<ExamYear>" + ExamYear + "</ExamYear>");
                    sb.AppendLine("<ExamType>" + ExamType + "</ExamType>");
                    sb.AppendLine("<SubjectCode>" + SubjectCode + "</SubjectCode>");
                    sb.AppendLine("<SubjectType>" + SubjectType + "</SubjectType>");
                    sb.AppendLine("<ExamFees>" + ExamFees + "</ExamFees>");
                    sb.AppendLine("<LateFees>" + LateFees + "</LateFees>");
                    sb.AppendLine("<MarkSheetFees>" + MarkSheetFees + "</MarkSheetFees>");
                    sb.AppendLine("<StudentWelfareFees>" + StudentWelfareFees + "</StudentWelfareFees>");
                    sb.AppendLine("<ExamFormFees>" + ExamFormFees + "</ExamFormFees>");
                    sb.AppendLine("<TotalFees>" + TotalFees + "</TotalFees>");
                    sb.AppendLine("<SubjectCount>" + checkcount + "</SubjectCount>");
                    sb.AppendLine("<RowID>" + AppID + "</RowID>");

                    sb.AppendLine("</Data>");
                    sb.AppendLine("</BatchData>");
                    checkcount++;

                }

                //if (sb.Length > 0 && checkcount > 0)
                {

                    dt = t_ExamFormBLL.GenerateBatchSemesterPay(sb.ToString(), Service, Convert.ToString(Session["LoginID"]), RollNo, ExamType, Semester, ExamYear, PayableAmount,t_MobileNo,t_EmailID, t_DOB);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        if (dt.Rows[0]["Result"].ToString() == "1")
                        {
                            Response.Redirect("/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + dt.Rows[0]["ServiceID"].ToString() + "&AppID=" + dt.Rows[0]["AppID"].ToString() + "&PayFlag=N");

                            Response.Redirect("/WebApp/Kiosk/Forms/Acknowledgement.aspx?SvcID=" + dt.Rows[0]["ServiceID"].ToString() + "&AppID=" + dt.Rows[0]["AppID"].ToString());
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