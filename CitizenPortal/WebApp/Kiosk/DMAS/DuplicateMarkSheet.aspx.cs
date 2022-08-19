using CitizenPortalLib.BLL;
using CitizenPortalLib.DataStructs;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CitizenPortal.WebApp.Kiosk.DMAS
{
    public partial class DuplicateMarkSheet : System.Web.UI.Page
    {
        DivisionalCertificateBLL m_DivisionalCertificateBLL = new DivisionalCertificateBLL();
        DivisionalMarksheetBLL m_DivisionalMarksheetBLL = new DivisionalMarksheetBLL();
        DivisionalMarksheettable2BLL m_DivisionalMarksheettb2BLL = new DivisionalMarksheettable2BLL();


        string m_AppID = "", m_ServiceID = "", RegNo = "";

        void Duplicatesave(DataSet p_DS)
        {
            //DocumentVerification.StudentDetailsWS m_DocumentVerification = new DocumentVerification.StudentDetailsWS();
            //DataSet t_DS = m_DocumentVerification.DuplicateDivisionalMarksheet("F1100101008", "201405");

            DataSet t_DS = p_DS;
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
                ,"InstituteName"
                ,"RegistrationNo"
                ,"ExamYMCode"
                , "StudentName"
                , "SINO"
                , "Year"
                , "Status"
                , "MonthCode"
                , "ExamYMName"
                , "BranchName"
                , "GrandTotalFullMark"
                , "GrandTotalMarkSecured"
                , "GrandTotalDivisionMark"
                , "GrandTotalDivision"
                , "ResponseString"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ModifiedOn"
                ,"ModifiedBy"
                ,"ClientIP"
                };


                DataRow[] table0 = new DataRow[t_DS.Tables[0].Rows.Count];
                for (int i = 0; i < table0.Length; i++)
                {
                    table0[i] = t_DS.Tables[0].Rows[i];
                }
                DataColumn[] table1 = new DataColumn[t_DS.Tables[1].Columns.Count];

                for (int i = 0; i < table1.Length; i++)
                {
                    table1[i] = t_DS.Tables[1].Columns[i];
                }


                DivisionalMarksheet_DT objDivisionalMarksheet_DT = new DivisionalMarksheet_DT();
                objDivisionalMarksheet_DT.aadhaarNumber = "";
                objDivisionalMarksheet_DT.ProfileID = "";
                objDivisionalMarksheet_DT.AppName = "";
                objDivisionalMarksheet_DT.ExamYMCode = "";
                objDivisionalMarksheet_DT.RegistrationNo = table0[0].ItemArray[0].ToString();
                objDivisionalMarksheet_DT.StudentName = table0[0].ItemArray[1].ToString();
                objDivisionalMarksheet_DT.SINO = table0[0].ItemArray[2].ToString();
                objDivisionalMarksheet_DT.Year = table0[0].ItemArray[3].ToString();
                objDivisionalMarksheet_DT.MonthCode = table0[0].ItemArray[4].ToString();
                objDivisionalMarksheet_DT.ExamYMName = table0[0].ItemArray[5].ToString();
                objDivisionalMarksheet_DT.BranchName = table0[0].ItemArray[6].ToString();
                objDivisionalMarksheet_DT.InstituteName = table0[0].ItemArray[7].ToString();
                objDivisionalMarksheet_DT.GrandTotalFullMark = table0[0].ItemArray[8].ToString();
                objDivisionalMarksheet_DT.GrandTotalMarkSecured = table0[0].ItemArray[9].ToString();
                objDivisionalMarksheet_DT.GrandTotalDivisionMark = table0[0].ItemArray[10].ToString();
                objDivisionalMarksheet_DT.GrandTotalDivision = table0[0].ItemArray[11].ToString();
                objDivisionalMarksheet_DT.ResponseString = table0[0].ItemArray[12].ToString();
                objDivisionalMarksheet_DT.Status = table0[0].ItemArray[1].ToString();
                objDivisionalMarksheet_DT.CreatedBy = "";
                objDivisionalMarksheet_DT.CreatedOn = System.DateTime.Now;
                objDivisionalMarksheet_DT.ModifiedOn = System.DateTime.Now;
                objDivisionalMarksheet_DT.ModifiedBy = "";
                objDivisionalMarksheet_DT.ClientIP = "";
                DataTable t_db = m_DivisionalMarksheetBLL.InsertDivisionalMarksheet(objDivisionalMarksheet_DT, AFields);


                //table2
                string[] AFields2 = {

                "aadhaarNumber"
                , "ProfileID"
                ,"AppName"
                , "SINO"
                ,"PCode"
                , "SubjectName"
                , "TotalFullMark"
                , "TotalMarkSecured"
                ,"CreatedBy"
                ,"CreatedOn"
                ,"ModifiedOn"
                ,"ModifiedBy"
                ,"ClientIP"
                };
                DivisionalMarksheetTable2_DT objDivisionalMarksheettb2_DT = new DivisionalMarksheetTable2_DT();
                // DataRow[] table2 = new DataRow[t_DS.Tables[2].Rows.Count];


                int tblcount = t_DS.Tables.Count - 3;
                int m = 3;
                for (int j = 0; j < tblcount; j++)
                {

                    DataRow[] table2 = new DataRow[t_DS.Tables[m].Rows.Count];
                    for (int k = 0; k < table2.Length; k++)
                    {
                        table2[k] = t_DS.Tables[m].Rows[k];
                    }

                    for (int i = 0; i < table2.Length; i++)
                    {
                        objDivisionalMarksheettb2_DT.aadhaarNumber = "";
                        objDivisionalMarksheettb2_DT.ProfileID = "";
                        objDivisionalMarksheettb2_DT.AppName = "";
                        objDivisionalMarksheettb2_DT.SINO = table2[i].ItemArray[0].ToString();
                        objDivisionalMarksheettb2_DT.PCode = table2[i].ItemArray[1].ToString();
                        objDivisionalMarksheettb2_DT.SubjectName = table2[i].ItemArray[2].ToString();
                        objDivisionalMarksheettb2_DT.TotalFullMark = table2[i].ItemArray[3].ToString();
                        objDivisionalMarksheettb2_DT.TotalMarkSecured = table2[i].ItemArray[4].ToString();
                        objDivisionalMarksheettb2_DT.CreatedBy = "";
                        objDivisionalMarksheettb2_DT.CreatedOn = System.DateTime.Now;
                        objDivisionalMarksheettb2_DT.ModifiedOn = System.DateTime.Now;
                        objDivisionalMarksheettb2_DT.ModifiedBy = "";
                        objDivisionalMarksheettb2_DT.ClientIP = "";
                        DataTable t_db2 = m_DivisionalMarksheettb2BLL.InsertDivisionalMarksheetTb2(objDivisionalMarksheettb2_DT, AFields2);
                    }
                    m++;
                }

            }
        }
       

        protected void Page_Load(object sender, EventArgs e)
        {
            string t_Year = "", t_Session = "";

            //Duplicatesave();
            if (Request.QueryString["AppID"] == null || Request.QueryString["AppID"]=="")
            {
                return;
            }
            if (Request.QueryString["SvcID"] == null || Request.QueryString["SvcID"]=="")
            {
                return;
            }
            m_AppID = Request.QueryString["AppID"].ToString();
            m_ServiceID = Request.QueryString["SvcID"].ToString();

            lblDate.Text = "Date : " + DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            //lblPlace.Text = "Place : BHUBANESWAR";

            DataSet dt = m_DivisionalCertificateBLL.GetDivisionalCertificate(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];

           
            if (dt.Tables[0].Rows.Count != 0)
            {
                lblAppID.Text = m_AppID;

                t_Year = dt.Tables[0].Rows[0]["LeavingYear"].ToString();
                t_Session = dt.Tables[0].Rows[0]["Sessioncode"].ToString();
                RegNo = dt.Tables[0].Rows[0]["RegistrationNo"].ToString();

                DocumentVerification.StudentDetailsWS m_DocumentVerification = new DocumentVerification.StudentDetailsWS();

                DataSet t_DS = m_DocumentVerification.DuplicateDivisionalMarksheet(RegNo, t_Year + t_Session);

                //DataSet t_DS = m_DocumentVerification.DuplicateDivisionalMarksheet("F1100101008", "201405");

                if (t_DS.Tables[0].Rows[0]["status"].ToString() != "No Record Found")
                {
                    try
                    {
                        Duplicatesave(t_DS);
                    }
                    catch
                    {

                    }

                    DataTable t_Dt = t_DS.Tables[0];
                    //DataTable t_Dt1= t_DS.Tables[2];
                    //DataTable t_Dt2 = t_DS.Tables[3];
                    //DataTable t_Dt3 = t_DS.Tables[4];
                    //DataTable t_Dt4 = t_DS.Tables[5];
                    //DataTable t_Dt5 = t_DS.Tables[6];
                    //DataTable t_Dt6 = t_DS.Tables[7];

                    //DataTable t_Basic = t_DS.Tables[2];

                    if (t_Dt.Rows.Count != 0)
                    {

                        lblName.Text = t_Dt.Rows[0]["StudentName"].ToString();
                        lblBranch.Text = t_Dt.Rows[0]["BranchName"].ToString();
                        lblInstitute.Text = t_Dt.Rows[0]["InstituteName"].ToString();
                        lblRegistration.Text = t_Dt.Rows[0]["RegistrationNumber"].ToString();

                        lblExam.Text = t_Dt.Rows[0]["ExamYMName"].ToString();
                        lblMarks.Text = "Full Marks : " + t_Dt.Rows[0]["GrandTotalFullMark"].ToString();
                        lblSecure.Text = "Marks Secured : " + t_Dt.Rows[0]["GrandTotalMarkSecured"].ToString();
                        lblDivision.Text = "Division : " + t_Dt.Rows[0]["GrandTotalDivision"].ToString();
                        lblDivMark.Text = "Marks Admissible for Division : " + t_Dt.Rows[0]["GrandTotalDivisionMark"].ToString();
                        //DataTable l_dt = m_DuplicateDiplomaBLL.GetlegacyData(m_AppID);

                        if (t_Dt.Rows.Count != 0)
                        {
                            pnlGrid.Controls.Add(new LiteralControl("<div style='height: 50px;float: left;width: 355px'>"));
                            pnlGrid.Controls.Add(new LiteralControl("<table border='0' cellspacing='0' cellpadding='0' style='margin:0 auto;width:98%;margin:10px 10px 0 0;font-size:11px;font-family:arial;'>"));
                            pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border:1px solid #000; padding:5px 0 0 5px;width: 50px;'>Subject<br/>Code</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:5px 0 0 5px;'>Subject Name</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:5px 0 0 5px;width:50px;'>Full<br/>Mark</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:5px 0 0 5px;width: 50px;'>Secured<br/>Mark</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("</tr>"));
                            pnlGrid.Controls.Add(new LiteralControl("</table>"));
                            pnlGrid.Controls.Add(new LiteralControl("</div>"));

                            pnlGrid.Controls.Add(new LiteralControl("<div style='height: 50px;float: left;width: 355px'>"));
                            pnlGrid.Controls.Add(new LiteralControl("<table border='0' cellspacing='0' cellpadding='0' style='margin:0 auto;width:98%;margin:10px 10px 0 0;font-size:11px;font-family:arial;'>"));
                            pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border:1px solid #000; padding:5px 0 0 5px;width: 50px;'>Subject<br/>Code</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:5px 0 0 5px;'>Subject Name</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:5px 0 0 5px;width:50px;'>Full<br/>Mark</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:5px 0 0 5px;width: 50px;'>Secured<br/>Mark</td>"));
                            pnlGrid.Controls.Add(new LiteralControl("</tr>"));
                            pnlGrid.Controls.Add(new LiteralControl("</table>"));
                            pnlGrid.Controls.Add(new LiteralControl("</div>"));
                            for (int j = 2; j < 8; j++)
                            {
                                //pnlGrid.Controls.Add(new LiteralControl("<div style='height: 295px;float: left;width: 355px'>"));
                                //pnlGrid.Controls.Add(new LiteralControl("<table border='0' cellspacing='0' cellpadding='0' style='margin:0 auto;width:98%;margin:10px 10px 0 0;font-size:11px;font-family:arial;'>"));
                                //pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                                //pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border:1px solid #000; padding:5px 0 0 5px;width: 50px;'>Subject<br/>Code</td>"));
                                //pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:5px 0 0 5px;'>Subject Name <b>"+ "SEMESTER " + (j - 1) + "</b></td>"));
                                //pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:5px 0 0 5px;width:30px;'>Full<br/>Mark</td>"));
                                //pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;background-color:#F0F0F0; border-top:1px solid #000; border-right:1px solid #000; border-bottom:1px solid #000; padding:5px 0 0 5px;width: 50px;'>Secured<br/>Mark</td>"));
                                //pnlGrid.Controls.Add(new LiteralControl("</tr>"));

                                pnlGrid.Controls.Add(new LiteralControl("<div style='height: 255px;float: left;width: 355px'>"));
                                pnlGrid.Controls.Add(new LiteralControl("<table border='0' cellspacing='0' cellpadding='0' style='width:98%;margin:0px 10px 0 0;font-size:11px;font-family:arial;'>"));
                                pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                                pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                                pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;border-right:1px solid #000;background-color:#F0F0F0; border-bottom:1px solid #000; border-left:1px solid #000;border-top:1px solid #000; padding:0 0 0 5px;' colspan='4'>"));
                                pnlGrid.Controls.Add(new LiteralControl("<b>" + "SEMESTER " + (j - 1) + "</b>"));
                                pnlGrid.Controls.Add(new LiteralControl("</td>"));
                                pnlGrid.Controls.Add(new LiteralControl("</tr>"));
                                DataTable t_Temp = t_DS.Tables[j];

                                for (int i = 0; i < t_Temp.Rows.Count; i++)
                                {   

                                    pnlGrid.Controls.Add(new LiteralControl("<tr>"));
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;border-right:1px solid #000; border-bottom:1px solid #000; border-left:1px solid #000; padding:0 0 0 5px;width:50px;'>" + t_Temp.Rows[i]["pcode"].ToString() + "</td>"));
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;border-right:1px solid #000; border-bottom:1px solid #000; padding:0 0 0 5px;'>" + t_Temp.Rows[i]["subjectName"].ToString() + "</td>"));
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;width:50px;'>" + t_Temp.Rows[i]["TotalFullMark"].ToString() + "</td>"));
                                    pnlGrid.Controls.Add(new LiteralControl("<td style='height:15px;border-right:1px solid #000; border-bottom:1px solid #000; padding:0 5px 0 5px;text-align:right;width:50px;'>" + t_Temp.Rows[i]["MarkSecured"].ToString() + "</td>"));
                                    pnlGrid.Controls.Add(new LiteralControl("</tr>"));
                                }

                                pnlGrid.Controls.Add(new LiteralControl("</table>"));
                                pnlGrid.Controls.Add(new LiteralControl("</div>"));

                                //pnlGrid.Controls.Add(new LiteralControl("<div style='clear:both'></div>"));
                            }
                        }
                        else
                        {
                            string t_URL = "/WebApp/G2G/DTE/DMASForm.aspx?SvcID=371";
                            string m_Message = "No record found for Registration No : " + RegNo + ". Please check the and fill the necessary detail to issue Duplicate Diploma Certificate.";
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

                    string m_Message = "No record found for Registration No : " + RegNo + ".";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + m_Message + "');window.close();", true);

                }
            }
        }

        private void CheckForFileUploaded()
        {
            DataSet dt = m_DivisionalCertificateBLL.GetDivisionalCertificate(m_ServiceID, m_AppID);
            DataTable dtApp = dt.Tables[0];

            lblName.Text = dtApp.Rows[0]["ApplicantName"].ToString();
            lblBranch.Text = dtApp.Rows[0]["BranchName"].ToString();
            lblInstitute.Text = dtApp.Rows[0]["InstituteName"].ToString();
            lblRegistration.Text = dtApp.Rows[0]["RegistrationNo"].ToString();
            lblExam.Text = dtApp.Rows[0]["Session"].ToString() +"-"+ dtApp.Rows[0]["LeavingYear"].ToString();

            DataTable dt_File = m_DivisionalCertificateBLL.CheckFileUploadedDTE(m_AppID, "", m_ServiceID);
            trFile.Visible = true;

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