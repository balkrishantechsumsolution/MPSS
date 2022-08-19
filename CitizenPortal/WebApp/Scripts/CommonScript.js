function GetCategoryCast() {
    debugger;
    var catCount = 0;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Citizen/Forms/CreateProfile.aspx/BindCategory',
        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";
            $("[id*=ddlCategory]").empty();
            $("[id*=ddlCategory]").append('<option value = "0">Select Category</option>');
            $.each(arr, function () {
                // alert('hi');
                $("[id*=ddlCategory]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                // console.log(this.Id + ',' + this.Name);
            });

        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}
function GetReligion() {
    debugger;
    var catCount = 0;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Citizen/Forms/CreateProfile.aspx/BindReligion',
        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";
            $("[id*=ddlReligion]").empty();
            $("[id*=ddlReligion]").append('<option value = "0">Select Religion</option>');
            $.each(arr, function () {
                // alert('hi');
                $("[id*=ddlReligion]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                // console.log(this.Id + ',' + this.Name);
            });

        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}
function GetMaritalstatus() {
    debugger;
    var catCount = 0;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Citizen/Forms/CreateProfile.aspx/BindMaritalstatus',
        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";
            $("[id*=ddlStatus]").empty();
            $("[id*=ddlStatus]").append('<option value = "0">Select Material Status</option>');
            $.each(arr, function () {
                // alert('hi');
                $("[id*=ddlStatus]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                // console.log(this.Id + ',' + this.Name);
            });

        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

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

$(document).ready(function () {
    console.log("ready!");
   
});


function urlprevention() {
    debugger;
    if (+localStorage.tabCount > 0) {
        alert('Already open!');
        window.location = "/Account/Login";

    }

    else {
        localStorage.tabCount = 0;

        localStorage.tabCount = +localStorage.tabCount + 1;
        window.onunload = function () {
            localStorage.tabCount = +localStorage.tabCount - 1;
           
        };
    }


}



function CallPrint(strid) {
    debugger;
    var prtContent = document.getElementById(strid);
    var WinPrint = window.open('', '', 'letf=0,top=0,width=800,height=700,toolbar=0,scrollbars=0,status=0');
    WinPrint.document.write(prtContent.innerHTML);
    WinPrint.document.close();
    WinPrint.focus();
    WinPrint.print();
    WinPrint.close();
}

$(document).keydown(function (event) {
    /*
    if (event.keyCode == 123) {
        return false;
    }
    else if (event.ctrlKey &&
    (event.keyCode === 67 ||
     event.keyCode === 86 ||
     event.keyCode === 85 ||
     event.keyCode === 117)) {
        //alert('not allowed');
        return false;
    }
    else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) {
        return false;  //Prevent from ctrl+shift+i
    }
    */
});
$(document).on("contextmenu", function (e) {
    /*e.preventDefault();*/
});
$(document).ready(function () {
    $(document).keydown(function (event) {
        /*
        if (event.ctrlKey == true && (event.which == '118' || event.which == '86')) {
            //alert('thou. shalt. not. PASTE!');
            event.preventDefault();
        }
        */
    });
});



var dat = new Date();
var curday = dat.getDate();
var curmon = dat.getMonth() + 1;
var curyear = dat.getFullYear();

function checkleapyear(datea) {

    datea.Date = new Date();
    if (datea.getyear() % 4 == 0) {
        if (datea.getyear() % 10 != 0) {
            return true;
        } else {
            if (datea.getyear() % 400 == 0)
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
    debugger;
    var D1 = dob.split('/');
    var calyear = D1[0];
    var calmon = D1[1];
    var calday = D1[2];


    var curd = new Date(curyear, curmon - 1, curday);
    var cald = new Date(calyear, calmon - 1, calday);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
    var dife = datediff(curd, cald);
    return dife[0];
}


function calcDobAge(dateTo) {
    var dateFrom = new Date();
    return calcYMDAge(dateFrom, dateTo);
}

function calcExSerDur(dateOld, dateNew) {

    if (dateOld == null) return false;
    if (dateOld == "") return false;

    if (dateNew == null) return false;
    if (dateNew == "") return false;

    var dateLatest = new Date(dateNew.substring(6, 10),
                    dateNew.substring(3, 5) - 1,
                    dateNew.substring(0, 2)
                  );
    return calcYMDAge(dateLatest, dateOld);
}

// Kindly Change javascript getYear to getFullYear as getYear is depricated
// first param is the most recent/ new date/ current date 
function calcYMDAge(dateFrom, dateTo) {
    debugger;
    var now = dateFrom;
    var today = new Date(now.getFullYear(), now.getMonth(), now.getDate());

    var yearNow = now.getFullYear();
    var monthNow = now.getMonth();
    var dateNow = now.getDate();

    var dob = new Date(dateTo.substring(6, 10),
                        dateTo.substring(3, 5) - 1,
                        dateTo.substring(0, 2)
                      );

    var yearDob = dob.getFullYear();
    var monthDob = dob.getMonth();
    var dateDob = dob.getDate();
    var age = {};
    var ageString = "";
    var yearString = "";
    var monthString = "";
    var dayString = "";


    yearAge = yearNow - yearDob;

    if (monthNow >= monthDob)
        var monthAge = monthNow - monthDob;
    else {
        yearAge--;
        var monthAge = 12 + monthNow - monthDob;
    }

    if (dateNow >= dateDob)
        var dateAge = dateNow - dateDob;
    else {
        monthAge--;
        var dateAge = 31 + dateNow - dateDob;

        if (monthAge < 0) {
            monthAge = 11;
            yearAge--;
        }
    }

    age = {
        years: yearAge,
        months: monthAge,
        days: dateAge
    };

    if (age.years > 1) yearString = " years";
    else yearString = " year";
    if (age.months > 1) monthString = " months";
    else monthString = " month";
    if (age.days > 1) dayString = " days";
    else dayString = " day";


    if ((age.years > 0) && (age.months > 0) && (age.days > 0))
        ageString = age.years + yearString + ", " + age.months + monthString + ", and " + age.days + dayString + " old.";
    else if ((age.years == 0) && (age.months == 0) && (age.days > 0))
        ageString = "Only " + age.days + dayString + " old!";
    else if ((age.years > 0) && (age.months == 0) && (age.days == 0))
        ageString = age.years + yearString + " old. Happy Birthday!!";
    else if ((age.years > 0) && (age.months > 0) && (age.days == 0))
        ageString = age.years + yearString + " and " + age.months + monthString + " old.";
    else if ((age.years == 0) && (age.months > 0) && (age.days > 0))
        ageString = age.months + monthString + " and " + age.days + dayString + " old.";
    else if ((age.years > 0) && (age.months == 0) && (age.days > 0))
        ageString = age.years + yearString + " and " + age.days + dayString + " old.";
    else if ((age.years == 0) && (age.months > 0) && (age.days == 0))
        ageString = age.months + monthString + " old.";
    else ageString = "Oops! Could not calculate age!";

    return age;
}
function ValidateAlpha(evt) {

    //var Name = $('#AccountHolder').val();
    //var charCode;
    var e = evt; // for trans-browser compatibility
    Name = (e.which) ? e.which : event.keyCode;

    //charCode = (evt.which) ? evt.which : event.keyCode;
    if (Name >= 97 && Name <= 122 || Name >= 65 && Name <= 90 || Name == 8 || Name == 32) {
        return true;
    }
    else {
        return false;
    }
}
function checkLength(e1) {
    debugger;
    var evt = e1.value;
    if (e1.value.length >= 2) {
        return true;
        //alert("success");
    }
    else {

        alert("make sure name atleast 2 characters long");

        return false;
    }
}
function AlphaNumeric(e) {

    var regex = new RegExp("[ A-Za-z0-9]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}
function AllowIFSC() {
    debugger;
    var ifsc = document.getElementById('IFSCCode').value;
    var reg = /^[A-Z|a-z]{4}[0][\w]{6}$/;

    if (ifsc.match(reg)) {
       
        $('.IFSCCode').css("border-color", "none")
        $('.forerrormsg').html("")
        return true;

    }
    else {
        //alert("You Entered Wrong IFSC Code");
        $('.IFSCCode').css("border-color", "#dc1717")
        $('.forerrormsg').html("Please Enter correct  IFSC Code")
       
        return false;
    }

}
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
var bool = 1;
function ckhInfo() {

    if (bool == 0) {
        bool = 1;
        $('#divInfo').show(500);
    }
    else {
        bool = 0;
        $('#divInfo').hide(500);

    }
}
function allowBackspace(evt) {
    var e = evt;
    Name = (e.which) ? e.which : event.keyCode;
   
        //    console.log( e.keyCode );
        if (Name.keyCode >= 37 && Name.keyCode <= 40) {
            return; // arrow keys
        }
        if (Name.keyCode === 8 || Name.keyCode === 46) {
            return; // backspace / delete
        }
      
        Name.preventDefault();
    } false;
function Alphanumericspecialchar(e) {
        debugger;
        var regex = new RegExp("[ A-Za-z0-9./-]");
        var key = e.keyCode || e.which;
        key = String.fromCharCode(key);

        if (!regex.test(key)) {
            e.returnValue = false;
            if (e.preventDefault) {
                e.preventDefault();
            }
        }

}

function numericspecialchar(e) {
    debugger;
    var regex = new RegExp("[0-9:/-]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }

}

function AlphaNumericHypenNSlash(evt) {
    //alert(evt);
    if (window.event) {
        var charCode = window.event.keyCode;
        //alert(charCode);
    }
    else if (e) { var charCode = e.which; }
    else { return true; }
    if (charCode == 45)
    { return true; }
    else if (charCode > 31 && (charCode < 45 || charCode > 57) && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122)) { return false; }
    return true;



}

function IsNumericDecimal(e) {

    var regex = new RegExp("[0-9.]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }

}