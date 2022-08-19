<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true" CodeBehind="CitizenTransactionDetail.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.CitizenTransactionDetail" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/DesignatedOfficer.ascx" TagPrefix="uc1" TagName="DesignatedOfficer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <script src="Js/jquery.dataTables.min.js"></script>
    <script src="Js/jqueryDataTableButtons-1.2.4.js"></script>
    <script src="../../Scripts/ValidationScript.js"></script>
    <script src="../../Scripts/AddressScript.js"></script>
    <script src="../../Scripts/OfficeOfficer.js"></script>
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>

    <link href="Css/dataTables.jqueryui.min.css" rel="stylesheet" />
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="Css/jQueryDataTableButtons.css" rel="stylesheet" />

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

        function TakeAction(p_ServiceID, p_AppID, p_PaymentStatus, p_AckURL) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/Forms/AppRedirect.aspx";

            var qs = getQueryStrings();
            var UID = qs["UID"];

            //if (p_PaymentStatus == "P") {
            if (p_AckURL != "") {

                t_URL = p_AckURL;
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
                window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');

            }
            else {
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
                //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
                window.location.href = t_URL;

            }

            return false;
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            var table = $("table[id$='DataGridView']").DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100, -1], [10, 50, 100, "All"]],
                    "iDisplayLength": 10
                });

            $("table[id$='DataGridView'] thead th").each(function () {
                var title = $("table[id$='DataGridView'] thead th").eq($(this).index()).text();
                $(this).html('<input type="text" placeholder="' + title + '" />');
            });

            table.columns().every(function () {
                var dataTableColumn = this;
                var searchTextBoxes = $(this.header()).find('input');
                searchTextBoxes.on('keyup change', function () {
                    dataTableColumn.search(this.value).draw();
                });

                searchTextBoxes.on('click', function (e) {
                    e.stopPropagation();
                });
            });
        });
    </script>

    <style type="text/css">
        .fldupload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            font-size: 200px !important;
            direction: ltr;
            cursor: pointer;
        }

        .fldupload {
            width: 100px;
            height: 30px;
        }

        .pagination {
            border: 0;
            margin: 0;
        }

            .pagination > li > a, .pagination > li > span {
                padding: 2px 5px;
            }

        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
        }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
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
                <div class="row" style="display: none">
                    <uc1:FormTitle runat="server" ID="FormTitle" />
                </div>
                <div class="row mt20">
                    <div class="row">
                        <div class="col-lg-12 box-container">
                            <div class="box-heading">
                                <h4 class="box-title ng-binding">Application Details</h4>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="dataTable_wrapper">
                                        <div class="dataTables_wrapper form-inline dt-bootstrap no-footer divwidth" id="dataTables-example_wrapper">
                                            <div class="">
                                                <div class="" style="height: 400px;">
                                                    <asp:GridView ID="DataGridView" OnPreRender="DataGridView_PreRender" runat="server" OnRowDataBound="DataGridView_RowDataBound"></asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <i class="fa fa-tasks fa-fw"></i>Document List
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="">
                                        <table style="width: 100%" class="table table-striped table-bordered">
                                            <tbody>
                                                <tr>
                                                    <th style="text-align: center;">
                                                        <label class="" for="txtSlNo">Sl. No.</label>
                                                    </th>
                                                    <th style="text-align: center;">
                                                        <label class="" for="">
                                                            Document Description</label>
                                                    </th>
                                                    <th style="text-align: center;">
                                                        <label for="">
                                                            Service</label>
                                                    </th>
                                                    <th style="text-align: center; width: 190px">
                                                        <label for="txtContact">
                                                            Uploaded Date</label>
                                                    </th>
                                                    <th style="text-align: center;">
                                                        <label class="" for="txtRemark">
                                                            View</label>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center;" colspan="5">No Document Uploaded
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <asp:GridView ID="grdDoc" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered">
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--  --%>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />
</asp:Content>
