using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CitizenPortalLib.BLL;
using System.Data;
using CitizenPortalLib;

namespace CitizenPortal.WebApp.Faculty
{
    public partial class AppointmentLetter : AdminBasePage
    {
        FacultyModuleBLL m_FacultyModuleBLL = new FacultyModuleBLL();
        string m_LoginId = "", RowID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            m_LoginId = Session["LoginID"].ToString();
            RowID = Request.QueryString["RowID"].ToString();
            BindData();
        }

        public void BindData()
        {

            string MailText = "";
            try
            {
                divDetail.Controls.Clear();
                DataSet result = null;

                result = m_FacultyModuleBLL.GetAppointmentLetter(m_LoginId, RowID);

                //DataTable t_App = result.Tables[0];
                DataTable t_Faculty = result.Tables[0];
                DataTable t_Subject = result.Tables[1];

                if (result != null && t_Faculty.Rows.Count > 0)
                {                   

                    string strSubject = "";
                    string QuestionDetail = "";

                    strSubject = @"<table style=""border: 1px solid #999999;width:100%"" cellpadding=""0"" cellspacing=""0"">";
                    strSubject = strSubject + "<tr>";
                    strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Sl. No.</th>";
                    //strSubject = strSubject +    @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Subject Code</th>";
                    strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Subject Name</th>";
                    strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Semester</th>";
                    strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Program</th>";
                    strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Course</th>";
                    strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Maximum Mark</th>";
                    strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Minimum Mark</th>";
                    strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Duration</th>";
                    strSubject = strSubject + @"<th style=""border: 1px solid #999999; background-color: #C0C0C0;"">Schema</th>";
                    strSubject = strSubject + @"</tr>";
                    for (int j = 0; j < t_Subject.Rows.Count; j++)
                    {
                        strSubject = strSubject + @"<tr>";
                        strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Sl"].ToString() + "</td>";
                        //strSubject = strSubject + @"<td style=""border: 1px solid #999999"">"+t_Subject.Rows[0]["SubjectCode"].ToString()+"</td>";
                        strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Subject"].ToString() + "</td>";
                        strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Semester"].ToString() + "</td>";
                        strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Program"].ToString() + "</td>";
                        strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Course"].ToString() + "</td>";
                        strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Maximum"].ToString() + "</td>";
                        strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Minimum"].ToString() + "</td>";
                        strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Duration"].ToString() + "</td>";
                        strSubject = strSubject + @"<td style=""border: 1px solid #999999"">" + t_Subject.Rows[j]["Scheme"].ToString() + "</td>";
                        strSubject = strSubject + @" </tr>";
                    }
                    strSubject = strSubject + @"</table>";

                    for (int j = 0; j < t_Subject.Rows.Count; j++)
                    {
                        QuestionDetail = @"<div style=""page-break-after: always""></div>";
                        QuestionDetail = QuestionDetail + @"<div style=""font-family: Arial; padding: 1px; margin: 0 auto; border: 2px solid #b0b0b0;"">";
                        QuestionDetail = QuestionDetail + @"<div style=""background-image: url(''); background-size: 590px; border: 1px solid #b0b0b0; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; margin: 2px auto;"">";
                        QuestionDetail = QuestionDetail + @"<div style=""width: 100%;"">";
                        QuestionDetail = QuestionDetail + @"<table style=""width: 100%;"">";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td colspan=""2"" style=""text-align: center; font-size: 10px"">&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"<tr style="""">";
                        QuestionDetail = QuestionDetail + @"<td style=""width: 150px;"">";
                        QuestionDetail = QuestionDetail + @"<div style=""width: 150px; margin: 5px 0 0 5px; float: left;"">";
                        QuestionDetail = QuestionDetail + @"<img src=""http://csvtu.digivarsity.online/Sambalpur/img/sambalpur-university-logo.png"" alt=""Logo"" style=""width: 75px; margin: 5px 30px"" />";
                        QuestionDetail = QuestionDetail + @"</div>";
                        QuestionDetail = QuestionDetail + @"</td>";
                        QuestionDetail = QuestionDetail + @"<td style=""font-size: 22px; font-weight: bold; text-align: center; white-space: nowrap;"">";
                        QuestionDetail = QuestionDetail + @"CHHATTISGARH SWAMI VIVEKANAND<br/><span>TECHNICAL UNIVERSITY, BHILAI</span><br />";
                        QuestionDetail = QuestionDetail + @"<span style=""font-weight: normal; font-size: 20px"">Newai, PO Newai, Distt. Durg (CG) 491107</span><br />";
                        QuestionDetail = QuestionDetail + @"<span style=""font-size: 15px;"">Exam Cell: 0788-2445017, 0788-2445024 (Phone)</span>";
                        QuestionDetail = QuestionDetail + @"</td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"</table>";
                        QuestionDetail = QuestionDetail + @"</div>";
                        QuestionDetail = QuestionDetail + @"<div style=""background-color: #808080; border: 1px solid #565555; border-left: none; border-right: none; color: #fff;"">";
                        QuestionDetail = QuestionDetail + @"</div>";
                        QuestionDetail = QuestionDetail + @"<div style=""margin: 10px; width: 100%; height: auto; font-size: 13px;"">";
                        QuestionDetail = QuestionDetail + @"<div>";
                        QuestionDetail = QuestionDetail + @"<table style=""width: 98%"">";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td style="""">";
                        QuestionDetail = QuestionDetail + @"<table style=""float: left"">";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align: left"">Course &amp; Semester: </td>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align: left""><b>" + t_Subject.Rows[j]["Semester"].ToString() + "</b></td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align: left"">Program :</td>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align: left""><b>" + t_Subject.Rows[j]["Program"].ToString() + "</b></td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"</table>";
                        QuestionDetail = QuestionDetail + @"<table style=""float: right"">";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align: left"">Subject Code : </td>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align: left""><b>" + t_Subject.Rows[j]["SubjectCode"].ToString() + "</b></td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align: left"">Part Time Subject :</td>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align: left""><b>#Parttime</b></td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"</table>";
                        QuestionDetail = QuestionDetail + @"</td>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td>Subject : <b>" + t_Subject.Rows[j]["Subject"].ToString() + "</b></td>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td>";
                        QuestionDetail = QuestionDetail + @"<table style=""width: 100%"">";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align left"">Max Marks:<b>" + t_Subject.Rows[j]["Maximum"].ToString() + "</b></td>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align center"">Minimum Pass Mark: <b>" + t_Subject.Rows[j]["Minimum"].ToString() + "</b></td>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align center"">Duration: <b>" + t_Subject.Rows[j]["Duration"].ToString() + "</b></td>";
                        QuestionDetail = QuestionDetail + @"<td style=""text-align right"">Scheme: <b>" + t_Subject.Rows[j]["Scheme"].ToString() + "</b></td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"</table>";
                        QuestionDetail = QuestionDetail + @"</td>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td></td>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"</tr> ";
                        QuestionDetail = QuestionDetail + @"<tr>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td> ";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td>";
                        QuestionDetail = QuestionDetail + @"<td>&nbsp;</td> ";
                        QuestionDetail = QuestionDetail + @"</tr>";
                        QuestionDetail = QuestionDetail + @"</table> ";
                        QuestionDetail = QuestionDetail + @"</div>";
                        QuestionDetail = QuestionDetail + @"</div> ";
                        QuestionDetail = QuestionDetail + @"</div>";
                        QuestionDetail = QuestionDetail + @"</div>";
                    }
                    #region emailText

                    //QuestionDetail = "";
                    MailText = @"
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset=""utf-8"" />
</head>
<body>
    <div id=""divPrint"" style=""margin: 0 auto; width: 90%; /*height: 1220px; overflow: auto; */"">
        <div style=""width: 100%; height: auto; font-family: Arial; border: 2px solid #b0b0b0; padding: 1px; margin: 0 auto;"">
            <div style=""background-image: url(''); background-size: 590px; border: 1px solid #b0b0b0; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; margin: 2px auto;"">
                <div style=""width: 100%;"">
                    <table style=""width: 100%;"">
                        <tr>
                            <td colspan=""2"" style=""text-align: center; font-size: 10px"">Confidential & most Urgent</td>
                        </tr>
                        <tr style="""">
                            <td style=""width: 150px;"">
                                <div style=""width: 150px; margin: 5px 0 0 5px; float: left;"">
                                    <img src=""http://csvtu.digivarsity.online/Sambalpur/img/sambalpur-university-logo.png"" alt=""Logo"" style=""width: 75px; margin: 5px 30px"" />
                                </div>
                            </td>
                            <td style=""font-size: 19px; font-weight: bold; text-align: center; white-space: nowrap;"">
                                CHHATTISGARH SWAMI VIVEKANAND <br/>TECHNICAL UNIVERSITY, BHILAI<br />
                                <span style=""font-weight: bold; font-size: 12px"">Newai, PO Newai, Distt. Durg (CG) 491107</span><br />
                                <span style=""font-size: 12px;font-weight: normal;"">Exam Cell: 0788-2445017, 0788-2445024 (Phone)</span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style=""background-color: #808080; border: 1px solid #565555; border-left: none; border-right: none; color: #fff;"">
                </div>
                <div style=""margin: 10px; width: 100%; height: auto; font-size: 13px;"">
                    <div style=""text-align: left"">
                        <table style=""width: 98%"">
                            <tr>
                                <td style=""width: 24%; text-align: left; white-space: nowrap"">Letter No.:&nbsp;<b>#LetterNo</b> </td>
                                <td style=""width: 24%; text-align: center"">&nbsp;</td>
                                <td style=""width: 24%; text-align: center"">&nbsp;</td>
                                <td style=""width: 24%; text-align: left; white-space: nowrap"">Issue Date: <b>#LetterDate</b></td>
                            </tr>
                        </table>
                    </div>
                    <div>

                        <table>
                            <tr>
                                <td style=""width: 50px"">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style=""width: 50px; text-align: right"">To,</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style=""width: 50px"">&nbsp;</td>
                                <td>
                                    #Faculty
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    #Designation
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>#Address </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </div>
                    <div>

                        <table style=""width: 98%"">
                            <tr>
                                <td style=""width: 50px"">&nbsp;</td>
                                <td>
                                    Subject : 
                                    <span style=""font-weight bold; font-style italic;"">Appointment for setting of Question Paper & providing solution to the Questions.</span>
                                </td>
                                <td style=""width: 50px"">&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>#salutation</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>I have been directed to inform you that you are appointed as Question Paper setter for CSVTU end semester exam.</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Course & Semester: <b>#CurseSemester</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Branch : <b>#Branch</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table style=""width: 100%;display:none;"">
                                        <tr>
                                            <td style=""text-align: left"">Max Marks:<b>#Maximum</b></td>
                                            <td style=""text-align: center"">Minimum Pass Mark: <b>#Minimum</b></td>
                                            <td style=""text-align: center"">Duration: <b>#Duration</b></td>
                                            <td style=""text-align: right"">Scheme: <b>#Scheme</b></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>Presuming that you will be accepting the appointment, enclosed herewith are all the relevant papers on the subject.</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    #SubjectDetail
                                </td>
                                <td>&nbsp;</td>
                            </tr>                                
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    Sir/Madam, to provide your acceptance or refusal you are request as to login into below university portal, the details are as below:

                                    <br />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table style=""width: 100%"">
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style=""white-space:nowrap"">Web portal URL</td>
                                            <td style=""white-space:nowrap"">#WebSiteURL</td>
                                            <td rowspan=""4"" style=""text-align: center; color: maroon"">* For assistance in using the portal you are requested to call at #HelpNo</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style=""white-space:nowrap"">Login Type</td>
                                            <td style=""white-space:nowrap"">#LoginType</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style=""white-space:nowrap"">Login ID</td>
                                            <td style=""white-space:nowrap"">#LoginID</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>Password</td>
                                            <td>#Password</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>In case you are unable to accept the appointment, it is requested that all the papers sent may please be returned with your refusal letter in enclosed format with genuine reason which will be intimated to HVC for further action.</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td style="""">
                                    It is requested that only one question paper be prepared in accordance with the enclosed syllabus.
                                    It may kindly be noted that for Diploma courses of Polytechnic, <b>Hindi version of each question is to be given immediately below the English version</b>.
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>PLEASE SET QUESTIONS FROM EACH UNIT WITH INTERNAL CHOICE. Please try to accommodate all questions of the Paper within the following framework-</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table style=""width: 100%"">
                                        <tr>
                                            <td>(i) </td>
                                            <td>Average Level - </td>
                                            <td>&nbsp;40%</td>
                                            <td rowspan=""3"" style=""text-align: center"">Please go through the syllabus of the subject before setting the questions.</td>
                                        </tr>
                                        <tr>
                                            <td>(ii)</td>
                                            <td>&nbsp;Medium Level - </td>
                                            <td>&nbsp;40%</td>
                                        </tr>
                                        <tr>
                                            <td>(iii)</td>
                                            <td>&nbsp;Difficult Level - </td>
                                            <td>20%</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>The manuscript of the question paper & solution to the questions should be kept in separate envelop marked ‘C’ & ‘E’respectively.These should be sealed & kept in envelop ‘B’, in which the declaration form duly filled in should ‘also be kept. The envelope containing all the above documents should be sealed properly and delivered in person or sent through registered post insured for Rs. 100/- to the undersigned by the due date. |</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Please return all the documents in case of refusal or if any relative is appearing in the said Examination. Inform the Undersigned if you come to know in future that some relative is appearing.</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>Please read & follow the “Instructions for paper setters” very carefully.</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>Due Date of Receipt of Manuscript at CSVTU: #DueDate</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>Please supply solution to NUMERICAL PROBLEMS</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>And STEP MARKING scheme in envelop ‘E.’</b></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>Set Q.P. is to be send in softcopy at email ""<b style=""font-size:15px;"">gopniya@csvtu.ac.in</b>""</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><b>Hard copy of the set Q.P. is not to be sent seperately.<b/></td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>Yours Faithfully</td>
                                        </tr>
                                        <tr>
                                            <td>Exam Controller</td>
                                        </tr>
                                        <tr>
                                            <td>CSVTU, Bhilai</td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>

                    </div>

                </div>
            </div>

        </div>
        #QuestionDetail
    </div>
</body>
</html>
";

                    #endregion

                    MailText = MailText.Replace("#LetterNo", t_Faculty.Rows[0]["LetterNo"].ToString())
                        .Replace("#LetterDate", t_Faculty.Rows[0]["LetterDate"].ToString())
                        .Replace("#Designation", t_Faculty.Rows[0]["Designation"].ToString())
                        .Replace("#CurrentSemester", t_Subject.Rows[0]["CurrentSemester"].ToString())
                        .Replace("#Branch", t_Subject.Rows[0]["Course"].ToString())
                        .Replace("#Maximum", t_Subject.Rows[0]["Maximum"].ToString())
                        .Replace("#Minimum", t_Subject.Rows[0]["Minimum"].ToString())
                        .Replace("#Duration", t_Subject.Rows[0]["Duration"].ToString())
                        .Replace("#Scheme ", t_Subject.Rows[0]["Scheme"].ToString())
                        .Replace("#SubjectCode", t_Subject.Rows[0]["SubjectCode"].ToString())
                        .Replace("#SubjectName", t_Faculty.Rows[0]["Subject"].ToString())
                        .Replace("#Faculty", t_Faculty.Rows[0]["Faculty"].ToString())
                        .Replace("#Address", t_Faculty.Rows[0]["Address"].ToString())
                        .Replace("#CurseSemester", t_Subject.Rows[0]["CurrentSemester"].ToString())
                        //.Replace("#Maxium ", t_Faculty.Rows[0]["Maxium "].ToString())
                        //.Replace("#Minimum ", t_Faculty.Rows[0]["Minimum "].ToString())
                        .Replace("#salutation", t_Faculty.Rows[0]["salutation"].ToString())
                        .Replace("#WebSiteURL", t_Faculty.Rows[0]["WebSiteURL"].ToString())
                        .Replace("#LoginType", t_Faculty.Rows[0]["LoginType"].ToString())
                        
                        .Replace("#LoginID", t_Faculty.Rows[0]["LoginID"].ToString())
                        .Replace("#Password", t_Faculty.Rows[0]["Password"].ToString())
                        .Replace("#Scheme", t_Faculty.Rows[0]["Scheme"].ToString())
                        .Replace("#Parttime", t_Faculty.Rows[0]["Parttime"].ToString())
                        .Replace("#SubjectDetail", strSubject)
                        .Replace("#QuestionDetail", QuestionDetail)
                        .Replace("#HelpNo", t_Faculty.Rows[0]["HelpNo"].ToString())
                        .Replace("#DueDate", t_Faculty.Rows[0]["DueDate"].ToString());
                    ;

                    divDetail.Controls.Add(new LiteralControl(MailText));

                }
            }
            catch (Exception ee)
            {

            }
        }
    }
}