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
    public partial class SemesterResult : System.Web.UI.Page
    {
        double Totalmax, totalrslt, cp, psemmarks, gracemks;
        double Totalobt, gpcpt, crdgrad, crdgrd;
        StudentResultBLL t_ObjBLL = new StudentResultBLL();
        string semes = "", ET = "";
        string rollno = ""; string examsession = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session.Count == 1)
            {
                btnHome.Visible = false;
            }
            date.Text = DateTime.Now.ToShortDateString();
            GetResultData();
        }

        private void GetResultData()
        {
            try
            {
                ET = Request.QueryString["T"].ToString();
                rollno = Request.QueryString["R"].ToString();
                semes = Request.QueryString["S"].ToString();
                examsession = Request.QueryString["E"].ToString();

                Resultdetails();
                GetStudentDetails();
                OverallDetails();
                CalCPi();
                CGPADetails();
                //if (totfig.Text == "")
                //{
                //    divResult.Visible = false;
                //    //Page.RegisterClientScriptBlock("mymsg2", "<script language=javascript> alert('Result Withheld!'); </script> ");
                //    Response.Write("<script language='javascript'>window.alert('Result Withheld');window.location='" + Session["HomePage"].ToString() + "';</script>");
                //    ////ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "<script> alert('Result WithHeld');window.open('https://csvtu.digivarsity.online/WebApp/Result/SearchResult.aspx#!');</script>", true);
                //    return;
                //}
                //else
                //{
                //    string word = ConvertNumbertoWords(Convert.ToInt32(totfig.Text));
                //    mkstot.Text = word;
                //    divResult.Visible = true;
                //    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", " alertPopup('Invalid Request', 'Please provide valid details.');", true);

                //}


            }
            catch (Exception ex)
            {
                divResult.Visible = false;

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", " alertPopup('Exception!', '" + ex.Message + "');", true);
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            if (Session["HomePage"] != null || Session["HomePage"].ToString() != "")
            {
                Response.Redirect(Session["HomePage"].ToString());
            }

        }

        private void Resultdetails()
        {
            if (ET.ToUpper() == "BACKLOG" || ET.ToUpper() == "AGGBACKLOG")
            {
                //String strConnString = ConfigurationManager.ConnectionStrings["MasterDBlive1"].ConnectionString;
                //SqlConnection con = new SqlConnection(strConnString);
                //SqlCommand cmd = new SqlCommand();
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.CommandText = "[GetResultBacklogStudnts]";
                //cmd.Parameters.Add("@rollno", SqlDbType.VarChar).Value = Session["roll_no"].ToString();
                //cmd.Parameters.Add("@semester", SqlDbType.VarChar).Value = Session["sem"].ToString();
                //cmd.Parameters.Add("@ExamType", SqlDbType.VarChar).Value = Session["Examtype"].ToString();
                //cmd.Parameters.Add("@CollegeCode", SqlDbType.VarChar).Value = Session["CollegeCode"].ToString();
                //cmd.Parameters.Add("@CourseCode", SqlDbType.VarChar).Value = Session["CourseCode"].ToString();
                //cmd.Connection = con;
                //cmd.CommandTimeout = 0;
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ds = t_ObjBLL.Resultdetails(rollno, semes, ET, examsession);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    divResult.Visible = false;
                    GdUnReport.DataSource = null;
                    GdUnReport.DataBind();
                    divResult.Visible = false;
                    Response.Write("<script language='javascript'>window.alert('Result Data not Available');window.location='" + Session["HomePage"].ToString() + "';</script>");
                    return;
                    //Response.Write("<script language='javascript'>window.alert('Data not available');window.location='/Result/ResultLogin.aspx';</script>");
                }
                else if (ds.Tables[0].Rows.Count > 0 && ds.Tables.Count > 0)
                {
                    //con.Open();
                    //GridViewRow row1 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
                    //TableHeaderCell cell1 = new TableHeaderCell();
                    //cell1.Text = "";
                    //cell1.ColumnSpan = 3;
                    //row1.Controls.Add(cell1);
                    //cell1 = new TableHeaderCell();
                    //cell1.Text = "Examination";
                    //cell1.ColumnSpan = 6;
                    //row1.Controls.Add(cell1);
                    //cell1 = new TableHeaderCell();
                    //cell1.Text = "";
                    //cell1.ColumnSpan = 6;
                    //row1.Controls.Add(cell1);
                    //GdUnReport.DataSource = ds.Tables[0];
                    GdUnReport.DataSource = ds.Tables[0];
                    GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
                    TableHeaderCell cell = new TableHeaderCell();
                    cell.Text = "";
                    cell.ColumnSpan = 3;
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.ColumnSpan = 2;
                    cell.Text = "ESE";
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.ColumnSpan = 2;
                    cell.Text = "CT";
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.Text = "TA";
                    cell.ColumnSpan = 2;
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.ColumnSpan = 2;
                    cell.Text = "Total Marks";
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.ColumnSpan = 4;
                    cell.Text = "";
                    row.Controls.Add(cell);
                    GdUnReport.DataBind();
                    GdUnReport.HeaderRow.Parent.Controls.AddAt(0, row);
                }
                else
                {
                    divResult.Visible = false;
                    //Response.Write("<script language='javascript'>window.alert('Data not available');window.location='/Result/ResultLogin.aspx';</script>");
                }
            }
            else
            {
                //String strConnString = ConfigurationManager.ConnectionStrings["MasterDBlive1"].ConnectionString;
                //SqlConnection con = new SqlConnection(strConnString);
                //SqlCommand cmd = new SqlCommand();
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.CommandText = "[SPGetStudentResultEligible]";
                //cmd.Parameters.Add("@rollno", SqlDbType.VarChar).Value = Session["roll_no"].ToString();
                //cmd.Parameters.Add("@semester", SqlDbType.VarChar).Value = Session["sem"].ToString();
                //cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = Session["ExamType"].ToString();
                //cmd.Parameters.Add("@CollegeCode", SqlDbType.VarChar).Value = Session["CollegeCode"].ToString();
                //cmd.Parameters.Add("@CourseCode", SqlDbType.VarChar).Value = Session["CourseCode"].ToString();
                //cmd.Connection = con;
                //cmd.CommandTimeout = 0;
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ds = t_ObjBLL.Resultdetails(rollno, semes, ET, examsession);

                if (ds.Tables[0].Rows.Count == 0)
                {
                    GdUnReport.DataSource = null;
                    GdUnReport.DataBind();
                    divResult.Visible = false;
                    Response.Write("<script language='javascript'>window.alert('Result Data not Available');window.location='" + Session["HomePage"].ToString() + "';</script>");
                    return;
                }
                else if (ds.Tables[0].Rows.Count > 0 && ds.Tables.Count > 0)
                {
                    //con.Open();
                    GdUnReport.DataSource = ds.Tables[0];
                    GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
                    TableHeaderCell cell = new TableHeaderCell();
                    cell.Text = "";
                    cell.ColumnSpan = 3;
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.ColumnSpan = 2;
                    cell.Text = "ESE";
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.ColumnSpan = 2;
                    cell.Text = "CT";
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.Text = "TA";
                    cell.ColumnSpan = 2;
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.ColumnSpan = 2;
                    cell.Text = "Total Marks";
                    row.Controls.Add(cell);
                    cell = new TableHeaderCell();
                    cell.ColumnSpan = 4;
                    cell.Text = "";
                    row.Controls.Add(cell);
                    GdUnReport.DataBind();
                    GdUnReport.HeaderRow.Parent.Controls.AddAt(0, row);
                }
            }
        }

        //protected void GdUnReport_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    try
        //    {
        //        if (e.Row.RowType == DataControlRowType.DataRow)
        //        {

        //            if (e.Row.Cells[4].Text.Contains("0") && e.Row.Cells[4].Text.Length == 1)
        //                e.Row.Cells[4].Text = e.Row.Cells[4].Text.Replace("0", "ABS");
        //            if (e.Row.Cells[4].Text.Contains("*0"))
        //                e.Row.Cells[4].Text = e.Row.Cells[4].Text.Replace("*0", "");
        //            if (e.Row.Cells[4].Text.Contains("&nbsp;") && !e.Row.Cells[3].Text.Contains("&nbsp;"))
        //                e.Row.Cells[4].Text = e.Row.Cells[4].Text.Replace("&nbsp;", "ABS");
        //            if (e.Row.Cells[6].Text.Contains("AB") && e.Row.Cells[6].Text.Length == 2)
        //                e.Row.Cells[6].Text = e.Row.Cells[6].Text.Replace("AB", "0");
        //            if (e.Row.Cells[8].Text.Contains("AB") && e.Row.Cells[8].Text.Length == 2)
        //                e.Row.Cells[8].Text = e.Row.Cells[8].Text.Replace("AB", "0");
        //        }
        //        if (e.Row.RowType == DataControlRowType.DataRow)
        //        {
        //            try
        //            {
        //                try
        //                {
        //                    Totalmax = Totalmax + Convert.ToDouble(e.Row.Cells[9].Text);
        //                    // code on 4152022
        //                    Totalobt = Totalobt + Convert.ToDouble(e.Row.Cells[10].Text);
        //                    // code on 4152022
        //                    cp = cp + Convert.ToDouble(e.Row.Cells[13].Text);
        //                    totalrslt = totalrslt + Convert.ToDouble(e.Row.Cells[14].Text);
        //                    gpcpt = gpcpt + Convert.ToDouble(e.Row.Cells[15].Text);
        //                    psemmarks = psemmarks + Convert.ToDouble(e.Row.Cells[16].Text);
        //                    // code on 4152022
        //                    gracemks = gracemks + Convert.ToDouble(e.Row.Cells[18].Text);
        //                    // code on 4152022
        //                }
        //                catch { }
        //            }
        //            catch { }
        //        }
        //        if (e.Row.RowType == DataControlRowType.Footer)
        //        {
        //            e.Row.Style.Add("background", "#f1f1f1");
        //            e.Row.Cells[0].Text = "Total : ";
        //            e.Row.Cells[9].Text = Convert.ToDecimal(Totalmax).ToString("#,##0");
        //            e.Row.Cells[14].Text = Convert.ToDecimal(totalrslt).ToString("#,##0.00");
        //            e.Row.Cells[15].Text = Convert.ToDecimal(gpcpt).ToString("#,##0");
        //            e.Row.Cells[10].Text = Convert.ToDecimal(Totalobt).ToString("#,##0");
        //            double reslt = double.Parse(e.Row.Cells[14].Text);
        //            double total = double.Parse(e.Row.Cells[9].Text);
        //            // code on 4152022
        //            double obt = double.Parse(e.Row.Cells[10].Text);
        //            // code on 4152022
        //            double gptcpt = double.Parse(e.Row.Cells[15].Text);
        //            double Presemmks = psemmarks;
        //            if (Presemmks < 10)
        //            {
        //                divResult.Visible = false;
        //                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "<script> alert('Result WithHeld');window.open('"+ Session["HomePage"].ToString() + "');</script>", true);
        //                //Response.Write("<script language='javascript'>window.alert('Result WithHeld');</script>");
        //                //Response.Redirect("https://csvtu.digivarsity.online/WebApp/Result/SearchResult.aspx#!");
        //                return;
        //            }
        //            double crpall = (cp);
        //            txtcurrsemdividenr.Text = double.Parse(e.Row.Cells[15].Text).ToString();
        //            txtcurrsemdivis.Text = (cp).ToString();
        //            totfig.Text = Math.Round(obt, 2).ToString();
        //            mxmarks.Text = e.Row.Cells[9].Text;
        //            //code on 04152022
        //            Decimal Omk = decimal.Parse(e.Row.Cells[10].Text);
        //            Decimal Obtmk = decimal.Truncate(Omk);
        //            obtmarks.Text = Obtmk.ToString();
        //            double totalfiftper = (total * 50) / 100;
        //            if (gptcpt / crpall != 0)
        //            {
        //                spi.Text = System.Math.Round((gptcpt / crpall), 2).ToString();
        //                string Spival = spi.Text;
        //                if (Spival.Length == 1)
        //                {
        //                    spi.Text = spi.Text + ".00";
        //                }
        //                tocrearn.Text = crpall.ToString();
        //            }
        //            if (gracemks > 0)
        //            {
        //                Result.Text = "PASS BY GRACE";
        //            }
        //            if (reslt > 0 && gracemks == 0)
        //            {
        //                spi.Text = "-";
        //                Result.Text = "FAIL";
        //                // cpilbl.Visible = false;
        //                cpivalue.Visible = false;
        //            }
        //            else if (reslt == 0 && gracemks == 0)
        //            {
        //                Result.Text = "PASS";
        //                //cpilbl.Visible = true;
        //                cpivalue.Visible = true;
        //            }
        //            double div = (obt / total) * 100;
        //            DIvi.Visible = false;
        //            if ((div) >= 75 && (div) <= 100)
        //            {
        //                if (semes.ToString() == "8 SEMESTER")
        //                {
        //                    if (Result.Text == "FAIL")
        //                    {
        //                        //DIvi.Visible = true;
        //                       // lbDiv.Text = "-";
        //                    }
        //                    else
        //                    {
        //                      //  DIvi.Visible = true;
        //                      //  lbDiv.Text = "FIRST Honours";
        //                    }
        //                }
        //            }
        //            else if ((div) >= 60 && (div) <= 74.99)
        //            {
        //                if (semes.ToString() == "8 SEMESTER")
        //                {
        //                 //   DIvi.Visible = true;
        //                  //  lbDiv.Text = "FIRST";
        //                }
        //            }
        //            else if ((div) >= 50 && (div) <= 59.99)
        //            {
        //                if (semes.ToString() == "8 SEMESTER")
        //                {
        //                 //   DIvi.Visible = true;
        //                   // lbDiv.Text = "SECOND";
        //                }
        //            }
        //            else if ((div) < 49.99)
        //            {
        //                lbDiv.Text = "";
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //    }
        //}

        protected void GdUnReport_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (e.Row.Cells[4].Text.Contains("0") && e.Row.Cells[4].Text.Length == 1)
                    e.Row.Cells[4].Text = e.Row.Cells[4].Text.Replace("0", "ABS");
                if (e.Row.Cells[4].Text.Contains("*0"))
                    e.Row.Cells[4].Text = e.Row.Cells[4].Text.Replace("*0", "");
                if (e.Row.Cells[4].Text.Contains("&nbsp;") && !e.Row.Cells[3].Text.Contains("&nbsp;"))
                    e.Row.Cells[4].Text = e.Row.Cells[4].Text.Replace("&nbsp;", "ABS");
                if (e.Row.Cells[6].Text.Contains("AB") && e.Row.Cells[6].Text.Length == 2)
                    e.Row.Cells[6].Text = e.Row.Cells[6].Text.Replace("AB", "0");
                if (e.Row.Cells[8].Text.Contains("AB") && e.Row.Cells[8].Text.Length == 2)
                    e.Row.Cells[8].Text = e.Row.Cells[8].Text.Replace("AB", "0");
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    try
                    {
                        cp = cp + Convert.ToDouble(e.Row.Cells[13].Text);
                        double divdivsor = Convert.ToDouble(e.Row.Cells[13].Text) * Convert.ToDouble(e.Row.Cells[12].Text);
                        crdgrad = Convert.ToDouble(divdivsor);
                        crdgrd = crdgrd + divdivsor;
                    }
                    catch { }
                }
                catch { }
            }
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                txtcurrsemdivis.Text = (cp).ToString();
                txtcurrsemdividenr.Text = crdgrd.ToString();
            }
        }

        private void GetStudentDetails()
        {
            if (ET.ToUpper() == "BACKLOG" || ET.ToUpper() == "AGGBACKLOG")
            {
                //String strConnString = ConfigurationManager.ConnectionStrings["MasterDBlive1"].ConnectionString;
                //SqlConnection con = new SqlConnection(strConnString);
                //SqlCommand cmd = new SqlCommand();
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.CommandText = "GetStudentDetailsBacklog_SP";
                //cmd.Parameters.Add("@rollno", SqlDbType.VarChar).Value = Session["roll_no"].ToString();
                //cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = Session["ExamType"].ToString();
                //cmd.Connection = con;
                //cmd.CommandTimeout = 0;
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                //da.Fill(ds);

                ds = t_ObjBLL.ResultBacklogStudent(rollno, semes, ET, examsession);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    NOEx.Text = ds.Tables[0].Rows[0]["programname"].ToString();
                    NOI.Text = ds.Tables[0].Rows[0]["collegename"].ToString();
                    roll_no.Text = ds.Tables[0].Rows[0]["RollNo"].ToString();
                    Fname.Text = ds.Tables[0].Rows[0]["Father"].ToString();
                    enroll.Text = ds.Tables[0].Rows[0]["EnrollmentNo"].ToString();
                    NOC.Text = ds.Tables[0].Rows[0]["name"].ToString();
                    lblstat.Text = ds.Tables[0].Rows[0]["ExamType"].ToString();
                    sem.Text = ds.Tables[0].Rows[0]["Semester"].ToString();
                    ext.Text = ds.Tables[0].Rows[0]["Examyear"].ToString();
                    //Image1.ImageUrl = "/webApp/kiosk/Images/" + ds.Tables[0].Rows[0]["ApplicantImageStr"].ToString();
                    if (sem.Text == "1 SEMESTER")
                    {
                        sem.Text = "1 Semeter";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "2 SEMESTER")
                    {
                        sem.Text = "2 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "3 SEMESTER")
                    {
                        sem.Text = "3 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "4 SEMESTER")
                    {
                        sem.Text = "4 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "5 SEMESTER")
                    {
                        sem.Text = "5 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "6 SEMESTER")
                    {
                        sem.Text = "6 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "7 SEMESTER")
                    {
                        sem.Text = "7 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "8 SEMESTER")
                    {
                        sem.Text = "8 SEMESTER";
                        lbDiv.Visible = true;
                        DIvi.Visible = true;
                    }
                    else if (sem.Text == "9 SEMESTER")
                    {
                        sem.Text = "9 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    //sess.Text = ds.Tables[0].Rows[0]["Session"].ToString();
                }
                else
                {
                    divResult.Visible = false;
                    Response.Write("<script language='javascript'>window.alert('Data not Available');window.location='" + Session["HomePage"].ToString() + "';</script>");
                    return;
                    //Response.Write("<script language='javascript'>window.alert('Data not available');window.location='/Result/ResultLogin.aspx';</script>");
                }
            }
            else
            {
                //String strConnString = ConfigurationManager.ConnectionStrings["MasterDBlive1"].ConnectionString;
                //SqlConnection con = new SqlConnection(strConnString);
                //SqlCommand cmd = new SqlCommand();
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.CommandText = "GetStudentDetailsEligible_SP";
                //cmd.Parameters.Add("@rollno", SqlDbType.VarChar).Value = Session["roll_no"].ToString();
                //cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = Session["ExamType"].ToString();
                //cmd.Connection = con;
                //cmd.CommandTimeout = 0;
                //SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                //da.Fill(ds);

                ds = t_ObjBLL.ResultStudent(rollno, semes, ET, examsession);

                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    NOEx.Text = ds.Tables[0].Rows[0]["programname"].ToString();
                    NOI.Text = ds.Tables[0].Rows[0]["collegename"].ToString();
                    roll_no.Text = ds.Tables[0].Rows[0]["RollNo"].ToString();
                    Fname.Text = ds.Tables[0].Rows[0]["Father"].ToString();
                    enroll.Text = ds.Tables[0].Rows[0]["EnrollmentNo"].ToString();
                    NOC.Text = ds.Tables[0].Rows[0]["name"].ToString();
                    lblstat.Text = ds.Tables[0].Rows[0]["ExamType"].ToString();
                    sem.Text = ds.Tables[0].Rows[0]["Semester"].ToString();
                    ext.Text = ds.Tables[0].Rows[0]["Examyear"].ToString();
                    //Image1.ImageUrl = "/webApp/kiosk/Images/" + ds.Tables[0].Rows[0]["ApplicantImageStr"].ToString();
                    if (sem.Text == "1 SEMESTER")
                    {
                        sem.Text = "1 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "2 SEMESTER")
                    {
                        sem.Text = "2 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "3 SEMESTER")
                    {
                        sem.Text = "3 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "4 SEMESTER")
                    {
                        sem.Text = "4 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "5 SEMESTER")
                    {
                        sem.Text = "5 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "6 SEMESTER")
                    {
                        sem.Text = "6 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "7 SEMESTER")
                    {
                        sem.Text = "7 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    else if (sem.Text == "8 SEMESTER")
                    {
                        sem.Text = "8 SEMESTER";
                        lbDiv.Visible = true;
                        DIvi.Visible = true;
                    }
                    else if (sem.Text == "9 SEMESTER")
                    {
                        sem.Text = "9 SEMESTER";
                        lbDiv.Visible = false;
                        DIvi.Visible = false;
                    }
                    //sess.Text = ds.Tables[0].Rows[0]["Session"].ToString();
                }
                else
                {
                    divResult.Visible = false;
                    Response.Write("<script language='javascript'>window.alert('Data not Available');window.location='" + Session["HomePage"].ToString() + "';</script>");
                    //Response.Write("<script language='javascript'>window.alert('Data not available');window.location='/Result/ResultLogin.aspx';</script>");
                    return;
                }
            }
        }

        private void OverallDetails()
        {
            if (ET.ToUpper() == "BACKLOG" || ET.ToUpper() == "AGGBACKLOG")
            {
                DataSet ds = new DataSet();
                ds = t_ObjBLL.ResultPassFail(rollno, semes, ET, examsession);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    spi.Text = ds.Tables[0].Rows[0]["SGPA"].ToString();
                    Result.Text = ds.Tables[0].Rows[0]["LetterGrade"].ToString();
                    mxmarks.Text = ds.Tables[0].Rows[0]["Total"].ToString();
                    obtmarks.Text = ds.Tables[0].Rows[0]["Totalobt"].ToString();
                }
                else
                {
                    divResult.Visible = false;
                    Response.Write("<script language='javascript'>window.alert('Details not available Result WithHeld');window.location='" + Session["HomePage"].ToString() + "';</script>");
                    return;
                }
            }
            else
            {
                DataSet ds = new DataSet();
                ds = t_ObjBLL.ResultPassFail(rollno, semes, ET, examsession);
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    spi.Text = ds.Tables[0].Rows[0]["SGPA"].ToString();
                    Result.Text = ds.Tables[0].Rows[0]["LetterGrade"].ToString();
                    mxmarks.Text = ds.Tables[0].Rows[0]["Total"].ToString();
                    obtmarks.Text = ds.Tables[0].Rows[0]["Totalobt"].ToString();
                }
                else
                {
                    divResult.Visible = false;
                    Response.Write("<script language='javascript'>window.alert('Details not available Result WithHeld');window.location='" + Session["HomePage"].ToString() + "';</script>");
                    return;
                }
            }
        }

        private void CalCPi()
        {
            if (GdUnReport.DataSource == null)
            {
                return;
            }

            DataTable dt = t_ObjBLL.GetStudentCalCPi(rollno, semes, examsession);

            if (dt.Rows.Count > 0)
            {
                string div = dt.Rows[0]["divident"].ToString();
                string divis = dt.Rows[0]["divisor"].ToString();
                txtdivident.Text = div;
                txtdivisor.Text = divis;
                if (txtcurrsemdividenr.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "<script> alert('Result WithHeld');window.open('" + Session["HomePage"].ToString() + "');</script>", true);
                    return;
                }
                double alldivident = double.Parse(txtcurrsemdividenr.Text) + double.Parse(txtdivident.Text);
                double alldivisor = double.Parse(txtcurrsemdivis.Text) + double.Parse(txtdivisor.Text);
                if (Result.Text == "FAIL" || Result.Text == "Fail")
                {
                    cpivalue.Text = "";
                    return;
                }
                double cpi = alldivident / alldivisor;
                cpivalue.Text = System.Math.Round(cpi, 2).ToString();
            }
            else
            {
                divResult.Visible = false;
                Page.RegisterClientScriptBlock("mymsg2", "<script language=javascript> alert('Some Error'); </script> ");
                return;
            }
        }

        private void CGPADetails()
        {
            string Roll_no = roll_no.Text;
            string Semester = sem.Text;
            string ExamType = lblstat.Text;
            string examSess = ext.Text;
            string enrollno = enroll.Text;
            string CGPA = cpivalue.Text;
            DateTime datetime = DateTime.Now;
            string dtime = datetime.ToString();
            DataSet ds = new DataSet();
            string msg = "Record present already";
            ds = t_ObjBLL.CheckCGPAValue(Roll_no, Semester, ExamType, examSess, enrollno, CGPA);
            if (CGPA == "")
            {
                return;
            }
            else if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            {
                Page.Response.Write("<script>console.log('" + msg + "');</script>");
            }
            else
            {
                DataSet ds1 = new DataSet();
                ds = t_ObjBLL.SaveCgpaDetails(Roll_no, Semester, ExamType, examSess, enrollno, CGPA, dtime);
            }
        }

        protected void btnbk_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Result/ResultLogin.aspx");
            Session["roll_no"] = "";
        }

        //public static string ConvertNumbertoWords(int number)
        //{
        //    if (number == 0)
        //        return "ZERO";
        //    if (number < 0)
        //        return "minus " + ConvertNumbertoWords(Math.Abs(number));
        //    string words = "";
        //    if ((number / 1000000) > 0)
        //    {
        //        words += ConvertNumbertoWords(number / 1000000) + " MILLION ";
        //        number %= 1000000;
        //    }
        //    if ((number / 1000) > 0)
        //    {
        //        words += ConvertNumbertoWords(number / 1000) + " THOUSAND ";
        //        number %= 1000;
        //    }
        //    if ((number / 100) > 0)
        //    {
        //        words += ConvertNumbertoWords(number / 100) + " HUNDRED ";
        //        number %= 100;
        //    }
        //    if (number > 0)
        //    {
        //        if (words != "")
        //            words += "AND ";
        //        var unitsMap = new[] { "ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN", "FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN", "NINETEEN" };
        //        var tensMap = new[] { "ZERO", "TEN", "TWENTY", "THIRTY", "FORTY", "FIFTY", "SIXTY", "SEVENTY", "EIGHTY", "NINETY" };

        //        if (number < 20)
        //            words += unitsMap[number];
        //        else
        //        {
        //            words += tensMap[number / 10];
        //            if ((number % 10) > 0)
        //                words += " " + unitsMap[number % 10];
        //        }
        //    }
        //    return words;
        //}
    }
}