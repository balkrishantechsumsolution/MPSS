<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceSheet_PG.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OUAT.AttendanceSheet_PG" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OUAT PG Attendance Sheet</title>
    <link href="../OISF/css/allocationCenterStylesheet.css" rel="stylesheet" />

    <style>
        @media print {
            input {
                display: none;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title" style="text-align: center">Attendance Sheet OUAT PG & Ph.D 2017</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <table style="width: 794px; height: 60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea; box-shadow: 3px 3px 5px #e0e0e0; margin: 0 auto;">
                                <tr>
                                    <td colspan="2" style="color:red; font-weight:bold; text-align:center">Note : For Best View And Avoid Printing Problem, Use Firefox Browser.<br/><br/></td>
                                </tr>
                                <tr>
                                    <td>Center Name :</td>
                                    <td>
                                        <asp:DropDownList ID="drpCenter" runat="server" Height="35px" Width="405px">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="C001">College of Agriculture, Bhubaneswar</asp:ListItem>
                                            <%--<asp:ListItem Value="C004">College of Forestry, Bhubaneswar</asp:ListItem>--%>
                                            <asp:ListItem Value="C005">College of Fisheries, Raigailunda</asp:ListItem>
                                            <asp:ListItem Value="C003">College of Veterinary Science B.V.Sc. & A.H, Bhubaneswar</asp:ListItem>
                                            <%--<asp:ListItem Value="C002">College of Agricultural Engineering & Technology, Bhubaneswar</asp:ListItem>--%>
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>
                                    <td>App Id / RollNumber</td>
                                    <td>
                                        <asp:TextBox ID="txtSearch" runat="server" Height="30px" Width="400px" MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>Range</td>
                                    <td>
                                        <asp:DropDownList ID="drpRange" runat="server" Height="35px" Width="158px" AutoPostBack="True" OnSelectedIndexChanged="drpRange_SelectedIndexChanged">
                                            <%--<asp:ListItem Value="0">Select</asp:ListItem>--%>
                                            <asp:ListItem Selected="True" Value="1">01-100</asp:ListItem>
                                            <asp:ListItem Value="2">101-200</asp:ListItem>
                                            <asp:ListItem Value="3">201-300</asp:ListItem>
                                            <asp:ListItem Value="4">301-400</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" Height="36px" Width="115px" OnClick="btnSearch_Click" />
                                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" Height="36px" Width="115px" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>

                                <tr style="text-align: center">
                                    <td colspan="2">
                                        <h4>
                                            <asp:Label ID="lblCenterName" runat="server"></asp:Label></h4>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <asp:GridView ID="grdAttendanceSheet" runat="server" Width="785px" ShowHeader="False" AutoGenerateColumns="false" OnRowDataBound="grdAttendanceSheet_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <table cellpadding="5" cellspacing="0" class="table-bordered" style="width: 100%; border: 0; font-family: Arial !important; font-size: 11px;">
                                                            <tr>
                                                                <td style="padding: 0; border: 1px solid #999; text-align: left; vertical-align: top; width: 35px;" rowspan="3">
                                                                    <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td rowspan="3" style="padding: 0; border: 1px solid #999; text-align: center; width: 100px">
                                                                    <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 100px; height: 82px;" id="ProfilePhoto" /><br />
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 115px;">Roll No.</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">
                                                                    <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">App No.</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">
                                                                    <asp:Label ID="lblReferenceId" runat="server" Text='<%# Eval("AppNumber").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; vertical-align: bottom; text-align: center; font-size: 10px; width: 350px" rowspan="3" color="black">Applicant's Signature</font></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">Degree</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">
                                                                    <asp:Label ID="lblDegree" runat="server" Text='<%# Eval("StreamName").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">Subject Name</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">
                                                                    <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("SubjectName").ToString() %>'></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">Name :</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="lblApplicantName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">OMR Sheet No :</td>
                                                                 <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;" colspan="4">
                                                                    <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; min-height: 35px; min-width: 100px; max-height: 35px; max-width: 150px;" id="Img1" /></td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>