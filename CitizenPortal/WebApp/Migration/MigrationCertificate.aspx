<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MigrationCertificate.aspx.cs" Inherits="CitizenPortal.WebApp.Migration.MigrationCertificate" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
        <link href="css/dofStylesheet.css" rel="stylesheet" />
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="../../Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1131px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; height: 1119px; width: 784px; border: 1px solid #000; background-image: url('../Kiosk/Images/CSVTU-Background.png');  background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <table style="width: 100%;" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td style="vertical-align: top; height: 924px;">
                                        <div style="margin: 10px auto; width: 708px; font-size: 13px;">

                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="text-align: left">&nbsp;</td>
                                                    <td style="text-align: center; font-size: 15px; font-weight: bold; color: #000654;">
                                                        <br />
                                                    </td>
                                                    <td style="text-align: center">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label1" runat="server" Text="Serial No.:"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblSlNo" runat="server">CSVTU/Mig.Cert/20/15489</asp:Label>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="Application Date :"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblAppDate" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>

                                                        <br />
                                                        <br />
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; font-size: 30px; font-weight: bold; color: #000435;" colspan="3">CHHATTISGARH SWAMI VIVEKANAND<br />
TECHNICAL UNIVERSITY<br />
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center; font-size: 30px; font-weight: bold; color: #000000;">BHILAI</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <img alt="Logo" src="/Sambalpur/img/sambalpur-university-logo.png" style="width: 120px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="font-size: 20px; font-weight: bold;text-align: center">
                                                        <br />
                                                        <asp:Label ID="Label3" runat="server" Text="MIGRATION CERTIFICATE"></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="">
                                                        <table style="line-height: 30px; width: 100%; text-align: justify; font-family: 'Monotype Corsiva'; font-size: 25px;">
                                                            <tr>
                                                                <td style="text-align: justify; vertical-align: middle;">
                                                                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Shri./Smty./Ku.
                                                                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;of&nbsp;
                                                                    <asp:Label ID="lblInstitute" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;with Roll No.
                                                                    <asp:Label ID="lblRollNo" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;and Enrollment No.
                                                                    <asp:Label ID="lblReg" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    , Father/Husband Shri.
                                                                    <asp:Label ID="lblFather" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;is permitted to seek admission in any other University.
                                                                    <br />
                                                                    <br />
                                                                    The above student has last appeared in &nbsp;<asp:Label ID="lblSemester" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;of
                                                                    <asp:Label ID="lblBranch" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;as Main/Supplementary exam of the University in year&nbsp;
                                                                    <asp:Label ID="lblExamYear" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    .
                                                                    <br />
                                                                    <br />
                                                                    He/She has&nbsp;
                                                                    <asp:Label ID="lblResult" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp; in this examination.</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>


                                            <br />
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <br />
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left; width: 200px; vertical-align: bottom"></td>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center; width: 200px; vertical-align: bottom;">
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: bottom">
                                        <table style="width: 100%; margin: auto 0;" cellpadding="5" cellspacing="0" border="0">
                                            <tr>
                                                <td style="width: 40px;">&nbsp;</td>
                                                <td style="text-align: left;font-size:12px; vertical-align: bottom;white-space:nowrap">
                                                    <uc1:QRCode ID="QRCode1" runat="server" />
                                                </td>
                                                <td style="text-align:center">
                                                    &nbsp;</td>
                                                <td style="text-align: right; vertical-align: bottom;">
                                                    <table cellpadding="0" cellspacing="0" style="float: right;line-height:22px;">
                                                        <tr>
                                                            <td style="text-align: center; white-space: nowrap">
                                                                <img alt="Signing Authority" src="../Kiosk/Images/RegistrarCSVTU.png" style="width: 150px;" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center;">
                                                                <asp:Label ID="Label16" runat="server" Style="font-weight: bold;" Text="REGISTRAR"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center;">
                                                                <asp:Label ID="Label12" runat="server" Text="CSVTU, Bhilai"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table></td>
                                                <td style="width: 40px;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 40px;">&nbsp;</td>
                                                <td style="text-align: left;font-size:12px; vertical-align: bottom;white-space:nowrap">&nbsp;</td>
                                                <td style="text-align:center">&nbsp;</td>
                                                <td style="text-align: right; vertical-align: bottom;">&nbsp;</td>
                                                <td style="width: 40px;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 40px;">&nbsp;</td>
                                                <td style="text-align: left;font-size:12px; vertical-align: bottom;white-space:nowrap">&nbsp;</td>
                                                <td style="text-align:center">&nbsp;</td>
                                                <td style="text-align: right; vertical-align: bottom;">&nbsp;</td>
                                                <td style="width: 40px;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 40px;">&nbsp;</td>
                                                <td style="text-align: left;font-size:12px; vertical-align: bottom;white-space:nowrap">
                                                    <asp:Label ID="lblDate0" runat="server" Text="Printed Date : "></asp:Label>
                                                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                                                </td>
                                                <td style="text-align:center">&nbsp;</td>
                                                <td style="text-align: right; vertical-align: bottom;">&nbsp;</td>
                                                <td style="width: 40px;">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <%----------End Document Section ---------%>
                        </div>
                    </div>
                    <div style="margin: 5px auto 0; width: 794px; font-family: Arial; font-size:12px;">
                    <span>**This is a computer generated printout and no signature is required.</span>
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
