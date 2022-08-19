<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="CSCUploadDocument.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.CSCUploadDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js"></script>

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
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
            font-size: x-large;
        }
    </style>
        <style type="text/css">
        .divError {
            font-family: Arial;
            font-size: 20px;
            text-align: center;
            margin: 10px auto;
        }

            .divError img {
                float: left;
                width: 50px;
                margin: 0 20px 0 10px;
            }

            .divError div {
                float: left;
                color: red;
                font-size: .8em;
            }

            .divError h1 {
                float: left;
                margin: 0;
                padding: 0;
                font-size: .9em;
                color: maroon;
            }

        .info, .success, .warning, .error, .validation {
            /*border: 1px solid;*/
            margin: 10px 0px;
            padding: 15px 10px 15px 15px;
            background-repeat: no-repeat;
            background-position: 10px left;
            text-align: left;
            font: 13px Tahoma,sans-serif;
        }

        .success {
            color: #4F8A10;
            background-color: #DFF2BF;
        }

        .error {
            color: #D8000C;
            background-color: #FFBABA;
        }
    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];

            $('#AppID').val(AppID);
            $('#txtPaymentDate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',

            });
        });

        function TakeAction(p_ServiceID, p_AppID, p_PaymentStatus, p_AckURL) {
            //var t_URL = ResolveUrl(p_URL);
            var t_URL = "/WebApp/Kiosk/Forms/Attachment.aspx";

            var qs = getQueryStrings();
            var UID = qs["UID"];

            if (p_PaymentStatus == "P") {

                t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID + "&IsRequired=Yes";
                //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
                window.location.href = t_URL;
            }
            //if (p_AckURL != "") {

            //    t_URL = p_AckURL;
            //    t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
            //    window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');

            //}
            //else {
            //    t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID + "&UID=" + UID;
            //    //window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
            //    window.location.href = t_URL;

            //}

            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 311px;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                <div class="clearfix">
                    <%--<uc1:FormTitle runat="server" ID="FormTitle" />--%>
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                       Upload Document
                    </h2>
                </div>
                <div class="row" id="divCitizenProfile">

                    <div class="row">
                        <div id="" class="col-md-12">
                            <div runat="server" class="danger error bg-warning" id="divErr">
                                Please Select Payment Type to continue                            
                            </div>          
                            <div class="col-md-12 box-container" style="display:none;">
                                <div class="box-heading">
                                    <h4 class="box-title">Document Details
                                    </h4>
                                </div>

                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">
                                                Service</label>
                                            <asp:DropDownList ID="ddlService" runat="server" Width="95%" CssClass="form-control">
                                                <asp:ListItem Selected="True" Text="-Select-" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="Recruitment of Constables" Value="388"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">
                                                Application ID</label>
                            <asp:TextBox ID="txtAppID" runat="server" CssClass="form-control" placeholder="Reference ID"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-3 text-right">
                                        <label class="" for="">
                                            &nbsp;
                                        </label>
                                        <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                            Text="Submit" OnClick="btnSubmit_Click" />
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <!-----------Bind All Application Transactions details to Re-Upload Document Files------------>
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Document Details
                                    </h4>
                                </div>
                            <div class="panel-body">
                                    <div class="dataTable_wrapper">
                                        <div class="dataTables_wrapper form-inline dt-bootstrap no-footer" id="dataTables-example_wrapper">
                                            <div class="">
                                                <div class="" style="overflow: scroll; height: 500px;">
                                                    <asp:GridView ID="gridview" runat="server" ShowHeaderWhenEmpty="true" CssClass="table table-striped table-bordered" OnPageIndexChanging="grdView_PageIndexChanging" OnRowDataBound="grdView_RowDataBound">
                                                    </asp:GridView>
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
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
