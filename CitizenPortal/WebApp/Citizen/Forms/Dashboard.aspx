<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" ClientIDMode="Static" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.Dashboard" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/DesignatedOfficer.ascx" TagPrefix="uc1" TagName="DesignatedOfficer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
    <script src="../../Scripts/ValidationScript.js"></script>
    <script src="../../Scripts/AddressScript.js"></script>
    <%--<script src="../../Scripts/OfficeOfficer.js"></script>--%>
    <script>
        $(document).ready(function () {
            $('#costumModal10').modal('hide');
        });

        var baseUrl = "<%= Page.ResolveUrl("~/") %>";
        function RedirecteKYC(p_URL) {
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
            } else if (p_ServiceID == '103') { var t_URL = "../Kiosk/Birth/Preview.aspx"; }
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

        function RedirectToPage(p_Page) {
            debugger;
            var qs = getQueryStrings();
            var UID = qs["UID"];

            if (p_Page == "1") {
                //View/Edit Profile
                t_URL = "" + "?UID=" + UID;
            }
            else if (p_Page == "2") {
                //View Briefcase
                t_URL = "CitizenBriefcase.aspx" + "?UID=" + UID;
            }
            else if (p_Page == "3") {
                //Apply for Service
                t_URL = "" + "?UID=" + UID;
            }
            else if (p_Page == "4") {
                //View Transactions
                t_URL = "" + "?UID=" + UID;
            }
            else if (p_Page == "5") {
                t_URL = "/WebApp/Kiosk/BackExam/EditSubject.aspx" + "?UID=" + UID + "&UserID=" + $('#HFRollNo').val();
            }

            //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            //window.location.href = t_URL;
            //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + //',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            //window.location.href = t_URL;


            window.open(t_URL, 'ViewDoc', 'left=100,top=100,height=500,width=1200,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=no');
            window.focus();
            return false;


        }

        function ShowAction(p_ServiceID, p_AppID) {
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

        function ServiceAction(p_URL, ID) {
            var t_URL = p_URL.replaceAll('|', '&')
            window.location.href = t_URL;
        }

        function TakeAction(p_ServiceID, p_AppID, p_PaymentStatus, p_AckURL) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/Forms/AppRedirect.aspx";

            var qs = getQueryStrings();
            var UID = qs["UID"];

            if (p_ServiceID == "1468" && p_PaymentStatus == "N") {

                t_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID + "&PayFlag=" + p_PaymentStatus;
                //window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');
                window.location.href = t_URL;
            }

            if (p_ServiceID == "1468" && p_PaymentStatus == "P") {

                t_URL = "/WebApp/Kiosk/Forms/Acknowledgement.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID + "&PayFlag=" + p_PaymentStatus;
                //window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');
                window.location.href = t_URL;
            }

            if (p_ServiceID == "1468" && p_PaymentStatus == "U") {

                t_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID + "&PayFlag=" + p_PaymentStatus;
                //window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');
                window.location.href = t_URL;
            }

            if (p_ServiceID == "1467" && p_PaymentStatus == "U") {

                t_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID + "&PayFlag=" + p_PaymentStatus;
                //window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');
                window.location.href = t_URL;
            }
            if ((p_ServiceID == "1470") && (p_PaymentStatus == "U")) {
                t_URL = "";
                t_URL = "/WebApp/Kiosk/Forms/Attachment.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID + "&PayFlag=" + p_PaymentStatus;
                //window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');
                window.location.href = t_URL;
                return false;
            }

            if (p_ServiceID == "1467" && p_PaymentStatus == "P") {

                t_URL = "/WebApp/Kiosk/Forms/Acknowledgement.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID + "&PayFlag=" + p_PaymentStatus;
                //window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');
                window.location.href = t_URL;
            }
            if ((p_ServiceID == "1469" || p_ServiceID == "1470" || p_ServiceID == "1471" || p_ServiceID == "1472") && (p_PaymentStatus == "U")) {

                t_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID + "&PayFlag=" + p_PaymentStatus;
                //window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');
                window.location.href = t_URL;
            }

            if ((p_ServiceID == "1469" || p_ServiceID == "1470" || p_ServiceID == "1471" || p_ServiceID == "1472") && (p_PaymentStatus == "P")) {

                t_URL = "/WebApp/Kiosk/Forms/Acknowledgement.aspx";
                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID + "&PayFlag=" + p_PaymentStatus;
                //window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');
                window.location.href = t_URL;
            }
            ////if (p_PaymentStatus == "P") {
            //if (p_AckURL != "") {

            //    t_URL = p_AckURL;
            //    t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
            //    window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');

            //}
            //else {
            //    t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
            //    //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            //    window.location.href = t_URL;

            //}

            return false;
        }

        function TakePrint(p_RollNo, p_Semester, p_Action, p_URL) {
            debugger;
            var t_URL = "";//p_URL.replace("|", "&").replace("|", "&").replace("|", "&").replace("#", "&");

            //var regex = /|/ig;
            t_URL = p_URL.replaceAll('|', '&');
            if (p_Action == "Admit Card")
            { window.open(t_URL, 'Amit Card', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100'); }
            else {
                window.location.href = t_URL;
            }
        }
        function TakePrint_old(p_ServiceID, p_UID, p_RollNo, p_AckURL) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/Forms/AppRedirect.aspx";

            var qs = getQueryStrings();
            var UID = qs["UID"];

            //if (p_PaymentStatus == "P") {
            if (p_AckURL != "") {

                t_URL = p_AckURL;
                t_URL = t_URL + "?AppID=" + p_RollNo + "&SvcID=" + p_ServiceID + "&UID=" + UID;
                window.open(t_URL, 'ViewDoc', 'height=550,width=850,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes,top=50,left=100');

            }
            else {
                t_URL = t_URL + "?AppID=" + p_RollNo + "&SvcID=" + p_ServiceID + "&UID=" + UID;
                //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
                window.location.href = t_URL;

            }

            return false;
        }

        function TakeAction1(T_URL, ID) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/MigrationSU/MigrationSU.aspx";
            t_URL = t_URL + "?UID=" + ID;
            //window.open(t_URL, 'ViewDoc', 'height=500px,width=700px,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            //return false;
            window.location.href = t_URL;
        }

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

        .SrvDiv {
            background-color: #FCE9D1;
            border: solid 1px #F9D0A1;
            color: #045abc;
            width: 25%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #B65838;
            min-height: 2.66em;
            z-index: -760;
            line-height: 20px;
        }

            .SrvDiv a {
                color: maroon;
                font-size: .9em;
                text-decoration: none;
                /*font-weight: bold;*/
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
                height: 45px;
                width: 50px;
                background-image: url('/webapp/kiosk/CBCS/img/sambalpur-university-logo.png');
                background-repeat: no-repeat;
                background-size: 49px 44px;
                border: 0;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 5px 0 0 0;
                color: #212121;
                font-size: .65em;
                font-weight: bold;
            }

        .table > tbody > tr > th {
            padding: 5px !important;
            text-align: center;
            vertical-align: middle !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;
    <%--Notice Board Modal START Here--%>
    <div id="costumModal10" class="modal" tabindex="-1" role="dialog" aria-labelledby="costumModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 80%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="opacity: 1 !important; color: #B65838 !important; font-size: 2.4em !important;">
                        ×
                    </button>
                    <h4 class="modal-title"><i class="fa fa-newspaper-o fa-fw" style="font-size: 0.9em; vertical-align: middle;"></i> Notice / Instruction
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table cellpadding="0" cellspacing="0" class="table table-bordered" style="height: 250px; overflow: scroll;">
                            <thead>
                                <tr>
                                    <th><b>S. No.</b></th>
                                    <th><b>Date & Time</b></th>
                                    <th><b>Title</b></th>
                                    <th><b>Details</b></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1.</td>
                                    <td>07-07-2022<br />
                                        7:10 PM</td>
                                    <td>Printing Instruction</td>
                                    <td>Dear Student,<br />
                                            We’ve provided “Print” button for Printing Semester Examination Admit Card, Acknowledgement, Receipt, Migration Certificate, Provisional Certificate, etc (where ever the page print is required).
                                            Please use the “Print” button on the page proper alignment.
                                            Please insure below setting in print dialog box while printing:
                                              a. The <b>Paper Size</b> should be <b>“A4”</b>
                                              b. Page <b>Margins</b> should be <b>“Default”</b>>
                                              c. <b>Scale</b> size should be <b>“Default”</b> (100%)
                                              d. <b>Background graphics</b> (watermark) should be <b>Checked</b>
                                              e. <b>Headers & Footers</b> should be <b>Unchecked</b>
                                            In case of any issue you may drop an email at “” or submit a grievance through Help Desk link provide in student dashboard after login. 
                                            Thank You
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <%-- <div class="modal-footer text-center">
                        <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">
                            Close
                        </button>
                    </div>--%>
            </div>
        </div>
    </div>
    <%--Notice Board Modal END Here--%>
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">


                <asp:Panel ID="Panel1" runat="server">
                    <div class="SrvDiv" id="Div1" runat="server">
                        <a href="https://tsdemo.co.in/csvtu/csvtu_st/" target="_blank">
                            <img alt="" align="left"><b>Help desk</b><br />
                            <span>Grivence &amp; Feedback</span></a>
                    </div>
                    <div class="SrvDiv" id="Div2" runat="server">
                        <a href="/WebApp/Examination/RTRRVFormFillUp.aspx" target="_blank">
                            <img alt="" align="left"/><b>Apply for RT/RV/RRV/ABR</b><br />
                            <span>Semester RT/RV/RRV/ABR form fill-up</span></a>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlMenu" runat="server"></asp:Panel>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default" style="">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-lg-8" style="font-size: 1.4em;">
                                        <i class="fa fa-edit fa-fw"></i>Semester Exam Form Fill-up Detail
                                    </div>
                                </div>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body" style="padding: 0">
                                <div class="dataTable_wrapper">
                                    <div class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                                        <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                            <asp:GridView ID="gridServices" runat="server" CssClass="table table-striped table-bordered" Width="100%" OnRowDataBound="grdService_RowDataBound"></asp:GridView>
                                        </div>

                                    </div>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <%-- Start of Transaction List --%>
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-lg-8" style="font-size: 1.4em;">
                                        <i class="fa fa-tasks fa-fw"></i>Transaction Details
                                    </div>
                                    <div class="col-lg-4 text-right" style="display: none">
                                        <div class="dataTables_filter" id="dataTables-example_filter">
                                            <input aria-controls="dataTables-example" placeholder="Search" class="form-control input-sm" type="search" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body" style="padding: 0">
                                <div class="dataTable_wrapper">
                                    <div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTables-example_wrapper">
                                        <div class="">
                                            <div class="" style="overflow: scroll; height: 175px;">
                                                <%--   <asp:GridView ID="gridview" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                                                    </asp:GridView>--%>
                                                <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">
                                                    <asp:GridView ID="gridview" runat="server" CssClass="table table-striped table-bordered" Width="100%" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound"></asp:GridView>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="display: none;">
                                            <div class="col-sm-6">
                                                <div aria-live="polite" role="status" id="dataTables-example_info" class="dataTables_info">Showing 1 to 10 of 57 entries</div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div id="dataTables-example_paginate" class="dataTables_paginate paging_simple_numbers">
                                                    <ul class="pagination">
                                                        <li id="dataTables-example_previous" tabindex="0" aria-controls="dataTables-example" class="paginate_button previous disabled"><a href="#">Previous</a></li>
                                                        <li tabindex="0" aria-controls="dataTables-example" class="paginate_button active"><a href="#">1</a></li>
                                                        <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">2</a></li>
                                                        <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">3</a></li>
                                                        <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">4</a></li>
                                                        <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">5</a></li>
                                                        <li tabindex="0" aria-controls="dataTables-example" class="paginate_button "><a href="#">6</a></li>
                                                        <li id="dataTables-example_next" tabindex="0" aria-controls="dataTables-example" class="paginate_button next"><a href="#">Next</a></li>
                                                    </ul>
                                                </div>
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
                    <div class="clearfix"></div>
                    <div class="col-lg-12" style="">
                        <%--<uc1:DesignatedOfficer runat="server" ID="DesignatedOfficer" ClientIDMode="Static" />--%>
                    </div>
                    <div class="col-lg-12" style="">
                        <div class="panel panel-default" style="">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-lg-8" style="font-size: 1.4em;">
                                        <i class="fa fa-edit fa-fw"></i> Counter Based Application Detail
                                    </div>
                                </div>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body" style="padding: 0">
                                <div class="dataTable_wrapper">
                                    <div class="dataTables_wrapper form-inline dt-bootstrap no-footer">

                                        <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-y: auto;">

                                            <asp:GridView ID="grdView1" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnRowDataBound="grdView1_RowDataBound">
                                            </asp:GridView>
                                        </div>

                                    </div>
                                </div>
                                <!-- /.table-responsive -->
                            </div>
                            <!-- /.panel-body -->
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <asp:HiddenField ID="HFRollNo" runat="server" />
    </div>
    </div>
</asp:Content>
