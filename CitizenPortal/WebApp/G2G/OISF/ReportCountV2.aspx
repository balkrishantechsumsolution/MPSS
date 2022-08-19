<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="ReportCountV2.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.ReportCountV2" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #LeftPanel_pnlMenu {
        }
        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <div class="clearfix">
            <h2 class="form-heading">Recruitment of Constables in 9th SIRB
            </h2>
            
        </div>
        <div id="page-iframe" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-md-4 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Category Wise Count
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <asp:GridView ID="grdCat" runat="server" style="display:none;"></asp:GridView>
                            <asp:Chart ID="ChartCategory" runat="server" OnClick="ChartCategory_Click">
                                <Series>
                                    <asp:Series Name="Series1">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>         
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="col-md-8 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">CSC/Citizen Wise Count 
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <asp:GridView ID="grdDist" runat="server" style="display:none;"></asp:GridView>
                            <asp:Chart ID="ChartCSC" runat="server" OnClick="ChartCategory_Click"  Width="650px">
                                <Series>
                                    <asp:Series Name="Series1">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                            
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>

                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">District Wise Count 
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <asp:GridView ID="GridView1" runat="server" style="display:none;"></asp:GridView>
                            <asp:Chart ID="ChartDistrict" runat="server" OnClick="ChartCategory_Click"  Width="1000px">
                                <Series>
                                    <asp:Series Name="Series1">                                        
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                            
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" Value="388" />
</asp:Content>
