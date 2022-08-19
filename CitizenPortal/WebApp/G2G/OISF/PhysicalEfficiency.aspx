<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhysicalEfficiency.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PhysicalEfficiency" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/CommonScript.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">

                <div id="divPrint" style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1110px; width: 794px; padding: 3px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: 1104px; width: 785px; border: 1px solid #000; background-image: url('/webapp/kiosk/images/bgLogo.png'); background-size: 300px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 95px; width: 100%; border-bottom: 1px solid #999;">
                                <table style="width: 100%; vertical-align: middle; text-align: center;">
                                    <tr>
                                        <td>
                                            <img alt="Logo" src="/webapp/kiosk/oisf/img/odisha_policelogo.jpg" style="width: 90px;" />
                                        </td>
                                        <td style="text-align: center">
                                            <table cellpadding="0" cellspacing="0" border="1" align="center" >
                                                <tr>
                                                    <td>Roll No.: </td>
                                                    <td style="width: 15px; padding: 1px;text-align:center">E</td>
                                                    <td style="width: 15px; padding: 1px;text-align:center">1</td>
                                                    <td style="width: 15px; padding: 1px;text-align:center">0</td>
                                                    <td style="width: 15px; padding: 1px;text-align:center">0</td>
                                                    <td style="width: 15px; padding: 1px;text-align:center">0</td>
                                                    <td style="width: 15px; padding: 1px;text-align:center">0</td>
                                                    <td style="width: 15px; padding: 1px;text-align:center">1</td>
                                                    <td style="width: 15px; padding: 1px;text-align:center">1</td>
                                                </tr>
                                            </table>
                                            <span style="text-align: center; font-size: 20px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</span>
                                            <br />
                                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">Recruitment of Constable</asp:Label>
                                            <br />
                                            <span id="lblDeptName" runat="server" style="font-size: 18px; font-weight: bold;">Physical Efficiency Examination - 2016</span></td>
                                        <td>
                                            <div style="width: 75px; text-align: center; margin: 0 auto;">
                                                <uc1:QRCode runat="server" ID="QRCode1" style="width: 80px !important" />
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Header section ---------%>
                            <%---------Start Title section --------%>
                            <div style="margin: 5px auto; width: 770px; font-size: 13px; vertical-align: top">
                                <table style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 60%; vertical-align: top">
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" rowspan="7">
                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 130px; height: 160px" id="ProfilePhoto" />
                                                        <br />Applicant's Photo 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                                        <b style="text-transform: uppercase;">Applicant Details</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="Label5" runat="server" Text="Application ID"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 300px;">
                                                        <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 135px;">
                                                        <asp:Label ID="Label7" runat="server" Text="Application Date"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAppDate" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap; width: 135px;">
                                                        <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblFather1" runat="server">Father Name</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblFather" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Mobile No.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" rowspan="3">
                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 130px; height: 54px;" id="ProfileSign" />
                                                        <br />Applicant's Sig. 
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Email ID</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                                        &nbsp;(Age)</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                                        &nbsp;(<asp:Label ID="lblAge" runat="server"></asp:Label>
                                                        )</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblFather0" runat="server">Religion (Category)</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>

                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px; text-align: left;" colspan="2">
                                                        <b style="text-transform: uppercase;">Medical Officer Details</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" rowspan="2">
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px;">
                                                        <asp:Label ID="Label21" runat="server">Examiner Name</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 180px;">
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px;">
                                                        <asp:Label ID="Label30" runat="server">Remark</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 180px;">
                                                        <br />
                                                        <br />
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-top: none; vertical-align: bottom; text-align: center; width: 130px; white-space: nowrap;">
                                                        <asp:Label ID="lblpin" runat="server">Sig. of Medical Officer</asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px; text-align: left;" colspan="2">
                                                        <b style="text-transform: uppercase;">VERiFYING Officer Details</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" rowspan="3">
                                                        <br />
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px;">
                                                        <asp:Label ID="Label1" runat="server">Officer Name</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 180px;">
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px;">
                                                        <asp:Label ID="Label31" runat="server">Designation</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 180px;">
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px;">
                                                        <asp:Label ID="Label2" runat="server">Remark</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 180px;">
                                                        <br />
                                                        <br />
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-top: none; vertical-align: bottom; text-align: center; width: 130px; white-space: nowrap;">
                                                        <asp:Label ID="Label3" runat="server">Sig. of Examiner</asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px; text-align: left;" colspan="2">
                                                        <b style="text-transform: uppercase;">Candidate SignatuRe</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" rowspan="3">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px;">
                                                        <asp:Label ID="Label4" runat="server">Candidate Name</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 180px;">
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px;">
                                                        <asp:Label ID="Label6" runat="server">Place</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 180px;">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px;">
                                                        <asp:Label ID="Label8" runat="server">Date</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 180px;">
                                                        <br />
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-top: none; vertical-align: bottom; text-align: center; width: 130px; white-space: nowrap;">
                                                        <asp:Label ID="Label9" runat="server">Sig. of Candidate</asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="vertical-align: top; padding: 0" rowspan="3">
                                            <table style="width: 100%" cellpadding="5" cellspacing="0">
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">1</td>
                                                    <td style="border: 1px solid #999;white-space:nowrap;" colspan="2"><b>HIGH JUMP (1.2 MT MINMUM)</b></td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">1. a)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">1ST Chance</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">1. b)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">2nd Chance</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">1. c)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">3rd Chance</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">1. d)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">Not able to clear</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">1. e)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">1.38 Mtr</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">1. f)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">1.50 Mtr</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">2</td>
                                                    <td style="border: 1px solid #999;" colspan="2"><b>BROAD JUMP (3.66 MT)</b></td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">2. a)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">3.66 mts</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">2. b)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">4.00 mts</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">2. c)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">4.35 mts</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">2. d)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">4.50 mts</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">3</td>
                                                    <td style="border: 1px solid #999;" colspan="2"><b>ROPE CLIMBING</b></td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">3. a)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">1ST Chance</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">3. b)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">2nd Chance</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">3. c)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">3rd Chance</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">3. d)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">Not able to clear</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">4</td>
                                                    <td style="border: 1px solid #999;" colspan="2"><b>RUNNING (1.6 KM)</b></td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">4. a)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">5 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">4. b)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">5.30 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">4. c)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">6 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">4. d)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">6.30 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">4. e)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">DQ</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">5</td>
                                                    <td style="border: 1px solid #999;" colspan="2"><b>CROSS COUNTRY (5 KM)</b></td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">5. a)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">20 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">5. b)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">21 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">5. c)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">22 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">5. d)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">23 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">5. e)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">DQ</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">6.</td>
                                                    <td style="border: 1px solid #999;" colspan="2"><b>SWIMMING</b></td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">6. a)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">8 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">6. b)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">Beyond 8 min.</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">6. c)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">DQ</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr style="">
                                        <td style="vertical-align: bottom;">
                                            <table cellpadding="5" cellspacing="0" style="float: right;">
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">7.</td>
                                                    <td style="border: 1px solid #999;" colspan="2"><b>DRIVING</b></td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">7. a)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">Light</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">7. b)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">Heavy</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; white-space: nowrap;">7. c)</td>
                                                    <td style="width: 60%; border: 1px solid #999;">DQ</td>
                                                    <td style="width: 30%; border: 1px solid #999;">&nbsp;</td>

                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>



                            </div>

                            <%----------End Document Section ---------%>
                            <div style="clear: both; margin: 0; line-height: 0; padding: 0; width: 135px;">
                            </div>
                        </div>
                    </div>
                    <div class="clear" style="page-break-before: always;">
                        &nbsp;
                    </div>

                </div>
                <%---Start of Button----%>
                <div class="">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <input type="button" id="btnPrint" class="btn btn-success" value="Print" onclick="javascript: CallPrint('divPrint');" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%----END of Button-----%>
            </div>
        </div>
    </form>
</body>
</html>
