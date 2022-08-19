using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace CitizenPortal.WebApp.Kiosk.ITIPNTC
{
    public partial class PNTCMarkSheet : System.Web.UI.Page
    {
        DivisionalCertificateBLL m_DivisionalCertificateBLL = new DivisionalCertificateBLL();
        DuplicateSemesterMarksheettb2BLL m_DuplicateSemesterMarksheettb2BLL = new DuplicateSemesterMarksheettb2BLL();
        DuplicateSemesterMarksheetBLL m_DuplicateSemesterMarksheetBLL = new DuplicateSemesterMarksheetBLL();

        string m_AppID = "", m_ServiceID = "", RegNo = "";

        void Diplomasave(DataSet p_DS)
        {
            DocumentVerification.StudentDetailsWS m_DocumentVerification = new DocumentVerification.StudentDetailsWS();
            //DataSet t_DS = m_DocumentVerification.DuplicateDivisionalMarksheet("F1100101008", "201405");

            DataSet t_DS = p_DS;

            //DocumentVerification.StudentDetailsWS m_DocumentVerification = new DocumentVerification.StudentDetailsWS();

            //DataSet t_DS = m_DocumentVerification.DuplicateSemseterMarkSheet("L14141004009", "02", "201605");
            var Row = t_DS.Tables[0].Rows[0].ToString();

            if (t_DS.Tables[0].Rows[0]["status"].ToString() == "Wrong Input")
            {
                return;

            }
            else
            {

                string[] AFields = {

                "aadhaarNumber"
                , "ProfileID"
                ,"AppName"
                ,"PCode"
                , "SubjectName"
                , "SemFullMark"
                , "InternalFullMark"
                , "TotalPassMark"
                , "SecuredMark"
                ,"InternalSecured"
                ,"Total"
                ,"Result"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ModifiedOn"
                ,"ModifiedBy"
                ,"ClientIP"
                };
                NewDuplicateSemesterMarksheetTb2_DT objNewDuplicateSemesterMarksheetTb2_DT = new NewDuplicateSemesterMarksheetTb2_DT();


                DataRow[] table0 = new DataRow[t_DS.Tables[0].Rows.Count];
                for (int k = 0; k < table0.Length; k++)
                {
                    table0[k] = t_DS.Tables[0].Rows[k];
                }

                for (int i = 0; i < table0.Length; i++)
                {
                    objNewDuplicateSemesterMarksheetTb2_DT.aadhaarNumber = "";
                    objNewDuplicateSemesterMarksheetTb2_DT.ProfileID = "";
                    objNewDuplicateSemesterMarksheetTb2_DT.AppName = "";
                    objNewDuplicateSemesterMarksheetTb2_DT.PCode = table0[i].ItemArray[0].ToString();
                    objNewDuplicateSemesterMarksheetTb2_DT.SubjectName = table0[i].ItemArray[1].ToString();
                    objNewDuplicateSemesterMarksheetTb2_DT.SemFullMark = table0[i].ItemArray[2].ToString();
                    objNewDuplicateSemesterMarksheetTb2_DT.InternalFullMark = table0[i].ItemArray[3].ToString();
                    objNewDuplicateSemesterMarksheetTb2_DT.TotalPassMark = table0[i].ItemArray[4].ToString();
                    objNewDuplicateSemesterMarksheetTb2_DT.SecuredMark = table0[i].ItemArray[5].ToString();
                    objNewDuplicateSemesterMarksheetTb2_DT.InternalSecured = table0[i].ItemArray[6].ToString();
                    objNewDuplicateSemesterMarksheetTb2_DT.Total = table0[i].ItemArray[7].ToString();
                    objNewDuplicateSemesterMarksheetTb2_DT.Result = table0[i].ItemArray[8].ToString();
                    objNewDuplicateSemesterMarksheetTb2_DT.CreatedBy = "";
                    objNewDuplicateSemesterMarksheetTb2_DT.CreatedOn = System.DateTime.Now;
                    objNewDuplicateSemesterMarksheetTb2_DT.ModifiedOn = System.DateTime.Now;
                    objNewDuplicateSemesterMarksheetTb2_DT.ModifiedBy = "";
                    objNewDuplicateSemesterMarksheetTb2_DT.ClientIP = "";
                    DataTable t_db2 = m_DuplicateSemesterMarksheettb2BLL.InsertDuplicateSemesterMarksheetTb2(objNewDuplicateSemesterMarksheetTb2_DT, AFields);
                }




                string[] AFields2 = {

                    "aadhaarNumber"
                    , "ProfileID"
                    ,"AppName"
                    ,"RegistrationNo"
                    , "StudentName"
                    , "Semester"
                     , "Branch"
                    , "InstituteName"
                    , "ExamCenterName"
                    , "Result"
                    , "ResponseString"
                    ,"Status"
                    ,"CreatedBy"
                    ,"CreatedOn"
                    ,"ModifiedOn"
                    ,"ModifiedBy"
                    ,"ClientIP"
                    };


                DataRow[] table1 = new DataRow[t_DS.Tables[1].Rows.Count];
                for (int i = 0; i < table1.Length; i++)
                {
                    table1[i] = t_DS.Tables[1].Rows[i];
                }
                //DataColumn[] table1 = new DataColumn[t_DS.Tables[1].Columns.Count];

                //for (int i = 0; i < table1.Length; i++)
                //{
                //    table1[i] = t_DS.Tables[1].Columns[i];
                //}


                NewDuplicateSemesterMarksheet_DT objNewDivisionalMarksheet_DT = new NewDuplicateSemesterMarksheet_DT();
                objNewDivisionalMarksheet_DT.aadhaarNumber = "";
                objNewDivisionalMarksheet_DT.ProfileID = "";
                objNewDivisionalMarksheet_DT.AppName = "";
                objNewDivisionalMarksheet_DT.RegistrationNo = table1[0].ItemArray[0].ToString();
                objNewDivisionalMarksheet_DT.StudentName = table1[0].ItemArray[1].ToString();
                objNewDivisionalMarksheet_DT.Semester = table1[0].ItemArray[2].ToString();
                objNewDivisionalMarksheet_DT.Branch = table1[0].ItemArray[3].ToString();
                objNewDivisionalMarksheet_DT.InstituteName = table1[0].ItemArray[4].ToString();
                objNewDivisionalMarksheet_DT.ExamCenterName = table1[0].ItemArray[5].ToString();
                objNewDivisionalMarksheet_DT.Result = table1[0].ItemArray[6].ToString();
                objNewDivisionalMarksheet_DT.ResponseString = table1[0].ItemArray[7].ToString();
                objNewDivisionalMarksheet_DT.Status = table1[0].ItemArray[8].ToString();
                objNewDivisionalMarksheet_DT.CreatedBy = "";
                objNewDivisionalMarksheet_DT.CreatedOn = System.DateTime.Now;
                objNewDivisionalMarksheet_DT.ModifiedOn = System.DateTime.Now;
                objNewDivisionalMarksheet_DT.ModifiedBy = "";
                objNewDivisionalMarksheet_DT.ClientIP = "";
                DataTable t_db = m_DuplicateSemesterMarksheetBLL.InsertDuplicateSemesterMarksheet(objNewDivisionalMarksheet_DT, AFields2);

            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["AppID"] == null) return;
            if (Request.QueryString["SvcID"] == null) return;

            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            lblDate.Text = "Date : " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            lblPlace.Text = "Place : BHUBANESWAR";

            DataSet dt = m_DivisionalCertificateBLL.GetPNTCMarkSheet(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];

            string t_Year = "", t_Session = "", t_Semester = "", t_SessionName = "", t_Result = "";
            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = m_AppID;

                t_Year = dt.Tables[0].Rows[0]["LeavingYear"].ToString();
                t_Session = dt.Tables[0].Rows[0]["Sessioncode"].ToString();
                t_SessionName = dt.Tables[0].Rows[0]["Session"].ToString();
                t_Semester = dt.Tables[0].Rows[0]["Semester"].ToString();
                RegNo = dt.Tables[0].Rows[0]["RegistrationNo"].ToString();


                SCTEVTITI.MigrationCertITI m_MigrationCertITI = new SCTEVTITI.MigrationCertITI();

                DataSet t_DS = m_MigrationCertITI.ProvisionalCertificateYearly(RegNo);

                
                //DataSet t_DS = m_DocumentVerification.DuplicateSemseterMarkSheet("L14141004009", "02", "201605");

                //if (t_DS.Tables[0].Rows[0]["status"].ToString() != "No Record Found")
                if (t_DS.Tables[0].Rows[0][0].ToString() != null && t_DS.Tables[0].Rows[0][0].ToString() != "")
                {
                    try
                    {
                        //Diplomasave(t_DS);
                    }
                    catch
                    {

                    }

                }

                if (t_DS.Tables[0].Rows.Count != 0)
                {
                    //if (t_DS.Tables[0].Rows[0]["Status"].ToString() != "Wrong Input")
                    if (t_DS.Tables[0].Rows[0][0].ToString() != "Invalid Registration Number" && t_DS.Tables[0].Rows[0][0].ToString() != "Result either Fail or Withheld" && t_DS.Tables[0].Rows[0][0].ToString() != "" && t_DS.Tables[0].Rows[0][0].ToString() != "No Record Found")
                    {
                        DataTable t_Detail = t_DS.Tables[0];
                        DataTable t_Dt = t_DS.Tables[1];
                        //DataTable t_Basic = t_DS.Tables[2];


                        if (t_Dt.Rows.Count != 0)
                        {
                            lblExam.Text = t_Detail.Rows[0]["ExamYMName"].ToString().ToUpper();
                            lblCenter.Text = t_Detail.Rows[0]["FatherName"].ToString().ToUpper();
                            lblInstitute.Text = t_Detail.Rows[0]["InstituteName"].ToString().ToUpper();
                            lblSemester.Text = t_Detail.Rows[0]["PNTC No"].ToString().ToUpper();
                            lblBranch.Text = t_Detail.Rows[0]["CourseName"].ToString().ToUpper();
                            lblName.Text = t_Detail.Rows[0]["StudentName"].ToString().ToUpper();
                            lblRegistration.Text = t_Detail.Rows[0]["RegistrationNo"].ToString().ToUpper();
                            
                                
                                //PNTC_x0020_No
                                //MarkObtained
                                //TotalMark
                                //Period
                                //ENDPeriod
                            //DataTable l_dt = m_DuplicateDiplomaBLL.GetlegacyData(m_AppID);

                            if (t_Dt.Rows.Count != 0)
                            {
                                pnlGrid.Controls.Add(new LiteralControl("<div>"));
                                pnlGrid.Controls.Add(new LiteralControl("<table width='100%' border='0' cellspacing='0' cellpadding='0' style='line-height:30px; margin:0 auto;'>"));
                                pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                                pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border:1px solid #000; padding:0 0 0 5px;width: 50px;'>Sl. No.</td>"));
                                pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:0 0 0 5px;'>Subject Name</td>"));
                                pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:100px'>Mark Obtained</td>"));
                                pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:100px'>Full Mark</td>"));
                                pnlGrid.Controls.Add(new LiteralControl("</tr>"));

                                for (int i = 0; i < t_Dt.Rows.Count; i++)
                                {
                                    pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; border-left:1px solid #000; padding:0 0 0 5px;'>" + t_Dt.Rows[i]["SlNo"].ToString() + "</td>"));
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;'>" + t_Dt.Rows[i]["SubjectName"].ToString() + "</td>"));
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'>" + t_Dt.Rows[i]["Mark Obtained"].ToString() + "</td>"));
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'>" + t_Dt.Rows[i]["SemYearFullMark"].ToString() + "</td>"));

                                    //t_Result = "Result : <b>" + t_Dt.Rows[1]["Result"].ToString() + "<b/>";

                                    pnlGrid.Controls.Add(new LiteralControl("</tr>"));
                                }
                                

                                pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                                pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border:1px solid #000; padding:0 0 0 5px;width: 50px;'></td>"));
                                pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:0 0 0 5px;'></td>"));
                                pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:right; padding:0 5px 0 5px;width:100px'>" + t_Detail.Rows[0]["MarkObtained"].ToString() + "</td>"));
                                pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:right; padding:0 5px 0 5px;width:100px'>" + t_Detail.Rows[0]["TotalMark"].ToString() + "</td>"));
                                pnlGrid.Controls.Add(new LiteralControl("</tr>"));

                                pnlGrid.Controls.Add(new LiteralControl("</table>"));
                                lblResult.Text = "PERIOD : FROM " + t_Detail.Rows[0]["Period"].ToString() + " TO " + t_Detail.Rows[0]["ENDPeriod"].ToString();
                                pnlGrid.Controls.Add(new LiteralControl("</div>"));

                                pnlGrid.Controls.Add(new LiteralControl("<div style='clear:both'></div>"));

                                trFile.Visible = false;
                                lblResult.Visible = true;
                            }
                            else
                            {
                                //string t_URL = "/WebApp/G2G/DTE/DMASForm.aspx?SvcID=371";
                                //string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Duplicate Diploma Certificate.";
                                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);



                                string t_URL = "#";
                                string m_Message = "No record found for Registration No : " + RegNo + ".";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);

                            }
                        }
                        else
                        {
                            //lblReg.Text = t_Dt.Rows[0]["RegistrationNumber"].ToString();
                            //lblName.Text = t_Dt.Rows[0]["StudentName"].ToString();
                            //lblfname.Text = t_Dt.Rows[0]["FatherName"].ToString();
                            //lblInstitute.Text = t_Dt.Rows[0]["InstituteName"].ToString();
                            //lblBranch.Text = t_Dt.Rows[0]["BranchName"].ToString();
                            //lblDivision.Text = t_Dt.Rows[0]["Division"].ToString();
                            //t_Year = t_Dt.Rows[0]["YearofPassing"].ToString();
                            //lblSession.Text = t_Dt.Rows[0]["Session"].ToString() + " - " + t_Year;

                        }
                        try { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
                        catch { }
                    }
                    else
                    { 
                           CheckForFileUploaded();
                        
                        //ChechInLegacyData(RegNo, t_Semester.Replace("0", ""), t_Year);
                        //string t_URL = "#";
                        //string m_Message = "No record found for Registration No : " + RegNo + ".";
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
                    }
                }
                else
                {


                    string m_Message = "No record found for Registration No : " + RegNo + ".";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);

                }
            }
            else
            {
                string m_Message = "No record found for Registration No : " + RegNo + ".";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);

            }
        }

        private void ChechInLegacyData(string RegNo, string t_Semester, string t_Year)
        {
            DataSet ds_Legacy = m_DivisionalCertificateBLL.GetLegacySemester(RegNo, t_Semester, t_Year);

            string t_Result = "";
            string t_SubCode = "";
            string t_SubCodeIA = "";
            int t_FMTotal = 0;
            int m_FMTotal = 0;
            if (ds_Legacy.Tables[0].Rows.Count != 0)
            {
                DataTable dtStudent = ds_Legacy.Tables[0];
                DataTable dtMarks = ds_Legacy.Tables[2];
                DataTable dtSubject = ds_Legacy.Tables[1];

                if (dtStudent.Rows.Count != 0)
                {
                    lblExam.Text = dtMarks.Rows[0]["EXAM"].ToString().ToUpper() + " - " + dtMarks.Rows[0]["CYEAR"].ToString().ToUpper();
                    lblCenter.Text = dtStudent.Rows[0]["ExamCenterName"].ToString().ToUpper();
                    lblInstitute.Text = dtStudent.Rows[0]["InstituteName"].ToString().ToUpper();
                    lblSemester.Text = t_Semester;// dtStudent.Rows[0]["Semester"].ToString().ToUpper();
                    lblBranch.Text = dtStudent.Rows[0]["Branch"].ToString().ToUpper();
                    lblName.Text = dtStudent.Rows[0]["StudentName"].ToString().ToUpper();
                    lblRegistration.Text = dtStudent.Rows[0]["RegistrationNumber"].ToString().ToUpper();

                    //DataTable l_dt = m_DuplicateDiplomaBLL.GetlegacyData(m_AppID);

                    if (dtSubject.Rows.Count != 0)
                    {
                        pnlGrid.Controls.Add(new LiteralControl("<div>"));
                        pnlGrid.Controls.Add(new LiteralControl("<table width='100%' border='0' cellspacing='0' cellpadding='0' style='line-height:30px; margin:0 auto;'>"));
                        pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border:1px solid #000; padding:0 0 0 5px;width: 90px;'>Subject Code</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:0 0 0 5px;'>Subject Name</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:40px'>TH</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:40px'>IA</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;'>TOTAL</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:80px;'>PASS MARK</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:40px'>TH</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:40px'>IA</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;'>TOTAL</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("</tr>"));

                        for (int i = 0; i < dtSubject.Rows.Count; i++)
                        {
                            pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; border-left:1px solid #000; padding:0 0 0 5px;'>" + dtSubject.Rows[i]["SubjectID"].ToString() + "</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;'>" + dtSubject.Rows[i]["subjectName"].ToString() + "</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'>" + dtSubject.Rows[i]["SemFullMark"].ToString() + "</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'>" + dtSubject.Rows[i]["InternalFullMark"].ToString() + "</td>"));

                            t_FMTotal = (Convert.ToInt32(dtSubject.Rows[i]["SemFullMark"].ToString()) + Convert.ToInt32(dtSubject.Rows[i]["InternalFullMark"].ToString()));
                            if (i == 0)
                                m_FMTotal = t_FMTotal;
                            else
                                m_FMTotal = m_FMTotal + t_FMTotal;

                            pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'>" + (Convert.ToInt32(dtSubject.Rows[i]["SemFullMark"].ToString()) + Convert.ToInt32(dtSubject.Rows[i]["InternalFullMark"].ToString())) + "</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'>" + dtSubject.Rows[i]["PassMark"].ToString() + "</td>"));

                            t_SubCode = dtSubject.Rows[i]["pcode"].ToString().Replace("-", "");
                            t_SubCodeIA = dtSubject.Rows[i]["pcode"].ToString().Replace("TH-", "IA");
                            if (t_SubCode != "")
                            {
                                pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'>" + dtMarks.Rows[0][t_SubCode].ToString() + "</td>"));//Theory
                            }
                            else
                            {
                                pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'> </td>"));//Theory
                            }
                            if (t_SubCode.Contains("TH"))
                            {
                                pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'>" + dtMarks.Rows[0][t_SubCodeIA].ToString() + "</td>"));//IA
                                pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;font-weight:bold;'>" + (Convert.ToInt32(dtMarks.Rows[0][t_SubCode].ToString()) + Convert.ToInt32(dtMarks.Rows[0][t_SubCodeIA].ToString())) + "</td>"));

                            }
                            else
                            {
                                pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;'></td>"));//IA
                                if (t_SubCode != "")
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;font-weight:bold;'>" + dtMarks.Rows[0][t_SubCode].ToString() + "</td>"));
                                else
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;font-weight:bold;'></td>"));

                            }



                            pnlGrid.Controls.Add(new LiteralControl("</tr>"));
                        }


                        pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border:1px solid #000; padding:0 0 0 5px;width: 90px;'></td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:0 0 0 5px;font-weight:bold'>TOTAL</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:40px'></td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:40px'></td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;'>" + m_FMTotal + "</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:80px;'></td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:40px'>" + dtMarks.Rows[0]["THPRTotal"].ToString() + "</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;width:40px'>" + dtMarks.Rows[0]["IATotal"].ToString() + "</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("<td style='font-weight:bold;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000;text-align:center; padding:0 0 0 5px;'>" + dtMarks.Rows[0]["TOTAL"].ToString() + "</td>"));
                        pnlGrid.Controls.Add(new LiteralControl("</tr>"));


                        t_Result = "Result : <b>" + dtMarks.Rows[0]["Result"].ToString() + "<b/>";
                        lblResult.Text = t_Result;
                        pnlGrid.Controls.Add(new LiteralControl("</table>"));
                        pnlGrid.Controls.Add(new LiteralControl("</div>"));

                        pnlGrid.Controls.Add(new LiteralControl("<div style='clear:both'></div>"));
                    }
                    else
                    {
                        //string t_URL = "/WebApp/G2G/DTE/DMASForm.aspx?SvcID=371";
                        //string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Duplicate Diploma Certificate.";
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);

                        string t_URL = "#";
                        string m_Message = "No record found for Registration No : " + RegNo + ".";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);

                    }
                }
                else
                {

                }
            }
            else
            {
                DataSet dt = m_DivisionalCertificateBLL.GetDivisionalCertificate(m_ServiceID, m_AppID);
                DataTable dtApp = dt.Tables[0];

                string t_Session = "", t_SessionName = "";
                if (dt.Tables[0].Rows.Count != 0)
                {
                    lblAppID.Text = m_AppID;

                    t_Year = dt.Tables[0].Rows[0]["LeavingYear"].ToString();
                    t_Session = dt.Tables[0].Rows[0]["Sessioncode"].ToString();
                    t_SessionName = dt.Tables[0].Rows[0]["Session"].ToString();
                    t_Semester = dt.Tables[0].Rows[0]["Semester"].ToString();
                    RegNo = dt.Tables[0].Rows[0]["RegistrationNo"].ToString();

                    lblExam.Text = t_SessionName.ToUpper() + " - " + t_Year.ToUpper();
                    lblCenter.Text = "";
                    lblInstitute.Text = dt.Tables[0].Rows[0]["InstituteName"].ToString().ToUpper();
                    lblSemester.Text = t_Semester;
                    //lblBranch.Text = dt.Tables[0].Rows[0]["Branch"].ToString().ToUpper();
                    lblName.Text = dt.Tables[0].Rows[0]["ApplicantName"].ToString().ToUpper();
                    lblRegistration.Text = RegNo;
                }

                DataTable dt_File = m_DivisionalCertificateBLL.CheckFileUploadedDTE(m_AppID, t_Semester, m_ServiceID);


                if (dt_File.Rows.Count != 0)
                {
                    HtmlAnchor t_Anchor = null;
                    t_Anchor = new HtmlAnchor();
                    t_Anchor.ID = "fileDownload";

                    t_Anchor.InnerHtml = "Download Mark Sheet";

                    string t_FilePath = dt.Tables[0].Rows[0]["FilePath"].ToString();
                    t_Anchor.Attributes.Add("onclick", "DownloadFile('" + t_FilePath + "','')");
                    t_Anchor.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");

                    pnlGrid.Controls.Add(new LiteralControl("<div>"));
                    pnlGrid.Controls.Add(new LiteralControl("<table width='100%' border='0' cellspacing='0' cellpadding='0' style='line-height:30px; margin:0 auto;'>"));
                    pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                    pnlGrid.Controls.Add(new LiteralControl("<td style='white-space: nowrap;'>Semester Mark Sheet</td>"));
                    pnlGrid.Controls.Add(new LiteralControl("<td style='width: 20px'>:</td>"));
                    pnlGrid.Controls.Add(new LiteralControl("<td>"+t_Semester+"</td>"));
                    pnlGrid.Controls.Add(new LiteralControl("</tr>"));

                    pnlGrid.Controls.Add(new LiteralControl("<table width='100%' border='0' cellspacing='0' cellpadding='0' style='line-height:30px; margin:0 auto;'>"));
                    pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                    pnlGrid.Controls.Add(new LiteralControl("<td style='white-space: nowrap;'>Download Mark Sheet</td>"));
                    pnlGrid.Controls.Add(new LiteralControl("<td style='width: 20px'>:</td>"));
                    pnlGrid.Controls.Add(new LiteralControl("<td"+ t_Anchor+"</td>"));
                    
                    lblResult.Visible = false;
                    pnlGrid.Controls.Add(new LiteralControl("</table>"));
                    pnlGrid.Controls.Add(new LiteralControl("</div>"));

                    pnlGrid.Controls.Add(new LiteralControl("<div style='clear:both'></div>"));


                }
                try { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
                catch { }
            }

        }

        private void CheckForFileUploaded()
        {
            DataSet dt = m_DivisionalCertificateBLL.GetPNTCMarkSheet(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];

            lblName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
            //lblBranch.Text = dtApp.Rows[0]["BranchName"].ToString();
            lblInstitute.Text = dtApp.Rows[0]["InstituteName"].ToString();
            lblRegistration.Text = dtApp.Rows[0]["RegistrationNo"].ToString();
            lblExam.Text = dtApp.Rows[0]["Session"].ToString() + "-" + dtApp.Rows[0]["LeavingYear"].ToString();

            DataTable dt_File = m_DivisionalCertificateBLL.CheckFileUploadedDTE(m_AppID, "", m_ServiceID);
            trFile.Visible = true;
            lblResult.Visible = false;
            if (dt_File.Rows.Count != 0)
            {
                HtmlAnchor t_Anchor = null;
                t_Anchor = new HtmlAnchor();
                t_Anchor.ID = "fileDownload";

                t_Anchor.InnerHtml = "Download Mark Sheet";
                string t_FilePath = "";
                if (dt_File.Rows[0]["FilePath"].ToString() != null && dt_File.Rows[0]["FilePath"].ToString() != "")
                {
                    t_FilePath = dt_File.Rows[0]["FilePath"].ToString();
                    lblDownload.Attributes.Add("onclick", "DownloadFile('" + t_FilePath + "','')");
                    lblDownload.Attributes.Add("style", "cursor:pointer;font-size:10pt;font-family:Arial;color:Firebrick;text-decoration:none;");
                    lblDownload.InnerText = "Download PNTC";

                }
                else
                {
                    lblDownload.InnerText = "No File Uploaded";

                }


                if (t_FilePath == "")
                {
                    string t_URL = "#";
                    string m_Message = "No record found for Registration No : " + RegNo + ".";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.location ='" + t_URL + "';", true);
                }
            }
            try { QRCode1.GenerateQRCodePayment(m_ServiceID, m_AppID); }
            catch { }
        }

    }
}

