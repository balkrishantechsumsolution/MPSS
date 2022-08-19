<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PracticalAcknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Faculty.PracticalAcknowledgement" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Submitted Mark Acknowledgement</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="../../Scripts/CommonScript.js"></script>

    <script type="text/javascript">
       // $(document).ready(function () {
            function CallPrint(strid)
            {
                debugger;
                var prtContent = document.getElementById('divPrint');
                var WinPrint = window.open('', '', 'letf=0,top=0,width=900,height=700,toolbar=0,scrollbars=0,status=0');
                WinPrint.document.write(prtContent.innerHTML);
                WinPrint.document.close();
                WinPrint.focus();
                WinPrint.print();
                WinPrint.close();
            }
        //});
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint" style="margin: 0 auto; width: 90%; /*height: 1220px; overflow: auto; */">
            <div style="width: 100%; height: auto; font-family: Arial; border: 3px solid #000; padding: 1px; margin: 0 auto;">
                <div style="background-image: url(''); background-size: 590px; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; border: 1px solid #000; margin: 2px auto;">
                    <div style="height: 120px; width: 100%;">


                        <table style="width: 100%; height: 110px">
                            <tr>
                                <td style="width: 125px;">
                                    <div style="width: 165px; margin: 5px 0 0 5px; float: left; height: 115px;">
                                        <img src="../../Sambalpur/img/sambalpur-university-logo.png" alt="Logo" style="width: 70px; margin: 15px 0px 0px 23px" />
                                    </div>
                                </td>
                                <td style="font-size: 25px; font-weight: bold; text-align: center;">
                                    <div>CHHATTISGARH SWAMI VIVEKANAND</div>
                                    <div style="white-space: nowrap">TECHNICAL UNIVERSITY, BHILAI</div>
                                </td>
                                <td style="width: 125px;">&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                    <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; border: 1px solid #565555; border-left: none; border-right: none; color: #fff;">

                        <asp:Label ID="lblCertificateName" runat="server" Text="Practical MARKS DETAILS"></asp:Label>

                    </div>
                    <div style="margin: 10px; width: 100%; height: auto; font-size: 13px;">
                        <table cellspacing="0" cellpadding="0" style="width: 98%; font-size: 13px; line-height: 18px; border: 0; margin: 0;">
                            <tbody>
                                <tr>
                                    <td colspan="6" style="padding: 8px; color: #fff; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #383E4B;">College Details</td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; background-color: #F8F8F8; font-weight: bold; color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">College Name</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;" colspan="3">
                                        <asp:Label ID="lblCollegeName" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; white-space: nowrap;">College Code</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">
                                        <asp:Label ID="lblCollegeCode" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; background-color: #F8F8F8; font-weight: bold; color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; white-space: nowrap;">Course Name</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;" colspan="3">
                                        <asp:Label ID="lblCourse" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;">Course Code</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; white-space: nowrap;">
                                        <asp:Label ID="lblCourseCode" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; background-color: #F8F8F8; font-weight: bold; color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; white-space: nowrap;">Program Name</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;" colspan="3">
                                        <asp:Label ID="lblProgram" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;">Program Code</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; white-space: nowrap;">
                                        <asp:Label ID="lblProgramCode" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; background-color: #F8F8F8; font-weight: bold; color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; white-space: nowrap;">Subject Name</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;" colspan="3">
                                        <asp:Label ID="lblSubject" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;">Subject Code</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; white-space: nowrap;">
                                        <asp:Label ID="lblSubjectCode" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; background-color: #F8F8F8; text-align: left; border: 1px solid #999; padding: 5px;" class="auto-style1">Semester</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; white-space: nowrap;">
                                        <asp:Label ID="lblsemester" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: right; border: 1px solid #999; padding: 5px; font-weight: bold; white-space: nowrap;">Exam Type</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">
                                        <asp:Label ID="lblExamType" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; white-space: nowrap;">Exam Session</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">
                                        <asp:Label ID="lblExamYear" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <table cellspacing="0" cellpadding="0" style="width: 98%; font-size: 13px; line-height: 18px; border: 0; margin: 0;">
                            <tbody>
                                <tr>
                                    <td colspan="4" style="padding: 8px; color: #fff; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #383E4B;">Student Marks Details</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="grdView" runat="server" Style="margin: 0 auto;" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" CellPadding="2" Font-Size="11px" Width="100%">
                                            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; font-size: 13px; border: 0;">
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; color: #fff; font-size: 14px; text-align: left; background-color: #383E4B; border-bottom: none;" colspan="6"><b>Marks Summary</b></td>

                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Total Student</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;"><span id="lblTrnsID" runat="server">
                                    <asp:Label ID="lblTotalNo" runat="server" CssClass="lbl_value"></asp:Label>
                                </span></td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: right; white-space: nowrap;">Marks Submitted</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblExamNo" runat="server" CssClass="lbl_value"></asp:Label>
                                </td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: right; white-space: nowrap;">Marks Entered</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">
                                    <asp:Label ID="lblEnteredNo" runat="server" CssClass="lbl_value"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Submitted By</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2"><span id="lblTrnsID0" runat="server">
                                    <asp:Label ID="lblSubmittedBy" runat="server" CssClass="lbl_value"></asp:Label>
                                </span></td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: center; vertical-align: bottom; font-size: 10px;" colspan="3" rowspan="5">Signature of HODl</td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Submitted On</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2"><span id="lblTrnsID1" runat="server">
                                    <asp:Label ID="lblSubmittedOn" runat="server" CssClass="lbl_value"></asp:Label>
                                </span></td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Approving Authority</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Approved On</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;">Printed On</td>
                                <td style="padding: 5px; border: 1px solid #999; text-align: left;" colspan="2"><span id="lblTrnsID2" runat="server">
                                    <asp:Label ID="lblPrintedOn" runat="server" CssClass="lbl_value"></asp:Label>
                                </span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <div id="divBtn" runat="server" style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" style="background-color: #0040FF; color: #fff; border: none; border-radius: 3px; padding: 10px 18px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>
    </form>
</body>
</html>
