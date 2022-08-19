<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmAttendanceSheetAllEvent.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.FrmAttendanceSheetAllEvent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Attendance Sheet</title>
    <link href="../css/allocationCenterStylesheet.css" rel="stylesheet" />
    </head>
<body>
    <form id="form1" runat="server">
     <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title"> Attendance Sheet Report</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
 

      
                             
                            <table  style="width:80%;height:60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea;  box-shadow: 3px 3px 5px #e0e0e0;"">
                                
                                <tr>
                                   <td>
                                      Ground Name :   <asp:DropDownList ID="drpCenter" runat="server" Height="41px"  Width="390px"></asp:DropDownList>
                                       </td>
                                    <td>


                                        Batch/Day</td>

                                     <td>


                                        <asp:DropDownList ID="drpday" runat="server" Height="23px"   Width="148px" AutoPostBack="True" OnSelectedIndexChanged="drpday_SelectedIndexChanged" ></asp:DropDownList>


                                    </td>

                                    </tr>

                                <tr>
                                   <td>
                                        Event :-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:DropDownList ID="drpEvent" runat="server" Height="39px"  Width="308px"  > 
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="2">Physical Measurement</asp:ListItem>
                                            <asp:ListItem Value="3">Medical Fitness</asp:ListItem>
                                            <asp:ListItem Value="1">Bio Matrix</asp:ListItem>                                            
                                            <asp:ListItem Value="4">High Jump</asp:ListItem>
                                            <asp:ListItem Value="5">Broad Jump</asp:ListItem>
                                            <asp:ListItem Value="6">Rope Climbing</asp:ListItem>
                                            <asp:ListItem Value="7">Running</asp:ListItem>
                                            <asp:ListItem Value="8">Cross Country</asp:ListItem>
                                            <asp:ListItem Value="9">Swimming</asp:ListItem>
                                            <asp:ListItem Value="10">Driving</asp:ListItem>
                                        </asp:DropDownList>
                                       </td>
                                    <td>


                                        Rollnumber Range 

                                    </td>

                                     <td>


                                         <asp:DropDownList ID="drpRange" runat="server" Height="38px"  Width="189px" AutoPostBack="True" OnSelectedIndexChanged="drpRange_SelectedIndexChanged" >
                                          
                                           
                                        </asp:DropDownList>
                                       </td>

                                    </tr>

                                <tr>
                                   <td>
                                        &nbsp;</td>
                                    <td>


                                    <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" />

                                    </td>

                                     <td>


                                         &nbsp;</td>

                                    </tr>

                                <tr style="text-align:center">
                                   <td colspan="3" >
                                     <h4>    <asp:Label ID="lblEventSheetType" runat="server" ></asp:Label></h4></td>

                                    </tr>

                                <tr  >
                                   <td colspan="3" >
                                        
                                        
                                       <asp:GridView ID="grdAttendanceData" runat="server" Width="100%" Font-Size="14px"></asp:GridView>

                                     
                                       </td>

                                    </tr>
                                <tr><td>

                                    &nbsp;</td></tr>

                                </table>
                              

                                                            </div>
                    </div>

                </div>
            </div>
  </div>
    </form>
</body>
</html>
