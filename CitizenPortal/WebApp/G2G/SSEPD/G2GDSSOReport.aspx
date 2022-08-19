<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="G2GDSSOReport.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SSEPD.G2GDSSOReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
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
    <script>

        $(document).ready(function () {
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

                //var DistrictControl = "ddlDistrict";
                //GetDistrict("", "21", DistrictControl);
                //GetDistrict("21");
            });
        });

        function GetDistrict(category) {
            debugger;
            var SelIndex = "21";//$("#ddlState").val('21');

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("[id=ddlDistrict]").empty();
                    $("[id=ddlDistrict]").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        $("[id=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        catCount++;
                    });


                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });

        }

        function GetSubDistrict(category) {
            debugger;
            var SelIndex = $("#ddlDistrict").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("[id=ddlTaluka]").empty();
                    $("[id=ddlTaluka]").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        $("[id=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        catCount++;
                    });


                },
                error: function (a, b, c) {
                    alert("3." + a.responseText);
                }
            });

        }

        function GetVillage(category) {
            var SelIndex = $("#ddlTaluka").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '../Registration/KioskRegistration.aspx/GetVillage',
                data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("[id=ddlVillage]").empty();
                    $("[id=ddlVillage]").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        $("[id=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        catCount++;
                    });                    

                },
                error: function (a, b, c) {
                    alert("4." + a.responseText);
                }
            });

        }


        var baseUrl = "<%= Page.ResolveUrl("~/") %>";

        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }

      
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <asp:ScriptManager ID="MManeger" runat="server"></asp:ScriptManager>
<div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
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
                            <label for="txtFromDate">
                                From Date
                            </label>                          
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY" onkeydown="return true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label for="txtToDate">
                                To Date
                            </label>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                        </div>
                    </div>
                   
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="ddlService">Service List</label>
                            <asp:DropDownList ID="ddlService" runat="server" Width="95%" CssClass="form-control" required="true" title="Please Select Service">
                                <asp:ListItem Selected="True" Text="-Select-" Value=""></asp:ListItem>
                                <asp:ListItem Text="Indira Gandhi National Disabled Pension Scheme (IGNDP)" Value="108"></asp:ListItem>
                                <asp:ListItem Text="Indira Gandhi National Old Age Pension Scheme (IGNOAP)" Value="109"></asp:ListItem>
                                <asp:ListItem Text="Indira Gandhi National Widow Pension Scheme (IGNWP)" Value="107"></asp:ListItem>
                                <asp:ListItem Text="Madhu Babu Pension Yojana (MBPY)" Value="106"></asp:ListItem>
                                <asp:ListItem Text="National Family Benefit Scheme (NFBS)" Value="105"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>                
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="state">
                                State
                            </label>
                            <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" CssClass="form-control"
                                ToolTip="Select the State name (mandatory)">
                                <asp:ListItem Text="Select State" Value="0"> </asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: block;">
                        <div class="form-group">
                            <label for="ddlDistrict">District</label>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="ddlDistrict_TextChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: block">
                        <div class="form-group">
                            <label class="" for="state">
                                Block
                            </label>
                            <asp:UpdatePanel ID="updateblock" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlTaluka" runat="server" CssClass="form-control"
                                ToolTip="Select the State name (mandatory)">
                                <asp:ListItem Text="Select Block" Value="0"> </asp:ListItem>
                            </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlDistrict" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                            
                        </div>
                    </div>
                     <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:block;">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Application Status
                            </label>
                            <asp:DropDownList ID="ddlStatus" runat="server" AppendDataBoundItems="True"
                                CssClass="form-control" ToolTip="Select Status">
                                <asp:ListItem>-Select Status-</asp:ListItem>
                                <asp:ListItem Value="P">Pending</asp:ListItem>
                                <asp:ListItem Value="A">Approved</asp:ListItem>
                                <asp:ListItem Value="R">Rejected</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none;">
                        <div class="form-group">
                            <label class="" for="txtAppID">Reference ID</label>
                            <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Reference ID" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                type="text" value=""></asp:TextBox>
                        </div>
                    </div>
                   
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">Filter Count/Total Count</label>
                            <label class="form-control" for="ddlGender" style="width: 160px; float: left;">
                                55 / 300
                            </label>
                            <a class="btn btn-darkorange green" style="float: right;" href="javascript:void(0);" title="Click to search the filtered record"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 text-right">
                        <div class="form-group">
                            <label class="" for="">
                                &nbsp;
                            </label>
                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success"
                                Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>

                </div>
            </div>
        </div>
        <div>           
             
        </div>
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
                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" AutoGenerateColumns="false" EnableEventValidation="false"
                                CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="Reference ID" HeaderText="Reference ID" />
                                <asp:BoundField DataField="Application Date" HeaderText="Application Date" />
                                <asp:BoundField DataField="Service" HeaderText="Service" />
                                <asp:BoundField DataField="Applicant Name" HeaderText="Applicant Name" />
                                <asp:BoundField DataField="District Name" HeaderText="District Name" />
                                <asp:BoundField DataField="Block Name" HeaderText="Block Name" />
                            </Columns>
                            </asp:GridView>
                            <center>
                                 <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                            </center>
                           
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
            <div class="text-center col-md-12 col-sm-12 col-xs-12">
                <ul class="pagination">
                    <li class="col-md-2 col-sm-2 text-center">
                        <label for="TotalRecords">Total Records</label>
                        <label id="lblTotalRecords" runat="server" for="TotalRecords"></label>
                        <input type="hidden" id="TotalRecords" name="TotalRecords" value="2" /></li>
                    <li class="col-md-2 col-sm-2 text-center">
                        <label for="CurrentPage">Page:</label>
                        1
                                <input type="hidden" id="CurrentPage" name="CurrentPage" value="1" />
                        <label for="TotalPages">of</label>
                        1
                    </li>
                    <li class="col-md-4 col-sm-4 text-center">
                        <input type="hidden" id="TotalPages" name="TotalPages" value="1" />
                        <button class="btn btn-primary " type="submit" id="btnFirst" name="Command" value="First" disabled="disabled">
                            First</button>
                        <button class="btn btn-default " type="submit" id="btnPrevious" name="Command" value="Previous" disabled="disabled">
                            Previous</button>
                        <button class="btn btn-default " type="submit" id="btnNext" name="Command" value="Next" disabled="disabled">
                            Next</button>
                        <button class="btn btn-primary " type="submit" id="btnLast" name="Command" value="Last" disabled="disabled">
                            Last</button>
                        <button class="btn btn-success " type="submit" id="btnRefresh" name="Command" style="display: none" value="Refresh">
                            Refresh</button>
                    </li>
                    <li class="col-md-2 col-sm-2">
                        <input class="form-control text-align-center" data-val="true" data-val-number="The field PageSize must be a number." placeholder="Search..." data-val-required="The PageSize field is required." id="PageSize" name="PageSize" type="text" value="" autocomplete="off" />
                        <div class="clearfix"></div>
                    </li>
                    <li class="col-md-2 col-sm-2">
                        <asp:Button ID="btnExcel" runat="server" CssClass="btn btn-success"
                            Text="Export to Excel" Enabled="false" OnClick="btnExcel_Click" />
                        <div class="clearfix"></div>
                    </li>
                    <div class="clearfix"></div>
                </ul>
            </div>
        </div>
        <div style="margin-bottom: 100px;"></div>
        <%----END of Application Details-----%>
    </div>

</asp:Content>