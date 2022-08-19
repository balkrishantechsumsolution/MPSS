<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhDAdmitCard.aspx.cs" Inherits="CitizenPortal.WebApp.Entrance.PhD.PhDAdmitCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function EPassPrint(strid) {
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }


    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="divPrint" style="margin: 0 auto; width: 800px;">
                <div style="margin: 0 auto; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; width: 785px; border: 1px solid #000;">

                        <div style="height: 80px; width: 100%; border-bottom: 1px solid #999;">
                            <table style="width: 100%; vertical-align: middle; text-align: center;">
                                <tr>
                                    <td>
                                        <img alt="Logo" src="/Sambalpur/img/sambalpur-university-logo.png" style="width: 55px; margin: 6px 0 0 6px" />
                                    </td>
                                    <td style="text-align: center; vertical-align: middle; padding-top: 10px">

                                        <span style="text-align: center; font-size: 20px; color: #d43300; font-weight: bold">CHHATTISGARH SWAMI VIVEKANAND<br />
                                            TECHNICAL UNIVERSITY, BHILAI</span>
                                        <br />
                                        <span style="font-size: 18px; font-weight: bolder; text-transform: none;">ADMIT CARD
                                        </span>
                                    </td>
                                    <td>
                                        <img alt="Logo" src="/Sambalpur/img/DigiVarsity.png" style="width: 55px; margin: 6px 0 0 6px" />

                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div style="display: block; overflow: auto; font-size: 20px; font-weight: bolder; padding: 3px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <div style="float: left; text-align: left;">
                                <span style="color: #fff; white-space: nowrap">Ph.D Entrance Examination-2020</span>
                            </div>
                            <div style="float: right; width: 250px; text-align: right;">
                                <b>Roll No.: </b>
                                <span style="font-weight: bolder; text-transform: none; white-space: nowrap;">
                                        <asp:Label ID="lblRollNo" runat="server" Text="AK041004"></asp:Label>
                                    </span>
                            </div>
                        </div>

                        <div style="margin: 5px auto; width: 770px; font-size: 12px;">
                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <b style="text-transform: uppercase;">APPLICANT DETAILs</b></td>
                                    <td rowspan="7" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: middle;">
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 120px; height: 140px" id="ProfilePhoto" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">Appliction<span> No.</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 150px;"><b>
                                        <asp:Label ID="AppID" runat="server"></asp:Label></b></td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">Exam Type
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 150px;">
                                        <b>
                                            <asp:Label ID="lblType" runat="server"></asp:Label></b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                        <span>Applicant Name</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="ApplicantName" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                        <span>Gender</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="gender" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="">
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">Category</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Category" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                        <span>Date of Birth</span>
                                        &nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="DOBConverted" runat="server"></asp:Label></td>
                                </tr>
                                <tr style="">
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">Discipline</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblDiscipline" runat="server"></asp:Label></td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap">Specialization</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblSpecialization" runat="server"></asp:Label></td>
                                </tr>
                                <tr style="">
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <b class="text-uppercase">Applicant Address</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <span><asp:Label ID="lblAddress" runat="server"></asp:Label></span></td>
                                </tr>
                            </table>

                            <table cellpadding="3" cellspacing="0" style="width: 100%; border: none; font-family: Arial; font-size: 11px;">
                                <tr style="font-weight: bold;">
                                    <td style="border: 1px solid #999; padding: 0;">
                                        <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 3px; text-align: left; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; white-space: nowrap; font-weight: bold" colspan="2">TEST SCHEDULE</td>
                                                    <td style="padding: 3px; border: 1px solid #999; vertical-align: top">Test Centre Address</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 124px; white-space: nowrap; border-top: none;">Test Date</td>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-top: none; border-right: none; border-bottom: none; white-space: nowrap; width: 140px;">
                                                        <span>13th November 202</span>1
                                                    </td>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-top: none; border-right: none; border-bottom: none; vertical-align: top" rowspan="3">
                                                        <asp:Label ID="lblExamCenter" runat="server" Text="Bhilai Institute Of Technology - Durg"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 124px; white-space: nowrap; border-top: none;">Test Timing</td>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-top: none; border-right: none; border-bottom: none; white-space: nowrap; width: 140px;">
                                                        <span>(10.00 AM – 12.30 PM)</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-bottom: none;">
                                                        <span>Reporting Time</span></td>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-right: none; border-bottom: none;">
                                                        <span>9:00 AM (Morning)</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-bottom: none; white-space: nowrap">
                                                        <b>Gate Closing Time</b></td>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-right: none; border-bottom: none; white-space: nowrap" colspan="2">9.30 AM (After gate closing time, entry will not be permitted under any circumstances)</td>
                                                </tr>
                                            </table>

                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                <table cellspacing="0" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; font-size: 10px; border-bottom: 1px solid #999; padding: 5px; text-align: left; border-top-style: none; border-top-color: inherit; border-top-width: medium;" colspan="3">
                                            <center style="font-weight: bold;padding-bottom:2px"> Verification by the Examination Room Invigilator</center>
                                            I, the Applicant hereby declare that all the statements made in the application are true, complete and correct to the best of my knowledge and belief, and nothing has been suppressed.
                                            <br />
                                            I understand that in the event of any information being found false at any stage or not satisfying the eligibility criteria according to the requirements of the post, my candidature/appointment is liable to be cancelled / terminated.
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 3px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; vertical-align: bottom; width: 33%; font-size: 10px">Applicant’s Signature </td>
                                        <td style="border: 1px solid #999; padding: 3px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; height: 60px; width: 34%">&nbsp;</td>
                                        <td style="border: 1px solid #999; padding: 3px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: center; width: 33%">&nbsp;</td>
                                    </tr>
                                    <tr style="font-size: 10px">
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">
                                            <span>(Sign in the presence of Invigilator only)</span></td>
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">
                                            <span>Test Centre Seal</span>
                                        </td>
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">
                                            <span>Signature of the Invigilator</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: left; vertical-align: bottom; border-top-style: none; border-top-color: inherit; border-top-width: medium; font-size: 10px;padding-bottom:5px;" colspan="3">

                                            <ul style="width: 90%;">
                                                <li>Applicant is required to put his/her signature on this Admit Card in the given space, ONLY in the presence of Invigilator in the test hall and it will be collected during the test.</li>
                                                <li>Invigilator will verify Applicant’s identity and other particulars and sign at the designated places on the Admit Card. He/she will then tear off and retain the upper part and hand over to the Applicant the lower part. The Applicant must retain the same and produce it for verification while appearing for subsequent stages of the recruitment process, in case he/she is called.</li>
                                                <li>Detailed “Instructions to Applicants” are given on Page-2 of this admit card.</li>

                                            </ul>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </div>

                    </div>
                </div>
                <div style="text-align: center;">-----------------------------------------------------------------------------------------------------------------------------------------------<asp:Label ID="lblMsg" runat="server" Style="color: red; font-size: 20px;" Text=""></asp:Label>                    

                    </div>
                <div style="margin: 0 auto; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; width: 785px; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-size: 400px; background-repeat: no-repeat; background-position: center center;">

                        <div style="height: 80px; width: 100%; border-bottom: 1px solid #999;">
                            <table style="width: 100%; vertical-align: middle; text-align: center;">
                                <tr>
                                    <td>
                                        <img alt="Logo" src="/Sambalpur/img/sambalpur-university-logo.png" style="width: 55px; margin: 6px 0 0 6px" />
                                    </td>
                                    <td style="text-align: center; vertical-align: middle; padding-top: 10px">

                                        <span style="text-align: center; font-size: 20px; color: #d43300; font-weight: bold">CHHATTISGARH SWAMI VIVEKANAND<br />
                                            TECHNICAL UNIVERSITY, BHILAI</span>
                                        <br />
                                        <span style="font-size: 18px; font-weight: bolder; text-transform: none;">ADMIT CARD
                                        </span>
                                    </td>
                                    <td>
                                        <img alt="Logo" src="/Sambalpur/img/DigiVarsity.png" style="width: 55px; margin: 6px 0 0 6px" />

                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div style="display: block; overflow: auto; font-size: 20px; font-weight: bolder; padding: 3px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <div style="float: left; text-align: left;">
                                <span style="color: #fff; white-space: nowrap">Provisional Admit Card for Written Test for</span>
                            </div>
                            <div style="float: right; width: 250px; text-align: right;">
                                <b>Roll No.: 
                                <span style="font-weight: bolder; text-transform: none; white-space: nowrap;">
                                        <asp:Label ID="lblRollNo0" runat="server" Text="AK041004"></asp:Label>
                                    </span>
                                </b>
                                &nbsp;</div>
                        </div>

                        <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;width: 125px" rowspan="7">
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 120px; height: 140px" id="ProfilePhoto0" /></td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <b style="text-transform: uppercase;">APPLICANT DETAILs</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;white-space:nowrap">
                                        Application No.
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 150px;"><b>
                                        <asp:Label ID="AppID0" runat="server"></asp:Label></b></td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">Exam Type</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 150px;"><b>
                                            <asp:Label ID="lblType0" runat="server"></asp:Label></b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;white-space:nowrap">Applicant Name
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="ApplicantName0" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: right; vertical-align: bottom">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                        <span>Gender</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="gender0" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">Category</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; vertical-align: bottom">
                                        <asp:Label ID="Category0" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="">
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                        <span>Date of Birth</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="DOBConverted0" runat="server"></asp:Label></td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: center; vertical-align: bottom;font-size:8px;" rowspan="3">
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign0" />
                                        Applicant's Signature
                                    </td>
                                </tr>
                                <tr style="">
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">Discipline</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblDiscipline0" runat="server"></asp:Label></td>
                                </tr>
                                <tr style="">
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">Specialization</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblSpecialization0" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                            <div style="padding: 2px; text-align: left; font-size: 10px;">
                                <center style="text-align: center; font-weight: bold;padding:2px 0 2px 0;">Verification by the Test Room Invigilator</center>
                                
                                The candidate whose photo and signature are printed above has appeared for the test on 13th November 2021 from 10.00 AM – 12.30 PM. I, the invigilator have verified the printed photo with the face of the candidate. Also, he/she has signed in my presence and I have verified the same with the printed signature.
                                <br />
                                I, the candidate hereby declare that all the statements made in the application are true, complete and correct to the best of my knowledge and belief, and nothing has been suppressed. I understand that in the event of any information being found false at any stage or not satisfying the eligibility criteria according to the requirements of the post, my candidature/appointment is liable to be cancelled / terminated.

                            </div>
                        </div>
                        <div>
                            <table cellpadding="5" cellspacing="0" style="width: 100%; border: 0; font-size: 10px">
                                <tr>
                                    <td style="border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 5px; text-align: center; white-space: nowrap; border-top: 1px solid #999; vertical-align: bottom; font-size: 10px;width:33%">Candidate’s Signature</td>
                                    <td style="border-right: 1px solid #999; padding: 5px; text-align: left; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 40%; border-top: 1px solid #999;" rowspan="2">&nbsp;</td>
                                    <td style="border-bottom: 1px solid #999; padding: 5px; text-align: left; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; height: 60px; text-align: center; border-top: 1px solid #999; vertical-align: bottom;width:33%">Invigilator’s Signature</td>
                                </tr>
                                <tr>
                                    <td style="border-right: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium;">(To sign in the presence of Invigilator)</td>
                                    <td style="text-align: center; vertical-align: bottom; white-space: nowrap;">(With Test Centre Seal)</td>
                                </tr>
                            </table>
                        </div>

                    </div>
                </div>

                <div style="page-break-after: always">
                    <br />
                </div>
                <div style="margin: 0 auto; height: 1100px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: 1090px; width: 785px; line-height: 16.5px; font-size: 10px; padding: 5px; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-size: 400px; background-repeat: no-repeat; background-position: center center;">
                        <br />
                        <center style="font-weight: bold"> INSTRUCTIONS TO CANDIDATES</center>
                        <p style="text-align: justify; margin: 5px auto; padding: 5px; width: 98%">
                            
<br/>1.	The question paper is divided into two sections: Section I and Section II.
<br/>2.	Section I of the question paper contains 40 multiple choice questions carrying one mark each.
<br/>3.	Section II of the question paper contains 60 multiple choice questions of 01 mark each.
<br/>4.	Candidates are required to shade the circle corresponding to correct answer in the OMR Sheet provided.
<br/>5.	No marks will be deduced for the wrong answer.
<br/>6.	The candidates are to write their roll nos. only in the space provided. Writing roll nos. in other spaces is strictly prohibited.
<br/>7.	Any special remarks/sign/slogan may lead to cancellation of the candidature.
<br/>8.	Candidates are required to go through the instructions thoroughly and are to follow the right spirit of the Test. Nonconforming with the instructions will be handled strictly.
<br/>9.	Examinee is forbidden to take any book, Notes or loose paper into the examination hall except Admit Card.
<br/>10.	No communication what so ever, will be allowed during the examination amongst examinees and/or with outsider.
<br/>11.	Examinee is forbidden to write answer or anything else on question paper or any loose paper.
<br/>12.	Examinee is forbidden to carry any electronic Item including cell phones into the examination hall.
<br/>13.	Examinee is allowed to carry scientific calculator (Non Programmable) into the examination hall.
<br/>14.	Discrepancies if any in the Question Paper should be reported to University (Exam Cell) in writing by the candidate within 24 hours of completion of the Exam.

</p>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div class="box-body box-body-open" style="text-align: center;">
                <input type="button" id="btnPrint" class="btn btn-success" value="Print" onclick="javascript: EPassPrint('divPrint');" />
            </div>
        </div>
    </form>
</body>
</html>
