<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportCount.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.WebForm1" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

     <form id="form2" runat="server">
 <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title"> Count Report
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">


                            <table>
                                <tr>
                                    <td><h4 class="box-title">Category Wise Count 
                        </h4><asp:GridView ID="grdCat" runat="server"></asp:GridView></td>

                                    <td>
                                        
                                        <asp:Chart ID="ChartCategory" runat="server"   OnClick="ChartCategory_Click">
             <series>
                 <asp:Series Name="Series1">
                 </asp:Series>
             </series>
             <chartareas >
                 <asp:ChartArea Name="ChartArea1" >
                 </asp:ChartArea>
             </chartareas>
         </asp:Chart></td>
                                    </tr>
                                   <tr>
                                    <td> <h4 class="box-title">District Wise Count 
                        </h4><asp:GridView ID="grdDist" runat="server"></asp:GridView></td>
                                       <td>
                                                  <asp:Chart ID="ChartDistrict" runat="server"   OnClick="ChartCategory_Click">
             <series>
                 <asp:Series Name="Series1">
                 </asp:Series>
             </series>
             <chartareas >
                 <asp:ChartArea Name="ChartArea1" >
                 </asp:ChartArea>
             </chartareas>
         </asp:Chart>
                                           
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
