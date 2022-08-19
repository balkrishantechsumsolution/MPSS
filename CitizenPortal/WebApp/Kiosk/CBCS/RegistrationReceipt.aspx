<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationReceipt.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.CBCS.RegistrationReceipt" %>

<%@ Register Src="~/WebApp/Common/QRCode/QRCode.ascx" TagPrefix="uc1" TagName="QRCode" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Receipt</title>
    <script src="../../Scripts/CommonScript.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divPrint" style="margin: 0 auto; width: 800px;">
            <div style="height: 380px; width: 794px; font-family: Arial; font-size: 11px; padding: 2px; margin: 0 auto;">
                <div style="height: 378px; width: 792px; font-size: 11px; border: 2px solid #ddd; background-image: url('../images/Sambalpur_UniversityLogo.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center; -webkit-print-color-adjust: exact;">
                    <%---------Start Header section --------%>
                    <div style="width: 100%;">

                        <div style="text-align: center; margin: 0 auto;">
                            <table style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <td style="text-align: left; padding: 3px 5px;">
                                            <img src="img/sambalpur-university-logo.png" alt="Chhattisgarh Swami Vivekanad Technical University,Odisha" style="width: 105px; height: 90px;" /></td>
                                        <td style="font-size: 24px; font-weight: bold; text-align: center;">CHHATTISGARH SWAMI VIVEKANAD TECHNICAL UNIVERSITY<br />
                                            <span style="font-size: 13px; font-weight: normal;">(State Government Owned)</span><br />
                                            <span style="font-size: 16px; font-weight: normal;">Raipur, Chhattisgarh.</span></td>
                                        <td valign="top">
                                            <div style="float: right;">
                                                <uc1:QRCode runat="server" ID="QRCode" />
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>


                        </div>


                    </div>
                    <%----------End Header section ---------%>                    <%---------Start Title section --------%>
                    <div style="text-align: center; font-size: 18px; padding: 5px; text-transform: uppercase; background-color: #ddd; color: #333;">
                        <b>REGISTRATION RECEIPT</b>                       
                    </div>
                    <%----------End title section ---------%>
                    <table style="width: 98%; margin: 0 auto;">

                        <tr>
                            <td style="vertical-align: top;">
                                <table border="0" cellspacing="0" cellpadding="0" style="height:100%;">
                                    <tr>
                                        <td style="border: 1px solid #ccc; width: 135px; vertical-align: top;">
                                            <img runat="server" src="/webApp/kiosk/Images/photo.png" style="margin: 1px; width: 105px;" id="ProfilePhoto" />

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="border: 1px solid #ccc; width: 135px; vertical-align: top;">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center; width: 135px;vertical-align: bottom;">
                                            <img runat="server" src="/webApp/kiosk/Images/signature.png" id="ProfileSignature" style="width: 118px; height: 46px;" />

                                        </td>
                                    </tr>
                                </table>

                            </td>
                            <td style="vertical-align: top;">
                                <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; margin: 0;">
                                    <tr>
                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Registration Number</b></td>
                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" >
                                            <asp:Label ID="lblRegistrationNo" runat="server"></asp:Label></td>
                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" ><b>Roll No</b></td>
                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left;">
                                            <asp:Label ID="lblRollNo" runat="server"></asp:Label>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>College</b></td>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" >
                                            <asp:Label ID="lblCollegeName" runat="server"></asp:Label> &nbsp;<asp:Label ID="lblCollegeCode" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>Name of the Student</b></td>
                                        <td colspan="3" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;" >
                                            <asp:Label ID="FullName" runat="server"></asp:Label>
                                            <asp:Label ID="lblAppDate" runat="server" Visible="False"></asp:Label>
                                            </td>
                                    </tr>

                                    <%--<tr>
                                            <td colspan="4" style="padding: 5px; background-color: #ddd; font-size: 13px; color: #333; border-right: 1px solid #ccc; border-left: 1px solid #ccc; text-align: left;">Student Details</td>
                                        </tr>--%>
                                    
                                    <tr>
                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;">
                                            <b>Date of Birth
                                            </b></td>
                                        <td width="263" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                            <asp:Label ID="DOBConverted" runat="server"></asp:Label> <asp:Label ID="AgeYear" runat="server"></asp:Label>
                                            <asp:Label ID="AgeMonth" runat="server"></asp:Label>
                                            <asp:Label ID="AgeDay" runat="server"></asp:Label></td>
                                        <td width="194" style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;"><b>
                                            <span style="font-size: 11px;">Gender</span></b></td>
                                        <td width="224" style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                             <asp:Label ID="gender" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                       
                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" >
                                            <b>Category</b>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; width: 120px; font-size: 11px;">
                                            <asp:Label ID="Category" runat="server"></asp:Label>
                                        </td>
                                        <td style="padding: 5px; border: 1px solid #ccc; background-color: #F8F8F8; color: #383E4B; text-align: left; font-size: 11px;" ><b>Branch</b></td>
                                        <td style="padding: 5px; border: 1px solid #ccc; color: #383E4B; text-align: left; font-size: 11px;">
                                            <asp:Label ID="lblbranch" runat="server"></asp:Label>
                                            </td>
                                    </tr>
                                    
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table cellpadding="0" cellspacing="0" style="width:100%;">
                         <tr>
                            <td style="padding-left:15px">Date : <asp:Label ID="CurrentDate" runat="server"></asp:Label></td>
                            <td style="text-align:center;width:200px">Registrar Signature & Seal</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td style="text-align:right;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td style="text-align:right;">&nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div style="text-align: center; margin-top: 15px; margin-bottom: 10px;">
            <input type="button" id="btnSubmit" style="color: #fff; background-color: #337ab7; border-color: #2e6da4; border: none; padding: 8px 15px; border-radius: 2px;" value="Print" onclick="javascript: CallPrint('divPrint');" />
            <input type="submit" name="" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
        </div>
    </form>
</body>
</html>
