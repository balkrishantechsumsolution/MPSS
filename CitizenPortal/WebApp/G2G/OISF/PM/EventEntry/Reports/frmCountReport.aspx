<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCountReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.EventEntry.Reports.frmCountReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Entry Report</title>

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

                                 <tr  >
                                   <td  >
                                        
                                        
                                       <asp:GridView ID="grdAttendanceData" runat="server" Width="100%" Font-Size="14px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                           <AlternatingRowStyle BackColor="White" />
                                           <EditRowStyle BackColor="#2461BF" />
                                           <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                           <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                           <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                           <RowStyle BackColor="#EFF3FB" />
                                           <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                           <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                           <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                           <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                           <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                       </asp:GridView>

                                     
                                       </td>

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
