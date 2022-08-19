<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CBCS.Acknowledgement" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="../../Scripts/CommonScript.js" type="text/javascript"></script>
    <style type="text/css">
        #GridViewSubject td, th {
            padding: 3px 5px !important;
        }

        #GridViewCourse td, th {
            padding: 3px 5px !important;
        }

        .hdbg {
            background-color: #6C4B3C;
            color: #fff;
        }

        .sub_hdbg {
            background-color: #F8F8F8;
            color: #383E4B;
            font-weight: bold;
        }

        .t_trans {
            text-transform: capitalize;
        }

        /*.auto-style1 {
            width: 165px;
        }

        .auto-style2 {
            width: 487px;
        }
        .auto-style3 {
            height: 16px;
        }*/
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint" style="margin: 0 auto; width: 800px;">
            <div style="height: 1500px; width: 794px; font-family: Arial; font-size: 11px; border: 3px solid #212121; padding: 2px; margin: 0 auto;">
                <div style="height: 1498px; width: 792px; font-size: 11px; border: 1px solid #000; background-image: url('../images/Sambalpur_UniversityLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center; -webkit-print-color-adjust: exact;">

                    <%---------Start Header section --------%>
                    <div style="width: 100%;">

                        <div style="text-align: center; margin: 0 auto;">
                            <table style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <td style="text-align: left; padding: 3px 5px;">
                                            <img src="img/sambalpur-university-logo.png" alt="Chhattisgarh Swami Vivekanad Technical University, Raipur" style="width: 105px; height: 90px;" /></td>
                                        <td style="font-size: 24px; font-weight: bold; text-align: center;">CHHATTISGARH SWAMI VIVEKANAD TECHNICAL UNIVERSITY<br />
                                            <span style="font-size: 13px; font-weight: normal;">(State Government Owned)</span><br />
                                            <span style="font-size: 16px; font-weight: normal;">Raipur, Chhattisgarh.</span></td>
                                        <td valign="top">
                                            <div style="float: right;">
                                                <uc1:QRCode runat="server" ID="QRCode" />
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>


                        </div>
                        <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                            <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #ccc; border-bottom: none; border-right: none;">
                                Trans. No.
                            </div>
                            <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #ccc; border-bottom: none;">
                            </div>
                            <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #ccc; border-right: none;">
                                Trans. Date
                            </div>
                            <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #ccc;">
                                <asp:Label ID="lblappdate" runat="server" Font-Bold="True"></asp:Label>
                            </div>
                        </div>

                    </div>
                    <%----------End Header section ---------%>
                    <%---------Start Title section --------%>
                    <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #6C4B3C; color: #fff;">
                        <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; text-transform: uppercase;"></asp:Label>

                        <span style="font-size: 20px"></span>
                    </div>
                    <%----------End title section ---------%>
                    <%---------Start Applicant Section --------%>
                    <div style="margin: 0; width: 100%; height: auto; font-size: 12px;">
                        <%--Programme Table--%>                        <%--<table style="width: 98%; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color:#2f4e6c; -webkit-print-color-adjust: exact;"><b>College Details</b></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table cellspacing="0" cellpadding="0" style="width: 100%; margin: 0;">
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>College Code</b></td>
                                                <td colspan="3" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblCollegeCode" runat="server"></asp:Label></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>College Name</b></td>
                                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblCollegeName" runat="server"></asp:Label></td>
                                            </tr>
                                          
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>--%>
                        <br />
                        <%--Applicant Table--%>

                        <table style="width: 98%; margin: 0 auto;">
                            <tr>
                                <td colspan="2">
                                    <table class="table-bordered" style="width: 100%;">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #2f4e6c; -webkit-print-color-adjust: exact;"><b>Student Details</b></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="border: 1px solid #ccc; width: 135px; vertical-align: top;">
                                                <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 105px;" id="ProfilePhoto" />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center; width: 135px;">
                                                <img runat="server" src="/webApp/kiosk/Images/signature.png" id="ProfileSignature" style="width: 118px; height: 46px;" />

                                            </td>
                                        </tr>
                                    </table>

                                </td>
                                <td style="vertical-align: top;">
                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                        <%--<tr>
                                            <td colspan="4" style="padding: 5px; background-color: #ddd; font-size: 13px; color: #333; border-top: 1px solid #ccc; border-right: 1px solid #ccc; border-left: 1px solid #ccc; text-align: left;">College Details</td>
                                        </tr>--%>
                                        <tr>
                                            <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>College Code</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                <asp:Label ID="lblCollegeCode" runat="server"></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>College Name</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                <asp:Label ID="lblCollegeName" runat="server"></asp:Label></td>
                                        </tr>
                                        <%--<tr>
                                            <td colspan="4" style="padding: 5px; background-color: #ddd; font-size: 13px; color: #333; border-right: 1px solid #ccc; border-left: 1px solid #ccc; text-align: left;">Student Details</td>
                                        </tr>--%>
                                        <tr>
                                            <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Name of the Student</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                <asp:Label ID="FullName" runat="server"></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Aadhaar Number</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                <asp:Label ID="lblAadhaarNo" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Father&#39;s&nbsp;  Name</b></td>
                                            <td width="224" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                <asp:Label ID="FatherName" runat="server"></asp:Label></td>
                                            <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Mother's  Name</b></td>
                                            <td width="263" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                <asp:Label ID="MotherName" runat="server"></asp:Label></td>

                                        </tr>
                                        <tr id="trRelation" runat="server">
                                            <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Guardian  Name</b></td>
                                            <td width="263" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                <asp:Label ID="lblGuardian" runat="server"></asp:Label></td>
                                            <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Relation with Guardian</b></td>
                                            <td width="263" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                <asp:Label ID="lblRelation" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                                <b>Date of Birth
                                                </b></td>
                                            <td width="263" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                <asp:Label ID="DOBConverted" runat="server"></asp:Label></td>
                                            <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>
                                                <span style="font-size: 11px;">(Age as on 31.12.2017)</span></b></td>
                                            <td width="224" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                <asp:Label ID="AgeYear" runat="server"></asp:Label>
                                                <asp:Label ID="AgeMonth" runat="server"></asp:Label>
                                                <asp:Label ID="AgeDay" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Gender</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; width: 120px; font-size: 11px;">
                                                <asp:Label ID="gender" runat="server"></asp:Label></td>
                                            <%-- <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Religion</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="Religion" runat="server"></asp:Label></td>--%>
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1">
                                                <b>Category</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; text-align: left; width: 120px; font-size: 11px;">
                                                <asp:Label ID="Category" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>

                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Mother Tongue</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;">
                                                <asp:Label ID="mothertongue" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Mobile Number</b></td>
                                            <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                <asp:Label ID="MobileNo" runat="server"></asp:Label></td>
                                        </tr>

                                        <tr>

                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                                <b>Email</b>
                                            </td>
                                            <td colspan="3" style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;">
                                                <asp:Label ID="EmailID" runat="server"></asp:Label>
                                            </td>

                                        </tr>

                                        <tr>

                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;font-weight:bold">
                                                Roll No.</td>
                                            <td style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;">
                                                <asp:Label ID="lblRollNo" runat="server"></asp:Label>
                                            </td>

                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;font-weight:bold">Registration No</td>

                                            <td style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;">
                                                <asp:Label ID="lblRegd" runat="server"></asp:Label>
                                            </td>

                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />

                        <table width="500" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #ccc; margin: 0 auto;">

                            <tr>
                                <td style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #2f4e6c; -webkit-print-color-adjust: exact;" colspan="8"><b>Address Details</b></td>
                            </tr>

                            <tr>
                                <td style="width: 160px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>Permanent Address</b>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" colspan="5">
                                    <asp:Label ID="FullPermanentAddress" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>State</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblPState" runat="server"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>District</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblPDistrict" runat="server"></asp:Label>
                                </td>
                                <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>Taluka / Block</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblPBlock" runat="server"></asp:Label>
                                </td>
                                <td style="width: 160px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>Panchayat / Town / City</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblPVillage" runat="server"></asp:Label>
                                </td>
                                <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>PIN</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblPPIN" runat="server"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" colspan="8"></td>
                            </tr>

                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>Present Address</b>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" colspan="5">
                                    <asp:Label ID="FullPresentAddress" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>State</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblState" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>District</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblDistrict" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>Taluka / Block</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblBlock" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>Panchayat / Town / City</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblVillage" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>PIN</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblPIN" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>


                        <%--Applicant Address Table
                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: none; margin: 0 auto;">
                            <tr>
                                <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #2f4e6c; -webkit-print-color-adjust: exact;"><b>Permanent Address</b></td>
                                <td colspan="2" style="padding: 8px; border-left: 1px solid #fff; border-right: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #2f4e6c; -webkit-print-color-adjust: exact;"><b>Present Address</b></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px; font-size: 11px;">
                                    <b>Full Address</b>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; width: 135px; font-size: 11px;">
                                    <asp:Label ID="PAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="PAddressLine2" runat="server"></asp:Label>&nbsp;<asp:Label ID="PRoadStreetName" runat="server"></asp:Label>&nbsp;
                                    <asp:Label ID="PLandMark" runat="server"></asp:Label>
                                    &nbsp;<asp:Label ID="PLocality" runat="server"></asp:Label></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px; font-size: 11px;">
                                    <b>Full Address</b>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; width: 135px; font-size: 11px;">
                                    <asp:Label ID="CAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="CAddressLine2" runat="server"></asp:Label>&nbsp;<asp:Label ID="CRoadStreetName" runat="server"></asp:Label>
                                    &nbsp;<asp:Label ID="CLandMark" runat="server"></asp:Label>&nbsp;<asp:Label ID="CLocality" runat="server"></asp:Label></td>
                            </tr>

                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Panchayat/Village/City</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="PddlVillage" runat="server"></asp:Label></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Panchayat/Village/City</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="CddlVillage" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Block/Taluka</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="PBlock" runat="server"></asp:Label></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Block/Taluka</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="CBlock" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>District</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="PddlDistrict" runat="server"></asp:Label></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>District</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="CddlDistrict" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>State</b>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;">
                                    <asp:Label ID="PddlState" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                    <b>State</b>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;">
                                    <asp:Label ID="CddlState" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Pincode</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="PPinCode" runat="server"></asp:Label></td>
                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Pincode</b></td>
                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                    <asp:Label ID="CPinCode" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                        --%>
                        <br />
                        <%--Academic Profile Table--%>
                        <table width="500" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #ccc; margin: 0 auto;">
                            <tr>
                                <td colspan="7" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #2f4e6c; -webkit-print-color-adjust: exact;"><b>Education Qualification </b></td>

                            </tr>
                            <tr>
                                <td colspan="7">
                                    <asp:GridView ID="GridViewCourse" runat="server" Width="100%" CssClass="table-bordered"
                                        Style="padding: 5px; border: 2px solid #ccc; text-align: center;"
                                        RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px">
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>

                        <br />
                        <%--Reservation Quota Details Table--%>                        <%--Other Information Table--%>
                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #ccc; margin: 0 auto;">
                            <tr>
                                <td colspan="6" style="padding: 5px; text-align: left; font-size: 14px; background-color: #2f4e6c; color: #fff; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;">
                                    <b>Admission Details</b>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; font-size: 11px; text-align: left;">Admission Number
                                </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblAdmissionNo" runat="server"></asp:Label>
                                </td>
                                <td class="sub_hdbg" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; font-size: 11px;">Date of Admission
                                </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblDOA" runat="server"></asp:Label>
                                </td>
                                <td class="sub_hdbg" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; font-size: 11px;">Branch
                                </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;">
                                    <asp:Label ID="lblBrnachName" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" style="padding: 5px; border: 1px solid #ccc;">
                                    <table cellpadding="0" cellspacing="0" style="width: 100%; margin: 5px auto;">
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridViewSubject" runat="server" Width="100%" CssClass="table-bordered"
                                                    Style="padding: 8px; text-align: left; border-color: #ccc;"
                                                    HeaderStyle-Height="30" RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px">                                                   
                                                </asp:GridView>
                                            </td>

                                        </tr>
                                    </table>
                                </td>

                            </tr>

                        </table>

                        <%--Domicile Table--%>
                        <br />
                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;">
                            <tbody>
                                <tr>
                                    <td style="padding: 5px; text-align: left; font-size: 14px; background-color: #2f4e6c; color: #fff; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;">
                                        <b>List of essential documents (enclosed with the application)</b>
                                    </td>

                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" HeaderStyle-HorizontalAlign="Left"
                                Style="margin-bottom: 0; width: 98%; margin: 0 auto; border: 2px solid #ccc;" ClientIDMode="Static" Width="100%" RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px">
                            </asp:GridView>
                        </div>


                        <br />
                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="margin: 0 auto; width: 98%;">
                            <tr>
                                <td colspan="4" style="padding: 5px; text-align: left; font-size: 14px; background-color: #2f4e6c; color: #fff; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;">
                                    <b>Payment Details</b></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; width: 135px; font-size: 11px;">
                                    <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Application Number"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; text-align: left; width: 190px; font-size: 11px;">
                                    <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; width: 135px; font-size: 11px;">
                                    <asp:Label ID="Label31" runat="server" CssClass="lbl_property" Text="Application Date"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; text-align: left; width: 190px; font-size: 11px;">
                                    <asp:Label ID="AppDate" runat="server" CssClass="lbl_value"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; width: 135px; font-size: 11px;">Transaction ID</td>
                                <td style="padding: 5px; border: 1px solid #ccc; text-align: left; width: 190px; font-size: 11px;">
                                    <asp:Label ID="lblTrnsID" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                                <td style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; width: 135px; font-size: 11px;">Transaction Date</td>
                                <td style="padding: 5px; border: 1px solid #ccc; text-align: left; width: 190px; font-size: 11px;">
                                    <asp:Label ID="lblTrnsDate" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; width: 135px; font-size: 11px;">
                                    <asp:Label ID="TokenNo0" runat="server">Kiosk Name (ID)</asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; text-align: left; width: 190px; font-size: 11px;">
                                    <asp:Label ID="lblKiosk" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; width: 135px; font-size: 11px;">
                                    <asp:Label ID="TokenNo3" runat="server">Kiosk Mobile No.</asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #ccc; text-align: left; width: 190px; font-size: 11px;">
                                    <asp:Label ID="lblKioskMob" runat="server" CssClass="lbl_value"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; background-color: #F8F8F8; border: 1px solid #ccc; text-align: left; width: 135px; font-size: 11px;">Transaction Amount</td>
                                <td colspan="3" style="padding: 5px; border: 1px solid #ccc; text-align: left; font-size: 11px;"><i class="fa fa-rupee"></i>
                                    Rs.
                                            <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                                    &nbsp; (<asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                    <%--<asp:Label ID="lblAmtWord" runat="server" Text="(Thirty Two Rupees and Ninety Paise)"></asp:Label>--%>)</td>
                            </tr>
                        </table>

                        <%--Action history--%>
                        <br />
                        <div>
                            <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;">
                                <tbody>
                                    <tr>
                                        <td style="padding: 5px; text-align: left; font-size: 14px; background-color: #2f4e6c; color: #fff; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;">
                                            <b>Action History</b>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                            <div>
                                <asp:GridView ID="grdHistory" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" HeaderStyle-HorizontalAlign="Left"
                                    Style="margin-bottom: 0; width: 98%; margin: 0 auto; border: 2px solid #ccc;" ClientIDMode="Static" Width="100%" RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px">
                                </asp:GridView>
                            </div>
                        </div>
                    </div>

                    <%---------End Applicant Section --------%>
                </div>
            </div>
        </div>

        <br />
        <div style="color: maroon; font-size: 20px; text-align: center; margin: 10px 10px;">
            Please take a printout of this Acknowledgement along with the documents and submit it to your college to complete the Enrolment process.        
        </div>
        <br />
        <div style="text-align: center; margin: 15px 0 50px 0;">
            <input type="button" id="btnSubmit" style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border: none; padding: 8px 15px; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('divPrint');" />

        </div>
    </form>
</body>
</html>
