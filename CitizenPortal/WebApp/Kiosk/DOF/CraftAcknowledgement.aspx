<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CraftAcknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DOF.CraftAcknowledgement" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/CommonScript.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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

                <div id="divPrint" style="margin: 0 auto; width: 800px; /*height: auto; overflow: auto; */">
                    <div style="margin: 0 auto; height: auto; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: auto; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
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
                            <%----------End Header section ---------%>
                            <%---------Start Title section --------%>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">Directorate of Fisheries, Odisha,Cuttack</asp:Label>
                                <br />
                                <span id="lblDeptName" runat="server" style="font-size: 15px">Motorization of Traditional Craft</span>
                            </div>
                            <%----------End title section ---------%>
                            <%---------Start Applicant Section --------%>
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
                                        <td rowspan="7" style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">
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
                                            <asp:Label ID="lblGender1" runat="server">Gender</asp:Label>
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
                                            <asp:Label ID="lblCategory" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">BPL No.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblBPLNo" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">BPL Year</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblBPLYear" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Annual Income</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblAnualIncom" runat="server"></asp:Label></td>
                                        </td>
                                      <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">&nbsp;</td>
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
                                        <td style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 11px; line-height: 11.5px; text-align: left; width: 135px;" rowspan="3">
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
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">Police Station</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblPoliceStation" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;"></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    </tr>
                                </table>
                                <br />
                                <table style="width: 100%; border: 0;" cellpadding="5" cellspacing="0" class="table-bordered">
                                    <tr>
                                        <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Whether the Applicant opts Engine for the 1st Time?</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="BoatCondition" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="6"><b>Boat Details</b></td>
                                    </tr>
                                    <tr>
                                        <td width="137" style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Registration No.
                                        </td>
                                        <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblRegistrationNo" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td width="114" style="padding: 5px; border: 1px solid #999; text-align: left;">License Valid upto </td>
                                        <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblLicenseNo" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Boat Addtional Details</b></td>
                                    </tr>
                                    <tr>
                                        <td width="137" style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Engine Name</td>
                                        <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEngineName" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>

                                        <td width="114" style="padding: 5px; border: 1px solid #999; text-align: left;">Manufacture Date</td>
                                        <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblManufactureDate" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="otherEngineName" runat="server">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Other Engine Name</td>
                                        <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblOtherEngineName" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Engine Type</td>
                                        <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEngineType" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="EngineHP" runat="server">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Engine HP</td>
                                        <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEngineHP" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="OtherEngineHP" runat="server">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Other Engine HP</td>
                                        <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblOtherEngineHP" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Boat Specification (in ft.)</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Boat Overall Length</td>
                                        <td width="91" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblOAL" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td width="94" style="padding: 5px; border: 1px solid #999; text-align: left;">Boat Depth</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblDepth" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td width="94" style="padding: 5px; border: 1px solid #999; text-align: left;">Boat Width</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblWidth" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>

                                    <tr id="FirstEngine" runat="server">
                                        <td colspan="6" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Details of 1st Engine</b></td>
                                    </tr>
                                    <tr id="FirstEngineDetail" runat="server">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Engine No</td>
                                        <td width="91" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="EngineNo" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td width="94" style="padding: 5px; border: 1px solid #999; text-align: left;">Engine Make</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="EngineMake" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td width="94" style="padding: 5px; border: 1px solid #999; text-align: left;">Capacity</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="EngineCapacity" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Finance Year</td>
                                        <td width="91" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="BankFinanceYear" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td width="94" style="padding: 5px; border: 1px solid #999; text-align: left;">Bank Name</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="BankFinancingName" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td width="94" style="padding: 5px; border: 1px solid #999; text-align: left;"></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="Label11" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>

                                </table>
                                <br />
                                <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 1px solid #999;">
                                    <tr>
                                        <td colspan="3" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999;"><b>Other Information</b></td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 70%;"><span class="fom-Numbx"><b>1.</b></span>Whether you need engine with  bank finance</td>
                                        <td colspan="2" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table style="width: 100%; border: none;">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="BankFinance" runat="server" CssClass="lbl_value t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <div id="BnkFnceDtl" runat="server">
                                        <tr>
                                            <td width="676" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;a.Bank Name 1
                                            </td>
                                            <td width="315" colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="BankName1" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;b.Address of Bank 1</td>
                                            <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="BankAddress1" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;c.Bank Name 2</td>
                                            <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="BankName2" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;d.Address of Bank 2</td>
                                            <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="BankAddress2" runat="server" CssClass="lbl_value"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </div>
                                    <div id="EngRqdCofmtn" runat="server"></div>
                                    <div id="DateManufacture" runat="server">
                                    </div>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx"><b>2.</b></span>Whether Direct Purchase/Purchased through Department?</td>
                                        <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="DirPurOrDeptPur" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                    </tr>
                                    <div id="MentionPurchase" runat="server">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;a.Purchased From</td>
                                            <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="PurchaseName" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr id="otherPurchase" runat="server">
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; padding-left: 28px;">Describe Other Purchase</td>
                                            <td colspan="2" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="OthrPurchase" runat="server" CssClass="lbl_value"></asp:Label>
                                            </td>
                                        </tr>
                                    </div>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0" style="width: 100%;">
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
                                            <asp:Label ID="Label3" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblReferenceID" runat="server" CssClass="lbl_value"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label4" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
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
                                        <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>Rs. 
                                            <asp:Label ID="lblTotalFee" runat="server" Text=""></asp:Label>
                                            <%-- <asp:Label ID="Label9" runat="server" Text="Rs. 22.75" ></asp:Label>--%>
                                            <asp:Label ID="lblAmt" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
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
                                        <%--<td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px; ">Apallate Date</td>--%>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <%--<asp:Label ID="lbl2Date" runat="server" Text=""></asp:Label>--%></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Revisional Authority</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Collector</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;"></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <%--<asp:Label ID="lbl3Date" runat="server" Text=""></asp:Label>--%></td>
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
                                            <asp:Label ID="Label8" runat="server" Text="Pending for Acceptance"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="Label6" runat="server" Text="Office Address"></asp:Label>
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
                    <div class="clear" style="page-break-before: always;">
                        &nbsp;
                    </div>
                </div>
            </div>
            <div style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
                <input type="button" id="btnSubmit" class="btn btn-info" style="color: #fff; background-color: #286090; border-color: #204d74; border: 0; border-radius: 2px; padding: 5px 12px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Close" id="btnCancel" class="btn btn-success" style="border: 0; border-radius: 2px; padding: 5px 12px;" onclick="window.close();" />
            </div>
        </div>
    </form>
</body>
</html>
