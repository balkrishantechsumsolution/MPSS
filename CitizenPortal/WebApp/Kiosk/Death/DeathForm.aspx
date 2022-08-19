<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="DeathForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Death.DeathForm" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>

<%@ Register Src="~/WebApp/Control/ApplicationSteps.ascx" TagPrefix="uc1" TagName="ApplicationSteps" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script type="text/javascript">

        $(document).ready(function () {
            console.log("ready!");
        });

        function fnNext() {
            SubmitData();
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

            var DODArr = $('#DOD').val().split("/");
            var DODConverted = DODArr[2] + "-" + DODArr[1] + "-" + DODArr[0];


            var decAddressLine1 = $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val();
            var decAddressLine2 = $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val();
            var decRoadStreetName = $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val();
            var decLandMark = $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val();
            var decLocality = $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val();
            var decddlState = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlState']").val();
            var decddlDistrict = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlDistrict']").val();
            var decddlTaluka = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlTaluka']").val();
            var decddlVillage = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlVillage']").val();
            var decPinCode = $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val();

            var hospAddressLine1 = $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val();
            var hospAddressLine2 = $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val();
            var hospRoadStreetName = $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val();
            var hospLandMark = $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val();
            var hospLocality = $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val();
            var hospddlState = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val();
            var hospddlDistrict = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val();
            var hospddlTaluka = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val();
            var hospddlVillage = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val();
            var hospPinCode = $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val();

            var datavar = {

                'aadhaarNumber': '',
                'ProfileID': '',
                'DeceasedName': $('#deceasedname').val(),
                'FatherHusbandName': $('#FatherName').val(),
                'Gender': $('#ddlDeceasedGender').val(),
                'DateofDeath': DODConverted,
                'TimeofDeath': $('#TOD').val(),
                'DateofBirth': DOBConverted,
                'ApplicantName': $('#applicantname').val(),
                'DeceasedRelation': $('#applicantrelation').val(),
                'HospitalName': $('#hospname').val(),
                'DeceAddressLine1': decAddressLine1,
                'DeceAddressLine2': decAddressLine2,
                'DeceRoadStreetName': decRoadStreetName,
                'DeceLandMark': decLandMark,
                'DeceLocality': decLocality,
                'DeceState': decddlState,
                'DeceDistrict': decddlDistrict,
                'DeceTaluka': decddlTaluka,
                'DeceVillage': decddlVillage,
                'DecePinCode': decPinCode,
                'HospAddressLine1': hospAddressLine1,
                'HospAddressLine2': hospAddressLine2,
                'HospRoadStreetName': hospRoadStreetName,
                'HospLandMark': hospLandMark,
                'HospLocality': hospLocality,
                'HospState': hospddlState,
                'HospDistrict': hospddlDistrict,
                'HospTaluka': hospddlTaluka,
                'HospVillage': hospddlVillage,
                'HospPinCode': hospPinCode

            };

            var obj = {
                "prefix": "'" + temp + "'",
                "Data": $.stringify(datavar, null, 4)
            };

            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Kiosk/Death/DeathForm.aspx/InsertDeathCertificate',
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
                        window.location.href = '../Forms/Attachment.aspx?SvcID=104&AppID=' + obj.AppID;
                    }

                });// end of Then function of main Data Insert Function

            return false;
        }
        
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

        function validateHhMm(inputField) {
            var isValid = /^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$/.test(inputField.value);

            if (isValid) {
                //alert('Please enter valid Time of Death');
                //inputField.foucs();
                // inputField.style.backgroundColor = '#bfa';
            } else {
                document.getElementById("TOD").focus();
                alert('Please enter valid Time of Death');                
                return false;
                //inputField.style.backgroundColor = '#fba';
            }

            return isValid;
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

            $('#DOD').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                maxDate: '-1d',
                yearRange: "-150:+0",
                onSelect: function (date) {

                    var t_DOD = $("#DOD").val();

                    var S_date = new Date(t_DOD.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                    var selectedYear = S_date.getFullYear(); // selected year

                    
                }
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

                    
                }
            });
            //$("#btnSubmit").bind("click", function (e) { return SubmitData(); });


        });

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
                <uc1:FormTitle runat="server" ID="FormTitle" />
                <uc1:ApplicationSteps runat="server" ID="ApplicationSteps" />
                <div class="row" id="divDeaethDetails" runat="server">

                    <div class="row">
                        <div class="col-md-12">
                            <%---Start of DeceasedDetails----%>
                            <div class="col-md-12 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Deceased Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="deceasedname">
                                                Name of Deceased</label>
                                            <input id="deceasedname" class="form-control" placeholder="Name of Deceased" name="deceasedname" type="text" value=""
                                            onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);"    autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="FatherName">
                                                {{resourcesData.lblAppFatherName}}</label>
                                            <input id="FatherName" class="form-control" placeholder="Deceased Father / Husband Name" name="Deceased Father / Husband Name" type="text" value=""
                                             onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);"   autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlGender">
                                                {{resourcesData.lblAppGender}}</label>
                                            <select class="form-control" data-val="true" data-val-number="Gender."
                                                data-val-required="Please select gender." id="ddlDeceasedGender" name="Gender">
                                                <option>Select Gender</option>
                                                <option>Male</option>
                                                <option>Female</option>
                                                <option>Transgender</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOD">
                                                {{resourcesData.lblDOD}}</label>
                                            <input id="DOD" class="form-control"  readonly="true" placeholder="dd/MM/yyyy" name="Date of Death" type="text" value="" maxlength="10"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="TOD">
                                                {{resourcesData.lblTOD}}</label>
                                            <input id="TOD" class="form-control" readonly="true" placeholder="HH:MM:SS" name="Time of Death" type="text" value="" onchange="validateHhMm(this);"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="DOD">
                                                {{resourcesData.lblDOB}}</label>
                                            <input id="DOB" class="form-control" readonly="true" placeholder="dd/MM/yyyy" name="Date of Birth" type="text" value="" maxlength="10"
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="applicantname">
                                                {{resourcesData.lblAppName}}</label>
                                            <input id="applicantname" class="form-control" placeholder="Applicanat Name" name="Applicanat Name" type="text" value=""
                                              onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);"  autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="applicantrelation">
                                                {{resourcesData.deceasedrelation}}</label>
                                            <input id="applicantrelation" class="form-control" placeholder="Relation with Deceased" name="Beneficiary Name" type="text" value=""
                                               onchange="return checkLength(this);" onkeypress="return ValidateAlpha(event);" autofocus />
                                        </div>
                                    </div>

                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <%----End of DeceasedDetails-----%>
                            <%---Start of DeceasedAddress----%>
                            <div class="col-md-12 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Deceased Address Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <uc1:Address runat="server" ID="Address1" />
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <%----End of DeceasedAddress-----%>
                            <%---Start of DeathPlace----%>
                            <div class="col-md-12 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Hospital (Death Place) Details
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="hospname">
                                                Name of Hospital</label>
                                            <input id="hospname" class="form-control" placeholder="Name of Account Holder" name="AccountHolder" type="text" value=""
                                          onchange="return checkLength(this);"  onkeypress="return AlphaNumeric(event);"  autofocus />
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
                            <%----End of DeathPlace-----%>

                            <%---Start of Button----%>
                            <div class="" id="divBtn" runat="server">
                                <div class="col-md-12 box-container">
                                    <div class="box-body box-body-open" style="text-align: center;">

                                        <input type="button" id="btnSubmit" class="btn btn-success" value="Next =>>" onclick="fnNext();" />
                                        <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                                            CssClass="btn btn-danger" PostBackUrl=""
                                            Text="Cancel" />
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
