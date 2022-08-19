<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProvisionalCertificate.aspx.cs" Inherits="CitizenPortal.WebApp.Provisional.ProvisionalCertificate" %>

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
                        <div style="margin: 3px auto; height: 1119px; width: 784px; border: 1px solid #000; background-image: url('../Kiosk/Images/CSVTU-Background.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
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
                                                        <asp:Label ID="Label1" runat="server" Text="Serial No.:"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblSerilNo" runat="server"></asp:Label>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td style="text-align: right;white-space:nowrap;">
                                                        <asp:Label ID="Label2" runat="server" Text="Date :"></asp:Label>
                                                        &nbsp;<asp:Label ID="lblAppDate" runat="server"></asp:Label>
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
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; font-size: 30px; font-weight: bold; color: #000435;" colspan="3">CHHATTISGARH SWAMI VIVEKANAND TECHNICAL UNIVERSITY
                                                        </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                       
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center; font-size: 25px; font-weight: bold; color: #000000;">Bhilai, Chhattisgarh</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <img alt="Logo" src="/Sambalpur/img/sambalpur-university-logo.png" style="width: 120px;" />
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
                                                        <asp:Label ID="lblCertificate" runat="server" Font-Bold="False" Font-Names="Arial Black" Font-Size="25px" Text="PROVISIONAL CERTIFICATE"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="">
                                                        <table style="height:300px; width: 100%; text-align: justify; font-size: 25px;">
                                                            <tr>
                                                                <td style="text-align: justify;">
                                                                    This is to certify that Shri./Smty./Ku.
                                                                    <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;with (Roll No.
                                                                    <asp:Label ID="lblRollNo" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;&amp; University Enrollment No.
                                                                    <asp:Label ID="lblEnrollmentNo" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    )&nbsp; S/D/W of
                                                                    <asp:Label ID="lblfname" runat="server" Font-Names="Arial" Font-Size="20px" Font-Bold="True" Font-Italic="True"></asp:Label>
                                                                    &nbsp;has successfully passed
                                                                    <asp:Label ID="lblBranch" runat="server" Font-Names="Arial" Font-Size="20px" Font-Bold="True" Font-Italic="True"></asp:Label>
                                                                    &nbsp;course from
                                                                    <asp:Label ID="lblInstitute" runat="server" Font-Names="Arial" Font-Size="20px" Font-Bold="True" Font-Italic="True"></asp:Label>
                                                                    &nbsp;of this University in
                                                                    <asp:Label ID="lblDivision" runat="server" Font-Names="Arial" Font-Size="20px" Font-Bold="True" Font-Italic="True"></asp:Label>
                                                                    &nbsp;with
                                                                    <asp:Label ID="lblPercentage" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;marks in the year&nbsp;
                                                                    <asp:Label ID="lblSession" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;<span id="lblCPIText" runat="server">
                                                                    and has
                                                                    <asp:Label ID="lblCPI" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;as Cumulative Performance Index (CPI)</span>.
                                                                    <br />
                                                                    <br />
                                                                    He/She is eligible for the award of&nbsp;
                                                                    <asp:Label ID="lblDegree" runat="server" Font-Bold="True" Font-Italic="True" Font-Names="Arial" Font-Size="20px"></asp:Label>
                                                                    &nbsp;of the University.</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>

                                            
                                            <br />
                                            <br />
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="text-align:left" rowspan="4">
                                                        <uc1:QRCode ID="QRCode1" runat="server" />
                                                    </td>
                                                    <td rowspan="4"style="text-align:center;vertical-align:bottom;">
                                                        
                                                    </td>
                                                    <td style="text-align:center">                                                        
                                                        <img alt="Signing Authority" src="../Kiosk/Images/RegistrarCSVTU.png" style="width: 150px;" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">
                                                        <asp:Label ID="Label16" runat="server" Style="font-weight: bold;" Text="REGISTRAR"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; width: 200px;">
                                                        <asp:Label ID="Label17" runat="server" Text="CSVTU, Bhilai"></asp:Label>
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
                                                <td style="text-align: left; vertical-align: middle;font-size:10px">
                                                    printed On: <asp:Label ID="lblDate" runat="server"></asp:Label>
                                                    <br />
                                                </td>
                                                <td></td>
                                                <td style="text-align: center; font-weight: bold; color: #000654;">&nbsp;</td>
                                                <td></td>
                                                <td style="text-align: right; vertical-align: bottom;">                                                    
                                                    &nbsp;</td>
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
