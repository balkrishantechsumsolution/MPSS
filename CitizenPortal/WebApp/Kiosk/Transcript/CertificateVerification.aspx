<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CertificateVerification.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Transcript.CertificateVerification" %>

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
                        <div style="margin: 3px auto; height: 1120px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            
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
                                                    <td style="text-align: left">&nbsp;</td>
                                                    <td style="text-align: center; font-size: 15px; font-weight: bold; color: #000654;">&nbsp;</td>
                                                    <td style="text-align: center">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">
                                                        &nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label2" runat="server" Text="Reference ID :"></asp:Label>
                                                        &nbsp;<asp:Label ID="appId" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <table class="nav-justified">
                                                            <tr>
                                                                <td>
                                                                    <img alt="Logo" src="/WebApp/Kiosk/Images/SCTEVT.jpg" style="width: 80px;" />
                                                                </td>
                                                                <td style="width: 100px;">&nbsp;</td>
                                                                <td colspan="3">
                                                                    <div style="vertical-align: top; text-align: center; font-size: 22px; font-weight: bold; color: #000435;">
                                                                        STATE COUNCIL FOR TECHNICAL EDUCATION<br />
                                                                        &amp; VOCATIONAL TRAINING
                                                                    </div>
                                                                    <div style="vertical-align: top; text-align: center; font-size: 17px; font-weight: bold; color: #000435;">
                                                                        UNIT-VIII, NEAR RAJ BHAWAN, BHUBANESWAR-12
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center; font-size: 20px; font-weight: bold; color: #000000;">DOCUMENT VERIFICATION</td>
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
                                                    <td colspan="3" style="text-align: left">
                                                        <table>
                                                            <tr>
                                                                <td>To,</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="lblCompany" runat="server" Font-Bold="True"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td>
                                                                    <asp:Label ID="lblAddress0" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: center">
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left">
                                                        <asp:Label ID="lblSubject" runat="server" Font-Bold="True">Subject : Document Verification</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left">
                                                        <asp:Label ID="lblSubject0" runat="server">Sir,</asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left">
                                                        <table>
                                                            <tr>
                                                                <td style="width: 50px;">&nbsp;</td>
                                                                <td>
                                                                    <p>With reference to your Application No.
                                                                        <asp:Label ID="lblAppID" runat="server" Font-Bold="True"></asp:Label>
                                                                        Dated
                                                                        <asp:Label ID="lblAppDate" runat="server" Font-Bold="True"></asp:Label>
                                                                        on the subject cited above, I am to say that, on verification of records available in this Council, the documnt(s) submited in respect of the folowing student has been verified found genuine.</p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 50px;">&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td class=""></td>
                                                                <td></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 50px;">&nbsp;</td>
                                                                <td>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label1" runat="server" Text="Registration No.:"></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style3" style="text-align: center; width: 15px;">:</td>
                                                                            <td>
                                                                                <asp:Label ID="lblRegistration" runat="server" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label16" runat="server" Text="Student Name"></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style3" style="text-align: center; width: 15px;">:</td>
                                                                            <td>
                                                                                <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label17" runat="server" Text="Institute Name"></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style3" style="text-align: center; width: 15px;">:</td>
                                                                            <td>
                                                                                <asp:Label ID="lblInstitute" runat="server" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label18" runat="server" Text="Branch "></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style3" style="text-align: center; width: 15px;">:</td>
                                                                            <td>
                                                                                <asp:Label ID="lblBranch" runat="server" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label19" runat="server" Text="Passing Year "></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style3" style="text-align: center; width: 15px;">:</td>
                                                                            <td>
                                                                                <asp:Label ID="lblYear" runat="server" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label20" runat="server" Text="Division"></asp:Label>
                                                                            </td>
                                                                            <td class="auto-style3" style="text-align: center; width: 15px;">:</td>
                                                                            <td>
                                                                                <asp:Label ID="lblDivision" runat="server" Font-Bold="True"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" style="text-align: left">&nbsp;</td>
                                                </tr>
                                            </table>


                                            <br />
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center;">
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center;">&nbsp;</td>
                                                    <td style="text-align: center;">&nbsp;</td>
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
                                                    <td style="text-align: left; width: 200px; vertical-align: bottom">
                                                        
                                                    </td>
                                                    <td style="text-align:center;">&nbsp;</td>
                                                    <td style="text-align:center; width: 230px; vertical-align: bottom;">
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
                                                <td style="text-align: left; vertical-align: bottom;width: 305px;">
                                                    <asp:Label ID="lblPrinted" runat="server" Visible="false" Text="Printed On : "></asp:Label>
                                                    <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lblPlace" runat="server" Text="Place : "></asp:Label>
                                                </td>
                                                <td style="text-align: right; vertical-align: bottom;">
                                                    <uc1:QRCode ID="QRCode1" runat="server" />
                                                </td>
                                                <td style="text-align: center; font-weight: bold; color: #000654;">&nbsp;</td>
                                                <td></td>
                                                <td style="text-align: center; vertical-align: bottom;width: 305px;">   
                                                    <table cellpadding="0" cellspacing="0" style="float: right;line-height:22px;">
                                                        <tr>
                                                            <td style="text-align: center; white-space: nowrap">
                                                                <img alt="Logo" src="/WebApp/Kiosk/Images/ControllerSCTEVT.png" style="width: 120px;" /></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center;">
                                                                <asp:Label ID="Label3" runat="server" Style="font-weight: bold;" Text="SECRETARY"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center;">
                                                                <asp:Label ID="Label4" runat="server" Text="State Council for Technical&lt;br/&gt;Education &amp; Vocational Training,&lt;br/&gt;Odisha "></asp:Label>
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
