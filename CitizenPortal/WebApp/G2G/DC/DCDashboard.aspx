<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="DCDashboard.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.DC.DCDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
 <style>
        .pagination {
            color: #000 !important;
            display: block !important;
            padding: 10px;
        }

            .pagination label {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
            }

             .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 32.1%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #000;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="page-wrapper" style="min-height: 500px !important;">
            <div style="">

                <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="104">
                    <a href="#" onclick="javascript:return RedirectToService('WebApp/Kiosk/DBInterface/ServiceOfficerMapping.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/Kiosk/DBInterface/ServiceOfficerMapping.aspx" target="_blank">Service Officer Mapping</a>
                    <br />
                    <span>Service Officer Mapping</span>

                </div>               
                <div class="clearfix">
                </div>
            </div>

        </div>
</asp:Content>
