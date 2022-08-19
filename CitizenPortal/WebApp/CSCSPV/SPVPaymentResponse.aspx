<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SPVPaymentResponse.aspx.cs" Inherits="CitizenPortal.WebApp.CSCSPV.SPVPaymentResponse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/sb-admin-2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row" style="width: 55%; margin: 20px auto;">
            <div class="">
                <table class="table table-bordered table-striped">
                    <tr style="background-color: #FFFFFF;">
                        <td colspan="4">
                            <table class="" style="width: 100%">
                                <tr>
                                    <td style="text-align: left">
                                        <img src="../Kiosk/Images/logo_orissa.gif" style="width: 60px;" /><img src="../Kiosk/Images/logo.png" style="width: 75px;" /></td>
                                    <td>&nbsp;</td>
                                    <td style="text-align: right">
                                        <img src="../Kiosk/Images/logo.jpg" style="width: 120px;" /><img src="../Kiosk/Images/Apnalogo.png" style="width: 120px;" /></td>
                                </tr>
                                <tr>
                                    <td style="text-align: center" colspan="3">
                                        <b style="text-align: center; white-space: nowrap; font-size: 15px;">PAYMENT DETAILS</b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <strong>Kiosk Detail</strong></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="tokanno" runat="server" Text="Kiosk ID"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblKioskID" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Kiosk Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblKiosk" runat="server" Style="white-space: normal !important;"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label77" runat="server" Text="OMT ID"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCSCID" runat="server"
                                Style="color: #000000; font-size: small" Text=""></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label81" runat="server" Text="Registration No."></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblregno" runat="server"
                                Style="color: #000000; font-size: small" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Label ID="lblmsg" runat="server" Style="color: #FF3300; font-size: 15px; font-weight: bold;"
                                Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4"><strong>Transaction Detail</strong></td>
                    </tr>
                    <tr>
                        <td>Transaction ID</td>
                        <td>
                            <asp:Label ID="TransID" runat="server"
                                Text=""></asp:Label>
                        </td>
                        <td>Transaction Date</td>
                        <td>
                            <asp:Label ID="lbldate" runat="server"
                                Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblBenificery" runat="server" Style="white-space: normal !important;">Transaction Amount</asp:Label>
                        </td>
                        <td><i class="fa fa-rupee"></i>
                            <asp:Label ID="lblAmt" runat="server"
                                Text=""></asp:Label>
                        </td>
                        <td>Portal Fee + Service Tax</td>
                        <td><i class="fa fa-rupee"></i>
                            <asp:Label ID="lblPortalFee" runat="server" Text="Rs. 02.75"></asp:Label>
                            + <i class="fa fa-rupee"></i>
                            <asp:Label ID="lblServTax" runat="server" Text="Rs. 02.75"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Total Amount</td>
                        <td colspan="3"><i class="fa fa-rupee"></i>
                            <asp:Label ID="lblTotalFee" runat="server" Text="Rs. 22.75 (Twenty Two Rupees and Seventy Five Paise)"></asp:Label>
                            <asp:Label ID="lblAmtWord" runat="server" Text="(Thirty Two Rupees and Ninety Paise)"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                    </tr>
                </table>
            </div>
            <%---Start of Button----%>
            <div class="">
                <div class="col-md-12 box-container" id="divBtn">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <input type="button" id="btnPrint" class="btn btn-primary" value="Print" />
                        <asp:Button ID="btnCancel" runat="server"
                            CssClass="btn btn-success" PostBackUrl="~/WebApp/Kiosk/Forms/DashboardChart.aspx"
                            Text="Home" />
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
            <%---End of Button----%>
        </div>
    </form>
</body>
</html>
