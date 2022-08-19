<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmCenterAllocation.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.CenterAllocation.frmCenterAllocation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Allocate Center</title>
    <link href="../css/allocationCenterStylesheet.css" rel="stylesheet" />
</head>
<body>
    <form id="form2" runat="server">
 <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title"> Allocate Center</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">


                            <table style="width: 100%; background-color: #f9f9f9; padding: 10px; height: 60%; border-top-left-radius: 2px;
    border-top-right-radius: 2px;border-top: 8px solid #8bbbea; box-shadow: 3px 3px 5px #e0e0e0;">
                                <tr id="before" runat="Server" visible="false">
                                    <td><h4 class="box-title">Before Center Allocation Capacity 
                        </h4>
                                          <asp:Button ID="btnAllocate" runat="server" Text="Allocate Center" OnClick="btnAllocate_Click" Width="244px" />
                                        <br />
                                        <br />
                                          <asp:GridView ID="grdCandidatesDtls" runat="server"></asp:GridView>
                                      
                                    </td>

                                    <td>
                                       
                                        <asp:GridView ID="grdbeforeallocate" runat="server"></asp:GridView>


                                    </td>
                                    </tr>
                                   <tr id="after" runat="server" visible="false">
                                    <td> <h4 class="box-title">Allocation Details<br />
                                        Day/Batch :-  


                                        <asp:DropDownList ID="drpday" runat="server" AutoPostBack="True" Height="23px" OnSelectedIndexChanged="drpCenter_SelectedIndexChanged" Width="148px"></asp:DropDownList>


                                        </h4>
                                        
                                        <asp:GridView ID="grdafterallocateCapacity" runat="server"></asp:GridView>


                                       </td>
                                       <td>
                                        
                                        <asp:GridView ID="grdafterallocate" runat="server"></asp:GridView>


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
