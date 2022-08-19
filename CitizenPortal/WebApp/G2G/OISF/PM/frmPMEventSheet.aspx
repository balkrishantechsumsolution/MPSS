<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPMEventSheet.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.frmPMEventSheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Physical Measurement Event Sheet</title>
    <link href="../css/allocationCenterStylesheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style3 {
            height: 105%;
        }
    </style>
</head>
<body>
  <form id="form1" runat="server">
 <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title"> Physical Measurement Event Sheet</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        
                            
                                                       
                              
                            <table class="defaultholdTbl">
                                
                                <tr>
                                   <td>
                                        <asp:DropDownList ID="drpCenter" runat="server" Height="39px"  Width="308px"></asp:DropDownList>
                                       </td>
                                    <td>


                                        Day/Batch</td>

                                     <td>


                                        <asp:DropDownList ID="drpday" runat="server" AutoPostBack="True" Height="23px"   Width="148px" OnSelectedIndexChanged="drpday_SelectedIndexChanged"></asp:DropDownList>


                                    </td>

                                    </tr>

                                <tr  >
                                   <td colspan="3" >
                                        <asp:GridView ID="grdReport" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                       <table class="cndteRw">
                                                      
                                                            <tr>
                                                                <td class="Rwhd">  RollNo  
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td class="Rwhd">   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td class="Rwhd"> Physical Measurement in cm</td>
                                                               
                                                                 <td class="cndteDtlbox" rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" class="cndteDtlbox" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 80px; height: 80px" id="ProfilePhoto" />
                                                                </td>

                                                                <td class="cndteFthNme">SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>

                                                                 <td rowspan="3"  >
                                                                   
                                                                  <table class="phsclmsmnt">
                                                                      <tr><td class="phsclmsmnt_th">Height</td>
                                                                          <td class="phsclmsmnt_th">Weight</td>
                                                                          <td class="phsclmsmnt_th" >Chest(Exp.)</td>
                                                                            <td class="phsclmsmnt_th">Chest(Un Exp.)</td>
                                                                      </tr>

                                                                      
                                                                       <tr style="height:100%"> <td   rowspan="2" style="vertical-align:bottom;text-align:left;" >| </td>
                                                                         <td   rowspan="2" style="vertical-align:bottom;text-align:left;" >| </td>
                                                                          <td   rowspan="2" style="vertical-align:bottom;text-align:left;" >| </td>
                                                                             <td   rowspan="2" style="vertical-align:bottom;text-align:left;"  >| </td>
                                                                      </tr>

                                                                       </table>   
                                                                     

                                                                 </td>
                                                                 

                                                            </tr>


                                                            <tr>
                                                                <td class="cndteDOB">DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1" class="cndteDtlbox">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                 
                                                                 <td class="cndteDtlbox" rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td class="cndteDtlbox" colspan="3">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>
                                       </td>

                                    </tr>
                                <tr><td>

                                    <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" />

                                    </td></tr>

                                </table>
                              

                                                            </div>
                    </div>

                </div>
            </div>
  </div>
    </form>
</body>
</html>
