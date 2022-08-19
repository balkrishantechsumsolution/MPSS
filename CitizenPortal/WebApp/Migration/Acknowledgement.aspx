<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Migration.Acknowledgement" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Acknowledgement - Examination Forms</title>

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

        .table-bordered {
            border: 1px solid #ddd;
        }

        .table {
            width: 100%;
            max-width: 100%;
            margin-bottom: 20px;
        }

        .table {
            border-collapse: collapse !important;
        }

        * {
            padding: 0px;
            margin: 0px;
            list-style: none;
            font-size: 13px;
        }

        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        *,
        :after,
        :before {
            color: #000 !important;
            text-shadow: none !important;
            background: 0 0 !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
        }

        th {
            text-align: left;
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
                    <div id="divMock" runat="server" style="z-index: 10; position: absolute; margin: 0 auto; width: 800px; display: none">
                        <p style="text-align: left; font-size: 65px; font-weight: bolder; color: #999 !important;">MOCK</p>
                        <p style="text-align: center; font-size: 65px; font-weight: bolder; color: #999 !important;">MOCK</p>
                        <p style="text-align: right; font-size: 65px; font-weight: bolder; color: #999 !important;">MOCK</p>
                        <p style="text-align: center; font-size: 65px; font-weight: bolder; color: #999 !important;">MOCK</p>
                        <p style="text-align: left; font-size: 65px; font-weight: bolder; color: #999 !important;">MOCK</p>
                        <p style="text-align: center; font-size: 65px; font-weight: bolder; color: #999 !important;">MOCK</p>
                        <p style="text-align: right; font-size: 65px; font-weight: bolder; color: #999 !important;">MOCK</p>
                        <p style="text-align: center; font-size: 65px; font-weight: bolder; color: #999 !important;">MOCK</p>

                    </div>
                    <%----------End Header section ---------%><%---------Start Title section --------%>
                    <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; background-color: #808080; color: #fff;">
                        <span style="font-size: 20px">Application for Migration Certificate</span>
                    </div>
                    <%----------End title section ---------%><%---------Start Applicant Section --------%>
                    <div style="margin: 10px 0; width: 100%; height: auto; font-size: 13px;">

                        <table style="width: 98%; margin: 0 auto; font-size: 16px; display: none">
                            <tr>
                                <td style="text-align: center; font-size: 20px" colspan="7">Status:<b><asp:Label ID="lblAppStatus" runat="server">Application Save</asp:Label></b>&nbsp;| 
                                                    Application Fee : 
                                                   <b>
                                                       <asp:Label ID="lblPayment" runat="server">Unpaid</asp:Label></b></td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center"></td>
                            </tr>
                            <tr>
                                <td style="text-align: center">Enrollment :
                                                    <asp:Label ID="lblEnrollment" runat="server"></asp:Label></td>
                                <td style="text-align: center"></td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">| </td>
                                <td style="text-align: center">Application No. <b>
                                    <asp:Label ID="AppID" runat="server"></asp:Label></b>&nbsp;</td>
                                <td style="text-align: center">| </td>
                                <td style="text-align: center">ROLL No.
                                                    <b>
                                                        <asp:Label ID="lblRollNo" runat="server">Unassigned</asp:Label></b></td>
                                <td style="text-align: center">&nbsp;</td>
                                <td style="text-align: center">&nbsp;</td>
                            </tr>
                        </table>
                        <%--Programme Table--%><%--Applicant Table--%>

                        <table style="width: 98%; margin: 0 auto;">
                            <tr>
                                <td>
                                    <table class="table-bordered" style="width: 100%;">
                                        <tr>
                                            <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B; -webkit-print-color-adjust: exact;"><b>Applicant Details</b></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top;">
                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                        <tr>
                                            <td style="/*padding: 3px; */ border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: center; vertical-align: top; width: 135px" rowspan="8">
                                                <table border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td style="border: 1px solid #ccc; width: 135px; height: 157px; vertical-align: top; padding: 3px;">
                                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 120px; height: 145px" id="ProfilePhoto" />

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #ccc; width: 135px; vertical-align: top; padding: 3px;">
                                                            <img runat="server" src="~/WebApp/Kiosk/Images/signature.png" id="ProfileSignature" style="width: 120px; height: 50px;" />

                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Roll Number </b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblRoll" runat="server"></asp:Label></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap"><b>Enrollment Number</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 13px; font-weight: bold;">
                                                <asp:Label ID="lblRegNo" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap"><b>Student Name</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="FullName" runat="server"></asp:Label></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Date of Birth</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 13px;">
                                                <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>College</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;" colspan="3">
                                                <asp:Label ID="lblCollege" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap"><b>Course Name</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblBrnachName" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Program Name</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblProgram" runat="server"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>
                                                    <span>Gender</span></b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="gender" runat="server"></asp:Label></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>
                                                <span>Category</span></b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="Category" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Admission Year</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblAdmissionYear" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Session</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="lblSession" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Email Id</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="EmailID" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                <b>Mobile Number</b></td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                <asp:Label ID="MobileNo" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">&nbsp;</td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">&nbsp;</td>
                                            <td style="padding: 3px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">&nbsp;</td>
                                            <td style="padding: 3px; border: 1px solid #ccc; color: #383E4B; text-align: left;">&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;" id="Regular" runat="server">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="5"><b>Migration Details</b></td>
                            </tr>
                            <tr style="display:none">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;width: 150px;">Name in English</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtnameEnglish" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap" rowspan="4">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Name in Hindi</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtNameHindi" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Father/Husband Name</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtFather" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">&nbsp;</td>
                            </tr>
                            <tr style="display:none">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;width: 150px;">Admission Year</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtAdmission" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Passing Year</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtPassing" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Email Id</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtEmailID" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Mobile No</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtMobileNo" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Applicant Remarks</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap" colspan="4">
                                    <asp:Label ID="txtRemark" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;display:none" id="Backlog" runat="server">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="5"><b>Deliver Address Details</b></td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap;width: 275px;">Delivery Mode</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtMode" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Deliver Type</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtType" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Address Line-1 (Care of/ House/Building)</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap" colspan="4">
                                    <asp:Label ID="txtAddress1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Address Line-2 (Road/Street Name/Locality</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap" colspan="4">
                                    <asp:Label ID="txtAddress2" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">State</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtState" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap" rowspan="3">&nbsp;</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">District</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtDist" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Taluka</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtTaluka" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Village</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtVillage" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">Pin Code</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:Label ID="txtPinCode" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap" colspan="2">&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;" id="tblHistory" runat="server">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;"><b>Application History Details</b></td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; white-space: nowrap">
                                    <asp:GridView ID="grdHistory" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered">
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table cellpadding="0" cellspacing="0" width="600" style="margin: 0 auto; width: 98%;" id="Table1" runat="server">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;"><b>Payment Details</b></td>
                            </tr>
                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; vertical-align: top">
                                    <table cellpadding="0" cellspacing="0" style="margin: 0 auto; width: 100%;">
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
                                            <td style="padding: 5px; font-size: 14px; text-align: center; vertical-align: middle" rowspan="3">
                                                <uc1:QRCode runat="server" ID="QRCode" />
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
                                        <tr style="">
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap">Transaction Amount</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                                Rs.
                                                <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                            </td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Payment Status</td>
                                            <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><b>
                                                <asp:Label ID="lblPayStatus" runat="server"></asp:Label></b>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <div>
                        </div>
                        <br />
                    </div>
                    <%--<asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkBacklog" runat="server" onclick="return EnableControls(this);" />
                                                        <asp:HiddenField ID="HdfAppID" runat="server" Value='<%#Eval("AppID")%>' />
                                                        <asp:HiddenField ID="hfPayflag" runat="server" Value='<%#Eval("PayFlag")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
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
