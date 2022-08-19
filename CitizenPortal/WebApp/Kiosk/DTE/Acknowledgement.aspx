<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DTE.Acknowledgement" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #lblstatus {
            font-weight: bold;
        }

        #Gridview1 th, td {
            padding: 5px;
            font-size: 12px;
            text-align: left;
        }
    </style>
    <script type="text/javascript">
        function CallPrint(strid) {
           
            var prtContent = document.getElementById(strid);
            var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
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
        <div>
            <div class="box-body box-body-open">
                <asp:Panel ID="Panel2" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    
                    <div id="divPrint" style="margin: 0 auto; /*height: 1191px; */ width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <table style="width: 100%">
                                <tr>
                                    <td rowspan="3"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <img alt="Logo" src="../images/depLgog.png" style="width: 120px;" />
                                    </td>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                                <td></td>
                                                <td style="text-align: center; font-size: 22px; font-weight: bold; color: #d43300;">COMMON APPLICATION PORTAL</td>
                                                <td></td>
                                                <td style="text-align: center">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <%--  <img src="../Images/QRCode.png" style="width: 100px" />--%>
                                        <uc1:QRCode runat="server" ID="QRCode1" />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="text-align: center">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                                <asp:Label ID="lblCertificateName" runat="server" CssClass="lbl_value" Text=""></asp:Label>
                                <br />
                                <span id="lblDeptName" runat="server" style="font-size: 15px"></span>
                            </div>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <table style="width: 100%;" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td style="vertical-align: top;">
                                        <div style="margin: 10px auto; width: 708px; font-size: 13px;">
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="5" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Applicant Details</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label5" runat="server" Text="Aadhaar No."></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                        <asp:Label ID="lblAadhaar" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="Label7" runat="server" Text="Mobile No."></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 150px;">
                                                        <asp:Label ID="lblMobile" runat="server"></asp:Label>
                                                    </td>
                                                    <td rowspan="5" style="padding: 0; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="width: 138px; height: 149px;" id="ProfilePhoto" class="form-control" />
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
                                                        <asp:Label ID="Label29" runat="server" Text="Date of Birth"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="lblFather1" runat="server">Gender</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblGender" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblIncome2" runat="server">Registration No.</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblRegistration" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">
                                                        <asp:Label ID="lblIncome1" runat="server">Date of Leaving</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblLeaving" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblCategory2" runat="server">Name of Institute</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="3">
                                                        <asp:Label ID="lblInstitute" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblCategory3" runat="server">Examination Details</asp:Label>
                                                    </td>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblDetails" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="lblCategory5" runat="server">Reason for Migration</asp:Label>
                                                    </td>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblMigration" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style: solid solid none solid; border-width: 1px; border-color: #999; padding: 5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label16" runat="server" Text="Applicant Address"></asp:Label>
                                                    </td>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblapplicant_address" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td rowspan="2" style="border-style: none solid solid solid; border-width: 1px; border-color: #999; padding: 5px; font-size: 11px; line-height: 11.5px; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label20" runat="server" Text="House / Apartment No.&lt;br/&gt;No. / Name of Building &lt;br/&gt;Locality / Landmark&lt;br/&gt;Road / Street Name "></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label21" runat="server">Village</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">
                                                        <asp:Label ID="lblvillage" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label23" runat="server">Block</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 185px">
                                                        <asp:Label ID="lbltaluka" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label30" runat="server">District</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lbldist" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 75px;">
                                                        <asp:Label ID="Label32" runat="server">PIN No.</asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="lblpin" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>

                                            <table cellpadding="0" cellspacing="0" width="100%" style="display: none;">
                                                <tr>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;"><b>List of essential documents (enclosed with the application)</b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none; width: 10px;">Sl. </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none; width: 125px;">Document Name </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; border-bottom: none;">Particulars of document </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;">1.</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none; white-space: nowrap;">Educational Certificate</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none; border-right: none;">2. </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: justify; border-bottom: none; border-right: none; white-space: nowrap;">Registration Card</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: center; border-bottom: none;"></td>
                                                </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0;">
                                                <tr>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><b>Payment Details<asp:Label ID="AppName" runat="server" CssClass="lbl_value" Style="white-space: normal !important;"></asp:Label>
                                                    </b></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                                        <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Reference ID"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                                        <asp:Label ID="lblAppID" runat="server" CssClass="lbl_value"></asp:Label>
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
                                                <tr id="kioskdetail" style="display:none">
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
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                                        <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Portal Fee + Service Tax</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                                        <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                                                        + <i class="fa fa-rupee"></i>
                                                        <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                                    <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;">Rs. &nbsp;  
                                                        <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                                        &nbsp; (<asp:Label ID="lblAmtWord" runat="server" Text=""></asp:Label>)
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
                                                        <asp:Label ID="Label41" runat="server" Text="10 Days"></asp:Label>
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

                                            <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; display: none;">
                                                <tr>
                                                    <td colspan="4" style="padding: 5px; border: 1px solid #999; text-align: left;"><strong>Current Status</strong></td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px;">Authorised Person</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">Additional Collector</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 120px;">Status</td>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 195px;">
                                                        <asp:Label ID="Label44" runat="server" Text="Pending for Acceptance"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 175px; height: 28px;">
                                                        <asp:Label ID="Label45" runat="server" Text="Office Address"></asp:Label>
                                                    </td>
                                                    <td style="width: 195px; height: 28px; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label46" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td style="width: 120px; height: 28px; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label47" runat="server" Text="Contact No."></asp:Label>
                                                    </td>
                                                    <td style="width: 195px; height: 28px; padding: 5px; border: 1px solid #999; text-align: left;">
                                                        <asp:Label ID="Label48" runat="server" Text=""></asp:Label>
                                                        <asp:Label ID="Label10" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-style: solid none none none; border-width: 1px; border-color: #000000; vertical-align: bottom; display: none;">
                                        <table style="width: 100%; margin: auto 0;" cellpadding="5" cellspacing="0" border="0">
                                            <tr>
                                                <td style="text-align: left">
                                                    <img alt="Logo" src="../Images/cmgi.png" style="width: 35px; text-align: left;" /></td>
                                                <td></td>
                                                <td style="text-align: center; font-weight: bold; color: #000654;">Center for Modernizing Government Initiative (CMGi), Odisa</td>
                                                <td></td>
                                                <td style="text-align: right">
                                                    <img alt="Logo" src="../Images/csc.png" style="width: 50px; text-align: right; height: 21px;" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <div class="row" id="marksDtlTble" runat="server">
                        <div class="col-lg-12 mtop10">

                            <div style="padding: 15px; font-family: Arial, Helvetica, sans-serif; background-color: #808080;-webkit-print-color-adjust: exact; font-size: 12px; /*text-shadow: 2px 2px 14px #000000; */ letter-spacing: 0.15em; color: #fff;">
                                <i class="fa fa-hand-o-right fa-fw"></i>Application status:
                                <asp:Label ID="lblstatus" runat="server" CssClass="lbl_value" Text=""></asp:Label>
                            </div>
                        </div>
                        <div class="col-lg-12 box-container">
                            <div class="table-responsive" style="height: 100px; font-family: Arial, Helvetica, sans-serif;">
                                <asp:GridView ID="Gridview1" ShowHeaderWhenEmpty="true" runat="server" CssClass="table table-bordered legacysearch_tble" Width="100%" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="S.No.">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSerialNo" runat="server" Text='<%#(((GridViewRow)Container).RowIndex+1).ToString()%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblActionDate" runat="server" Text='<%#Eval("ActionDate") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Department Remarks">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDepartmentRemarks" runat="server" Text='<%#Eval("DepartmentRemarks") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                                </asp:GridView>
                            </div>

                        </div>
                    </div>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                    <div style="text-align: center; margin-bottom: 10px; margin-top: 10px;">
                        <input type="button" id="btnSubmit" class="btn btn-primary" style="background-color: #0040FF !important; padding: 10px; color: #fff; border: none; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                    </div>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
