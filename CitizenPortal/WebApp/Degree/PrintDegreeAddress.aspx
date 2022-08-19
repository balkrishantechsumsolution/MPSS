<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintDegreeAddress.aspx.cs" Inherits="CitizenPortal.WebApp.Degree.PrintDegreeAddress" %>

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
                <asp:Panel ID="divPrint" runat="server" Style="margin: 50px auto; width: 800px; /*height: 1220px; overflow: auto; */">
                    <div style="margin: 0 auto; width: 794px; border: 2px solid #000; padding: 1px; font-family: Arial">
                        <div style="margin: 2px auto; width: 784px; border: 1px solid #000; background-image: url('../Kiosk/Images/CSVTU-Background.png'); background-size: 590px; background-repeat: no-repeat; background-position: center center;">
                            <%---------Start Header section --------%>
                            <%----------End Header section ---------%><%---------Start Title section --------%>
                            <%----------End title section ---------%><%---------Start Applicant Section --------%>
                            <table style="width: 100%;" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td style="vertical-align: middle;">
                                        <div style="margin: 10px auto; width: 708px; font-size: 20px;">

                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="text-align: left"></td>
                                                    <td rowspan="3">                                                       
                                                    </td>
                                                    <td rowspan="3" style="text-align: center; font-size: 15px; font-weight: bold; color: #000654;">&nbsp;</td>
                                                    <td style="text-align: center"></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblToAddress" runat="server" Text=""></asp:Label>
                                                    </td>
                                                    <td style="vertical-align:bottom;text-align:right">
                                                        <asp:Label ID="lblFromAddress" runat="server" Text=""></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
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
            <div style="text-align: center; margin: 0 0 50px 0;">
                <input type="button" id="btnSubmit" class="btn btn-info" style="background-color: #0040FF !important;" value="Print" onclick="javascript: CallPrint('divPrint');" />
                <input type="submit" name="ctl00$ContentPlaceHolder1$btnCancel" value="Confirm" id="btnCancel" class="btn btn-success" style="display: none" />
            </div>
        </div>
    </form>
</body>
</html>
