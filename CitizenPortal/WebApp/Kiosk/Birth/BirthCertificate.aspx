<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="BirthCertificate.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Birth.BirthCertificate" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/PersonalDetail.ascx" TagPrefix="uc1" TagName="PersonalDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <%--<script src="../../../Scripts/angular.min.js"></script>--%>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="Birth.js"></script>
    <script type="text/javascript">

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

        function fnNext() {
            SubmitData();
            //window.location = "../Forms/Attachment.aspx";
        }

        function fnRegNo() {
            $('#divRegNo').show();
            $('#divInstNo').hide();
            $('#divOtherdtls').hide();
            $('#divSerchBtn').show();
            $('#divDetails').hide();
            $('#divBtn').hide();
            $('#divPlace').hide();
        }
        function fnInstNo() {
            $('#divRegNo').hide();
            $('#divInstNo').show();
            $('#divOtherdtls').hide();
            $('#divSerchBtn').show();
            $('#divDetails').hide();
            $('#divBtn').hide();
            $('#divPlace').hide();
        }
        function fnOther() {
            $('#divRegNo').hide();
            $('#divInstNo').hide();
            $('#divOtherdtls').show();
            $('#divSerchBtn').show();
            $('#divDetails').hide();
            $('#divBtn').hide();
            $('#divPlace').hide();
        }

        function fnSearch() {

            fnSearchData();
        }

        function SubmitData() {
            debugger;
            //if (!ValidateForm()) {
            //    return;
            //}

            var temp = "Gunwant";
            var AppID = "";
            var result = false;
            var DOBArr = $('#DOB').val().split("/");
            var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

            var qs = getQueryStrings();
            var uid = qs["UID"];
            var svcid = qs["SvcID"];

            var datavar = {

                'aadhaarNumber': uid,
                'ChildName': $('#txtChildName').val(),
                'DOB': DOBConverted,
                'Gender': $('#ddlGender').val(),
                'FatherName': $('#FatherName').val(),
                'MotherName': $('#MotherName').val(),
                'ApplicantName': $('#txtApplicantName').val(),
                'ApplicantRelation': $('#applicantrelation').val(),
                'HospitalName': $('#hospname').val(),
                'BirthPlace': $('#POB').val(),
                'AddrCareOf': $('#AddressLine1').val(),
                'AddrCareOf_LL': $('#AddressLine1').val(),
                'AddrBuilding': $('#AddressLine2').val(),
                'AddrBuilding_LL': $('#AddressLine2').val(),
                'AddrStreet': $('#RoadStreetName').val(),
                'AddrStreet_LL': $('#RoadStreetName').val(),
                'AddrLandmark': $('#LandMark').val(),
                'AddrLandmark_LL': $('#LandMark').val(),
                'AddrLocality': $('#Locality').val(),
                'AddrLocality_LL': $('#Locality').val(),
                'VillageCode': $('#ddlVillage').val('0'),
                'PanchayatCode': '0',
                'TalukaCode': $('#ddlTaluka').val('0'),
                'DistrictCode': $('#ddlDistrict').val('0'),
                'District': $('#ddlDistrict').val('0'),
                'StateCode': $('#ddlState').val('0'),
                'PinCode': $('#PinCode').val(),

                'AppLicantTitle': $('#drpAppTitle').val(),
                'ApplicantFullName': $('#txtApplicantName').val(),
                'ApplicantChildRelation': $('#drpAppRel').val(),
                'ChildRelationOther': $('#drpAppRelOther').val(),
                'ApplicantIDProof': $('#drpAppIDProof').val(),
                'ApplicantIDProofDetail': $('#txtAppIDProof').val(),
                'ApplicantTelNo': $('#txtAppTelNo').val(),
                'ApplicantMobileNo': $('#txtAppMobNo').val(),
                'ApplicantEnailID': $('#txtAppEmailID').val(),
                'ApplicantReligion': $('#drpAppReligion').val(),
                'ApplicantNationality': $('#drpAppNationality').val(),
                'ApplicantAddress1': $('#txtAppAddressLine1').val(),
                'ApplicantAddress2': $('#txtAppAddressLine2').val(),
                'ApplicantRoadStreet': $('#txtAppRoadStreet').val(),
                'ApplicantLandMark': $('#txtApplandMark').val(),
                'ApplicantLocality': $('#txtAppLocality').val(),
                'ApplicantState': $('#txtAppState').val(),
                'ApplicantDistrict': $('#txtAppDistrict').val(),
                'ApplicantBlockTaluka': $('#txtAppBlockTaluka').val(),
                'ApplicantVillageCity': $('#txtAppVillageCity').val(),
                'ApplicantPincode': $('#txtAppPincode').val(),
            };

            var obj = {
                "prefix": "'" + temp + "'",
                "Data": $.stringify(datavar, null, 4)
            };


            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Kiosk/Birth/BirthCertificate.aspx/InsertBirthCertificate',
                    data: $.stringify(obj, null, 4),
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

                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    AppID = obj.AppID;
                    result = true;

                    if (result /*&& jqXHRData_IMG_result*/) {
                        alert("Application submitted successfully. Application ID : " + obj.AppID + " Please attach necessary document.");
                        window.location.href = '../Forms/Attachment.aspx?SvcID=103&AppID=' + obj.AppID;
                    }

                });// end of Then function of main Data Insert Function

            return false;
        }

        $(document).ready(function () {
            $("#liBasic").removeClass("active");
            $("#liService").removeClass("active");
            $("#liDetails").addClass("active");
            $("#liDoc").removeClass("active");
            $("#liPayment").removeClass("active");

            $("#step1").addClass("stepfinish");
            $("#step2").addClass("stepfinish");
            $("#step3").addClass("stepactive");
            $("#step4").addClass("active");
            $("#step5").addClass("active");
            $("#step6").addClass("active");
            $("#step7").addClass("active");

            $('#divRegNo').show();
            $('#divInstNo').hide();
            $('#divOtherdtls').hide();
            $('#divSerchBtn').show();
            $('#divDetails').hide();
            $('#divBtn').hide();
            $('#divPlace').hide();
            $('#divTabs').show();

            $('#txtDOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0"
            });

            $('#DOB').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0",
                onSelect: function (date) {

                    var t_DOB = $("#DOB").val();

                    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    var selectedYear = S_date.getFullYear(); // selected year

                    var Age = calage(date);
                    $('#Age').val(Age);
                    //if (Age < 18) {
                    //    $('#DOB').val('');
                    //    alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
                    //    $('#Age').val('');
                    //    return false;
                    //} else if (Age > 125) {
                    //    $('#Age').val('');
                    //    alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 125 years.');
                    //    $('#Age').val('');
                    //    return false;
                    //}
                }
            });
            //$("#btnSubmit").bind("click", function (e) { return SubmitData(); });
        });

        $(document).ready(function () {

        });

        var dat = new Date();
        var curday = dat.getDate();
        var curmon = dat.getMonth() + 1;
        var curyear = dat.getFullYear();

        function checkleapyear(datea) {
            if (datea.getYear() % 4 == 0) {
                if (datea.getYear() % 10 != 0) {
                    return true;
                } else {
                    if (datea.getYear() % 400 == 0)
                        return true;
                    else
                        return false;
                }
            }
            return false;
        }

        function DaysInMonth(Y, M) {
            with (new Date(Y, M, 1, 12)) {
                setDate(0);
                return getDate();
            }
        }

        function datediff(date1, date2) {
            var y1 = date1.getFullYear(),
            m1 = date1.getMonth(),
            d1 = date1.getDate(),
            y2 = date2.getFullYear(),
            m2 = date2.getMonth(),
            d2 = date2.getDate();
            if (d1 < d2) {
                m1--;
                d1 += DaysInMonth(y2, m2);
            }
            if (m1 < m2) {
                y1--;
                m1 += 12;
            }
            return [y1 - y2, m1 - m2, d1 - d2];
        }

        function calage(dob) {

            var D1 = dob.split('/');
            var calday = D1[0];
            var calmon = D1[1];
            var calyear = D1[2];

            var curd = new Date(curyear, curmon - 1, curday);
            var cald = new Date(calyear, calmon - 1, calday);
            var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
            var dife = datediff(curd, cald);
            return dife[0];
        }

        //Start: jQuery Extension Function
        jQuery.extend({
            stringify: function stringify(value, replacer, space) {
                if ("JSON" in window) {
                    return JSON.stringify(value, replacer, space);
                }

                'use strict';

                var rx_escapable = /[\\\"\u0000-\u001f\u007f-\u009f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;

                function f(n) {
                    // Format integers to have at least two digits.
                    return n < 10 ? '0' + n : n;
                }

                function this_value() {
                    return this.valueOf();
                }

                if (typeof Date.prototype.toJSON !== 'function') {

                    Date.prototype.toJSON = function () {

                        return isFinite(this.valueOf()) ? this.getUTCFullYear() + '-' +
                            f(this.getUTCMonth() + 1) + '-' +
                            f(this.getUTCDate()) + 'T' +
                            f(this.getUTCHours()) + ':' +
                            f(this.getUTCMinutes()) + ':' +
                            f(this.getUTCSeconds()) + 'Z' : null;
                    };

                    Boolean.prototype.toJSON = this_value;
                    Number.prototype.toJSON = this_value;
                    String.prototype.toJSON = this_value;
                }

                var gap,
                    indent,
                    meta,
                    rep;


                function quote(string) {

                    // If the string contains no control characters, no quote characters, and no
                    // backslash characters, then we can safely slap some quotes around it.
                    // Otherwise we must also replace the offending characters with safe escape
                    // sequences.

                    rx_escapable.lastIndex = 0;
                    return rx_escapable.test(string) ? '"' + string.replace(rx_escapable, function (a) {
                        var c = meta[a];
                        return typeof c === 'string' ? c : '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
                    }) + '"' : '"' + string + '"';
                }


                function str(key, holder) {

                    // Produce a string from holder[key].

                    var i, // The loop counter.
                        k, // The member key.
                        v, // The member value.
                        length,
                        mind = gap,
                        partial,
                        value = holder[key];

                    // If the value has a toJSON method, call it to obtain a replacement value.

                    if (value && typeof value === 'object' &&
                        typeof value.toJSON === 'function') {
                        value = value.toJSON(key);
                    }

                    // If we were called with a replacer function, then call the replacer to
                    // obtain a replacement value.

                    if (typeof rep === 'function') {
                        value = rep.call(holder, key, value);
                    }

                    // What happens next depends on the value's type.

                    switch (typeof value) {
                        case 'string':
                            return quote(value);

                        case 'number':

                            // JSON numbers must be finite. Encode non-finite numbers as null.

                            return isFinite(value) ? String(value) : 'null';

                        case 'boolean':
                        case 'null':

                            // If the value is a boolean or null, convert it to a string. Note:
                            // typeof null does not produce 'null'. The case is included here in
                            // the remote chance that this gets fixed someday.

                            return String(value);

                            // If the type is 'object', we might be dealing with an object or an array or
                            // null.

                        case 'object':

                            // Due to a specification blunder in ECMAScript, typeof null is 'object',
                            // so watch out for that case.

                            if (!value) {
                                return 'null';
                            }

                            // Make an array to hold the partial results of stringifying this object value.

                            gap += indent;
                            partial = [];

                            // Is the value an array?

                            if (Object.prototype.toString.apply(value) === '[object Array]') {

                                // The value is an array. Stringify every element. Use null as a placeholder
                                // for non-JSON values.

                                length = value.length;
                                for (i = 0; i < length; i += 1) {
                                    partial[i] = str(i, value) || 'null';
                                }

                                // Join all of the elements together, separated with commas, and wrap them in
                                // brackets.

                                v = partial.length === 0 ? '[]' : gap ? '[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']' : '[' + partial.join(',') + ']';
                                gap = mind;
                                return v;
                            }

                            // If the replacer is an array, use it to select the members to be stringified.

                            if (rep && typeof rep === 'object') {
                                length = rep.length;
                                for (i = 0; i < length; i += 1) {
                                    if (typeof rep[i] === 'string') {
                                        k = rep[i];
                                        v = str(k, value);
                                        if (v) {
                                            partial.push(quote(k) + (
                                                gap ? ': ' : ':'
                                            ) + v);
                                        }
                                    }
                                }
                            } else {

                                // Otherwise, iterate through all of the keys in the object.

                                for (k in value) {
                                    if (Object.prototype.hasOwnProperty.call(value, k)) {
                                        v = str(k, value);
                                        if (v) {
                                            partial.push(quote(k) + (
                                                gap ? ': ' : ':'
                                            ) + v);
                                        }
                                    }
                                }
                            }

                            // Join all of the member texts together, separated with commas,
                            // and wrap them in braces.

                            v = partial.length === 0 ? '{}' : gap ? '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}' : '{' + partial.join(',') + '}';
                            gap = mind;
                            return v;
                    }
                }

                // If the JSON object does not yet have a stringify method, give it one.

                meta = { // table of character substitutions
                    '\b': '\\b',
                    '\t': '\\t',
                    '\n': '\\n',
                    '\f': '\\f',
                    '\r': '\\r',
                    '"': '\\"',
                    '\\': '\\\\'
                };

                return (function (value, replacer, space) {

                    // The stringify method takes a value and an optional replacer, and an optional
                    // space parameter, and returns a JSON text. The replacer can be a function
                    // that can replace values, or an array of strings that will select the keys.
                    // A default replacer method can be provided. Use of the space parameter can
                    // produce text that is more easily readable.

                    var i;
                    gap = '';
                    indent = '';

                    // If the space parameter is a number, make an indent string containing that
                    // many spaces.

                    if (typeof space === 'number') {
                        for (i = 0; i < space; i += 1) {
                            indent += ' ';
                        }

                        // If the space parameter is a string, it will be used as the indent string.

                    } else if (typeof space === 'string') {
                        indent = space;
                    }

                    // If there is a replacer, it must be a function or an array.
                    // Otherwise, throw an error.

                    rep = replacer;
                    if (replacer && typeof replacer !== 'function' &&
                        (typeof replacer !== 'object' ||
                            typeof replacer.length !== 'number')) {
                        throw new Error('jQuery.stringify');
                    }

                    // Make a fake root object containing our value under the key of ''.
                    // Return the result of stringifying the value.

                    return str('', {
                        '': value
                    });
                }(value, replacer, space));
            }
        });
    </script>

    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .pright0 {
            padding-right: 0 !important;
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
                <div class="clearfix">
                    <uc1:FormTitle runat="server" ID="FormTitle" />
                </div>
                <div class="clearfix">
                    <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                </div>
                <ul class="nav nav-tabs" id="divTabs">
                    <li class="active"><a aria-expanded="true" data-toggle="tab" href="#TabsInWidget-1" id="tabProfile" runat="server" onclick="fnRegNo();">Search by Register No.</a></li>
                    <li class=""><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-1" id="tabPhoto" runat="server" onclick="fnInstNo();">Search by Instituation No.</a></li>
                    <li class=""><a aria-expanded="false" data-toggle="tab" href="#TabsInWidget-3" id="tabBasic" runat="server" onclick="fnOther();">Search by Other Details</a></li>
                </ul>
                <div class="row" id="divBirthDetails" runat="server">
                    <div class="row">
                        <div class="col-md-12">
                            <%---Start of BirthDetails----%>
                            <div class="col-md-12 box-container mTop15" id="divRegNo">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Search Birth Details by Registration No.
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtRegistration">
                                                Registration Number</label>
                                            <input id="txtRegistration" class="form-control" placeholder="Enter Birth Registration No." name="txtRegistration" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>

                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 box-container mTop15" id="divInstNo">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Search Birth Details by Institutional Request No.
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtRegistration">
                                                Institutional Request Number</label>
                                            <input id="txtInstitutaionNo" class="form-control" placeholder="Enter Birth Registration No." name="txtRegistration" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>

                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 box-container mTop15" id="divOtherdtls">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Search Birth Record by Other Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtChildname">
                                                Child First Name</label>
                                            <input id="txtChildname" class="form-control" placeholder="Enter Child Name" name="txtChildname" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtFatherName">
                                                Father Name</label>
                                            <input id="txtFatherName" class="form-control" placeholder="Enter Father Name" name="txtFatherName" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtMotherName">
                                                Mother Name</label>
                                            <input id="txtMotherName" class="form-control" placeholder="Enter Father Name" name="txtMotherName" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlSrchGender">
                                                {{resourcesData.lblAppGender}}</label>
                                            <select class="form-control" data-val="true" data-val-number="Gender."
                                                data-val-required="Please select gender." id="ddlSrchGender" name="Gender">
                                                <option>Select Gender</option>
                                                <option>Male</option>
                                                <option>Female</option>
                                                <option>Transgender</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtDOB">
                                                {{resourcesData.lblAppDOB}}</label>
                                            <input id="txtDOB" class="form-control" placeholder="dd/MM/yyyy" name="Date of Birth" type="text" value="" maxlength="10"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-8 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtPlace">
                                                {{resourcesData.lblPOB}}</label>
                                            <input id="txtPlace" class="form-control" placeholder="Birth Place" name="txtPlace" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <%----End of BirthDetails-----%>
                            <%---Start of Search Button----%>
                            <div class="" id="divSerchBtn" runat="server">
                                <div class="col-md-12 box-container">
                                    <div class="box-body box-body-open" style="text-align: center;">
                                        <input type="button" id="btnSearch" class="btn btn-success" value="Search" onclick="fnSearch();" />
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Cancel"
                                            CssClass="btn btn-danger" PostBackUrl=""
                                            Text="Reset" />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                            <%---End of Search Button----%>

                            <%---Start of BirthDetails----%>
                            <div class="col-md-12 box-container mTop15" id="divDetails">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Beneficiary Birth Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="txtregNo">
                                                Registration No</label>
                                            <input id="txtregNo" class="form-control" placeholder="Registration No" name="txtregNo" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">
                                                {{resourcesData.child}}</label>
                                            <input id="txtChildName" class="form-control" placeholder="Name of Account Holder" name="AccountHolder" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-1 pright0">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                {{resourcesData.lblAppGender}}</label>
                                            <select class="form-control" data-val="true" data-val-number="Gender."
                                                data-val-required="Please select gender." id="ddlGender" name="Gender">
                                                <option>Select</option>
                                                <option>Male</option>
                                                <option>Female</option>
                                                <option>Transgender</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2 ">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOB">
                                                {{resourcesData.lblAppDOB}}</label>
                                            <input id="DOB" class="form-control" placeholder="dd/MM/yyyy" name="Date of Birth" type="text" value="" maxlength="10"
                                                autofocus />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-8 col-lg-4">
                                        <div class="form-group">
                                            <label class="manadatory" for="POB">
                                                {{resourcesData.lblPOB}}</label>
                                            <input id="lblPOB" class="form-control" placeholder="Birth Place" name="Place of Birth" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="FatherName">
                                                {{resourcesData.father}}</label>
                                            <input id="FatherName" class="form-control" placeholder="Father Name" name="Father Name" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="MotherName">
                                                {{resourcesData.lblAppMotherName}}</label>
                                            <input id="MotherName" class="form-control" placeholder="Mother Name" name="Mother Name" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>

                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <%----End of BirthDetails-----%>

                            <%---Start of BirthDetails----%>
                            <div class="col-md-12 box-container mTop15" id="divPlace">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Hospital (Birth Place) Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="hospname">
                                                {{resourcesData.hospitalname}}</label>
                                            <input id="hospname" class="form-control" placeholder="Name of Account Holder" name="AccountHolder" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <uc1:Address runat="server" ID="Address" />
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <%----End of BirthDetails-----%>

                            <div class="col-md-12 box-container mTop15" id="divApplicantDetails">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Applicant Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1">
                                        <div class="form-group">
                                            <label>Title</label>
                                            <select class="form-control" clientidmode="static" id="drpAppTitle" runat="server">
                                                <option value="0">Select</option>
                                                <option value="Mr">Mr</option>
                                                <option value="Mrs">Mrs</option>
                                                <option value="Dr">Dr</option>
                                                <option value="Cdr">Cdr</option>
                                                <option value="Shri">Shri</option>
                                                <option value="Miss">Miss</option>
                                                <option value="M/S">M/S</option>
                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="applicantname">
                                                {{resourcesData.lblAppName}}</label>
                                            <input id="txtApplicantName" class="form-control" placeholder="Applicanat Name" name="Applicanat Name" type="text" clientidmode="static" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory">Relation with Child</label>
                                            <select class="form-control" id="drpAppRel" clientidmode="static" runat="server">
                                                <option value="0">Select</option>
                                                <option value="Father">Father</option>
                                                <option value="Mother">Mother</option>
                                                <option value="Others">Others</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory" for="applicantrelation">
                                                {{resourcesData.relationwithchild}}</label>
                                            <input id="drpAppRelOther" clientidmode="static" runat="server" class="form-control" placeholder="Relation with Beneficiary" name="Beneficiary Name" type="text" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory">Proof of Identity</label>
                                            <select class="form-control" id="drpAppIDProof" clientidmode="static" runat="server">
                                                <option value="0">Select</option>
                                                <option value="PC">Pan Card</option>
                                                <option value="PSPT">Passport</option>
                                                <option value="DL">Driving Licence</option>
                                                <option value="RC">Ration Card</option>
                                                <option value="VIC">Voter Id Card</option>
                                                <option value="UID">Aadhaar Card</option>
                                                <option value="PIC">Photo ID Card issued by Post Office</option>
                                                <option value="GDC">Govt/Defence ID Card</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                        <div class="form-group">
                                            <label class="manadatory">Proof of Identity</label>
                                            <input type="text" class="form-control" id="txtAppIDProof" clientidmode="static" runat="server" />
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">Telephone Number1</label>
                                                <input type="text" class="form-control" id="txtAppTelNo" clientidmode="static" runat="server" />
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">Mobile</label>
                                                <input type="text" class="form-control" id="txtAppMobNo" clientidmode="static" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory">Email-ID</label>
                                                <input type="text" class="form-control" id="txtAppEmailID" clientidmode="static" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">Religion</label>
                                                <select class="form-control" id="drpAppReligion" clientidmode="static" runat="server">
                                                    <option value="0">Select</option>
                                                    <option value="Hindu">Hindu</option>
                                                    <option value="Muslim">Muslim</option>
                                                    <option value="Sikh">Sikh</option>
                                                    <option value="Christian">Christian</option>
                                                    <option value="Others">Others</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">Nationality</label>
                                                <select class="form-control" id="drpAppNationality" clientidmode="static" runat="server">
                                                    <option value="0">Select</option>
                                                    <option value="Indian">Indian</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    Address Line-1 (Care of)
                                                </label>
                                                <input type="text" id="txtAppAddressLine1" class="form-control" placeholder="First Line Address" maxlength="100" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    Address Line-2 (Building)
                                                </label>
                                                <input type="text" id="txtAppAddressLine2" class="form-control" placeholder="" maxlength="100" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    Road/Street
                                                </label>
                                                <input type="text" id="txtAppRoadStreet" class="form-control" placeholder="" maxlength="100" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    Landmark
                                                </label>
                                                <input type="text" id="txtApplandMark" class="form-control" placeholder="" maxlength="100" autofocus="" />
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    Locality
                                                </label>
                                                <input type="text" id="txtAppLocality" class="form-control" placeholder="" maxlength="100" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    State
                                                </label>
                                                <input type="text" id="txtAppState" class="form-control" placeholder="" maxlength="100" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    District
                                                </label>
                                                <input type="text" id="txtAppDistrict" class="form-control" placeholder="" maxlength="100" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">Block/Taluka</label>
                                                <input type="text" id="txtAppBlockTaluka" class="form-control" placeholder="" maxlength="100" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">Panchayat/Village/City</label>
                                                <input type="text" id="txtAppVillageCity" class="form-control" placeholder="" maxlength="100" autofocus="" />
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                            <div class="form-group">
                                                <label class="manadatory">Pincode</label>
                                                <input type="text" id="txtAppPincode" class="form-control" placeholder="" maxlength="100" autofocus="" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%---Start of Button----%>
                            <div class="" id="divBtn" runat="server">
                                <div class="col-md-12 box-container">
                                    <div class="box-body box-body-open" style="text-align: center;">
                                        <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext();" />
                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" CssClass="btn btn-danger" PostBackUrl="" Text="Cancel" />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                            <%---End of Button----%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server" />
</asp:Content>
