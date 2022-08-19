<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SPVPaymentRequest.aspx.cs" Inherits="CitizenPortal.WebApp.CSCSPV.SPVPaymentRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">

        function checkNumericKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && ((charCode >= 48 && charCode <= 57) || charCode == 46))
                return true;
            else {
                alert('Please Enter Integer Value');
                return false;
            }

        }

    </script>
    <link href="../Header/css/style.css" rel="stylesheet" type="text/css" />

    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/sb-admin-2.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row" style="width: 55%; margin: 20px auto;">  
            <div class="row">
                <table class="table table-bordered table-striped">
                    <tr style="background-color: #FFFFFF;">
                        <td colspan="4">
                           <table class="" style="width: 100%">
                    <tr>
                        <td style="text-align: left">
                            <img src="../Kiosk/Images/logo_orissa.gif" style="width: 60px;" /><img src="../Kiosk/Images/logo.png" style="width: 75px;" /></td>
                        <td>
                            &nbsp;</td>
                        <td style="text-align: right">
                            <img src="../Kiosk/Images/logo.jpg" style="width: 120px;" /><img src="../Kiosk/Images/Apnalogo.png" style="width: 120px;" /></td>
                    </tr>
                    <tr>
                        <td style="text-align: center" colspan="3">
                            <b style="text-align: center; white-space: nowrap;font-size:15px;">CSC WALLET PAYMENT</b>
                        </td>
                    </tr>                    
                </table></td>
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
                            <asp:Label ID="lblOMTID" runat="server"
                                Style="font-size: small"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label81" runat="server" Text="Registration No." Visible="False"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblregno" runat="server"
                                Style="font-size: small" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4"><strong>Application Detail</strong></td>
                    </tr>
                    <tr>
                        <td>Application ID</td>
                        <td><span id="lblTrnsID" runat="server" style="font-weight: bold;">
                            <asp:Label ID="lblAppID" runat="server"
                                Style="font-size: small" ></asp:Label>
                            </span></td>
                        <td>Application Date</td>
                        <td><span id="lblTrnsDate" runat="server" style="font-weight: bold;"><asp:Label ID="lblAppDate" runat="server"
                                Style="font-size: small"></asp:Label></span></td>
                    </tr>
                    <tr style="display:none">
                        <td style="white-space: nowrap">
                            <asp:Label ID="lblBenificery" runat="server" Style="white-space: normal !important;">Transaction Amount</asp:Label>
                        </td>
                        <td><i class="fa fa-rupee"></i>

                            <asp:Label ID="lblamount" runat="server"
                                Style="font-size: small"></asp:Label></td>
                        <td>Portal Fee + Service Tax</td>
                        <td><i class="fa fa-rupee"></i>
                            <asp:Label ID="lblPortalFee" runat="server"></asp:Label>
                            + <i class="fa fa-rupee"></i>
                            <asp:Label ID="lblSvcTax" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Total Amount</td>
                        <td colspan="3"><i class="fa fa-rupee"></i>
                            <asp:Label ID="lblTotal" runat="server" style="display:none"></asp:Label>
                            <asp:Label ID="lblTotal2" runat="server"></asp:Label>
                            <asp:Label ID="lblAmtWord" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="4">

                            

                        </td>
                    </tr>
                </table>
            </div>
            <%---Start of Button----%>
            <div class="row">
                <div class="col-md-12 box-container" id="divBtn">
                    <div class="box-body box-body-open" style="text-align: center;">
                        <asp:Button ID="btnPay" runat="server" Text="Confirm Payment" CausesValidation="true" ValidationGroup="V1"
                            class="btn btn-success" OnClick="btnPay_Click" />
                        <input type="button" id="btnPrint" class="btn btn-primary" value="Print"  style="display:none" />
                        <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                            CssClass="btn btn-danger" PostBackUrl=""
                            Text="Cancel" />
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
            <%---End of Button----%>
        </div>
        <asp:HiddenField ID="hdn_omtid" runat="server" Value="" />
        <asp:HiddenField ID="hdn_mtrxid" runat="server" Value="" />
        <asp:HiddenField ID="hdn_amount" runat="server" Value="" />
        <asp:HiddenField ID="hdn_mid" runat="server" Value="" />
        <asp:HiddenField ID="hdn_mitem" runat="server" Value="" />
        <asp:HiddenField ID="hdn_othervals" runat="server" Value="" />
        <asp:HiddenField ID="hdn_smer" runat="server" Value="" />
        <asp:HiddenField ID="HDNMTRXID" runat="server" Value="" />
        <asp:HiddenField ID="HDNSMER" runat="server" Value="" />
        <asp:HiddenField ID="REGNO" runat="server" Value="" />
    </form>
</body>
</html>
