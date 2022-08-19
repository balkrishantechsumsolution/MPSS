<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Enrollment.Acknowledgement" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement For Enrollment form Admission into CSVTU</title>

    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="../../Scripts/CommonScript.js"></script>--%>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />

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
        </style>
    <script type="text/javascript">
        function CallPrint(strid) {
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=860,height=2010,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }

        function CreateDialog(src, FileName) {
            var dialog = '<div  title="' + FileName + '" style="overflow:hidden;">';
            dialog += '<iframe  src="' + src + '" height="100%" width="100%"></iframe>';
            dialog += '</div>';
            console.log(dialog);
            $(dialog).dialog({ width: '890', height: '600' });

        }

        var baseUrl = "<%= Page.ResolveUrl("~/") %>";

        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }

        function ViewDoc(m_ServiceID, m_AppID, m_Path) {
            var t_URL = "";
            t_URL = m_Path;//+ "&SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
            t_URL = ResolveUrl(t_URL);
            window.open(t_URL, "");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="box-body box-body-open">
            <div id="divPrint" style="margin: 0 auto; width: 100%;">
                <div style="width: 850px; margin: 0 auto; height: auto; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="width: 100%; margin: 0 auto; height: auto; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-image: url('../images/ouatlogobg.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

                        <%---------Start Header section --------%>
                        <div style="height: 140px; width: 100%; border-bottom: 1px solid #999;">
                            <table cellpadding="5" cellspacing="0" style="width: 100%; margin: 0 auto; text-align: center">
                                <tr>
                                    <td>
                                        <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                            <img alt="Logo" src="/Sambalpur/img/sambalpur-university-logo.png" style="width: 85px; margin: 16px 0px 0px 33px;" />
                                        </div>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 22px; font-weight: bolder; text-transform: uppercase; text-align: center"> CHHATTISGARH SWAMI VIVEKANAND <br />TECHNICAL UNIVERSITY,
                             BHILAI </asp:Label>
                                    </td>
                                    <td>
                                        <div style="width: 165px; float: right; margin: 5px 0 0 5px">
                                            <img alt="Logo" src="/Sambalpur/img/DigiVarsity.png" style="width: 100px; margin: 16px 33px 0 15px;" />

                                        </div>
                                    </td>
                                </tr>
                            </table>


                        </div>

                    </div>
                    <%----------End Header section ---------%><%---------Start Title section --------%>
                    <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; background-color: #808080; color: #fff;">
                        <span style="font-size: 20px">Acknowledgement for Admission into CSVTU, 2021-2022</span>
                    </div>
                    <%----------End title section ---------%><%---------Start Applicant Section --------%>
                    <div style="margin: 10px 0; width: 100%; height: auto; font-size: 13px;">

                        <table style="width: 98%; margin: 0 auto; font-size: 16px">
                            <tr>
                                <td style="text-align: center; font-size: 20px" colspan="7">Status:<b><asp:Label ID="lblAppStatus" runat="server">Application Save</asp:Label></b>&nbsp;| 
                                                    <asp:Label ID="lblEnrollType" runat="server" ></asp:Label>
                                    | Application Fee : 
                                                   <b>
                                                       <asp:Label ID="lblPayment" runat="server">Unpaid</asp:Label></b></td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="9"></td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    &nbsp;</td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center" colspan="5">Application No. <b>
                                    <asp:Label ID="AppID" runat="server"></asp:Label></b>&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="9">
                                    </td>
                            </tr>
                            <tr id="trRollNo" runat="server">
                                <td style="text-align: center">
                                    &nbsp;</td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center">CSVTU Enrollment No.:
                                    <asp:Label ID="lblEnrollmentNo" runat="server" Font-Bold="true"></asp:Label></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center">
                                    CSVTU RollNo.: <asp:Label ID="lblRollNo" runat="server" Font-Bold="true"></asp:Label></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td style="text-align: center" colspan="9">
                                    </td>
                            </tr>
                        </table>
                        <%--Programme Table--%>
                        <table style="width: 98%; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Programme Details</b></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 100%; margin: 0;">
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Course</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; white-space: nowrap">
                                                    <asp:Label ID="lblCourse" runat="server"></asp:Label></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Program</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblProgram" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>College</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" colspan="3">
                                                    <asp:Label ID="lblCollege" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <%--Applicant Table--%>

                        <table style="width: 98%; margin: 0 auto;">
                            <tr>
                                <td colspan="2">
                                    <table class="table-bordered" style="width: 100%">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Student Details</b></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; font-size: 11px; text-align: center; width: 155px; vertical-align: top;">
                                                <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 145px;" id="ProfilePhoto" />
                                                <b>Student Photo</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border-top: 1px solid #999; font-size: 11px; text-align: center; width: 155px;">
                                                <img runat="server" src="img/signature.png" id="ProfileSignature" style="width: 145px; height: 50px;" />
                                                <b>Student Sign.</b>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="vertical-align: top;">
                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="margin: 0; width: 100%">
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Student Name</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="FullName" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Gender</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="gender" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Father's Name</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="FatherName" runat="server"></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mother's Name</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="MotherName" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Date of Birth
                                                </b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="DOBConverted" runat="server"></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>
                                                <asp:Label ID="lblAAO" runat="server">(Age as on 31.07.2020)</asp:Label></b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="AgeYear" runat="server"></asp:Label>
                                                <asp:Label ID="AgeMonth" runat="server"></asp:Label>
                                                <asp:Label ID="AgeDay" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Social Category</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 120px;">
                                                <asp:Label ID="Category" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Admitted Category</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblAdmittedCategory" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Email</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="EmailID" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mobile Number</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="MobileNo" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Physically Challenged</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="PWD" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Blood Group</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">

                                                <asp:Label ID="lblBloodGroup" runat="server"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Admission Year</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblAdmissionYear" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Admission Date</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">

                                                <asp:Label ID="lblAdmissionDate" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap">
                                                <b>Course Type</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="lblCourseType" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Exam Type</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">

                                                <asp:Label ID="lblExamType" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap">
                                                <b>DTE Registration No.</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">

                                                <asp:Label ID="lblDTERegister" runat="server"></asp:Label>

                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Nationality</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">

                                                <asp:Label ID="Nationality" runat="server"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr style="display: none">
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap">CSVTU Enrollment No.</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblEnrollment" runat="server" ></asp:Label></td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b></b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">

                                                <asp:Label ID="lblDTERollNo" runat="server" Visible="False"></asp:Label>

                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="6"><b>Domicile Details</b></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                    <asp:Label ID="Label1" runat="server" CssClass="lbl_property" Text="Domicile State"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblDomicileState" runat="server"></asp:Label>

                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Domicile District</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                    <asp:Label ID="lblDomicileDistrict" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Domicile Tehsil</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                    <asp:Label ID="lblDomicileTehsile" runat="server" CssClass="lbl_value"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap">Domicile Issue Date</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblDomicileDate" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap">Domicile Certificate No.</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                    <asp:Label ID="lblDomicileNo" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap">Domicile Issuing Authority</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="5">
                                    <asp:Label ID="lblDomicileIssue" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table id="tblCaste" runat="server" cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="5"><b>Caste Certificate Details</b></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap">Caste Issuing Date</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblCasteDate" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap">Caste Certificate No.</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                    <asp:Label ID="lblCasteNo" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Caste Certificate Issuing Authority</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                    <asp:Label ID="lblCaste" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <%--Applicant Address Table--%>
                        <table width="600" style="width: 100%">
                            <tr>
                                <td style="text-align: left; vertical-align: top">
                                    <table id="PerAddress" runat="server" width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Permanent Address</b></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;">
                                                <b>Address</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                                <asp:Label ID="PAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="PAddressLine2" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td width="146" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                            <td width="339" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                                <asp:Label ID="PRoadStreetName" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 190px;">
                                                <b>Landmark</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="PLandMark" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="PLocality" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="PddlVillage" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Block/Taluka</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="PBlock" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="PddlDistrict" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>State</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="PddlState" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="PPinCode" runat="server"></asp:Label></td>
                                        </tr>
                                    </table>

                                </td>
                                <td style="text-align: left;">
                                    <table id="PreAddress" runat="server" width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; border-left: 1px solid #fff; border-right: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Present Address</b></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;">
                                                <b>Address</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                                <asp:Label ID="CAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="CAddressLine2" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td width="210" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;"><b>Road/Street Name</b></td>
                                            <td width="276" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 190px;">
                                                <asp:Label ID="CRoadStreetName" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Landmark</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="CLandMark" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Locality</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="CLocality" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Panchayat/Village/City</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="CddlVillage" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Block/Taluka</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="CBlock" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>District</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="CddlDistrict" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
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
                                                <asp:Label ID="CPinCode" runat="server"></asp:Label></td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>

                        <br />
                        <table id="DivEdu" runat="server" width="500" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tr>
                                <td style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Academic Profile of Applicant</b></td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                    <asp:GridView ID="grdEducation" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; width: 98%; margin: 0 auto;" ClientIDMode="Static" Width="100%" OnRowDataBound="grdView_RowDataBound">
                                    </asp:GridView>
                                </td>
                            </tr>

                        </table>
                        <br />
                        <%--<div style="page-break-after: always;"></div>--%><%--Academic Profile Table--%>
                        <%--Reservation Quota Details Table--%><%--Domicile Table--%><%--Other Information Table--%>
                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tr>
                                <td colspan="5" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;">
                                    <b>Other Information    </b>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">1. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Have you Enrolled earlier for any course in CSVTU?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: normal">
                                    <asp:Label ID="lblIsEnroll" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trCourse" runat="server">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">CSVTU Enrollment No.</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblCSVTUReg" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">2. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Do you have any gap in Educational Qualifications?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: normal">
                                    <asp:Label ID="lblGap" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trGAP" runat="server">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Education Gap Year</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblGapYear" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">3. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Have you received Migration Certificate from other Board/University?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: normal">
                                    <asp:Label ID="lblMigration" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trMigration" runat="server">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="Label4" runat="server" CssClass="t_trans">Migration Certificate No.</asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblMigrationNo" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="Label32" runat="server" CssClass="t_trans">Migration Issue Date</asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblMigrationDate" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">4. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">Do you have DTE Counselling Entrance Exam Score Card?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight: normal">
                                    <asp:Label ID="lblIsScore" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trScore" runat="server">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="4">
                                    <table width="100%" cellpadding="5" cellspacing="0" class="table table-bordered">
                                        <tr>
                                            <th style="border: 1px solid #999">Examination Roll No</th>
                                            <th style="border: 1px solid #999">Name of Competitive Examination Passed</th>
                                            <th style="border: 1px solid #999">Marks Scored (%)</th>
                                        </tr>
                                        <tr>
                                            <td style="border: 1px solid #999">
                                                <asp:Label ID="lblEntranceNo" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                            <td style="border: 1px solid #999">
                                                <asp:Label ID="lblExamName" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                            <td style="border: 1px solid #999">
                                                <asp:Label ID="lblScoreCard" runat="server" CssClass="t_trans"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div id="divQualification" runat="server">
                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td colspan="4" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;"><b>Qualifiaction Details</b></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="table1 table-bordered" style="width: 100%; margin: auto 0">
                                            <thead>
                                                <tr>
                                                    <th style="white-space: nowrap">Sl. No.</th>
                                                    <th style="white-space: nowrap">Name of Subject</th>
                                                    <th style="white-space: nowrap">Total Marks</th>
                                                    <th style="white-space: nowrap">Marks Secured</th>
                                                    <th style="white-space: nowrap">%</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>1.</td>
                                                    <td>
                                                        <asp:Label ID="lblPhySubject" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;<asp:Label ID="txtPhyTotalMarks" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;<asp:Label ID="txtPhyMarkSecure" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;<asp:Label ID="txtPhyPercentage" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>2.</td>
                                                    <td>
                                                        <asp:Label ID="lblCheSubject" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;<asp:Label ID="txtCheTotalMarks" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;<asp:Label ID="txtCheMarkSecure" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;<asp:Label ID="txtChePercentage" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3.</td>
                                                    <td>
                                                        <asp:Label ID="lblMatSubject" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;<asp:Label ID="txtMatTotalMarks" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;<asp:Label ID="txtMatMarkSecure" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;<asp:Label ID="txtMatPercentage" runat="server" CssClass="t_trans"></asp:Label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        </div>
                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td colspan="4" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;"><b>List of essential documents to be enclosed with the application</b></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table class="table table-bordered" style="margin: 0 auto; width: 98%;">
                                            <tr>
                                                <th style="width: 20px; text-align: left">Select</th>
                                                <th style="width: 200px; text-align: left">Document Name</th>
                                            </tr>
                                            <tr id="trClassX" runat="server">
                                                <td style="text-align: center">
                                                    <input name="" type="checkbox" id="chkClassX" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Class-X Mark Sheet</td>
                                            </tr>
                                            <tr id="trClassXII" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkClassXII" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Class-XII Mark Sheet </td>
                                            </tr>
                                            <tr id="trClassDiploma" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkDiploma" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Diploma Mark Sheet</td>
                                            </tr>
                                            <tr id="trUG" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkUG" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Graduation Mark Sheet</td>
                                            </tr>
                                            <tr id="trPG" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkPG" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Post Graduate Mark Sheet</td>
                                            </tr>
                                            <tr id="trMig" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkMig" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Orginal Migration Certificate</td>
                                            </tr>
                                            <tr id="trCasteDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkCaste" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Caste Certificate</td>
                                            </tr>
                                            <tr id="trDomicileDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkDomicile" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Photocopy of Domicile Certificate</td>
                                            </tr>
                                            <tr id="trGAPDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkGap" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Original for Gap in Education </td>
                                            </tr>
                                            <tr id="trScoreDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkScore" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td style="white-space: nowrap">Photo Copy of Original Entrance Examination Score Card </td>
                                            </tr>
                                            <tr id="trOtherDoc" runat="server">
                                                <td style="text-align: center">
                                                    <input id="chkOtherDoc" name="" type="checkbox" runat="server" disabled="disabled" /></td>
                                                <td>Any other Document </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="4"><b>Payment Details</b></td>
                                <td style="padding: 5px; font-size: 14px; text-align: center; vertical-align: middle" rowspan="4">
                                    <uc1:QRCode runat="server" ID="QRCode" Visible="false" />
                                </td>
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
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsID" runat="server" style="font-weight: bold;">
                                    <asp:Label ID="lblAppFee0" runat="server"></asp:Label>
                                </span></td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                    <asp:Label ID="lblTrnsDate" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                    <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Payment Status</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><b>
                                    <asp:Label ID="lblPayStatus" runat="server"></asp:Label></b>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />

                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;">
                            <tbody>
                                <tr>
                                    <td colspan="4" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;"><b>Application History</b></td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <asp:GridView ID="grdHistory" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; width: 98%; margin: 0 auto;" ClientIDMode="Static" Width="100%" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                        </div>
                    </div>
                    <%---------End Applicant Section --------%>
                </div>
            </div>
        </div>

        <br />
        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
        </div>
    </form>
</body>
</html>
