<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Master/G2G.Master" AutoEventWireup="true" CodeBehind="ServiceDetail.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.ServiceDetail" EnableEventValidation="false" %>


<%@ Register Src="~/WebApp/Control/G2GInfomation.ascx" TagPrefix="uc1" TagName="G2GInfomation" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <script src="../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="../../Scripts/jquery.msgBox.js"></script>
    <link href="../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="../../Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="../../PortalScripts/ServiceLanguage.js"></script>
    <link href="../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />

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

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
    <script>

        $(document).ready(function () {

            $('#txtFromDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0",
                onSelect: function (date) {

                    var t_DOD = $("#txtFromDate").val();

                    var S_date = new Date(t_DOD.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    var selectedYear = S_date.getFullYear(); // selected year


                }
            });

            $('#txtToDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0",
                onSelect: function (date) {

                    var t_DOB = $("#txtToDate").val();

                    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    var selectedYear = S_date.getFullYear(); // selected year


                }
            });

            GetDistrict("");

            $("#ddlDistrict").bind("change", function (e) { return GetSubDistrict(""); });
            //$("#ddlTaluka").bind("change", function (e) { return GetVillage(""); });

        });

        function GetState() {
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
        }

        function GetDistrict(category) {
            var SelIndex = $("#ddlState").val();
            var SelIndex = '3';
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
            //$("#ddlDistrict").bind("change", function (e) { return GetSubDistrict(""); });
            //$("#ddlTaluka").bind("change", function (e) { return GetVillage(""); });

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
            var t_URL = "../Common/HTML2PDF/HTMLToPdf.aspx";
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

        function TakeAction(p_URL, p_ServiceID, p_AppID) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "G2GAction.aspx";
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            return false;
        }

        function ValidateService() {

            var selValue = $("#ddlService option:selected").val();

            if (selValue == "0") {
                alert("Please Select Service to continue.");
                return false;
            }

            return true
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <%--<uc1:G2GInfomation runat="server" ID="G2GInfomation" />--%>
                <%---Start of Filter----%>
                <uc1:FormTitle runat="server" ID="FormTitle" />
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Search Filter
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlGender">
                                        Service Name
                                    </label>
                                    <asp:DropDownList ID="ddlService" runat="server"
                                        CssClass="form-control" ToolTip="Select Service">
                                        <asp:ListItem>Select Service</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <%--<asp:Label ID="lblDeptName" runat="server" Text="Label"></asp:Label>--%>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                                <div class="form-group">
                                    <label class="" for="ddlYearTerm">
                                        From Date
                                    </label>
                                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control"></asp:TextBox>
                                    <%--<asp:CalendarExtender ID="txt_FromDate_CalendarExtender" runat="server" Enabled="True"
                                Format="dd/MM/yyyy" TargetControlID="txt_FromDate">
                            </asp:CalendarExtender>--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                                <div class="form-group">
                                    <label class="" for="Village">
                                        To Date
                                    </label>
                                    <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control"></asp:TextBox>
                                    <%--<asp:CalendarExtender ID="txt_ToDate_CalendarExtender" runat="server" Enabled="True"
                                Format="dd/MM/yyyy" TargetControlID="txt_ToDate">
                            </asp:CalendarExtender>--%>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                                <div class="form-group">
                                    <label class="" for="district">
                                        District 
                                    </label>
                                    <asp:DropDownList ID="ddlDistrict" runat="server"
                                        CssClass="form-control" ToolTip="Select the District name (mandatory)">
                                        <asp:ListItem Text="Select District" Value="0"> </asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                                <div class="form-group">
                                    <label class="" for="Village">
                                        Subdistrict
                                    </label>
                                    <asp:DropDownList ID="ddlTaluka" runat="server" CssClass="form-control"
                                        ToolTip="Select Subdistrict name (mandatory)">
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
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                                <div class="form-group">
                                    <label class="" for="ddlGender">
                                        Application ID
                                    </label>
                                    <asp:TextBox ID="txt_AppID" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                <div class="form-group">
                                    <label class="" for="ddlGender">
                                        &nbsp;</label><asp:Button ID="btnSearch" CssClass="btn btn-primary" Style="float: right;" runat="server" Text=" Search" OnClick="btnSearch_Click" OnClientClick="return ValidateService();" />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%----END of Filter-----%>
                <%---Start of Application Details----%>
                <div class="row" id="divDetails" runat="server" visible="false">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Service Details
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
<%--                                <div class="form-group">
                                    <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound" AutoGenerateColumns="false">
                                    </asp:GridView>
                                </div>--%>
                                <div class="box-body box-body-open p0" >
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                                        <div class="form-group p0">
                                            <asp:GridView ID="grdViewSummary" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound" AutoGenerateColumns="false">
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                                <div class="box-body box-body-open p0" style="height: 550px; overflow: auto;">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 p0">
                                        <div class="form-group p0">
                                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound" AutoGenerateColumns="false">
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                                <ul class="pagination">

                                    <li class="col-md-3 col-sm-3 text-left">
                                        <label for="TotalRecords">Total Records : </label>
                                        <label id="lblTotalRecords" runat="server" for="TotalRecords"></label>
                                        <input type="hidden" id="TotalRecords" name="TotalRecords" value="2" /></li>
                                    <li class="col-md-2 col-sm-2 text-left">
                                        <label for="CurrentPage">Page:</label>
                                        1
    <input type="hidden" id="CurrentPage" name="CurrentPage" value="1" />
                                        <label for="TotalPages">of</label>
                                        1
                                    </li>

                                    <li class="col-md-4 col-sm-4 text-left">
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
                                    <li class="col-md-3 col-sm-3">
                                        <input class="form-control text-align-center" placeholder="Search Text" id="txtSearch" name="PageSize" type="text" value="" autocomplete="off" />
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
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />
</asp:Content>
