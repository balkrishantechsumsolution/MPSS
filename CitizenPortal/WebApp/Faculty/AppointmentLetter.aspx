<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppointmentLetter.aspx.cs" Inherits="CitizenPortal.WebApp.Faculty.AppointmentLetter" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recommended Faculty Acknowledgement</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="../../Scripts/CommonScript.js"></script>

    <script type="text/javascript">
        //$(document).ready(function () {
        function CallPrint(strid) {
            debugger;
            var prtContent = document.getElementById('divPrint');
            var WinPrint = window.open('', '', 'letf=0,top=0,width=900,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }

        function TakeAction(p_AppID) {
            //alert(p_URL, p_ServiceID, p_AppID);
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Faculty/FacultyPage.aspx";
            t_URL = t_URL + "?ProfileID=" + p_AppID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=1000,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }
        //});
    </script>
    </head>
<body>
    <form id="form1" runat="server">
        <%--<div id="divPrint" style="margin: 0 auto; width: 90%; /*height: 1220px; overflow: auto; */">
            <div style="width: 100%; height: auto; font-family: Arial; border: 2px solid #b0b0b0; padding: 1px; margin: 0 auto;">
                <div style="background-image: url(''); background-size: 590px; border: 1px solid #b0b0b0; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; margin: 2px auto;">
                    <div style="width: 100%;">
                        <table style="width: 100%;">
                            <tr>
                                <td colspan="2" style="text-align: center; font-size: 10px">Confidential & most Urgent</td>
                            </tr>
                            <tr style="">
                                <td style="width: 150px;">
                                    <div style="width: 150px; margin: 5px 0 0 5px; float: left;">
                                        <img src="http://csvtu.digivarsity.online/Sambalpur/img/sambalpur-university-logo.png" alt="Logo" style="width: 75px; margin: 5px 30px" />
                                    </div>
                                </td>
                                <td style="font-size: 19px; font-weight: bold; text-align: center; white-space: nowrap;">CHHATTISGARH SWAMI VIVEKANAND<span>TECHNICAL UNIVERSITY, BHILAI</span><br />
                                    <span style="font-weight: normal; font-size: 15px">Newai, PO Nnewi, Distt. Drug (CG) 491107</span><br />
                                    <span style="font-size: 12px;">Exam Cell: 0788-2445017, 0788-2445024 (Phone)</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="background-color: #808080; border: 1px solid #565555; border-left: none; border-right: none; color: #fff;">
                    </div>
                    <div style="margin: 10px; width: 100%; height: auto; font-size: 13px;">
                        <div style="text-align: left">
                            <table style="width: 98%">
                                <tr>
                                    <td style="width: 24%; text-align: left; white-space: nowrap">Letter No.:&nbsp;<b>#LetterNo</b> </td>
                                    <td style="width: 24%; text-align: center">&nbsp;</td>
                                    <td style="width: 24%; text-align: center">&nbsp;</td>
                                    <td style="width: 24%; text-align: left; white-space: nowrap">Date: <b>#LetterDate</b></td>
                                </tr>
                            </table>
                        </div>
                        <div>

                            <table>
                                <tr>
                                    <td style="width: 50px">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px; text-align: right">To,</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 50px">&nbsp;</td>
                                    <td>#Faculty
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>#Designation
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

                            <table style="width: 98%">
                                <tr>
                                    <td style="width: 50px">&nbsp;</td>
                                    <td>Subject
                                    <span style="font-weight bold; font-style italic;">Appointment for setting of Question Paper & providing solution to the Questions.</span>
                                    </td>
                                    <td style="width: 50px">&nbsp;</td>
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
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: left">Max Marks:<b>#Maximum</b></td>
                                                <td style="text-align: center">Minimum Pass Mark: <b>#Minimum</b></td>
                                                <td style="text-align: center">Duration: <b>#Duration</b></td>
                                                <td style="text-align: right">Scheme: <b>#Scheme</b></td>
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
                                    <td>
                                        <table style="border: 1px solid #999999;width:100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <th style="border: 1px solid #999999; background-color: #C0C0C0;">Sl. No.</th>
                                                <th style="border: 1px solid #999999; background-color: #C0C0C0;">Subject Code</th>
                                                <th style="border: 1px solid #999999; background-color: #C0C0C0;">Subject Name</th>
                                                <th style="border: 1px solid #999999; background-color: #C0C0C0;">Semester</th>
                                                <th style="border: 1px solid #999999; background-color: #C0C0C0;">Program</th>
                                                <th style="border: 1px solid #999999; background-color: #C0C0C0;">Course</th>
                                            </tr>
                                            <tr>
                                                <td style="border: 1px solid #999999">&nbsp;</td>
                                                <td style="border: 1px solid #999999">&nbsp;</td>
                                                <td style="border: 1px solid #999999">&nbsp;</td>
                                                <td style="border: 1px solid #999999">&nbsp;</td>
                                                <td style="border: 1px solid #999999">&nbsp;</td>
                                                <td style="border: 1px solid #999999">&nbsp;</td>
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
                                    <td>Sir/Madam, to provide your acceptance or refusal you are request login into below university portal, the details are as below:

                                    <br />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td style="white-space:nowrap">Web portal URL</td>
                                                <td style="white-space:nowrap">#WebSiteURL</td>
                                                <td rowspan="4" style="text-align: center; color: maroon">* For assistance in using the portal you are requested to call at below no.</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td>Login Type</td>
                                                <td>#LoginType</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td style="white-space:nowrap">Login ID</td>
                                                <td style="white-space:nowrap">#LoginID</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td style="white-space:nowrap">Password</td>
                                                <td style="white-space:nowrap">#Password</td>
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
                                    <td>In case you are unable to accept the appointment, it is requested that all the papers sent may please be returned with your refusal letter in enclosed format.</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="">It is requested that only one question paper be prepared in accordance with the enclosed syllabus.
                                    It may kindly be noted that for Diploma courses of Polytechnic, Hindi version of each question is to be given immediately below the English version.
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
                                        <table style="width: 100%">
                                            <tr>
                                                <td>(i) </td>
                                                <td>Average Level - </td>
                                                <td>&nbsp;40%</td>
                                                <td rowspan="3" style="text-align: center">Please go through the syllabus of the subject before setting the questions.</td>
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
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>The manuscript of the question paper & solution to the questions should be kept in separate envelop marked ‘C’ & ‘E’respectively.These should be sealed & kept in envelop ‘8’, in which the declaration form duly filled in should ‘also be kept. The envelope containing all the above documents should be sealed properly and delivered in person or sent through registered post insured for Rs. 100/- to the undersigned by the due date. |</td>
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
                                    <td><b>Due Date of Receipt of Manuscript at CSVTU: 05/12/2021</b></td>
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
                                    <td>&nbsp;</td>
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
            <div style="page-break-after: always"></div>

            <div style="font-family: Arial; padding: 1px; margin: 0 auto; border: 2px solid #b0b0b0;">
                <div style="background-image: url(''); background-size: 590px; border: 1px solid #b0b0b0; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; margin: 2px auto;">
                    <div style="width: 100%;">
                        <table style="width: 100%;">
                            <tr>
                                <td colspan="2" style="text-align: center; font-size: 10px">&nbsp;</td>
                            </tr>
                            <tr style="">
                                <td style="width: 150px;">
                                    <div style="width: 150px; margin: 5px 0 0 5px; float: left;">
                                        <img src="/Sambalpur/img/sambalpur-university-logo.png" alt="Logo" style="width: 75px; margin: 5px 30px" />
                                    </div>
                                </td>
                                <td style="font-size: 22px; font-weight: bold; text-align: center; white-space: nowrap;">CHHATTISGARH SWAMI VIVEKANAND<span>TECHNICAL UNIVERSITY, BHILAI</span><br />
                                    <span style="font-weight: normal; font-size: 20px">Newai, PO Nnewi, Distt. Drug (CG) 491107</span><br />
                                    <span style="font-size: 15px;">Exam Cell: 0788-2445017, 0788-2445024 (Phone)</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="background-color: #808080; border: 1px solid #565555; border-left: none; border-right: none; color: #fff;">
                    </div>
                    <div style="margin: 10px; width: 100%; height: auto; font-size: 13px;">
                        <div>

                            <table style="width: 98%">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="">
                                        <table style="float: left">
                                            <tr>
                                                <td style="text-align: left">Course &amp; Semester: </td>
                                                <td style="text-align: left"><b>#CurseSemester</b></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left">Brancht :</td>
                                                <td style="text-align: left"><b>#Branch</b></td>
                                            </tr>
                                        </table>
                                        <table style="float: right">
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td style="text-align: left">Subject Code : </td>
                                                <td style="text-align: left"><b>#SubjectCode</b></td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td style="text-align: left">Part Time Subject :</td>
                                                <td style="text-align: left"><b>#Parttime</b></td>
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
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align left">Max Marks:<b>#Maxium</b></td>
                                                <td style="text-align center">Minimum Pass Mark: <b>#Minimum</b></td>
                                                <td style="text-align center">Duration: <b>#Duration</b></td>
                                                <td style="text-align right">Scheme: <b>#Scheme</b></td>
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
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>

                        </div>

                    </div>
                </div>

            </div>
        </div>--%>

        <div id="divDetail" runat="server">

    <div id="divPrint" style="margin: 0 auto; width: 90%; /*height: 1220px; overflow: auto; */">
        <div style="width: 100%; height: auto; font-family: Arial; border: 2px solid #b0b0b0; padding: 1px; margin: 0 auto;">
            <div style="background-image: url(''); background-size: 590px; border: 1px solid #b0b0b0; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; margin: 2px auto;">
                <div style="width: 100%;">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="2" style="text-align: center; font-size: 10px">Confidential & most Urgent</td>
                        </tr>
                        <tr style="">
                            <td style="width: 150px;">
                                <div style="width: 150px; margin: 5px 0 0 5px; float: left;">
                                    <img src="http://csvtu.digivarsity.online/Sambalpur/img/sambalpur-university-logo.png" alt="Logo" style="width: 75px; margin: 5px 30px" />
                                </div>
                            </td>
                            <td style="font-size: 19px; font-weight: bold; text-align: center; white-space: nowrap;">
                                CHHATTISGARH SWAMI VIVEKANAND <br/>TECHNICAL UNIVERSITY, BHILAI<br />
                                <span style="font-weight: bold; font-size: 12px">Newai, PO Nnewi, Distt. Drug (CG) 491107</span><br />
                                <span style="font-size: 12px;font-weight: normal;">Exam Cell: 0788-2445017, 0788-2445024 (Phone)</span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="background-color: #808080; border: 1px solid #565555; border-left: none; border-right: none; color: #fff;">
                </div>
                <div style="margin: 10px; width: 100%; height: auto; font-size: 13px;">
                    <div style="text-align: left">
                        <table style="width: 98%">
                            <tr>
                                <td style="width: 24%; text-align: left; white-space: nowrap">Letter No.:&nbsp;<b>#LetterNo</b> </td>
                                <td style="width: 24%; text-align: center">&nbsp;</td>
                                <td style="width: 24%; text-align: center">&nbsp;</td>
                                <td style="width: 24%; text-align: left; white-space: nowrap">Issue Date: <b>#LetterDate</b></td>
                            </tr>
                        </table>
                    </div>
                    <div>

                        <table>
                            <tr>
                                <td style="width: 50px">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 50px; text-align: right">To,</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 50px">&nbsp;</td>
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

                        <table style="width: 98%">
                            <tr>
                                <td style="width: 50px">&nbsp;</td>
                                <td>
                                    Subject : 
                                    <span style="font-weight bold; font-style italic;">Appointment for setting of Question Paper & providing solution to the Questions.</span>
                                </td>
                                <td style="width: 50px">&nbsp;</td>
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
                                    <table style="width: 100%;display:none;">
                                        <tr>
                                            <td style="text-align: left">Max Marks:<b>#Maximum</b></td>
                                            <td style="text-align: center">Minimum Pass Mark: <b>#Minimum</b></td>
                                            <td style="text-align: center">Duration: <b>#Duration</b></td>
                                            <td style="text-align: right">Scheme: <b>#Scheme</b></td>
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
                                    Sir/Madam, to provide your acceptance or refusal you are requested as to login into below university portal, the details are as below:

                                    <br />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <table style="width: 100%">
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style="white-space:nowrap">Web portal URL</td>
                                            <td style="white-space:nowrap">#WebSiteURL</td>
                                            <td rowspan="4" style="text-align: center; color: maroon">* For assistance in using the portal you are requested to call at #HelpNo</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style="white-space:nowrap">Login Type</td>
                                            <td style="white-space:nowrap">#LoginType</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td style="white-space:nowrap">Login ID</td>
                                            <td style="white-space:nowrap">#LoginID</td>
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
                                <td style="">
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
                                    <table style="width: 100%">
                                        <tr>
                                            <td>(i) </td>
                                            <td>Average Level - </td>
                                            <td>&nbsp;40%</td>
                                            <td rowspan="3" style="text-align: center">Please go through the syllabus of the subject before setting the questions.</td>
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
                                <td>The manuscript of the question paper & solution to the questions should be kept in separate envelope marked ‘C’ & ‘E’respectively.These should be sealed & kept in envelop ‘B’, in which the declaration form duly filled in should ‘also be kept. The envelope containing all the above documents should be sealed properly and delivered in person or sent through registered post insured for Rs.100/- to the undersigned by the due date. </td>
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
                                <td>Set Q.P. is to be send in softcopy at email "<b style="font-size:15px;">gopniya@csvtu.ac.in</b>"</td>
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


        </div>



        <div id="divBtn" runat="server" style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" style="background-color: #0040FF; color: #fff; border: none; border-radius: 3px; padding: 10px 18px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
    </form>
</body>
</html>
