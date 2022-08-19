<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PNTCMarkSheet.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.ITIPNTC.PNTCMarkSheet" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../../ClientSideCrop/Scripts/jquery.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
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
            <div class="box-body box-body-open" style="margin-top:50px;">
                <asp:Panel ID="divPrint" runat="server" Style="margin: 0 auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; height: 1151px; width: 794px; border: 3px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 3px auto; height: 1141px; width: 785px; border: 1px solid #000; background-image: url('../images/bgLogo.png'); background-image: url('../images/bgLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">

                            <table cellpadding="0" cellspacing="0" style="height: 100%; width: 100%">
                                <tr style="height: 50px;">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="width: 50px;">&nbsp;</td>
                                </tr>
                                <tr style="">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td>
                                                    <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                        <tr>
                                                            <td style="text-align: left; white-space: nowrap;">
                                                                &nbsp;</td>
                                                            <td>&nbsp;</td>
                                                            <td style="text-align: right; white-space: nowrap;">
                                                                <asp:Label ID="Label2" runat="server" Text="Reference ID :"></asp:Label>
                                                                &nbsp;<asp:Label ID="lblAppID" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 148px;">
                                                                <img alt="Logo" src="/WebApp/Kiosk/Images/SCTEVT.jpg" style="width: 120px;" />
                                                            </td>
                                                            <td style="text-align: center; font-size: 25px; font-weight: normal; font-family: Arial Black; color: #000435;">STATE COUNCIL FOR TECHNICAL
                                                                <br />
                                                                EDUCATION &amp; VOCATIONAL TRAINING
                                                                <br />
                                                                ODISHA, BHUBANESWAR</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center;">
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Names="Arial Black" Font-Size="25px" Text="Duplicate Provisional National Trade Certificate"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table cellpadding="0" cellspacing="0" style="width: 100%; line-height: 22px; font-family: Arial; font-size: 15px;">
                                                        <tr>
                                                            <td style="width: 150px">Examination Name</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblExam" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 150px">Institute Name</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblInstitute" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 150px">Trade Name</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblBranch" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 150px">Student Name</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblName" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 150px">Father&#39;s Name</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblCenter" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 150px">Registration No.</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblRegistration" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 150px">PNTC No.</td>
                                                            <td style="width: 20px">:</td>
                                                            <td>
                                                                <asp:Label ID="lblSemester" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 50px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="vertical-align: top">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td style="">
                                                    <asp:Panel ID="pnlGrid" runat="server" ClientIDMode="Static" Style="width: 708px;font-size: 12px">
                                                    </asp:Panel>
                                                    <br />
                                                    <table cellpadding="0" cellspacing="0" style="width: 100%;line-height:22px;display:none;">
                                                        <tr>
                                                            <td style="text-align: left; white-space: nowrap;">
                                                                <asp:Label ID="lblMarks" runat="server" Text="Full Marks : "></asp:Label>
                                                            </td>
                                                            <td style="text-align: center;">&nbsp;</td>
                                                            <td style="text-align: right; white-space: nowrap;">
                                                                <asp:Label ID="Label22" runat="server" Text="Marks Admissible for Division : 2817"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left; white-space: nowrap;">
                                                                <asp:Label ID="lblSecure" runat="server" Text="Full Marks : "></asp:Label>
                                                            </td>
                                                            <td style="text-align: center;">&nbsp;</td>
                                                            <td style="text-align: right; white-space: nowrap;">
                                                                <asp:Label ID="lblDivision" runat="server" Text="Division : "></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr id="trFile" runat="server">
                                                
                                                <td>Download Divisional Mark Sheet : <a href="#" id="lblDownload" runat="server">
                                                    <asp:Label ID="lblfile" runat="server" Text="No File Uploaded"></asp:Label></a></td>
                                                

                                            </tr>
                                            <tr>
                                                <td style="">
                                                    <asp:Label ID="lblResult" runat="server">Result :</asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr style="vertical-align: bottom">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td style="width: 50px;">&nbsp;</td>
                                </tr>
                                <tr style="vertical-align: bottom">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td>
                                        <table style="width:100%;">
                                            <tr>
                                                <td style="vertical-align:bottom">
                                                    <div style="float: left;line-height:22px">
                                                        <asp:Label ID="lblDate" runat="server" Text="Date : "></asp:Label>
                                                        <br />
                                                        <asp:Label ID="lblPlace" runat="server" Text="Place : "></asp:Label>
                                                    </div>
                                                </td>
                                                <td style="vertical-align:bottom">
                                                    <div style="float: right;">
                                                        <uc1:QRCode ID="QRCode1" runat="server" />
                                                    </div>
                                                </td>
                                                <td style="vertical-align:bottom">
                                                    <table cellpadding="0" cellspacing="0" style="width: 240px; float: right;line-height:22px;">
                                                        <tr>
                                                            <td style="text-align: center; white-space: nowrap">
                                                                
                                                                <img alt="Logo" src="/WebApp/Kiosk/Images/SECRETARYSCTEVT.png" style="width: 120px;" />
                                                                
                                                                
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center;"><asp:Label ID="Label16" runat="server" Style="font-weight: bold;" Text="SECRETARY"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center;">
                                                                <asp:Label ID="Label18" runat="server" Text="State Council for Technical&lt;br/&gt;Education &amp; Vocational Training,&lt;br/&gt;Odisha "></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 50px;">&nbsp;</td>
                                </tr>
                                <tr style="height: 50px;">
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td style="width: 50px;">&nbsp;</td>
                                </tr>
                            </table>

                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div style="clear: both;">
                &nbsp;
            </div>
            <div style="text-align: center; margin-bottom: 10px;">
                <input type="button" id="btnSubmit" style="background-color: #bab9b9; color:#fff;margin-bottom:50px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            </div>
        </div>
    </form>
</body>
</html>
