<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CitizenPortal.WebApp.Entrance.Login.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $('#divLogin').show();
            $('#side-menu').show();
            $('#divEvent').hide();
        });
    </script>
    <script>
        var baseUrl = "<%= Page.ResolveUrl("~/") %>";
        function RedirecteKYC(p_URL) {
            debugger;
            window.location.href = p_URL + "?UID=" + $("#HFUID").val();
            //alert(p_URL + "&UID=" + $("#HFUID").val());
            return false;
        }
        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }

        function getQueryStrings() {
            var assoc = {};
            var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
            var queryString = location.search.substring(1);
            var keyValues = queryString.split('&');

            for (var i in keyValues) {
                var key = keyValues[i].split('=');
                if (key.length > 1) {
                    assoc[decode(key[0])] = decode(key[1]);
                }
            }

            return assoc;
        }


        function ShowAction(p_ServiceID, p_AppID) {
            debugger;

            var t_URL = "/WebApp/Kiosk/Forms/AppRedirect.aspx";
            //var qs = getQueryStrings();
            //var UID = qs["UID"];

            //if (p_PaymentStatus == "P") {
            if (p_AppID != "") {
                t_URL = "/WebApp/Kiosk/Forms/ActionDetails.aspx";
                //t_URL = p_AckURL;
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
                window.location.href = t_URL;

            }
            else {
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
                //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
                window.location.href = t_URL;

            }
            return false;
        }


        function TakeAction(p_ServiceID, p_AppID, p_PaymentStatus, p_AckURL) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/Forms/AppRedirect.aspx";

            var qs = getQueryStrings();
            var UID = qs["UID"];

            //if (p_PaymentStatus == "P") {
            if (p_AckURL != "") {

                t_URL = p_AckURL;
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
                window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');

            }
            else {
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
                //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
                window.location.href = t_URL;

            }

            return false;
        }
    </script>
    <style>
        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 32.3%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #337ab7;
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
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>

                <div class="row" >
                    <asp:Panel ID="pnlMenu" runat="server"></asp:Panel>

                </div>



                <div class="row mt20" >
                    <div class=""style="">
                        <div class="resp-tabs-container">
                            <div style="min-height: 4.66em; z-index: -760;display:none" class="SrvDiv" id="104">
                                    <a href="/Account/Login" onclick="javascript:return RedirectToService('/Download/CSVTU Result Report Ph. D. Entrance Exam 2020.pdf');">
                                        <img src="/Sambalpur/img/DigiVarsity.png" alt="" align="left" style="height: 70px;" />
                                    </a><a href="/Download/CSVTU Result Report Ph. D. Entrance Exam 2022.pdf" target="_blank">Ph. D Result </a>
                                    <br />
                                    <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to View Result of Entrance</span><br />
                                    <span>PhD Entrance Result</span>
                                </div>
                                <div style="min-height: 4.66em; z-index: -760;display:none" class="SrvDiv" id="101">
                                    <a href="/Account/Login" onclick="javascript:return RedirectToService('/WebApp/Kiosk/Forms/Attachment.aspx');">
                                        <img src="/Sambalpur/img/DigiVarsity.png" alt="" align="left" style="height: 70px;" />
                                    </a><a href="/WebApp/Kiosk/Forms/Attachment.aspx">Document Briefcase</a>
                                    <br />
                                    <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to Upload Document</span><br />
                                    <span>Attach Necessary Document</span>
                                </div>
                                <div style="min-height: 4.66em; z-index: -760;display:none" class="SrvDiv" id="102">
                                    <a href="/Account/Login" onclick="javascript:return RedirectToService('/WebApp/Kiosk/Forms/ConfirmPayment.aspx');">
                                        <img src="/Sambalpur/img/DigiVarsity.png" alt="" align="left" style="height: 70px;" />
                                    </a><a href="/WebApp/Kiosk/Forms/ConfirmPayment.aspx">Make Payment </a>
                                    <br />
                                    <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to Pay Entrance Fees</span><br />
                                    <span>for Online Applicant</span>
                                </div>
                                <div style="min-height: 4.66em; z-index: -760;display:none" class="SrvDiv" id="103">
                                    <a href="/Account/Login" onclick="javascript:return RedirectToService('/WebApp/Kiosk/Forms/Acknowledgement.aspx');">
                                        <img src="/Sambalpur/img/DigiVarsity.png" alt="" align="left" style="height: 70px;" />
                                    </a><a href="/WebApp/Kiosk/Forms/Acknowledgement.aspx">Acknowledgement </a>
                                    <br />
                                    <span style="font-size: 12px !important; font-weight: bold !important; color: black !important;">Click to View Filled Application</span><br />
                                    <span>Acknowledgement of Filled Application</span>
                                </div>
                        </div>

                    </div>
                    <div class="row">
                        
                        <%-- Start of Transaction List --%>
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-lg-8">
                                            <i class="fa fa-tasks fa-fw"></i>Transaction Details
                                        </div>
                                        <div class="col-lg-4 text-right">
                                            <div class="dataTables_filter" id="dataTables-example_filter">
                                                <%--<input aria-controls="dataTables-example" placeholder="Search" class="form-control input-sm" type="search" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <div class="dataTable_wrapper">
                                        <div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTables-example_wrapper">
                                            <div class="">
                                                <div class="" style="overflow: scroll; height: 200px;">
                                                    <asp:GridView ID="gridview" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <!-- /.table-responsive -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                            <!-- /.panel -->
                        </div>
                        <%--- End of Transaction List ---%>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
