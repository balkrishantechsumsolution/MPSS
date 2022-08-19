<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormBAcknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.FormBAcknowledgement" %>

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

        .auto-style2 {
            width: 487px;
        }

        .auto-style3 {
            height: 29px;
        }
    </style>

    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">

                <div id="divPrint" style="margin: 0 auto; width: 80%; /*height: 1220px; overflow: auto;*/ ">
                    <div style="margin: 0 auto; height: auto; width: 100%; border: 3px solid #000; padding: 3px; font-family: Arial">
                        <div style="margin: 0 auto; height: auto; width: 100%; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-image: url('../images/ouatlogobg.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <div style="height: 140px; width: 100%; border-bottom: 1px solid #999;">
                                <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                    <img alt="Logo" src="../images/depLgog.png" style="width: 110px; margin: 25px 0px 0px 33px;" />
                                </div>
                                <div style="width: 165px; float: right;">
                                    <img alt="Logo" src="/webApp/kiosk/Images/OUAT.png" style="width: 100px; margin: 16px 0px 0px 33px;" />
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
                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; text-transform: uppercase;">FORM-B APPLICATION<br />ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY</asp:Label>
                                <br />
                                <span style="font-size: 20px">APPLICATION FORM FOR ADMISSION INTO UNDERGRADUATE COURSES, 2017-18</span>

                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <div style="margin: 10px; width: 100%; height: auto; font-size: 13px;">


                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered" style="width: 98%; line-height:16px;">
                                    <tr>
                                        <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B;"><b>Applicant Details</b></td>
                                    </tr>
                                    <tr>
                                        <td style="vertical-align: top;">
                                            <table border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; font-size: 10px; text-align: center; width: 135px; vertical-align: top;">
                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 118px;" id="ProfilePhoto" /><b>Applicant Photo</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; border-top: none; font-size: 10px; text-align: center; width: 135px;">
                                                        <img runat="server" src="img/signature.png" name="ProfileSignature" id="ProfileSignature" style="width: 118px; height: 50px;" /><b>Applicant Sign</b></td>
                                                </tr>
                                            </table>

                                        </td>
                                        <td valign="top">
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                                <tr>
                                                    <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Name Of The Candidate</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style2" colspan="3">
                                                        <asp:Label ID="FullName" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Aadhaar Number</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="lblAadhaarNo" runat="server"></asp:Label></td>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mother's  Name</b></td>
                                        <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="MotherName" runat="server"></asp:Label></td>
                                        <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Father&#39;s&nbsp;  Name</b></td>
                                        <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="FatherName" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <b>Date of Birth
                                            </b></td>
                                        <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="DOBConverted" runat="server"></asp:Label></td>
                                        <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>
                                            <span style="font-size: 11px;">(Age as on 31.12.2017)</span></b></td>
                                        <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="AgeYear" runat="server"></asp:Label>
                                            <asp:Label ID="AgeMonth" runat="server"></asp:Label>
                                            <asp:Label ID="AgeDay" runat="server"></asp:Label></td>
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
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mother Tongue</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="mothertongue" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1">
                                            <b>Nationality</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                            <asp:Label ID="Nationality" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <b>Email</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="EmailID" runat="server"></asp:Label>
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
                                        <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Exam Center</b></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="lblExamCenter" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="exam2" runat="server" Font-Bold="True" Text="Roll Number"></asp:Label>&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                            <asp:Label ID="lblRollNo" runat="server"></asp:Label></td>
                                    </tr>
                                </table>
                                </td>
                                    </tr>
                                </table>

                                <br />
                                <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; line-height:16px;">
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
                               
                                <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; line-height:16px;">
                                    <tr>
                                        <td colspan="3" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999;"><b>Domicile Information</b></td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">1.</span> </td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Has the Candidate passed Odia as one of the subject in HSC Examination?</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="lblOdia" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="padding: 0;" id="trLang" runat="server">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>Able to Read Odia :&nbsp;&nbsp;
                                                        <asp:Label ID="Section1_AbililtyRead" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>Able to Write Odia :&nbsp;&nbsp;
                                                        <asp:Label ID="Section1_AbilityWrite" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td><%--<span style="font-weight:bold;">--%>Able to Speak Odia :&nbsp;&nbsp;
                                                        <asp:Label ID="Section1_AbilitySpeak" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="trResType" runat="server">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">Residence Type :&nbsp;&nbsp;
                                            <asp:Label ID="lblResidentType" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>

                                </table>
                             
                                <br />

                                <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; line-height:18px;">
                                    <tr>
                                        <td colspan="3" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999;"><b>Reservation Quota Details</b></td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;"><span class="fom-Numbx">1.</span> </td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Want to claim for Reserved Seat?</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                            <asp:Label ID="isreserved" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="border: 1px solid #999; text-align: left;" colspan="2">
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td rowspan="2" style="border-right: 1px solid #999; padding:3px;">Claimed Reserved Seat Category :&nbsp;&nbsp;</td>
                                                    <td style="border-right: 1px solid #999; border-bottom: 1px solid #999; line-height: 20px; padding:2px 3px;">
                                                        <asp:Label ID="Label32" runat="server" CssClass="t_trans">Green Card Holder</asp:Label>
                                                        &nbsp;:
                                                        <asp:Label ID="lblIsGCH" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td style="border-right: 1px solid #999; border-bottom: 1px solid #999; line-height: 20px; padding:2px 3px;">
                                                        <asp:Label ID="Label2" runat="server" CssClass="t_trans">Physically Handicapped</asp:Label>
                                                        &nbsp;:&nbsp;&nbsp;
                                                        <asp:Label ID="lblIsHC" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td style="border-bottom: 1px solid #999; line-height: 20px; padding:2px 3px;"><%--<span style="font-weight:bold;">--%>
                                                        <asp:Label ID="Label33" runat="server" CssClass="t_trans">NRI Sponsorship</asp:Label>
                                                        &nbsp;:&nbsp;&nbsp;
                                                        <asp:Label ID="lblIsNRI" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-right: 1px solid #999; line-height: 20px; padding:2px 3px;">
                                                        <asp:Label ID="Label35" runat="server" CssClass="t_trans">Western Odisha</asp:Label>
                                                        &nbsp;:&nbsp;
                                                        <asp:Label ID="lblIsWO" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td style="border-right: 1px solid #999; line-height: 20px; padding:2px 3px;">
                                                        <asp:Label ID="Label37" runat="server" CssClass="t_trans">OUAT Employee</asp:Label>
                                                        &nbsp;:&nbsp;
                                                        <asp:Label ID="lblIsOE" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td style="line-height: 20px; padding: 5px;">
                                                        <asp:Label ID="Label39" runat="server" CssClass="t_trans">Kashmir Migrant</asp:Label>
                                                        &nbsp;:&nbsp;
                                                        <asp:Label ID="lblIsKM" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <div id="divPH" style="display: none" runat="server">
                                        <tr>
                                            <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Reservation details under Physically Handicapped quota</td>
                                            <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Handicapped part of the body</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblHanfiPart" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Percentage of Handicapped</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblHandiPersent" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </div>
                                    <div id="divWO" style="display: none" runat="server">
                                        <tr>
                                            <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Reservation details under Western Odisha quota</td>
                                            <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Please select residing District of Western Odisha</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="lblResiDistrict" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>

                                    </div>
                                    <div id="divKM2" style="display: none" runat="server">
                                        <tr>
                                            <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Reseavation details under Kashmiri Migrant quota</td>
                                            <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" class="auto-style3"></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" class="auto-style3">Period of Stay in Kashmir</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;" class="auto-style3">From
                                                <asp:Label ID="lblKMFrom" runat="server" CssClass="t_trans"></asp:Label>
                                                &nbsp;to
                                                <asp:Label ID="lblKMTo" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">Duration of Stay</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblKMDuration" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                    </div>
                                </table>

                                <br />

                                <table cellpadding="0" cellspacing="0" width="600" style="width: 98%; border: 1px solid #999; line-height:16px;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="9"><b>Educational Qualification</b></td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">&nbsp;Examination</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Name of the Examination Passed</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Year of Passing</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Name of the Board/Council</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Grade</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center; display: none">Exam Cleared</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Total Marks</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Mark Secured</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Percentage %</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">High School</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduExamName" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduPassingYear" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduBoardName" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduGrade" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; display: none">
                                            <asp:Label ID="lblEduExamCleared" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduTotalMarks" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduMarksScored" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduPercentageMarks" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Higher Secondary<br />
                                            (+2)</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduExamName0" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduPassingYear0" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduBoardName0" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduGrade0" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; display: none">
                                            <asp:Label ID="lblEduExamCleared0" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduTotalMarks0" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduMarksScored0" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblEduPercentageMarks0" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>

                                <br />
                                <%-- Start Subject Details of Class 12 --%>
                                <div class="row" id="div1" runat="server">
                                    <div class="col-md-12 box-container" style="width: 98% !important;">
                                        <div style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;">
                                            Select Marks Partarn and enter the marks scrored in +2 Science Examination
                                    
                                        </div>
                                        <div class="box-body box-body-open" style="padding: 0px;">
                                            <table cellpadding="0" cellspacing="0" style="width: 100%; margin: 0;" class="table-striped table-bordered table">
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="rbtnMarkN" runat="server" Text="CHSE Marks Partern (Separate marks for Theory & Practical)"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="rbtnMarkY" runat="server" Text="ICSE / CBSE & Other Board Marks Partern (Combined marks including Theory & Practical)"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div class="clearfix"></div>
                                            <br />
                                            <div class="row" id="divMarks">
                                                <div class="form-group col-md-12" style="margin-bottom: 0 !important;">
                                                    <table width="600" cellpadding="0" cellspacing="0" style="width: 100%; border: 1px solid #999; line-height:12px;" class="table table-striped table-bordered">
                                                        <tbody>
                                                            <tr style="border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;">
                                                                <th style="padding: 5px; border: 1px solid #999; text-align: center;">
                                                                    <label for="">
                                                                        Sl. No.</label></th>
                                                                <th style="text-align: center; width: 20%; padding: 5px; border: 1px solid #999; ">
                                                                    <label class="manadatory" for="">
                                                                        Name of Subject</label>
                                                                </th>
                                                                <th style="text-align: center; padding: 5px; border: 1px solid #999; ">
                                                                    <asp:Label ID="lblTheoryTotal" runat="server" Text="Total Mark in Theory"></asp:Label>
                                                                </th>
                                                                <th style="text-align: center; padding: 5px; border: 1px solid #999; ">
                                                                    <asp:Label ID="lblTheoryObtain" runat="server" Text="Mark Obtain in Theory"></asp:Label>
                                                                </th>
                                                                <th style="text-align: center; padding: 5px; border: 1px solid #999; " id="thPTM" runat="server">
                                                                    <asp:Label ID="lblPractTotal" runat="server" Text="Total Mark in Practical"></asp:Label>
                                                                </th>
                                                                <th style="text-align: center; padding: 5px; border: 1px solid #999; " id="thPMO" runat="server">
                                                                    <asp:Label ID="lblPractObtain" runat="server" Text="Marks Obtain Practical"></asp:Label>
                                                                </th>
                                                                <th style="text-align: center; padding: 5px; border: 1px solid #999; ">
                                                                    <asp:Label ID="lblMarks" runat="server">
                                                                    </asp:Label></th>
                                                                <th style="text-align: center; padding: 5px; border: 1px solid #999; ">
                                                                    <asp:Label ID="lblObtain" runat="server">
                                                                    </asp:Label></th>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #999; ">1.</td>
                                                                <td style="padding: 5px; border: 1px solid #999; ">
                                                                    <select name="ddlSubject" id="ddlSubjectPhysics" class="form-control" data-val="true" data-val-number="Village." data-val-required="Please select subject">

                                                                        <option value="Physics">Physics</option>

                                                                    </select>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMT_Physics" class="form-control" placeholder="0" name="txtTotalPhysics0" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtMOT_Physics" class="form-control" placeholder="0" name="txtTotalPhysics1" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; " id="tdPTMP" runat="server">
                                                                    <asp:Label ID="txtTMP_Physics" class="form-control" placeholder="0" name="txtTotalPhysics" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; " id="thPMOP" runat="server">
                                                                    <asp:Label ID="txtMOP_Physics" class="form-control" placeholder="0" name="txtMarksObtainPhysics" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMTP_Physics" class="form-control" placeholder="0" name="txtTotalPhysics15" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMOTP_Physics" class="form-control" placeholder="0" name="txtTotalPhysics10" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; text-align:left; border: 1px solid #999; ">2.</td>
                                                                <td style="padding: 5px; text-align:left; border: 1px solid #999; ">
                                                                    <select name="ddlSubject" id="ddlSubjectChemistry" class="form-control" data-val="true" data-val-required="Please select subject">

                                                                        <option value="Chemistry">Chemistry</option>

                                                                    </select>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMT_Chemistry" class="form-control" placeholder="0" name="txtTotalPhysics2" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtMOT_Chemistry" class="form-control" placeholder="0" name="txtTotalPhysics3" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999;" id="tdPTMC" runat="server">
                                                                    <asp:Label ID="txtTMP_Chemistry" class="form-control" placeholder="0" name="txtTotalChemistry" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; " id="thPMOC" runat="server">
                                                                    <asp:Label ID="txtMOP_Chemistry" class="form-control" placeholder="0" name="txtMarksObtainChemistry" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMTP_Chemistry" class="form-control" placeholder="0" name="txtTotalPhysics16" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMOTP_Chemistry" class="form-control" placeholder="0" name="txtTotalPhysics11" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; text-align:left; border: 1px solid #999; ">3.</td>
                                                                <td style="padding: 5px; text-align:left; border: 1px solid #999; ">
                                                                    <select name="ddlSubject" id="ddlSubjectMath" class="form-control" data-val="true" data-val-required="Please select subject">

                                                                        <option value="Mathematics">Mathematics</option>
                                                                    </select>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMT_Maths" class="form-control" placeholder="0" name="txtTotalPhysics4" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtMOT_Maths" class="form-control" placeholder="0" name="txtTotalPhysics5" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px;  text-align:center; border: 1px solid #999; " id="tdPTMPM" runat="server">
                                                                    <asp:Label ID="txtTMP_Maths" class="form-control" placeholder="0" name="txtTotalMath" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; " id="thPMOM" runat="server">
                                                                    <asp:Label ID="txtMOP_Maths" class="form-control" placeholder="0" name="txtMarksObtainMath" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMTP_Maths" class="form-control" placeholder="0" name="txtTotalPhysics17" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMOTP_Maths" class="form-control" placeholder="0" name="txtTotalPhysics12" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; text-align:left; border: 1px solid #999; ">4.</td>
                                                                <td style="padding: 5px; text-align:left; border: 1px solid #999; ">
                                                                    <%--<select name="ddlSubject" id="ddlSubjectBio" class="form-control" data-val="true" data-val-required="Please select subject">

                                                                <option value="Biology">Botany</option>
                                                            </select>--%>
                                                                    <asp:Label ID="lblBiology" class="form-control" placeholder="0" name="txtTotalPhysics6" type="text" value="" Style="text-align: left" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMT_Botany" class="form-control" placeholder="0" name="txtTotalPhysics6" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtMOT_Botany" class="form-control" placeholder="0" name="txtTotalPhysics7" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; " id="tdPTMB" runat="server">
                                                                    <asp:Label ID="txtTMP_Botany" class="form-control" placeholder="0" name="txtTotalBio" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; " id="thPMOB" runat="server">
                                                                    <asp:Label ID="txtMOP_Botany" class="form-control" placeholder="0" name="txtMarksObtainBio" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMTP_Botany" class="form-control" placeholder="0" name="txtTotalPhysics18" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>

                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMOTP_Botany" class="form-control" placeholder="0" name="txtTotalPhysics13" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>

                                                            </tr>
                                                            <tr id="trZoo" runat="server">
                                                                <td style="padding: 5px; text-align:left; border: 1px solid #999; ">5.</td>
                                                                <td style="padding: 5px; text-align:left; border: 1px solid #999; ">
                                                                    <select name="ddlSubjectZoo" id="ddlSubjectZoo" class="form-control" data-val="true" data-val-required="Please select subject">

                                                                        <option value="Zoology">Zoology</option>
                                                                    </select>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMT_Zoology" class="form-control" placeholder="0" name="txtTotalPhysics8" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtMOT_Zoology" class="form-control" placeholder="0" name="txtTotalPhysics9" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; " id="tdPTMPZ" runat="server">
                                                                    <asp:Label ID="txtTMP_Zoology" class="form-control" placeholder="0" name="txtTotalZoo" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; " id="thPMOZ" runat="server">
                                                                    <asp:Label ID="txtMOP_Zoology" class="form-control" placeholder="0" name="txtMarksObtainZoo" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMTP_Zoology" class="form-control" placeholder="0" name="txtTotalPhysics19" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>

                                                                <td style="padding: 5px; text-align:center; border: 1px solid #999; ">
                                                                    <asp:Label ID="txtTMOTP_Zoology" class="form-control" placeholder="0" name="txtTotalPhysics14" type="text" value="" Style="text-align: right" onchange="TotalMarksInTheory();" maxlength="3" onkeypress="return isNumberKey(event);"
                                                                        autofocus readonly="true" runat="server"></asp:Label></td>

                                                            </tr>
                                                            <tr style="font-weight: bold;  padding: 5px; border: 1px solid #999;  display: none;">
                                                                <td style="text-align: left; padding: 5px; border: 1px solid #999;  font-weight: bold;" colspan="2">TOTAL</td>
                                                                <td style="text-align: right; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" Style="font-weight: bolder;" ID="txtTMT_Total">0</asp:Label></td>
                                                                <td style="text-align: right; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" Style="font-weight: bolder;" ID="txtMOT_Total">0</asp:Label></td>
                                                                <td style="text-align: right; padding: 5px; border: 1px solid #999;  font-weight: bold;" id="tdPTMPT">
                                                                    <asp:Label runat="server" Style="font-weight: bolder;" ID="txtTMP_Total">0</asp:Label></td>
                                                                <td style="text-align: right; padding: 5px; border: 1px solid #999;  font-weight: bold;" id="thPMOT">
                                                                    <asp:Label runat="server" Style="font-weight: bolder;" ID="txtMOP_Total">0</asp:Label></td>
                                                                <td style="text-align: right; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" Style="font-weight: bolder;" ID="txtTMTP_Total">0</asp:Label></td>
                                                                <td style="text-align: right; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" Style="font-weight: bolder;" ID="txtTMOTP_Total">0</asp:Label></td>

                                                            </tr>
                                                            <tr style="font-weight: bold">
                                                                <td style="padding: 5px; border: 1px solid #999; " colspan="2">Marks in PCM
                                                            <asp:Label runat="server" Style="font-weight: bolder; margin-left: 20px; width: 50px;" ID="lblPCM">(  0%  )</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999; font-weight: bold;">
                                                                    <asp:Label runat="server" ID="txtTMT_PCM">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" ID="txtMOT_PCM">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;" id="tdPTMPTPCM" runat="server">
                                                                    <asp:Label runat="server" ID="txtTMP_PCM">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;" id="thPMOPCM" runat="server">
                                                                    <asp:Label runat="server" ID="txtMOP_PCM">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" ID="txtTMTP_PCM">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" ID="txtTMOTP_PCM">0</asp:Label></td>

                                                            </tr>
                                                            <tr style="font-weight: bold">
                                                                <td style="padding: 5px; border: 1px solid #999; " colspan="2">Marks in PCB
                                                            <asp:Label runat="server" Style="font-weight: bolder; margin-left: 20px; width: 50px;" ID="lblPCB">(  0%  )</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" ID="txtTMT_PCB">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" ID="txtMOT_PCB">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;" id="tdPTMPTPCB" runat="server">
                                                                    <asp:Label runat="server" ID="txtTMP_PCB">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" ID="txtMOP_PCB">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;" id="thPMOPCB" runat="server">
                                                                    <asp:Label runat="server" ID="txtTMTP_PCB">0</asp:Label></td>
                                                                <td style="text-align:center; padding: 5px; border: 1px solid #999;  font-weight: bold;">
                                                                    <asp:Label runat="server" ID="txtTMOTP_PCB">0</asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <table cellpadding="0" cellspacing="0" width="98%" style="">
                                    <tr style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;">
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;" colspan="3"><b>List of essential documents (enclosed with the application)</b></td>
                                    </tr>
                                </table>
                                <asp:GridView ID="grdView" runat="server" CellPadding="3" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0;" ClientIDMode="Static" Width="98%">
                                </asp:GridView>

                                <div style="color: maroon; font-size: 20px; text-align:center; margin:10px 10px;">
                                   Please take a printout of the submitted FORM-B Application (this page). The FORM-B application should be submitted with the documents at time of Admission if selected.        
                                </div>
                                <%-- <div class="clear"style="page-break-before: always;">
                                
                            </div>--%>
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 0; display: none">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="4"><b>Payment Details</b></td>

                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                            <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Application Number"></asp:Label>
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
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsID" runat="server" style="font-weight: bold;"></span></td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsDate" runat="server" style="font-weight: bold;">wrwe</span></td>
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
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                </div>
                
                    &nbsp;
                </div>
                <div style="text-align: center; margin-bottom: 10px;">
                    <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
                    <asp:Button ID="btnHome" runat="server" CssClass="btn btn-success" PostBackUrl="" ToolTip="Back to Home Page"
                        Text="Home" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
