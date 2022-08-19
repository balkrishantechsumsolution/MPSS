<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="PGG2GDashboard.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.PG.PGG2GDashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
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

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }

        .table > tbody > tr > td {
            padding: 5px !important;
        }
        .disable {
            cursor: not-allowed;
            pointer-events: none;
        }

    </style>
    <script>

        $(document).ready(function () {

        });

        function GetDistrict123() {
            var SelIndex = "21";//$("#ddlState").val();
            debugger;
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
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/G2G/PG/PGAction.aspx";
            t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
            window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
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
            //var DistrictControl = "ddlDistrict";
            //GetDistrict("", "21", DistrictControl);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <asp:ScriptManager ID="Manager1" runat="server"></asp:ScriptManager>
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none;">
                        <div class="form-group">
                            <label class="manadatory" for="category">Application Type</label>
                            <asp:DropDownList ID="ddlCategory" runat="server" Width="95%" CssClass="form-control">
                                <asp:ListItem Selected="True" Text="-Select-" Value="0"></asp:ListItem>
                                <asp:ListItem Text="FORM-A" Value="403"></asp:ListItem>
                                <asp:ListItem Text="AgroFORM-A" Value="409"></asp:ListItem>
                                <asp:ListItem Text="FORM-B" Value="405"></asp:ListItem>
                                <asp:ListItem Text="AgroFORM-B" Value="428"></asp:ListItem>
                                <asp:ListItem Text="PG" Value="419"></asp:ListItem>
                                <asp:ListItem Text="Diploma" Value="430"></asp:ListItem>
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none;">
                        <div class="form-group">
                            <label class="manadatory" for="ddlDistrict">District</label>
                            <asp:DropDownList ID="ddlDistrict" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                        <div class="form-group">
                            <label class="manadatory" for="ddlVenue">Venue</label>
                            <asp:DropDownList name="ddlVenue" ID="ddlVenue" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">Select Venue</asp:ListItem>
                                <asp:ListItem Value="103">Irrigation Ground, Naraj, Cuttuck</asp:ListItem>
                                <asp:ListItem Value="104">Reserve Police Lines Grounds, Baxi Bazar, Cuttack</asp:ListItem>
                                <asp:ListItem Value="101">OSAP 6th Battalions, OMP Square (Ground -I), Cuttack</asp:ListItem>
                                <asp:ListItem Value="102">OSAP 6th Battalions, OMP Square (Ground -II), Cuttack</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>                   

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="" for="txtAppID">Department</label>
                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="" for="txtAppID">Course</label>

                            <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                <asp:ListItem Value="Regular" Text="Regular"></asp:ListItem>
                                <asp:ListItem Value="Self Financing" Text="Self Financing"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                        <div class="form-group">
                            <label class="" for="txtAppID">Programme</label>
                            <asp:UpdatePanel ID="updtPanel" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0" Text="-Select-"></asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlCourse"
                                        EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
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
                            <label class="manadatory" for="ddlStatus">Status</label>
                            <asp:DropDownList name="ddlStatus" ID="ddlStatus" CssClass="form-control" runat="server">
                                <asp:ListItem Value="P">Select Status</asp:ListItem>
                                <asp:ListItem Value="A">Approved</asp:ListItem>
                                <asp:ListItem Value="P">Pending</asp:ListItem>
                                <asp:ListItem Value="R">Rejected</asp:ListItem>
                                <asp:ListItem Value="S">Sent Back</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="Village">Subdistrict</label>
                            <asp:DropDownList ID="ddlTaluka" runat="server" AppendDataBoundItems="True" CssClass="form-control"
                                AutoPostBack="True" ToolTip="Select Subdistrict name (mandatory)">
                                <asp:ListItem>Select Subdistrict</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">Village</label>
                            <asp:DropDownList ID="ddlVillage" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select City or Town name (if doesnot exist select other)">
                                <asp:ListItem>Select Village / City / Town</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">Application ID</label>
                            <asp:TextBox ID="txt_AppID" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">Applicant's Name</label>
                            <asp:TextBox ID="txtApplicant" runat="server" CssClass="form-control" ToolTip=""></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none">
                        <div class="form-group">
                            <label class="" for="ddlGender">VLE Name (VLE ID)</label>
                            <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                                CssClass="form-control" ToolTip="Select VLE Name (VLE ID)">
                                <asp:ListItem>Select VLE Name (VLE ID)</asp:ListItem>
                            </asp:DropDownList>
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
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 text-right">
                        <div class="form-group">
                            <label class="" for="">
                                &nbsp;
                            </label>
                            <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-success"
                                Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>

                </div>
            </div>
        </div>
        <div>
            <div style="display: none;">
                <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="104">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/G2G/OUAT/AttendanceSheet_PG.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/G2G/OUAT/AttendanceSheet_PG.aspx" target="_blank">PG Attendance Sheet Generation</a>
                    <br />
                    <span>Download & Print Attendance Sheet Generation</span>

                </div>
                <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="105">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/G2G/OISF/ManualDistribution.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/G2G/OISF/ManualDistribution.aspx" target="_self">Issue of Manual Forms</a>
                    <br />
                    <span>Print the Offline / Manual Form</span>
                </div>
                <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="104">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/KIOSK/OUAT/OUATScrutiny.aspx?SvcID=403');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/KIOSK/OUAT/OUATScrutiny.aspx?SvcID=403" target="_blank">Scrutiny of Forms</a>
                    <br />
                    <span>Scrutiny the received forms</span>
                </div>
                <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="101">
                    <a href="#" onclick="javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="#" onclick="javascript:return ViewApplication();">ATTENDANCE SHEET</a>
                    <br />
                    <span>Generate Attendance Sheet on applied filter</span>
                </div>
                <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="104">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/G2G/OUAT/AttendanceSheetOUAT.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/G2G/OUAT/AttendanceSheetOUAT.aspx" target="_blank">Attendance Sheet Generation</a>
                    <br />
                    <span>Attendance Sheet Generation</span>

                </div>
                <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="104">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/G2G/OUAT/AttendanceSheet_AG.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/G2G/OUAT/AttendanceSheet_AG.aspx" target="_blank">Agro Attendance Sheet Generation</a>
                    <br />
                    <span>Agro Attendance Sheet Generation</span>

                </div>
                <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="102">
                    <a href="#" onclick="javascript:return RedirectToService('../Death/DeathForm.aspx?SvcID=104');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="#" onclick="javascript:return RedirectToService('/WebApp/Kiosk/OISF/AcknowledgeHistory.aspx');">MARKS ENTRY</a>
                    <br />
                    <span>Enter Physical Examination Marks</span>
                </div>
                <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="103">
                    <a href="/WebApp/G2G/OISF/ReportcountV2.aspx" target="_blank" onclick="javascript:return RedirectToService('');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" /></a>
                    <a href="/WebApp/G2G/OISF/ReportcountV2.aspx" target="_blank">REPORTS</a>
                    <br />
                    <span>Various reports</span>
                </div>
                <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/G2G/OUAT/OUATComplaintListDept.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/G2G/OUAT/OUATComplaintListDept.aspx">OUAT Complaint List</a>
                    <br />
                    <span>Click to View all OUAT Complaints</span>
                </div>
                <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/G2G/OUAT/OUATRefundPaymentList.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/G2G/OUAT/OUATRefundPaymentList.aspx">OUAT RefundPayment Detail</a>
                    <br />
                    <span>Click to View all OUAT Complaints</span>
                </div>
                <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="105">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/Kiosk/OUAT/AdmissionCard.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/Kiosk/OUAT/AdmissionCard.aspx" target="_self">UG/Agro Admission Letter</a>
                    <br />
                    <span>Searh Roll No to Issue Admission Letter</span>

                </div>
                <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="105">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/G2G/OUAT/AdmissionReport.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/G2G/OUAT/AdmissionReport.aspx" target="_self">Admission Report</a>
                    <br />
                    <span>Apply filter - Admission Reprot</span>

                </div>
                <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/G2G/OUAT/PGAdmissionCard.aspx');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                    </a><a href="/WebApp/G2G/OUAT/PGAdmissionCard.aspx">PG/PhD Admission Letter</a>
                    <br />
                    <span>Click to Issue Admission Letter to PG & PhD</span>
                </div>
                <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="">
                    <a href="#" onclick="javascript:return RedirectToService('/WebApp/G2G/PG/PGIntimation.aspx?SvcID=1452');">
                        <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;">
                    </a><a href="/WebApp/G2G/PG/PGintimation.aspx?SvcID=1452">Intimation Letter</a>
                    <br>
                    <span>Upload Intimation Letter for PG & M.Tech</span>
                </div>

                <div class="clearfix"></div>
            </div>

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
                            <asp:GridView ID="grdView" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                            </asp:GridView>
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
                        <asp:Button runat="server" class="btn btn-success " ID="btnExcel" OnClick="btnExcel_Click" Text="Export to Excel">
                            </asp:Button>
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
