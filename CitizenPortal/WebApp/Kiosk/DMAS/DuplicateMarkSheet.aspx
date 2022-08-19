<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DuplicateMarkSheet.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DMAS.DuplicateMarkSheet" %>

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
                    <div style="margin: 0 auto; height: 1141px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; height: 1131px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

                            <table style="height: 100%; width: 100%">
                                <tr style="">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td style="text-align: right; white-space: nowrap;vertical-align:bottom;">
                                        <asp:Label ID="Label2" runat="server" Text="Reference ID :"></asp:Label>
                                        <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 50px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="vertical-align: top">

                                        <table style="width: 100%">
                                            <tr>
                                                <td style="">
                                                    
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 90px;">
                                                                <img alt="Logo" src="/WebApp/Kiosk/Images/SCTEVT.jpg" style="width: 81px; height: 89px;" />
                                                            </td>
                                                            <td style="text-align: center; font-size: 20px; font-weight: normal; font-family: Arial Black; color: #000435;">STATE COUNCIL FOR TECHNICAL EDUCATION &amp; VOCATIONAL TRAINING, ODISHA, BHUBANESWAR<br />
                                                                <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Names="Arial Black" Font-Size="20px" Text="DUPLICATE-DIVISIONAL MARKSHEET"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <table style="width: 100%;font-family:Arial;font-size:11px;">
                                                        <tr>
                                                            <td style="white-space: nowrap;width: 100px;">Candidate Name</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>Sri./ Kumari
                                                                <asp:Label ID="lblName" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap;">Branch</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblBranch" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap;">Institute Name</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblInstitute" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap;">Examination</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblExam" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap;">Registration No.</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblRegistration" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Panel ID="pnlGrid" runat="server" ClientIDMode="Static" Style="width: 95%; margin: 0 0 0 35px; font-size: 11px; font-family: Arial;">
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr id="trFile" runat="server">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td>
                                        Download Divisional Mark Sheet : <a href="#" id="lblDownload" runat="server"><asp:Label ID="lblfile" runat="server" Text="Click to download file"></asp:Label></a></td>
                                    <td style="width: 50px;">&nbsp;</td>

                                </tr>
                                <tr style="vertical-align: bottom;font-family:Arial;font-size:11px;">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td>
                                        <div style="float: left; width: 250px; text-align: left">
                                            <asp:Label ID="lblMarks" runat="server" Text="Full Marks : "></asp:Label>
                                            <br />
                                            <asp:Label ID="lblSecure" runat="server" Text="Marks Secured"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblDivMark" runat="server" Text="Marks Admissible for Division : 2817"></asp:Label>
                                            <br />
                                            <asp:Label ID="lblDivision" runat="server" Text="Division : "></asp:Label>
                                            <br />
                                            <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                                        </div>
                                        <div style="float: right; width: 250px; text-align: center">
                                            <img alt="Logo" src="/WebApp/Kiosk/Images/ControllerSCTEVT.png" style="width: 120px;margin-top:-5px;" />
                                            <br />
                                            <asp:Label ID="Label16" runat="server" Text="CONTROLLER OF EXAMINATIONS"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label18" runat="server" Text="State Council for Technical&lt;br/&gt;Education &amp; Vocational Training,&lt;br/&gt;Odisha "></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 50px;"></td>
                                </tr>
                                <tr style="vertical-align: bottom">
                                    <td style="width: 50px;"></td>
                                    <td style="text-align:center;">
                                        
                                        <div style="width: 100px; margin: -115px auto 0;">
                                            <uc1:QRCode ID="QRCode1" runat="server" />
                                        </div>
                                        
                                    </td>
                                    <td style="width: 50px;"></td>
                                </tr>
                            </table>

                        </div>
                    </div>
                    <div style="margin: 2px auto 0; width: 794px; font-family: Arial; font-size:12px;">
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
