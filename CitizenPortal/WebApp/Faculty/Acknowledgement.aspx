<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="CitizenPortal.WebApp.Faculty.Acknowledgement" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recommended Faculty Acknowledgement</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="../../Scripts/CommonScript.js"></script>

    <script type="text/javascript">
        //$(document).ready(function () {
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

            function TakeAction(p_AppID) {
                //alert(p_URL, p_ServiceID, p_AppID);
                //var t_URL = ResolveUrl(p_URL);
                var t_URL = "/WebApp/Faculty/FacultyPage.aspx";
                t_URL = t_URL + "?ProfileID=" + p_AppID;
                window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=1000,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
                return false;
            }
        //});
    </script>
    </head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint" style="margin: 0 auto; width: 90%; /*height: 1220px; overflow: auto; */">
            <div style="width: 100%; height: auto; font-family: Arial;  border: 2px solid #000; padding: 1px; margin: 0 auto;">
                <div style="background-image: url(''); background-size: 590px; background-repeat: no-repeat; background-position: center center; width: 99.3%; height: auto; border: 1px solid #000; margin: 2px auto;">
                    <div style="height: 100px; width: 100%;">


                        <table style="width: 100%; height: 100px">
                            <tr>
                                <td>
                                    <div style="width: 150px; margin: 5px 0 0 5px; float: left;">
                                        <img src="/Sambalpur/img/sambalpur-university-logo.png" alt="Logo" style="width: 75px; margin:5px 30px" />
                                    </div>
                                </td>
                                <td style="font-size: 25px; font-weight: bold; text-align: center; white-space: nowrap;">CHHATTISGARH SWAMI VIVEKANAND<br />
                                    TECHNICAL UNIVERSITY, BHILAI
                                    <br />
                                    <span style="font-size: 20px;">Examination Committee</span>
                                </td>
                                <td>
                                    <div style="width: 150px; float: right;">
                                        <img alt="Logo" src="../../Sambalpur/img/DigiVarsity.png" style="width: 84px; margin:5px 30px;display:none" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="text-align: center; font-size: 20px; font-weight: bolder; padding: 5px; text-transform: uppercase; background-color: #808080; border: 1px solid #565555; border-left: none; border-right: none; color: #fff;">

                        <asp:Label ID="lblCertificateName" runat="server" Text="RECOMMENDED FACULTY DETAILS"></asp:Label>

                    </div>
                    <div style="margin: 10px; width: 100%; height: auto; font-size: 13px;">

                        <div id="divDetail" runat="server" >

                        </div>
                        <%--<table cellspacing="0" cellpadding="0" style="width: 98%; font-size: 13px; line-height: 18px; border: 0; margin: 0;">
                            <tbody>
                                <tr>
                                    <td colspan="6" style="padding: 8px; color: #fff; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #383E4B;">Paper Details</td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; background-color: #F8F8F8; font-weight: bold; color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;background-color: #383E4B;color: #fff;">Department</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; white-space: nowrap;">
                                        <asp:Label ID="lblDepartment" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;background-color: #383E4B;color: #fff;">Course</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">
                                        <asp:Label ID="lblCourse" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; white-space: nowrap;background-color: #383E4B;color: #fff;">Branch</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">
                                        <asp:Label ID="lblBranch" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; background-color: #F8F8F8; font-weight: bold; color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;background-color: #383E4B;color: #fff;">Program</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; white-space: nowrap;">
                                        <asp:Label ID="lblProgram" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold;background-color: #383E4B;color: #fff;">Semester</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">
                                        <asp:Label ID="lblsemester" runat="server" /></td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px; font-weight: bold; white-space: nowrap;background-color: #383E4B;color: #fff;">Exam Session</td>
                                    <td style="color: #383E4B; text-align: left; border: 1px solid #999; padding: 5px;">
                                        <asp:Label ID="lblExamYear" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <table cellspacing="0" cellpadding="0" style="width: 98%; font-size: 13px; line-height: 18px; border: 0; margin: 0;">
                            <tbody>
                                <tr>
                                    <td style="padding: 8px; border: 1px solid #999; text-align: left; background-color: #383E4B;" class="auto-style1">Sl.</td>
                                    <td style="padding: 8px; color: #fff; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #383E4B;">Faculty ID</td>
                                    <td style="padding: 8px; color: #fff; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #383E4B;">Faculty Name</td>
                                    <td style="padding: 8px; color: #fff; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #383E4B;">Colleg</td>
                                    <td style="padding: 8px; color: #fff; font-size: 14px; font-weight: bold; border: 1px solid #999; text-align: left; background-color: #383E4B;">Total Experiance</td>
                                    <td style="padding: 8px; border: 1px solid #999; text-align: left; background-color: #383E4B;" class="auto-style1">Detail</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                        <br />--%>
                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 98%; font-size: 13px; border: 0;">
                            <tr>
                                <td style="padding: 8px; border: 1px solid #999; color: #000; font-size: 14px; text-align: left; background-color: #F8F8F8; border-bottom: none;" colspan="3"><b>Authorised Signatory</b></td>

                            </tr>
                            <tr>
                                <td style="width: 34%; padding: 5px; border: 1px solid #999; text-align: center; vertical-align: bottom; font-size: 10px; height: 50px;">Signature of Member 1</td>
                                <td style="width: 33%; padding: 5px; border: 1px solid #999; text-align: center; vertical-align: bottom; font-size: 10px" rowspan="2">Signature of Chairman</td>
                                <td style="width: 33%; padding: 5px; border: 1px solid #999; text-align: center; vertical-align: top; font-size: 10px;border-bottom:0;">Approved</td>
                            </tr>
                            <tr>
                                <td style="padding: 8px; border: 1px solid #999; text-align: center; vertical-align: bottom; font-size: 10px; height: 50px;">Signature of Member 2</td>
                                <td style="width: 33%; padding: 5px; border: 1px solid #999; border-top:0; text-align: center; vertical-align: bottom; font-size: 10px;">Hon. Vice Chancellor;</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <div id="DivPrint" runat="server" style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" style="background-color: #0040FF; color: #fff; border: none; border-radius: 3px; padding: 10px 18px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
        </div>

        
    </form>
</body>
</html>
