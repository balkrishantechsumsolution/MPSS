<%@ Page Title="" Language="C#" MasterPageFile="~/g2c/master/Home.Master" AutoEventWireup="true" CodeBehind="dashboardReports.aspx.cs" Inherits="CitizenPortal.g2c.forms.dashboardReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .reportBox {
            border:1px solid #C7C7C7;
            width:270px;
            height:105px;
            text-align:center;
            color:#333;
            background-color:#DCDCDC;
            font-size:16px;
            margin:10px 10px 10px 10px;
            padding:20px 10px;
        }
        .reportBox:hover { background-color:#FF7D01 !important; border:1px solid #FF7D01; color:#fff !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphbody" runat="server">
    <div class="row">
        <div class="w95 mtop15" style="min-height:385px;">
            <h1>Dashboard</h1>
            <a href="https://lokaseba-odisha.in/WebApp/MIS/ServerReport.aspx?ID=1" target="_blank">
            <div class="col-lg-2 reportBox ">
                <i class="fa fa-balance-scale fa-2x"></i>
                <div class="clearfix pbottom10"></div>
                 Transaction Summary
                    </div>
            </a>
            <a href="https://lokaseba-odisha.in/WebApp/MIS/ServerReport.aspx?ID=2" target="_blank">
            <div class="col-lg-2 reportBox">
                <i class="fa fa-joomla fa-2x"></i>
                <div class="clearfix pbottom10"></div>
                 Recruitment Count
            </div>
                </a>
            <a href="https://lokaseba-odisha.in/WebApp/MIS/ServerReport.aspx?ID=3" target="_blank">
            <div class="col-lg-2 reportBox">
                <i class="fa fa-table fa-2x"></i>
                <div class="clearfix pbottom10"></div>
                 Top 5 Transaction Summary
            </div>
                </a>
            
            <a href="https://lokaseba-odisha.in/WebApp/MIS/ServerReport.aspx?ID=6" target="_blank">
            <div class="col-lg-2 reportBox">
                <i class="fa fa-file-excel-o fa-2x"></i>
                <div class="clearfix pbottom10"></div>
                 Recruitment Excel Report
            </div>
                </a>
            <a href="https://lokaseba-odisha.in/WebApp/MIS/ServerReport.aspx?ID=7" target="_blank">
            <div class="col-lg-2 reportBox">
                <i class="fa fa-database fa-2x"></i>
                <div class="clearfix pbottom10"></div>
                 All Service Transaction Count
            </div>
            </a>
            <a href="https://lokaseba-odisha.in/WebApp/MIS/ServerReport.aspx?ID=4" target="_blank">
            <div class="col-lg-2 reportBox">
                <i class="fa fa-dedent fa-2x"></i>
                <div class="clearfix pbottom10"></div>
                 Recruitment Category Wise details
            </div>
                </a>

            <a href="https://lokaseba-odisha.in/WebApp/MIS/ServerReport.aspx?ID=5" target="_blank">
            <div class="col-lg-2 reportBox">
                <i class="fa fa-list-ul fa-2x"></i>
                <div class="clearfix pbottom10"></div>
                Recruitment District Wise Details
            </div>
                </a>
        </div>
    </div>
</asp:Content>
