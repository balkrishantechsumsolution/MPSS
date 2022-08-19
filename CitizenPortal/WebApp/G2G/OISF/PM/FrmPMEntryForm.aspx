<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPMEntryForm.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.FrmPMEntryForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Center Allocation Report</title>
    <link href="../css/allocationCenterStylesheet.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 21px;
        }
    p.MsoNormal
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:0in;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
    </style>
</head>
<body>
     <form id="form2" runat="server">
 <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                       <h4 class="box-title"> &nbsp;Physical Measurement Entry Form</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">


                            <table  style="width:80%;height:60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea;  box-shadow: 3px 3px 5px #e0e0e0;"">
                               <tr>
                                    <td>Application No</td>

                                    <td>
                                  
                                        <asp:TextBox ID="txtAppId" runat="server"></asp:TextBox>
                                  
                                       </td>

                                   
                                    </tr>
                                 
                                <tr>
                                    <td>&nbsp;</td>

                                    <td>
                                  
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" Width="130px" OnClick="btnSearch_Click" />
                                  
                                       </td>

                                   
                                    </tr>
                                 
                                <tr id="Epass" runat="server" visible="false">
                                    <td colspan="2">
                                        <table style="width:100%;height:100%">
                                            <tr>
                                                <td colspan="4"> <h2>&nbsp;<strong>Candidate Measurement Details </strong></h2></td>
                                                  
                                            </tr>
                                               <tr>
                                                <td> AppId </td>
                                                 <td> <asp:Label ID="lblAppID" runat="server" ></asp:Label> </td>
                                                 <td>  Name </td>
                                                 <td> <asp:Label ID="lblName" runat="server" ></asp:Label> </td>
                                            </tr>
                                             <tr>
                                                <td> FatherName </td>
                                                 <td> <asp:Label ID="lblFatherName" runat="server" ></asp:Label> </td>
                                                 <td> District </td>
                                                 <td>  <asp:Label ID="lblDistrict" runat="server" ></asp:Label></td>
                                            </tr>
                                             <tr>
                                                <td> Category </td>
                                                 <td> <asp:Label ID="lblCategory" runat="server" style="font-weight: 700" ></asp:Label> </td>
                                                 <td> DOB </td>
                                                 <td> <asp:Label ID="lblDOB" runat="server" ></asp:Label>  </td>
                                            </tr>
                                             <tr>
                                                <td> Venue   </td>
                                                 <td> <asp:Label ID="lblVenue" runat="server" ></asp:Label> </td>
                                                 <td> Reporting Time</td>
                                                 <td> <asp:Label ID="lblReportingTime" runat="server" ></asp:Label> </td>
                                            </tr>
                                             <tr>
                                                <td colspan="4"> <h2>Physical Measurement</h2></td>
                                            </tr>
                                             <tr>
                                                <td> Height (in cm)</td>
                                                 <td> 
                                                     <asp:TextBox ID="txtHeight" runat="server" Width="147px"></asp:TextBox>
                                                 </td>
                                                 <td> Weight (in kg)</td>
                                                 <td> 
                                                     <asp:TextBox ID="txtWeight" runat="server" Width="147px"></asp:TextBox>
                                                 </td>
                                            </tr>
                                             <tr>
                                                <td> Chest (Un Expanded) (in cm)</td>
                                                 <td> 
                                                     <asp:TextBox ID="txtChestUnexpanded" runat="server" Width="147px"></asp:TextBox>
                                                 </td>
                                                 <td> Chest (Expanded) (in cm)</td>
                                                 <td> 
                                                     <asp:TextBox ID="txtChestExpanded" runat="server" Width="147px"></asp:TextBox>
                                                 </td>
                                            </tr>
                                             <tr>
                                                <td colspan="4"><h2> High Jump</h2></td>
                                            </tr>
                                             <tr>
                                                <td colspan="4">


                                                    <table style="width:100%">
                                                           <tr>
                                                <td class="auto-style1"> First Attempt</td>
                                                 <td class="auto-style1"> 
                                                     <asp:TextBox ID="txtHeight0" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                                 <td class="auto-style1"> Second Attempt </td>
                                                 <td class="auto-style1"> 
                                                     <asp:TextBox ID="txtHeight1" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                                               <td class="auto-style1"> Third Attempt</td>
                                                 <td class="auto-style1"> 
                                                     <asp:TextBox ID="txtHeight2" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                            </tr>
                                                    </table>
                                                </td>

                                            </tr>



                                               <tr>
                                                <td colspan="4"><h2> Broad Jump</h2></td>
                                            </tr>
                                             <tr>
                                                <td colspan="4">


                                                    <table style="width:100%">
                                                           <tr>
                                                <td class="auto-style1"> First Attempt</td>
                                                 <td class="auto-style1"> 
                                                     <asp:TextBox ID="TextBox1" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                                 <td class="auto-style1"> Second Attempt </td>
                                                 <td class="auto-style1"> 
                                                     <asp:TextBox ID="TextBox2" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                                               <td class="auto-style1"> Third Attempt</td>
                                                 <td class="auto-style1"> 
                                                     <asp:TextBox ID="TextBox3" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                            </tr>
                                                    </table>
                                                </td>

                                            </tr>




                                               <tr>
                                                <td colspan="4"><h2> Rope Climbing</h2></td>
                                            </tr>
                                             <tr>
                                                <td colspan="4">


                                                    <table style="width:100%">
                                                           <tr>
                                                <td class="auto-style1"> First Attempt</td>
                                                 <td class="auto-style1"> 
                                                     <asp:TextBox ID="TextBox4" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                                 <td class="auto-style1"> Second Attempt </td>
                                                 <td class="auto-style1"> 
                                                     <asp:TextBox ID="TextBox5" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                                               <td class="auto-style1"> Third Attempt</td>
                                                 <td class="auto-style1"> 
                                                     <asp:TextBox ID="TextBox6" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                            </tr>
                                                    </table>
                                                </td>

                                            </tr>
                                          
                                             <tr>
                                                <td colspan="4"> <h2>Swimming</h2></td>
                                            </tr>
                                             <tr>
                                                <td> Qualifying Length 40mtrs</td>
                                                 <td> 
                                                     <asp:TextBox ID="TextBox9" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                                 <td> &nbsp;</td>
                                                 <td> 
                                                     &nbsp;</td>
                                            </tr>
                                             <tr>
                                                <td colspan="4"> <h2>Running</h2></td>
                                            </tr>
                                             <tr>
                                                <td> Covered 1.6 Mtrs:(In Minutes) </td>
                                                 <td> 
                                                     <asp:TextBox ID="TextBox8" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                                 <td> &nbsp;</td>
                                                 <td> 
                                                     &nbsp;</td>
                                            </tr>
                                             <tr>
                                                <td colspan="4"> <h2>Cross Country</h2></td>
                                            </tr>
                                             <tr>
                                                <td> 
                                                   Covered 5.0 K.M:
(In Minutes) 
                                                 </td>
                                                 <td> 
                                                     <asp:TextBox ID="TextBox7" runat="server" Width="147px"></asp:TextBox>
                                                               </td>
                                                 <td> &nbsp;</td>
                                                 <td> 
                                                     &nbsp;</td>
                                            </tr>
                                             <tr>
                                                <td colspan="4"><h2> Driving</h2></td>
                                            </tr>
                                             <tr>
                                                <td> Vehicle Type </td>
                                                 <td colspan="2"> 
                                                     <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                                         <asp:ListItem Value="HV">Heavy Vehicle</asp:ListItem>
                                                         <asp:ListItem Value="LV">Light Vehicle</asp:ListItem>
                                                     </asp:RadioButtonList>
                                                 </td>
                                                 <td> 
                                                     &nbsp;</td>
                                            </tr>
                                             <tr>
                                                <td> &nbsp;</td>
                                                 <td> 
                                  
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="130px" OnClick="btnSubmit_Click"   />
                                  
                                                 </td>
                                                 <td> &nbsp;</td>
                                                 <td> &nbsp;</td>
                                            </tr>
                                             <tr>
                                                <td colspan="2"> Candidate Selection Status</td>
                                                 <td colspan="2"> <asp:Label ID="lblSeletionStatus" runat="server" text="----" style="font-weight: 700"></asp:Label> </td>
                                            </tr>
                                             <tr>
                                                <td colspan="4">
                                                    <table style="width:100%;border: 1px solid black;">
                                                        <tr><td><b>S.No.</b></td>
                                                            <td><b>Category</b></td>
                                                            <td><b>Height</b></td>
                                                            <td><b>Weight</b></td>
                                                            <td><b>Chest (Un-Expanded)</b></td>
                                                            <td><b>Chest (Expanded)</b></td>
                                                        </tr>

                                                         <tr><td><b>1.</b></td>
                                                            <td>Un-Reserved / SEBC</td>
                                                            <td>168 cm</td>
                                                            <td>55 kg</td>
                                                            <td>79 cm</td>
                                                            <td> 84 cm</td>
                                                        </tr>
                                                         <tr><td><b>2.</b></td>
                                                            <td>S.C/S.T</td>
                                                            <td> 163 cm</td>
                                                            <td> 50 Kg</td>
                                                            <td>76 cm</td>
                                                            <td>81 cm</td>
                                                        </tr>
                                                    </table>


                                                </td>
                                            </tr>
                                             <tr>
                                                <td> &nbsp;</td>
                                                 <td colspan="2"> 
                                  
                                        <asp:Button ID="btnPrint" runat="server" Text="Print" Width="130px" />
                                  
                                                 </td>
                                                 <td> &nbsp;</td>
                                            </tr>
                                        </table>
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
