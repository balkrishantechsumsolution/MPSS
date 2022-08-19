<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="NFBSForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.NFBS.NFBSForm" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/SearchRecord.ascx" TagPrefix="uc1" TagName="SearchRecord" %>
<%@ Register Src="~/WebApp/Control/Photograph.ascx" TagPrefix="uc1" TagName="Photograph" %>
<%@ Register Src="~/WebApp/Control/PersonalDetail.ascx" TagPrefix="uc1" TagName="PersonalDetail" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/DeptService.ascx" TagPrefix="uc1" TagName="DeptService" %>


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

    <script type="text/javascript">

        $(document).ready(function () {
            $('#divBtn').hide();
            $('#divDecease').hide();
            $('#divBankDtls').hide();
        });

        $(document).ready(function () {
            $("#liBasic").removeClass("active");
            $("#liService").addClass("active");
            $("#liDetails").removeClass("active");
            $("#liDoc").removeClass("active");
            $("#liPayment").removeClass("active");
        });

        $(document).ready(function () {
            console.log("ready!");
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
                url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
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

            /*

            ctl00$ContentPlaceHolder1$Address1$ddlState
            ctl00$ContentPlaceHolder1$Address1$ddlDistrict
            ctl00$ContentPlaceHolder1$Address1$ddlTaluka
            ctl00$ContentPlaceHolder1$Address1$ddlVillage


            ctl00$ContentPlaceHolder1$Address2$ddlState
            ctl00$ContentPlaceHolder1$Address2$ddlDistrict
            ctl00$ContentPlaceHolder1$Address2$ddlTaluka
            ctl00$ContentPlaceHolder1$Address2$ddlVillage
            */


            $("[name='ctl00$ContentPlaceHolder1$Address1$ddlState']").bind("change", function (e) { return GetDistrict("", "ctl00$ContentPlaceHolder1$Address1$ddlState", "ctl00$ContentPlaceHolder1$Address1$ddlDistrict"); });
            $("[name='ctl00$ContentPlaceHolder1$Address1$ddlDistrict']").bind("change", function (e) { return GetSubDistrict("", "ctl00$ContentPlaceHolder1$Address1$ddlDistrict", "ctl00$ContentPlaceHolder1$Address1$ddlTaluka"); });
            $("[name='ctl00$ContentPlaceHolder1$Address1$ddlTaluka']").bind("change", function (e) { return GetVillage("", "ctl00$ContentPlaceHolder1$Address1$ddlTaluka", "ctl00$ContentPlaceHolder1$Address1$ddlVillage"); });


            $("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").bind("change", function (e) { return GetDistrict("", "ctl00$ContentPlaceHolder1$Address2$ddlState", "ctl00$ContentPlaceHolder1$Address2$ddlDistrict"); });
            $("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").bind("change", function (e) { return GetSubDistrict("", "ctl00$ContentPlaceHolder1$Address2$ddlDistrict", "ctl00$ContentPlaceHolder1$Address2$ddlTaluka"); });
            $("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").bind("change", function (e) { return GetVillage("", "ctl00$ContentPlaceHolder1$Address2$ddlTaluka", "ctl00$ContentPlaceHolder1$Address2$ddlVillage"); });


            //$("#ddlState").bind("change", function (e) { return GetDistrict(""); });
            //$("#ddlDistrict").bind("change", function (e) { return GetSubDistrict(""); });
            //$("#ddlTaluka").bind("change", function (e) { return GetVillage(""); });
            $("#btnConfirm").bind("click", function (e) { return CheckDeclaration(); });

            $('#Age').attr("readonly", true);


            //$('#DOB').datepicker({
            //    dateFormat: "dd/mm/yy",
            //    changeMonth: true,
            //    changeYear: true,
            //    maxDate: '-1d',
            //    yearRange: "-150:+0",
            //    onSelect: function (date) {

            //        var t_DOB = $("#DOB").val();

            //        var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            //        var selectedYear = S_date.getFullYear(); // selected year

            //        var Age = calage(date);
            //        $('#Age').val(Age);
            //        if (Age < 18) {
            //            $('#DOB').val('');
            //            alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
            //            $('#Age').val('');
            //            return false;
            //        } else if (Age > 125) {
            //            $('#Age').val('');
            //            alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 125 years.');
            //            $('#Age').val('');
            //            return false;
            //        }
            //    }
            //});

            //$('#DeceasedDOB').datepicker({
            //    dateFormat: "dd/mm/yy",
            //    changeMonth: true,
            //    changeYear: true,
            //    maxDate: '-1d',
            //    yearRange: "-150:+0",
            //    onSelect: function (date) {

            //        var t_DOB = $("#DeceasedDOB").val();

            //        var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            //        var selectedYear = S_date.getFullYear(); // selected year

            //        var Age = calage(date);
                   
            //        if (Age < 18) {
            //            $('#DeceasedDOB').val('');
            //            alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
                        
            //            return false;
            //        } else if (Age > 125) {
            //            $('#DeceasedDOB').val('');
            //            alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 125 years.');
                        
            //            return false;
            //        }
            //    }
            //});

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


            //Logic for eKYC
            if ($("#HFUIDData").val() != "") {

                var obj = jQuery.parseJSON($("#HFUIDData").val());

                var t_DOB = obj["dateOfBirth"];
                t_DOB = t_DOB.replace(/-/g, "/");

                document.getElementById('ProfilePhoto').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);

                $("#FirstName").val(obj["residentName"]);
                $("#UID").val(obj["aadhaarNumber"]);
                $("#FatherName").val(obj["careOf"]);
                //obj["careOfLocal"];
                $('#DOB').val(t_DOB);                
                obj["district"];
                //obj["districtLocal"];
                $('#EmailID').val(obj["emailId"]);
                $('#ddlGender').val(obj["gender"]);
                $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(obj["houseNumber"]);
                //obj["houseNumberLocal"];
                $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(obj["landmark"]);
                //obj["landmarkLocal"];
                //obj["language"];
                $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(obj["locality"]);
                //obj["localityLocal"];
                //obj["phone"];
                $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val(obj["pincode"]);
                //obj["pincodeLocal"];
                //obj["postOffice"];
                //obj["postOfficeLocal"];
                //obj["residentName"];
                //obj["residentNameLocal"];
                obj["state"];
                //obj["stateLocal"];
                $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(obj["street"]);
                //obj["streetLocal"];
                obj["subDistrict"];
                //obj["subDistrictLocal"];



                //var t_DOB = $("#DOB").val();
                //t_DOB = t_DOB.replace("-", "/");
                //var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                //var selectedYear = S_date.getFullYear(); // selected year

                //var Age = calage(S_date);
                //$('#Age').val(Age);
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



                //$("#ddlGender option:selected").text();
                //$("#FatherName").val("Father Name");
                //$("#MotherName").val("Mother Name");
                //$("#ddlOccupation option:selected").text();

                //$("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val("App Address line 1");
                //$("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val("App Address line 2");
                //$("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val("App Road Name");
                //$("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val("App Landmark");
                //$("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val("App locality");
                //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option:selected").text();
                //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlDistrict'] option:selected").text();
                //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlTaluka'] option:selected").text();
                //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlVillage'] option:selected").text();
                //$("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val("110001");                

            }//end of UID Data

            //SampleData();

        });

        function SampleData() {
            //////Start: To Delete            
            $('#MobileNo').val("9234567890");
            $('#EmailID').val("test@test.com");
            $('#FirstName').val("FName");
            $('#LastName').val("LName");
            $('#DOB').val("01/02/1980");
            $('#Age').val("36");
            //$('#ddlGender').val("M");
            //$('#AddressLine1').val("Line1");
            //$('#AddressLine2').val("Line2");
            //$('#RoadStreetName').val("RoadName");
            //$('#LandMark').val("Landmark");
            //$('#Locality').val("Locality");
            //$('#PinCode').val("123456");



            //$("#ddlGender option:selected").text();
            $("#FatherName").val("Father Name");
            $("#MotherName").val("Mother Name");
            //$("#ddlOccupation option:selected").text();

            $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val("App Address line 1");
            $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val("App Address line 2");
            $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val("App Road Name");
            $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val("App Landmark");
            $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val("App locality");
            //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option:selected").text();
            //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlDistrict'] option:selected").text();
            //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlTaluka'] option:selected").text();
            //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlVillage'] option:selected").text();
            $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val("110001");



            $("#DeceasedName").val("dec Name");
            $("#DeceasedFName").val("dec Father name");
            $("#DeceasedDOB").val("01/02/1919");
            //$("#ddlDeceasedGender option:selected").text();
            //$("#chkHeadFamily");

            $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val("dec Address line 1");
            $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val("dec address line 2");
            $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val("dec road name");
            $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val("dec landmark");
            $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val("dec locality");
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState'] option:selected").text();
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict'] option:selected").text();
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka'] option:selected").text();
            //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage'] option:selected").text();
            $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val("110090");


            $("#AccountHolder").val("Account Holder");
            $("#AccountNumber").val("ACC 123456");
            $("#IFSCCode").val("IFSC Code");



            //////End: To Delete

            return false;
        }

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
            var Gender = $("#ddlGender").val();
            var FatherName = $("#FatherName");
            var MotherName = $("#MotherName");
            var Occupation = $("#ddlOccupation").val();

            var appAddressLine1 = $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']");
            var appAddressLine2 = $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']");
            var appRoadStreetName = $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']");
            var appLandMark = $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']");
            var appLocality = $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']");
            var appddlState = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlState']").val();
            var appddlDistrict = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlDistrict']").val();
            var appddlTaluka = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlTaluka']").val();
            var appddlVillage = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlVillage']").val();
            var appPinCode = $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']");



            var DeceasedName = $("#DeceasedName");
            var DeceasedFName = $("#DeceasedFName");
            var DeceasedDOB = $("#DeceasedDOB");
            var ddlDeceasedGender = $("#ddlDeceasedGender").val();
            var chkHeadFamily = $("#chkHeadFamily");

            var deceasedAddressLine1 = $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']");
            var deceasedAddressLine2 = $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']");
            var deceasedRoadStreetName = $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']");
            var deceasedLandMark = $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']");
            var deceasedLocality = $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']");
            var deceasedddlState = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val();
            var deceasedddlDistrict = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val();
            var deceasedddlTaluka = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val();
            var deceasedddlVillage = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val();
            var deceasedPinCode = $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']");


            var AccountHolder = $("#AccountHolder");
            var AccountNumber = $("#AccountNumber");
            var IFSCCode = $("#IFSCCode");


            //////App address
            ////var AddressLine1 = $("#AddressLine1");
            ////var AddressLine2 = $("#AddressLine2");
            ////var RoadStreetName = $("#RoadStreetName");
            ////var LandMark = $("#LandMark");
            ////var Locality = $("#Locality");

            ////var State = $("#ddlState option:selected").text();
            ////var District = $("#ddlDistrict option:selected").text();
            ////var Taluka = $("#ddlTaluka option:selected").text();
            ////var Village = $("#ddlVillage option:selected").text();
            ////var Pincode = $("#PinCode");






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

            //if (AddressLine1 != null && AddressLine1.val() == '') {
            //    text += "<br /> -Please enter Care of Address. ";
            //    opt = 1;
            //}

            //if (State != null && (State == '' || State == '-Select-')) {
            //    text += "<br /> -Please select State.";
            //    opt = 1;
            //}

            //if (District != null && (District == '' || District == '---Select---')) {
            //    text += "<br /> -Please select District.";
            //    opt = 1;
            //}

            //if (Taluka != null && (Taluka == '' || Taluka == '---Select---')) {
            //    text += "<br /> -Please select Taluka.";
            //    opt = 1;
            //}

            //if (Village != null && (Village == '' || Village == '---Select---')) {
            //    text += "<br /> -Please select Village.";
            //    opt = 1;
            //}
            //if (Pincode != null && Pincode.val() == '') {
            //    text += "<br /> -Please enter Pincode.";
            //    opt = 1;
            //}


            //var pinmatch = /^[0-9]\d{5}$/;
            //if (Pincode != null && Pincode.val() != '') {
            //    if (!pinmatch.test(Pincode.val())) {
            //        text += "<br /> -Please enter valid pincode.";
            //        opt = 1;
            //    }
            //}

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

            //var datavar = {
            //    'MobileNo': $('#MobileNo').val(),
            //    'EmailID': $('#EmailID').val(),
            //    'FirstName': $('#FirstName').val(),
            //    'LastName': $('#LastName').val(),
            //    'DOB': DOBConverted,
            //    'Age': $('#Age').val(),
            //    'Gender': $('#ddlGender').val(),
            //    'AddressLine1': $('#AddressLine1').val(),
            //    'AddressLine2': $('#AddressLine2').val(),
            //    'RoadStreetName': $('#RoadStreetName').val(),
            //    'LandMark': $('#LandMark').val(),
            //    'Locality': $('#Locality').val(),
            //    'State': $('#ddlState').val(),
            //    'District': $('#ddlDistrict').val(),
            //    'Taluka': $('#ddlTaluka').val(),
            //    'Village': $('#ddlVillage').val(),
            //    'PinCode': $('#PinCode').val(),
            //    'ImagePath': '' //pImagePath

            //};


            var FirstName = $("#FirstName");
            var LastName = $("#LastName");
            var MobileNo = $("#MobileNo");
            var EmailID = $("#EmailID");
            var DOB = $("#DOB");
            var Age = $("#Age");
            var Gender = $("#ddlGender").val();
            var FatherName = $("#FatherName");
            var MotherName = $("#MotherName");
            var Occupation = $("#ddlOccupation").val();

            var appAddressLine1 = $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val();
            var appAddressLine2 = $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val();
            var appRoadStreetName = $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val();
            var appLandMark = $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val();
            var appLocality = $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val();
            var appddlState = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlState']").val();
            var appddlDistrict = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlDistrict']").val();
            var appddlTaluka = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlTaluka']").val();
            var appddlVillage = $("[name='ctl00$ContentPlaceHolder1$Address1$ddlVillage']").val();
            var appPinCode = $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val();



            var DeceasedName = $("#DeceasedName").val();
            var DeceasedFName = $("#DeceasedFName").val();
            var DeceasedDOB = $("#DeceasedDOB").val();
            var ddlDeceasedGender = $("#ddlDeceasedGender").val();
            var chkHeadFamily = $("#chkHeadFamily").val();

            var deceasedAddressLine1 = $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val();
            var deceasedAddressLine2 = $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val();
            var deceasedRoadStreetName = $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val();
            var deceasedLandMark = $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val();
            var deceasedLocality = $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val();
            var deceasedddlState = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val();
            var deceasedddlDistrict = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val();
            var deceasedddlTaluka = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val();
            var deceasedddlVillage = $("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val();
            var deceasedPinCode = $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val();


            var AccountHolder = $("#AccountHolder").val();
            var AccountNumber = $("#AccountNumber").val();
            var IFSCCode = $("#IFSCCode").val();


            DOBArr = $("#DeceasedDOB").val().split("/");
            var DeceasedDOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

            var datavar = {

                'FirstName': $("#FirstName").val(),
                'LastName': $("#LastName").val(),
                'MobileNo': $("#MobileNo").val(),
                'EmailID': $("#EmailID").val(),
                'DOB': DOBConverted,
                'Age': $("#Age").val(),
                'Gender': $("#ddlGender option:selected").text(),
                'FatherName': $("#FatherName").val(),
                'MotherName': $("#MotherName").val(),
                'Occupation': $("#ddlOccupation option:selected").text(),

                'appAddressLine1': appAddressLine1,
                'appAddressLine2': appAddressLine2,
                'appRoadStreetName': appRoadStreetName,
                'appLandMark': appLandMark,
                'appLocality': appLocality,
                'appddlState': appddlState,
                'appddlDistrict': appddlDistrict,
                'appddlTaluka': appddlTaluka,
                'appddlVillage': appddlVillage,
                'appPinCode': appPinCode,



                'DeceasedName': DeceasedName,
                'DeceasedFName': DeceasedFName,
                'DeceasedDOB': DeceasedDOBConverted,
                'ddlDeceasedGender': ddlDeceasedGender,
                'chkHeadFamily': chkHeadFamily,

                'deceasedAddressLine1': deceasedAddressLine1,
                'deceasedAddressLine2': deceasedAddressLine2,
                'deceasedRoadStreetName': deceasedRoadStreetName,
                'deceasedLandMark': deceasedLandMark,
                'deceasedLocality': deceasedLocality,
                'deceasedddlState': deceasedddlState,
                'deceasedddlDistrict': deceasedddlDistrict,
                'deceasedddlTaluka': deceasedddlTaluka,
                'deceasedddlVillage': deceasedddlVillage,
                'deceasedPinCode': deceasedPinCode,


                'AccountHolder': AccountHolder,
                'AccountNumber': AccountNumber,
                'IFSCCode': IFSCCode

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
                    url: '/WebApp/Registration/KioskRegistration.aspx/InsertNFBSForm',
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
                        var fileUpload = $("#ProfilePhoto").get(0);
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
                                    url: "/WebApp/fileUploader.ashx",
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
                        fileUpload = $("#decBPLCard").get(0);
                        files = fileUpload.files;
                        for (var i = 0; i < files.length; i++) {
                            fileName = AppID + "_decBPLCard." + getExtension(files[i].name);
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
                                    url: "/WebApp/fileUploader.ashx",
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
                        fileUpload = $("#deathcerti").get(0);
                        files = fileUpload.files;
                        for (var i = 0; i < files.length; i++) {
                            fileName = AppID + "_deathcerti." + getExtension(files[i].name);
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
                                                                url: "/WebApp/fileUploader.ashx",
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
                        fileUpload = $("#beneBPLCard").get(0);
                        files = fileUpload.files;
                        for (var i = 0; i < files.length; i++) {
                            fileName = AppID + "_beneBPLCard." + getExtension(files[i].name);
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
                                                              url: "/WebApp/fileUploader.ashx",
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
                        fileUpload = $("#rationcard").get(0);
                        files = fileUpload.files;
                        for (var i = 0; i < files.length; i++) {
                            fileName = AppID + "_rationcard." + getExtension(files[i].name);
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
                                                            url: "/WebApp/fileUploader.ashx",
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
                        window.location.href = 'ConfirmPayment.aspx?SvcID=102&AppID=' + obj.AppID;
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

        function GetDistrict(category, StateControl, DistrictControl) {
            var SelIndex = $("[name='" + StateControl + "']").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("[name='" + DistrictControl + "']").empty();
                    $("[name='" + DistrictControl + "']").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        $("[name='" + DistrictControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        catCount++;
                    });


                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });

        }

        function GetSubDistrict(category, DistrictControl, TalukaControl) {
            var SelIndex = $("[name='" + DistrictControl + "']").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("[name='" + TalukaControl + "']").empty();
                    $("[name='" + TalukaControl + "']").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        $("[name='" + TalukaControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        catCount++;
                    });


                },
                error: function (a, b, c) {
                    alert("3." + a.responseText);
                }
            });

        }

        function GetVillage(category, TalukaControl, VillageControl) {
            var SelIndex = $("[name='" + TalukaControl + "']").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Registration/KioskRegistration.aspx/GetVillage',
                data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    $("[name='" + VillageControl + "']").empty();
                    $("[name='" + VillageControl + "']").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        $("[name='" + VillageControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
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
                var left = (screen.width / 2) - (500 / 2);
                var top = (screen.height / 2) - (600 / 2);
                <%--                if (value == "1") {
                    //                    window.open('../UIDValidation/VerifyUID.aspx?UID=' + code + '&EID=' + EID + '&E=N&SessionName=' + SessionName, 'open_window', ' width=560, height=450, top=' + top + ', left=' + left);
                    window.open('/UIDValidation/VerifyUID.aspx?UID=' + code + '&EID=' + EID + '&E=N&SessionName=' + SessionName, 'open_window', ' width=800, height=600, top=' + top + ', left=' + left);                   
                }
                else if (value == "2") {
                    //window.open('/UIDValidation/UID_OTP.aspx?UID=' + code + '&EID=' + EID + '&SessionName=' + SessionName, 'open_window', ' width=560, height=450, top=' + top + ', left=' + left);
                    //var urlToForward = $('#hdnKycRequestUrl').val() + '?aadhaarNumber=' + code + '&kycTypesToUse=OTP&transactionId=<%=Guid.NewGuid().ToString()%>';
                    //window.location = urlToForward;

                    window.open('/UID/KycRequest.aspx?aadhaarNumber=' + code + '&kycTypesToUse=OTP&transactionId=<%=Guid.NewGuid().ToString()%>', 'open_window',
                        ' width=800, height=600, top=' + top + ', left=' + left);

                }--%>
                window.open('/UID/Default.aspx?aadhaarNumber=' + code + '&kycTypesToUse=OTP&transactionId=<%=Guid.NewGuid().ToString()%>', 'open_window',
                       ' scrollbars=1,resizable=1,width=650, height=500, top=' + top + ', left=' + left);
                return false;
            }
            return false;
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
                <%---Start of FormTitle----%>
                <uc1:FormTitle runat="server" ID="FormTitle" />
                <%----END of FormTitle-----%>
                <%----Start of SearhBasicDetails-----%>
                <div class="row">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">{{resourcesData.aadhaar}}
                            </h4>
                        </div>
                        <uc1:SearchRecord runat="server" ID="SearchRecord" />
                    </div>
                </div>
                <%-----End of SearhBasicDetails------%>
                <div class="row">
                    <%---Start of PhotoNDetail----%>
                    <div class="col-md-3 box-container">
                        <div class="box-heading">
                            <h4 class="box-title register-num">{{resourcesData.lblAppPhotograph}}
                            </h4>
                        </div>
                        <uc1:Photograph runat="server" ID="Photograph" />
                    </div>
                    <%---End of Photoupload----%>
                    <%---Start of Basic Details----%>
                    <div class="col-md-9 box-container mTop15">
                        <div class="box-heading" id="Div4">
                            <h4 class="box-title register-num">{{resourcesData.lblApplicantDetails}}
                            </h4>
                        </div>
                        <uc1:PersonalDetail runat="server" ID="PersonalDetail" />
                    </div>
                    <%---End of Basic Details----%>
                </div>
                <div class="row">
                    <%---Start of CurrentAddress----%>
                    <%--                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Current Address
                            </h4>
                        </div>
                        <uc1:Address runat="server" ID="Address" ClientIDMode="Inherit" />
                    </div>--%>
                    <%----End of CurrentAddress-----%>
                    <%---Start of PermanentAddress----%>
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Permanent Address
                            </h4>
                        </div>
                        <uc1:Address runat="server" ID="Address1" ClientIDMode="Inherit" />
                    </div>
                    <%---End of PermanentAddress----%>
                </div>

                <%----Start of DepartmentService-----%>
                <div class="row">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Department / Service Detail
                            </h4>
                        </div>
                        <uc1:DeptService runat="server" ID="DeptService" />
                    </div>
                </div>
                <%-----End of DepartmentService------%>

                <div class="row" id="divDecease" runat="server">
                    <%---Start of DeceasedDetails----%>
                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Details of Deceased
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="firstname">
                                        Deceased Full Name</label>
                                    <input id="DeceasedName" class="form-control" placeholder="Enter Deceased Full Name" name=" DeceasedFullName" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="manadatory" for="ddlYearTerm">
                                        Deceased Father / Husband Name</label>
                                    <input id="DeceasedFName" class="form-control" placeholder="Enter Deceased Father Name/Husband Name" name=" DeceasedFatherName" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="manadatory" for="Village">
                                        {{resourcesData.lblAppDOB}}</label>
                                    <input id="DeceasedDOB" class="form-control" placeholder="DD/MM/YYYY" name="Date of Birth" type="text" value=""
                                        autofocus />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
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
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                    <div class="form-group">
                                        <label class="manadatory col-lg-5" for="headoffamily">
                                            Whether head of family
                                        </label>
                                        <label class="col-lg-2" for="rbtYes">
                                            <asp:CheckBox ID="chkHeadFamily" runat="server" />
                                            Yes
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <%----End of DeceasedDetails-----%>
                    <%---Start of DeceasedAddress----%>
                    <div class="col-md-6 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Deceased Complete Address
                            </h4>
                        </div>
                        <uc1:Address runat="server" ID="Address2" ClientIDMode="Inherit" />
                    </div>
                    <%----End of DeceasedAddress-----%>
                </div>
                <div class="row" id="divBankDtls" runat="server">
                    <%---Start of BankDetails----%>
                    <div class="row">
                        <div class="col-md-8">
                            <div class="col-md-12 box-container mTop15">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">Account Details of Beneficiary
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">
                                                Name of the Account Holder</label>
                                            <input id="AccountHolder" class="form-control" id="txtActholder" placeholder="Name of Account Holder" name="AccountHolder" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="firstname">
                                                Account Number</label>
                                            <input id="AccountNumber" class="form-control" placeholder="Account Number" name="AccNo" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="IFSCCode">
                                                IFSC Code</label>
                                            <input id="IFSCCode" class="form-control" id="txtIFSCCode" placeholder="Enter IFSC Code" name="IFSCCode" type="text" value=""
                                                autofocus />
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                            <%----End of BankDetails-----%>
                            <div class="col-md-12 box-container" id="Div2">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">{{resourcesData.lblDeclaration}}
                                    </h4>
                                </div>
                                <div class="box-body box-body-open">

                                    <div class="col-sm-6 col-md-6 col-lg-12">
                                        <div class="text-danger text-danger-green">
                                            <p class="text-justify">
                                                <input type="checkbox" runat="server" id="Checkbox1" onclick="javascript: declaration(this.checked, '1');" />
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
                        <div class="">
                            <div class="col-md-4">
                                <%---Start of Attachment----%>
                                <div class="col-md-12 box-container mTop15">
                                    <div class="box-heading">
                                        <h4 class="box-title register-num">Attach Supporting Document
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">
                                        <div id="divPhotoUpload" class="col-xs-12 col-sm-6 col-md-6 col-lg-12">

                                            <div class="list-group">
                                                <i class="fa fa-info-circle"></i><span class="">Deceased BPL Card</span><br />
                                                <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                                                    id="decBPLCard" name="Photoupload" type="file" />
                                                <i class="fa fa-info-circle"></i><span class="">Death certificate</span><br />
                                                <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                                                    id="deathcerti" name="Photoupload" type="file" />
                                                <i class="fa fa-info-circle"></i><span class="">Beneficiary BPL Card</span><br />
                                                <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                                                    id="beneBPLCard" name="Photoupload" type="file" />
                                                <i class="fa fa-info-circle"></i><span class="">Beneficiary Ration Card</span><br />
                                                <input class="list-group-item list-group-item-danger btn-file col-lg-12"
                                                    id="rationcard" name="Photoupload" type="file" />
                                            </div>

                                        </div>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                                <%----End of Attachment-----%>
                            </div>
                        </div>
                    </div>
                </div>

                <%---Start of Button----%>
                <div class="row" id="divButton" runat="server">
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
  
    <asp:HiddenField ID="HiddenNFBSAge" runat="server" />
    <asp:HiddenField ID="HiddenNFBSGender" runat="server" />
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <asp:HiddenField ID="HFUIDData" runat="server" />
    <asp:HiddenField ID="HFUIDData1" runat="server" Value="{&quot;aadhaarNumber&quot;:&quot;872564737979&quot;,&quot;photo&quot;:&quot;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&quot;,&quot;dateOfBirth&quot;:&quot;14-07-1984&quot;,&quot;residentName&quot;:&quot;Gunwant Saini&quot;,&quot;gender&quot;:&quot;M&quot;,&quot;phone&quot;:&quot;1143035379&quot;,&quot;emailId&quot;:&quot;gunwant1984@yahoo.com&quot;,&quot;careOf&quot;:&quot;S/O Jagmohan&quot;,&quot;landmark&quot;:null,&quot;locality&quot;:&quot;SAINI ENCLAVE&quot;,&quot;vtc&quot;:&quot;DELHI&quot;,&quot;district&quot;:&quot;East Delhi&quot;,&quot;houseNumber&quot;:&quot;76&quot;,&quot;street&quot;:null,&quot;postOffice&quot;:null,&quot;subDistrict&quot;:null,&quot;state&quot;:&quot;Delhi&quot;,&quot;pincode&quot;:&quot;110092&quot;,&quot;language&quot;:&quot;06&quot;,&quot;residentNameLocal&quot;:&quot;गुनवंत सैनी&quot;,&quot;careOfLocal&quot;:&quot;S/O  जगमोहन&quot;,&quot;houseNumberLocal&quot;:&quot;७६&quot;,&quot;streetLocal&quot;:null,&quot;landmarkLocal&quot;:null,&quot;localityLocal&quot;:&quot;सैनी एन्क्लेव&quot;,&quot;vtcLocal&quot;:&quot;देल्ही&quot;,&quot;subDistrictLocal&quot;:null,&quot;districtLocal&quot;:&quot;ईस्ट देल्ही&quot;,&quot;stateLocal&quot;:&quot;देल्ही&quot;,&quot;pincodeLocal&quot;:&quot;110092&quot;,&quot;postOfficeLocal&quot;:null,&quot;responseCode&quot;:&quot;3ce2a71b6ef34430a92c265d5491d5af&quot;,&quot;action&quot;:&quot;&quot;,&quot;ttl&quot;:&quot;2017-07-25T21:30:43&quot;,&quot;timestamp&quot;:&quot;2016-07-25T21:30:43.210+05:30&quot;}" />    
    <input type="hidden" name="HFUID1" id="HFUID1" value="{&quot;aadhaarNumber&quot;:&quot;872564737979&quot;,&quot;photo&quot;:&quot;/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCADIAKADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDp6KWkrA1CiiigQ000nmnmmnFACiigUtADSKTFPxSUANopSKMc0ANxRil96KBCUhFLiikIbikxTqSgBtFLSY5oAtUYpxFGKZYzFGKdRjigBhFM5zUhphFAhRTqQVl33iPSdNkkju72NJIwCy9Tg+w6nvgc45xRYDUNJXPnxt4dzuOoDHVf3Lnj/vmkPjfQRuxeE46Yjb5vpkcfjinZhc6GiuX/AOE90pULPHcKeMLmMk59CHI4+v68Vmn4mWXmuosZhGPuuXGTye30x3oswudyTjA9aMVydt8QNHuFBmMkD5HDDI59x/XFbVjr1jqkRk05zdorBXKDaU4yCQ2DilZiujRI5ooDBiwBztOD7UHNACGm0402gBMUlOpKQi7RiloqixuKXFFIxxQAxjiud8Q+IodJgIidWumAZU2luM45xjH5j0rL8YeMm0ic2Nlse6I+diciLI449e/t3BzXmd/rF7fOzXExdiSScAZJ7nFNITZqa74p1DVHkge6YwAkABQmR74/xNYc8813M8k8zySscs7MSW+pqu55Jojyf4sVViRzEgcZ+tOiOQST0o4J7HvzSbySSoA9hxQIkZsj+uaZke9IS/Vl49RSgdufajQABz8vetfQ71odRjBkkAf5MpIVPTC85AxnHXjisfaxAyOnQiliZopVfpzQM+gkkJkjxt6EN7ADp9c/1q0a4Kz8YaZGFEtwTKDuUhGZdxyD79CfzJ5ya6nTNestUUCF9shLYjcjcwB+8ACeP8D6VnZjuaLU0080ygAxSUUUAXjSUppDwKZQ1jisvUtRWzsXmcsOONvJzg9Px9e/1q9OwCEltoA5Pp+dePa7r09zcXSLeo0Kys8LENvI3FQBgAA459OfwotcZh38xnupZ3JJkZm56nJJJ/M1QYZNOdy7FuB7AVtWWj+ZAJHyC3YelOTUVqKMXN6GAUYHipUhL4GCTXRjQ1J4U4960YNLjiAygrN1l0NFQb3OWg0mec56D6VeGguF5OfqK6VYlToufpTiuRis3VkzZUIrc5qLR2Gct+FSHSUGBW0yY7EUwpzS9ox+yijFGmqvH9KbLp6NGVxzWsyc9KiZPUcU+dshwRyk0clrIVfle1WbHUZrKZZIG2sGDBgOc1f1K2DxE46VgqzK5UniuiD5kc048rPaPDniePVYgkwKSgckkFW6c+3UcYx6Z7dJ1rwCxu57WcPDI0cikEMp6c17F4V12PW9N6gXEAVZVHOTzhvocUNWEmbtGKdigipGXDUchwKlJqvK1BRy/jDXIbHS5rRHja4nAjKFuVVupI6/d3c9iR7V47M4dyeAD2Fd18RrV4b6G6UEQ3KhZNvTenQn1JDY+i1wJOOKuOxMie0h826jXB25rt4kO1VUDHeuR00ZuIzmu0g+4DWFZnRQ2JUQe1S7FI5pgB9KU5x0rnudIxyvYZqMt833OPWpJFyKhdWB68fSmFhj/e9vrTGXIz2p5XPemsCOM8UCaK7qR0qMjNTOpqLkU0QylepmFvpXMSKu7t1rrLlC0LAc8VzE6nzSuOc10Umc1VESH5+O9en/AA6tnH2y6dAqFERSD1PJP9OfevNokIlUDJLdABnmvaPCultpOjJHKhSeQl5FJB2n044/n161q2Yo3aKTNKTUlFxqqzg1cNQSrkUijlfF+lHVvD80SsivERMhc4AK5zk/7pNeNvGA56cV9AyxLLG8TjKuCpHqDXlXjDwydJn+02ys1rISRxxGeTt689/8g04voDVzG0S3M1wTnhOTXWKwjQZJFYegNBBp7zs3LyYUAZJ6dAOTye3qPWr87TblZIDKnUkMFx+BrKom5HRSsomrHPGVJLLx2zVhZFI4Irl55RIRuWSI56krj8fmNRG4mtgzJexS9tqq24/pipVNMr2ljq2dM8nFIfLYe1YEc128qJnzWK7sRsJCB77ScfjWmCBDvkYIAMnPGKTjYtSuSsYwfpUcm3g5AFULm5JtpLmHLwRcPIg3Kp9yOlQX2m6ta3Dxagr2O1QwMykK4PQqQDnr1FVGm5ESqJFqa4hj43An0Bqm1zuOVBIrOX7LCxFzM7SA8hQSP1xVo3NsjbTvXHZlxVOnboZ+1uXbdhKcAc+lZOvWYtriJxwJOuPWtq0aMASgEgdwKreJDHPBD5Xzt5nAA5PrSjpImTuh3gTSl1HWRcSR7orTEmTwN2flx6njPtjNesZrznwNqtrY4smjdTO4zJkcueACPTG3GPf616HmtmY2tuPBozTc0ZpAahFMYCnnpTDQUVZUANcR47dovsEqqfkL85wP4f14/T3rupq5Dx5Cz+G2lXH7qVSxPXBO3A/ErUsuDSd2cbbhryK1mmdjJJNwxPJ2qcD8AtTXwmMflodpPVhSaXGzaPbyIoZ43Zh+ZBA98EgfWtBvLdJHcmNE4ZpFKgfieDWMm0zeK0MJ7VBYYXL3AfLK4bBGDwMfgeajgsoorKT7SW85jmNcHIH1xitjZDKCYJ0kA67XBppjiDDe6BzwMnk1pGppYh0tbmXGmy3fcASByGIGR+PWtTSnnitlnjlkgfGUaNypA9cimvaxsTGMljyTnoP8T0/zxorEFiCgD2qJSNIQ1uzDeNWv5ZpiryNG3MhJLE4BPqTjPety98TX+sana3Wqql/HbrtMLkRbuSTkqvHOMHGRtHpWVeQnkrgMAQDjpkEH9CaZA6nBYhWH5V0UKzgjGpSTkS66lre3Ms9vEIIpZ3nEG7f5ZYkkKxAwOfQdvSqlyRfJFGIYohF0YZ3EememOPTua0WAfqAab5KKM7AKmrWcncI0kitYE258vJKk5welS6kZLeweaF2jeNgVI7ZP/wBc0i+WHJDqSvULyR+Ao1PP9h3Ldvl/DLCsU7spxSRU0GNYdW04A7h58bD8SDXrG6vOvB1h9tv47h/9XbKGP+9/CPzGf+A4r0LPvWxlNqysSbqXdUWaXNMzNs000ppDQUV5ax9dtBe6FfW5TeXgbYP9oDKn8GAP4VtSjiqp4NIaPMtBOdL2d45GQj36/wBa143wMGoDAlrdXsMS7UE7ED/x3+gpdw6VzT1dzshtYdJGHPXNRGMKOnAFTIwIGCPTNJcDMLAHkjApFlNFUPv7Gr4MEiD95t471g3bXUimOO4S3I7lc0ga5jhUuRJgffUYB/CqSE3YuzIrs6bh7H1qnHAySYYc9Rmqc8kzuCJjDjquwHP1zViG6llVFfkL3quUzbuy3sAFNIHoKsPzGCDniqrMBUsroPGSQKfqcfm+H50QEsXRenX5lpIfmbFaVzF/xL/KXO5iu0Y5zuGAB3NC3M59i/4Nsvs2jNKVw0z8H1UcD9d1dCelQ2cRt9Pt4mUBkjAYD1xz+tSmulbHM9wpc0meaXNMk2s0ZopKRQjciqknWrZqtKKBo53XrNPL+2ImJMhZDngjoCffOB+P0rmxgHHQV299bC6s5YSASw+XPQN2P54rhpMg5II9QwwRWFSPU6KUujJlZIxgcDrQ0gZuDVSRz61BJdxxrywA75NQlc2bsWpdpPIBps0iRxJGcckVnvqe84hQsP720kVXe7lZsMd3oCvSrjBkt3LV0g87cvIpsZGPes9pp2JOXJ/KlF7InyuhP0xVcjIcrGos2FK54pC2TVKOffjqM1YQmoaGpXL1qPnH+cV1WkLuuS5HAQ4P41ylr97JPFdjoaf6NJNyN5Cj0wM8j8SfyqoLUxqM0mqImpGqI1sYi5pc02igRvdqSlNJTKDFQSip80xwCtICg/SuR120NveeaB+6myQeeH7j8ev5+ldhKuDVG6t0uoWhkXcrDpUyVy4uzucFJjaaqC3R23SAN6ZFT+asqkqfbkYP4jnH51A24Nway5WjfmTGkCH7pwB6VEbroDnjptXH61ZSDzXAZ8CrH2K3Rc7cn1Jq07blKUlsZUk5kG3D496REAIyOa0TbwjkgfhVWcIpwmaHK5Mm3uREqCMCpkcHHSqvzZqZX2rjvSsZ8xfhYltoO31OM4HrXeaddWctrFFayqQqgBSMN0yeO59SK4O1UtGwBwWGM06OSWJXdSRNE2Tg9x0NXAyqPU9FaojVXS9RGo2Ky9Hx8wqyTzVkAKWm5pe1AG7RRRQUFFNLgdTTBcI2QnJHXtSAjmUYqoIRNuVvukEGrMjMw6Ae1PWPYu306/WkxnkbxCw1N7Ytw+4c9yp//XQx2t6Ve8b2DWesRXiD92GyQO2QBn+dUuJogc9e9Q+5pBXQz7QEbk4prXgIOGzUU8Tp34/MVTfcP4VNCsxtyRdN4NuM1D5gZj1Jqt5jD+ClVmPtTsTdljd/+qhTzk9KiHHXrUqc4OKTFYvJceVATznqKeb2ORlukPIG2QDuP8RWfITsxmsuTejlkYqfUVUGKpG533hiYRuyqfkYkD65/wD1fnXUZB5rifDAYWkTHBJAPPrXYB+hHRhmnezMybqKM0wSD6GnZpga5ugW2qDn3qCW4kV8E8fSkhjIcM7ZOcUyWGWaZgrbVxkEf59aVyrluJlkjLHAxVObCSbo2OafZN8roWJdOTmo7xslRjr6fhQIuwuJAODleo96m25HNVYR5Uarz3xnjP8AjVoHKnNIZzXiDT/trvEyboynP0//AFkV50gk067eyn52/dJ7jsa9hvIjJbSFOJBt/H5gcV534v0txGLnbiSM5OP7v+eaVi4yszO2h1PcVUmt+uOKbZ3RKgE81dLqwGQD9az1Rvo0ZLxSKeMflSJDI3Xj6VpOqHnbTAIxT5iHArJb4OTU21UFPJAHAqJyTSvcdrEbDORVSaPqa0Ej55FMlh4PrQnqJo6jQ7Zk06DAAOwNg/SuhXlFI6YqHT7cJapu3YCgAKRVhgMHb0+uevv+daM5xr/dyO1IHIGe1Gc1HkxtkDKn9KEJmgouGO3v71pNGzDZ/GYcH65FFFWMr2gEay7shwxB/KpUj3uOcFGJoooAmEWX2j73f0H+NO3bG8sNuPfA6UUUhkV04W2mYsE+QncxwBx1Nc/rFqGVxJIJN4wy+gPaiikwPOJLZrS7kibqpx9R2NXok3qM8miis5HRDYWSJgmc4HSoPKckUUUimOEfAz6U9Ye/WiikxpDzHgcUx4iVPHOKKKSBo9CKxQ2as5RQu0ZYcZLBR+pFIysVBIOMcMxGef8AIoordnGRf0pCMjpkUUUrEn//2Q==&quot;,&quot;dateOfBirth&quot;:&quot;14-07-1984&quot;,&quot;residentName&quot;:&quot;Gunwant Saini&quot;,&quot;gender&quot;:&quot;M&quot;,&quot;phone&quot;:&quot;1143035379&quot;,&quot;emailId&quot;:&quot;gunwant1984@yahoo.com&quot;,&quot;careOf&quot;:&quot;S/O Jagmohan&quot;,&quot;landmark&quot;:null,&quot;locality&quot;:&quot;SAINI ENCLAVE&quot;,&quot;vtc&quot;:&quot;DELHI&quot;,&quot;district&quot;:&quot;East Delhi&quot;,&quot;houseNumber&quot;:&quot;76&quot;,&quot;street&quot;:null,&quot;postOffice&quot;:null,&quot;subDistrict&quot;:null,&quot;state&quot;:&quot;Delhi&quot;,&quot;pincode&quot;:&quot;110092&quot;,&quot;language&quot;:&quot;06&quot;,&quot;residentNameLocal&quot;:&quot;गुनवंत सैनी&quot;,&quot;careOfLocal&quot;:&quot;S/O  जगमोहन&quot;,&quot;houseNumberLocal&quot;:&quot;७६&quot;,&quot;streetLocal&quot;:null,&quot;landmarkLocal&quot;:null,&quot;localityLocal&quot;:&quot;सैनी एन्क्लेव&quot;,&quot;vtcLocal&quot;:&quot;देल्ही&quot;,&quot;subDistrictLocal&quot;:null,&quot;districtLocal&quot;:&quot;ईस्ट देल्ही&quot;,&quot;stateLocal&quot;:&quot;देल्ही&quot;,&quot;pincodeLocal&quot;:&quot;110092&quot;,&quot;postOfficeLocal&quot;:null,&quot;responseCode&quot;:&quot;3ce2a71b6ef34430a92c265d5491d5af&quot;,&quot;action&quot;:&quot;&quot;,&quot;ttl&quot;:&quot;2017-07-25T21:30:43&quot;,&quot;timestamp&quot;:&quot;2016-07-25T21:30:43.210+05:30&quot;}" />
    <div>
        <input type="text" ng-show="false" id="ngServiceID" name="ServiceID" ng-value="ServiceID" value="100" ng-model="ServiceID" runat="server" visible="false" />
    </div>
</asp:Content>
