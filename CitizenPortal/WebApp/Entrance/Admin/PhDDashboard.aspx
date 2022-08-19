<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="PhDDashboard.aspx.cs" Inherits="CitizenPortal.WebApp.Entrance.PhD.PhDDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
 <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
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
            width: 30.1%;
            margin: 1.5%;
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

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }

        .table > tbody > tr > td {
            padding: 5px !important;
        }
    </style>
    <script>

        $(document).ready(function () {
            
            var table = $("table[id$='grdView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100], [10, 50, 100]],
                    "iDisplayLength": 100
                });
        });


        var baseUrl = "<%= Page.ResolveUrl("~/") %>";
        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }

        function ViewDoc(p_URL, p_ServiceID, p_AppID) {
            //var t_URL = ResolveUrl(p_URL);
            if (p_ServiceID == '101') {
                var t_URL = "../Common/HTML2PDF/HTMLToPdf.aspx";
            } else if (p_ServiceID == '103')
            { var t_URL = "../Kiosk/Birth/Preview.aspx"; }
            else if (p_ServiceID == '104') {
                var t_URL = "../Kiosk/Death/Preview.aspx";
            }
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

        function TakeAction(p_URL, p_ServiceID, p_AppID) {
            var t_URL = ResolveUrl(p_URL);          
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

        function ViewOutput(p_URL, p_ServiceID, p_AppID) {
            debugger;
            var t_URL = "";
            var t_AppID = "", t_ServiceID = "";
            t_AppID = p_AppID;
            t_ServiceID = p_ServiceID;

            t_URL = "/WebApp/Kiosk/RD/SeniorCitizenIDCard.aspx?";
           
            t_URL = t_URL + "SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            t_URL = ResolveUrl(t_URL);
            //CreateDialog(t_URL, "");
            window.open(t_URL, 'ViewDoc', 'top=10,left=10,height=500,width=900,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }


        $(document).ready(function () {
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <asp:ScriptManager ID="Manager1" runat="server"></asp:ScriptManager>
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            
        </div>
        <%--<uc1:G2GInfomation runat="server" ID="G2GInfomation" />--%>
        <%---Start of Filter----%>
        <div class="row mt20" style="">             
           
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
                            <label class="manadatory" for="txtToate">
                                To Date
                            </label>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                        </div>
                    </div>

                     <div id="DivDistrict" runat="server" class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: block;">
                        <div class="form-group">
                            <label class="" for="ddlReserchCenter">Research Center</label>
                            <asp:DropDownList ID="ddlReserchCenter" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlReserchCenter_SelectedIndexChanged">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>                                
                            </asp:DropDownList>
                        </div>
                    </div>
                    
                    <div id="Div1" runat="server" class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: block;">
                        <div class="form-group">
                            <label class="" for="ddlDiscipline">Discipline</label>
                            <asp:DropDownList ID="ddlDiscipline" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlDiscipline_SelectedIndexChanged">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>                                
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div id="Div2" runat="server" class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: block;">
                        <div class="form-group">
                            <label class="" for="ddlSpecilization">Specilization</label>
                            <asp:DropDownList ID="ddlSpecilization" runat="server" CssClass="form-control" AutoPostBack="True">
                                <asp:ListItem Text="--Select--" Value="0"></asp:ListItem>                                
                            </asp:DropDownList>
                        </div>
                    </div>

                   
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Service Name
                            </label>
                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select City or Town name (if doesnot exist select other)">
                                <asp:ListItem>Select Service</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="">
                        <div class="form-group">
                            <label class="manadatory" for="ddlStatus">Status</label>
                            <asp:DropDownList name="ddlStatus" ID="ddlStatus" CssClass="form-control" runat="server">
                                <asp:ListItem Value="">Select Status</asp:ListItem>
                                <asp:ListItem Value="">All</asp:ListItem>
                                <asp:ListItem Value="0">Pending</asp:ListItem>
                                <asp:ListItem Value="N">Entrance Not Exempted</asp:ListItem>
                                <asp:ListItem Value="P">Entrance Exempted</asp:ListItem>
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="" for="txtAppID">Mobile No.</label>
                            <asp:TextBox runat="server" ID="txtMobile" class="form-control" placeholder="Mobile No" name="txtMobileNo" MaxLength="10" onkeypress="return isNumberKey(event);"
                                type="text" value=""></asp:TextBox>
                        </div>
                    </div>                    
                    
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                        <div class="form-group">
                            <label class="" for="">
                                &nbsp;
                            </label>
                            <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                Text="Search" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>

                </div>
            </div>
        </div>
        <div>
           

        </div>
        <div class="mt10"></div>
        <%----END of Filter-----%>
        <%---Start of Application Details----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">List of Application
                    </h4>
                </div>
                <div class="box-body box-body-open p0" style="height: 550px; overflow: auto;">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                        <div class="form-group p0">
                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true"  CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            
        </div>
        <div style="margin-bottom: 100px;"></div>
        <%----END of Application Details-----%>
        
    </div>
</asp:Content>
