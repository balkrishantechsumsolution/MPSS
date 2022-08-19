<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinancingAcknowledgement3.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DTE.FinancingAcknowledgement3" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Student Acknowledgement : Scholarship To Girls Toppers</title>

    <script src="../../Scripts/CommonScript.js"></script>

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css" rel="stylesheet" />

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        table {
            border-spacing: 0;
            border-collapse: collapse;
            font-size: 14px;
        }

        .t_trans {
            text-transform: capitalize;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">

                <div id="divPrint" style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: auto; width: 100%; border: 3px solid #000; padding: 1px; font-family: Arial;">
                        <div style="margin: 0 auto; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 140px; width: 785px; border-bottom: 1px solid #999;">
                                <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                    <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                </div>
                                <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                                    <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                        Trans. No.
                                    </div>
                                    <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                                        <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
                                    </div>
                                    <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">
                                        Trans. Date
                                    </div>
                                    <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999;">
                                        <asp:Label ID="lblappdate" runat="server" Font-Bold="True"></asp:Label>
                                    </div>
                                </div>
                                <div style="height: 47px; float: right; margin: 30px 31px 0 0;">
                                    <uc1:QRCode runat="server" ID="QRCode1" />
                                </div>
                            </div>
                            <%----------End Header section ---------%>                        <%---------Start Title section --------%>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">Student Acknowledgement : Scholarship To Girls Toppers</asp:Label>
                                <br />
<%--                                <span id="lblDeptName" runat="server" style="font-size: 15px">(In Diploma Engineering Institutions)
                                </span>--%>
                            </div>
                            <%----------End title section ---------%>                        <%---------Start Applicant Section --------%>
                            <div style="margin: 10px auto; width: 708px; font-size: 13px;">
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
                                            <b>Applicant Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="Label5" runat="server" Text="ProfileID/Aadhaar No."></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblAadhaar" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="Label7" runat="server" Text="Mobile No."></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                        </td>
                                        <td rowspan="6" style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 135px;" id="ProfilePhoto" />
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
                                            <asp:Label ID="Label1" runat="server">Mother Name</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMother" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="lblFather1" runat="server">Gender</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblGender" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="Religion" runat="server">Religion</asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblReligion" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="lblFathersAge" runat="server">Father's Age</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblFthrAge" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="Label2" runat="server" Text="Mother's Age">Mother's Age</asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblMtherAge" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="lblEmailId" runat="server">Email ID</asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEml" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Category</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblcategory" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                            <asp:Label ID="Label16" runat="server" Text="Applicant Address"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                            <asp:Label ID="lblapplicant_address" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 11px; line-height: 11.5px; text-align: left; width: 135px;" rowspan="2">
                                            <asp:Label ID="Label20" runat="server" Text="House / Apartment No.&lt;br/&gt;No. / Name of Building &lt;br/&gt;Locality / Landmark&lt;br/&gt;Road / Street Name "></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label21" runat="server">Village</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblvillage" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label23" runat="server">Block</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                            <asp:Label ID="lbltaluka" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label30" runat="server">District</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lbldist" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="Label32" runat="server">PIN No.</asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblpin" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table style="width: 100%; border: 0;" cellpadding="5" cellspacing="0" class="table-bordered">
                                    <tr>
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px solid #999; border-bottom: 1px none #999; padding: 5px; text-align: left;" colspan="4"><b>Education Details</b></td>
                                    </tr>
                                    <tr>
                                        <td width="193" style="border: 1px solid #999; padding: 5px; text-align: left; width: 135px;">Registration Number</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblRegistrationNo" runat="server" Font-Size="15px"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Year of Admission</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblAdmissionYear" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; text-align: left; width: 135px; border: 1px solid #999;">Semester</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="lblSemester" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">Type of Institute</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="lblInstituteType" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; text-align: left; width: 135px; border: 1px solid #999;">Name of Instituition</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="lblnameofuniversity" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">Branch</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                            <asp:Label ID="lblBranch" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table style="width: 100%; border: 0;" cellpadding="5" cellspacing="0" class="table-bordered">
                                    <tr>
                                        <td colspan="4" style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px solid #999; border-bottom: 1px none #999; padding: 5px; text-align: left;"><b>Additional Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Financing Guardian Name</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="lblFinancingGuardianName" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Relation with Financing Guardian</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="lblFinancingGuardianRelation" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Annual Income</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblannualincome" runat="server" Font-Size="15px"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                <table style="width: 100%; border: 0;" cellpadding="5" cellspacing="0" class="table-bordered">
                                    <tr>
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px solid #999; border-bottom: 1px none #999; padding: 5px; text-align: left;" colspan="4"><b>Bank Details</b></td>
                                    </tr>
                                    <tr>
                                        <td width="24%" style="border: 1px solid #999; padding: 5px; text-align: left; width:25%;">Bank Name</td>
                                        <td width="26%" style="padding: 5px; border: 1px solid #999; text-align: left; width:25%;">
                                            <asp:Label ID="lblBankName" runat="server"></asp:Label>
                                        </td>
                                        <td width="25%" style="padding: 5px; border: 1px solid #999; text-align: left; width:25%;">Acoount Number</td>
                                        <td width="25%" style="padding: 5px; border: 1px solid #999; text-align: left; width:25%;">
                                             <asp:Label ID="lblBankAcNo" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; text-align: left; border: 1px solid #999;">IFSC Code</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                           <asp:Label ID="lblBankIFSCode" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Account Holder Name</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblAcHolderName" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                                                <table style="width: 100%; border: 0;" cellpadding="5" cellspacing="0" class="table-bordered">
                                    <tr>
                                        <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px solid #999; border-bottom: 1px none #999; padding: 5px; text-align: left;" colspan="4"><b>Issuer Details Of Income Certificate</b></td>
                                    </tr>
                                    <tr>
                                        <td width="24%" style="border: 1px solid #999; padding: 5px; text-align: left; width: 25%;">Issuing Authority Name</td>
                                        <td width="26%" style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                            <asp:Label ID="lblIssuingAuthority" runat="server"></asp:Label>
                                        </td>
                                        <td width="25%" style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">Issuing Authority Address</td>
                                        <td width="25%" style="padding: 5px; border: 1px solid #999; text-align: left; width: 25%;">
                                            <asp:Label ID="lblIssuingAddress" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; text-align: left; border: 1px solid #999;">Issuing Authority Contact No</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblIssuingContactNo" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Issuing Authority EmailId</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblIssuingEmailId" runat="server"></asp:Label>
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
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><b>Payment Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label10" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblReferenceID" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label11" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="AppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction ID</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblTrnsID" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblTrnsDate" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="display: none;">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblAppFee" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Portal Fee + Service Tax</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                                            + <i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblTotalFee" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="lblAmt" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; display:none;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><b>Application Delivery Detail</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Designated Officer</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">BDO</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Expected Date of Delivery</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lbl1Date" runat="server" Text="30 Days"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Appellate Authority</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Sub-Collector</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;"></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Revisional Authority</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Collector</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;"></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;"></td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; display: none;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><strong>Current Status</strong></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Authorised Person</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Additional Collector</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Status</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                            <asp:Label ID="Label12" runat="server" Text="Pending for Acceptance"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="Label13" runat="server" Text="Office Address"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                            <asp:Label ID="Label33" runat="server" Text=""></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="Label34" runat="server" Text="Contact No."></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                            <asp:Label ID="Label35" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <%----------End Document Section ---------%>
                            <div style="clear: both; margin: 0; line-height: 0; padding: 0; width: 135px;">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
