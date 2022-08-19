using CitizenPortalLib.BLL;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.BackExam
{
    public partial class EditSubject : System.Web.UI.Page//AdminBasePage
    {
        private string m_AppID, m_ServiceID, m_Semester;

        private AdmitCardBLL t_AdmitCardBLL = new AdmitCardBLL();
        private DataTable StudentDT = null;
        private DataTable SubjectListDT = null;
        private DataTable TrnsDT = null;
        private DataTable SubjectDT = null;
        private DataTable SubjectCount = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["UserID"] == null) return;

            m_AppID = Request.QueryString["UserID"].ToString();

            DataSet dt = null;
            dt = t_AdmitCardBLL.EditSubjectDetail(m_ServiceID, m_AppID, m_Semester);
            StudentDT = dt.Tables[0];
            SubjectListDT = dt.Tables[1];
            TrnsDT = dt.Tables[2];
            SubjectDT = dt.Tables[3];
            SubjectCount = dt.Tables[4];

            if (StudentDT != null && StudentDT.Rows.Count > 0)
            {
                //try
                //{
                ProfilePhoto.Src = StudentDT.Rows[0]["ApplicantImageStr"].ToString();
                ProfileSignature.Src = StudentDT.Rows[0]["ImageSign"].ToString();
                m_AppID = StudentDT.Rows[0]["appid"].ToString();
                lblCanddidateName.Text = StudentDT.Rows[0]["Name"].ToString();
                DateTime date = Convert.ToDateTime(StudentDT.Rows[0]["DOB"]);
                DOBConverted.Text = date.ToString("dd-MM-yyyy");
                DateTime AsOndate = Convert.ToDateTime(StudentDT.Rows[0]["CreatedOn"]);

                lblGender.Text = StudentDT.Rows[0]["Gender"].ToString();

                lblAdmissionNo.Text = StudentDT.Rows[0]["AdmissionNo"].ToString();
                lblDOA.Text = StudentDT.Rows[0]["AdmissionDate"].ToString();
                lblCollegeName.Text = StudentDT.Rows[0]["CollegeName"].ToString();
                FatherName.Text = StudentDT.Rows[0]["Father"].ToString();
                lblBrnachName.Text = StudentDT.Rows[0]["Branch"].ToString();
                lblRollNo.Text = StudentDT.Rows[0]["RollNo"].ToString();
                lblRegistrationNo.Text = StudentDT.Rows[0]["RegNo"].ToString();
                lblExamType.Text = StudentDT.Rows[0]["ExamType"].ToString();
                lblVenue.Text = StudentDT.Rows[0]["ExamCenter"].ToString();

                if (SubjectDT != null && SubjectDT.Rows.Count > 0)
                {
                    if (StudentDT.Rows[0]["BranchCode"].ToString() == "CH")
                    {
                        //if (SubjectCount.Rows[0]["SECBCount"].ToString() == "0")
                        //{
                        //    DataRow NewRow = SubjectDT.NewRow();
                        //    NewRow[0] = SubjectDT.Rows.Count + 1;
                        //    NewRow[1] = "CH000";
                        //    NewRow[2] = "SEC-B";
                        //    NewRow[3] = "SEC-B";
                        //    NewRow[4] = "";
                        //    NewRow[5] = "6";
                        //    SubjectDT.Rows.Add(NewRow);
                        //}
                        //else
                        {
                            DataRow NewRow = SubjectDT.NewRow();
                            NewRow[0] = SubjectDT.Rows.Count + 1;
                            NewRow[1] = SubjectDT.Rows[0]["SubjectCount"].ToString();
                            NewRow[2] = "SEC-B";
                            NewRow[3] = "SEC-B";
                            NewRow[4] = "";
                            NewRow[5] = "6";
                            SubjectDT.Rows.Add(NewRow);
                        }
                    }

                    GridViewSubject.DataSource = SubjectDT;
                    GridViewSubject.DataBind();
                }

                if (TrnsDT != null && TrnsDT.Rows.Count > 0)
                {
                    lblAppID.Text = TrnsDT.Rows[0]["AppID"].ToString();
                    AppDate.Text = TrnsDT.Rows[0]["TransDate"].ToString();
                    lblTrnsID.Text = TrnsDT.Rows[0]["TrnID"].ToString();
                    lblTrnsDate.Text = TrnsDT.Rows[0]["TransDate"].ToString();
                    lblAppFee.Text = TrnsDT.Rows[0]["Total"].ToString();
                    lblTotalFee.Text = TrnsDT.Rows[0]["AmtInText"].ToString();
                    tblTrans.Visible = true;
                }
                else { tblTrans.Visible = false; }
                //}
                //catch (Exception ex)
                //{
                //}

                GetStudentPaperDetails(lblRollNo.Text, "");

                try
                {
                    QRCode.GenerateQRCodeDetails(m_ServiceID, lblRollNo.Text);
                }
                catch { }
            }
        }

        protected void GridViewSubject_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            string RollNo = StudentDT.Rows[0]["RollNo"].ToString(); //lblRollNo.Text;
            string AppID = m_AppID;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int rowIndex = e.Row.RowIndex;

                if (StudentDT.Rows[0]["Semester"].ToString() == "2SEM")
                {
                    if (e.Row.Cells[2].Text == "AECC-II")
                    {
                        ShowDropwown(e);
                        btnSave.Visible = true;
                    }
                }
                else if (StudentDT.Rows[0]["Semester"].ToString() == "5SEM")
                {
                    if (StudentDT.Rows[0]["BranchCode"].ToString() == "AP")
                    {
                        if (e.Row.Cells[2].Text == "GE" || e.Row.Cells[2].Text == "SEC-C")
                        {
                            ShowDropwown(e);
                            btnSave.Visible = true;
                        }

                    }
                }
                else
                {
                    if (StudentDT.Rows[0]["BranchCode"].ToString() == "SH")
                    {
                        if (e.Row.Cells[2].Text == "SEC-B" || e.Row.Cells[3].Text == "GE-II")
                        {
                            //if (SubjectCount.Rows[0]["SECBCount"].ToString() == "1" || SubjectCount.Rows[0]["GECount"].ToString() == "1")
                            //{
                            ShowDropwown(e);
                            btnSave.Visible = true;
                            //}
                            //else { btnSave.Visible = false; }
                        }
                    }

                    if (StudentDT.Rows[0]["BranchCode"].ToString() == "AH")
                    {
                        if (e.Row.Cells[2].Text == "SEC-B")
                        {
                            //if (SubjectCount.Rows[0]["SECBCount"].ToString() == "1")
                            //{
                            ShowDropwown(e);
                            btnSave.Visible = true;
                            //}
                            //else { btnSave.Visible = false; }
                        }
                    }

                    if (StudentDT.Rows[0]["BranchCode"].ToString() == "CH")
                    {
                        if (e.Row.Cells[2].Text == "SEC-B")
                        {
                            //if (SubjectCount.Rows[0]["SECBCount"].ToString() == "")
                            //{
                            ShowDropwown(e);
                            btnSave.Visible = true;
                            //}
                            //else { btnSave.Visible = false; }
                        }
                    }
                }
            }

            if (e.Row.RowType == DataControlRowType.DataRow
                || e.Row.RowType == DataControlRowType.Header
                || e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[5].Attributes.Add("style", "display:none");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string SubjectName = "";
            string SubjectCode = "";
            DataTable DT = new DataTable();
            string RollNo = StudentDT.Rows[0]["RollNo"].ToString(); //lblRollNo.Text;
            string AppID = m_AppID;
            int Status = 0;
            int RowID = 0;

            foreach (GridViewRow item in GridViewSubject.Rows)
            {
                if (item != null)
                {
                    GridViewRow row = item as GridViewRow;
                    RowID = Convert.ToInt32(row.Cells[5].Text);
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
                            if (StudentDT.Rows[0]["BranchCode"].ToString() == "CH")
                            {
                                DT = t_AdmitCardBLL.InsertStudentSubject(RollNo, AppID, SubjectCode, SubjectName);
                            }
                            else
                            {
                                DT = t_AdmitCardBLL.InsertStudentSubject(RowID, RollNo, AppID, SubjectCode, SubjectName);
                            }

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
                GetStudentPaperDetails(RollNo, "");
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Thank You!!! \n Your Subject has been updated in system!!!')", true);
                ScriptManager.RegisterClientScriptBlock(this.Page, Page.GetType(), "text", "Func()", true);
            }
        }

        public void ShowDropwown(System.Web.UI.WebControls.GridViewRowEventArgs e)
        {
            string SubName = "";
            string SubType = "";
            string SubCode = "";
            string RollNo = "";
            DataTable DT = new DataTable();
            DropDownList m_DropDownList = new DropDownList();
            DT = null;
            m_DropDownList.ID = "ddlSubjectList";
            m_DropDownList.Attributes.Add("runat", "server");

            RollNo = StudentDT.Rows[0]["RollNo"].ToString();
            SubName = e.Row.Cells[3].Text;
            SubType = e.Row.Cells[2].Text;
            SubCode = e.Row.Cells[1].Text;

            m_DropDownList.Items.Clear();

            DT = t_AdmitCardBLL.GetStudentSubjectList(RollNo, m_AppID, SubType);

            if (DT.Rows.Count != 0)
            {
                m_DropDownList.Items.Clear();
                m_DropDownList.DataTextField = "SubjectName";
                m_DropDownList.DataValueField = "SubjectCode";
                m_DropDownList.DataSource = DT;
                m_DropDownList.DataBind();
                m_DropDownList.Items.Insert(0, new ListItem("-Select-", "0"));
                //m_DropDownList.Items.FindByText(SubName).Selected = true;
                m_DropDownList.SelectedIndex = m_DropDownList.Items.IndexOf(m_DropDownList.Items.FindByValue(SubCode));
                e.Row.Cells[4].Controls.Add(m_DropDownList);
            }
        }

        private void GetStudentPaperDetails(string RollNo, string Semester)
        {
            DataTable DT_Paper = new DataTable();

            DT_Paper = t_AdmitCardBLL.GetStudentPaperDetails(RollNo, Semester);

            grdPaper.DataSource = DT_Paper;
            grdPaper.DataBind();
        }
    }
}