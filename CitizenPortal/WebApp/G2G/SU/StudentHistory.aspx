<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHistory.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.StudentHistory" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student History</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../../../Sambalpur/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../../Sambalpur/js/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../../../Sambalpur/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="../../../Sambalpur/css/homestyle.css" type="text/css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#accordion .collapse').collapse('show');
            //$('#accordion .panel-default').on('click', function () {
            //    $('#accordion .panel-collapse').collapse('toggle');
            //});
            $('.collapse').on('shown.bs.collapse', function () {
                $(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
            }).on('hidden.bs.collapse', function () {
                $(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
            });
        });

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

        function ViewReceipt(m_ServiceID, m_AppID, m_Path) {
            var t_URL = "";
            t_URL = m_Path + "?SvcID=" + m_ServiceID + "&AppID=" + m_AppID;
            t_URL = ResolveUrl(t_URL);
            window.open(t_URL, "");
        }

    </script>
    <style type="text/css">
        .fsize1em {
            font-size: 1em;
        }

        .demo {
            padding-top: 60px;
            padding-bottom: 60px;
        }

        .more-less {
            float: right;
            color: #fff;
        }

        .panel-box {
            margin-bottom: 20px;
        }

        /*.collapse {
            height: 300px !important;
        }*/
        .auto-style1 {
            left: 0px;
            top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <div class="container-fluid whitebg">
                <div class="row p5" style="border-bottom: 2px solid #ddd;">
                    <table style="width: 100%">
                                <tr>
                                    <td rowspan="3"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="text-align: center; width: 200px;">
                                        <img src="/Sambalpur/img/sambalpur-university-logo.png" class="" width="90" alt="Chhattisgarh Swami Vivekanad Technical University,Burla" />
                                    </td>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                                <td></td>
                                                <td style="text-align: center; font-size: 22px; font-weight: bold; color: #d43300;">CHHATTISGARH SWAMI VIVEKANAD<br /> TECHNICAL UNIVERSITY
                        </td>
                                                <td>
                                        <uc1:QRCode runat="server" ID="QRCode" />
                                                </td>
                                                <td style="text-align: center"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td style="text-align: center; "><span></span></td>
                                                <td>&nbsp;</td>
                                                <td style="text-align: center">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="text-align: center; width: 200px;">
                                        <img src="/Sambalpur/img/DigiVarsity.png" class="" width="90" alt="Chhattisgarh Swami Vivekanad Technical University,Burla" /></td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="text-align: center">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                    <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 text-right">
                        
                    </div>
                    <div class="auto-style1">

                        
                    </div>

                </div>

            </div>
        </header>
        <div class="container" >
            <h3 style="text-align:center;">Student History</h3>
            <div id="divPrint" style="margin: 0 auto;">
                <div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div id="PrintBasicInformation">
                            <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                    <a style="" data-toggle="collapse" data-parent="#accordion" href="#BasicInfo" class="fsize1em">S</a><a href="#BasicInfo"><span class="fsize1em">tudent Details</span></a>

                                </h4>
                                <a href="#" id="btnBasicInfoPanel" onclick="javascript: CallPrint('PrintBasicInformation');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                            </div>
                            <div id="BasicInfo" class="panel-collapse collapse in">
                                <div class="panel-body p0">
                                    <table cellspacing="0" cellpadding="0" style="width: 100%; margin: 0 auto;">
                                        <tr>
                                            <td style="vertical-align: top; border-left: 1px solid #ccc;">
                                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                                    <tr>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: center; font-size: 11px; vertical-align: top; width: 135px" rowspan="9">
                                                            <table border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td style="border: 1px solid #ccc; width: 135px; height: 157px; vertical-align: top; padding: 5px;">
                                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 120px; height: 145px" id="ProfilePhoto" />

                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #ccc; width: 135px; vertical-align: top; padding: 5px;">
                                                                        <img runat="server" src="/webApp/kiosk/Images/signature.png" id="ProfileSignature" style="width: 120px; height: 50px;" />

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Roll Number </b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                            <asp:Label ID="lblRoll" runat="server"></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Old Roll Number</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 13px; font-weight: bold;">
                                                            <asp:Label ID="lblAadhaar" runat="server"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Name of the Student</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                            <asp:Label ID="FullName" runat="server"></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Enrollment Number</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 13px;">
                                                            <asp:Label ID="lblRegistrationNo" runat="server"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>College</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                    <asp:Label ID="lblCollege" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Care Tacker College</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 13px;">
                                                            <asp:Label ID="lblCareTakerCollege" runat="server"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Course Name</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                    <asp:Label ID="lblBrnachName" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Program Name</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <asp:Label ID="lblProgram" runat="server"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Father&#39;s Name</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                            <asp:Label ID="lblFather" runat="server"></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Mother&#39;s Name</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <asp:Label ID="lblMother" runat="server"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <b>Date of Birth 
                                                            </b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                            <asp:Label ID="DOBConverted" runat="server"></asp:Label>
                                                            &nbsp;</td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>
                                                            <span>&nbsp;</span>Age (as on 
                                                            <asp:Label ID="lblAgeAsOn" runat="server"></asp:Label>
                                                            ) </b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <asp:Label ID="AgeYear" runat="server"></asp:Label>
                                                            &nbsp;-
                                                            <asp:Label ID="AgeMonth" runat="server"></asp:Label>
                                                            &nbsp;-
                                                            <asp:Label ID="AgeDay" runat="server"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <b>
                                                                <span>Gender</span></b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                            <asp:Label ID="gender" runat="server"></asp:Label></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>
                                                            <span>Category</span></b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <asp:Label ID="Category" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <b>Email</b></td>
                                                        <td width="263" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <asp:Label ID="EmailID" runat="server"></asp:Label>
                                                        </td>
                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Mobile Number</b></td>
                                                        <td width="224" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <asp:Label ID="MobileNo" runat="server"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1">
                                                            <b>Admission Year (Session)</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; text-align: left; width: 120px; font-size: 11px;">
                                                            <asp:Label ID="lblAdmissionYear" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Current Semester</b></td>
                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                            <asp:Label ID="lblSession" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    </table>
                                            </td>
                                        </tr>
                                    </table>

                                </div>

                            </div>
                        </div>
                        <%--<div style="text-align: right; margin: 10px;">
                                <input type="button" id="btnBasicInfoPanel" style="color: #fff; background-color: #337ab7; padding: 8px 15px; border:none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('PrintBasicInformation');" />

                            </div>--%>
                    </div>
                    <div class="panel panel-default">
                        <div id="PrintAddress">
                            <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                    <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#AddressInfo" class="fsize1em"><span class="glyphicon glyphicon-minus more-less"></span>Address Details</a>
                                </h4>
                                <a href="#" id="btnAddressPanel" onclick="javascript: CallPrint('PrintAddress');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                            </div>
                            <div id="AddressInfo" class="panel-collapse collapse">
                                <div class="panel-body p0">
                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">

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

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel panel-default">
                            <div id="PrintAdmission">
                                <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#AdmissionInfo" class="fsize1em">Subject Details</a>
                                    </h4>
                                    <a href="#" id="btnAdmissionPanel" onclick="javascript: CallPrint('PrintAdmission');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                </div>
                                <div id="AdmissionInfo" class="panel-collapse collapse2">
                                    <div class="panel-body p0">
                                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">

                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Subject Details</b></td>
                                            </tr>

                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                                    <asp:GridView ID="GridViewSubject" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" HeaderStyle-HorizontalAlign="Left"
                                                        Style="margin-bottom: 0; width: 100%; margin: 0 auto;" ClientIDMode="Static" Width="100%" RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px">
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <%--<div style="text-align: right; margin: 10px;">
                                <input type="button" id="btnAdmissionPanel" style="color: #fff; background-color: #337ab7; padding: 8px 15px; border:none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('PrintAdmission');" />

                            </div>--%>
                        </div>
                        <div class="panel panel-default" style="display:none">
                            <div id="PrintPreviousEducation">
                                <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#PreviousEducation" class="fsize1em"><span class="glyphicon glyphicon-minus more-less"></span>Previous Education</a>
                                    </h4>
                                    <a href="#" id="btnPrevEducationPanel" onclick="javascript: CallPrint('PrintPreviousEducation');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                </div>
                                <div id="PreviousEducation" class="panel-collapse collapse">
                                    <div class="panel-body p0">
                                        <asp:GridView ID="GridViewCourse" runat="server" Width="100%" CssClass="table table-striped table-bordered"
                                            Style="padding: 5px; border: 2px solid #ccc; text-align: center;"
                                            RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px">
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <%--<div style="text-align: right; margin: 10px;">
                                <input type="button" id="btnPrevEducationPanel" style="color: #fff; background-color: #337ab7; padding: 8px 15px; border:none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('PrintPreviousEducation');" />

                            </div>--%>
                        </div>
                        <div class="panel panel-default" style="display:none">
                            <div id="PrintRegistration">
                                <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#RegistrationInfo" class="fsize1em"><span class="glyphicon glyphicon-minus more-less"></span>Registration Details</a>
                                    </h4>
                                    <a href="#" id="btnRegistrationPanel" onclick="javascript: CallPrint('PrintRegistration');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                </div>
                                <div id="RegistrationInfo" class="panel-collapse collapse">
                                    <div class="panel-body p0">
                                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0 auto;">

                                            <tr>
                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Registration Number</b></td>
                                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style2">
                                                    <asp:Label ID="lblRegNo" runat="server"></asp:Label></td>
                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" class="auto-style1"><b>Registration Date</b></td>
                                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                    <asp:Label ID="lblRegd" runat="server"></asp:Label>--</td>
                                                <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                                    <asp:HyperLink ID="lnkRegistration" runat="server" onclick="alert('Registration No not yet generated');">Registration Card</asp:HyperLink></td>
                                            </tr>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <%--<div style="text-align: right; margin: 10px;">
                                <input type="button" id="btnRegistrationPanel" style="color: #fff; background-color: #337ab7; padding: 8px 15px; border:none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('PrintRegistration');" />

                            </div>--%>
                        </div>
                        <div class="panel panel-default" style="display:none">
                            <div id="PrintDocument">
                                <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#DocumentInfo" class="fsize1em"><span class="glyphicon glyphicon-minus more-less"></span>Document Details</a>
                                    </h4>
                                    <a href="#" id="btnDocumentPanel" onclick="javascript: CallPrint('PrintDocument');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                </div>
                                <div id="DocumentInfo" class="panel-collapse collapse">
                                    <div class="panel-body p0">
                                        <asp:GridView ID="grdView" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" HeaderStyle-HorizontalAlign="Left" OnRowDataBound="grdView_RowDataBound"
                                            Style="margin-bottom: 0; width: 100%; margin: 0 auto; border: 2px solid #ccc;" ClientIDMode="Static" Width="100%" RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px">
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <%--<div style="text-align: right; margin: 10px;">
                                <input type="button" id="btnDocumentPanel" style="color: #fff; background-color: #337ab7; padding: 8px 15px; border:none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('PrintDocument');" />

                            </div>--%>
                        </div>
                        <div class="panel panel-default" id="divPayment" runat="server">
                            <div id="PrintPayment">
                                <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#PaymentInfo" class="fsize1em"><span class="glyphicon glyphicon-minus more-less"></span>Payment Details</a>
                                    </h4>
                                    <a href="#" id="btnPaymentPanel" onclick="javascript: CallPrint('PrintPayment');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                </div>
                                <div id="PaymentInfo" class="panel-collapse collapse">
                                    <div class="panel-body p0">
                                        <asp:GridView ID="grdPayment" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" HeaderStyle-HorizontalAlign="Left"
                                            Style="margin-bottom: 0; width: 100%; margin: 0 auto; border: 2px solid #ccc;" ClientIDMode="Static" Width="100%" RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px" OnRowDataBound="grdPayment_RowDataBound">
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                            <%--<div style="text-align: right; margin: 10px;">
                                <input type="button" id="btnPaymentPanel" style="color: #fff; background-color: #337ab7; padding: 8px 15px; border:none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('PrintPayment');" />

                            </div>--%>
                        </div>
                        <div class="panel panel-default" id="divExam" runat="server">
                            <div id="PrintExam">
                                <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#ExamInfo" class="fsize1em"><span class="glyphicon glyphicon-minus more-less"></span>Exam Details</a>
                                    </h4>
                                    <a href="#" id="btnExamPanel" onclick="javascript: CallPrint('PrintExam');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                </div>
                                <div id="ExamInfo" class="panel-collapse collapse">
                                    <div class="panel-body p0" style="overflow:auto;">
                                        <asp:GridView ID="grdPaper" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" HeaderStyle-HorizontalAlign="Left"
                                            Style="margin-bottom: 0; width: 100%; margin: 0 auto; border: 2px solid #ccc;" ClientIDMode="Static" Width="100%" RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px">
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <%--<div style="text-align: right; margin: 10px;">
                                <input type="button" id="btnExamPanel" style="color: #fff; background-color: #337ab7; padding: 8px 15px; border:none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('PrintExam');" />

                            </div>--%>
                        </div>
                        <div class="panel panel-default" style="display: none">
                            <div id="PrintResult">
                                <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#ResultInfo" class="fsize1em"><span class="glyphicon glyphicon-minus more-less"></span>Result Details</a>
                                    </h4>
                                    <a href="#" id="btnPrintPanel" onclick="javascript: CallPrint('PrintResult');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                </div>
                                <div id="ResultInfo" class="panel-collapse collapse" style="display:none">
                                    <div class="panel-body p0">
                                        <table class="table table-striped table-bordered" cellspacing="0" rules="all" border="1" style="font-size: 11px; width: 100%; border-collapse: collapse; padding: 8px; text-align: left; border: 1px solid #ccc;">
                                            <tbody>
                                                <tr style="background-color: #DDDDDD; height: 30px;">
                                                    <th colspan="5">Semester 1st</th>
                                                </tr>
                                                <tr>
                                                    <td style="background-color: #e4e4e4; font-weight: bold;">Subject Type</td>
                                                    <td style="background-color: #e4e4e4; font-weight: bold;">Subject Name</td>
                                                    <td style="background-color: #e4e4e4; font-weight: bold;">Max Marks</td>
                                                    <td style="background-color: #e4e4e4; font-weight: bold;">Marks Obtained</td>
                                                    <td style="background-color: #e4e4e4; font-weight: bold;">Result</td>
                                                </tr>
                                                <tr style="color: #383E4B;">
                                                    <td>DSC</td>
                                                    <td>SANTALI</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr style="color: #383E4B;">
                                                    <td>GE</td>
                                                    <td>ARCH. &amp; MUSE.</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr style="color: #383E4B;">
                                                    <td>AECC</td>
                                                    <td>MIL (SANTALI)</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr style="color: #383E4B;">
                                                    <td>SEC</td>
                                                    <td>INFORMATION TECHNOLOGY</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                            <%--<div style="text-align: right; margin: 10px;">
                                <input type="button" id="btnPrintPanel" style="color: #fff; background-color: #337ab7; padding: 8px 15px; border:none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('PrintResult');" />

                            </div>--%>
                        </div>
                        
                        <div class="panel panel-default" style="display: none">
                            <div id="PrintCertificate">
                                <div style="color: #fff; background-color: #5A554D; border-color: #5A554D; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#CertificateInfo" class="fsize1em"><span class="glyphicon glyphicon-minus more-less"></span>Certificate Details</a>
                                    </h4>
                                    <a href="#" id="btnCertificatePanel" onclick="javascript: CallPrint('PrintCertificate');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                </div>
                                <div id="CertificateInfo" class="panel-collapse collapse" style="display:none">
                                    <div class="panel-body p0">
                                        <table class="table table-striped table-bordered" cellspacing="0" cellpadding="5" style="font-size: 11px; width: 100%; border-collapse: collapse; margin: 0 auto; border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; border-left: 1px solid #ccc;">
                                            <tbody>
                                                <tr align="left" style="background-color: #DDDDDD;">
                                                    <th scope="col">Sr No</th>
                                                    <th scope="col">Certificate Name</th>
                                                    <th scope="col">Allotment Status</th>
                                                    <th scope="col">Alloted By</th>
                                                </tr>
                                                <tr style="color: #383E4B;">
                                                    <td>1</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr style="color: #383E4B;">
                                                    <td>2</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <%--<div style="text-align: right; margin: 10px;">
                                <input type="button" id="btnCertificatePanel" style="color: #fff; background-color: #337ab7; padding: 8px 15px; border:none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('PrintCertificate');" />

                            </div>--%>
                        </div>
                    </div>
                </div>
                <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
                    <input type="button" id="btnAllPrint" style="color: #fff; background-color: #2f4e6c; padding: 8px 15px; border: none; border-radius: 2px;" value="Print All" onclick="javascript: CallPrint('divPrint');" />

                </div>
            </div>
        </div>
    </form>
</body>
</html>
