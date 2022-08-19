<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RitesAdmitCard.aspx.cs" Inherits="CitizenPortal.WebApp.Temp.RitesAdmitCard" %>

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
                <div style="margin: 0 auto; height: 640px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: 630px; width: 785px; border: 1px solid #000;">

                        <div style="height: 80px; width: 100%; border-bottom: 1px solid #999;">
                            <table style="width: 100%; vertical-align: middle; text-align: center;">
                                <tr>
                                    <td>
                                        <img alt="Logo" src="" style="width: 80px; margin: 10px 0 0 6px;" />
                                    </td>
                                    <td style="text-align: center; vertical-align: middle;">

                                        <span style="text-align: center; font-size: 24px; color: #d43300;">RITES LIMITED</span>
                                        <br />
                                        (Schedule ‘A’ Enterprise of Govt. of India)<br />
                                        <span style="font-size: 18px; font-weight: bolder; text-transform: none;">RITES Bhawan, No. 1, Sector 29, Gurgaon – 122001
                                        </span>
                                    </td>
                                    <td>
                                        <div style="width: 75px; text-align: center; margin: 0 auto;"></div>

                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div style="display: block; overflow: auto; font-size: 20px; font-weight: bolder; padding: 3px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <div style="float: left; text-align: left;">
                                <span style="color: #fff; white-space: nowrap">Provisional Admit Card for Written Test for</span>
                            </div>
                            <div style="float: right; width: 250px; text-align: right;">
                                <b>Roll No.: </b>
                                <span style="font-weight: bolder; text-transform: none; white-space: nowrap;">AK041004</span>
                            </div>
                        </div>

                        <div style="margin: 5px auto; width: 770px; font-size: 12px;">
                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <b style="text-transform: uppercase;">Candidate Details</b></td>
                                    <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: center; vertical-align: middle;">
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 120px; height: 140px" id="ProfilePhoto" />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">
                                        <span>Registration No.</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 150px;">&nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                        <span>Vacancy Code</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 150px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                        <span>Candidate Name</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 175px;">&nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                        <span>Gender</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 175px;">&nbsp;</td>
                                </tr>
                                <tr style="">
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">Category</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                        <span>Date of Birth</span>
                                        &nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr style="">
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <b class="text-uppercase">Candidate Address</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <span>Address Details</span></td>
                                </tr>
                            </table>

                            <table cellpadding="3" cellspacing="0" style="width: 100%; border: none; font-family: Arial; font-size: 11px;">
                                <tr style="font-weight: bold;">
                                    <td style="border: 1px solid #999; padding: 0;">
                                        <div style="clear: both; margin: 0; padding: 0; width: 100%">
                                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 3px; text-align: left; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; white-space: nowrap; font-weight: bold" colspan="2">TEST SCHEDULE (Computer Based Test)</td>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-top: none; border-right: none; border-bottom: none; vertical-align: top">Test Centre Address</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 124px; white-space: nowrap; border-top: none;">Test Date</td>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-top: none; border-right: none; border-bottom: none; white-space: nowrap; width: 140px;">
                                                        <span>12 January 2020</span>
                                                    </td>
                                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; border-top: none; border-right: none; border-bottom: none; vertical-align: top" rowspan="3">&nbsp;</td>
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
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; font-size: 10px; border-bottom: 1px solid #999; padding: 10px; text-align: left; border-top-style: none; border-top-color: inherit; border-top-width: medium;" colspan="3">
                                            <center style="font-weight: bold">                                                
                                                Verification by the Test Room Invigilator
                                            </center>
                                            I, the candidate hereby declare that all the statements made in the application are true, complete and correct to the best of my knowledge and belief, and nothing has been suppressed.
                                            <br />
                                            I understand that in the event of any information being found false at any stage or not satisfying the eligibility criteria according to the requirements of the post, my candidature/appointment is liable to be cancelled / terminated.
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999; padding: 3px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; vertical-align: bottom; width: 33%; font-size: 10px">Candidate’s Signature </td>
                                        <td style="border: 1px solid #999; padding: 3px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; height: 60px; width: 34%">&nbsp;</td>
                                        <td style="border: 1px solid #999; padding: 3px; text-align: center; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; text-align: center; width: 33%">&nbsp;</td>
                                    </tr>
                                    <tr style="font-size:10px">
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
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999; text-align: left; vertical-align: bottom; border-top-style: none; border-top-color: inherit; border-top-width: medium; font-size: 10px" colspan="3">

                                            <ul style="width: 90%; padding-top: 5px">
                                                <li>Candidate is required to put his/her signature on this Admit Card in the given space, ONLY in the presence of Invigilator in the test hall and it will be collected during the test.</li>
                                                <li>Invigilator will verify candidate’s identity and other particulars and sign at the designated places on the Admit Card. He/she will then tear off and retain the upper part and hand over to the candidate the lower part. The candidate must retain the same and produce it for verification while appearing for subsequent stages of the recruitment process, in case he/she is called.</li>
                                                <li>Detailed “Instructions to Candidates” are given on Page-2 of this admit card.</li>

                                            </ul>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </div>

                    </div>
                </div>
                <div style="text-align: center;">-----------------------------------------------------------------------------------------------------------------------------------------------</div>
                <div style="margin: 0 auto; height: 475px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0 auto; height: 470px; width: 785px; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-size: 400px; background-repeat: no-repeat; background-position: center center;">

                        <div style="height: 80px; width: 100%; border-bottom: 1px solid #999;">
                            <table style="width: 100%; vertical-align: middle; text-align: center;">
                                <tr>
                                    <td>
                                        <img alt="Logo" src="" style="width: 80px; margin: 10px 0 0 6px;" />
                                    </td>
                                    <td style="text-align: center; vertical-align: middle;">

                                        <span style="text-align: center; font-size: 24px; color: #d43300;">RITES LIMITED</span>
                                        <br />
                                        (Schedule ‘A’ Enterprise of Govt. of India)<br />
                                        <span style="font-size: 18px; font-weight: bolder; text-transform: none;">RITES Bhawan, No. 1, Sector 29, Gurgaon – 122001
                                        </span>
                                    </td>
                                    <td>
                                        <div style="width: 75px; text-align: center; margin: 0 auto;"></div>

                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div style="display: block; overflow: auto; font-size: 20px; font-weight: bolder; padding: 3px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <div style="float: left; text-align: left;">
                                <span style="color: #fff; white-space: nowrap">Provisional Admit Card for Written Test for</span>
                            </div>
                            <div style="float: right; width: 250px; text-align: right;">
                                <b>Roll No.: </b>
                                <span style="font-weight: bolder; text-transform: none; white-space: nowrap;">AK041004</span>
                            </div>
                        </div>

                        <div style="margin: 5px auto; width: 770px; font-size: 13px;">
                            <table cellpadding="5" cellspacing="0" class="" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" rowspan="5">
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 120px; height: 140px" id="Img1" /></td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="4">
                                        <b style="text-transform: uppercase;">Candidate Details</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">
                                        <span>Application No.</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 150px;">&nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                        <span>Registration No.</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 150px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">
                                        <span>Candidate Name</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;" colspan="2">&nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: right; vertical-align: bottom" rowspan="3">
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign" /></td>
                                </tr>
                                <tr>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                        <span>Gender</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 175px;">&nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                </tr>
                                <tr style="">
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                        <span>Date of Birth</span>
                                    </td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    <td style="padding: 3px; border: 1px solid #999; text-align: right;">&nbsp;</td>
                                </tr>
                            </table>
                            <div style="padding: 5px; text-align: left; font-size: 10px;">
                                <center style="text-align: center; font-weight: bold">Verification by the Test Room Invigilator</center>
                                <br />
                                The candidate whose photo and signature are printed above has appeared for the test on 12 January 2020 from 10.00 AM – 12.30 PM. I, the invigilator have verified the printed photo with the face of the candidate. Also, he/she has signed in my presence and I have verified the same with the printed signature.
                                <br />I, the candidate hereby declare that all the statements made in the application are true, complete and correct to the best of my knowledge and belief, and nothing has been suppressed. I understand that in the event of any information being found false at any stage or not satisfying the eligibility criteria according to the requirements of the post, my candidature/appointment is liable to be cancelled / terminated.

                            </div>
                        </div>
                        <div>
                            <table cellpadding="5" cellspacing="0" style="width: 100%; border: 0; font-size: 10px">
                                <tr>
                                    <td style="border-right: 1px solid #999; border-bottom: 1px solid #999; padding: 5px; text-align: center; white-space: nowrap; border-top: 1px solid #999; vertical-align: bottom; font-size: 10px">Candidate’s Signature</td>
                                    <td style="border-right: 1px solid #999; padding: 5px; text-align: left; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; width: 40%; border-top: 1px solid #999;" rowspan="2">&nbsp;</td>
                                    <td style="border-bottom: 1px solid #999; padding: 5px; text-align: left; white-space: nowrap; border-top-style: none; border-top-color: inherit; border-top-width: medium; height: 60px; text-align: center; border-top: 1px solid #999; vertical-align: bottom">Invigilator’s Signature</td>
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
                            <br />
                            1.	The test is of 125 Objective Type questions and duration of the test will be 150 minutes. 
                        <br />
                            2.	This Admit Card does not constitute an offer of employment.
                        <br />
                            3.	This test is being held in Computer Based mode only. 
                        <br />
                            4.	This e-Call Letter is valid only for the test date and shift time as specified thereon. Any request for change of test date or test centre will not be entertained.
                        <br />
                            5.	Discrepancies, if any, regarding candidate’s particulars in this admit card can be pointed out and emailed at rites@jobapply.in not later than 2nd January 2020.
                        <br />
                            6.	Candidates are advised to locate their test centre and its accessibility at least a day before the test so that they can reach the centre on time on the day of the test.
                        <br />
                            7.	Candidates should report at the examination centre at least 1 hour before commencement of examination time indicated in the Admit Card so as to complete formalities such as identity verification, collection of documents, instructions etc.
                        <br />
                            8.	Indulging in any malpractice/unfair means in the Examination Hall will lead to disqualification.
                        <br />
                            9.	Candidates are advised to locate their test centre and its accessibility at least a day before the test so that they can reach the centre on time on the day of the test.
                        <br />
                            10.	Printed copy of this admit card must be carried to the test centre as entry will not be permitted without the same.
                        <br />
                            11.	If Admit Card does not bear the photograph of the candidate, he/she is required to bring one passport size photograph at the time of written test.
                        <br />
                            12.	Issuance of the Admit Card does not mean that the candidate has been declared to be eligible. The candidates are being provisionally permitted to appear for the Objective Type Test as per the schedule given on Page-1.  The admission at all stages will be subject to his/her satisfying all the eligibility conditions including academic qualification, experience, category, PWD status etc. as mentioned in his/her online application which is subject to verification in the consecutive stages of the selection process or even their after against the eligibility criteria prescribed in the advertisement/ notification. If at any stage it is found that the candidate does not fulfill any of the eligibility conditions, his/her candidature shall stand cancelled.
                        <br />
                            13.	The candidate must bring any valid original Photo ID such as (i) Voter Card, (ii) PAN Card, (iii) Driving License, (iv) Photo ID Card issued by any government organization (v) Passport, (vi) Aadhar Card. for verification at the test centre; without which candidate will not be permitted for the test.
                        <br />
                            14.	Mobile phone, digital/smart watch, bag, handbag, papers, notes, books, calculator, electronic gadgets/equipment, etc. are strictly NOT allowed inside the test centre. 
                        <br />
                            15.	There shall be no arrangements at the Test Centre for keeping the aforesaid items.  If any item is lost, the Test Centre or RITES will not be responsible.  Candidates are, therefore, advised either not to carry the aforementioned items or to make their own arrangements for keeping such items in safe custody outside the Test Centre at their sole risk.  Any candidate found using or in possession of such unauthorized material or indulging in copying or adopting unfair means are liable to be summarily disqualified.
                        <br />
                            16.	Only this admit card, Photo ID card in original and Pen (black/blue) will be allowed inside the test hall. 
                        <br />
                            17.	Candidate should write his/her name and Roll Number on the Rough sheet(s) provided for rough work. The Rough sheet(s) will have to be returned after the test.
                        <br />
                            18.	The question paper will be bilingual (English/Hindi). In case of any dispute in Question content in any language, the English version of that specific Question will be final.
                        <br />
                            19.	There will be NO negative marking for wrong/incorrectly marked answers.
                        <br />
                            20.	No candidate will be allowed to leave the test room before the end of test.
                        <br />
                            21.	Special instructions, if any, given by the Invigilator should be followed strictly.
                        <br />
                            22.	Merely appearing, OR, qualifying in the test does not confer any right on the applicant for claiming selection.
                        <br />
                            23.	The mock test link is available on RITES website. Use this link to familiarize yourself on how to view/answer questions on the exam day.
                        <br />
                            24.	No travelling and/or other expenses would be paid to candidates for attending this test.
                        <br />
                            25.	The candidates with locomotor disability and cerebral palsy where dominant (writing) extremity is affected to the extent of slowing the performance of function (minimum of 40% impairment) and Visual impairment (for Junior Assistant VC No 38/19) will be allowed to write the test with the help of a scribe (to be arranged by the candidate) and compensatory time of 20 minutes per hour will be permitted, provided they bring the Disability Certificate (clearly specifying the category of disability & % of disability) issued from the Competent Authority in the prescribed format as per extant Government of India instructions.
                        <br />
                            26.	Any attempt to influence will lead to disqualification of candidature.
                        <br />
                            27.	RITES reserves the right to order re-test for any or all the candidates.

Decision of RITES in all matters pertaining to this recruitment will be final and binding on all the applicants/ candidates.
                        </p>
                        <center style="font-weight: bold;">COMPUTER BASED TEST INSTRUCTIONS</center>
                        <p style="text-align: justify; margin: 5px auto; padding: 5px; width: 98%">
                            <br />
                            1.	Every question is followed by 4 answer options. Choose the option that is most appropriate. Indicate your answer by clicking on the circle / box adjacent to the option you think is right.
                        <br />
                            2.	You can go to any question directly by clicking on the question number. The answered question number and the un answered / skipped question number will appear in different colours.
                        <br />
                            3.	If you are doubtful of the answer, you can mark a question for review. This will be un marked automatically, once you come back to the same question at a later time.
                        <br />
                            4.	If you want to change your answer to any question, you may select the question and change the answer by clicking on the appropriate answer.
                        <br />
                            5.	Time display at the top of the screen indicates the time throughout the test.
                        <br />
                            6.	The test closes automatically once the allotted time of 150 minutes is over.
                        <br />
                            7.	In case you finish your test before allotted time, you will get a confirmation page which will give you two options. Either to go back to the test or to complete the test.
                        <br />
                            8.	Candidate can submit their exam only after completion 140 min from start time of exam.
                        <br />
                            9.	In case you want to review the answers in the remaining time you can do so, else, you may complete the test and submit.
                        <br />
                            10.	Ensure that you click on submit as a sign on completion. Please be sure before clicking ‘Submit’ that you have completed the test. Once you submit, you will not be able to go back to the test.
                        <br />
                            11.	Once you complete the test, you should be able to see the screen indicating completion of test with a Thank you note.
                        <br />
                            12.	Raise your hand on completion to handover the used rough sheets to the administrator.

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
