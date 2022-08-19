<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginDetails.aspx.cs" Inherits="CitizenPortal.EmailTemplate.LoginDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            color: rgb(13, 13, 13);
        }
        .auto-style2 {
            font-family: arial;
            font-size: 20px;
            color: #FFFFFF;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style='margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff; font-family: Arial'>
                <table style='padding: 1% 0; width: 100%'>
                    <tr>
                        <td align='left'>
                            <img src="../WebApp/Kiosk/Images/sambalpur-university-logo.png" alt='LOKASEBA ADHIKARA'
                                style='margin-left: 15%; height: 70px;' />
                        </td>
                        <td style="text-align: center;">
                            <div style="font-family: Arial; font-size: 25px; font-weight: bolder; color: #800000">SAMBALPUR UNIVERSITY</div>
                            <div style="font-size: 13px; font-weight: normal; padding: 5px;">Accredited with Grade-A by NAAC (Second Cycle)</div>
                            <div style="font-size: 16px; font-weight: normal; text-transform: uppercase; font: 15px; font-weight: bold; color: #003500">Jyoti Vihar, Burla</div>
                        </td>
                        <td align='right'>
                            <img src='https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png' alt='OUAT'
                                style='margin-right: 15%; height: 70px;' />
                        </td>
                    </tr>
                </table>

                <div style='position: relative; background: #10A5DF; border: 1px solid #0C7FB5;'>
                    <h1 style='line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); ' class="auto-style2">@Subject</h1>
                </div>
                <div style='margin: 5% 5% 0; font-family: Arial;'>
                    <p>
                        Dear @Name,
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    </p>
                    <b><span style='color: rgb(0, 112, 192); font-family: Arial;'>You have sucessfully submitted the Application for Enrollment into +3 Examination for 2017.</span></b><p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <span style='color: rgb(13, 13, 13);'>&nbsp;</span>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        Please find the details</p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        ADMISSION NO : <b>@AdmissionNo</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        APPLICATION NO. : <b>@ReferenceID</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        LOGIN ID : <b>@Login</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        PASSWORD : <b>@Password</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        COLLEGE : <b>@ExamCentre</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        BRANCH : <b>@Branch</b>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        You are requested to visit website&nbsp; <a href='http://ouat.ac.in'>http://sambalpuruniversity.ac.in</a>&nbsp; OR&nbsp;  <a href='https://lokaseba-odisha.in' target='_blank'>https://lokaseba-odisha.in</a> to check the application status and other notice.
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 12pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        LOGIN DETAILS SHALL BE USED FOR&nbsp; :
                    </p>
                    <ol class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <li>Information about <strong>Roll No.</strong> &amp; <strong>Registration No.</strong> generation</li>

                        <li class='MsoNormal'
                            style='margin: 0in 0in 0.0001pt; font-variant: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>Filling up the <strong>Examination Form</strong></li>
                        <li>

                            <strong>Making payment</strong> for the application</li>
                        <li>

                            Checking <strong>Result</strong></li>
                        <li>

                            Request for <strong>Supply of Answer Sheet</strong></li>
                        <li>

                            Request for <strong>Retotaling</strong></li>
                        <li>

                            And also for generating request for <strong>Counter Based Application</strong></li>
                    </ol>
                </div>
                <div style='margin: 0 5% 5%;'>
                    <p style='font-family calibri, sans-serif; font-size: 20px; !important; color :red; letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                        <strong>PLEASE NOTE:</strong> <br />If tha <strong>ACKNOWLEDGMENT</strong> is not Submitted to College then Examination <strong>ROLL NO</strong> and <strong>REGISTRATION NO</strong> shall <strong>NOT be GENERATED</strong> and you not be allowed to apear in examination.</p>
                    <p style='font-family calibri, sans-serif; font-size 11pt; color rgb(0, 0, 0); letter-spacing normal; margin 0in 0in 0.0001pt; font-variant normal; line-height normal; orphans auto; text-align start; text-indent 0px; white-space normal; widows auto; word-spacing 0px; -webkit-text-stroke-width 0px; background-color rgb(253, 253, 253);'>
                        Last date for submission of ACKNOWLEDGMENT FORM is <strong>Monday, 16th November 2017</strong></p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        &nbsp;</p>

                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <span style='color: rgb(13, 13, 13);'>Regards</span>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        <span class="auto-style1">SAMBALPUR UNIVERSITY</span><span style='color: rgb(13, 13, 13); font-weight: bold;'>, </span><span class="auto-style1">Burla</span>
                    </p>
                    <p class='MsoNormal'
                        style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                        Website : <a href='http://ouat.ac.in'>http://sambalpuruniversity.ac.in</a>&nbsp; OR&nbsp; <a href='https://lokaseba-odisha.in' target='_blank'>https://lokaseba-odisha.in</a>
                    </p>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
