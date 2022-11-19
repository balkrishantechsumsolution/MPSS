<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DegreeCertificate.aspx.cs" Inherits="CitizenPortal.WebApp.Degree.DegreeCertificate" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1131px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; height: 1122px; width: 784px; border: 1px solid #000; background-image: url('../Kiosk/Images/CSVTU-Background.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
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
                                                    <td style="text-align: left; white-space: nowrap;">
                                                        <asp:Label ID="Label1" runat="server" Text="Enrollment No.:"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblEnrollment" runat="server"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td style="text-align: right; white-space: nowrap;">
                                                        <asp:Label ID="Label2" runat="server" Text="Roll No.:"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblRollNo" runat="server"></asp:Label>
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
                                                    <td style="text-align: center; font-size: 30px; font-weight: bold; color: #000435;" colspan="3">CHHATTISGARH SWAMI VIVEKANAD TECHNICAL UNIVERSITY
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                       </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center; font-size: 25px; font-weight: bold; color: #000000;">Bhilai, Chhattisgarh</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <img alt="Logo" src="/Sambalpur/img/sambalpur-university-logo.png" style="width: 120px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <asp:Label ID="lblCertificateHindi" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="30px" Text="इंजीनिरिंग में पत्रोपाधि"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="">
                                                        <table style="height: 300px; width: 100%; text-align: justify; font-family: 'Monotype Corsiva'; font-size: 25px;">
                                                            <tr>
                                                                <td style="width: 100%; text-align: center; font-family: 'Arial Unicode MS'; font-size: 25px;">&nbsp;प्रमाणित किया जात जाता है की
                                                                    <br />
                                                                    <asp:Label ID="lblNameH" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;<br /> ने 
                                                                    <asp:Label ID="lblSessionH" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;मैं इस विश्वविद्यालय की<br />
                                                                    <asp:Label ID="lblBranchH1" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;<br /> में पत्रोपाधि की परीक्षा
                                                                    <asp:Label ID="lblDivisionH" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;श्रेणी में उत्तीर्ण की|
                                                                    <br />
                                                                    उन्हे
                                                                    <asp:Label ID="lblBranchH2" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;में पत्रोपाधि की उपाधि प्रदान की जाती है|
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; text-align: center;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; text-align: center;">
                                                                    <asp:Label ID="lblCertificate" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="22px" Text="DIPLOMA IN ENGINEERING"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; text-align: center; font-family: 'Monotype Corsiva'; font-size: 25px;">This is to certify that
                                                                    <br />
                                                                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;<br /> having passed the examination for&nbsp;
                                                                    <br />
                                                                    <asp:Label ID="lblBranch" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;<br /> of this University in the &nbsp;
                                                                    <asp:Label ID="lblSession" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;<br /> in the&nbsp;
                                                                    <asp:Label ID="lblDivision" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    ,
                                                                    <br />
                                                                    is awarded the&nbsp;
                                                                    <br />
                                                                    <asp:Label ID="lblBranchE" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    . </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>


                                            <br />
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="text-align: center">&nbsp;</td>
                                                    <td rowspan="4" style="text-align: center;">&nbsp;</td>
                                                    <td rowspan="4" style="text-align: center; vertical-align: bottom;">
                                                        <uc1:QRCode ID="QRCode1" runat="server" />
                                                    </td>
                                                    <td style="text-align: center">
                                                        <img alt="Signing Authority" src="../Kiosk/Images/RegistrarCSVTU.png" style="width: 150px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        <asp:Label ID="Label5" Style="font-family: 'Arial Unicode MS'; font-weight: bold;" runat="server" Text="भिलाई, छत्तीसगढ़ (भारत)"></asp:Label><br />
                                                        <asp:Label ID="Label17" runat="server" Text="Bhilai, Chhattisgarh (India)"></asp:Label>
                                                        </td>
                                                    <td style="text-align: center; font-weight: bold">
                                                        <asp:Label ID="Label3" runat="server" Style="font-family: 'Arial Unicode MS'; font-weight: bold;" Text="कुलपति"></asp:Label>
                                                        <br />
                                                        <asp:Label ID="Label16" runat="server" Style="font-weight: bold;" Text="Vice-Chancellor"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;">                                                        
                                                        <asp:Label ID="Label6" runat="server" Text="Date :"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblDate" runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="lblAppDate" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="text-align: center;">
                                                        <asp:Label ID="Label4" runat="server" Text="Dr. M. K. VERMA"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center; width: 200px;">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                                
                            </table>
                            <%----------End Document Section ---------%>
                        </div>
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
