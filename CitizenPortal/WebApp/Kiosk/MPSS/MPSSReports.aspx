<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/MPSSMaster.Master" AutoEventWireup="true" CodeBehind="MPSSReports.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.MPSSReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .GridClass {
            width: 100%;
            font-family: tahoma;
        }

            .GridClass td /* this applies to the Gridviews Data fileds */ {
                padding: 1px;
                text-align: center;
                width: 3%;
                border: solid 1px black;
                border-collapse: collapse;
            }

            .GridClass th /* this applies to the Gridviews Headers */ {
                padding: 0px 0px;
                border-width: 1px;
            }
    </style>
      <style>
        #ContentPlaceHolder1_gv {
            margin: 25px auto 0 auto;
        }

            #ContentPlaceHolder1_gv tr th {
                padding: 10px;
            }

            #ContentPlaceHolder1_gv tr td {
                padding: 10px;
            }

            #ContentPlaceHolder1_gv > tbody > tr:nth-child(1) {
                background-color: #006699;
                font-weight: 10px;
                color: White;
                padding: 10px;
            }

            #ContentPlaceHolder1_gv > tbody > tr:not(:nth-child(1)) {
                background-color: #E3EAEB;
                padding: 10px;
            }

            #ContentPlaceHolder1_gv > tbody > tr.pagingDiv {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
                padding: 10px;
            }

                #ContentPlaceHolder1_gv > tbody > tr.pagingDiv table {
                    color: #000 !important;
                    display: block !important;
                    margin: 0 !important;
                    padding: 10px;
                }

                    #ContentPlaceHolder1_gv > tbody > tr.pagingDiv table td {
                        color: #000 !important;
                        display: block !important;
                        margin: 0 !important;
                        padding: 10px;
                    }

        .pagingDiv a, .pagingDiv span {
            display: inline-block;
            padding: 0px 9px;
            margin-right: 4px;
            border-radius: 3px;
            border: solid 1px #c0c0c0;
            background: #e9e9e9;
            box-shadow: inset 0px 1px 0px rgba(255,255,255, .8), 0px 1px 3px rgba(0,0,0, .1);
            font-size: .875em;
            font-weight: bold;
            text-decoration: none;
            color: #717171;
            text-shadow: 0px 1px 0px rgba(255,255,255, 1);
        }

            .pagingDiv a:hover {
                background: #fefefe;
                background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#FEFEFE), to(#f0f0f0));
                background: -moz-linear-gradient(0% 0% 270deg,#FEFEFE, #f0f0f0);
            }

            .pagingDiv a.active {
                border: none;
                background: #616161;
                box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);
                color: #f0f0f0;
                text-shadow: 0px 0px 3px rgba(0,0,0, .5);
            }

        .pagingDiv span {
            color: #f0f0f0;
            background: #616161;
        }

        #ContentPlaceHolder1_gv a, #ContentPlaceHolder1_gv span {
            display: block;
            padding: 5px 15px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        #ContentPlaceHolder1_gv a {
            background-color: #f0f0f0;
            color: #545454;
            border: 1px solid #ddd;
        }

            #ContentPlaceHolder1_gv a:hover {
                background-color: #37495f;
                color: #fff;
            }

        #ContentPlaceHolder1_gv span {
            background-color: #B65838;
            color: #fff;
            border: 1px solid #B65838;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Report Viewer</h2>
            </div>
        </div>
        <div class="row">

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" runat="server" id="divCollege">
                <div class="box-heading">
                    <h4 class="box-title register-num">Report Filters
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="box-container">

                        <div class="box-body box-body-open ptop20">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">

                                    <label class="manadatory">Financial Year</label>

                                    <asp:DropDownList ID="ddlFinancialYr" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="2022">2022</asp:ListItem>
                                        <asp:ListItem Value="2021">2021</asp:ListItem>
                                    </asp:DropDownList>


                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">

                                    <label class="manadatory">Report Type</label>

                                    <asp:DropDownList ID="ddlReportType" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        <asp:ListItem Value="1">ScholarShip?registration</asp:ListItem>
                                    </asp:DropDownList>


                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip="Show Data"
                                        CssClass="btn btn-success" Text="Show Data" ValidationGroup="G" OnClick="btnSubmit_Click" />

                                    <asp:Button ID="btnHome" runat="server" CausesValidation="True" ToolTip="Home"
                                        CssClass="btn btn-success" Text="Home" ValidationGroup="G" OnClick="btnHome_Click" />


                                </div>
                                <div class="clearfix"></div>

                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
             <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">

                    <div class="box-heading">

                        <h4 class="box-title">Reports Data</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="table-responsive">
                                <div class="demo-container">
                                    <asp:Button ID="btnExcel" runat="server" Text="Excel" OnClick="btnExcel_Click" CssClass="btn btn-success" />
                                    <asp:Label ID="lblTotal" runat="server" />
                                    <asp:Panel ID="pnl" runat="server"></asp:Panel>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="mtop15"></div>
                    </div>

                </div>

            </div>
        </div>
    </div>


</asp:Content>
