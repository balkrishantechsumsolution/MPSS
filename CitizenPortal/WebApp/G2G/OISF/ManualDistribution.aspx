﻿<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="ManualDistribution.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OISF.ManualDistribution" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>

    <style type="text/css">
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
        body {
        color:#000;}
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var FormNo = "txtFormNo";
            var Battalion = "ddlBattalion";
            var DDraft = "txtDDraft";

            //new fields
            var DDIssuedBankName = "txtDDIssueBankName";
            var DDNo = "txtDDNo";
            var DateOfIssue = "txtDateOfIssue";
            var Amount = "txtAmout";
            //new fields

            $("#divForm").hide();
            $("#btnPrint").hide();
            GetBatallionList();

            //var RegNo = "efrwlkjl";
            $("#btnSubmit").bind("click", function (e) { return SubmitData(); });
            //$('#txtFormNo').html(RegNo);
            //$('#frmDate').html($('#txtDate').val());
            //$('#frmNo').html(RegNo);
            //$('#frmBattalion').html($('#ddlBattalion option:selected').text());
            //$('#frmDDNo').html(RegNo);
            //$("#ddlBattalion").bind("change", function (e) { return GetFormNo(Battalion.val()); });

        });



        function SubmitData() {
            debugger;
            if (!ValidateForm()) {
                return;
            }

            var temp = "Gunwant";

            var result = false;
            var category = "";
            var FormNo = "";
            var Battalion = $('#ddlBattalion option:selected').val();
            var DDraft = $('#txtDDraft').val();

            //var datavar = {

            //    'FormNo': $('#txtFormNo').val(),
            //    'Battalion': $('#ddlBattalion option:selected').val(),
            //    'DDraft': $('#txtDDraft').val(),

            //};

            //var obj = {
            //    "prefix": "'" + temp + "'",
            //    "Data": $.stringify(datavar, null, 4)
            //};


            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/G2G/OISF/ManualDistribution.aspx/InsertManualDetail',
                    data: '{"prefix":"' + category + '","BattalionID":"' + Battalion + '","DraftNo":"' + DDraft + '","FormNo":"' + FormNo + '","DDIssuedBankName":"' + DDIssuedBankName + '","DDNo":"' + DDNo + '","DateOfIssue":"' + DateOfIssue + '","Amount":"' + Amount + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {

                    },
                    error: function (a, b, c) {
                        result = false;
                        alert("5." + a.responseText);
                    }
                })
                ).then(function (data, textStatus, jqXHR) {
                    debugger;
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    RegNo = obj.AppID;
                    result = true;

                    if (result) {
                        if (RegNo == "Failed") {
                            alert("Please Check, Form against Demand Draft No. " + $('#txtDDraft').val() + " already issued.");
                            return false;
                            //window.location.href = '/WebApp/G2G/OISF/OISFG2GDashboard.aspx';
                        } else {

                            var temp = RegNo.split('_');
                            alert("Please take a print of the form " + temp[0] + " by clicking on print button.  Before Printing please ensure the Background graphics check box is enabled and the print margin is set to custom (.30)");
                            
                            $('#txtFormNo').html(temp[0]);
                            //alert(RegNo);
                            $('#frmDate').html(temp[2]);
                            $('#frmNo').html(temp[0]);
                            $('#frmBattalion').html($('#ddlBattalion option:selected').text());
                            $('#frmDDNo').html(temp[1]);
                            $("#btnPrint").show();
                            $("#btnSubmit").hide();
                            $("#divForm").show();
                            $('#txtFormNo').prop('disabled', true);
                            $('#ddlBattalion').prop('disabled', true);
                            $('#txtDDraft').prop('disabled', true);
                            //window.location.href = '/WebApp/G2G/OISF/OISFG2GDashboard.aspx';
                        }
                    }
                });// end of Then function of main Data Insert Function

            return false;
        }

        function ValidateForm() {
            return true;

        }

        function PrintOffline(divPrint) {
            window.location.href = '/WebApp/G2G/OISF/OISFG2GDashboard.aspx';
            CallPrint('divPrint');
        }


        function GetBatallionList() {
            var CategoryCode = "";
            var category = "";
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Kiosk/MenialStaff/GroupD.aspx/GetBatallionList',
                data: '{"prefix":"' + category + '","CategoryCode":"' + CategoryCode + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("#ddlBattalion").empty();
                    $("#ddlBattalion").append('<option value = "0">-Select Battalion-</option>');
                    $.each(Category, function () {
                        $("#ddlBattalion").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        catCount++;
                    });

                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
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

                <div class="row">
                    <h2 class="form-heading">
                        <i class="fa fa-pencil-square-o"></i>Manual Distribution Application for Recruitment of Constable                    
                    </h2>
                </div>
                <div class="row">
                    <%-- Start of Employment Exchange --%>
                    <div class="row">
                        <div id="" class="col-md-12 box-container">
                            <div class="box-heading" id="">
                                <h4 class="box-title">ISRB Form Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                               <%-- --fieldadd----%>

                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtDDIssueBankName">
                                            DD Issued Bank Name</label>
                                        <asp:TextBox ID="txtDDIssueBankName" runat="server" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                </div>
                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtDDNo">
                                            DD Number</label>
                                        <asp:TextBox ID="txtDDNo" runat="server" CssClass="form-control" MaxLength="6"></asp:TextBox>
                                    </div>
                                </div>
                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtDateOfIssue">
                                            Date Of Issue</label>
                                        <asp:TextBox ID="txtDateOfIssue" runat="server" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                </div>

                                  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtAmout">
                                            Amount</label>
                                        <asp:TextBox ID="txtAmout" runat="server" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                </div>

                                 <%-- --fieldadd----%>


                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtDate">
                                            Date of Issue of Form</label>
                                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3" style="display: none;">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtFormNo">
                                            Form No.</label>
                                        <input id="txtFormNo" class="form-control" name="txtFormNo" type="text" placeholder="" value="" autofocus="" title="Application No." disabled="disabled" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlBattalion">
                                            Name of Battalion / District</label>
                                        <select name="ddlBattalion" id="ddlBattalion" class="form-control" data-val="true" data-val-number="District." data-val-required="Please select District.">
                                            <option value="0">Select Battalion / District</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="txtDDraft">
                                            Bank Draft No.</label>
                                        <input id="txtDDraft" class="form-control" name="txtDDraft" placeholder="Enter Bank Draft No." type="text" value="" autofocus="" maxlength="6" onkeypress="return onlyNumbers(event);" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    <%--- End of Employment Exchange ---%>
                    <div class="row" id="divForm" >

                        <div id="divPrint" style="margin: 0 auto; width: 1000px; /*height: 1220px; overflow: auto; */">
                            <div style="margin: 0 auto; /*height: 1191px; */ width: 994px; /*border: 3px solid #f5f5f5; */ padding: 1px; font-family: Arial !important; font-size: 15px;">
                                <div style="margin: 0 auto; /*height: 1182px; */ font-family: Arial !important;width: 985px; /*border: 1px solid #f5f5f5; */ background-image: url('/WebApp/Kiosk/images/bgLogo.png'); background-size: 880px; background-repeat: repeat-y; background-position: center center;">



                                    <table style="width: 100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="2">
                                                <div style="float: left; width: 100px;">
                                                    <img src="/webapp/kiosk/oisf/img/odisha_policelogo.jpg" style="width: 100px; margin-top: -6px;" />
                                                </div>
                                                <div style="float: right; width: 865px;">
                                                    <h2 style="margin-top: 0; margin-bottom: 0; color: #820000; text-align: left; border-left: 15px solid #ce6d07; border-right: 2px solid #ce6d07; border-top: 1px solid #d8d8d8; border-bottom: 1px solid #d8d8d8; background: rgba(0, 0, 0, .075); padding: 10px 20px 10px 15px; border-top-right-radius: 2px; border-top-left-radius: 2px; text-transform: uppercase; font-weight: bold; font-size: 23px;">Manual Application Form for Recruitment of Constables in<br />
                                                        9th India Reserve Battalion (Specialised)
                                        
                                                    </h2>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">For Office Use Only 
                                                </h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 190px;">Date of Issue</td>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;"><label id="frmDate"></label>&nbsp;</td>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 140px">Form Number</td>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;"><label id="frmNo"></label>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">Name of Battalion / District</td>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;"><label id="frmBattalion"></label>&nbsp;</td>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">Bank Draft Number</td>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;"><label id="frmDDNo"></label>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Please fill the form after going through the advertisement scrupulously</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td style="padding: 0;" colspan="2">
                                                <table style="width: 100%;" cellspacing="0" cellpadding="5">
                                                    <tr>
                                                        <td style="width: 245px; border: 1px solid #000000;">IRB - Indian Reserve Battalion</td>
                                                        <td style="font-size: 12px; color: #878787; border: 1px solid #000000">1st Preference</td>
                                                        <td style="font-size: 12px; color: #878787; border: 1px solid #000000">2nd Preference</td>
                                                        <td>&nbsp;</td>
                                                        <td style="width: 245px; border: 1px solid #000000">SSB - Special Security Battalion</td>
                                                        <td style="font-size: 12px; color: #878787; border: 1px solid #000000">1st Preference</td>
                                                        <td style="font-size: 12px; color: #878787; border: 1px solid #000000">2nd Preference</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">Applicant Details <span style="font-size: 12px; font-weight: normal;">Please write in CAPITAL letters</span>
                                                </h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 415px;">
                                                            <span>Applicant Aadhar  Number</span> <span style="font-size: 12px; font-weight: normal;">(Enter 12 Digit Aadhar  Number if available)</span>
                                                        </td>
                                                        <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 349px;">&nbsp;</td>
                                                        <td style="border: 1px solid #000; border-bottom: none; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">

                                                <table style="width: 100%; font-size: 15px;" cellspacing="0" cellpadding="5">
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px; width: 155px;">Applicant Full Name</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;" colspan="10">&nbsp;</td>
                                                        <td style="border: 1px solid #000000; border-top: none; padding: 0; line-height: 30px; text-align: center; width: 185px;" rowspan="5">Paste recent<br />
                                                            pass port size&nbsp;<b><br />
                                                                PHOTOGRAPH<br />
                                                            </b>of Applicant
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Applicant Father&#39;s Name</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;" colspan="10">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 5px 0px 5px 15px; line-height: 12px;">Date of Birth<span style="font-size: 12px; white-space: nowrap">
                                                            <br />
                                                            (as per High School Certificate)</span></td>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 5px; color: #878787; text-align: center">DD</td>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 5px; color: #878787; text-align: center">MM</td>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 5px; color: #878787; text-align: center">YYYY</td>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 5px; line-height: 12px; width: 135px;">Age <span style="font-size: 12px; white-space: nowrap">
                                                            <br />
                                                            (as on 01/01/2016)</span></td>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 5px; color: #878787; text-align: center" colspan="2">YY</td>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 5px; color: #878787; text-align: center" colspan="2">MM</td>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 5px; color: #878787; text-align: center" colspan="2">DD</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 15px;">Gender</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;" colspan="3">MALE (only)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 5px;">Nationality</td>
                                                        <td colspan="6" style="border: 1px solid #000000; padding: 10px 0px 10px 10px;">INDIAN (only)</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Religion</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;" colspan="3">&nbsp;</td>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 5px; line-height: 12px;">Category <span style="font-size: 12px">(put <b>&#10004;</b>&nbsp; mark 
                                                <br />
                                                            in appropriate option)</span></td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 0px; text-align: center;">UR</td>
                                                        <td colspan="2" style="border: 1px solid #000000; padding: 10px 0px 10px 0px; text-align: center;">SEBC</td>
                                                        <td colspan="2" style="border: 1px solid #000000; padding: 10px 0px 10px 0px; text-align: center;">ST</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 0px; text-align: center;">SC</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Mobile Number</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;" colspan="3">&nbsp;</td>
                                                        <td style="border: 1px solid #000000; padding: 0 0px 0 5px; width: 170px; line-height: 12px;">Alternate Mobile Number <span style="font-size: 12px; white-space: nowrap">(for communication)</span></td>
                                                        <td colspan="6" style="padding: 0; border: 1px solid #000000;">&nbsp;</td>
                                                        <td style="border: 1px solid #000000; padding: 0;" rowspan="2">
                                                            <div style="text-align: center; margin-top: 60px; font-size: 10px; border-top: 1px solid #000000;">Applicant Signature</div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Email ID</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;" colspan="10">&nbsp;</td>
                                                    </tr>
                                                </table>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table style="width: 100%" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td style="width: 49%">
                                                            <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">Permanent Address <span style="font-size: 12px; font-weight: normal;">Please write in CAPITAL letters</span>
                                                            </h4>
                                                        </td>
                                                        <td style="width: 2%">&nbsp;</td>
                                                        <td style="width: 49%">
                                                            <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">Present Address <span style="font-size: 12px; font-weight: normal; white-space: nowrap">(For correspondence)</span>
                                                            </h4>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 49%">
                                                            <table style="width: 100%; font-size: 15px;" cellspacing="0" cellpadding="5">
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px; width: 167px;">AddressLine-1 (Care of)</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Address Line-2 (Building)</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Road/Street Name</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Landmark/Locality</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Panchayat/Village/City</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Block/Taluka</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">District</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">State</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">PIN</td>
                                                                    <td style="padding: 0">
                                                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                            <tr>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="width: 2%">&nbsp;</td>
                                                        <td style="width: 49%">
                                                            <table style="width: 100%; font-size: 15px;" cellspacing="0" cellpadding="5">
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px; width: 167px;">AddressLine-1 (Care of)</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Address Line-2 (Building)</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Road/Street Name</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Landmark/Locality</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Panchayat/Village/City</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Block/Taluka</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">District</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">State</td>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">PIN</td>
                                                                    <td style="padding: 0">
                                                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                            <tr>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 27px;">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">Educational Qualification of High School Certificate (HSC) <span style="font-size: 12px; font-weight: normal;">(Please write in CAPITAL letters)</span>
                                                </h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table style="width: 100%; font-size: 15px;" cellspacing="0" cellpadding="5">
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px; width: 167px;">Name of the Board / Council</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">Name of the Examination 
                                                            <br />
                                                            Passed <span style="font-size: 12px;">(HSC or Equivalent)</span></td>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0;" colspan="2">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 390px">Name of State <span style="font-size: 12px">(where the Board/Council is Registered) </span></td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0;" colspan="2">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 390px">Cleared the Exam in <span style="font-size: 12px">(put <b>&#10004;</b> mark in appropriate option)</span></td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">First attempt</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 60px; color: #878787">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">Compartmental</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 60px; color: #878787">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">Supplementary</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 60px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0;" colspan="2">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 390px">Grading System <span style="font-size: 12px">(put <b>&#10004;</b>mark in appropriate option)</span></td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 86px">Percentage</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 200px;">CGPA <span style="font-size: 12px">(only for ICSE and CBSE)</span></td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0;" colspan="2">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 110px;">Year of Passing</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 80px;">Total Marks</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 140px;">Marks/CGPA Obtain</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 140px;">Percentage Secured</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 60px;">Division</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">Employment Exchange Details <span style="font-size: 12px; font-weight: normal;">(Please write in CAPITAL letters)</span>
                                                </h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table style="width: 100%; font-size: 15px;" cellspacing="0" cellpadding="5">

                                                    <tr>
                                                        <td style="padding: 0;">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 300px;">Employment Exchange Registration Number</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 300px;">Employment Exchange Registration Date</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0;">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 220px; white-space: nowrap;">Name of Employment Exchange </td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 220px; white-space: nowrap;">Employment Exchange District</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center">Page: 1 of 3</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">Other Details <span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span>
                                                </h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 5px; width: 40px; text-align: left;">1.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Has the Candidate passed Odia as one of the subject in HSC Examination or an examination in Odia language equivalent to M.E. Standard recognised or conducted by the School and Mass Education Department of Odisha. (photo copy with self attestation should be enclosed) <span style="font-size: 12px">(put <b>&#10004;</b>mark in appropriate option)</span></td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">a.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 540px;white-space:nowrap;">Ability to read, write and speak Odia language <span style="font-size: 12px; font-weight: normal;">(Put &#10004; mark against the appropriate option)</span>
                                                                    </td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 50px;">Read</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 50px;">Write</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 50px;">Speak</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 5px; width: 40px; text-align: left;">2.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Whether the candidate is married? <span style="font-size: 12px; font-weight: normal;">(Put &#10004; mark against the appropriate option)</span></td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">a.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">If Married, whether he has more than one spouse living? <span style="font-size: 12px; font-weight: normal;">(Put &#10004; mark against the appropriate option)</span></td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 5px; width: 40px; text-align: left;">3.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Whether the Candidate is a Ex-Serviceman? (<span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span>)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">a.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;white-space:nowrap; width: 465px">If Yes, please specify service rendered in the Defence establishments</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 90px;">From Date </td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">DD/MM/YYYY</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 80px;">TO Date</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">DD/MM/YYYY</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">b.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 465px">Calculate the Year, Month and Days served in Defence</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 60px;">YEAR </td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 70px;">MONTH</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 60px;">DAY</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 60px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 5px; width: 40px; text-align: left;">4.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Whether the candidate is a Sports Person? (<span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span>)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">a.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">Name of the Sports Participated</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 520px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">b.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">Mention the Sports Federation or Association Name</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 520px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">c.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; line-height: 12px;">Whether the candidate wants to avail relaxation for Physical Measurements in height, weight & chest 
                                                <br />
                                                            (<span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span>)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">d.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 320px">If Yes, specify the relaxation wants to avail</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 5px; width: 55px">Height</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 40px;">CM</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 5px; width: 50px;">Chest</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 40px;">CM</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 5px; width: 60px;">Weight</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 40px;">KG</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 5px; width: 40px; text-align: left;">5.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">If Sports Person (candidate only indicate one sports event participated in Open National Championship / International Championship and the same should be recognized and sponsored either by the recognized National Sports Federations / Associations or Indian Olympic Association, Odisha State Sports Association, Affiliated to the recognized National Sports Federation /Association)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">a.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">Name of the participated sports event </td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 520px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">b.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 450px;">Specify the Category Participated <span style="font-size: 12px;">(Specify <b>YES / NO</b> against the event)  </span></td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 100px;">National</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 100px;">International</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">c.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 535px;">Awarded any Medal (Gold/Silver/Bronze)  <span style="font-size: 12px;">(<span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span>)  </span></td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 5px; width: 70px;">Gold/1st</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 5px; width: 80px;">Silver/2nd</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 5px; width: 85px;">Bronze/3rd</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 5px; width: 40px; text-align: left;">6</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px"><span class="ng-binding">Whether the candidate possesses NCC Certificate? (<span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span>)</span></td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">a.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 535px;">If so, specify the NCC Certificate type. <span style="font-size: 12px">(<span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span>)</span></td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 5px;">A Certificate</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 5px;">B Certificate</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 5px;">C Certificate</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 5px; width: 40px; text-align: left;">7.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Whether candidate possesses Driving Licenses having the validity for at least 1 year <span style="font-size: 12px;">(Excluding the learning period)?</span></td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">a.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 504px;">Whether the license is applicable for Heavy Vehicle or Light Vehicle<br />
                                                                        (photo copy of such license with self attestation should be enclosed) <span style="font-size: 12px;">
                                                                            <br />
                                                                            (<span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span>)  </span></td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 115px">Heavy Vehicle</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 115px">Light Vehicle</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">b.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 375px">Name of the RTO Office from which license issued</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">c.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000;white-space:nowrap; padding: 10px 0px 10px 15px; width: 170px;">Driving License Number</td>
                                                                    <td style="border: 1px solid #000;white-space:nowrap; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000;white-space:nowrap; padding: 10px 0px 10px 15px; width: 230px;">Driving License Registration Date</td>
                                                                    <td style="border: 1px solid #000;white-space:nowrap; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000;white-space:nowrap; padding: 10px 0px 10px 15px; width: 90px;">RTO District</td>
                                                                    <td style="border: 1px solid #000;white-space:nowrap; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 5px; width: 40px; text-align: left;">8.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Whether the candidate is involved in any criminal case? <span style="font-size: 12px;">(<span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span>)</span></td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">a.</td>
                                                        <td style="padding: 0" colspan="3" rowspan="2">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap;">If yes, mention the Status of the Criminal Case <span style="font-size: 12px">(<span style="font-size: 12px;">(<span style="font-size: 12px; font-weight: normal;">Put &#10004; mark against the appropriate option</span></span>)</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="padding: 0; white-space: nowrap;">
                                                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                            <tr>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">Investigation Pending</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">Trial Pending</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">Acquitted</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">Convicted</td>
                                                                                <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">b.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 230px;">State where case is Registered</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 243px;">District where case is Registered</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 147px">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">c.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;white-space:nowrap; width: 385px">Name of the Police Station where the case is registered</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">d.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space:nowrap; width: 270px;">Police Station Case Reference Number</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 295px;">IPC Section in which the case is register</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 5px; width: 40px; text-align: left;">9.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px" colspan="3">Payment Details of Examination Fee to be paid only through Demand Draft <span style="font-size: 12px;">(<span style="font-size: 12px; font-weight: normal;">Not applicable for SC/ST)</span></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">a.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 190px;">Demand Draft Number</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; white-space: nowrap; width: 210px;">Date of Issue of Demand Draft</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px;">&nbsp;</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 100px;">Amount (Rs.)</td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 85px;">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 5px 10px 5px; width: 40px; text-align: right;">b.</td>
                                                        <td style="padding: 0" colspan="3">
                                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; width: 190px">Name of the Issuing Bank </td>
                                                                    <td style="border: 1px solid #000; padding: 10px 0px 10px 15px; color: #878787">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="text-align: center">Page: 2 of 3</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">Declaration
                                                </h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table style="width: 100%; font-size: 15px;" cellspacing="0" cellpadding="5">
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px; line-height: 25px;">I _______________________________, Son of _______________________________ declared that the above statement furnished is completely correct to the best of my knowledge. If any, facts stated above are found to be in-correct my candidature will stand cancelled.
                                                <br />
                                                            I agree to serve anywhere in Odisha if selected</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">Declaration for Participation in Physical Efficiency Test
                                                </h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table style="width: 100%; font-size: 15px;" cellspacing="0" cellpadding="5">
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0px 10px 15px; line-height: 25px;">I undersigned _______________________________, Son of _______________________________ hereby declare that I am completely capable and fit to appear in the Physical Efficiency Test for the post of Constables. During the Physical Efficiency Test if any, Physical injury or untoward accident takes place, the concerned officers shall not beheld responsible or liable.
                                                <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0;">
                                                            <br />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0;">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0;">Date : </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding: 0;">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Place :</td>
                                            <td style="text-align: right;">Full Signature of the Candidate</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <h4 style="background-color: #37495f; border: 1px solid #37495f; border-radius: 3px 3px 0 0; color: #fff; font-size: 1.4em; margin: 0; padding: 2px 15px;">Document Enclosed <span style="font-size: 12px; font-weight: normal;">(Self attested Photo-copy / Xerox of the document)</span>
                                                </h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">1.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">3 Pass Port Size Photographs (1 fix with the application)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">2.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">High School Certificate Mark sheet</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">3.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Age Proof (High School Certificate or any appropriate Document proofing the age of the applicant)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">4.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Caste Certificate (if candidate Category is SEBC/ST/SC/)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">5.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Employment Exchange Registration Card</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">6.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Unit Discharge Certificate (In Case of Ex-Servicemen)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">7</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">International/National Sports Certificate (in case of Sports Person)</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">8.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px"><span class="dplyflex ng-binding"><span class="fom-Numbx">Certificate of I-Card issued by Director of Sports Odisha</span></td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>

                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">9.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">National Cadet Corps Certificate </td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>

                                                    <tr>
                                                        <td style="border: 1px solid #000000; padding: 10px 0 10px 15px; width: 30px">10.</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px">Driving License</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">YES</td>
                                                        <td style="border: 1px solid #000000; padding: 10px 10px 10px 15px; width: 50px">NO</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td colspan="2" style="text-align: center">Page: 3 of 3</td>
                                        </tr>

                                    </table>


                                </div>
                            </div>
                        </div>

                    </div>

                    <div id="divBtn" class="row">
                        <div class="col-md-12 box-container" style="margin-top: 5px;">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <input type="button" id="btnPrint" class="btn btn-success" style="" value="Print" onclick="javascript: PrintOffline('divPrint');" />

                                <input type="button" id="btnSubmit" class="btn btn-success" value="Generate Form" title="Click to generate Manual Form" />
                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                    CssClass="btn btn-danger" PostBackUrl=""
                                    Text="Cancel" />
                                <asp:Button ID="btnHome" runat="server"
                                    CssClass="btn btn-primary" PostBackUrl="~/WebApp/G2G/OISF/OISFG2GDashboard.aspx" ToolTip="Back to Home Page"
                                    Text="Home" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
