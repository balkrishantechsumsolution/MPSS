<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FisheriesAcknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DOF.FisheriesAcknowledgement" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<%--<!DOCTYPE html>--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/CommonScript.js"></script>

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
                                <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">Trans. No.</div>
                                <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                                    <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
                                </div>
                                <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">Trans. Date</div>
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
                            <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; font-weight: bolder; text-transform: uppercase;">Directorate of Fisheries, Odisha</asp:Label>
                            <br />
                            <span id="lblDeptName" runat="server" style="font-size: 15px"></span>
                        </div>
                        <%----------End title section ---------%>                        <%---------Start Applicant Section --------%>
                        <div style="margin: 10px auto; width: 708px; font-size: 12px; line-height: 14px;">
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                <tr>
                                    <td style="background-color: #f9f9f9; padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
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
                                    <td rowspan="8" style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">
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
                                        <asp:Label ID="Religion" runat="server">Age</asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblAge" runat="server"></asp:Label>
                                    </td>
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
                                <tr>
                                    <td width="137" style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Occupation / Profession
                                    </td>
                                    <td width="152" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblAcHolder" runat="server" CssClass="lbl_value"></asp:Label>
                                    </td>
                                    <td width="187" style="padding: 5px; border: 1px solid #999; text-align: left;">Annual Income</td>
                                    <td style="border: 1px solid #999;">
                                        <asp:Label ID="lblannualincome" runat="server" Font-Size="15px"></asp:Label></td>
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
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="Label3" runat="server">Gram Panchayat</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <asp:Label ID="lblGramPanchayat" runat="server" Font-Size="15px"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="Label4" runat="server">District</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lbldist" runat="server" Font-Size="15px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="Label30" runat="server">State</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblState" runat="server" Font-Size="15px"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="Label32" runat="server">PIN No.</asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblpin" runat="server" Font-Size="15px"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                            <%--<table style="width: 100%; border: 0;" cellpadding="5" cellspacing="0" class="table-bordered">
                                <tr>
                                    <td style="border-left: 1px solid #999; border-right: 1px solid #999; border-top: 1px solid #999; border-bottom: 1px none #999; padding: 5px; text-align: left;" colspan="4"><b>Education Details</b></td>
                                </tr>
                                <tr>
                                    <td width="193" style="border: 1px solid #999; padding: 5px; text-align: left; width: 135px;">Name of the Board / Council
                                    </td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblboard" runat="server" Font-Size="15px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; text-align: left; width: 135px; border: 1px solid #999;">Name of the Higher Secondary Council</td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="lblhighersecondary" runat="server" Font-Size="15px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; text-align: left; width: 135px; border: 1px solid #999;">Name of University</td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="lblnameofuniversity" runat="server" Font-Size="15px"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border: 1px solid #999;">Passing Year</td>
                                    <td style="border: 1px solid #999;">
                                        <asp:Label ID="lblpassingyr" runat="server" Font-Size="15px"></asp:Label></td>
                                    <td style="border: 1px solid #999;">Grade/Division</td>
                                    <td style="border: 1px solid #999;">
                                        <asp:Label ID="lblgrade" runat="server" Font-Size="15px"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="border: 1px solid #999; padding: 5px; text-align: left; width: 135px;">Percentage % of Marks</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                        <asp:Label ID="lblPercentage" runat="server" Font-Size="15px"></asp:Label>
                                    </td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">State</td>
                                    <
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblstate" runat="server" Font-Size="15px"></asp:Label>
                                    </td>
                                </tr>
                            </table>--%>

                            <br />
                            <table style="width: 100%; border: 0;" cellpadding="5" cellspacing="0" class="table-bordered">
                                <tr>
                                    <td style="background-color: #f9f9f9; padding: 5px; border: 1px solid #999; text-align: left;" colspan="4"><b>Additional Details</b></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Service Required</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                        <asp:Label ID="lblServiceRequired" runat="server"></asp:Label></td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Land Type</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                        <asp:Label ID="lblLandType" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Present Tank Status</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Culture Tank</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Clarrified</td>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Semi-Intensive</td>
                                </tr>
                            </table>
                            <br />
                            <div id="DivPresentFishProdution" runat="server">
                                <table style="width: 100%; border: 1px solid #999; margin: 0 auto;" cellspacing="0" cellpadding="5" class="table-bordered">
                                    <tr>
                                        <td colspan="4" style="background-color: #f9f9f9; padding: 5px; border-bottom: 1px solid #999; text-align: left;"><b>Present Fish Production</b></td>
                                    </tr>
                                    <tr>
                                        <td style="border-right: 1px solid #999;">Quintal </td>
                                        <td style="border-right: 1px solid #999; width: 125px;">
                                            <asp:Label ID="lblQuintal" runat="server" Font-Size="15px"></asp:Label></td>
                                        <td style="border-right: 1px solid #999;">Value</td>
                                        <td style="border-right: 1px solid #999; width: 125px;">
                                            <asp:Label ID="lblValue" runat="server" Font-Size="15px"></asp:Label></td>
                                    </tr>
                                </table>
                                <br />
                            </div>
                            <table style="width: 100%; border: 1px solid #999;" cellspacing="0" cellpadding="5" class="table-bordered">
                                <tr>
                                    <td colspan="6" style="padding: 5px; border-bottom: 1px solid #999; text-align: left;" id="lblTankLand" runat="server"><b>Whether he has Own Tank or Lease outTank</b></td>
                                </tr>
                                <div id="OwnTankDtl" runat="server">
                                    <tr>
                                        <td width="143" style="border: 1px solid #999; padding: 5px;">Length</td>
                                        <td width="12%" style="border: 1px solid #999;">
                                            <asp:Label ID="lblLength" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td width="72" style="border: 1px solid #999;">Breadth</td>
                                        <td width="20%" style="border: 1px solid #999;">
                                            <asp:Label ID="lblBreadth" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td width="84" style="border: 1px solid #999;">Area</td>
                                        <td width="16%" style="border: 1px solid #999;">
                                            <asp:Label ID="lblArea" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #999;">Village (Mouza)</td>
                                        <td style="border: 1px solid #999;">
                                            <asp:Label ID="lblVillageMouza" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #999;">Khata No.</td>
                                        <td style="border: 1px solid #999;">
                                            <asp:Label ID="lblKhataNo" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                        <td style="border: 1px solid #999;">Plot No.</td>
                                        <td style="border: 1px solid #999;">
                                            <asp:Label ID="lblPlotNo" runat="server" Font-Size="15px"></asp:Label>
                                        </td>
                                    </tr>
                                </div>
                                <div id="LeaseoutTankDtl" runat="server">
                                    <tr>
                                        <td width="143" style="border-right: 1px solid #999;">Lease Tank Category</td>
                                        <td>
                                            <asp:Label ID="lblLeaseTankCategory" runat="server" Font-Size="15px"></asp:Label></td>
                                        <td width="112" style="border: 1px solid #999;">Lease Period</td>
                                        <td style="border-right: 1px solid #999; width: 125px;">
                                            <asp:Label ID="lblLeasePeriod" runat="server" Font-Size="15px"></asp:Label></td>
                                        <td width="84" style="border-right: 1px solid #999;">Lease Value</td>
                                        <td>
                                            <asp:Label ID="lblLeaseValue" runat="server" Font-Size="15px"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="border-top: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;">Lessor Details</td>
                                        <td colspan="5" style="border-top: 1px solid #999; border-right: 1px solid #999; border-bottom: 1px solid #999;">
                                            <asp:Label ID="lblLessorDetail" runat="server"></asp:Label></td>
                                    </tr>
                                </div>
                            </table>
                            <br />
                            <table style="width: 100%; border: 1px solid #999; margin: 0 auto;" cellspacing="0" cellpadding="5" class="table-bordered">
                                <tr>
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Means of Finance</b></td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblMeansOfFiananceValue" for="Actd" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>
                                <tr id="BankDetail" runat="server">
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">Preferred Bank Name</td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblBankName" runat="server" CssClass="lbl_value"></asp:Label></td>

                                    <td style="width: 25%; padding: 5px 5px 5px 12px; border: 1px solid #999; text-align: left;">Bank Branch Name</td>
                                    <td style="width: 25%; padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblBranchName" runat="server" CssClass="lbl_value"></asp:Label></td>
                                </tr>
                                <tr id="EduQualification" runat="server">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Educational Qualification</b></td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblEduQualification" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>
                                <tr id="SpeciesCultured" runat="server">
                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Species Cultured</b></td>
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <asp:Label ID="lblSpeciesCultured" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />

                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 1px solid #999;">
                                <tr>
                                    <td colspan="2" class="hdbg" style="background-color: #f9f9f9; padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999;"><b>Other Information</b></td>
                                </tr>
                                <tr>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: bold;"><span class="fom-Numbx">1.</span> Has he availed any Training?</td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Section1_AvailedAnytraining" runat="server" CssClass="t_trans"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <div id="AvailTrng" runat="server">
                                    <tr>
                                        <td width="676" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;a.No. of Training</td>
                                        <td width="315" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section1A_NoOfTraining" for="checkbox" runat="server" Style="font-size: 16px;"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;b.Duration of Training</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>Week:
                                                        <asp:Label ID="lblWeek" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>Month:
                                                        <asp:Label ID="lblMonth" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>Year:
                                                        <asp:Label ID="lblYear" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;c.Name of training  </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblNameOfTraining" runat="server" CssClass="t_trans"></asp:Label></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="others" runat="server">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;d.Other's</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblOthers" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                </div>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: bold;"><span class="fom-Numbx">2.</span> Is he member of PFCS / SHG</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblHasMemberOfPFCSSHG" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <div id="HasMembership" runat="server">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;a.Name of PFCS / SHG</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblNameOfPFCSSHG" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;b.Address of PFCS / SHG</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lbllblAddressOfPFCSSHG" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;c.Member No. of PFCS / SHG</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblMemberNoOfPFCSSHG" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </div>
                                <tr>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: bold;"><span class="fom-Numbx">3.</span> Is there any way of communication and Infrastructure at Farm Side</td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblFarmSideInfrastructure" runat="server" CssClass="t_trans"></asp:Label>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <div id="HasCommInfrFrmSide" runat="server">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;a.Communication and Infrastructure at Farm Side</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>Road:
                                                        <asp:Label ID="lblRoad" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>Electricity:
                                                        <asp:Label ID="lblElectricity" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>Canal:
                                                        <asp:Label ID="lblCanal" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </div>
                                <tr>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: bold;"><span class="fom-Numbx">4.</span> Has he availed any loan previously?   </td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblHasLoanPreviously" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <div id="HasAvlLoanPrvly" runat="server">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;a.Name of Bank</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblNameOfBank" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;b.Purpose of Loan</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblPurposeOfLoan" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;c.Amount of Loan</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblAmountOfLoan" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;&nbsp;d.Outstanding Balance of Loan</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblBalanceOfLoan" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                </div>
                            </table>
                            <br />
                            <table style="width: 100%; border: 1px solid #999; margin: 0 auto;" cellspacing="0" cellpadding="5" class="table-bordered">
                                <tr>
                                    <td colspan="4" style="background-color: #f9f9f9; padding: 5px; border-bottom: 1px solid #999; text-align: left;"><b>Witness Details</b></td>
                                </tr>
                                <tr>
                                    <td style="border-right: 1px solid #999; border-bottom: 1px solid #999;">Witness1 Name </td>
                                    <td style="border-right: 1px solid #999; border-bottom: 1px solid #999; width: 125px;">
                                        <asp:Label ID="Witness1Name" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                    <td style="border-right: 1px solid #999; border-bottom: 1px solid #999;">Witness1 Address</td>
                                    <td style="border-right: 1px solid #999; border-bottom: 1px solid #999; width: 125px;">
                                        <asp:Label ID="Witness1Address" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-right: 1px solid #999;">Witness2 Name </td>
                                    <td style="border-right: 1px solid #999; width: 125px;">
                                        <asp:Label ID="Witness2Name" runat="server" CssClass="t_trans"></asp:Label>
                                    </td>
                                    <td style="border-right: 1px solid #999;">Witness2 Address</td>
                                    <td style="border-right: 1px solid #999; width: 125px;">
                                        <asp:Label ID="Witness2Address" runat="server" CssClass="t_trans"></asp:Label>
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
                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>Rs.
                                            <asp:Label ID="lblTotalFee" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="lblAmt" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                            <br />
                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; display: none">
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
            <div style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
                <input type="button" id="btnSubmit" class="btn btn-info" style="color: #fff; background-color: #286090; border-color: #204d74; border: 0; border-radius: 2px; padding: 5px 12px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Close" id="btnCancel" class="btn btn-success" style="border: 0; border-radius: 2px; padding: 5px 12px;" onclick="window.close();" />
            </div>
        </div>
    </form>
</body>
</html>
