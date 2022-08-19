<%@ Page Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="FrmBarReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.FrmBarReport" %>
 
 
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
  
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .report_dropdonw{
        font-size: 13px;
    width: 250px;
    height: 32px;
    border: 2px solid #d8d8d8;
    }
        .chart_w100 {
            width:100% !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div id="page-iframe">
            <div class="row">
                <div class="w95">
                    <h1>Bar Reports</h1>
                <div class="col-lg-12 mtop20 mbtm20 text-center">
                    <div class="box-heading">
                        <div style="background-color: rgba(217, 217, 217, 0.9); width: 400px; height: 57px; border-radius: 2px;
    padding: 12px 10px 10px 10px; margin:0 auto;">
                        <b style="font-size:14px;">Select Type :-</b> <asp:dropdownlist id="drpSelectType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Unnamed1_SelectedIndexChanged" CssClass="report_dropdonw">
                            <asp:ListItem Value="C">Category Wise</asp:ListItem>
                            <asp:ListItem Value="D">District Wise</asp:ListItem>
                        </asp:dropdownlist>
                            </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12 box-container">
                    

                    <div class="box-body box-body-open" id="DivCategory" runat="server" >
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <asp:Chart ID="ChartCategory" runat="server"  Height="550px" Width="1114px" CssClass="chart_w100" >
                                <Series>
                                    <asp:Series Name="Series1"   >
                                    </asp:Series>
                                     <asp:Series Name="Series2">
                                    </asp:Series>
                                     <asp:Series Name="Series3">
                                    </asp:Series>
                                     <asp:Series Name="Series4">
                                    </asp:Series>
                                     
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <AxisY Title="Count ">
                                        </AxisY>
                        <AxisX  Title="Category-->">
                                            </AxisX>
                                    </asp:ChartArea>

                                </ChartAreas>
                            </asp:Chart>         
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div style="overflow:scroll;">
                        <div class="box-body box-body-open" id="DivDistrict" runat="server" style='overflow-x: scroll;width:4000px;height:450px;' >
                            <asp:Chart ID="chartDistrict" runat="server"  Height="450px" Width="4000px" >
                                <Series>
                                    <asp:Series Name="Series11"   >
                                    </asp:Series>
                                     <asp:Series Name="Series21">
                                    </asp:Series>
                                     <asp:Series Name="Series31">
                                    </asp:Series>
                                     <asp:Series Name="Series41">
                                    </asp:Series>
                                     
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea11">
                                        <AxisY Title="Count ">
                                        </AxisY>
                        <AxisX  Title="Distict-->">
                                            </AxisX>
                                    </asp:ChartArea>

                                </ChartAreas>
                            </asp:Chart>         
                        <div class="clearfix"></div>
                    </div>
                        </div>
                </div>
                    </div>
            </div>
            <div class="clearfix"></div>
        </div>

</asp:Content>

