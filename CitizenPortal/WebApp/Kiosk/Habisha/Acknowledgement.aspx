<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Habisha.Acknowledgement" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 135px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <asp:Panel ID="Panel2" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1191px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; height: 1183px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <table style="width: 100%">
                                <tr>
                                    <td rowspan="3"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img alt="Logo" src="../images/depLgog.png" style="width: 120px;" />
                                    </td>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                                <td></td>
                                                <td style="text-align: center; font-size: 22px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</td>
                                                <td></td>
                                                <td style="text-align: center">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <uc1:qrcode runat="server" id="QRCode1" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="text-align: center">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <asp:Label ID="lblCertificateName" runat="server" CssClass="lbl_value" Text="Request for Migration"></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="lbldepartment" Style="font-size: 15px">Department of Culture</asp:Label>
                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <table style="width: 100%;" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td style="vertical-align: top; height: 924px;">
                                        <div style="margin: 10px auto; width: 708px; font-size: 13px;">
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Applicant Details</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label5" runat="server" Text="Aadhaar/Profile No."></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                        <asp:Label ID="lblAadhaar" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="Label7" runat="server" Text="Mobile No."></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                                    </td>
                                                    <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="width: 138px;" id="ProfilePhoto" class="form-control" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAppname" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="Father" runat="server">Father Name</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblFather" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="lblFather1" runat="server">Gender</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblGender" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblIncome2" runat="server">Date of Journey</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDOJ" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="lblIncome4" runat="server">Date of Return</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDOR" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblIncome3" runat="server">Disease Details</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblDisease" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblIncome7" runat="server">Reason</asp:Label>
                                                    </td>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblReason" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label16" runat="server" Text="Applicant Address"></asp:Label>
                                                    </td>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblapplicant_address" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2" style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 11px; line-height: 11.5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label20" runat="server" Text="House / Apartment No.&lt;br/&gt;No. / Name of Building &lt;br/&gt;Locality / Landmark&lt;br/&gt;Road / Street Name "></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label21" runat="server">Village</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                                        <asp:Label ID="lblvillage" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label23" runat="server">Block</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                                        <asp:Label ID="lbltaluka" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label30" runat="server">District</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lbldist" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label32" runat="server">PIN No.</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblpin" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;" id="divAttendee" runat="server">
                                                <tr>
                                                    <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px solid #999; border-bottom: 1px none #999; padding: 5px; text-align: left; " colspan="6">
                                                        <b>Attendee Details </b></td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style1" style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblIncome5" runat="server">Attendee Name</asp:Label>
                                                    </td>
                                                    <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAttendee" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblIncome6" runat="server">Attendee Mobile No</asp:Label>
                                                    </td>
                                                    <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAttPhone" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px solid #999; border-bottom: 1px none #999; padding: 5px; text-align: left; " class="auto-style1">
                                                        <asp:Label ID="Label1" runat="server" Text="Attendee Address"></asp:Label>
                                                    </td>
                                                    <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblAttAddress" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="auto-style1" rowspan="2" style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px none #999; border-bottom: 1px solid #999; padding: 5px; font-size: 11px; line-height: 11.5px; text-align: left; ">
                                                        <asp:Label ID="Label3" runat="server" Text="House / Apartment No.&lt;br/&gt;No. / Name of Building &lt;br/&gt;Locality / Landmark&lt;br/&gt;Road / Street Name "></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label4" runat="server">Panchayat</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                                        <asp:Label ID="lblAttVillage" runat="server"></asp:Label>
                                                    </td>
                                                    <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label8" runat="server">Block</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                                        <asp:Label ID="lblAttBlock" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border: 1px solid #999; padding: 5px; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label11" runat="server">District</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; ">
                                                        <asp:Label ID="lblAttDistrict" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;" colspan="2">
                                                        <asp:Label ID="Label13" runat="server">PIN No.</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; ">
                                                        <asp:Label ID="lblAttPin" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;"><b>List of essential documents (enclosed with the application)</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none; width: 10px;">Sl. </td>
                                                    <td style="border-left: 1px solid #999; border-top: 1px solid #999; border-right: 1px solid #999;padding: 5px; text-align: justify;">Document Name</td>
                                                    <td style="border-left: 1px solid #999; border-top: 1px solid #999; border-right: 1px solid #999;padding: 5px; text-align: justify;">Status</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-right: none;">1.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: justify; white-space: nowrap;">Identification Document(Voter ID/PAN Card/Driving Licence)</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: justify; white-space: nowrap;">Attached</td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Payment Details<asp:Label ID="AppName" runat="server" CssClass="lbl_value" Style="white-space: normal !important;" Visible="False"></asp:Label>
                                                    </b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblAppID" runat="server" CssClass="lbl_value"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label31" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="AppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction ID</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsID" runat="server" style="font-weight: bold;">16505101000000000085</span></td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsDate" runat="server" style="font-weight: bold;">31/05/2016</span></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="TokenNo0" runat="server">Kiosk Name (ID)</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblKiosk" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="TokenNo3" runat="server">Kiosk Mobile No.</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblKioskMob" runat="server" CssClass="lbl_value"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="display:none">
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                                        <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Portal Fee + Service Tax</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                                       Rs. <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                                                        + <i class="fa fa-rupee"></i>
                                                        <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                                        Rs. <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                                        <%--<asp:Label ID="lblAmtWord" runat="server" Text="(Thirty Two Rupees and Ninety Paise)"></asp:Label>--%>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;display:none;">
                                                <tr>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><strong>Application Delivery Detail</strong></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Signing Authority</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">Tahsildar</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">To Be Delivered by</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="Label41" runat="server" Text="2 Days"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Appellate Authority</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">Sub-Divisional Officer</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Revisional Authority</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="Label42" runat="server" Text="Additional Collector"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><strong>Current Status</strong></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Authorised Person</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Additional Collector</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Status</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                                        <asp:Label ID="Label44" runat="server" Text="Pending for Acceptance"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px; height: 28px;">
                                                        <asp:Label ID="Label45" runat="server" Text="Office Address"></asp:Label>
                                                    </td>
                                                    <td style="width: 195px; height: 28px; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label46" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td style="width: 120px; height: 28px; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label47" runat="server" Text="Contact No."></asp:Label>
                                                    </td>
                                                    <td style="width: 195px; height: 28px; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label48" runat="server" Text=""></asp:Label>
                                                        <asp:Label ID="Label10" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-style: solid none none none; border-width: 1px; border-color: #000000; vertical-align: bottom">
                                        <table style="width: 100%; margin: auto 0;" cellpadding="5" cellspacing="0" border="0">
                                            <tr>
                                                <td style="text-align: left">
                                                    <img alt="Logo" src="../Images/cmgi.png" style="width: 35px; text-align: left;" /></td>
                                                <td></td>
                                                <td style="text-align: center; font-weight: bold; color: #000654;">Center for Modernizing Government Initiative (CMGi), Odisa</td>
                                                <td></td>
                                                <td style="text-align: right">
                                                    <img alt="Logo" src="../Images/csc.png" style="width: 50px; text-align: right; height: 21px;" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
