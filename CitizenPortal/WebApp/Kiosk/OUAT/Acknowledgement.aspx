<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.Acknowledgement" %>

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
    </style>

    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">

                <div id="divPrint" style="margin: 0 auto; width: 80%; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: auto; width: 100%; border: 3px solid #000; padding: 1px; font-family: Arial">
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
                                <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 20px; text-transform: uppercase;">ORISSA UNIVERSITY OF AGRICULTURE AND TECHNOLOGY</asp:Label>
                                <br />
                                <span style="font-size: 20px">APPLICATION FORM FOR ADMISSION INTO UNDERGRADUATE COURSES, 2017-18</span>

                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <div style="margin: 10px; width: 100%; height: auto; font-size: 13px;">


                                <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table-bordered" style="width: 98%;">
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
                                                    <td style="padding: 5px; border-top: 1px solid #999; font-size: 10px; text-align: center; width: 135px;">
                                                        <img runat="server" src="img/signature.png" name="ProfileSignature" id="ProfileSignature" style="width: 118px;height:50px;" /><b>Applicant Sign</b></td>
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
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        &nbsp;</td>
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
                                                    <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="auto-style1"><b>Choice of Exam Center</b></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="exam1" runat="server" Font-Bold="true" Text="1st Choice : "></asp:Label>&nbsp;<asp:Label ID="lblExamCent1" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="exam2" runat="server" Font-Bold="true" Text="2nd Choice : "></asp:Label>&nbsp;<asp:Label ID="lblExamCent2" runat="server"></asp:Label></td>
                                                    <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                        <asp:Label ID="exam3" runat="server" Font-Bold="true" Text="3rd Choice : "></asp:Label>&nbsp;<asp:Label ID="lblExamCent3" runat="server"></asp:Label></td>
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
                                <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999;">
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
                                                        <asp:Label ID="Section1_AbililtyRead" runat="server" CssClass="t_trans" ></asp:Label>
                                                    </td>
                                                    <td>Able to Write Odia :&nbsp;&nbsp;
                                                        <asp:Label ID="Section1_AbilityWrite" runat="server" CssClass="t_trans" ></asp:Label>
                                                    </td>
                                                    <td><%--<span style="font-weight:bold;">--%>Able to Speak Odia :&nbsp;&nbsp;
                                                        <asp:Label ID="Section1_AbilitySpeak" runat="server" CssClass="t_trans" ></asp:Label>
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
                                <table cellpadding="0" cellspacing="0" width="600" style="width: 98%; border: 1px solid #999;display:none;">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="9"><b>Educational Qualification</b></td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">&nbsp;Examination</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Name of the Examination Passed</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Year of Passing</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Name of the Board/Council</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Grade</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: center;">Exam Cleared</td>
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
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
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
                                            (10+2)</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Agro-Polytechnic (Diploma)</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                    </tr>
                                </table>

                                <br />
                                <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999;display:none;">
                                    <tr>
                                        <td colspan="3" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999;"><b>Other Information</b></td>
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
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Category for Reservation</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="reservedcategory" for="LvSpse" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">OUAT Employee Details</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            &nbsp;</td>
                                    </tr>
                                <div id="divOUTEmp" style="display:none" runat="server">
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Name of the Employee</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblOUTEmp" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Employee Code</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblOUATCode" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Designation</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblDesignation" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Status of Service</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblServiceStatus" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Name of the Office Serving / Last Served</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblServing" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Relation with Candidate</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="lblOUATRelation" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                </div>    
                                <div id="divNRI" style="display:none" runat="server">
                                    <tr>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">NRI Sponsor Details</td>
                                        <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        &nbsp;</td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Name of the Sponsoring Person</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblNRIPerson" for="HsCerfte" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Relation with Sponsor</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label6" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label7" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Email ID of Sponsor</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="Label8" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">Mobile No. of Sponsor</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="Label10" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">NRI Permanent Address in India</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="Label11" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">NRI Permanent Address in Abroad</td>
                                        <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                            <asp:Label ID="Label12" runat="server" CssClass="t_trans"></asp:Label>
                                        </td>
                                    </tr>
                                </div>
                                </table>
                                <br />
                                <table cellpadding="0" cellspacing="0" width="100%" style="display: none">
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

                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 0;">
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
                                <br />


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
                    <asp:Button ID="btnHome" runat="server" cssClass="btn btn-success" PostBackUrl="" ToolTip="Back to Home Page"
                                Text="Home" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
<%--http://localhost:53056/WebApp/Kiosk/OISF/Acknowledgement.aspx?AppID=16117388000000000419&SvcID=388--%>