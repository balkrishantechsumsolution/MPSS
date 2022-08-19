<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="battalionAcknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.battalionAcknowledgement" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/CommonScript.js"></script>
    <style>
        .hdbg {
            background-color: #383E4B;
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
        /*.fom-Numbx {
    border: 2px solid #383E4B;
    font-size: 12px;
    color: #383E4B;
    padding: 0 5px 0 5px;
    margin-right:5px;
    position: initial;
    top: 14px;
}*/
        .auto-style1 {
            width: 165px;
        }
    </style>

    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">

                <div id="divPrint" style="margin: 0 auto; width: 80%; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: auto; width: 100%; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 0 auto; height: auto; width: 100%; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 140px; width: 100%; border-bottom: 1px solid #999;">
                                <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                    <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                </div>
                                <div style="width: 165px; float: right;">
                                    <img alt="Logo" src="img/odisha_policelogo.jpg" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                </div>
                                <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                                    <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                        Trans. No.
                                    </div>
                                    <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
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
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; text-transform: uppercase;">APPLICATION FORM FOR RECRUITMENT OF CONSTABLES IN</asp:Label>
                                <br />
                                <span style="font-size: 20px">9TH INDIA RESERVE BATTALION (SPECIALISED)</span>

                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <div style="margin: 10px; width: 100%; height: auto; font-size: 13px;">


                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered" style="width: 98%;">
                                    <tr>
                                        <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B;"><b>Applicant Details</b></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; font-size: 10px; text-align: center; width: 135px;">
                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 118px;" id="ProfilePhoto" /><b>Applicant Photo</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border-top: 1px solid #999; font-size: 10px; text-align: center; width: 135px;">
                                                        <img runat="server" src="img/signature.png" name="ProfileSignature" id="ProfileSignature" style="width: 118px;" /><b>Applicant Sign</b></td>
                                                </tr>
                                            </table>

                                        </td>
                                        <td valign="top">
                                            <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
                                                <tr>
                                                    <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Issue From Battalion</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lbl50Battalion" runat="server" Text="Label"></asp:Label></td>
                                                    <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Issue Date</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lbl50IssueDate" runat="server" Text="Label"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Form Number</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lbl50FromNo" runat="server" Text="Label"></asp:Label></td>
                                                    <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>DD Number</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lbl50DDNo" runat="server"></asp:Label></td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                                <tr>
                                                    <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Name Of The Candidate</b></td>
                                                    <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="FullName" runat="server"></asp:Label></td>
                                                    <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Father's  Name</b></td>
                                                    <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="FatherName" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1">
                                                        <b>Date of Birth
                                                            <br />
                                                            <span style="font-size: 11px;">(Age as on 01.01.2016)</span></b>  </td>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" style="vertical-align: top;">
                                                            <tr>
                                                                <td width="7%" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #999; text-align: left;"><b>DOB</b></td>
                                                                <td width="17%" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="DOBConverted" runat="server"></asp:Label></td>
                                                                <td width="7%" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #999; text-align: left;"><b>Year</b></td>
                                                                <td width="18%" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="AgeYear" runat="server"></asp:Label></td>
                                                                <td width="9%" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #999; text-align: left;"><b>Month</b></td>
                                                                <td width="20%" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="AgeMonth" runat="server"></asp:Label></td>
                                                                <td width="7%" style="padding: 5px; background-color: #F8F8F8; border: 1px solid #999; text-align: left;"><b>Day</b></td>
                                                                <td width="15%" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="AgeDay" runat="server"></asp:Label></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Gender</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 120px;">
                                                        <asp:Label ID="gender" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Religion</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="Religion" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1">
                                                        <b>Category</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="Category" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                        <b>Nationality</b>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Nationality" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Mobile Number</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="MobileNo" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Alternate Mobile Number</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <%--<td width="24%">
                                                                    <asp:Label ID="stdcode" runat="server"></asp:Label>
                                                                </td>--%>
                                                                <td width="76%">
                                                                    <asp:Label ID="phoneno" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Email</b>

                                                    </td>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="EmailID" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>

                                <br />
                                <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999;">
                                    <tr>
                                        <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B;"><b>Permanent Address</b></td>
                                        <td colspan="2" style="padding: 8px; border-left: 2px solid #999; border-right: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B;"><b>Present Address</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;">
                                            <b>Address</b>

                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                            <asp:Label ID="PAddressLine1" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="PAddressLine2" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;">
                                            <b>Address</b>

                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                            <asp:Label ID="CAddressLine1" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="CAddressLine2" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td width="146" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                        <td width="339" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                            <asp:Label ID="PRoadStreetName" runat="server"></asp:Label></td>
                                        <td width="210" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                        <td width="276" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                            <asp:Label ID="CRoadStreetName" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 190px;">
                                            <b>Landmark</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="PLandMark" runat="server"></asp:Label>

                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <b>Landmark</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="CLandMark" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PLocality" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CLocality" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PddlVillage" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CddlVillage" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Block/Taluka</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PBlock" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Block/Taluka</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CBlock" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PddlDistrict" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CddlDistrict" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <b>State</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="PddlState" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <b>State</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="CddlState" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="PPinCode" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="CPinCode" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0" width="600" style="width: 98%; border: 1px solid #999;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="9"><b>Educational Qualification upto HSC</b></td>
                                    </tr>
                                    <tr>
                                        <td width="6%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">State </td>
                                        <td width="23%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Name of the Examination Passed (HSC & Equivalent)</td>
                                        <td width="5%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Year of Passing</td>
                                        <td width="40%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Name of the Board/Council</td>
                                        <td width="7%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Grade</td>
                                        <td width="7%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Exam Cleared</td>
                                        <td width="5%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Total Marks</td>
                                        <td width="4%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Mark Secured</td>
                                        <td width="5%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Percentage %</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center;">
                                            <asp:Label ID="lblEduSate" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; white-space: nowrap;">
                                            <asp:Label ID="lblEduExamName" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; white-space: nowrap;">
                                            <asp:Label ID="lblEduPassingYear" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; /*white-space: nowrap; */">
                                            <asp:Label ID="lblEduBoardName" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; white-space: nowrap;">
                                            <asp:Label ID="lblEduGrade" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; white-space: nowrap;">
                                            <asp:Label ID="lblEduExamCleared" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; white-space: nowrap;">
                                            <asp:Label ID="lblEduTotalMarks" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; white-space: nowrap;">
                                            <asp:Label ID="lblEduMarksScored" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; white-space: nowrap;">
                                            <asp:Label ID="lblEduPercentageMarks" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                                <br />
                                <table cellpadding="0" cellspacing="0" width="600" style="width: 98%; border: 1px solid #999;">
                                    <tbody>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="4"><b>Employment Exchange Details</b></td>
                                        </tr>
                                        <tr>
                                            <td width="8%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">E.Ex. Registration No. </td>
                                            <td width="9%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">E.Ex. Registration Date</td>
                                            <td width="8%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">E.Ex. District</td>
                                            <td width="30%" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">E.Ex. Registration Name</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: center;">
                                                <asp:Label ID="Section7A_RegNo" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: center;">
                                                <asp:Label ID="Section7A_RegDate" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: center;">
                                                <asp:Label ID="Section7B_DistrictEmpExchg" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Section7B_NameEmpExchg" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                                <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999;">
                                    <tr>
                                        <td colspan="2" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999;"><b>Other Information</b></td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">1.</span> Has the Candidate passed Odia as one of the subject in HSC Examination or an examination in Odia language equivalent to M.E. Standard recognised or conducted by the School and Mass Education Department of Odisha. (photo copy with self attestation should be enclosed)</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section1_PassOdia" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="676" style="padding: 5px; border: 1px solid #999; text-align: left;">Ability to Odia langugae
                                        </td>
                                        <td width="315" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>Read&nbsp;&nbsp;
                                    <asp:Label ID="Section1_AbililtyRead" for="checkbox" runat="server" Style="font-size: 16px; font-weight: bold;"></asp:Label>
                                                    </td>
                                                    <td>Write&nbsp;&nbsp;
                                            <asp:Label ID="Section1_AbilityWrite" for="checkbox" runat="server" Style="font-size: 16px; font-weight: bold;"></asp:Label>
                                                    </td>
                                                    <td><%--<span style="font-weight:bold;">--%>Speak&nbsp;&nbsp;
  											<asp:Label ID="Section1_AbilitySpeak" for="checkbox" runat="server" Style="font-size: 16px; font-weight: bold;"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">2.</span> Whether the candidate is married?</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="52%">
                                                        <asp:Label ID="Section2_Married" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td width="48%"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="Marrid_Condition" runat="server">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">If Married, whether he has more than one spouse living?</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section2A_MoreThanOneSpouse" for="LvSpse" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">3.</span> Whether the Candidate Ex-Serviceman?</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section3_ExServiceMan" for="exarmyyes" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <div id="ExServiceMan_Condition" runat="server">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Qualifying Service Rendered in Defence</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td><strong>From :</strong>&nbsp;  
                                                        <asp:Label ID="Section3B_ServiceDurationFrom" runat="server" CssClass="t_trans"></asp:Label></td>
                                                        <td><strong>&nbsp;To :</strong>&nbsp;
                                                <asp:Label ID="Section3B_ServiceDurationTo" runat="server" CssClass="t_trans"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Duration of service</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section3C_ServiceYear" runat="server" CssClass="t_trans"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="Section3C_ServiceMonth" runat="server" CssClass="t_trans"></asp:Label></td>
                                                        <td>
                                                            <asp:Label ID="Section3C_ServiceDay" runat="server" CssClass="t_trans"></asp:Label></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </div>

                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">4.</span> Whether the candidate is a Sports Person ?</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section4_IsSportsPerson" for="exarmy" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <div id="SportsPerson_Condition" runat="server">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Name of the Participated Sports event</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Section4A_SportsParticipated" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Please Mention The Sports Federation or Association Name</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Section4C_SportsFedAssName" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Whether he wants to avail relaxation in height, weight & chest.</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section4B_WantsRelaxation" for="wntavlrlxon" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Relaxation wants to avail Physical Measurements </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td><strong>Height :</strong>
                                                            <asp:Label ID="RelaxationHeight" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td><strong>Chest :</strong>
                                                            <asp:Label ID="RelaxationChest" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td><strong>Weight :</strong>
                                                            <asp:Label ID="RelaxationWeight" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </div>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">5.</span> If Sports Person (candidate only indicate one sports event participatedin Open National Championship / International Championship and the same should be recognised and sponsored either by the recognised National Sports Federations / Associations or Indian Olympic Association, Odisha State Sports Association, Affiliated to the recognised National Sports Federation / Association)</td>
                                    <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Section5" runat="server" CssClass="t_trans"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>

                                    <%--<tr>
                                        <td colspan="2" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;"><span class="fom-Numbx">5.</span> If Sports Person (candidate only indicate one sports event participatedin Open National Championship / International Championship and the same should be recognised and sponsored either by the recognised National Sports Federations / Associations or Indian Olympic Association, Odisha State Sports Association, Affiliated to the recognised National Sports Federation / Association)</td>
                                    </tr>--%>
                                    <div id="plyntnalYesNo_Condition" runat="server">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">(A) Participated in Sports Event</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Section5A_ParticipateEvent" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">(B) In which Sports and Category (National / International)</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section5B_SportsCategory" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">(C) Awarded any Medal (Gold/Silver/Bronze) Appreciation ( 1st / 2nd / 3rd )</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section5C_SportsMedal" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </div>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">6.</span> Whether the candidate possess NCC Certificate?</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section6_NCCCertificate" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <div id="NCC_Condition" runat="server">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Category of NCC Certificate</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section6A_NCCCertificateCategory" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </div>
                                    <%--<tr>
                                        <td colspan="2" class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">7.</span>Registration No., Date and Name of Employment Exchange</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Registration No. & Date</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section7A_RegNo" runat="server"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Section7A_RegDate" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Name of Employment Exchange</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="Section7B_NameEmpExchg" runat="server"></asp:Label>
                                        </td>
                                    </tr>--%>

                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">7.</span> Whether the candidate possess a Driving licenses having the validity for at least 1 year (Excluding the learning period) ?</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section8_HasDL" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <div id="Drivinglicense_Condition" runat="server">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">(A) Whether the license is applicable for Heavy Vehicle or light vehicle (photo copy of such license with self attestation should be enclosed).</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section8A_LicenseVehicle" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">(B) Licenses Number and Date</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section8B_LicenseNo" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Section8B_LicenseDate" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">(C) District of RTO Office from which license issued</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Section8C_NameRTODistrict" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">(D) Name of the RTO Office from which license issued</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="Section8C_NameRTOOffice" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                    </div>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">8.</span> Whether the candidate involved in any criminal case?</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section9_InvolvedCriminalYesNo" for="CrmnlInvlv" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <%--<td>&nbsp;No
                                            <asp:Label ID="Section9_InvolvedCriminalNo" for="NtCrmnlInvlv" runat="server" Style="font-size: 16px; font-weight: bold;"></asp:Label>
                                                    </td>--%>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <div id="InvolvedCriminal_Condition" runat="server">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Status of the Criminal Case</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section9A_ArrestDetail" for="Actd" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <%--<td>&nbsp;Convicted
                                                        <asp:Label ID="Section9A_ArrestDetailCnvtd" for="Cnvtd" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>--%>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">State where case is Registered</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section9C_State" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Name of the District</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section9C_District" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Police Station Name</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section9D_PoliceStationNo" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Police Station Case Reference Number</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section9B_CaseRefNo" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">IPC Section</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Section9E_IPCSection" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </div>

                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">9.</span> Whether the candidate is come with Demand Draft of Rs.200?</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Section10A_DDDetail" for="DD Details" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <div id="HvngDD" runat="server">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">DD Issue Bank Name</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl200Battalion" for="Actd" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">DD Number</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl200DDNo" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Date of Issue</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl200IssueDate" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Amount</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lbl200Amount" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                    </div>
                                </table>
                                <br />
                                <table style="display: none; width: 100%;">
                                    <tr>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;"><b>List of essential documents (enclosed with the application)</b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none; width: 10px;">Sl. </td>
                                        <td style="border-left: 1px solid #999; border-top: 1px solid #999; border-right: 1px solid #999; padding: 5px; text-align: justify;">Document Name</td>
                                        <td style="border-left: 1px solid #999; border-top: 1px solid #999; border-right: 1px solid #999; padding: 5px; text-align: justify;">Status</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: center; border-right: none;">1.</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: justify; white-space: nowrap;">Identification Document(Voter ID/PAN Card/Driving Licence)</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: justify; white-space: nowrap;">Attached</td>
                                    </tr>
                                </table>
                                <br />
                                <table class="table-bordered" style="width: 98%; border: 0;">
                                    <tr>
                                        <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Payment Details<asp:Label ID="AppName" runat="server" CssClass="lbl_value" Style="white-space: normal !important;" Visible="False"></asp:Label>
                                        </b></td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                            <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
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
                                    <tr style="display: none">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Portal Fee + Service Tax</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                            Rs.
                                            <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                                            + <i class="fa fa-rupee"></i>
                                            <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                            Rs.
                                            <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                            <%--<asp:Label ID="lblAmtWord" runat="server" Text="(Thirty Two Rupees and Ninety Paise)"></asp:Label>--%>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; display: none;">
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
                            </div>
                            <%----------End Document Section ---------%>
                            <div style="clear: both; margin: 0; line-height: 0; padding: 0; width: 135px;">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear" style="page-break-before: always;">
                    &nbsp;
                </div>
                <div style="text-align: center; margin-bottom: 10px;">
                    <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
