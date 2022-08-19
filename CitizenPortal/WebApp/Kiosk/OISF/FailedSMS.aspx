<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="FailedSMS.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OISF.FailedSMS" %>


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

            $('#txtBirthDate').datepicker({
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
            
            var MobileNo = $('#txtMobile');            
            var DateFrom = $('#txtBirthDate');
            var captcha = $('#captcha');

            if (MobileNo.val() == '' || DateFrom.val() == "") {
                text += "<br /> -Please enter Date of Birth, Registered 10 digit mobile number of Applicant.";
                MobileNo.attr('style', 'border:1px solid #d03100 !important;');
                MobileNo.css({ "background-color": "#fff2ee" });
                //RollNo.attr('style', 'border:1px solid #d03100 !important;');
                //RollNo.css({ "background-color": "#fff2ee" });
                DateFrom.attr('style', 'border:1px solid #d03100 !important;');
                DateFrom.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
                MobileNo.css({ "background-color": "#ffffff" });
                DateFrom.attr('style', 'border:1px solid #cdcdcd !important;');
                DateFrom.css({ "background-color": "#ffffff" });
                //RollNo.attr('style', 'border:1px solid #cdcdcd !important;');
                //RollNo.css({ "background-color": "#ffffff" });
            }

            if (DateFrom.val() == '' || DateFrom.val() == null) {
                text += "<br /> -Please Enter Date In Date From.";
                DateFrom.attr('style', 'border:1px solid #d03100 !important;');
                DateFrom.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                DateFrom.attr('style', 'border:1px solid #cdcdcd !important;');
                DateFrom.css({ "background-color": "#ffffff" });
            }

            if (captcha.val() == '' || captcha.val() == null) {
                text += "<br /> -Please Enter Date In Date From.";
                captcha.attr('style', 'border:1px solid #d03100 !important;');
                captcha.css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                captcha.attr('style', 'border:1px solid #cdcdcd !important;');
                captcha.css({ "background-color": "#ffffff" });
            }
            
            if (MobileNo.val() != '') {
                var mobmatch1 = /^[789]\d{9}$/;
                if (!mobmatch1.test(MobileNo.val())) {
                    text += "<br /> -Please enter valid 10 digit mobile Number.";
                    MobileNo.attr('style', 'border:1px solid #d03100 !important;');
                    MobileNo.css({ "background-color": "#fff2ee" });
                    opt = 1;
                } else {
                    MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
                    MobileNo.css({ "background-color": "#ffffff" });
                }
            }
                      

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
            <div id="page-wrapper" style="min-height: 311px; width: 100%;margin: 0 auto;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
                <div class="clearfix">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>
                        Failed SMS Report
                    </h2>
                </div>
                <div class="row" id="divCitizenProfile">
                    <div id="" class="col-md-12">
                        
                        <div runat="server" class="success" style="font-size:15px;" id="div1">
                            <b style="font-size:17px;">List of Applicant whom SMS/e-mail are not deliver</b><br />
                            SMSs/e-mails are being sent to the following candidates repeatedly to download
their e-Pass to appear in the recruitment test but resulting failure to deliver them.
They are requested to visit the website regularly and download their e-Pass to appear in the recruitment test
and in case if they faced any difficulty in downloading their e-Pass, they may contact to our Help Desk No.-
0674-658011,0674-6580222 and 0671-2302444.
                            <br />
                            
                        </div>
                        <div runat="server" class="danger error bg-warning" id="divErr" style="display:none;">
                            Please enter Date of Birth and Register Mobile Number (Mandatory) to check the details.
                        </div>
                        <div class="row">
                            <div class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title">Applicant Details 
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div style="display:none;">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">Date From </label>
                                            <asp:TextBox runat="server" ID="txtBirthDate" CssClass="form-control" placeholder="DD/MM/YYYY" name="txtBirthDate" value="" MaxLength="10"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtMobile">Mobile Number</label>
                                            <asp:TextBox runat="server" ID="txtMobile" class="form-control" placeholder="Registered mobile no" name="txtMobile" value="" MaxLength="10" onkeypress="return isNumberKey(event);"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                                        <div style="margin-top: -12px;">
                                            <label>
                                                <img src="/Account/GetCaptcha" alt="verification code" class=".gov.inform-control" />
                                            </label>
                                            <asp:TextBox runat="server" ID="captcha" MaxLength="6" CssClass="form-control" placeholder="Enter Captcha" />
                                        </div>
                                    </div>
                                    <div class="form-group col-lg-2 text-right">
                                        <label class="" for="">&nbsp;</label>
                                        <asp:Button ID="btnSubmit" runat="server" Text="Search" CssClass="btn btn-primary" OnClientClick="isJavaScriptEnabled:return ValidateForm();" OnClick="btnSubmit_Click" />
                                       
                                        <input id="btnHome" type="button" class="btn btn-danger" value="Close" onclick="window.close();" />
                                    </div>
                                        </div>
                                    <div class="clearfix"></div>
                                    <br />
                                    <div class="row" id="DisplayGrid" style="display: none" runat="server">
                                    <div class="col-lg-12">
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
