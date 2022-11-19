<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintDegreeCertificate.aspx.cs" Inherits="CitizenPortal.WebApp.Degree.PrintDegreeCertificate" %>


<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
</head>
<body style="margin: 0 auto">
    <form id="form1" runat="server" style="border: 0px solid #000; margin: 0 auto">

        <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; border: 0px solid #000; /*height: 1220px; overflow: auto; */">
            <div style="margin: 0 auto; height: 1128px; width: 794px; border: 0px solid #000; padding: 1px; font-family: Arial">
                <div style="margin: 0 auto; background-image: url('../../PortalImages/Diploma-structure-10.jpg'); background-size: 100%; background-repeat: no-repeat; background-position: center center;">
                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                        <tr style="height: 20px">
                            <td style="vertical-align: top;">
                                <div style="margin: 15px auto; width: 708px; font-size: 13px;">
                                    <table style="width: 100%; height: 20px; border: 0px solid">
                                        <tr>
                                            <td style="text-align: left; white-space: nowrap; width: 250px">
                                                <div style="margin: 5px  0 0 100px; font-weight: bold; font-size: 15px;">
                                                    <asp:Label ID="lblEnrollment" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                            <td>&nbsp;</td>
                                            <td style="text-align: right; width: 270px">
                                                <div style="margin: 5px 0 0 120px; font-weight: bold; font-size: 15px;">
                                                    <asp:Label ID="lblRollNo" runat="server"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <div style="height: 273px; border: 0px solid; width: 100%; margin: 0 auto">&nbsp;&nbsp;</div>
                                    <div style="text-align: center; border: 0px solid; width: 100%;height: 275px;">
                                        <table cellpadding="0" cellspacing="0" width="100%" style="text-align: center;">
                                            <tr>
                                                <td style="height: 38px;vertical-align:middle">
                                                    <div style="height: 38px; width: 100%;">
                                                        <asp:Label ID="lblCertificateHindi" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="25px" Text="इंजीनिरिंग में पत्रोपाधि"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align:middle"><div style="height: 30px; width: 100%;"></div></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 38px;vertical-align:middle">
                                                    <div style="height: 38px; width: 100%;">
                                                        <asp:Label ID="lblNameH" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 38px;vertical-align:middle">
                                                    <div style="margin: 10px 0 0 245px; text-align: left; height: 38px">
                                                        <asp:Label ID="lblSessionH" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 38px;vertical-align:middle">
                                                    <div style="margin-top: -5px; text-align: center; height: 38px; width: 100%">
                                                        <asp:Label ID="lblBranchH1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 37px;vertical-align:middle">
                                                    <div style="margin: 0 0 0 200px; width: 265px; text-align: center; height: 38px;">
                                                        <asp:Label ID="lblDivisionH" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="height: 38px;vertical-align:middle">
                                                    <div style="margin: 25px 0 0 0; text-align: center; height: 38px; width: 100%">
                                                        <asp:Label ID="lblBranchH2" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                    <div style="height:55px;">&nbsp;</div>
                                    <div style="text-align: center; border: 0px solid; width: 100%;height: 275px;">
                                        <table cellpadding="0" cellspacing="0" width="100%" style="text-align: center">
                                            <tr>
                                                <td style="height: 38px;">
                                                    <div style="margin-top: 5px; height: 35px">
                                                        <asp:Label ID="lblCertificate" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="22px" Text=""></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr style="height: 35px">
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="height: 35px">
                                                    <div style="height: 35px">
                                                        <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="margin: 0 auto; height: 35px">&nbsp;</div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 35px">
                                                    <div style="margin-top: -6px; height: 35px">
                                                        <asp:Label ID="lblBranchE" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 35px">
                                                    <div style="margin-top: -4px;text-align: left;width: 182px;height: 35px;float: right;">
                                                        <asp:Label ID="lblSession" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="height: 35px">
                                                    <div style="margin-top: 2px; text-align: center; height: 38px">
                                                        <asp:Label ID="lblDivision" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 35px">
                                                    <div style="margin-top: 30px; text-align: center; height: 35px">
                                                        <asp:Label ID="lblBranch" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>

                                    </div>
                                    <div style="height:50px;"></div>
                                    <div style="border: 0px solid">
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 33%">
                                                    <table>
                                                        <tr>
                                                            <td>&nbsp;</td>
                                                            </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="lblDate" runat="server" Style="margin-left: 50px; font-weight: bold; font-weight: bold; font-size: 15px;"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td style="width: 34%; text-align: right">
                                                    <div style="position: relative; top: 0px">
                                                        <uc1:QRCode ID="QRCode1" runat="server" />
                                                    </div>
                                                    <%--<img src="../../PortalImages/QRCOde.png" style="width: 100px;" />--%>
                                                </td>
                                                <td style="width: 33%;">
                                                    <table style="float: right;">
                                                        <tr>
                                                            <td style="text-align: center">
                                                                <div style="margin-top: 50px; float: right; position: relative; right: -5px;">
                                                                    <asp:Label ID="lblVCName" runat="server" Text="(Dr. M. K. VERMA)" Style="font-weight: bold; font-size: 15px; white-space: nowrap"></asp:Label>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                            </td>
                        </tr>


                    </table>

                </div>
            </div>
        </asp:Panel>


        <div style="text-align: center; margin: 50px 0;">
            <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
        </div>

    </form>
</body>
</html>
