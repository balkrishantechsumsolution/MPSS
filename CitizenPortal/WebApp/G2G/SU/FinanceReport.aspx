<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="FinanceReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.FinanceReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .pagination {
            color: #000 !important;
            display: block !important;
            margin: 0 !important;
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
            border-left: solid 5px #B65838;
        }

            .SrvDiv a {
                color: #472A26;
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

    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            $('#txtFromDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

            $('#txtToDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });

        });

        function TakeAction(p_URL, p_ServiceID, p_AppID) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/CBCS/Acknowledgement.aspx";
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading">Bulk Approval</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div style="">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Search Filter
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtFromDate">
                                    From Date
                                </label>
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtToDate">
                                    To Date
                                </label>
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                            </div>
                        </div>                        
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="" for="category">
                                    College</label>
                                <asp:DropDownList ID="ddlCollege" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Application Type</label>
                                <asp:DropDownList ID="ddlServices" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                            <div class="form-group">
                                <label class="" for="ddlGender">
                                    Branch/Cource Name
                                </label>
                                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="form-control">
                                    <asp:ListItem>Select Branch</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="ddlStatus">
                                    Application Status
                                </label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control" ToolTip="Select Status">
                                    <asp:ListItem>-Select Status-</asp:ListItem>
                                    <asp:ListItem Value="P">Pending</asp:ListItem>
                                    <asp:ListItem Value="A">Approved</asp:ListItem>
                                    <asp:ListItem Value="R">Rejected</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="txtAppID">Application No.</label>
                                <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Application No" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                    type="text" value=""></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5 text-right">
                            <div class="form-group">
                                <label>
                                    &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                        Text="Search" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                        <div class="clearfix"></div>

                    </div>
                    <div id="divApp" runat="server">

                        <div class="row" id="divSummary">
                            <div class="col-lg-12 box-container">
                                <div class="table-responsive" style="overflow-y: scroll; height: 200px;">
                                    <asp:gridview id="grdFin" showheaderwhenempty="true" runat="server" cssclass="table table-bordered legacysearch_tble" width="100%" autogeneratecolumns="false" onrowcommand="grdFin_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="S.No.">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSerialNo" runat="server" Text='<%#(((GridViewRow)Container).RowIndex+1).ToString()%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Service ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSvcID" runat="server" Text='<%#Eval("ServiceID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Service Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblServiceName" runat="server" Text='<%#Eval("ServiceName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Trans. Count">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCount" runat="server" Text='<%#Eval("Count") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount (Rs.)">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>                                            
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" Width="85px" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("ServiceID" )%>' class="resetBtn mleft10" CommandName="Action" CssClass="btn-link">View Details</asp:LinkButton>                                                    
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>No Record Found</EmptyDataTemplate>
                                    </asp:gridview>
                                </div>

                            </div>
                        </div>
                        <div class="row" id="divDetails" runat="server">
                        <div class="col-md-12 box-container mtop20">
                            <div class="box-heading">
                                <h4 class="box-title register-num">List of Applications
                                </h4>
                            </div>

                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="100%" Style="margin: 0 auto">
                                <asp:GridView ID="gvDetail" CssClass="table table-striped table-bordered" runat="server" AllowPaging="true" AlternatingRowStyle-BackColor="#C2D69B"
                                    Style="margin: 0 auto;" DataKeyNames="AppID" EmptyDataText="There is no data to display"
                                    Width="98%" AutoGenerateColumns="true"
                                    OnPageIndexChanging="gvDetail_PageIndexChanging" OnRowCreated="gvDetail_RowCreated"
                                    OnRowDataBound="gvDetail_RowDataBound" ClientIDMode="Static">
                                </asp:GridView>
                            </asp:Panel>

                            <asp:HiddenField ID="HFRowID" runat="server" />
                            <asp:HiddenField ID="HFTabID" runat="server" />

                        </div>
                            </div>
                        
                    </div>
                </div>
            </div>


            <%----END of Filter-----%>
        </div>
    </div>
</asp:Content>
