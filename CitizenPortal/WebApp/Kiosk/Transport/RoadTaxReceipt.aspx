<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoadTaxReceipt.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Transport.RoadTaxReceipt" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../g2c/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="RoadTax.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

        })
    </script>

    <script type="text/javascript">

        function GetFinalTaxDetails() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Kiosk/Transport/RoadTaxReceipt.aspx/SubmitRoadTaxData',
                data: '{}',
                processData: false,
                dataType: "json",
                success: function (response) {
                }
            })
        }

        function CallPrint(divPrint) {
            debugger;
            var prtContent = document.getElementById(divPrint);
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
        <div id="divPrint" style="margin: 0 auto;">
            <table style="width: 900px; border: 5px solid #d3d3d3; background-color: #fff; padding-right: 8px; padding-left: 8px; font-family: Arial; font-size: 13px;">
                <tr>
                    <td>
                        <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                            <img alt="Logo" src="../images/depLgog.png"  style="width: 110px; -webkit-print-color-adjust: exact;  margin: 25px 0px 0px 33px;" />
                        </div>
                    </td>
                    <td style="text-align: center;">
                        <br />
                        <span style="text-decoration: underline; font-weight: bold;">TAX RECIEPT</span><br />
                        <br />
                        <b style="padding-top: 20px; font-size: 17px;">Transport Department, Government of Odisha</b><br />

                        Registration Authority RAJPUR ROAD/BURARI,DL
                    </td>
                    <td>
                        <div style="height: 47px; float: right; margin: 0 31px 0 0;">
                            <uc1:QRCode runat="server" ID="QRCode" style="-webkit-print-color-adjust: exact;" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <table style="width: 99%; margin: 0 auto; line-height: 28px;">
                            <tr>
                                <td style="width: 20%;"><b>Transaction No./Receipt</b></td>
                                <td style="width: 25%;">
                                    <asp:Label ID="lblAppID" runat="server"></asp:Label></td>
                                <td style="width: 15%;"><b>Vehicle Class</b></td>
                                <td style="width: 25%;">
                                    <asp:Label ID="lblVehicleClass" runat="server" /></td>
                            </tr>
                            <tr>
                                <td><b>Received From</b></td>
                                <td>
                                    <asp:Label ID="lblOwnerName" runat="server" /></td>
                                <td><b>Date</b></td>
                                <td>
                                    <asp:Label ID="lblPayDate" runat="server" /></td>
                            </tr>
                            <tr>
                                <td><b>Vehicle No</b></td>
                                <td>
                                    <asp:Label ID="lblVehicleNo" runat="server" /></td>
                                <td><b>Chassis No</b></td>
                                <td>
                                    <asp:Label ID="lblChasisNo" runat="server" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <table style="width: 100%; margin: 10px auto 0; border: 2px solid #d7e2e5; line-height: 28px;">
                            <tr>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px; background-color: #D5E6F8;"><b>Particulars</b></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px; background-color: #D5E6F8;"><b>Duration</b></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px; background-color: #D5E6F8;"><b>Period</b></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px; background-color: #D5E6F8;"><b>Amount</b></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px; background-color: #D5E6F8;"><b>Penalty</b></td>
                                <td style="border-bottom: 1px solid #d7e2e5; padding-left: 5px; background-color: #D5E6F8;"><b>Total</b></td>
                            </tr>
                            <tr>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblTaxType" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblDuration" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblParkingFrom" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblamount1" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblPenality1" runat="server" /></td>
                                <td style="border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblTotal1" runat="server" /></td>
                            </tr>
                            <tr id="TrAddMvTax" runat="server" clientmode="static">
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblAddTaxType" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblAddDuration" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblAddParkingFrom" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblAddAmount1" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblAddPenality1" runat="server" /></td>
                                <td style="border-bottom: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblAddTotal1" runat="server" /></td>
                            </tr>
                            <tr id="TrParkingFee" runat="server" clientmode="static" style="display: none">
                                <td style="border-right: 1px solid #d7e2e5; padding-left: 5px;">Parking Fee</td>
                                <td style="border-right: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblDurationfrom" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblParkingTo" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblamount2" runat="server" /></td>
                                <td style="border-right: 1px solid #d7e2e5; padding-left: 5px;">
                                    <asp:Label ID="lblPenality2" runat="server" /></td>
                                <td style="padding-left: 5px;">
                                    <asp:Label ID="lblTotal2" runat="server" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p style="font-size:12px">User Convenience Fees : <i class="fa fa-rupee fa-fw"></i> 20 included in this RoadTax Receipt.</p>
                        <table cellspacing="0" style="width: 100%; margin: 10px auto 0; border: 2px solid #d7e2e5; line-height: 14px;">
                            <tr>
                                <td style="width: 20%; border-right: 2px solid #d7e2e5; padding: 10px; background-color: #D5E6F8;">
                                    <p><b>Grand Total (in Rs):</b></p>
                                </td>
                                <td style="width: 20%; border-right: 2px solid #d7e2e5; padding: 10px;">
                                    <p>
                                        <i class="fa fa-rupee fa-fw"></i>
                                        <asp:Label ID="lblGrandTotal" runat="server" />/- 
                                    </p>
                                </td>
                                <td colspan="2" style="padding: 10px;">
                                    <p>(<asp:Label ID="AmtWords" runat="server" />)</p>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p>For Further query, Please go to zone RTO : RAJPUR ROAD/BURARI, DL</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <p style="padding-bottom: 20px; font-size: 12px;"><b>Note:-</b> This is computer generated slip, no need of signature.</p>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: left; width: 900px; text-align: center; margin: 10px auto;">
            <input type="button" id="btnPrint" style="padding: 12px 16px; color: #fff; background-color: #337ab7; border-color: #2e6da4; border-radius: 2px; border: none;"
                value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
    </form>
</body>
</html>
