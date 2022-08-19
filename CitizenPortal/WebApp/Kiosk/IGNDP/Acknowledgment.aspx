<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgment.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.IGNDP.Acknowledgment" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/CommonScript.js"></script>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1141px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; height: 1132px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <table style="width: 100%">
                                <tr>
                                    <td rowspan="3">&nbsp;</td>
                                    <td></td>
                                    <td>&nbsp;</td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="text-align: center; vertical-align: middle">
                                        <img alt="Logo" src="../images/depLgog.png" style="width: 120px;" />
                                    </td>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                                <td></td>
                                                <td style="text-align: center; font-size: 22px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</td>
                                                <td></td>
                                                <td style="text-align: center; vertical-align: middle;">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="text-align: center; vertical-align: middle">
                                        <%--<img src="../Images/QRCode.png" style="width: 100px" />--%>
                                        <uc1:QRCode runat="server" ID="QRCode1" />
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
                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">National Family Benefit Scheme (NFBS) </asp:Label>
                                <br />
                                <span id="lblDeptName" runat="server" style="font-size: 15px">Social Security & Empowerment of Persons with Disabilities</span>

                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <table style="width: 100%;" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td style="vertical-align: top; height: 910px;">
                                        <div style="margin: 10px auto; width: 708px; font-size: 13px;">
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Applicant Details</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;white-space:nowrap">
                                                        <asp:Label ID="Label5" runat="server" Text="ProfileID/Aadhaar No."></asp:Label>
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
                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="width: 138px; height: 163px;" id="ProfilePhoto" class="form-control" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label28" runat="server" Text="Applicant Name"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblAppname" runat="server"></asp:Label>
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
                                                        <asp:Label ID="Father" runat="server">Father Name</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblFather" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label1" runat="server" Text="Disability Type"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblDisability" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;white-space:nowrap">
                                                        <asp:Label ID="Label6" runat="server" Text="Disability Percentage"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblPercentage" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;white-space:nowrap;">
                                                        <asp:Label ID="Label4" runat="server">Annual Income</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblIncome" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label3" runat="server">BPL Card No.</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblBPLCardNo" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="Label8" runat="server">BPL Year.</asp:Label>
                                                        &nbsp;</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblBPLCardYear" runat="server"></asp:Label>
                                                        &nbsp;</td>
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
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><b>Account Details of Beneficiary</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;white-space:nowrap">
                                                        <asp:Label ID="Label19" runat="server" Text="Account Holder's Name"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblAcHolder" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Bank Account Number</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblAcNo" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">IFSC Code</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblIFSCCode" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="0" cellspacing="0" width="100%" style="">
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                                                </tr>
                                            </table>
                                            <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0;" ClientIDMode="Static" Width="100%">
                                            </asp:GridView>
                                            <table cellpadding="0" cellspacing="0" width="100%" style="display:none;">
                                                <tr>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;"><b>List of essential documents (enclosed with the application)</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none; width: 10px;">Sl. </td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; border-right: none; width: 517px;">Document Name </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;">Status </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;">1.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: none; border-right: none; white-space: nowrap;">Income Certificate / BPL Card</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;">&nbsp;<a>Attached</a></td>
                                                </tr>                                                                                            
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: 1px solid #999; border-right: none;">2.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: 1px solid #999; border-right: none; white-space: nowrap;">First Page of Bank Pass Book</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: 1px solid #999;">&nbsp;<a>Attached</a></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: 1px solid #999; border-right: none;">3.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: 1px solid #999; border-right: none; white-space: nowrap;">Voter ID Card</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: 1px solid #999;">&nbsp;<a>Attached</a></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: 1px solid #999; border-right: none;">4.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; border-bottom: 1px solid #999; border-right: none; white-space: nowrap;">Disability Certificate</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: 1px solid #999;">&nbsp;<a>Attached</a></td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Payment Details<asp:Label ID="AppName" runat="server" CssClass="lbl_value" Style="white-space: normal !important;"></asp:Label>
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
                                                <%-- <tr style="display:none">
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
                                                </tr>--%>
                                                <tr style="display:none">
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; display: none">Transaction Amount</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px; display: none"><i class="fa fa-rupee"></i>
                                                        <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap; display: none">Portal Fee + Service Tax</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px; display: none"><i class="fa fa-rupee"></i>
                                                        <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                                                        + <i class="fa fa-rupee"></i>
                                                        <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee">Rs.</i>
                                                        <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                                        &nbsp;(<asp:Label ID="lblAmt" runat="server" Font-Bold="True"></asp:Label>)
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;display:none">
                                                <tr>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><strong>Application Delivery Detail</strong></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Designated Officer</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">BDO</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">Expected Date of Delivery</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblExptDate" runat="server" Text="10 Days"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Appellate Authority</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Sub-Collector</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;"></td>
                                                    <%--<td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; ">Apallate Date</td>--%>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                                        <%--<asp:Label ID="lbl2Date" runat="server" Text=""></asp:Label>--%></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Revisional Authority</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Collector</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;"></td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                                        <%--<asp:Label ID="lbl3Date" runat="server" Text=""></asp:Label>--%></td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; display: none;">
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
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                                        <asp:Label ID="Label45" runat="server" Text="Office Address"></asp:Label>
                                                    </td>
                                                    <td style="width: 195px; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label46" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td style="width: 120px; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label47" runat="server" Text="Contact No."></asp:Label>
                                                    </td>
                                                    <td style="width: 195px; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label10" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="">
                                        
                                    </td>
                                </tr>
                            </table>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                </asp:Panel>
                <div style="text-align: center; margin-bottom: 10px;">
                    <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
