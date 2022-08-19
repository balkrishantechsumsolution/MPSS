<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.BulkPayment.Acknowledgement" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bulk Payment Acknowledgement</title>
    <script src="../../Scripts/CommonScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint" style="margin: 0 auto; width: 80%; /*height: 1220px; overflow: auto; */">
            <div style="width: 100%; height: auto; font-family: Arial; border: 3px solid #000; padding: 1px; margin: 0 auto;">
                <div style="background-image: url(''); background-size: 590px; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; border: 1px solid #000; margin: 2px auto;">
                    <div style="height: 140px; width: 100%; border-bottom: 1px solid #999;">
                        <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                            <img src="/Sambalpur/img/sambalpur-university-logo.png" alt="Logo" style="width: 90px; margin: 15px 0px 0px 33px" />

                        </div>
                        <div style="width: 165px; float: right;">
                            <img alt="Logo" src="/Sambalpur/img/DigiVarsity.png" style="width: 100px; margin: 16px 0px 0px 33px;" />
                        </div>
                        <div style="height: 47px; width: 283px; float: right; margin: 45px 31px 0 0; display: none;">
                            <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-bottom: none; border-right: none;">
                                Trans. No.
                            </div>
                            <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999; border-bottom: none;">
                            </div>
                            <div style="height: 23px; width: 83px; padding-left: 7px; float: left; border: 1px solid #999; border-right: none;">
                                Trans. Date
                            </div>
                            <div style="height: 23px; width: 183px; padding-left: 7px; float: right; border: 1px solid #999;">
                                <asp:Label ID="lblappdate" runat="server" Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div style="height: 47px; float: right; margin: 30px 31px 0 0;">
                            <uc1:QRCode runat="server" ID="QRCode1" />
                        </div>
                    </div>
                    <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; color: #fff;">
                        
                            <asp:Label ID="lblCertificateName" runat="server" CssClass="lbl_value" Text=""></asp:Label>
                            <br />
                            <span id="lblDeptName" runat="server" style="font-size: 15px"></span>
                    </div>
                    <div style="margin: 10px; width: 100%; height: auto; font-size: 13px;">
                        <table cellspacing="0" cellpadding="0" style="width: 98%; font-size: 13px; line-height: 18px; border: 0; margin: 0;">
                            <tbody>
                                <tr>
                                    <td colspan="2" style="padding: 8px; color: #fff; font-size: 14px; font-weight: bold; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B;">College Details</td>
                                </tr>
                                <tr>
                                    <td style="width: 25%; background-color: #F8F8F8; font-weight: bold; color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">College Name</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">
                                        <asp:Label ID="lblCollegeName" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 25%; background-color: #F8F8F8; font-weight: bold; color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">Submitted By</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">
                                        <asp:Label ID="lblDEOName" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <table cellspacing="0" cellpadding="0" style="width: 98%; font-size: 13px; line-height: 18px; border: 0; margin: 0;">
                            <tbody>
                                <tr>
                                    <td colspan="4" style="padding: 8px; color: #fff; font-size: 14px; font-weight: bold; border-right: 1px solid #999; border-left: 1px solid #999; text-align: left; background-color: #383E4B;">Student Details</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="grdView" runat="server" Style="margin: 0 auto;" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" CellPadding="2" Font-Size="11px" Width="100%">
                                            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; font-size: 13px; border: 0;">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="4"><b>Payment Details</b></td>

                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">
                                    <asp:Label ID="Label26" runat="server" CssClass="lbl_property" Text="Application No."></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                    <asp:Label ID="lblAppID" runat="server" Font-Bold="False"></asp:Label>
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
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><span id="lblTrnsID" runat="server">
                                    <asp:Label ID="lblTranID" runat="server" CssClass="lbl_value"></asp:Label>
                                </span></td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Date</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                    <asp:Label ID="lblTranDate" runat="server" CssClass="lbl_value"></asp:Label>
                                </td>
                            </tr>

                            <tr style="">
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Transaction Amount</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;"><i class="fa fa-rupee"></i>
                                    <asp:Label ID="lblAppFee" runat="server"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px; white-space: nowrap;">Payment Mode</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 190px;">
                                    <asp:Label ID="lblPayMode" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left; width: 135px;">Total Amount</td>
                                <td colspan="3" style="padding: 5px; border: 1px solid #999; text-align: left;"><i class="fa fa-rupee"></i>
                                    Rs.
                                            <asp:Label ID="lblTotalFee" runat="server"></asp:Label>
                                    &nbsp;<asp:Label ID="lblAmtWord" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <div id="DivPrint" runat="server" style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" style="background-color: #0040FF; color: #fff; border: none; border-radius: 3px; padding: 10px 18px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
         <div id="DivNext" runat="server" style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
            <asp:Button ID="BtnNext" runat="server" Text="Next" OnClick="BtnNext_Click" style="background-color: green; color: #fff; border: none; border-radius: 3px; padding: 10px 18px;" CssClass="btn btn-primary" />
        </div>
    </form>
</body>
</html>
