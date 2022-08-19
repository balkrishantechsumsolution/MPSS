<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="SeniorCitizen.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.SeniorCitizen" %>

<%@ Register Src="~/WebApp/Control/Infomation.ascx" TagPrefix="uc1" TagName="Infomation" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/AadhaarDetail.ascx" TagPrefix="uc1" TagName="AadhaarDetail" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../../Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="../../../Scripts/jquery.msgBox.js"></script>


    <link href="../../../PortalStyles/msgBoxLight.css" rel="stylesheet" />

    <script src="../../../Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="../../../Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="../../../Scripts/fileupload/jquery.fileupload.js"></script>
    <%--<script src="../../../Scripts/angular.min.js"></script>--%>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="../../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />

    <script type="text/javascript">

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

        // jqXHRData needed for grabbing by data object of fileupload scope
        var jqXHRData_IMG;
        var jqXHRData_AGE;
        var jqXHRData_RESIDENCE;
        var jqXHRData_DOMICILE;
        var jqXHRData_OTHER;

        var jqXHRData_IMG_result;
        var jqXHRData_AGE_result;
        var jqXHRData_RESIDENCE_result;
        var jqXHRData_DOMICILE_result;
        var jqXHRData_OTHER_result;
        var m_ServiceID;

        //Document ready Function
        $(document).ready(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '../../Registration/KioskRegistration.aspx/GetState',
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

            //$(function () {
            //    $('#btnUpload').click(function () {

            //    });
            //})


            $(function () {
                $("#Photo").change(function () {
                    if (this.files && this.files[0]) {
                        var reader = new FileReader();
                        reader.onload = imageIsLoaded;
                        reader.readAsDataURL(this.files[0]);
                    }
                });
            });

            function imageIsLoaded(e) {
                $('#imgPhoto').attr('src', e.target.result);
            };

            m_ServiceID = $('#HFServiceID').val();
            //alert(m_ServiceID);

            //Initialization of fileupload
            //initSimpleFileUpload();

            ////Start: To Delete            
            //$('#MobileNo').val("9234567890");
            //$('#EmailID').val("test@test.com");
            //$('#FirstName').val("FName");
            //$('#LastName').val("LName");
            //$('#DOB').val("01/02/1980");
            //$('#Age').val("36");
            //$('#ddlGender').val("M");
            //$('#AddressLine1').val("Line1");
            //$('#AddressLine2').val("Line2");
            //$('#RoadStreetName').val("RoadName");
            //$('#LandMark').val("Landmark");
            //$('#Locality').val("Locality");
            //$('#PinCode').val("123456");
            ////End: To Delete

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

        function getExtension(path) {
            var basename = path.split(/[\\/]/).pop(),  // extract file name from full path ...
                                                       // (supports `\\` and `/` separators)
                pos = basename.lastIndexOf(".");       // get last position of `.`

            if (basename === "" || pos < 1)            // if file name is empty or ...
                return "";                             //  `.` not found (-1) or comes first (0)

            return basename.slice(pos + 1);            // extract extension ignoring `.`
        }

        function CheckDeclaration() {

            if (!ValidateForm()) {
                return;
            }

            var temp = "Gunwant";
            var AppID = "";
            var result = false;
            var DOBArr = $('#DOB').val().split("/");
            var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

            var datavar = {
                'MobileNo': $('#MobileNo').val(),
                'EmailID': $('#EmailID').val(),
                'FirstName': $('#FirstName').val(),
                'LastName': $('#LastName').val(),
                'DOB': DOBConverted,
                'Age': $('#Age').val(),
                'Gender': $('#ddlGender').val(),
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
                'ImagePath': '' //pImagePath

            };

            var obj = {
                "prefix": "'" + temp + "'",
                "Data": $.stringify(datavar, null, 4)
            };

            //console.log($.stringify(obj, null, 4));

            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '../../Registration/KioskRegistration.aspx/InsertSeniorCitizen',
                    data: $.stringify(obj, null, 4),
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        //var Submit = eval(response.d);
                        //var Submit = response.d;
                        /*
                        var obj = jQuery.parseJSON(response.d);
                        var html = "";
                        AppID = obj.AppID;
                        result = true;
                        //alert("Application ID : " + obj.AppID);
                        //window.location.href = 'ConfirmPayment.aspx?SvcID=101&AppID=' + obj.AppID;


                        if (AppID != "") {
                            var fileUpload = $("#Photo").get(0);
                            var files = fileUpload.files;
                            var test = new FormData();
                            var fileName = "";

                            for (var i = 0; i < files.length; i++) {
                                fileName = AppID + "_Profile." + getExtension(files[i].name);
                                test.append(fileName, files[i]);
                            }

                            //fileUpload = $("#FileAge").get(0);
                            //files = fileUpload.files;
                            //for (var i = 0; i < files.length; i++) {
                            //    fileName = AppID + "_Age." + getExtension(files[i].name);
                            //    test.append(fileName, files[i]);
                            //}

                            //fileUpload = $("#FileResidence").get(0);
                            //files = fileUpload.files;
                            //for (var i = 0; i < files.length; i++) {
                            //    fileName = AppID + "_Residence." + getExtension(files[i].name);
                            //    test.append(fileName, files[i]);
                            //}

                            //fileUpload = $("#FileDomicile").get(0);
                            //files = fileUpload.files;
                            //for (var i = 0; i < files.length; i++) {
                            //    fileName = AppID + "_Domicile." + getExtension(files[i].name);
                            //    test.append(fileName, files[i]);
                            //}

                            //fileUpload = $("#FileOther").get(0);
                            //files = fileUpload.files;
                            //for (var i = 0; i < files.length; i++) {
                            //    fileName = AppID + "_Other." + getExtension(files[i].name);
                            //    test.append(fileName, files[i]);
                            //}

                            test.append("AppID", AppID);
                            test.append("KioskID", "");
                            
                            $.when(
                                $.ajax({
                                    url: "../../fileUploader.ashx",
                                    type: "POST",
                                    contentType: false,
                                    processData: false,
                                    data: test,
                                    // dataType: "json",
                                    success: function (result) {
                                        result = true;
                                        alert(result);
                                    },
                                    //error: function (err) {
                                    //    result = false;
                                    //    alert("6." + err.statusText);
                                    //}
                                    error: function (a, b, c) {
                                        alert("6." + a.responseText);
                                    }
                                })

                                ).then(function (data, textStatus, jqXHR) {
                                //alert(jqXHR.status); // Alerts 200

                                if (result) {
                                    alert("Application ID : " + obj.AppID);
                                    window.location.href = 'ConfirmPayment.aspx?SvcID=101&AppID=' + obj.AppID;
                                }
                            });

                            
                        } //end of if (AppID != "")

                        */




                    },
                    error: function (a, b, c) {
                        result = false;
                        alert("5." + a.responseText);
                    }
                })
                ).then(function (data, textStatus, jqXHR) {
                    //alert( jqXHR.status ); // Alerts 200



                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    AppID = obj.AppID;
                    result = true;
                    //alert("Application ID : " + obj.AppID);
                    //window.location.href = 'ConfirmPayment.aspx?SvcID=101&AppID=' + obj.AppID;


                    if (AppID != "") {
                        var fileUpload = $("#Photo").get(0);
                        var files = fileUpload.files;
                        var test = new FormData();
                        var fileName = "";
                        var Is_FileProfile, Is_FileAge, Is_FileResidence, Is_FileDomicile, Is_FileOther;
                        var FileProfile, FileAge, FileResidence, FileDomicile, FileOther;

                        Is_FileProfile = Is_FileAge = Is_FileResidence = Is_FileDomicile = Is_FileOther = false;
                        FileProfile = FileAge = FileResidence = FileDomicile = FileOther = false;


                        //                        if (jqXHRData_IMG) {
                        //                            //test.append(fileName, files[i]);
                        //                            //test.append("AppID", AppID);
                        //                            //test.append("KioskID", "");
                        //                            fileName = AppID + "_Profile." + getExtension(jqXHRData_IMG.files[0].name);
                        //                            jqXHRData_IMG.formData = { "AppID": AppID, "KioskID": "", "FileName": fileName };
                        //                            var temp = jqXHRData_IMG.submit().success(function (result, textStatus, jqXHR) {

                        //                                if (result.isValid) {

                        //                                }
                        //                                else {

                        //                                }
                        //                            })
                        //.error(function (jqXHR, textStatus, errorThrown) {
                        //    if (typeof (jqXHR) != 'undefined' || typeof (textStatus) != 'undefined' || typeof (errorThrown) != 'undefined') {
                        //        alert(textStatus + errorThrown + jqXHR);
                        //    }
                        //});
                        //                        }


                        //if (jqXHRData_AGE) {
                        //    jqXHRData_AGE.formData = { "AppID": "123456", "KioskID": "", "FileName": "File2" };
                        //    jqXHRData_AGE.submit();
                        //}


                        // Old File Upload Logic
                        //File Profile Image
                        for (var i = 0; i < files.length; i++) {
                            fileName = AppID + "_Profile." + getExtension(files[i].name);
                            test.append(fileName, files[i]);
                            Is_FileProfile = true;
                        }

                        if (Is_FileProfile) {
                            test.append("AppID", AppID);
                            test.append("KioskID", "");
                            var t_Loop = true;

                            //while (t_Loop)
                            {
                                $.when(
                                $.ajax({
                                    url: "../../fileUploader.ashx",
                                    type: "POST",
                                    contentType: false,
                                    processData: false,
                                    data: test,
                                    // dataType: "json",
                                    success: function (result) {
                                        FileProfile = true;
                                        //alert(result);
                                    },
                                    //error: function (err) {
                                    //    result = false;
                                    //    alert("6." + err.statusText);
                                    //}
                                    error: function (a, b, c) {
                                        FileProfile = false;
                                        //alert("6." + a.responseText);
                                    }
                                })

                                ).then(function (data, textStatus, jqXHR) {
                                    //alert(jqXHR.status); // Alerts 200
                                    t_Loop = false;

                                });
                            }//end of while function

                        }// end of if (Is_FileProfile)

                        //File Age 
                        test = new FormData();
                        fileUpload = $("#FileAge").get(0);
                        files = fileUpload.files;
                        for (var i = 0; i < files.length; i++) {
                            fileName = AppID + "_Age." + getExtension(files[i].name);
                            test.append(fileName, files[i]);
                            Is_FileAge = true;
                        }

                        if (Is_FileAge) {
                            test.append("AppID", AppID);
                            test.append("KioskID", "");
                            var t_Loop = true;

                            //while (t_Loop)
                            {
                                $.when(
                                $.ajax({
                                    url: "../../fileUploader.ashx",
                                    type: "POST",
                                    contentType: false,
                                    processData: false,
                                    data: test,
                                    // dataType: "json",
                                    success: function (result) {
                                        FileAge = true;
                                        //alert(result);
                                    },
                                    //error: function (err) {
                                    //    result = false;
                                    //    alert("6." + err.statusText);
                                    //}
                                    error: function (a, b, c) {
                                        FileAge = false;
                                        //alert("7." + a.responseText);
                                    }
                                })

                                ).then(function (data, textStatus, jqXHR) {
                                    //alert(jqXHR.status); // Alerts 200
                                    t_Loop = false;

                                });
                            }
                        }// end of if (Is_FileAge)

                        //File Residence

                        test = new FormData();
                        fileUpload = $("#FileResidence").get(0);
                        files = fileUpload.files;
                        for (var i = 0; i < files.length; i++) {
                            fileName = AppID + "_Residence." + getExtension(files[i].name);
                            test.append(fileName, files[i]);
                            Is_FileResidence = true;
                        }

                        if (Is_FileResidence) {
                            test.append("AppID", AppID);
                            test.append("KioskID", "");
                            var t_Loop = true;

                            //while (t_Loop)
                            {
                                $.when(
                                                            $.ajax({
                                                                url: "../../fileUploader.ashx",
                                                                type: "POST",
                                                                contentType: false,
                                                                processData: false,
                                                                data: test,
                                                                // dataType: "json",
                                                                success: function (result) {
                                                                    FileResidence = true;
                                                                    //alert(result);
                                                                },
                                                                //error: function (err) {
                                                                //    result = false;
                                                                //    alert("6." + err.statusText);
                                                                //}
                                                                error: function (a, b, c) {
                                                                    FileResidence = false;
                                                                    //alert("8." + a.responseText);
                                                                }
                                                            })

                                                            ).then(function (data, textStatus, jqXHR) {
                                                                //alert(jqXHR.status); // Alerts 200
                                                                t_Loop = false;

                                                            });
                            }
                        }//end of if (Is_FileResidence)



                        //File Domicile
                        test = new FormData();
                        fileUpload = $("#FileDomicile").get(0);
                        files = fileUpload.files;
                        for (var i = 0; i < files.length; i++) {
                            fileName = AppID + "_Domicile." + getExtension(files[i].name);
                            test.append(fileName, files[i]);
                            Is_FileDomicile = true;
                        }

                        if (Is_FileDomicile) {
                            test.append("AppID", AppID);
                            test.append("KioskID", "");
                            var t_Loop = true;

                            //while (t_Loop)
                            {
                                $.when(
                                                          $.ajax({
                                                              url: "../../fileUploader.ashx",
                                                              type: "POST",
                                                              contentType: false,
                                                              processData: false,
                                                              data: test,
                                                              // dataType: "json",
                                                              success: function (result) {
                                                                  FileDomicile = true;
                                                                  //alert(result);
                                                              },
                                                              //error: function (err) {
                                                              //    result = false;
                                                              //    alert("6." + err.statusText);
                                                              //}
                                                              error: function (a, b, c) {
                                                                  FileDomicile = false;
                                                                  //alert("9." + a.responseText);
                                                              }
                                                          })

                                                          ).then(function (data, textStatus, jqXHR) {
                                                              //alert(jqXHR.status); // Alerts 200
                                                              t_Loop = false;

                                                          });
                            }
                        }// end of if (Is_FileDomicile)

                        //File Other
                        test = new FormData();
                        fileUpload = $("#FileOther").get(0);
                        files = fileUpload.files;
                        for (var i = 0; i < files.length; i++) {
                            fileName = AppID + "_Other." + getExtension(files[i].name);
                            test.append(fileName, files[i]);
                            Is_FileOther = true;
                        }

                        if (Is_FileOther) {
                            test.append("AppID", AppID);
                            test.append("KioskID", "");
                            var t_Loop = true;

                            //while (t_Loop)
                            {
                                $.when(
                                                        $.ajax({
                                                            url: "../../fileUploader.ashx",
                                                            type: "POST",
                                                            contentType: false,
                                                            processData: false,
                                                            data: test,
                                                            // dataType: "json",
                                                            success: function (result) {
                                                                FileOther = true;
                                                                //alert(result);
                                                            },
                                                            //error: function (err) {
                                                            //    result = false;
                                                            //    alert("6." + err.statusText);
                                                            //}
                                                            error: function (a, b, c) {
                                                                FileOther = false;
                                                                //alert("10." + a.responseText);
                                                            }
                                                        })

                                                        ).then(function (data, textStatus, jqXHR) {
                                                            //alert(jqXHR.status); // Alerts 200
                                                            t_Loop = false;

                                                        });
                            }
                        }// end of if (Is_FileOther)



                    } //end of if (AppID != "")

                    if (result /*&& jqXHRData_IMG_result*/) {
                        alert("Application submitted successfully. Application ID : " + obj.AppID);
                        window.location.href = 'ConfirmPayment.aspx?SvcID=101&AppID=' + obj.AppID;
                    }

                });// end of Then function of main Data Insert Function


            //e.preventDefault();
            return false;
        }

        function editAddrProcessRslt(message) {
            alert("message: " + message);
        }


        //Function for initializing the File Upload Object
        function initSimpleFileUpload() {
            'use strict';
            //data-url="../../../UploadHandler_4_0.aspx"
            $('#Photo').fileupload({
                url: '/../../../UploadHandler_4_0.aspx',
                dataType: 'json',
                add: function (e, data) {
                    jqXHRData_IMG = data
                },
                done: function (event, data) {
                    if (data.result.isUploaded) {
                        jqXHRData_IMG_result = true;
                        editAddrProcessRslt("Completed");
                    }
                    else {
                        editAddrProcessRslt(data.result.message);
                    }
                    alert(data.result.message);
                },
                fail: function (event, data) {
                    if (data.files[0].error) {
                        alert(data.files[0].error);
                        editAddrProcessRslt(data.files[0].error);
                    }
                }
            });

            //Start: Age File Upload
            $('#FileAge').fileupload({
                //url: '/File/UploadFile',
                dataType: 'json',
                add: function (e, data) {
                    jqXHRData_AGE = data
                },
                done: function (event, data) {
                    if (data.result.isUploaded) {

                    }
                    else {

                    }
                    alert(data.result.message);
                },
                fail: function (event, data) {
                    if (data.files[0].error) {
                        alert(data.files[0].error);
                    }
                }
            });
            //End: Age File Upload

            //Start: Residence File Upload
            $('#FileResidence').fileupload({
                //url: '/File/UploadFile',
                dataType: 'json',
                add: function (e, data) {
                    jqXHRData_RESIDENCE = data
                },
                done: function (event, data) {
                    if (data.result.isUploaded) {

                    }
                    else {

                    }
                    alert(data.result.message);
                },
                fail: function (event, data) {
                    if (data.files[0].error) {
                        alert(data.files[0].error);
                    }
                }
            });
            //End: Residence File Upload

            //Start: Domicile File Upload
            $('#FileDomicile').fileupload({
                //url: '/File/UploadFile',
                dataType: 'json',
                add: function (e, data) {
                    jqXHRData_DOMICILE = data
                },
                done: function (event, data) {
                    if (data.result.isUploaded) {

                    }
                    else {

                    }
                    alert(data.result.message);
                },
                fail: function (event, data) {
                    if (data.files[0].error) {
                        alert(data.files[0].error);
                    }
                }
            });
            //End: Domicile File Upload

            //Start: Other File Upload
            $('#FileOther').fileupload({
                //url: '/File/UploadFile',
                dataType: 'json',
                add: function (e, data) {
                    jqXHRData_OTHER = data
                },
                done: function (event, data) {
                    if (data.result.isUploaded) {

                    }
                    else {

                    }
                    alert(data.result.message);
                },
                fail: function (event, data) {
                    if (data.files[0].error) {
                        alert(data.files[0].error);
                    }
                }
            });
            //End: Other File Upload


        }

        function GetDistrict(category) {
            var SelIndex = $("#ddlState").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '../../Registration/KioskRegistration.aspx/GetDistrict',
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
                url: '../../Registration/KioskRegistration.aspx/GetSubDistrict',
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
                url: '../../Registration/KioskRegistration.aspx/GetVillage',
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
        //app.value("serviceID", $('#HFServiceID').val());


        function validateUID(UIDVal) {
            debugger;
            if (UIDVal == "1") {
                var UID = $("#UID").val();
                var length = UID.length;

                if ($("#UID").val() == "") {
                    alert("Please enter UID number.");
                    //$("#UID").focus();
                    return false;
                }
                if (eval(length) < 12) {
                    alert("UID should be 12 digit");
                    $("#UID").val("");

                    return false;
                }

            }
        }
        function openWindow(UIDVal, value, SessionName) {
            debugger;
            if (validateUID(UIDVal) != false) {
                var code = "";
                if (UIDVal == "1") {
                    code = $("#UID").val();
                }

                var EID = "0";
                var left = (screen.width / 2) - (560 / 2);
                var top = (screen.height / 2) - (400 / 2);
                if (value == "1") {
                    //                    window.open('../UIDValidation/VerifyUID.aspx?UID=' + code + '&EID=' + EID + '&E=N&SessionName=' + SessionName, 'open_window', ' width=560, height=450, top=' + top + ', left=' + left);
                    window.open('/UIDValidation/VerifyUID.aspx?UID=' + code + '&EID=' + EID + '&E=N&SessionName=' + SessionName, 'open_window', ' width=800, height=600, top=' + top + ', left=' + left);
                }
                else if (value == "2") {
                    //window.open('/UIDValidation/UID_OTP.aspx?UID=' + code + '&EID=' + EID + '&SessionName=' + SessionName, 'open_window', ' width=560, height=450, top=' + top + ', left=' + left);
                    //var urlToForward = $('#hdnKycRequestUrl').val() + '?aadhaarNumber=' + code + '&kycTypesToUse=OTP&transactionId=<%=Guid.NewGuid().ToString()%>';
                    //window.location = urlToForward;

                    window.open('/UID/KycRequest.aspx?aadhaarNumber=' + code + '&kycTypesToUse=OTP&transactionId=<%=Guid.NewGuid().ToString()%>', 'open_window',
                        ' width=800, height=600, top=' + top + ', left=' + left);

                }
        }
    }
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
                <%--<uc1:Infomation runat="server" ID="Infomation" />--%>
                <%---Start of Instruction----%>
                <%--<div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading" id="Div4">
                            <h4 class="box-title register-num">APPLICATION FOR SENIOR CITIZEN CERTIFICATE
                            </h4>--%>
                <uc1:FormTitle runat="server" ID="FormTitle" />
                <%--</div>
                        <div class="">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-info">
                            <span><i class="fa fa-gear fa-fw"></i>Instructions</span>
                            <ul class="">
                                <li>All asterisk (*) marked field are mandatory
                                </li>
                                <li>The applicant age must be 60 years and greater
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
                            <span><i class="fa fa-gear fa-fw"></i>Document Attachment</span>
                            <ul class="">
                                <li>Supported document can be JPG/JPEG/ DOC/ PDF
                                </li>
                                <li>The supporting file size must be less than 500KB
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clearfix">
                    </div>
                </div>
                    </div>
                </div>--%>
                <%----END of Instruction-----%>

                <%----Start of Aadhar-----%>
                <div class="row">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">{{resourcesData.aadhaar}}
                            </h4>
                        </div>
                        <%--<uc1:aadhaardetail runat="server" ID="AadhaarDetail" />--%>
                        <uc1:SearchRecord runat="server" ID="SearchRecord" />
                    </div>
                </div>
                <%-----End of Aadhar------%>

                <%---Start of Instruction----%>
                <div class="row">
                    <%---Start of PhotoNDetail----%>
                    <div class="col-md-3 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">{{resourcesData.lblAppPhotograph}}
                            </h4>
                        </div>
                        <div class="panel panel-success">
                            <div class="panel-body">
                                <div class="alert alert-info col-xs-12 col-sm-6 col-md-12 col-lg-12" style="display: none">
                                    Please, upload your recent pasport size photograph size between 200 to 250 pixels.
                                </div>
                                <div class="col-lg-12">
                                    <img id="imgPhoto" class="form-control" src="../Images/photo.png" name="photocustomer" style="height: 220px" />
                                    <%--<a href="#" title="Click to capture Photo of PHOTO ID through camera">
                                        <img src="../Images/camera.png" class="camera" name="photodocument" /></a>--%>
                                    <input class="camera"
                                        id="Photo" name="Photoupload" type="file">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%---End of Photoupload----%>
                    <%---Start of Basic Details----%>
                    <div class="col-md-9 box-container mTop15">
                        <div class="box-heading" id="Div4">
                            <h4 class="box-title register-num">{{resourcesData.lblApplicantDetails}}
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlYearTerm">
                                        {{resourcesData.lblFirstName}}</label>
                                    <input id="FirstName" class="form-control" placeholder="First Name" name="First Name" type="text" value="" maxlength="20"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="Village">
                                        {{resourcesData.lblLastName}}</label>
                                    <input id="LastName" class="form-control" placeholder="Last Name" name="Last Name" type="text" value="" maxlength="20"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="Village">
                                        {{resourcesData.lblAppMobile}}</label>
                                    <input id="MobileNo" class="form-control" placeholder="Mobile No." name="Mobile No." value="" maxlength="10"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="ddlYearTerm">
                                        {{resourcesData.lblAppEmail}}</label>
                                    <input id="EmailID" class="form-control" placeholder="Email Id" name="Email Id" type="email" value="" maxlength="50"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="Village">
                                        {{resourcesData.lblAppDOB}}</label>
                                    <input id="DOB" class="form-control" name="Date of Birth" type="text" value="" maxlength="10"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="" for="ddlYearTerm">
                                        {{resourcesData.lblAppAge}}</label>
                                    <input id="Age" class="form-control" placeholder="Age" name="Age" value="" maxlength="3"
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlGender">
                                        {{resourcesData.lblAppGender}}</label>
                                    <select class="form-control" data-val="true" data-val-number="Gender."
                                        data-val-required="Please select gender." id="ddlGender" name="Gender">
                                        <option value="0">Select Gender</option>
                                        <option value="M">Male</option>
                                        <option value="F">Female</option>
                                        <option value="T">Transgender</option>
                                    </select>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%---End of Basic Details----%>
                </div>
                <%---End of PhotoNDetail----%>

                <%---Start of AddressNAttachment----%>
                <div class="row">
                    <%---Start of ResidenceAddress----%>
                    <%--<div class="col-md-8 box-container mTop15">
                <div class="box-heading" id="Div4">
                    <h4 class="box-title register-num">Residencial Address
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="ddlYearTerm">
                                Address Line-1 (Care of)</label>
                            <input class="form-control" placeholder="First Line Address" name="Address Line-1 (Care of)" type="text" value=""
                                autofocus />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="Village">
                                Address Line-2 (Building)</label>
                            <input class="form-control" placeholder="Address Line-2 (Building)" name="Last Name" type="text" value=""
                                autofocus />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="manadatory" for="Village">
                                Road / Street Name Road</label>
                            <input class="form-control" placeholder="Road / Street Name Road" name="Road / Street Name Road" type="text" value=""
                                autofocus />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                Landmark</label>
                            <input class="form-control" placeholder="Landmark" name="Landmark" type="text" value=""
                                autofocus />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="Village">
                                Locality</label>
                            <input class="form-control" placeholder="Locality" name="Locality" type="text" value=""
                                autofocus />
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                        <div class="form-group">
                            <label class="manadatory" for="ddlGender">
                                State</label>
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
                                District</label>
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
                                Taluka</label>
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
                                PIN</label>
                            <input class="form-control" placeholder="PIN" name="PIN" type="" value="" max-length="6"
                                autofocus />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>--%>
                    <div class="col-md-8 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">{{resourcesData.lblIdentifierResidenceDetails}}
                            </h4>
                        </div>
                        <uc1:Address runat="server" ID="Address" />
                    </div>
                    <%---End of ResidenceAddress----%>
                    <%---Start of Attachment----%>
                    <div class="col-md-4 box-container" id="DivPhoto">
                        <div class="box-heading">
                            <h4 class="box-title register-num">{{resourcesData.lblUploadDetails}}
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div id="divPhotoUpload" class="col-xs-12 col-sm-6 col-md-6 col-lg-12">

                                <div class="list-group">
                                    <i class="fa fa-info-circle"></i><span class="" for="ddlYearTerm">{{resourcesData.lblDocAge}}</span><br />
                                    <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                                        id="FileAge" name="Photoupload" type="file" />
                                    <i class="fa fa-info-circle"></i><span class="" for="ddlYearTerm">{{resourcesData.lblDocRes}}</span><br />
                                    <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                                        id="FileResidence" name="Photoupload" type="file" />
                                    <i class="fa fa-info-circle"></i><span class="" for="ddlYearTerm">{{resourcesData.lblDocDomicile}}</span><br />
                                    <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                                        id="FileDomicile" name="Photoupload" type="file" />
                                    <i class="fa fa-info-circle"></i><span class="" for="ddlYearTerm">{{resourcesData.lblDocOther}}</span><br />
                                    <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                                        id="FileOther" name="Photoupload" type="file" />
                                </div>

                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%---End of Attachment----%>
                </div>
                <%---End of AddressNAttachment----%>

                <%---Start of Declaration----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title register-num">{{resourcesData.lblDeclaration}}
                            </h4>
                        </div>
                        <div class="box-body box-body-open">

                            <div class="col-sm-6 col-md-6 col-lg-12">
                                <div class="text-danger text-danger-green">
                                    <p class="text-justify">
                                        <input type="checkbox" runat="server" id="disclaimercheck" onclick="javascript: declaration(this.checked, '1');" />
                                        {{resourcesData.lblI}} &nbsp;
                                            <span id="spndecl" style="text-decoration: underline; text-transform: capitalize; font-weight: bold;"></span>&nbsp; 
                                        {{resourcesData.lblDeclarationText}}
                                        <%--solemnly affirm that the above mentioned information submitted by me is true and correct to my knowledge and belief. I hereby agree to be liable for legal consequences for any information found incorrect or untrue at a later date. Agreement Accepted.--%>
                                    </p>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>

                        </div>
                    </div>
                </div>
                <%---End of Declaration------%>

                <%---Start of Button----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <%--<asp:Button ID="btnConfirm" runat="server" Text="Submit" class="btn btn-success"
                        OnClientClick="return checkDeclaration();" />--%>
                            <input type="button" id="btnConfirm" class="btn btn-success" value="Submit" />
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
    <asp:HiddenField ID="HFAppID" runat="server" />
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <div>
        <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />
    </div>
</asp:Content>
