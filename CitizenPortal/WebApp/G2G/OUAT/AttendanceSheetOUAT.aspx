<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceSheetOUAT.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OUAT.AttendanceSheetOUAT" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OUAT Attendance Sheet</title>
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
                        <h4 class="box-title" style="text-align:center">Attendance Sheet</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <table style="width: 794px; height: 60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea; box-shadow: 3px 3px 5px #e0e0e0; margin: 0 auto;">
                                <tr>
                                    <td>District :   
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="drpDistrict" runat="server" Height="40px" Width="406px"  AutoPostBack="True" OnSelectedIndexChanged="drpDistrict_SelectedIndexChanged">
                                        
                                        </asp:DropDownList></td>
                                </tr>

                                <tr>
                                    <td>Center Name :</td>
                                    <td>


                                        <asp:DropDownList ID="drpCenter" runat="server" Height="34px" Width="405px" OnSelectedIndexChanged="drpCenter_SelectedIndexChanged"  ></asp:DropDownList>


                                    </td>

                                </tr>

                                <tr>
                                    <td>Range</td>
                                    <td>


                                        <asp:DropDownList ID="drpRange" runat="server" Height="39px" Width="158px" AutoPostBack="True" OnSelectedIndexChanged="drpRange_SelectedIndexChanged"  >
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1">1-200</asp:ListItem>
                                            <asp:ListItem Value="2">201-400</asp:ListItem>
                                            <asp:ListItem Value="3">401-600</asp:ListItem>
                                            <asp:ListItem Value="4">601-800</asp:ListItem>
                                            <asp:ListItem Value="5">801-1000</asp:ListItem>
                                            <asp:ListItem Value="6">1001-1200</asp:ListItem>


                                        </asp:DropDownList>


                                    </td>

                                </tr>

                                <tr>
                                    <td colspan="2" style="text-align: center;">


                                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" Height="36px" Width="115px" />

                                    </td>

                                </tr>
                                <tr>


                                    <td colspan="2">

                                              
                                    </td>
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
                                                                <td style="padding: 0; border: 1px solid #999; text-align: left; vertical-align:top; width: 35px;" rowspan="4">
                                                                    <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td rowspan="4" style="padding: 0; border: 1px solid #999; text-align: center; width: 100px">
                                                                    <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 100px; height: 82px;" id="ProfilePhoto" /><br />
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 115px;">
                                                                    Roll No.</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">
                                                                    <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">
                                                                    Question Booklet Series :</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 340px;">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; width: 100px;">
                                                                    App ID</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="lblReferenceId" runat="server" Text='<%# Eval("AppNumber").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    OMR Sheet No .:</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left; white-space: nowrap;">
                                                                    Name :</td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    <asp:Label ID="lblApplicantName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
                                                                </td>
                                                                <td style="padding: 3px; border: 1px solid #999; vertical-align:bottom;text-align: center;" colspan="2" rowspan="2">
                                                                       <font size="1" color="black">Applicant's Signature</font></td>
                                                            </tr>
                                                            <tr style="">
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto0" style="margin: 1px; width: 100px; height: 26px;" id="Img1" /></td>
                                                                <td style="padding: 3px; border: 1px solid #999; text-align: left;">
                                                                    &nbsp;</td>
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
