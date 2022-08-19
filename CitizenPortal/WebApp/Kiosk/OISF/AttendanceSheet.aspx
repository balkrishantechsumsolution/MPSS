<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceSheet.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.AttendanceSheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="../../Scripts/CommonScript.js"></script>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                <div style="margin: 0 auto; height: 1191px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 3px auto; height: 1183px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                        <%---------Start Header section --------%>
                        <div style="height: 95px; width: 100%; border-bottom: 1px solid #999;">
                            <table style="width: 100%; vertical-align: middle; text-align: center;">
                                <tr>
                                    <td>
                                        <img alt="Logo" src="img/odisha_policelogo.jpg" style="width: 90px;" />
                                    </td>
                                    <td style="text-align: center">
                                        <br />
                                        <span style="text-align: center; font-size: 15px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</span>
                                        <br />
                                        <asp:Label runat="server" ID="Label1" Style="font-size: 18px; font-weight: bolder; text-transform: uppercase;">Recruitment of Constable in 9th IRB</asp:Label>
                                        <br />
                                    </td>
                                    <td>
                                        <img alt="Logo" src="../images/depLgog.png" style="width: 90px;" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <%----------End Header section ---------%>
                        <%---------Start Title section --------%>
                        <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                            <span style="text-align: center; font-size: 22px; font-weight: bold; color: #fff;">Attendance Sheet - Venue Name</span>
                        </div>
                        <%----------End title section ---------%>
                        <%---------Start Applicant Section --------%>
                        <div style="margin: 5px auto; font-size: 13px; width: 765px;">
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; width: 135px" rowspan="7">
                                        <div style="border: 1px solid #ccc; padding: 5px; position: absolute; background-color: #fcfcfc;">1.</div>
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 105px; height: 120px" id="ProfilePhoto0" />
                                        <br />
                                        <img runat="server" src="img/signature.png" name="ProfilePhoto0" style="margin: 1px; width: 105px; height: 54px;" id="ProfileSign" />
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 125px;">
                                        <asp:Label ID="Label5" runat="server" Text="Application ID"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center;" colspan="2"><b>Physical Measurment</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">Height (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblFather1" runat="server">Father Name</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblFather" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">Weight (KG)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Chest (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left; width: 120px;" rowspan="2">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" colspan="2" rowspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                        &nbsp;(Age)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblFather0" runat="server">Religion (Category)</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblCategory" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap;">Signature of Candidate</td>
                                    <td style="padding: 5px; border: 1px solid #999; vertical-align: bottom; text-align: center" colspan="2">Signature of Examiner</td>
                                </tr>
                            </table>
                        </div>
                        <div style="margin: 5px auto; font-size: 13px; width: 765px;">
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; width: 135px" rowspan="7">
                                        <div style="border: 1px solid #ccc; padding: 5px; position: absolute; background-color: #fcfcfc;">2.</div>
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 105px; height: 120px" id="Img1" />
                                        <br />
                                        <img runat="server" src="img/signature.png" name="ProfilePhoto0" style="margin: 1px; width: 105px; height: 54px;" id="Img2" />
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 125px;">
                                        <asp:Label ID="Label2" runat="server" Text="Application ID"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label3" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center;" colspan="2"><b>Physical Measurment</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label4" runat="server" Text="Applicant Name"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label6" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">Height (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label7" runat="server">Father Name</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label8" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">Weight (KG)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label9" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Chest (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label10" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left; width: 120px;" rowspan="2">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" colspan="2" rowspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label11" runat="server" Text="Date of Birth"></asp:Label>
                                        &nbsp;(Age)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label12" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label13" runat="server">Religion (Category)</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label14" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap;">Signature of Candidate</td>
                                    <td style="padding: 5px; border: 1px solid #999; vertical-align: bottom; text-align: center" colspan="2">Signature of Examiner</td>
                                </tr>
                            </table>
                        </div>
                        <div style="margin: 5px auto; font-size: 13px; width: 765px;">
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; width: 135px" rowspan="7">
                                        <div style="border: 1px solid #ccc; padding: 5px; position: absolute; background-color: #fcfcfc;">3.</div>
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 105px; height: 120px" id="Img3" />
                                        <br />
                                        <img runat="server" src="img/signature.png" name="ProfilePhoto0" style="margin: 1px; width: 105px; height: 54px;" id="Img4" />
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 125px;">
                                        <asp:Label ID="Label15" runat="server" Text="Application ID"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label16" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center;" colspan="2"><b>Physical Measurment</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label17" runat="server" Text="Applicant Name"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label18" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">Height (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label19" runat="server">Father Name</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label20" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">Weight (KG)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label21" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Chest (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label22" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left; width: 120px;" rowspan="2">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" colspan="2" rowspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label23" runat="server" Text="Date of Birth"></asp:Label>
                                        &nbsp;(Age)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label24" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label25" runat="server">Religion (Category)</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label26" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap;">Signature of Candidate</td>
                                    <td style="padding: 5px; border: 1px solid #999; vertical-align: bottom; text-align: center" colspan="2">Signature of Examiner</td>
                                </tr>
                            </table>
                        </div>
                        <div style="margin: 5px auto; font-size: 13px; width: 765px;">
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; width: 135px" rowspan="7">
                                        <div style="border: 1px solid #ccc; padding: 5px; position: absolute; background-color: #fcfcfc;">4.</div>
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 105px; height: 120px" id="Img5" />
                                        <br />
                                        <img runat="server" src="img/signature.png" name="ProfilePhoto0" style="margin: 1px; width: 105px; height: 54px;" id="Img6" />
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 125px;">
                                        <asp:Label ID="Label27" runat="server" Text="Application ID"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label30" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center;" colspan="2"><b>Physical Measurment</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label31" runat="server" Text="Applicant Name"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label32" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">Height (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label33" runat="server">Father Name</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label34" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">Weight (KG)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label35" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Chest (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label36" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left; width: 120px;" rowspan="2">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" colspan="2" rowspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label37" runat="server" Text="Date of Birth"></asp:Label>
                                        &nbsp;(Age)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label38" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label39" runat="server">Religion (Category)</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label40" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap;">Signature of Candidate</td>
                                    <td style="padding: 5px; border: 1px solid #999; vertical-align: bottom; text-align: center" colspan="2">Signature of Examiner</td>
                                </tr>
                            </table>
                        </div>
                        <div style="margin: 5px auto; font-size: 13px; width: 765px;">
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; width: 135px" rowspan="7">
                                        <div style="border: 1px solid #ccc; padding: 5px; position: absolute; background-color: #fcfcfc;">5.</div>
                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 105px; height: 120px" id="Img7" />
                                        <br />
                                        <img runat="server" src="img/signature.png" name="ProfilePhoto0" style="margin: 1px; width: 105px; height: 54px;" id="Img8" />
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 125px;">
                                        <asp:Label ID="Label41" runat="server" Text="Application ID"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label42" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center;" colspan="2"><b>Physical Measurment</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label43" runat="server" Text="Applicant Name"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label44" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">Height (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 70px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label45" runat="server">Father Name</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label46" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;">Weight (KG)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Mobile No.</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                        <asp:Label ID="Label47" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Chest (CM)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label48" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left; width: 120px;" rowspan="2">&nbsp;</td>
                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; text-align: left;" colspan="2" rowspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label49" runat="server" Text="Date of Birth"></asp:Label>
                                        &nbsp;(Age)</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label50" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label51" runat="server">Religion (Category)</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="Label52" runat="server"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; vertical-align: bottom; white-space: nowrap;">Signature of Candidate</td>
                                    <td style="padding: 5px; border: 1px solid #999; vertical-align: bottom; text-align: center" colspan="2">Signature of Examiner</td>
                                </tr>
                            </table>
                        </div>
                        <%----------End Document Section ---------%>
                    </div>
                </div>
            </asp:Panel>

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
    </form>
</body>
</html>
