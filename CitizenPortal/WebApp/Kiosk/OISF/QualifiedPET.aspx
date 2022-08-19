<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="QualifiedPET.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.QualifiedPET" %>


<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="../../Citizen/Forms/Js/jquery.dataTables.min.js"></script>
    <script src="../../Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../Citizen/Forms/Css/dataTables.jqueryui.min.css" rel="stylesheet" />
    <link href="../../Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

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

            //var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
            var table = $("table[id$='DataGridView']").DataTable
            ({
                dom: 'Bfrtip',
                buttons: ['pageLength', 'excel', 'print'],
                "lengthMenu": [10, 50, 100],
                "iDisplayLength": 10
            });

            $("table[id$='DataGridView'] thead th").each(function () {
                var title = $("table[id$='DataGridView'] thead th").eq($(this).index()).text();
                $(this).html('<input type="text" placeholder="' + title + '" />');
            });

            $("div[id$='DisplayGrid']").show(800);
            $("div[id$='DisplayGrid']").css("width:100% !important");

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

            $('#txtDateFrom').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',
            });

            $('#txtDateTo').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-150:+0",
                maxDate: '0',
            });
        });

        function ValidateForm() {
            debugger;
            var text = "";
            var opt = "";
            var RollNo = $('#txtRollNO');
            var MobileNo = $('#txtMobile');
            var AppID = $('#txtAppID');
            var DateFrom = $('#txtDateFrom');
            var DateTo = $('#txtDateTo');


            if (RollNo.val() == '' || AppID.val() == '' || MobileNo.val() == '') {
                text += "<br /> -Please any of the above fields";
                //DateFrom.attr('style', 'border:1px solid #d03100 !important;');
                //DateFrom.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                //DateFrom.attr('style', 'border:1px solid #cdcdcd !important;');
                //DateFrom.css({ "background-color": "#ffffff" });
            }

            //if (DateTo.val() == '' || DateTo.val() == null) {
            //    text += "<br /> -Please Enter Date in Date To.";
            //    DateTo.attr('style', 'border:1px solid #d03100 !important;');
            //    DateTo.css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    DateTo.attr('style', 'border:1px solid #cdcdcd !important;');
            //    DateTo.css({ "background-color": "#ffffff" });
            //}
        
            //if (MobileNo.val() == '' || MobileNo.val() == null) {
            //    text += "<br /> -Please Enter Your Registered 10 Digit Mobile Number.";
            //    MobileNo.attr('style', 'border:1px solid #d03100 !important;');
            //    MobileNo.css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
            //    MobileNo.css({ "background-color": "#ffffff" });
            //}

            //if (RollNo.val() == '' || RollNo.val() == null) {
            //    text += "<br /> -Please Enter Your Roll No.";
            //    RollNo.attr('style', 'border:1px solid #d03100 !important;');
            //    RollNo.css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    RollNo.attr('style', 'border:1px solid #cdcdcd !important;');
            //    RollNo.css({ "background-color": "#ffffff" });
            //}

            //if (AppID.val() == '' || AppID.val() == null) {
            //    text += "<br /> -Please Enter Your RefrenceID.";
            //    AppID.attr('style', 'border:1px solid #d03100 !important;');
            //    AppID.css({ "background-color": "#fff2ee" });
            //    opt = 1;
            //} else {
            //    AppID.attr('style', 'border:1px solid #cdcdcd !important;');
            //    AppID.css({ "background-color": "#ffffff" });
            //}

        //    if (MobileNo.val() != '') {
        //        var mobmatch1 = /^[789]\d{9}$/;
        //        if (!mobmatch1.test(MobileNo.val())) {
        //            text += "<br /> -Please enter valid 10 digit mobile Number.";
        //            MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        //            MobileNo.css({ "background-color": "#fff2ee" });
        //            opt = 1;
        //        } else {
        //            MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        //            MobileNo.css({ "background-color": "#ffffff" });
        //        }
        //    }

        //    if (RollNo.val() != '') {
        //        if (RollNo.val().length != 7) {
        //            text += "<br /> -Please enter valid Roll No.";
        //            RollNo.attr('style', 'border:1px solid #d03100 !important;');
        //            RollNo.css({ "background-color": "#fff2ee" });
        //            opt = 1;
        //        } else {
        //            RollNo.attr('style', 'border:1px solid #cdcdcd !important;');
        //            RollNo.css({ "background-color": "#ffffff" });
        //        }
        //    }

        //    if (AppID.val() != '') {
        //        if (AppID.val().length != 12) {
        //            text += "<br /> -Please enter valid 12 digit Reference ID.";
        //            AppID.attr('style', 'border:1px solid #d03100 !important;');
        //            AppID.css({ "background-color": "#fff2ee" });
        //            opt = 1;
        //        } else {
        //            AppID.attr('style', 'border:1px solid #cdcdcd !important;');
        //            AppID.css({ "background-color": "#ffffff" });
        //        }
        //    }

            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }
            return true;
        }
    </script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 311px; width: 80%;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <div class="clearfix">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                        List of Candidate Qualified for Written Exam
                    </h2>
                </div>
                <div class="row" id="divCitizenProfile">
                    <div id="" class="col-md-12">
                        <div class="row">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Applicant Details 
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtMobile">Mobile Number</label>
                                            <asp:TextBox runat="server" ID="txtMobile" class="form-control" placeholder="Registered mobile no" name="txtMobile" value="" MaxLength="10" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="" for="txtRollNO">
                                                Roll Number</label>
                                            <asp:TextBox runat="server" ID="txtRollNO" CssClass="form-control" placeholder="Enter Roll No" name="txtBirthDate" value="" MaxLength="7"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="" for="txtAppID">
                                                Reference ID</label>
                                            <asp:TextBox runat="server" ID="txtAppID" class="form-control" placeholder="Reference ID" name="txtAppID" MaxLength="12" onkeypress="return isNumberKey(event);"
                                                type="text" value=""></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-3 text-right">
                                        <label class="" for="">&nbsp;</label>
                                        <asp:Button ID="btnSubmit" runat="server" Text="Search" CssClass="btn btn-primary" OnClientClick="isJavaScriptEnabled:return ValidateForm();" OnClick="btnSubmit_Click" />
                                        &nbsp;
                                        <input id="btnHome" type="button" class="btn btn-danger" value="Close" onclick="window.close();" />
                                    </div>
                                    <div class="clearfix"></div>
                                    <br />
                                    <div class="row" id="DisplayGrid" style="overflow: auto; width: 100%;display: none" runat="server" >
                                    <div class="col-lg-12" >
                                        <asp:GridView ID="DataGridView" AutoGenerateColumns="false" OnPreRender="DataGridView_PreRender" runat="server"></asp:GridView>
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
