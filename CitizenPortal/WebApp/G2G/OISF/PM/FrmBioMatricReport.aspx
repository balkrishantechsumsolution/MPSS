<%@ Page Language="C#" AutoEventWireup="true"   CodeBehind="FrmBioMatricReport.aspx.cs" Inherits="FrmBioMatricReport" %>
 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>  Event Sheet</title>
 <link href="../css/allocationCenterStylesheet.css" rel="stylesheet" />

     <style>
        @media print
        {
            input
            {
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
                        <h4 class="box-title"> Event Sheet</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
 


                
                             
                             
                            <table  style="width: 80%; height: 60%; background-color: #f9f9f9; padding: 10px;  border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea; box-shadow: 3px 3px 5px #e0e0e0;">
                                
                                <tr>
                                   <td>
                                      Ground Name :   <asp:DropDownList ID="drpCenter" runat="server" Height="40px"  Width="406px"></asp:DropDownList>
                                       </td>
                                    <td>


                                        Batch/Day</td>

                                     <td>


                                        <asp:DropDownList ID="drpday" runat="server" Height="23px"   Width="148px" OnSelectedIndexChanged="drpday_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>


                                    </td>

                                    </tr>

                                <tr>
                                   <td>
                                        Event :-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:DropDownList ID="drpEvent" runat="server" Height="39px"  Width="308px">
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
                                      
                                        
                                        Rollnumber Range </td>
   <td>
                                        &nbsp;<asp:DropDownList ID="drpRange" runat="server" Height="38px"  Width="189px" AutoPostBack="True" OnSelectedIndexChanged="drpRange_SelectedIndexChanged" >
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1">Between 1-125</asp:ListItem>
                                            <asp:ListItem Value="2">Between 126-250</asp:ListItem>
                                            <asp:ListItem Value="3">Between 251-375</asp:ListItem>
                                            <asp:ListItem Value="4">Between 376-500</asp:ListItem>
                                                <%--<asp:ListItem Value="5">Between 401-500</asp:ListItem>--%>
                                        </asp:DropDownList>
                                       </td>

                                    </tr>

                                <tr>
                                   <td>
                                        &nbsp;</td>
                                    <td>


                                    <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" Height="36px" Width="115px" />

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
                                        <asp:GridView ID="grdBioMatrix" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false" >
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>

                                                       <table border="1" style="width:100%;font-size: 14px;">
                                                      
                                                            <tr>
                                                                <td>  Sr No . : 
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Roll Number : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td> Bio Matrix </td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 70px; height: 100px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>

                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                  
                                                                     <font size="1" color="black" >
                                                                     
                                                                     Present</font>  </td>
                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                <td style="vertical-align:bottom;text-align:center;">      <font size="1" color="black" >Absent</font></td>
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>



                                       <asp:GridView ID="grdPM" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                        <table border="1" style="width:100%;height:10%; font-size: 13px;">
                                                      
                                                            <tr>
                                                                <td>  RollNo  
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td> Physical Measurement in cm</td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 80px; height: 80px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>

                                                                 <td rowspan="3"  >
                                                                   
                                                                  <table  border="1" style="width:100%;height:100%">
                                                                      <tr><td>Height</td>
                                                                          <td>Weight</td>
                                                                          <td  >Chest<br />(Un Exp.)</td>
                                                                            <td  >Chest<br />(Exp.)</td>
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
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                 
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>



                                       <asp:GridView ID="grdMedicalFitness" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                        <table border="1" style="width:100%;font-size: 13px;">
                                                      
                                                            <tr>
                                                                <td>  RollNumber : 
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td> Fitness</td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 70px; height: 100px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>

                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                  
                                                                     Fit</td>
                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                <td style="vertical-align:bottom;text-align:center;">      Unfit</td>
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>




                                           <asp:GridView ID="grdHighJump" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                      <table border="1" style="width:100%;height:10%; font-size: 13px;">
                                                      
                                                            <tr>
                                                                <td>  RollNo  
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td rowspan="4"> 




                                                                       <table  border="1" style="width:100%;height:100%">

                                                                           <tr><td>1.22 mtr.</td><td>1.38 mtr.</td><td>1.50 mtr.</td></tr>
                                                                           <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">1st Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">1st Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">1st Chance</font></td>
                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">2nd  Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">2nd Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">2nd Chance</font></td>
                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">3rd  Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">3rd Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">3rd Chance</font></td>
                                                                           </tr>
                                                                           <tr><td colspan="3" style="vertical-align:bottom;text-align:center;"><font size="1" color="black">Not Able to clear</font></td></tr>
                                                                           </table>
                                                                 </td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 80px; height: 80px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                 
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>

                                       
    <asp:GridView ID="grdBroadJumping" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                                                        
                                                      <table border="1" style="width:100%;height:10%; font-size: 13px;">
                                                      
                                                            <tr>
                                                                <td>  RollNo  
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td rowspan="4"> 

                                                                     
                                                                     
                                                                      <table  border="1" style="width:100%;height:100%">

                                                                           <tr><td>3.66 mtr.</td><td>4.0 mtr.</td><td>4.35 mtr.</td><td>4.50 mtr.</td></tr>
                                                                           <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">1st Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">1st Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">1st Chance</font></td>
                                                                   <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">1st Chance</font></td>
                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">2nd  Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">2nd Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">2nd Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">2nd Chance</font></td>

                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">3rd  Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">3rd Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">3rd Chance</font></td>
                                                                               <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">3rd Chance</font></td>

                                                                           </tr>
                                                                           <tr><td colspan="4" style="vertical-align:bottom;text-align:center;"><font size="1" color="black">Disqualified(Not Clear 3.66 Mtrs)</font></td></tr>
                                                                           </table>  
                                                       
                                                                     

                                                                 </td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 80px; height: 80px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                 
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>


<asp:GridView ID="grdRopeclimbing" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                                                        
                                                      <table border="1" style="width:100%;height:10%; font-size: 13px;">
                                                      
                                                            <tr>
                                                                <td>  RollNo  
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td rowspan="4"> 

                                                                     
                                                               <table  border="1" style="width:100%;height:100%">

                                                                           <tr><td>Rope Climbing</td></tr>
                                                                           <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">1st Chance</font></td>
                                                                          
                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">2nd  Chance</font></td>
                                                                           
                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">3rd  Chance</font></td>
                                                                        
                                                                           </tr>
                                                                           <tr><td colspan="3" style="vertical-align:bottom;text-align:center;"><font size="1" color="black">Disqualified </font></td></tr>
                                                                           </table>
                                                       
                                                                     

                                                                 </td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 80px; height: 80px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                 
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>



                                       <asp:GridView ID="grdRunnings" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                                                        
                                                      <table border="1" style="width:100%;height:10%; font-size: 13px;">
                                                      
                                                            <tr>
                                                                <td>  RollNo  
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td rowspan="4"> 

                                                                     
                                                         <table  border="1" style="width:100%;height:100%">

                                                                           <tr><td>Cover 1.6 Mtrs</td></tr>
                                                                           <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">5 Mins</font></td>
                                                                          
                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">5.30 Mins</font></td>
                                                                           
                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">6 Mins</font></td>
                                                                        
                                                                           </tr>
                                      <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">6.30 Mins</font></td>
                                                                        
                                                                           </tr>
                                                                           <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">Disqualified </font></td></tr>
                                                                           </table>
                                                       
                                                                     

                                                                 </td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 80px; height: 80px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                 
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>


                                        <asp:GridView ID="grdSwimming" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                                                        
                                                      <table border="1" style="width:100%;height:10%; font-size: 13px;">
                                                      
                                                            <tr>
                                                                <td>  RollNo  
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td rowspan="4"> 

                                                                     
                                                         <table  border="1" style="width:100%;height:100%">

                                                                           <tr><td>Qualified Length 40 mtrs in 8 Mins </td></tr>
                                                                        
                                                                         
                                      <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">Qualified</font></td>
                                                                        
                                                                           </tr>
                                                                           <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">Disqualified </font></td></tr>
                                                                           </table>
                                                       
                                                                     

                                                                 </td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 80px; height: 80px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                 
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>
                                        


                                        <asp:GridView ID="grdcrossCountry" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                                                        
                                                      <table border="1" style="width:100%;height:10%; font-size: 13px;">
                                                      
                                                            <tr>
                                                                <td>  RollNo  
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td rowspan="4"> 

                                                                     
                                                         <table  border="1" style="width:100%;height:100%">

                                                                           <tr><td colspan="2">Covered 5.0 KM</td></tr>
                                                                           <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">20 Mins</font></td>
                                                                          <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">21 Mins</font></td>
                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">22 Mins</font></td>
                                                                           <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">23 Mins</font></td>
                                                                           </tr>
                                                                            <tr><td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">24 Mins</font></td>
                                                                        <td style="vertical-align:bottom;text-align:center;"><font size="1" color="black">25 Mins</font></td>
                                                                           
                                                                           <tr><td colspan="2" style="vertical-align:bottom;text-align:center;"><font size="1" color="black">Disqualified </font></td></tr>
                                                                           </table>
                                                       
                                                                     

                                                                 </td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 80px; height: 80px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                 
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>



                                        <asp:GridView ID="grdDriving" runat="server" Width="100%" ShowHeader="False" OnRowDataBound="grdReport_RowDataBound" AutoGenerateColumns="false">
                                            <Columns>

                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        
                                                                                        
                                                      <table border="1" style="width:100%;height:10%; font-size: 13px;">
                                                      
                                                            <tr>
                                                                <td>  RollNo  
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td rowspan="4"> 

                                                                     
                                                         <table  border="1" style="width:100%;height:100%">

                                                                           <tr><td>Driving</td></tr>
                                                                           <tr><td style="vertical-align:bottom;text-align:center;" rowspan="2">

                                                                                    <asp:Label ID="lblDLValue" runat="server" Text='<%# Eval("DLValue").ToString() %>'></asp:Label>


                                                                               </td>
                                                                          
                                                                           </tr>
                                                                         
                                                                           
                                                                            
                                                                           </table>
                                                       
                                                                     

                                                                 </td>
                                                               
                                                                 <td rowspan="3" style="vertical-align:bottom;text-align:center;">
                                                             <font size="1" color="black"> Signature of Candidate </font> 
 </td>
                                                                 </td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 80px; height: 80px" id="ProfilePhoto" />
                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                             
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">
 <img runat="server" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" style="margin: 1px; width: 156px; height: 30px" id="Img1" />

                                                                </td>
                                                                 
                                                                 <td rowspan="2" style="vertical-align:bottom;text-align:center;">
                                                                    
                                                                    <font size="1" color="black">Sign. of Examiner</font> </td>
                                                                </tr>
                                                           <tr><td colspan="3" style="border:1px ;solid :black;">Remarks</td></tr>
                                                         
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>
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
