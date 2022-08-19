<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCenterAllocatedReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.CenterAllocation.frmCenterAllocatedReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Center Allocation Report</title>
    <link href="../css/allocationCenterStylesheet.css" rel="stylesheet" />
</head>
<body>
     <form id="form2" runat="server">
 <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title"> Ground Allocation Report(Assign Date to Candidate)</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">


                            <table class="defaultholdTbl">
                                <tr>
                                    <td> Ground Name</td>

                                    <td>
                                        <asp:DropDownList ID="drpCenter" runat="server" Height="39px"  Width="308px"></asp:DropDownList>
                                       </td>
                                    <td>


                                        Day/Batch</td>

                                    <td>


                                        <asp:DropDownList ID="drpday" runat="server" AutoPostBack="True" Height="23px"   Width="148px"></asp:DropDownList>


                                    </td>
                                    </tr>
                                <tr>
                                    <td>&nbsp;</td>

                                    <td>
                                        <asp:Button ID="btnSeacrh" runat="server" Text="Search" Width="165px" OnClick="btnSeacrh_Click" />
                                       </td>
                                    <td>


                                        &nbsp;</td>

                                    <td>


                                        &nbsp;</td>
                                    </tr>
                                <tr id="Assign" runat="Server" visible="false">
                                    <td>Assign Date</td>

                                    <td>
                                        <asp:TextBox ID="txtAssignDate" runat="server"></asp:TextBox>
                                       </td>
                                    <td>


                                        <asp:Button ID="btnAssign" runat="server" Text="AssignDate" Width="165px" OnClick="btnAssign_Click"  />
                                       </td>

                                    <td>


                                     </td>
                                    </tr>
                                   <tr>
                                    <td colspan="4"> 
                                        <asp:GridView ID="grdCenter" runat="server"></asp:GridView>

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
