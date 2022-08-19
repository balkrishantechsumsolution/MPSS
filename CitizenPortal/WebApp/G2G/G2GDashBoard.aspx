<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master"  AutoEventWireup="true" 
    CodeBehind="G2GDashBoard.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.G2GDashBoard" EnableEventValidation="false" %>

<%@ Register Src="~/WebApp/Control/G2GInfomation.ascx" TagPrefix="uc1" TagName="G2GInfomation" %>




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
        

       
    </style>
    <script>

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



            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '../Registration/KioskRegistration.aspx/GetState',
                data: '{"prefix": ""}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var arr = eval(response.d);
                    var html = "";
                    $("[id*=ddlState]").empty();
                    $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
                    $.each(arr, function () {
                        $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                    });

                },
                error: function (a, b, c) {
                    alert("1." + a.responseText);
                }
            });

            $("#ddlState").bind("change", function (e) { return GetDistrict(""); });
            $("#ddlDistrict").bind("change", function (e) { return GetSubDistrict(""); });
            $("#ddlTaluka").bind("change", function (e) { return GetVillage(""); });
            
        });

        function GetDistrict(category) {
            var SelIndex = $("#ddlState").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '../Registration/KioskRegistration.aspx/GetDistrict',
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
            var SelIndex = $("#ddlDistrict").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '../Registration/KioskRegistration.aspx/GetSubDistrict',
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
            debugger;
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/G2G/SU/SUAction.aspx";
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');            
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <%--<uc1:G2GInfomation runat="server" ID="G2GInfomation" />--%>
       
        
                <div>
            <div style="">

                <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="104">
                    <a href="#" onclick="javascript:return RedirectToService('WebApp/G2G/ServiceDetail.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/G2G/ServiceDetail.aspx" target="_blank">Pendency Report</a>
                    <br />
                    <span>Pendency Report</span>

                </div>         
                <div class="clearfix">
                </div>
            </div>

        </div>
         <%---Start of Filter----%>
       <div class="row" style="">
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
                            <%--<input id="txtFromDate" class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOB" type="text" value="" />--%>
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="txtToDate">
                                To Date
                            </label>
                            <%--<input id="txtToDate" class="form-control" placeholder="DD/MM/YYYY" name="DeceasedDOD" type="text" value="" />--%>
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display:none;">
                        <div class="form-group">
                            <label class="manadatory" for="category">
                                Category</label>
                            <%--<select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="category" name="Category">
                                <option value="Select Category">Select</option>
                                <option value="SC">SC</option>
                                <option value="ST">ST</option>
                                <option value="SEBC">SEBC</option>
                                <option value="UR">UR</option>
                            </select>--%>
                            <asp:DropDownList ID="ddlServices" runat="server" Width="95%" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">
                                District</label>
                            <%--<select name="ddlDistrict" id="ddlDistrict" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                <option value="0">Select District</option>
                            </select>--%>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="Village">
                                Subdistrict
                            </label>
                            <asp:DropDownList ID="ddlTaluka" runat="server" AppendDataBoundItems="True" CssClass="form-control"
                                AutoPostBack="True" ToolTip="Select Subdistrict name (mandatory)">
                                <asp:ListItem>Select Subdistrict</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Village
                            </label>
                            <asp:DropDownList ID="ddlVillage" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select City or Town name (if doesnot exist select other)">
                                <asp:ListItem>Select Village / City / Town</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
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

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: block">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Application ID
                            </label>
                            <asp:TextBox ID="txt_AppID" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">
                                Filter Count/Total Count
                            </label>
                            <label class="form-control" for="ddlGender" style="width: 160px; float: left;">
                                55 / 300
                            </label>
                            <a class="btn btn-darkorange green" style="float: right;" href="javascript:void(0);" title="Click to search the filtered record"><i class="fa fa-search"></i></a>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                        <div class="form-group">
                            <label>
                                &nbsp;</label><asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                    Text="Search" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>

                </div>
            </div>
        </div>
        <%----END of Filter-----%>
        

        <%---Start of Application Details----%>
        <div class="row">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">List of Application
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
                        </div>
                    </div>

                    <div class="text-center col-md-12 col-sm-12 col-xs-12" style="display:none;">

                        <ul class="pagination">

                            <li class="col-md-3 col-sm-3 text-center">
                                <label for="TotalRecords">Total Records</label>
                                <label id="lblTotalRecords" runat="server" for="TotalRecords"></label>
    <input type="hidden" id="TotalRecords" name="TotalRecords" value="2" /></li>
                            <li class="col-md-3 col-sm-2 text-center">
                                <label for="CurrentPage">Page:</label>
                                1
    <input type="hidden" id="CurrentPage" name="CurrentPage" value="1" />
                                <label for="TotalPages">of</label>
                                1
                            </li>

                            <li class="col-md-4 col-sm-5 text-center">
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


                                <input class="form-control text-align-center" data-val="true" data-val-number="The field PageSize must be a number."  placeholder="Search..." data-val-required="The PageSize field is required." id="PageSize" name="PageSize" type="text" value="" autocomplete="off"/>
                                <div class="clearfix"></div>

                            </li>
                            <div class="clearfix"></div>
                        </ul>

                    </div>
                    <div class="clearfix">
                    </div>
                </div>


            </div>
        </div>
        <%----END of Application Details-----%>
    </div>
</asp:Content>
