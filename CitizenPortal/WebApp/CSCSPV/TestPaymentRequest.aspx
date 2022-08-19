<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestPaymentRequest.aspx.cs" Inherits="CitizenPortal.WebApp.CSCSPV.TestPaymentRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div align="center">

                <table border="0" cellpadding="1" align="center" width="60%" cellspacing="1" class="txt">
                    <tr bgcolor="#DEF0F0" style="font-weight: bold; background-color: White;">
                        <td colspan="3" align="center" width="428" style="background-color: White; height: 90px;">
                            <div style="float: left;">
                                &nbsp;
                            </div>

                            <div style="float: right;">
                                &nbsp;
                            </div>

                        </td>
                    </tr>
                    <tr bgcolor="#000000" style="font-weight: bold;">
                        <td colspan="2" style="text-align: center; padding-left: 5px; width: 100%; font-size: x-large; font-weight: 700; color: White;">CSC WALLET PAYMENT</td>


                    </tr>


                    <tr bgcolor="#F5DEB3" style="font-weight: bold;">


                        <td style="text-align: left; width: 50%; padding-left: 5px;">OMTID</td>
                        <td style="text-align: left; width: 50%; padding-left: 5px;">
                            <asp:TextBox ID="TextBox1" runat="server" Width="177px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr bgcolor="#F5DEB3" style="font-weight: bold;">


                        <td style="text-align: left; width: 50%; padding-left: 5px;">MID.</td>
                        <td style="text-align: left; width: 50%; padding-left: 5px;">
                            <asp:TextBox ID="TextBox2" runat="server" Width="177px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr bgcolor="#F5DEB3" style="font-weight: bold;">
                        <td style="text-align: left; padding-left: 5px;">MItem
                        </td>


                        <td style="text-align: left; padding-left: 5px;">
                            <asp:TextBox ID="TextBox3" runat="server" Width="177px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr bgcolor="#F5DEB3" style="text-align: center; font-weight: bold;">
                        <td style="text-align: left; padding-left: 5px;">Amount.
                        </td>
                        <td style="text-align: left; padding-left: 5px;">
                            <asp:TextBox ID="TextBox4" runat="server" Width="177px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr bgcolor="#F5DEB3" style="font-weight: bold;">
                        <td style="text-align: left; padding-left: 5px;">Key</td>
                        <td style="text-align: left; padding-left: 5px;">
                            <asp:TextBox ID="TextBox5" runat="server" Width="177px"></asp:TextBox>

                        </td>
                    </tr>
                    <tr bgcolor="#F5DEB3" style="font-weight: bold;">
                        <td style="text-align: left; padding-left: 5px;">Mrxt ID</td>


                        <td style="text-align: left; padding-left: 5px;">
                            <asp:TextBox ID="TextBox6" runat="server" Width="177px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr bgcolor="#F5DEB3" style="font-weight: bold;">
                        <td style="text-align: left; padding-left: 5px;">&nbsp;</td>


                        <td style="text-align: left; padding-left: 5px;">&nbsp;</td>
                    </tr>

                    <tr bgcolor="#F5DEB3" style="font-weight: bold;">
                        <td style="text-align: left; padding-left: 5px;">&nbsp;</td>


                        <td style="text-align: left; padding-left: 5px;">&nbsp;</td>
                    </tr>
                    <tr bgcolor="#F5DEB3" style="font-weight: bold;">

                        <td colspan="2" style="text-align: center;">

                            <asp:Button ID="BtnPay" runat="server" Text="Pay" CausesValidation="true" ValidationGroup="V1"
                                Style="font-weight: 700; font-size: large; font-family: 'Lao UI'"
                                Font-Bold="True" Width="60px"
                                Height="30px" OnClick="BtnPay_Click" />

                        </td>
                    </tr>



                </table>

            </div>

        </div>
    </form>
</body>
</html>
