<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KioskRegistration.aspx.cs" Inherits="CitizenPortal.WebApp.Registration.KioskRegistration" %>

<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/style.admin.css" rel="stylesheet" />
    <link href="../bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../Styles/timeline.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="../Styles/style.admin.css" rel="stylesheet" />
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />

    <script src="../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../Scripts/jquery.msgBox.js"></script>

    <script src="../../Scripts/angular.min.js"></script>
    <script src="../../PortalScripts/ServiceLanguage.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            //$.ajax({
            //    type: "POST",
            //    contentType: "application/json; charset=utf-8",
            //    url: 'KioskRegistration.aspx/GetDistrict',
            //    data: '{"prefix": ""}',
            //    processData: false,
            //    dataType: "json",
            //    success: function (response) {
            //        var districts = eval(response.d);
            //        var html = "";
            //        $("[id*=ddlDistrict]").append('<option value = "0">-Select-</option>');
            //        $.each(districts, function () {
            //            $("[id*=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            //            console.log(this.Id + ',' + this.Name);
            //        });

            //    },
            //    error: function (a, b, c) {
            //        alert("1." + a.responseText);
            //    }
            //});

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'KioskRegistration.aspx/GetState',
                data: '{"prefix": ""}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var arr = eval(response.d);
                    var html = "";
                    $("[id*=ddlState]").empty();
                    $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
                    $.each(arr, function () {
                        $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                    });

                },
                error: function (a, b, c) {
                    alert("1." + a.responseText);
                }
            });

            $("#ddlState").bind("change", function (e) { return GetDistrict(""); });
            $("#ddlDistrict").bind("change", function (e) { return GetSubDistrict(""); });
            $("#ddlTaluka").bind("change", function (e) { return GetVillage(""); });
            $("#btnConfirm").bind("click", function (e) { return CheckDeclaration(); });

            $('#Age').attr("readonly", true);


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
                    if (Age < 18) {
                        $('#DOB').val('');
                        alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
                        $('#Age').val('');
                        return false;
                    } else if (Age > 125) {
                        $('#Age').val('');
                        alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 125 years.');
                        $('#Age').val('');
                        return false;
                    }
                }
            });

            //Start: To Delete
            $('#UIDNo').val("1234567890");
            $('#PANNo').val("AAAAA1111A");
            $('#VoterID').val("123456");
            $('#MobileNo').val("9234567890");
            $('#EmailID').val("test@test.com");
            //$('#ddlTitle').val();
            $('#FirstName').val("FName");
            $('#LastName').val("LName");
            //$('#ddlGuardian').val();
            $('#FatherName').val("FatherName");
            $('#MotherName').val("MotherName");
            //$('#ddlDivineBody').val();
            //$('#DivinePart').val();
            $('#DOB').val("01/02/1980");
            $('#Age').val("36");
            $('#ddlGender').val("M");
            $('#FamilyIncome').val("100000");
            $('#AddressLine1').val("Line1");
            $('#AddressLine2').val("Line2");
            $('#RoadStreetName').val("RoadName");
            $('#LandMark').val("Landmark");
            $('#Locality').val("Locality");
            //$('#ddlState').val();
            //$('#ddlDistrict').val();
            //$('#ddlTaluka').val();
            //$('#ddlVillage').val();
            $('#PinCode').val("123456");
            $('#LoginID').val("test@test.com");
            $('#Password').val("123456");
            //End: To Delete

        });

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

        //var datavar = { "FName": "Name1", "LName": "Name2" };
        //var obj = {
        //    "hello": "world",
        //    "Test": datavar
        //};

        //document.body.innerHTML = "";
        //document.body.appendChild(document.createTextNode($.stringify(obj, null, 4)));

        //End: jQuery Extension Function

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

        function pincodeValidation(obj_txtpincode) {
            var pinmatch = /^[0-9]\d{5}$/;
            if (obj_txtpincode != null && obj_txtpincode.val() != '') {
                if (!pinmatch.test(obj_txtpincode.val())) {
                    return false;
                }
                else {
                    return true;
                }
                return false;
            }
        }

        function ValidateForm() {

            var text = "";
            var opt = "";

            /// Basic Information 
            var FirstName = $("#FirstName");
            var LastName = $("#LastName");
            var MobileNo = $("#MobileNo");
            var EmailID = $("#EmailID");
            var DOB = $("#DOB");
            var Age = $("#Age");
            var Gender = $("#ddlGender option:selected").text();

            //App address
            var AddressLine1 = $("#AddressLine1");
            var AddressLine2 = $("#AddressLine2");
            var RoadStreetName = $("#RoadStreetName");
            var LandMark = $("#LandMark");
            var Locality = $("#Locality");

            var State = $("#ddlState option:selected").text();
            var District = $("#ddlDistrict option:selected").text();
            var Taluka = $("#ddlTaluka option:selected").text();
            var Village = $("#ddlVillage option:selected").text();
            var Pincode = $("#PinCode");

            if (FirstName.val() == '') {
                text += "<br /> -Please enter First Name. ";
                opt = 1;
            }

            if (LastName.val() == '') {
                text += "<br /> -Please enter Last Name. ";
                opt = 1;
            }

            if (MobileNo.val() == '') {
                text += "<br /> -Please enter Mobile No. ";
                opt = 1;
            }

            if (MobileNo.val() != '') {
                var mobmatch1 = /^[789]\d{9}$/;
                if (!mobmatch1.test(MobileNo.val())) {
                    text += "<br /> -Please enter valid mobile Number.";
                    opt = 1;
                }
            }

            if (EmailID.val() == '') {
                text += "<br /> -Please enter EMail ID. ";
                opt = 1;
            }

            if (DOB.val() == '') {
                text += "<br /> -Please enter Date of Birth. ";
                opt = 1;
            }

            if ((Gender == '' || Gender == 'Select Gender')) {
                text += "<br /> -Please Select Gender. ";
                opt = 1;
            }

            if (AddressLine1 != null && AddressLine1.val() == '') {
                text += "<br /> -Please enter Care of Address. ";
                opt = 1;
            }

            if (State != null && (State == '' || State == '-Select-')) {
                text += "<br /> -Please select State.";
                opt = 1;
            }

            if (District != null && (District == '' || District == '---Select---')) {
                text += "<br /> -Please select District.";
                opt = 1;
            }

            if (Taluka != null && (Taluka == '' || Taluka == '---Select---')) {
                text += "<br /> -Please select Taluka.";
                opt = 1;
            }

            if (Village != null && (Village == '' || Village == '---Select---')) {
                text += "<br /> -Please select Village.";
                opt = 1;
            }
            if (Pincode != null && Pincode.val() == '') {
                text += "<br /> -Please enter Pincode.";
                opt = 1;
            }


            var pinmatch = /^[0-9]\d{5}$/;
            if (Pincode != null && Pincode.val() != '') {
                if (!pinmatch.test(Pincode.val())) {
                    text += "<br /> -Please enter valid pincode.";
                    opt = 1;
                }
            }

            if (opt == "1") {
                alertPopup("Please fill following information.", text);
                return false;
            }

            return true;

        }

        function CheckDeclaration() {
            var temp = "Gunwant";

            if (!ValidateForm()) {
                return;
            }

            var datavar = {
                "UIDNo": $('#UIDNo').val(),
                'PANNo': $('#PANNo').val(),
                'VoterID': $('#VoterID').val(),
                'MobileNo': $('#MobileNo').val(),
                'EmailID': $('#EmailID').val(),
                'Title': $('#ddlTitle').val(),
                'FirstName': $('#FirstName').val(),
                'LastName': $('#LastName').val(),
                'Guardian': $('#ddlGuardian').val(),
                'FatherName': $('#FatherName').val(),
                'MotherName': $('#MotherName').val(),
                'IsDivine': $('#ddlDivineBody').val(),
                'DivinePart': $('#DivinePart').val(),
                'DOB': $('#DOB').val(),
                'Age': $('#Age').val(),
                'Gender': $('#ddlGender').val(),
                'FamilyIncome': $('#FamilyIncome').val(),
                'AddressLine1': $('#AddressLine1').val(),
                'AddressLine2': $('#AddressLine2').val(),
                'RoadStreetName': $('#RoadStreetName').val(),
                'LandMark': $('#LandMark').val(),
                'Locality': $('#Locality').val(),
                'State': $('#ddlState').val(),
                'District': $('#ddlDistrict').val(),
                'Taluka': $('#ddlTaluka').val(),
                'Village': $('#ddlVillage').val(),
                'PinCode': $('#PinCode').val(),
                'LoginID': $('#LoginID').val(),
                'Password': $('#Password').val(),
                'ImagePath': '' //pImagePath

            };

            var obj = {
                "prefix": "'" + temp + "'",
                "Data": $.stringify(datavar, null, 4)
            };

            //console.log($.stringify(obj, null, 4));

            //$.ajax({
            //    type: "POST",
            //    contentType: "application/json; charset=utf-8",
            //    url: 'KioskRegistration.aspx/InsertData',
            //    data: $.stringify(obj, null, 4),
            //    processData: false,
            //    dataType: "json",
            //    success: function (response) {
            //        //var Submit = eval(response.d);
            //        var Submit = response.d;
            //        var html = "";
            //        alert("Final Result : " + Submit);

            //    },
            //    error: function (a, b, c) {
            //        alert("5." + a.responseText);
            //    }
            //});

            //var data = new FormData();
            fileData = document.getElementById("File1").files[0];

            $.ajax({
                //url: 'http://localhost:53333/FileService.svc/UploadFile?fileName=' + fileData.name, // Dynamically uploads the files which is chosen.
                url: 'KioskRegistration.aspx/InsertData',
                type: 'POST',
                data: fileData, // This would pass the file object with data
                cache: false,
                processData: false, // Don't process the files
                contentType: "application/octet-stream", // Setting content type to "application/octet-stream" as jQuery will tell the server its not query string. 
                success: function (data) {
                    alert('Successful..');
                },
                error: function (data) {
                    alert('Error Occurred');
                }
            });

            e.preventDefault();
            return false;
        }

        function GetDistrict(category) {
            var SelIndex = $("#ddlState").val();
            
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'KioskRegistration.aspx/GetDistrict',
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
                url: 'KioskRegistration.aspx/GetSubDistrict',
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
                url: 'KioskRegistration.aspx/GetVillage',
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

    </script>
</head>
<body>
    <form id="form1" runat="server">
            <div ng-app="appmodule">
        <div ng-controller="ctrl">
        <div>
            <div id="progressbar" class="modalBackground" runat="server" clientidmode="Static"
                style="display: none;">
                <center style="z-index: 105; left: 45%; position: absolute; top: 50%">
        <img id="imgloader" alt="" runat="server" src="../Images/waiting.gif"
             style="width: 150px;" />
        <center style="font-size: 15px; font-weight: bold; color: Maroon">
            <br />
            Please Wait It's Processing
        </center>
    </center>
            </div>
            <div id="wrapper">
                <div id="page-wrapper" style="min-height: 500px !important;">
                    <div class="row">
                    </div>
                    <%---Start of Steps----%>
                    <div class="row" id="divSteps" style="display: none">
                        <div class="col-md-12 box-container" style="padding: 0;">
                            <div class="text-danger text-danger-green mt0">
                                <div class="col-md-12" style="margin: 0 auto; width: 100%;">
                                    <div class="step1" id="step1">
                                        <p class="steptext">
                                            1
                                        </p>
                                        <p class="optiontext">
                                            Fill the Application
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step2" id="step2">
                                        <p class="steptext">
                                            2
                                        </p>
                                        <p class="optiontext">
                                            Submited the Application
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step3" id="step3">
                                        <p class="steptext">
                                            3
                                        </p>
                                        <p class="optiontext">
                                            P
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step4" id="step4">
                                        <p class="steptext">
                                            4
                                        </p>
                                        <p class="optiontext">
                                            Receipt Generated
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step5" id="step5">
                                        <p class="steptext">
                                            5
                                        </p>
                                        <p class="optiontext">
                                            Pending for Signature
                                        </p>
                                    </div>
                                    <div class="arrow-line">
                                    </div>
                                    <div class="step6" id="step6">
                                        <p class="steptext">
                                            6
                                        </p>
                                        <p class="optiontext">
                                            Certificate Generated
                                        </p>
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%---END of Steps-----%>
                    <%---Start of Instruction----%>
                    <div class="row">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">KIOSK Registration
                                </h4>
                            </div>
                            <div class="">
                                <ul class="list-group">
                                    <li class="list-group-item list-group-item-info">
                                        <span><i class="fa fa-gear fa-fw"></i>Instruction</span>
                                        <ul class="">
                                            <li>All asterisk  (*) marked field are mandatory
                                            </li>
                                            <li>UID / Voter Id No / PAN No is mandatory
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="list-group-item list-group-item-success">
                                        <span class=""><i class="fa fa-gear fa-fw"></i>Applicant Photograph</span>
                                        <ul class="">
                                            <li>Photograph Format should be JPG/JPEG/ PNG/ TIFF
                                            </li>
                                            <li>The size of the photograph should fall between 5KB to 20KB
                                            </li>
                                            <li>The width of the photograph should be 160 pixels
                                            </li>
                                            <li>The height of the photograph should fall between 200 to 212 pixels
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="list-group-item list-group-item-info">
                                        <span><i class="fa fa-gear fa-fw"></i>Verification</span>
                                        <ul class="">
                                            <li>Verify the mobile and email id, through verification code send through SMS and email
                                            </li>
                                            <li>Enter the captcha to verify youself
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%---END of Instruction-----%>
                    <div class="row">
                        <%---Start of Verification----%>
                        <div class="col-md-9 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Authenticate User
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="lblAadhar">
                                            UID Aadhar No.
                                        </label>
                                        <input id="UIDNo" class="form-control" placeholder="Enter 12 Digit Aadhar No." name="lblAadhar" type="text" value="" maxlength="12" pattern="[0-9]{12}" dir="auto"
                                            autofocus title="Enter valid 12 digit Aadhar No." required />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="lblPanNo">
                                            PAN No.
                                        </label>
                                        <input id="PANNo" class="form-control" placeholder="Enter PAN No. (AAAAA1111A)" name="lblPanNo" type="text" value="" maxlength="10" pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}"
                                            required title="Please enter valid PAN No. (AAAAA1111A)" autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="lblVoterId">
                                            Voter ID No.
                                        </label>
                                        <input id="VoterID" class="form-control" placeholder="Voter ID No." name="lblVoterId" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="lblMobileNo">
                                            Mobile No.
                                        </label>
                                        <input id="MobileNo" class="form-control" placeholder="Enter 10 Digit Mobile No." name="lblMobileNo" type="text" value="" maxlength="10" pattern="(7|8|9)[0-9]{10}" required
                                            title="Please enter valid mobile no." autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="CompanyName">
                                            Mobile No. OTP Verification
                                        </label>
                                        <input class="form-control" placeholder="6 Digit Code received as SMS" name="OTPVerification" type="text" value="" pattern="[0-9]{6}"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="lblEmailId">
                                            Email Id
                                        </label>
                                        <input id="EmailID" class="form-control" placeholder="Email Id" name="lblEmailId" type="email" value="" required title="Please enter valid email id"
                                            autofocus maxlength="50" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            Email Id Verification
                                        </label>
                                        <input class="form-control" placeholder="Enter text send in register email id" name="EmailIdVerification" type="email" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                        <%---END of Verification-----%>
                        <%---Start of PhotoUpload----%>
                        <div class="col-md-3 box-container">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Applicant Photograph
                                </h4>
                            </div>
                            <div class="panel panel-success">
                                <div class="panel-body">
                                    <div class="alert alert-info col-xs-12 col-sm-6 col-md-12 col-lg-12" style="display: none">
                                        Please, upload your recent pasport size photograph size between 200 to 250 pixels.
                                    </div>
                                    <div class="col-lg-12">
                                        <img class="form-control" src="../Images/photo.png" name="photocustomer" style="height: 220px" />
                                        <input class="camera"
                                            id="File1" name="Photoupload" type="file">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%---END of PhotoUpload-----%>
                    </div>
                    <%---Start of Personal----%>
                    <div class="row">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Applicant's Details
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="">
                                            Title/Initial
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="State."
                                            data-val-required="Please select Title." id="ddlTitle" name="State">
                                            <option>Mr.</option>
                                            <option>Mrs</option>
                                            <option>Master</option>
                                            <option>Miss</option>
                                            <option>Sir</option>
                                            <option>Madam</option>
                                            <option>Dr.</option>
                                            <option>Dr.(smt)</option>
                                            <option>Prof.</option>
                                            <option>Justice</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            First Name
                                        </label>
                                        <input id="FirstName" class="form-control" placeholder="First Name" name="First Name" type="text" value="" maxlength="20"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Last Name
                                        </label>
                                        <input id="LastName" class="form-control" placeholder="Last Name" name="Last Name" type="text" value="" maxlength="20"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="">
                                            Guardian
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="State."
                                            data-val-required="Please select Guardian" id="ddlGuardian" name="Guardian">
                                            <option>Father</option>
                                            <option>Husband</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Guardian (Father / Husband) Name
                                        </label>
                                        <input id="FatherName" class="form-control" placeholder="Last Name" name="Last Name" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Mother's Maiden Name
                                        </label>
                                        <input id="MotherName" class="form-control" placeholder="Last Name" name="Last Name" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Is Divine Body
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="DivineBosy."
                                            data-val-required="Please select gender." id="ddlDivineBody" name="DivineBody">
                                            <option>Select</option>
                                            <option>No</option>
                                            <option>Yes</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Divine Part
                                        </label>
                                        <input id="DivinePart" class="form-control" placeholder="Divine Part" name="Divine Part" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Date of Birth
                                        </label>
                                        <input id="DOB" class="form-control" name="Date of Birth" type="date" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-1">
                                    <div class="form-group">
                                        <label class="" for="ddlYearTerm">
                                            Age
                                        </label>
                                        <input id="Age" class="form-control" name="Age" value="" min="18" max="99"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            Gender
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="Gender."
                                            data-val-required="Please select gender." id="ddlGender" name="Gender">
                                            <option>Select Gender</option>
                                            <option value="M">Male</option>
                                            <option value="F">Female</option>
                                            <option value="T">Transgender</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="" for="ddlYearTerm">
                                            Family Annual Income
                                        </label>
                                        <input id="FamilyIncome" class="form-control" name="Income" type="number" value="" min="1000" max="900000"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%---END of Personal-----%>
                    <%---Start of PostalAddress----%>
<%--                    <div class="row">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Postal Address
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlYearTerm">
                                            Address Line-1 (Care of)
                                        </label>
                                        <input class="form-control" placeholder="First Line Address" name="Address Line-1 (Care of)" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="" for="Village">
                                            Address Line-2 (Building)
                                        </label>
                                        <input class="form-control" placeholder="Second Line Address" name="Address Line-2 (Building)" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Road / Street Name
                                        </label>
                                        <input class="form-control" placeholder="Road / Street Name" name="Road / Street Name" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label class="" for="ddlYearTerm">
                                            Landmark
                                        </label>
                                        <input class="form-control" placeholder="Landmark" name="Landmark" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Locality
                                        </label>
                                        <input class="form-control" placeholder="Locality" name="Locality" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            State
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="State."
                                            data-val-required="Please select gender." id="ddlState" name="State">
                                            <option>Select Sate</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Sikkim</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            District
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="District."
                                            data-val-required="Please select District." id="ddlDistrict" name="District">
                                            <option>Select District</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Sikkim</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            Taluka
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="Taluka."
                                            data-val-required="Please select gender." id="ddlTaluka" name="Taluka">
                                            <option>Select Taluka</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Sikkim</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="ddlGender">
                                            City/Town/Village
                                        </label>
                                        <select class="form-control" data-val="true" data-val-number="State."
                                            data-val-required="Please select gender." id="ddlVillage" name="State">
                                            <option>Select Village</option>
                                            <option>Assam</option>
                                            <option>Bihar</option>
                                            <option>Sikkim</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="PIN">
                                            PIN
                                        </label>
                                        <input class="form-control" placeholder="PIN" name="PIN" type="" value="" max-length="6"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <uc1:Address runat="server" id="Address" />
                    <%---END of PostalAddress-----%>
                    <%---Start of Verification----%>
                    <div class="row">
                        <div class="col-md-12 box-container mTop15">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Login Credential
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12 margin-btm">
                                    <div class="alert-info col-sm-6 col-md-6 col-lg-12 padding10" id="divCredential">
                                        <span style="font-weight:bold; margin-bottom: 5px">Password must include:</span><br />
                                        <span>1. Minimum of Eight (8) character<br />
                                            2. One character must be in CAPS (Capital Alphabet A-Z)
                                <br />
                                            3. One character must be in Numeric&nbsp;(0-9) and<br />
                                            4. One character must be special character (!@#$%^&amp;*)
                                        </span>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Login Id
                                        </label>
                                        <input id="LoginID" class="form-control" name="Login Id" type="text" value="" placeholder="Enter Login Id" maxlength="20"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="" for="Village">
                                            &nbsp;
                                        </label>
                                        <input type="button" id="btnAvability" class="btn btn-danger" value="Check Login Id Avability" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="lblPassword">
                                            Password
                                        </label>
                                        <input id="Password" class="form-control" name="Password" placeholder="Enter Password" type="password" value="" maxlength="20"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <label class="manadatory" for="lblConPassword">
                                            Confirm Password
                                        </label>
                                        <input class="form-control" name="Confirm Password" type="password" placeholder="Confrim Password" value="" maxlength="20"
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%---END of Verification-----%>
                    <%---Start of Declaration----%>
                    <div class="row">
                        <div class="col-md-12 box-container" id="Div2">
                            <div class="box-heading">
                                <h4 class="box-title register-num">Declaration
                                </h4>
                            </div>
                            <div class="box-body box-body-open">
                                <div class="col-sm-6 col-md-6 col-lg-12">
                                    <div class="text-danger text-danger-green">
                                        <p class="text-justify">
                                            <input type="checkbox" runat="server" id="disclaimercheck" onclick="javascript: declaration(this.checked, '1');" />
                                            I &nbsp;<span id="spndecl" style="text-decoration: underline; text-transform: capitalize; font-weight: bold;"></span>&nbsp; solemnly affirm that the above mentioned information submitted by me is
                                true and correct to my knowledge and and if anything contrary to the above is found, I will be liable for punishment/penalty under Section193(2),199 &amp; 200 of the Indian Penal Code.
                                        </p>
                                    </div>
                                </div>
                                <div class="clearfix">
                                    &nbsp;
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3">
                                    <div class="form-group">
                                        <img src="" height="70" width="250" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                                    <div class="form-group">
                                        <label class="" for="Village">
                                            &nbsp;
                                        </label>
                                        <input type="button" id="btnRefresh" class="btn btn-danger" value="Refresh Captcha" />
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <label class="manadatory" for="Village">
                                            Enter Captcha Code
                                        </label>
                                        <input class="form-control" placeholder="Verify yourself" name="Captcha" type="text" value=""
                                            autofocus />
                                    </div>
                                </div>
                                <div class="clearfix">
                                </div>

                            </div>
                        </div>
                    </div>
                    <%---END of Declaration-----%>
                    <%---Start of Button----%>
                    <div class="row">
                        <div class="col-md-12 box-container" id="divBtn">
                            <div class="box-body box-body-open" style="text-align: center;">
                                <%--<asp:Button ID="btnConfirm" runat="server" Text="Submit" class="btn btn-success"
                                OnClientClick="return checkDeclaration();" />--%>
                                <input type="button" id="btnConfirm" class="btn btn-success" value="Submit" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>
                    <%---END of Button-----%>
                </div>
            </div>
        </div>
        </div></div>
    </form>
</body>
</html>
