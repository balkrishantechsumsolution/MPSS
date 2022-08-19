<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FacultyPage.aspx.cs" Inherits="CitizenPortal.WebApp.Faculty.FacultyPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">


        function CallPrint(strid) {
            debugger;
            var prtContent = document.getElementById('divPrint');
            var WinPrint = window.open('', '', 'letf=0,top=0,width=900,height=700,toolbar=0,scrollbars=0,status=0');
            WinPrint.document.write(prtContent.innerHTML);
            WinPrint.document.close();
            WinPrint.focus();
            WinPrint.print();
            WinPrint.close();
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint" style="margin: 0 auto; width: 90%; /*height: 1220px; overflow: auto; */">
            <div style="width: 100%; height: auto; font-family: Arial; font-size: 12px; border: 3px solid #000; padding: 1px; margin: 0 auto;">
                <div style="width: 99.3%; height: auto; border: 1px solid #000; margin: 2px auto;">
                    <div style="width: 100%;">
                        <header>
                            <div class="container-fluid whitebg">
                                <div class="row p5" style="border-bottom: 2px solid #ddd;">
                                    <table style="width: 100%">
                                        <tr>
                                            <td rowspan="2"></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; width: 200px;">
                                                <img src="/Sambalpur/img/sambalpur-university-logo.png" class="" width="75" alt="Chhattisgarh Swami Vivekanad Technical University,Burla" />
                                            </td>
                                            <td>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="text-align: center">&nbsp;</td>
                                                        <td></td>
                                                        <td style="text-align: center; font-size: 22px; font-weight: bold; color: #d43300; white-space: nowrap">CHHATTISGARH SWAMI VIVEKANAD<br />
                                                            TECHNICAL UNIVERSITY
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td style="text-align: center"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center">&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td style="text-align: center;">
                                                            <h3 style="text-align: center;">Faculty Profile</h3>
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td style="text-align: center">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: right; width: 200px;">
                                                <img src="/Sambalpur/img/DigiVarsity.png" class="" width="75" alt="Chhattisgarh Swami Vivekanad Technical University,Burla" /></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </div>

                            </div>
                        </header>
                        <div class="container">
                            <div style="margin: 0 auto;">
                                <div class="panel-group" id="accordion">
                                    <div class="panel panel-default">
                                        <div id="PrintBasicInformation">
                                            <div style="color: #fff; background-color: #4879a9; border-color: #4879a9; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                                <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">Faculty Details
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
                                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: center; vertical-align: top; width: 135px" rowspan="7">
                                                                            <table border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td style="border: 1px solid #ccc; width: 135px; vertical-align: top; padding: 5px;">
                                                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 100px;" id="ProfilePhoto" />

                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="border: 1px solid #ccc; width: 135px; vertical-align: top; padding: 5px;">
                                                                                        <img runat="server" src="/WebApp/Kiosk/OISF/img/signature.png" id="ProfileSignature" style="width: 100px;" />

                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap"><b>Faculty ID </b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="lblFacultyID" runat="server"></asp:Label></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Evaluator ID</b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-weight: bold;">
                                                                            <asp:Label ID="lblEvalutorID" runat="server"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap"><b>Name of the Faculty</b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="FullName" runat="server"></asp:Label></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Designation</b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="lblDesignation" runat="server"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>College</b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="lblCollege" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Department</b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="lblDepartment" runat="server"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                            <b>Date of Birth 
                                                                            </b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="DOB" runat="server"></asp:Label>
                                                                            &nbsp;</td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; white-space: nowrap"><b>Date of Joining in the Service</b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="lblDOJ" runat="server"></asp:Label>
                                                                            &nbsp; </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                            <b>
                                                                                <span>Gender</span></b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="gender" runat="server"></asp:Label></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>
                                                                            <span>Faculty Status </span></b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                            <b>Email</b></td>
                                                                        <td width="263" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="EmailID" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Mobile Number</b></td>
                                                                        <td width="224" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="MobileNo" runat="server"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                            <b>WhatsApp No</b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; text-align: left; width: 120px;">
                                                                            <asp:Label ID="lblWhatsApp" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Specialization</b></td>
                                                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                                                            <asp:Label ID="lblSpecilization" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel panel-default">
                                        <div id="PrintAddress">
                                            <div style="color: #fff; background-color: #4879a9; border-color: #4879a9; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                                <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                                    <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#AddressInfo" class="fsize1em"><span class="glyphicon glyphicon-minus more-less"></span>Address Details</a>
                                                </h4>
                                                <a href="#" id="btnAddressPanel" onclick="javascript: CallPrint('PrintAddress');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                            </div>
                                            <div id="AddressInfo" class="panel-collapse collapse">
                                                <div class="panel-body p0">
                                                    <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">

                                                        <tr>
                                                            <td style="width: 160px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <b>Permanent Address</b>
                                                            </td>
                                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;" colspan="5">
                                                                <asp:Label ID="FullPermanentAddress" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <b>State</b></td>
                                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <asp:Label ID="lblPState" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <b>District</b></td>
                                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <asp:Label ID="lblPDistrict" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <b>Taluka / Block</b></td>
                                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <asp:Label ID="lblPBlock" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="width: 160px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <b>Panchayat / Town / City</b></td>
                                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <asp:Label ID="lblPVillage" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <b>PIN</b></td>
                                                            <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                <asp:Label ID="lblPPIN" runat="server"></asp:Label>
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
                                                <div style="color: #fff; background-color: #4879a9; border-color: #4879a9; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#AdmissionInfo" class="fsize1em">Qualification &amp; Experience Details</a></h4>
                                                    <a href="#" id="btnAdmissionPanel" onclick="javascript: CallPrint('PrintAdmission');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                                </div>
                                                <div id="AdmissionInfo" class="panel-collapse collapse2">
                                                    <div class="panel-body p0">
                                                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">

                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <b>No.</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <b>Detail</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <b>Qualification </b>
                                                                </td>
                                                                <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <b>Experience</b></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">1.</td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <b>Graduation</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblUGQual" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblUGExp" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">2.</td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Post Graduation</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblPGQual" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblPGExp" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">3.</td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Doctorate</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblDOCQual" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">4.</td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Post Doctorate</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblPGDOCQual" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; text-align: left;">5</td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Industrial Experience</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">&nbsp;</td>
                                                                <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblIndExp" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; text-align: left;">&nbsp;</td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Total Teaching Experience</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">&nbsp;</td>
                                                                <td style="width: 110px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>
                                                                    <asp:Label ID="lblExp" runat="server"></asp:Label></b>
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



                                        <div class="panel panel-default" id="divPayment" runat="server">
                                            <div id="PrintPayment">
                                                <div style="color: #fff; background-color: #4879a9; border-color: #4879a9; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#PaymentInfo" class="fsize1em">Bank Details</a>
                                                    </h4>
                                                    <a href="#" id="btnPaymentPanel" onclick="javascript: CallPrint('PrintPayment');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                                </div>
                                                <div id="PaymentInfo" class="panel-collapse collapse">
                                                    <div class="panel-body p0">
                                                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">

                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Aadhar Number</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblAadhar" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="width: 160px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; text-align: left;"><b>PAN No</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblPAN" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;"><b>Bank Name</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblBankName" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="width: 160px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; text-align: left;"><b>Account Holder Name</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblBankHolder" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; text-align: left;"><b>IFSC Code</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblFSO" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="width: 160px; padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; text-align: left;"><b>Account Number</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;">
                                                                    <asp:Label ID="lblAccount" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; text-align: left;"><b>Bank Address</b></td>
                                                                <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left;" colspan="3">
                                                                    <asp:Label ID="lblBankAddress" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>

                                                        </table>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="panel panel-default" id="divExam" runat="server" style="display:none">
                                            <div id="PrintExam">
                                                <div style="color: #fff; background-color: #4879a9; border-color: #4879a9; border-top-left-radius: 3px; border-top-right-radius: 3px; -webkit-print-color-adjust: exact;">
                                                    <h4 class="panel-title" style="padding: 10px 15px; margin-bottom: 0;">
                                                        <a style="color: #fff; text-decoration: none;" data-toggle="collapse" data-parent="#accordion" href="#ExamInfo" class="fsize1em">Recommendation Details</a>
                                                    </h4>
                                                    <a href="#" id="btnExamPanel" onclick="javascript: CallPrint('PrintExam');" style="color: #fff; text-decoration: none;" title="Print this Section"><span style="float: right; margin-top: -30px; margin-right: 40px;"><i class="fa fa-print fa-2x fa-fw"></i></span></a>
                                                </div>
                                                <div id="ExamInfo" class="panel-collapse collapse">
                                                    <div class="panel-body p0" style="overflow: auto;">
                                                        <asp:GridView ID="grdPaper" runat="server" CellPadding="5" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" HeaderStyle-HorizontalAlign="Left"
                                                            Style="margin-bottom: 0; width: 100%; margin: 0 auto; border: 2px solid #ccc;" ClientIDMode="Static" Width="100%" RowStyle-ForeColor="#383E4B" HeaderStyle-BackColor="#dddddd" Font-Size="11px">
                                                        </asp:GridView>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
            <input type="button" id="btnAllPrint" style="color: #fff; background-color: #4879a9; padding: 8px 15px; border: none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('divPrint');" />

        </div>
    </form>
</body>
</html>
