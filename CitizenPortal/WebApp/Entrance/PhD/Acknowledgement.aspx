<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.PGPhD.Acknowledgement" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement For PhD Admission Form</title>

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

        .auto-style2 {
            width: 487px;
        }

        .auto-style3 {
            width: 100%;
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
                <div style="margin: 0 auto; height: auto; width: 100%; border: 3px solid #000; padding: 1px; font-family: Arial">
                    <div style="margin: 0x auto; height: auto; width: 100%; border: 1px solid #000; background-image: url('../images/ouatlogobg.png'); background-image: url('../images/ouatlogobg.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

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
                                        <asp:Label runat="server" ID="lblCertificateName" Style="font-size: 22px; font-weight: bolder; text-transform: uppercase; text-align: center">
                                CHHATTISGARH SWAMI VIVEKANAND <br />TECHNICAL UNIVERSITY,
                             BHILAI
                                        </asp:Label>
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
                        <asp:Label ID="lblExamName" runat="server" style="font-size: 20px" Text="Acknowledgement for appearing in the Entrance Examination for Ph.D. Programme, 2022"></asp:Label>
                    </div>
                    <%----------End title section ---------%><%---------Start Applicant Section --------%>
                    <div style="margin: 10px 0; width: 100%; height: auto; font-size: 13px;">
                        <br />
                        <table style="width:98%; margin: 0 auto; font-size: 16px">
                            <tr>
                                <td style="text-align: center;font-size: 20px" colspan="7">Status:<b><asp:Label ID="lblAppStatus" runat="server">Application Save</asp:Label></b>&nbsp;| 
                                                    <asp:Label ID="lblCourseType" runat="server"></asp:Label> | Application Fee : 
                                                   <b> <asp:Label ID="lblPayment" runat="server">Unpaid</asp:Label></b></td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                                    <asp:Label ID="lblIsExempted" runat="server">Entrance NOT Exempted</asp:Label></td>
                                <td style="text-align: center"> </td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">| </td>
                                <td style="text-align: center">Application No. <b><asp:Label ID="AppID" runat="server"></asp:Label></b>&nbsp;</td>
                                <td style="text-align: center">| </td>
                                <td style="text-align: center">ROLL No.
                                                    <b><asp:Label ID="lblRollNo" runat="server">Unassigned</asp:Label></b></td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <%--Programme Table--%>
                        <table style="width: 98%; margin: 0 auto;">
                            <tbody>
                                <tr>
                                    <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Programme Details</b></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 100%; margin: 0;">
                                            <tr id="divExempted">
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                    <b>Research Center</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" colspan="3">
                                                    <asp:Label ID="lblResearch" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Discipline</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;white-space:nowrap">
                                                    <asp:Label ID="lblDiscipline" runat="server"></asp:Label></td>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Specialization</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    <asp:Label ID="lblSpecialization" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Entrance Exempted </b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" colspan="3">
                                                    <asp:Label ID="lblExempted" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>
                                                <td style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Relaxtion of Test Exemption</b></td>
                                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" colspan="3">
                                                    <asp:Label ID="lblExamRelaxation" runat="server"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <%--Applicant Table--%>

                        <table style="width: 98%; margin: 0 auto;">
                            <tr>
                                <td colspan="2">
                                    <table class="table-bordered" style="width: 100%;">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Applicant Details</b></td>
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
                                                <b>Applicant Photo</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border-top: 1px solid #999; font-size: 11px; text-align: center; width: 155px;">
                                                <img runat="server" src="img/signature.png" id="ProfileSignature" style="width: 145px; height: 50px;" />
                                                <b>Applicant Sign.</b>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="vertical-align: top;">
                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                        <tr>
                                            <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Name of Applicant</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style2">
                                                <asp:Label ID="FullName" runat="server"></asp:Label>
                                            </td>
                                            <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Gender</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;" class="auto-style2">
                                                <asp:Label ID="gender" runat="server"></asp:Label>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Father's Name</b></td>
                                            <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="FatherName" runat="server"></asp:Label></td>
                                            <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mother's Name</b></td>
                                            <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="MotherName" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Date of Birth
                                                </b></td>
                                            <td width="263" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="DOBConverted" runat="server"></asp:Label></td>
                                            <td width="194" style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>
                                                <asp:Label runat="server" ID="lblAgeAsOn" style="font-size: 11px;" Text="(Age as on 31.07.2022)"></asp:Label></b></td>
                                            <td width="224" style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="AgeYear" runat="server"></asp:Label>
                                                <asp:Label ID="AgeMonth" runat="server"></asp:Label>
                                                <asp:Label ID="AgeDay" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Category</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 120px;">
                                                <asp:Label ID="Category" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Nationality</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="Nationality" runat="server"></asp:Label>
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
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;white-space:nowrap">
                                                <b>Physically Challanged</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                <asp:Label ID="PWD" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Type of PwD</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                    
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <table class="auto-style3">
                                                    <tr>
                                                        <td>Ortho :
                                                    
                                                <asp:Label ID="isOrtho" runat="server"></asp:Label>
                                                        </td>
                                                        <td>Visual :<asp:Label ID="IsVisual" runat="server"></asp:Label>
                                                        </td>
                                                        <td>Hearing :<asp:Label ID="IsHearing" runat="server"></asp:Label>
                                                    
                                                        </td>
                                                    </tr>
                                                </table>
                                                    
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />



                        <div id="divENT" runat="server" class="table-responsive">
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="5" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;">Qualifying Entrance Details (for getting Exemption from Entrance Test)</td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">Qualified Entrance (select)</th>
                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">Qualifying Year
                                        </th>

                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">Percentage Secured
                                        </th>
                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" class="manadatory">Valid Til (year)
                                        </th>
                                        <th style="width: 15%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">Details
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="txtCETName" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtCETYear" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtCETPercentage" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtCETValid" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtCETDetail" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <div id="divMPhil" runat="server">
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="7" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;">MPhil Course Details (for getting Exemption from Entrance)</td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th style="width: 5%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Sl.</th>
                                        <th colspan="2" style="width: 5%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <span>Duration</span></th>
                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Mode of Education</th>

                                        <th style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Course Detail
                                        </th>

                                        <th style="width: 15%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">
                                            <label>University</label>
                                        </th>
                                        <th style="width: 20%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">
                                            <label>Details</label>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">From</th>
                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">To</th>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="txtMPhilSl" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="txtMPhilFrom" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="txtMPhilTo" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="txtMode" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtMPhilCourse" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtMPhilUniv" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtMPhilDetail" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <br />
                        <div id="divFellowship" runat="server">
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="6" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;">Fellowship Details (for getting Exemption from Entrance Test)</td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th colspan="2" style="width: 5%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <span>Duration of Fellowship</span></th>
                                        <th style="width: 20%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Name of the College where Fellowship was pursued</th>

                                        <th style="width: 20%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2" class="manadatory">Name of University
                                        </th>

                                        <th style="width: 15%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2" class="manadatory">Post</th>
                                        <th style="width: 15%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2" class="manadatory">Seniority List Serial No. with Year</th>
                                    </tr>
                                    <tr>
                                        <th style="width: 7%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">From</th>
                                        <th style="width: 7%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">To</th>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="txtFellowFrom" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="txtFellowTo" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="txtFellowCollege" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtFellowUniv" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtFellowPost" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="txtSeniorityNo" runat="server"></asp:Label>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                        <br />
                        <div id="divResearch" runat="server">
                            <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="6" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;">Detail of Research Experiance (for getting Exemption from Entrance Test)</td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th colspan="2" style="width: 15%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">Duration of Research</th>
                                        <th style="width: 20%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Name of the 
                                                Labrotories where Research was pursued</th>

                                        <th style="width: 20%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Name of Organisation
                                        </th>
                                        <th style="width: 15%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Post</th>
                                        <th style="width: 15%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Nature
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="width: 7%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">From</th>
                                        <th style="width: 7%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">To</th>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="txtResearchFrom" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="txtResearchTo" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="txtLaboratry" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtResearchOrg" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="txtResearchPost" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="txtResearchNature" runat="server"></asp:Label>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>

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

                                    <table id="NRIAddress" runat="server" width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Permanent Address</b></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left; width: 135px;">
                                                <b>Address</b>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; width: 135px;">
                                                <asp:Label ID="NRIAddressLine1" runat="server"></asp:Label>&nbsp;<asp:Label ID="NRIAddressLine2" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Town/City</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="NRICountry" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Town/City</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="NRIddlVillage" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Pincode</b></td>
                                            <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left;">
                                                <asp:Label ID="NRIPinCode" runat="server"></asp:Label></td>
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
                        <%--Academic Profile Table--%>

                        <br />
                        <table id="DivEdu" runat="server" width="500" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tr>
                                <td style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Academic Profile of Applicant</b></td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; ">
                            <asp:GridView ID="grdEducation" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; width: 98%; margin: 0 auto;" ClientIDMode="Static" Width="100%" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                                </td>
                            </tr>
                            
                        </table>
                        <br />
                        <%--<div style="page-break-after: always;"></div>--%><%--Academic Profile Table--%>
                        <table id="divEnrance" runat="server" width="500" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tr>
                                <td style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>UGC/CSIR (JRF)/NET/GATE/SLET, other Fellowship Examination Details</b></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; ">
                            <asp:GridView ID="grdExam" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; width: 98%; margin: 0 auto;" ClientIDMode="Static" Width="100%" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table id="divExperiance" runat="server" width="500" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tr>
                                <td colspan="7" style="padding: 8px; color: #fff; font-size: 14px; text-align: left; border-left: 1px solid #999; background-color: #383E4B;"><b>Working/Research Experience/Teaching Experience</b></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #383E4B; text-align: left; ">
                            <asp:GridView ID="grdWork" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; width: 98%; margin: 0 auto;" ClientIDMode="Static" Width="100%" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <%--Reservation Quota Details Table--%><%--Domicile Table--%>
                        <table cellpadding="5" class="table-bordered" style="width: 98%; margin: 0 auto; min-width: 600px; border: 1px solid #999;">
                            <tr>
                                <td colspan="4" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;"><b>Research papers published (Please provide detail in a separate sheet)</b></td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">1.</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">No. of Research Papers published in Journal</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;font-weight:normal">
                                                <asp:Label ID="lblJournal" runat="server"></asp:Label></td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;font-weight:normal">
                                                <asp:Label ID="lblJournalDetail" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">2.</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">No. of Research Papers presented in Conference</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;font-weight:normal">
                                                <asp:Label ID="lblConference" runat="server"></asp:Label></td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;;font-weight:normal">
                                                <asp:Label ID="lblConferenceDetail" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                        <br />

                        <%--Other Information Table--%>
                        <table width="600" cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; border: 1px solid #999; margin: 0 auto;">
                            <tr>
                                <td colspan="3" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;">
                                    <b>Other Information    </b>
                                </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">1. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Are you pursuing any course currently?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left; font-weight:normal">
                                    <asp:Label ID="lblCourse" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr id="trCourse" runat="server">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                    <table  cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 1px solid #999; margin: 0 auto;">
                                <tbody>
                                    <tr>
                                        <td colspan="7" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;">Course Details</td>
                                    </tr>
                                </tbody>
                                <tbody>
                                    <tr>
                                        <th colspan="2" style="width: 5%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                            <span>Duration</span></th>
                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Mode of Education</th>

                                        <th style="width: 25%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">Course Name
                                        </th>

                                        <th style="width: 15%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">
                                            <label>College / Institute Name</label>
                                        </th>

                                        <th style="width: 15%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">
                                                        University / Board</th>
                                        <th style="width: 20%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;" rowspan="2">
                                            RollNo
                                        </th>
                                    </tr>
                                    <tr>
                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">From</th>
                                        <th style="width: 10%; padding: 5px; border: 1px solid #999; background-color: #F8F8F8; color: #383E4B; text-align: left;">To</th>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblCourseFrom" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblCourseTo" runat="server"></asp:Label></td>
                                        <td>
                                            <asp:Label ID="lblCourseMode" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCourseName" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCourseCollege" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCourseUniversity" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblCourseRollNo" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                                    </td>
                            </tr>
                            <tr>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">2. </td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;">Whether any disciplinary action has been taken against you?</td>
                                <td class="sub_hdbg" style="padding: 5px; border: 1px solid #999; text-align: left;font-weight:normal">
                                    <asp:Label ID="lblPunishment" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">
                                    <asp:Label ID="lblPunishmentDetail" runat="server" CssClass="t_trans"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />

                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;">
                            <tbody>
                                <tr>
                                    <td colspan="4" class="hdbg" style="padding: 5px; text-align: left; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; -webkit-print-color-adjust: exact;"><b>List of essential documents (enclosed with the application)</b></td>
                                </tr>
                            </tbody>
                        </table>
                        <div>
                            <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" Style="margin-bottom: 0; width: 98%; margin: 0 auto;" ClientIDMode="Static" Width="100%" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                        </div>
                        <br />
                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="4"><b>Payment Details</b></td>
                                <td style="padding: 5px; font-size: 14px; text-align: center;vertical-align:middle" rowspan="4">
                                    <uc1:QRCode runat="server" ID="QRCode" />
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
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"> 
                                            </i>
                                    <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Payment Status</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><b><asp:Label ID="lblPayStatus" runat="server"></asp:Label></b>
                                </td>
                            </tr>
                            </table>
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
