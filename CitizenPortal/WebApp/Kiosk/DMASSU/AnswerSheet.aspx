<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnswerSheet.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.DMASSU.AnswerSheet" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../bootstrap.min.css" rel="stylesheet" />
    <link href="../../Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/timeline.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../Styles/bootstrap.min.css" rel="styl esheet" />
    <link href="../../Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../../../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>
    <script language="javascript" type="text/javascript">

        function DownloadFile(p_URL,p_RowID) {
            debugger;
            var t_URL = p_URL;
            t_URL = t_URL + p_RowID;
            window.open(t_URL, 'Receipt', 'titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,width=450,height=450');
            //CreateDialog(t_URL, "");

        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="box-body box-body-open">
                <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1151px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; height: 1141px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

                            <table style="height: 100%; width: 100%">
                                <tr style="">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td style="text-align: right; white-space: nowrap; vertical-align: bottom;">
                                        <asp:Label ID="Label2" runat="server" Text="Reference ID:"></asp:Label>
                                        <asp:Label ID="lblAppID" runat="server"></asp:Label>
                                    </td>
                                    <td style="width: 50px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="vertical-align: top">

                                        <table style="width: 100%">
                                            <tr>
                                                <td style="">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">
                                                    <asp:Label ID="Label19" runat="server" Font-Names="Arial Black" Font-Size="25px" Text="STATE COUNCIL FOR TECHNICAL EDUCATION"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">
                                                    <asp:Label ID="Label21" runat="server" Font-Names="Arial Black" Font-Size="25px" Text="&amp; VOCATIONAL TRAINING"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">
                                                    <asp:Label ID="Label20" runat="server" Font-Bold="False" Font-Names="Arial Black" Font-Size="18px" Text="BHUBANESWAR, ODISHA"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">
                                                    <img alt="Logo" src="/WebApp/Kiosk/Images/SCTEVT.jpg" style="width: 81px; height: 89px;" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Names="Arial Black" Font-Size="20px" Text="COPY OF ANSWER SHEET"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <table style="width: 100%; font-family: Arial; font-size: 14px;">
                                                        <tr>
                                                            <td style="white-space: nowrap;">Candidate Name</td>
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
                                                            <td style="white-space: nowrap;">Session</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblSession" runat="server"></asp:Label>
                                                                &nbsp;-
                                                                <asp:Label ID="lblYear" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap;">Semester</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblSemester" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap;">Registration No.</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblRegistration" runat="server"></asp:Label>
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
                                                            <td style="white-space: nowrap;">&nbsp;</td>
                                                            <td style="width: 20px">&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap;">&nbsp;</td>
                                                            <td style="width: 20px">&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap;">Subject</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblSubjectName" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="white-space: nowrap;">&nbsp;</td>
                                                            <td style="width: 20px">&nbsp;</td>
                                                            <td>
                                                                <a href="#" id="lblDownload" runat="server">Download Answer Sheet</a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    
                                                </td>
                                            </tr>
                                        </table>
                                        
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr style="vertical-align: bottom; font-family: Arial; font-size: 11px;">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td>
                                        <div style="float: left; width: 250px; text-align: left;display:none;">
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
                                            <img alt="Logo" src="/WebApp/Kiosk/Images/ControllerSCTEVT.png" style="width: 120px;" /><br />
                                            <asp:Label ID="Label16" runat="server" Text="CONTROLLER OF EXAMINATIONS"></asp:Label>
                                            <br />
                                            <asp:Label ID="Label18" runat="server" Text="State Council for Technical&lt;br/&gt;Education &amp; Vocational Training,&lt;br/&gt;Odisha "></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 50px;">&nbsp;</td>
                                </tr>
                                <tr style="vertical-align: bottom">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td style="text-align: center;">

                                        <div style="width: 100px; margin: -115px auto 0;">
                                            <uc1:QRCode ID="QRCode1" runat="server" />
                                        </div>

                                    </td>
                                    <td style="width: 50px;">&nbsp;</td>
                                </tr>
                            </table>

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
