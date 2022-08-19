<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MigrationCertificateITI.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.ITIMigrationCertificate.MigrationCertificateITI" %>

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
                                                        <asp:Label ID="Label1" runat="server" Text="Registration No.:" Visible="False"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblRegistration" runat="server" Visible="False"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="Reference ID :"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblAppID" runat="server"></asp:Label>
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
                                                    <td style="text-align: center; font-size: 30px; font-weight: bold; color: #000435;" colspan="3">STATE COUNCIL FOR TECHNICAL EDUCATION<br />
                                                        &amp; VOCATIONAL TRAINING</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center; font-size: 30px; font-weight: bold; color: #000000;">ODISHA</td>
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
                                                        <img alt="Logo" src="/WebApp/Kiosk/Images/SCTEVT.jpg" style="width: 120px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="font-size: 20px; font-weight: bold;text-align: center">
                                                        <br />
                                                        <asp:Label ID="Label3" runat="server" Text="MIGRATION CERTIFICATE"></asp:Label>
                                                        &nbsp;- ITI<br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="">
                                                        <table style="line-height: 50px; width: 100%; text-align: justify; font-family: 'Monotype Corsiva'; font-size: 25px;">
                                                            <tr>
                                                                <td style="text-align: justify; vertical-align: middle;">
                                                                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp; Registration No.&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:Label ID="lblReg" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp; of &nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <asp:Label ID="lblInstitute" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;in&nbsp;                                                                    
                                                                    <asp:Label ID="lblBranch" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp; is informed that this State Council has no objection to his/her migration to any other State Board / Council / University for further higher studies.</td>
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
                                                        <br />
                                                        <br />
                                                        <br />
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center;">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;"></td>
                                                    <td style="text-align: center;"></td>
                                                    <td style="text-align: center;"></td>
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
                                                <td style="text-align: left; vertical-align: middle;">
                                                    <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblPlace" runat="server" Text="Place : "></asp:Label>
                                                </td>
                                                <td style="text-align:center">
                                                    <uc1:QRCode ID="QRCode1" runat="server" />
                                                </td>
                                                <td style="text-align: right; vertical-align: bottom;">
                                                    <table cellpadding="0" cellspacing="0" style="float: right;line-height:22px;">
                                                        <tr>
                                                            <td style="text-align: center; white-space: nowrap">
                                                                <img alt="Logo" src="/WebApp/Kiosk/Images/SECRETARYSCTEVT.png" style="width: 120px;" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center;">
                                                                <asp:Label ID="Label16" runat="server" Style="font-weight: bold;" Text="SECRETARY"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center;">
                                                                <asp:Label ID="Label12" runat="server" Text="State Council for Technical&lt;br/&gt;Education &amp; Vocational Training,&lt;br/&gt;Odisha "></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table></td>
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
