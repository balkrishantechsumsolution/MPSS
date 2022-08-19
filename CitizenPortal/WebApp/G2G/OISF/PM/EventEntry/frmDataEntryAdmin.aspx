<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmDataEntryAdmin.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.EventEntry.frmDataEntryAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title"> Physical Measurement Entry Form</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                 
                              
                                                    
                         
                                   
                             
                            <table  style="width:80%;height:60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea;  box-shadow: 3px 3px 5px #e0e0e0;"">
                               <tr>
                                   <td>
                                       Ground Name : </td><td>  <asp:DropDownList ID="drpCenter" runat="server" Height="31px"  Width="254px"></asp:DropDownList>
                                       </td>
                                    <td>


                                        Batch/Day</td>

                                     <td>


                                        <asp:DropDownList ID="drpday" runat="server" Height="23px"   Width="148px" OnSelectedIndexChanged="drpday_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>


                                    </td>

                                    </tr>

                               <tr>
                                   <td>
                                        Rollnumber
                                        Range :-</td><td>
                                        <asp:DropDownList ID="drpRange" runat="server" Height="38px"  Width="189px" >
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                            <asp:ListItem Value="1">Between 1-125</asp:ListItem>
                                            <asp:ListItem Value="2">Between 126-250</asp:ListItem>
                                            <asp:ListItem Value="3">Between 251-375</asp:ListItem>
                                            <asp:ListItem Value="4">Between 376-500</asp:ListItem>
                                            
                                        </asp:DropDownList>
                                       </td>
                                    <td>


                                        Event Type</td>

                                     <td>


                                        <asp:DropDownList ID="drpEventType" runat="server" Height="28px"   Width="192px" OnSelectedIndexChanged="drpEventType_SelectedIndexChanged" AutoPostBack="True" >
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

                                    </tr>

                                <tr><td colspan="4">

                                    <table style="width :100% ; height: 10%; border: 1px solid black;" runat="server" id="trvenue" visible="false"> 


                                        <tr><td colspan="2" align="center"><h4> Recruitment of Constable in 9th SIRB -2016 - 17 </h4></td></tr> 


                                        <tr><td>Event Sheet: -<asp:Label ID="lblEventTypeValue" runat="server" Text=""></asp:Label>
                                            </td> <td> Category  
                                            <asp:Label ID="lblCategory" runat="server"  ></asp:Label>

                                                                                         </td></tr>



                                        <tr><td  colspan="2" > Venue :&nbsp;      <asp:Label ID="lblVenue" runat="server"  ></asp:Label> </td> <td   >      &nbsp;</td></tr>


                                        <tr><td  colspan="2" > Date&nbsp;      <asp:Label ID="lblDate" runat="server"  ></asp:Label>  </td> <td   >      &nbsp;</td></tr>


                                        <tr><td  colspan="2"> Search (Roll Number/Sr.No.)  <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                                             <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" /> </td>
                                          
                                        </tr>

                                    </table>
                                    </td></tr>

                               <tr>
                                   <td colspan="4">
                                          <asp:GridView ID="grdReport" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowCommand="grdReport_RowCommand"
                                               OnPageIndexChanging="grdReport_PageIndexChanging" OnRowDataBound="grdReport_RowDataBound"
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>

                                                      <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                <td>
                                                                    
                                                                    
                                                                     Sr No. :  <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                    
                                                                    
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td colspan="4"> Physical Measurement </td>
                                                        
                                                            

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                             
                                             RollNumber :
                                                                    <asp:HiddenField ID="hdnAppNo" runat="server" Value='<%# Eval("AppNumber").ToString() %>' />
                                                                      <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>

                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>

                                                                 <td    >
                                                                  
                                                                    
                                                                     
                                                                     Height (in cm) </td>

                                                                
                                                                 <td    >
                                                                  
                                                                    
                                                                     
                                                                     Weight (in kg) </td>

                                                                      
                                                                 <td    >
                                                                  
                                                                    
                                                                  Chest Un Exp. (in cm)   
                                                                     
                                                                       </td>
                                                                <td>Chest  
                                                                  
                                                                    
                                                                     Exp.(in cm)</td>

                                                                <td rowspan="4">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow1"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                              <br /> <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label> 
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                                  <td    >
                                                                  
                                                                    
                                                                     
                                                                    <asp:TextBox ID="txtHeight" runat="server" MaxLength="6" Text='<%# Eval("Height").ToString() %>'></asp:TextBox>
                                                               

                                                                    
                                                                     
                                                                       </td>

                                                                
                                                                 <td    >
                                                                  
                                                                    
                                                                     
                                                                    <asp:TextBox ID="txtWeight" runat="server" MaxLength="6"  Text='<%# Eval("Weight").ToString() %>'></asp:TextBox>
                                                                     
                                                                    
                                                                     
                                                                     </td>
                                                                 <td    >
                                                                  
                                                                    
                                                                 
                                                                     <asp:TextBox ID="txtChestUnExp" runat="server" MaxLength="6" Text='<%# Eval("ChestUnExpanded").ToString() %>'></asp:TextBox>
                                                                     
                                                                       </td>

                                                                
                                                                 <td    >
                                                                  
                                                                        <asp:TextBox ID="txtChestExp" runat="server" MaxLength="6" Text='<%# Eval("ChestExpanded").ToString() %>'></asp:TextBox>
                                                                    
                                                                    </td>

                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                                                                    <td    >
                                                                  
                                                                        Remarks</td>

                                                                
                                                                 <td colspan="3"    >
                                                                  
                                                                     <asp:TextBox ID="txtRemarks" runat="server" Height="21px" Width="363px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox>
                                                                     
                                                                     </td>
                                                            
                    
                                                                
                                                                </tr>
                                                        

                                                        </table>
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>






                                              <asp:GridView ID="grdBioMetric" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowCommand="grdBioMetric_RowCommand" OnRowDataBound="grdBioMetric_RowDataBound" OnPageIndexChanging="grdBioMetric_PageIndexChanging" 
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>

                                                   <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                  <td> 
                                                                      Sr No. :  <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label> 
                                                                  
                                                             
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td colspan="2"> Bio-Metrix</td>
                                                        
                                                            

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                              
                                                  
                                                                     RollNumber :
                                                                    <asp:HiddenField ID="hdnAppNo" runat="server" Value='<%# Eval("AppNumber").ToString() %>' />
                                                                    
                                                                     
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>

                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>



                                                                
                                                                </td>
<td rowspan="2">
    <asp:DropDownList ID="drpBioMetrix" runat="server" Height="29px" Width="120px" >
          <asp:ListItem Value="A">Absent</asp:ListItem>
            <asp:ListItem Value="P">Present</asp:ListItem>
                                          

    </asp:DropDownList>
                                                                </td>

                                                                <td rowspan="4">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                      <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label> 
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>

                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                    
                                                                <td>Remarks <asp:TextBox ID="txtRemarks" runat="server" Height="28px" Width="157px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox></td>
                                                                </tr>
                                                        

                                                        </table>
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>




                                         <asp:GridView ID="grdMedical" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowCommand="grdMedical_RowCommand" OnRowDataBound="grdMedical_RowDataBound" OnPageIndexChanging="grdMedical_PageIndexChanging" 
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>

                                                       <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                      <td>
                                                                    
                                                                    
                                                                       Sr No :-  <asp:Label ID="Label1" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td colspan="2"> Medical Fitness</td>
                                                        
                                                            

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                    RollNumber :
                                                                    <asp:HiddenField ID="hdnAppNo" runat="server" Value='<%# Eval("AppNumber").ToString() %>' />
                                                                    
                                                                     
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                           

                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>
<td rowspan="2">
    <asp:DropDownList ID="drpFitness" runat="server" Height="29px" Width="120px">
         <asp:ListItem Value="F">Fit</asp:ListItem>
                                            <asp:ListItem Value="UF">Un Fit</asp:ListItem>

    </asp:DropDownList>
                                                                </td>

                                                                <td rowspan="4">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                      <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label> 
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>

                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                    <td>Remarks<asp:TextBox ID="txtRemarks" runat="server" Height="22px" Width="166px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox> </td>
                                                                
                                                                </tr>
                                                        

                                                        </table>
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>




                                              <asp:GridView ID="grdHighJump" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowDataBound="grdHighJump_RowDataBound" OnRowCommand="grdHighJump_RowCommand" OnPageIndexChanging="grdHighJump_PageIndexChanging"
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>

                                                     <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                 <td> 
                                                                    
                                                                    
                                                                     Sr No :-  <asp:Label ID="Label1" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                    
                                                                    
                                                      
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                                 <td  > 1.22 Mtr.</td>
                                                        
                                                            <td  > 1.38 Mtr.</td>

                                                                <td  > 1.50 Mtr.</td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                            RollNumber :
                                                                    <asp:HiddenField ID="hdnAppNo" runat="server" Value='<%# Eval("AppNumber").ToString() %>' />
                                                                    
                                                                     
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                           

                                                                </td>


                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>
<td >
   
                                                                <asp:DropDownList ID="drpHighjump1" runat="server">
                                                                    <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1st">1st Chance</asp:ListItem>
                                                                    <asp:ListItem Value="2nd">2nd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="3rd">3rd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="NC">Not Able to Clear</asp:ListItem>
                                                                </asp:DropDownList>

</td>


                                                                <td >
   
                                                                <asp:DropDownList ID="drpHighjump2" runat="server"> 
                                                                      <asp:ListItem Value="0">Select</asp:ListItem>
                                                                     <asp:ListItem Value="1st">1st Chance</asp:ListItem>
                                                                    <asp:ListItem Value="2nd">2nd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="3rd">3rd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="NC">Not Able to Clear</asp:ListItem></asp:DropDownList>
</td>

                                                                                                                              <td >
   
                                                                <asp:DropDownList ID="drpHighjump3" runat="server">
                                                                      <asp:ListItem Value="0">Select</asp:ListItem>
                                                                      <asp:ListItem Value="1st">1st Chance</asp:ListItem>
                                                                    <asp:ListItem Value="2nd">2nd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="3rd">3rd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="NC">Not Able to Clear</asp:ListItem></asp:DropDownList>
</td>


                                                                 

                                                                <td rowspan="3">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                      <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label> 
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                                 <td colspan="3">Remarks<asp:TextBox ID="txtRemarks" runat="server" Height="34px" Width="374px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox> </td>
                                                                
                           
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                                                       </tr>
                                                        

                                                        </table>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>




                                       <asp:GridView ID="grdBroadJump" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowDataBound="grdBroadJump_RowDataBound" OnRowCommand="grdBroadJump_RowCommand" OnPageIndexChanging="grdBroadJump_PageIndexChanging"
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                          <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                <td>  
                                                                    
                                                                    Sr No :-  <asp:Label ID="Label1" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                    
                                                                   
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                              <td>3.66 mtr.</td><td>4.0 mtr.</td><td>4.35 mtr.</td><td>4.50 mtr.</td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                               RollNumber :
                                                                    <asp:HiddenField ID="hdnAppNo" runat="server" Value='<%# Eval("AppNumber").ToString() %>' />
                                                                    
                                                                     
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                           

                                                                </td>


                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>
<td >
   
                                                                <asp:DropDownList ID="drpBroadjump1" runat="server">
                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1st">1st Chance</asp:ListItem>
                                                                    <asp:ListItem Value="2nd">2nd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="3rd">3rd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="NC">Not Able to Clear</asp:ListItem>
                                                                </asp:DropDownList>

</td>


                                                                <td >
   
                                                                <asp:DropDownList ID="drpBroadjump2" runat="server"> 
                                                                          <asp:ListItem Value="0">Select</asp:ListItem>
                                                                     <asp:ListItem Value="1st">1st Chance</asp:ListItem>
                                                                    <asp:ListItem Value="2nd">2nd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="3rd">3rd Chance</asp:ListItem>
                                                                  </asp:DropDownList>
</td>

                                                                                                                              <td >
   
                                                                <asp:DropDownList ID="drpBroadjump3" runat="server">  
                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1st">1st Chance</asp:ListItem>
                                                                    <asp:ListItem Value="2nd">2nd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="3rd">3rd Chance</asp:ListItem>
                                                                      </asp:DropDownList>
                                                                   
</td>
                                                                <td>
                                                                    <asp:DropDownList ID="drpBroadJump4" runat="server">  
                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1st">1st Chance</asp:ListItem>
                                                                    <asp:ListItem Value="2nd">2nd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="3rd">3rd Chance</asp:ListItem>
                                                                      </asp:DropDownList>
                                                                </td>


                                                                 

                                                                <td rowspan="3">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                      <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label> 
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                                 <td colspan="4" rowspan="2">Remarks<asp:TextBox ID="txtRemarks" runat="server" Height="34px" Width="374px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox> </td>
                                                                
                           
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                                                       </tr>
                                                        

                                                        </table>  
                                                    
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>





                                       <asp:GridView ID="grdRopeClimbing" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowDataBound="grdRopeClimbing_RowDataBound" OnRowCommand="grdRopeClimbing_RowCommand" OnPageIndexChanging="grdRopeClimbing_PageIndexChanging"
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                         
                                                      <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                 <td>  
                                                                    
                                                                     Sr No :-  <asp:Label ID="Label1" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                    
                                                                  
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                              <td>Rope Climbing</td><td>&nbsp;</td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                RollNumber :
                                                                    <asp:HiddenField ID="hdnAppNo" runat="server" Value='<%# Eval("AppNumber").ToString() %>' />
                                                                    
                                                                     
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                           

                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>
<td >
   
                                                                <asp:DropDownList ID="drpRopeClimbing" runat="server">
                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="1st">1st Chance</asp:ListItem>
                                                                    <asp:ListItem Value="2nd">2nd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="3rd">3rd Chance</asp:ListItem>
                                                                    <asp:ListItem Value="DQ">Disqualified</asp:ListItem>
                                                                </asp:DropDownList>

</td>


                                                             

                                                                 

                                                                <td rowspan="3">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                      <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label> 
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                                 <td colspan="2" rowspan="2">Remarks<asp:TextBox ID="txtRemarks" runat="server" Height="44px" Width="100px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox> </td>
                                                                
                           
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                                                       </tr>
                                                        

                                                        </table>  
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>




                                          <asp:GridView ID="grdRunning" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowDataBound="grdRunning_RowDataBound" OnRowCommand="grdRunning_RowCommand" OnPageIndexChanging="grdRunning_PageIndexChanging"
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                         
                                                      <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                 <td> 
                                                                    
                                                                     Sr No :-  <asp:Label ID="Label1" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                    
                                                                    
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                              <td>Running</td><td>&nbsp;</td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                                 RollNumber :
                                                                    <asp:HiddenField ID="hdnAppNo" runat="server" Value='<%# Eval("AppNumber").ToString() %>' />
                                                                    
                                                                     
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                           

                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>
<td >
   
                                                                <asp:DropDownList ID="drpRunning" runat="server">
                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="5">5 Min.</asp:ListItem>
                                                                    <asp:ListItem Value="5.30">5.30 Min.</asp:ListItem>
                                                                    <asp:ListItem Value="6">6 Min.</asp:ListItem>
                                                                    <asp:ListItem Value="6.30">6.30 Min.</asp:ListItem>
                                                                    <asp:ListItem Value="Beyond 6.30">Beyond 6.30 Min.</asp:ListItem>
                                                                  
                                                                </asp:DropDownList>

</td>


                                                             

                                                                 

                                                                <td rowspan="3">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                      <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label> 
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                                 <td colspan="2" rowspan="2">Remarks<asp:TextBox ID="txtRemarks" runat="server" Height="44px" Width="150px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox> </td>
                                                                
                           
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                                                       </tr>
                                                        

                                                        </table>  
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>


                                       

                                          <asp:GridView ID="grdCrossCountry" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowDataBound="grdCrossCountry_RowDataBound" OnRowCommand="grdCrossCountry_RowCommand" OnPageIndexChanging="grdCrossCountry_PageIndexChanging"
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                         
                                                      <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                <td>
                                                                     Sr No :-  <asp:Label ID="Label1" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                      
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                              <td>Cross Country(5 km.)</td><td>&nbsp;</td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                            RollNumber :
                                                                    <asp:HiddenField ID="hdnAppNo" runat="server" Value='<%# Eval("AppNumber").ToString() %>' />
                                                                    
                                                                     
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                           

                                                                </td>
                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>
<td >
   
                                                                <asp:DropDownList ID="drpCrossCountry" runat="server">
                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="20">20 Min.</asp:ListItem>
                                                                    <asp:ListItem Value="21">21 Min.</asp:ListItem>
                                                                    <asp:ListItem Value="22">22 Min.</asp:ListItem>
                                                                    <asp:ListItem Value="23">23 Min.</asp:ListItem>
                                                                      <asp:ListItem Value="24">24 Min.</asp:ListItem>
                                                                      <asp:ListItem Value="25">25 Min.</asp:ListItem>
                                                                    <asp:ListItem Value="Beyond 25">Beyond 25 Min.</asp:ListItem>
                                                                  
                                                                </asp:DropDownList>

</td>


                                                             

                                                                 

                                                                <td rowspan="3">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                      <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label> 
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                                 <td colspan="2" rowspan="2">Remarks<asp:TextBox ID="txtRemarks" runat="server" Height="44px" Width="140px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox> </td>
                                                                
                           
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                                                       </tr>
                                                        

                                                        </table>  
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>


                                       <asp:GridView ID="grdSwimming" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowDataBound="grdSwimming_RowDataBound" OnRowCommand="grdSwimming_RowCommand" OnPageIndexChanging="grdSwimming_PageIndexChanging"
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                         
                                                      <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                 <td>
                                                                    
                                                                    
                                                                     Sr No :-  <asp:Label ID="Label1" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                    
                                                               
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                              <td>Swimming(40 mtr.)</td><td>&nbsp;</td>

                                                                
                                                            </tr>

                                                       

                                                            <tr>
                                                                <td rowspan="4" >
                                                                <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                           

                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>
<td >
   
                                                                <asp:DropDownList ID="drpSwimming" runat="server">
                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="8">8 Min.</asp:ListItem>
                                                                
                                                                    <asp:ListItem Value="Beyond 8">Beyond 8 Min.</asp:ListItem>
                                                                  
                                                                </asp:DropDownList>

</td>


                                                             

                                                                 

                                                                <td rowspan="3">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                      <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label> 
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                                 <td colspan="2" rowspan="2">Remarks<asp:TextBox ID="txtRemarks" runat="server" Height="44px" Width="140px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox> </td>
                                                                
                           
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                                                       </tr>
                                                        

                                                        </table>  
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>



                                             <asp:GridView ID="grdDriving" runat="server" Width="100%" pagesize="5"
                                              ShowHeader="False" AllowPaging="True"   AutoGenerateColumns="false" OnRowDataBound="grdDriving_RowDataBound" OnRowCommand="grdDriving_RowCommand" OnPageIndexChanging="grdDriving_PageIndexChanging"
                                             >
                                              <PagerStyle  HorizontalAlign="center" />
                                              <PagerSettings  Mode="NextPreviousFirstLast" PageButtonCount="4" PreviousPageText="Previous" 
                                                  NextPageText="Next" FirstPageText="First" LastPageText="Last"  
                                                NextPageImageUrl="~/WebApp/G2G/OISF/PM/Images/next.png"  
                                                  FirstPageImageUrl="~/WebApp/G2G/OISF/PM/Images/first.png" 
                                                  PreviousPageImageUrl="~/WebApp/G2G/OISF/PM/Images/previous.png" 
                                                  LastPageImageUrl="~/WebApp/G2G/OISF/PM/Images/last.png"  />
                                            <Columns>
                                                
                                     
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                         
                                                      <table border="1" style="width:100%;">
                                                      
                                                            <tr>
                                                                <td> 
                                                                    
                                                                     Sr No :-  <asp:Label ID="Label1" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                                    
                                                                     
</td>
                                                              
                                             

                                                                 <td>   Name : 
                                                                <asp:Label ID="lblFullName" runat="server" Text='<%# Eval("FullName").ToString() %>'></asp:Label>
 </td>
                                                             
                                                              <td>Driving</td><td>&nbsp;</td>

                                                                
                                                            </tr>

                                                            <tr>
                                                                <td rowspan="4" >
                                                               RollNumber :
                                                                    <asp:HiddenField ID="hdnAppNo" runat="server" Value='<%# Eval("AppNumber").ToString() %>' />
                                                                    
                                                                     
                                                                <asp:Label ID="lblRollNumber" runat="server" Text='<%# Eval("RollNumber").ToString() %>'></asp:Label>
                                           

                                                                </td>

                                                                <td>SO :
                                                                <asp:Label ID="lblSO" runat="server" Text='<%# Eval("SO").ToString() %>'></asp:Label>

                                                                
                                                                </td>
<td >
   
                                                                <asp:DropDownList ID="drpDriving" runat="server">
                                                                        <asp:ListItem Value="0">Select</asp:ListItem>
                                                                    <asp:ListItem Value="H">Heavy</asp:ListItem>
                                                                
                                                                    <asp:ListItem Value="L">Light</asp:ListItem>
                                                                    <asp:ListItem Value="NQ">DisQualified</asp:ListItem>

                                                                    <asp:ListItem Value="AB">Absent</asp:ListItem>
                                                                </asp:DropDownList>

</td>


                                                             

                                                                 

                                                                <td rowspan="3">
                                                                    <asp:Button ID="btnSubmitRow" runat="server" Text="Submit" CommandName="SubmitRow"   CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("StatusQual").ToString() %>' ></asp:Label>      
                                                                </td>


                                                            </tr>


                                                            <tr>
                                                                <td>DOB :   <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label></td>
                                                                 <td colspan="2" rowspan="2">Remarks<asp:TextBox ID="txtRemarks" runat="server" Height="44px" Width="60px" Text='<%# Eval("remarks").ToString() %>' ></asp:TextBox> </td>
                                                                
                           
                                                            </tr>
                                                            <tr>
                                                                <td rowspan="1">


                                                                </td>

                                                       </tr>
                                                        

                                                        </table>  
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>


                                        </asp:GridView>




                                       </td>

                                    </tr>

                                <tr>
                                    <td colspan="3" align="center">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit Data" OnClick="btnSubmit_Click" Visible="false" />

                              
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
