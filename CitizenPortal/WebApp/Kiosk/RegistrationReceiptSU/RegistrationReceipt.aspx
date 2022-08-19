<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationReceipt.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.RegistrationReceiptSU.RegistrationReceipt" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>
    
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1131px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; height: 1119px; width: 784px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <table style="width: 100%;" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td style="vertical-align: top; height: 924px;">
                                        <div style="margin: 10px auto; width: 708px; font-size: 13px;">

                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="text-align: left" class="auto-style1"></td>
                                                    <td style="text-align: center; font-size: 15px; font-weight: bold; color: #000654;" class="auto-style1">
                                                        <br />
                                                    </td>
                                                    <td style="text-align: center" class="auto-style1"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;white-space:nowrap;" colspan="3">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;white-space:nowrap;">
                                                        <asp:Label ID="Label1" runat="server" Text="Registration No.:"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblReg" runat="server"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td style="text-align: right;white-space:nowrap;">
                                                        <asp:Label ID="Label2" runat="server" Text="Reference ID :"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblAppID" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        
                                                        <br />
                                                        
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; font-size: 32px; font-weight: bold; color: #000435;" colspan="3">CHHATTISGARH SWAMI VIVEKANAD TECHNICAL UNIVERSITY
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                       
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center; font-size: 25px; font-weight: bold; color: #000000;">Raipur, Chhattisgarh</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <img alt="Logo" src="/WebApp/Kiosk/Images/sambalpur-university-logo.png" style="width: 120px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Names="Arial Black" Font-Size="25px" Text="DUPLICATE REGISTRATION RECEIPT"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="">
                                                        <table style="height:300px; width: 100%; text-align: justify; font-family: 'Monotype Corsiva'; font-size: 25px;">
                                                            <tr>
                                                                <td style="text-align: justify;">
                                                                    This is to certifiy that&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:Label ID="lblName" runat="server" Font-Names="Arial" Font-Size="20px" Font-Bold="True" Font-Italic="True"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp; a&nbsp;&nbsp;&nbsp;&nbsp;student of&nbsp;
                                                                    <asp:Label ID="lblBranch" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;&nbsp; course of&nbsp;
                                                                    <asp:Label ID="lblStudentType" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;&nbsp; cell,&nbsp;&nbsp; Samblpur University is assigned with University&nbsp;&nbsp;&nbsp;wirh&nbsp;&nbsp;&nbsp; Registeration&nbsp;&nbsp; No.&nbsp;&nbsp;
                                                                    <asp:Label ID="lblRegNo" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    .</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>

                                            
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="text-align:center">
                                                        <img alt="Logo" src="/WebApp/Kiosk/Images/SECRETARYSCTEVT.png" style="width: 150px;" />
                                                    </td>
                                                    <td rowspan="4"style="text-align:center;vertical-align:bottom;">
                                                        
                                                    </td>
                                                    <td style="text-align:center">
                                                        <img alt="Logo" src="/WebApp/Kiosk/Images/ChairmanSCTEVT.png" style="width: 150px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">
                                                        <asp:Label ID="Label14" runat="server" style="font-weight:bold" Text="PRINCIPAL"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center;">
                                                        <asp:Label ID="Label13" runat="server" style="font-weight:bold" Text="DEPUTY  REGISTRAR"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;"></td>
                                                    <td style="text-align: center;"></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; width: 200px;">
                                                        <asp:Label ID="lblCollege" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center; width: 200px;">
                                                        <asp:Label ID="Label11" runat="server" Text="Chhattisgarh Swami Vivekanad Technical University, Raipur"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: bottom;">
                                        <table style="width: 100%; margin: auto 0;" cellpadding="5" cellspacing="0" border="0">
                                            <tr>
                                                <td style="width:40px;">
                                                    &nbsp;</td>
                                                <td style="text-align: left; vertical-align: middle;">
                                                    <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblPlace" runat="server" Text="Place : "></asp:Label>
                                                </td>
                                                <td></td>
                                                <td style="text-align: center; font-weight: bold; color: #000654;">&nbsp;</td>
                                                <td></td>
                                                <td style="text-align: right; vertical-align: bottom;">                                                    
                                                    <uc1:QRCode runat="server" ID="QRCode1" />
                                                </td>
                                                 <td style="width:40px;">
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                    <div style="margin: 5px auto 0; width: 794px; font-family: Arial; font-size:12px;">
                    <span>This is computer generated document. To verify the genuinity, please visit <b>https://lokaseba-odisha.in</b></span>
                    </div>
                </asp:Panel>
            </div>
            <div class="clear" style="page-break-before: always;">
                &nbsp;
            </div>
            <div style="text-align: center; margin-bottom: 10px;">
                <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
            </div>
        </div>
    </form>
</body>
</html>
