<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmWrittenExam_BroadSheetDataEntry.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.FrmWrittenExam_BroadSheetDataEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Broad Sheet</title>
     <link href="../css/allocationCenterStylesheet.css" rel="stylesheet" />

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
                        <h4 class="box-title" style="text-align:center">Broad Sheet</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <table style="width: 794px; height: 60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea; box-shadow: 3px 3px 5px #e0e0e0; margin: 0 auto;">
                                
                                <tr>
                                   <td>
                                      Ground Name 
                                       </td>
                             <td><asp:DropDownList ID="drpCenter" runat="server" Height="40px"  Width="406px"></asp:DropDownList></td>
                                    <td>


                                        Batch/Day 
</td>
                                    <td> <asp:DropDownList ID="drpday" runat="server" Height="30px"   Width="183px" OnSelectedIndexChanged="drpday_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList></td>
                                

                                    </tr>

                                <tr>
                                   <td>
                                      Category    </td><td><asp:DropDownList ID="drpCategory" runat="server" Height="21px" Width="193px" AutoPostBack="True" OnSelectedIndexChanged="drpCategory_SelectedIndexChanged">
                                        <asp:ListItem>ALL</asp:ListItem>
                                        <asp:ListItem>UR</asp:ListItem>
                                        <asp:ListItem>SEBC</asp:ListItem>
                                        <asp:ListItem>SC</asp:ListItem>
                                        <asp:ListItem>ST</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>
                                   Sports (National International)   

                                        </td>
                                    <td><asp:DropDownList ID="drpSropts" runat="server" Height="20px" Width="181px" AutoPostBack="True" OnSelectedIndexChanged="drpSropts_SelectedIndexChanged">
                                        <asp:ListItem>ALL</asp:ListItem>
                                        <asp:ListItem>National</asp:ListItem>
                                        <asp:ListItem>International</asp:ListItem>
                                        </asp:DropDownList></td>

                                    

                                    </tr>

                               


                                <tr>
                                   <td>
                                       NCC</td><td> <asp:DropDownList ID="drpNCC" runat="server" Height="23px" Width="195px" AutoPostBack="True" OnSelectedIndexChanged="drpNCC_SelectedIndexChanged">
                                        <asp:ListItem>ALL</asp:ListItem>
                                        <asp:ListItem>A Certificated</asp:ListItem>
                                        <asp:ListItem>B Certificated</asp:ListItem>
                                        <asp:ListItem>C Certificated</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>
                                       Written Exam Status</td>
                                    <td>  
                                           <asp:DropDownList ID="drpWrittenExamStatus" runat="server" Height="21px" Width="182px" AutoPostBack="True" OnSelectedIndexChanged="drpWrittenExamStatus_SelectedIndexChanged"  >
                                        <asp:ListItem Value="ALL">ALL</asp:ListItem>
                                        <asp:ListItem Value="Q">Qualified</asp:ListItem>
                                        <asp:ListItem Value="NQ">Not Qualified</asp:ListItem>
                                
                                        </asp:DropDownList></td>

                                    

                                    </tr>

                               


                                <tr>
                                   <td>
                                       Final Status</td><td> 
                                           <asp:DropDownList ID="DrpFinalStatus" runat="server" Height="23px" Width="195px" AutoPostBack="True" OnSelectedIndexChanged="DrpFinalStatus_SelectedIndexChanged"  >
                                        <asp:ListItem Value="ALL">ALL</asp:ListItem>
                                        <asp:ListItem Value="Q">Qualified</asp:ListItem>
                                        <asp:ListItem Value="NQ">Not Qualified</asp:ListItem>
                                        <asp:ListItem Value="N">Verification Pendind (Yet To Verify)</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td>
                                        Roll Number</td>
                                    <td>   <asp:DropDownList ID="drpRollnumber" runat="server" Height="21px" Width="180px"></asp:DropDownList></td>

                                    

                                    </tr>

                               


                                <tr>
                                   <td colspan="2" align="center">
                                       OR</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>   &nbsp;</td>

                                    

                                    </tr>

                               


                                <tr>
                                   <td>
                                       &nbsp;</td><td> 
                                           RollNumber : -
                                           <asp:TextBox ID="txtSearchRollnumber" runat="server" Height="16px" Width="189px"></asp:TextBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>   &nbsp;</td>

                                    

                                    </tr>

                               


                                <tr>
                                   <td colspan="4"  align="center">
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" Width="116px" OnClick="btnSearch_Click" />
                                       </td>

                                    

                                    </tr>

                               


                                <tr>
                                    <td colspan="4">
                                        <div style='overflow-x:scroll;overflow-y:hidden;width:1250px;height:100%'>
  

                                        <asp:GridView ID="grdBroadSheet" runat="server" Width="100%" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="Both"   OnRowCancelingEdit="grdBroadSheet_RowCancelingEdit" OnRowEditing="grdBroadSheet_RowEditing" OnRowUpdating="grdBroadSheet_RowUpdating" OnRowDataBound="grdBroadSheet_RowDataBound" >
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                              
                                          
                                                <asp:CommandField ShowEditButton="True" />


                                                   <asp:TemplateField HeaderText="Final<br/>Sta.">
                                                      <EditItemTemplate>
 <asp:DropDownList ID="DrpFinalStatusGrd" runat="server"  Width="50px" >
                                   
                                        <asp:ListItem Value="Q">Qualified</asp:ListItem>
                                        <asp:ListItem Value="NQ">Not Qualified</asp:ListItem>
                               <asp:ListItem Value="N">Verification Pending (Yet To Verify)</asp:ListItem>
                               <asp:ListItem Value="R">Candidature Rejected</asp:ListItem>

                                        </asp:DropDownList>
                                       
                                                    </EditItemTemplate>
                                                          <ItemTemplate>
                                                        <asp:Label ID="lblFinalStatusText" runat="server" Text='<%# Eval("FinalStatusText").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                              
                                                     <asp:TemplateField HeaderText="Sr<br/>No">
                                                 

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSrNo" runat="server" Text='<%# Eval("SrNo").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="WrittenExamStatus">
                                                 

                                                    <ItemTemplate>
                                                        <asp:Label ID="lblWrittenStatus" runat="server" Text='<%# Eval("WrittenExamStatus").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                
                                                   <asp:TemplateField HeaderText="Merit">
                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMerit" runat="server" Text='<%# Eval("Merit").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                


                                                

                                                   <asp:TemplateField HeaderText="ROLL<br/> No.">
                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblROLLNO" runat="server" Text='<%# Eval("ROLLNO").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:HyperLinkField HeaderText="Detail" DataNavigateUrlFields="RollNoLink" DataTextField="RollNoLinkText"  Target="_blank" />
                                                   
                                                     
                                                <asp:TemplateField HeaderText="Name">
                                                   <EditItemTemplate>
                                                        <asp:TextBox ID="txtName" runat="server"  Text='<%# Eval("Name").ToString() %>' Width="70px" MaxLength="30" ></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="FatherName">
                                                   <EditItemTemplate>
                                                        <asp:TextBox ID="txtFatherName" runat="server"  Text='<%# Eval("FatherName").ToString() %>' Width="70px" MaxLength="30" ></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblFatherName" runat="server" Text='<%# Eval("FatherName").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField HeaderText="DOB">
                                                   <EditItemTemplate>
                                                        <asp:TextBox ID="txtDOB" runat="server"  Text='<%# Eval("DOB").ToString() %>' Width="50px" MaxLength="10" ></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:HyperLinkField HeaderText="DOB <br/>Doc" DataNavigateUrlFields="DOBDoc" DataTextField="DOBDocText"  Target="_blank" />

                                                   <asp:TemplateField HeaderText="Tot.">
                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("Total").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                          
                                                <asp:TemplateField HeaderText="Writ. <br/>Exam">
                                               <EditItemTemplate>
                                                        <asp:TextBox ID="txtWrittenExam" runat="server"  Text='<%# Eval("WrittenExam").ToString() %>' Width="20px" ></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblWrittenExam" runat="server" Text='<%# Eval("WrittenExam").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

 


                                                 
                                                <asp:TemplateField HeaderText="Edu<br/> Ach.">
                                             <EditItemTemplate>
                                                       
                                                        <asp:DropDownList ID="drpEducationalAchievementGrd" runat="server" Width="50px"  >
                                                               <asp:ListItem Value="7">61 % an Above</asp:ListItem>
                                                                  <asp:ListItem Value="4">51 % an Above</asp:ListItem>
                                                                     <asp:ListItem Value="2">41 % an Above</asp:ListItem>
                                                            <asp:ListItem Value="0">Compartmental/Supplementary/less than 41%</asp:ListItem>
                                                        </asp:DropDownList>


                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEducationalAchievement" runat="server" Text='<%# Eval("EducationalAchievement").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:HyperLinkField HeaderText="Edu<br/>Doc" DataNavigateUrlFields="EducationalDoc" DataTextField="EducationalDocText"  Target="_blank" />
                                                <asp:TemplateField HeaderText="Sport<br/> Ach.">
                                                    <EditItemTemplate>
                                                     

                                                          <asp:DropDownList ID="drpSportAchievementGrd" runat="server" Width="55px" >
                                                               <asp:ListItem Value="I15">International Gold Medal</asp:ListItem>
                                                                  <asp:ListItem Value="I14">International Silver Medal</asp:ListItem>
                                                                     <asp:ListItem Value="I13">International Bronze Medal</asp:ListItem>
                                                            <asp:ListItem Value="I10">Participated in International Sports </asp:ListItem>

                                                                 <asp:ListItem Value="N10">National Gold Medal</asp:ListItem>
                                                                  <asp:ListItem Value="N7">National Silver Medal</asp:ListItem>
                                                                     <asp:ListItem Value="N5">National Bronze Medal</asp:ListItem>
                                                            <asp:ListItem Value="N3">Participated in National Sports </asp:ListItem>
                                                               <asp:ListItem Value="0">None</asp:ListItem>
                                                        </asp:DropDownList>


                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblSportAchievement" runat="server" Text='<%# Eval("SportAchievement").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:HyperLinkField HeaderText="Sport<br/>Ach.<br/>Doc" DataNavigateUrlFields="SportAchievementDoc" DataTextField="SportAchievementDocText" Target="_blank"  />
                                                <asp:TemplateField HeaderText="NCC">
                                                    <EditItemTemplate>
                                                      

                                                         <asp:DropDownList ID="drpNCCCertificateGrd" runat="server" Width="55px" >
                                                               <asp:ListItem Value="1">National Cadet Corps 'A' Certificate</asp:ListItem>
                                                                  <asp:ListItem Value="3">National Cadet Corps 'B' Certificate</asp:ListItem>
                                                                     <asp:ListItem Value="5">National Cadet Corps 'C' Certificate</asp:ListItem>
                                                        <asp:ListItem Value="0">None</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNCC" runat="server"  Text='<%# Eval("NCC").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:HyperLinkField HeaderText="NCC<br/> Doc" DataNavigateUrlFields="NCCDoc" DataTextField="NCCDocText"  Target="_blank" />
                                                <%--    <asp:TemplateField HeaderText="DOB">
                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("DOB").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>



                                                

                                                  <asp:TemplateField HeaderText="Cat." >

                                                        <EditItemTemplate>
                                                      

                                                         <asp:DropDownList ID="drpCategoryGrd" runat="server" Width="55px">
                                                               <asp:ListItem Value="UR">UR</asp:ListItem>
                                                                  <asp:ListItem Value="SC">SC</asp:ListItem>
                                                                     <asp:ListItem Value="ST">ST</asp:ListItem>
                                                        <asp:ListItem Value="SEBC">SEBC</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>


                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCategory" runat="server" Text='<%# Eval("Category").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:HyperLinkField HeaderText="Cat<br/> Doc" DataNavigateUrlFields="CategoryDoc" DataTextField="CategoryDocText"  Target="_blank" />


                                                   <asp:HyperLinkField HeaderText="Driv.<br/> Doc" DataNavigateUrlFields="DrivingDoc" DataTextField="DrivingDocText"  Target="_blank" />


                                                   <asp:HyperLinkField HeaderText="Emp<br/> Doc" DataNavigateUrlFields="EmployemetDoc" DataTextField="EmployemetDocText"  Target="_blank" />



                                                  <asp:TemplateField HeaderText="Height<br/>(c.m.)">
                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblHeight" runat="server" Text='<%# Eval("Height").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                   <asp:TemplateField HeaderText="Bonus <br/>Marks<br/>Height">
                                                      <EditItemTemplate>
                                                      

                                                         <asp:DropDownList ID="drpBonusMarksHeigthGrd" runat="server" Width="55px">
                                                               <asp:ListItem Value="3">Height is Greater thanor Equal to 178cm</asp:ListItem>
                                                                  <asp:ListItem Value="0">Height is less than 178cm</asp:ListItem>
                                                           
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBonusHeight" runat="server" Text='<%# Eval("BonusHeight").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>



                                                   <asp:TemplateField HeaderText="Weight<br/>(k.g.)">
                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblWeight" runat="server" Text='<%# Eval("Weight").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                   <asp:TemplateField HeaderText="Chest<br/>(c.m.)">
                                                   
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChest" runat="server" Text='<%# Eval("Chest").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                  <asp:TemplateField HeaderText="Run<br/>(1.6 k.m.)">
                                                          <EditItemTemplate>
                                                      

                                                         <asp:DropDownList ID="drpRunningGrd" runat="server"  Width="55px" >
                                                               <asp:ListItem Value="10"> Covered in 5 mins</asp:ListItem>
                                                                  <asp:ListItem Value="8">Covered in 5.30 mins</asp:ListItem>
                                                                     <asp:ListItem Value="6">Covered in 6 mins</asp:ListItem>
                                                                       <asp:ListItem Value="4">Covered in 6.30 mins</asp:ListItem>
                                                                       <asp:ListItem Value="0">Covered beyond 6.30 mins(Disqualified)</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRunning" runat="server" Text='<%# Eval("Running").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                  <asp:TemplateField HeaderText="High<br/> Jump">
                                                       <EditItemTemplate>
                                                      

                                                         <asp:DropDownList ID="drpHighJumpGrd" runat="server"  Width="55px">
                                                               <asp:ListItem Value="1"> 1.22 Mtr :- 3rd chance-1mrks</asp:ListItem>
                                                                  <asp:ListItem Value="2">1.22 Mtr :- 2nd chance-2mrks</asp:ListItem>
                                                                     <asp:ListItem Value="3">1.22 Mtr :- 1st chance-3mrks</asp:ListItem>
                                                                       <asp:ListItem Value="6">1.38Mrts :- (1st /2nd /3rd chance)-6mrks</asp:ListItem>
                                                                       <asp:ListItem Value="8">1.50mtrs :- (1st /2nd /3rd chance)-8mrks</asp:ListItem>
                                                              <asp:ListItem Value="0">Disqualified</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblHighJump" runat="server" Text='<%# Eval("HighJump").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Broad<br/> Jump">
                                                         <EditItemTemplate>
                                                      

                                                         <asp:DropDownList ID="drpBroadJumpGrd" runat="server" Width="55px">
                                                               <asp:ListItem Value="1"> 3.66Mtrs:-(1st /2nd /3rd chance)-1mrk</asp:ListItem>
                                                                  <asp:ListItem Value="3">4.0mtrs:-(1st /2nd /3rd chance)-3mrks</asp:ListItem>
                                                                     <asp:ListItem Value="5">4.35mtrs:-(1st /2nd /3rd chance)-5mrks</asp:ListItem>
                                                                       <asp:ListItem Value="6">4.50mtrs:-(1st /2nd /3rd chance)-6mrks</asp:ListItem>
                                                                    
                                                              <asp:ListItem Value="0">Disqualified(Not Clear 3.66 Mtrs)</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBroadjump" runat="server" Text='<%# Eval("Broadjump").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Rope <br/>Climb">
                                                   

                                                        <EditItemTemplate>
                                                      

                                                         <asp:DropDownList ID="drpRopeClimbingGrd" runat="server" Width="55px">
                                                               <asp:ListItem Value="6"> Height: 6 Mtrs :-(1stchance) =6 mrks</asp:ListItem>
                                                                  <asp:ListItem Value="4">Height: 6 Mtrs :-(2ndchance)=4 mrks</asp:ListItem>
                                                                     <asp:ListItem Value="2">Height: 6 Mtrs :-(3rdchance)=2mrks</asp:ListItem>
                                                                       
                                                              <asp:ListItem Value="0">Disqualified(Not Clear 6 Mtrs in any chance)</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>


                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRopeClimbing" runat="server" Text='<%# Eval("RopeClimbing").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                

                                                <asp:TemplateField HeaderText="Cross<br/> Count.">
                                                   

                                                    
                                                        <EditItemTemplate>
                                                      

                                                         <asp:DropDownList ID="drpCrossCountryGrd" runat="server" Width="55px">
                                                               <asp:ListItem Value="10"> Covered 5.0 K.M :20 mins -10Mrks</asp:ListItem>
                                                                  <asp:ListItem Value="8">Covered 5.0 K.M :21 mins -8Mrks</asp:ListItem>
                                                                     <asp:ListItem Value="6">Covered 5.0 K.M :22 mins-6Mrks</asp:ListItem>
                                                                       <asp:ListItem Value="4"> Covered 5.0 K.M :23 mins -4Mrks</asp:ListItem>
                                                                  <asp:ListItem Value="2">Covered 5.0 K.M :24 mins -2Mrks</asp:ListItem>
                                                                     <asp:ListItem Value="1">Covered 5.0 K.M :25 mins -1Mrks</asp:ListItem>
                                                                      
                                                              <asp:ListItem Value="0">covered beyond 25min- Disqualified</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>


                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCrossCountry" runat="server" Text='<%# Eval("CrossCountry").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                  <asp:TemplateField HeaderText="Driv.">
                                                   
                                                        <EditItemTemplate>
                                                      

                                                         <asp:DropDownList ID="drpDrivingGrd" runat="server" Width="55px">
                                                               <asp:ListItem Value="5">Heavy Vehicle:5Mrks</asp:ListItem>
                                                                  <asp:ListItem Value="3">Light Vehicle : 3Marks</asp:ListItem>
                                                                    
                                                                      
                                                              <asp:ListItem Value="0">None</asp:ListItem>
                                                        </asp:DropDownList>

                                                    </EditItemTemplate>


                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDriving" runat="server" Text='<%# Eval("Driving").ToString() %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

 


                                                 
                                            </Columns>


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

                                            </div>
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
