<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.EmailTemplate.Acknowledgement" %>

<!DOCTYPE html>

<html>
<head>
    <title>Application Status from Sambalpur University</title>
</head>
<body>
    <div>
        <div style='margin: 5% 5%; border: 1px solid #E0E0E0; background-color: #fff; font-family: Arial'>
            <table style='padding: 1% 0; width: 100%'>
                <tr>
                    <td align='left'>
                        <img src='https://www.sambalpur.lokaseba-odisha.in/WebApp/Kiosk/Images/sambalpur-university-logo.png' alt='Sambalpur University'
                            style='margin-left: 15%; height: 70px;' />
                    </td>
                    <td style='text-align: center;'>
                        <div style='font-family: Arial; font-size: 25px; font-weight: bolder; color: #800000'>SAMBALPUR UNIVERSITY</div>
                        <div style='font-size: 13px; font-weight: normal; padding: 5px;'>Accredited with Grade-A by NAAC (Second Cycle)</div>
                        <div style='font-size: 16px; font-weight: normal; text-transform: uppercase; font: 15px; font-weight: bold; color: #003500'>Jyoti Vihar, Burla</div>
                    </td>
                    <td align='right'>
                        <img src='https://www.lokaseba-odisha.in/g2c/img/lokaseba_logo.png' alt='LOKASEBA ADHIKARA'
                            style='margin-right: 15%; height: 70px;' />
                    </td>
                </tr>
            </table>

            <div style='position: relative; background: #10A5DF; border: 1px solid #0C7FB5;'>
                <h1 style='line-height: normal; text-align: center; text-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); font-family: arial; font-size: 20px; color: #FFFFFF; text-transform: uppercase;'>Application Status</h1>
            </div>
            <div style='margin: 5% 5% 0; font-family: Arial;'>
                <p>
                    Dear @Name,
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 15pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                </p>
                <b><span style='color: rgb(0, 112, 192); font-family: Arial;'>Your Application for @SvcName is @Status.</span></b><p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <span style='color: rgb(13, 13, 13);'>&nbsp;</span>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Please find the details
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    APPLICATION NO. : <b>@ReferenceID</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Action By : <b>@Action</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Status : <b>@Status</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Date of Action : <b>@ActionOn</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Resason : <b>@Reason</b>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Visit website&nbsp; <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp;  <a href='@Weblink2' target='_blank'>@Weblink2</a> for other details
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>
            </div>
            <div style='margin: 0 5% 5%;'>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    &nbsp;
                </p>

                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <span style='color: rgb(13, 13, 13);'>Regards</span>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    <span class=''>SAMBALPUR UNIVERSITY</span><span style='color: rgb(13, 13, 13); font-weight: bold;'>, </span><span style='font-weight: bold; color: rgb(13, 13, 13);'>Burla</span>
                </p>
                <p class='MsoNormal'
                    style='margin: 0in 0in 0.0001pt; font-size: 11pt; font-family: Calibri, sans-serif; color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(253, 253, 253);'>
                    Website : <a href='@Weblink1'>@Weblink1</a>&nbsp; OR&nbsp;  <a href='@Weblink2' target='_blank'>@Weblink2</a>
                </p>
            </div>
        </div>
    </div>
</body>
</html>
