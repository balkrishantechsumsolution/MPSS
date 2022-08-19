<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPMEntryReportView.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.EventEntry.Reports.frmPMEntryReportView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Entry Report View</title>
    <link href="../../../css/allocationCenterStylesheet.css" rel="stylesheet" />
</head>
<body>
   <form id="form5" runat="server">
 <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title"> Data Entry Report</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                   
                             
                                                       <table  style="width:80%;height:60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea;  box-shadow: 3px 3px 5px #e0e0e0;"">

                               <tr>
                                   <td>
                                       Ground Name :   <asp:DropDownList ID="drpCenter" runat="server" Height="39px"  Width="308px"></asp:DropDownList>
                                       </td>
                                    <td>


                                        Day/Batch</td>

                                     <td>


                                        <asp:DropDownList ID="drpday" runat="server" Height="23px"   Width="148px" OnSelectedIndexChanged="drpday_SelectedIndexChanged"></asp:DropDownList>


                                    </td>

                                    </tr>

                               <tr>
                                   <td>


                                        Event Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="drpEventType" runat="server" Height="28px"   Width="192px" OnSelectedIndexChanged="drpEventType_SelectedIndexChanged" AutoPostBack="True" >
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


                                         Status</td>
                                    <td>
                                        <asp:DropDownList ID="drpStatus" runat="server" Height="38px"  Width="189px" AutoPostBack="True" OnSelectedIndexChanged="drpStatus_SelectedIndexChanged" >
                                            <asp:ListItem Value="A">All</asp:ListItem>
                                            <asp:ListItem Value="q">Qualified</asp:ListItem>
                                            <asp:ListItem Value="nq">Not Qualilfied</asp:ListItem>                                            
                                        </asp:DropDownList>

                                        &nbsp;</td>

                                     <td>


                                         &nbsp;</td>

                                    </tr>

                               <tr>
                                   <td>


                                    <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" Height="40px" Width="86px" />


                                    </td>

                                     <td>


                                         &nbsp;</td>
                                    <td>


                                        &nbsp;</td>

                                     <td>


                                         &nbsp;</td>

                                    </tr>

                                <tr><td colspan="3">

                                    <table style="width :100% ; height: 10%; border: 1px solid black;" runat="server" id="trvenue" visible="false"> 


                                        <tr><td colspan="2" align="center"><h4> Recruitment of Constable in 9th SIRB -2016 - 17 </h4></td></tr> 


                                        <tr><td>Event Sheet: -
                                            <asp:Label ID="lblEvenType" runat="server" Text=""></asp:Label>
                                            </td> <td> Category  
                                            <asp:Label ID="lblCategory" runat="server"  ></asp:Label>

                                                                                         </td></tr>



                                        <tr><td  colspan="2" > Venue :&nbsp;      <asp:Label ID="lblVenue" runat="server"  ></asp:Label> </td> <td   >      &nbsp;</td></tr>


                                        <tr><td  colspan="2" > Date&nbsp;      <asp:Label ID="lblDate" runat="server"  ></asp:Label>  </td> <td   >      &nbsp;</td></tr>


                                        </table>
                                    </td></tr>

                               <tr>
                                   <td colspan="3">
                                          &nbsp;</td>

                                    </tr>

                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:GridView ID="grdPMReport" runat="server" Width="100%">
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
