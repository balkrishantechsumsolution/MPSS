<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmEpassPM.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.PM.FrmEpassPM" %>

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
                       <h4 class="box-title"> E Pass for Physical Measurement</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">


                            <table  style="width:80%; height:60%; background-color: #f9f9f9; padding: 10px; border-top-left-radius: 2px; border-top-right-radius: 2px; border-top: 8px solid #8bbbea;  box-shadow: 3px 3px 5px #e0e0e0;"">
                               <tr>
                                    <td>Application No</td>

                                    <td>
                                  
                                        <asp:TextBox ID="txtAppId" runat="server"></asp:TextBox>
                                  
                                       </td>
                                    <td>


                                        DOB</td>
                                    <td><asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
</td>

                                   
                                    </tr>
                                 
                                <tr>
                                    <td>&nbsp;</td>

                                    <td colspan="2">
                                  
                                        <asp:Button ID="btnSearch" runat="server" Text="Search" Width="130px" OnClick="btnSearch_Click" />
                                  
                                       </td>
                                    <td>&nbsp;</td>

                                   
                                    </tr>
                                 
                                <tr id="Epass" runat="server" visible="false">
                                    <td colspan="4">
                                        <table style="width:100%;height:100%">
                                            <tr>
                                                <td colspan="4"> <h2>E Pass for Physical Measurement </h2></td>
                                                  
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
                                                 <td> <asp:Label ID="lblCategory" runat="server" ></asp:Label> </td>
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
