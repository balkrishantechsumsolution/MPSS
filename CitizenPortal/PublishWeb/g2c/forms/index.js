$(document).ready(function () {
    console.log("ready!");
    $('#myModal2').hide();
    GetServices();
    $('#divhideshow').hide();
   
    
});


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



function sendotp() {
    debugger;
    var MobileNo = $('#MobileNo').val();
    var btnotp = $('#btnsendotp').val();
    if (MobileNo == null || MobileNo == "") {
        alert("Please Enter Mobile Number");
        return;
    }
    else {
        $('#btnsendotp').prop('disabled', false);
    }


    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/g2c/Forms/index.aspx/SendOtpbtn",
        data: '{"MobileNo":"' + $('#MobileNo').val() + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            alert("OTP Sucessfully Sent, Please Check and Verify!!!");
            $('#btnsendotp').prop('disabled', true);
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });
}
function verifyotp() {
    var OTP = $('#verifyOTP').val();
    var btnotp = $('#btnverifyotp').val();
    if (OTP == null || OTP == "") {
        alert("Please Enter 6-Digit OTP Number");
        return;
    }
    else {
        $('#btnverifyotp').prop('disabled', false);
    }

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/g2c/Forms/index.aspx/verifyotpbtn",
        data: '{"MobileNo":"' + $('#MobileNo').val() + '","OTPText":"' + $('#verifyOTP').val() + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            if (result.d == null || result.d == "0") {
                alert("OTP Verification Failed");
                $('#verifyOTP').val('');
            }
            else {
                alert("OTP Successfully Verified");
                $('#btnverifyotp').prop("disabled", true);

            }
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });
}

function getFeedbackData() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/g2c/forms/index.aspx/getAppData",
        data: '{"AppID":"' + $('#applicationID').val() + '","ServiceID":"' + $('#ddlservices').val() + '"}',
        processData: false,
        dataType: "json",
        success: function (Result) {
            ///     var data = $.parseJSON(Result);
            var data = Result.d;
            // console.log(Result.d);
            // alert(Result.d);
            if (Result.d != null) {
            //    debugger;
                $('#FullName').attr('style', 'border:2px solid green !important;');
                $('#FullName').css({ "background-color": "#ffffff" });
                $("#FullName").val(data);
            //    $("#btnSubmit").prop("disabled", false);
            }
            else {
                $('#FullName').val('');
                $("#FullName").prop("disabled", true);
                alertPopup("APPLICATION ID INFORMATION", "<BR> NO DATA FOUND!!! <BR> INVALID APPLICATION ID ENTERED!!!");
            }
        },
        error: function (Result) {
            alert(Result);
        }
    });
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

function SubmitFeedBackData() {
    var temp = "Mohan";
    var AppID = "";
    var result = false;
    if (!ValidateFeedBackForm()) {
        return;
    }

    // var qs = getQueryStrings();
    // var uid = qs["UID"];
    //var svcid = qs["SvcID"];
    //var dpt = qs["DPT"];
    //var dist = qs["DIST"];
    //var blk = qs["BLK"];
    //var pan = qs["PAN"];
    //var ofc = qs["OFC"];
    //var ofr = qs["OFR"];

    var datavar = {

        'aadhaarNumber': '123456446464',
        'FullName': $('#FullName').val(),
        'MobileNo': $('#MobileNo').val(),
        'verifyOTP': $('#verifyOTP').val(),
        'EmailID': $('#emailid').val(),
        'FServices': $('#ddlservices').val(),
        'Fdepartment': $('#ddldepartment').val(),
        'ApplicationID': $('#applicationID').val(),
        'TypeOfIssue': $('#issueType').val(),
        'OtherIssue': $('#otherIssue').val(),
        'FeedBackDetail': $('#txtcomments').val(),
        //'department': dpt,
        //'district': dist,
        //'block': blk,
        //'panchayat': pan,
        //'office': ofc,
        //'officer': ofr,
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/g2c/forms/index.aspx/InsertServiceFeedBack',
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
                alert("Your FeedBack submitted successfully");
                window.location.href = '../forms/index.aspx';
            }

        });// end of Then function of main Data Insert Function

    return false;
}

function GetServices() {
   
    var SelServices = $('#ddlservices').val();

  
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/g2c/forms/index.aspx/ServiceData",
        data: '{}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=ddlservices]");
            ddlCustomers.empty().append('<option selected="selected" value="0">-Select Service-</option>');
            $.each(r.d, function () {
                $("[id*=ddlservices]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
        }
    });
}

function GetDepartment() {
    $("#FullName").val('');
    $('#applicationID').val('');
    var SelServices = $('#ddlservices').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/g2c/forms/index.aspx/DepartmentData",
        data: '{"SelServices":"' + SelServices + '"}',
        dataType: "json",
        success: function (r) {
            var ddlCustomers = $("[id*=ddldepartment]");
            //ddlCustomers.empty().append('<option selected="selected" value="0">-Select Department-</option>');
            ddlCustomers.empty();
            $.each(r.d, function () {
                $("[id*=ddldepartment]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });
            $("[id*=ddldepartment]").prop("disabled", true)
        }
    });
}


function OnchangeFunctionservice() {
    GetDepartment();
    $('#applicationID').val('');
    $("#FullName").val('');
    $("#FullName").pro("disabled", false);
}


function othertype() {
    debugger;
    var issueType = $("#issueType option:selected").val();
    var otherIssue = $('#otherIssue').val();

    if (issueType == "4") {
        $('#divhideshow').show();
    }
    else {

        $('#divhideshow').hide();
    }
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

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function checkmobile() {
    var text = "";
    var opt = "";
    var mobileno = $("#MobileNo").val();

    if (mobileno != null) {
        if (isNaN(mobileno) || mobileno.indexOf(" ") != -1) {
            text += "<br /> Please Enter A Valid Mobile Number.";
            //alertPopup("Mobile Number", "</BR> Please Enter Valid Mobile Number.");
            opt = 1;
        }
        if (mobileno.length > 10 || mobileno.length < 10) {
            text += "<br /> Mobile No. Should Be Atleast 10 Digit.";
            //alertPopup("Mobile Number", "</BR> Mobile No. Should Be 10 Digit.");
            opt = 1;
        }
        if (!(mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7")) {
            text += "<br /> Mobile No. Should Start With 9 ,8 or 7.";
            //alertPopup("Mobile Number", "</BR> Mobile No. Should Starts Sith 9 ,8 or 7");
            opt = 1;
        }
    }
    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
        $("#MobileNo").val("");

        return false;
    }
    return true;
}

function email() {
    debugger;
    var emailid = document.getElementById('emailid').value;
    //var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{1,3})(\]?))$/;
    //var reg = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (emailid.match(reg)) {
        $('#emailid').attr('style', 'border:1px solid #ddd !important;');
        $('#emailid').css({ "background-color": "#ffffff" });
    }
    else {
        alertPopup("Please Enter Email-ID.", "</BR> Please Enter A Valid Email-ID in Proper Format");
        $('#emailid').attr('style', 'border:2px solid red !important;');
        $('#emailid').val('');
    }
}

function ValidateFeedBackForm() {
    debugger;
    var text = "";
    var opt = "";

    var FullName = $('#FullName').val();
    var MobileNo = $('#MobileNo').val();
    var verifyOTP = $('#verifyOTP').val();
    var emailid = $('#emailid').val();
    var ddlservices = $("#ddlservices option:selected").val();
    var ddldepartment = $("#ddldepartment option:selected").val();
    var ApplicationID = $('#applicationID').val();
    var issueType = $("#issueType option:selected").val();
    var otherIssue = $('#otherIssue').val();
    var txtcomments = $('#txtcomments').val();




    if (FullName == null || FullName == "") {
        text += "<br /> Please Enter Your Name. ";
        $('#FullName').attr('style', 'border:1px solid red !important;');
        $('#FullName').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#FullName').attr('style', 'border:1px solid #ddd !important;');
        $('#FullName').css({ "background-color": "#ffffff" });
    }


    if (MobileNo == null || MobileNo == "") {
        text += "<br /> Please Enter Your Mobile No. ";
        $('#MobileNo').attr('style', 'border:1px solid red !important;');
        $('#MobileNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#MobileNo').attr('style', 'border:1px solid #ddd !important;');
        $('#MobileNo').css({ "background-color": "#ffffff" });
    }
    if (verifyOTP == null || verifyOTP == "") {
        text += "<br /> Please Enter OTP. ";
        $('#verifyOTP').attr('style', 'border:1px solid red !important;');
        $('#verifyOTP').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#verifyOTP').attr('style', 'border:1px solid #ddd !important;');
        $('#verifyOTP').css({ "background-color": "#ffffff" });
    }
    if (emailid == null || emailid == "") {
        text += "<br /> Please Enter Your Email Id. ";
        $('#emailid').attr('style', 'border:1px solid red !important;');
        $('#emailid').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#emailid').attr('style', 'border:1px solid #ddd !important;');
        $('#emailid').css({ "background-color": "#ffffff" });
    }

    if (ddlservices == "-Select Service-" || ddlservices == "0") {
        text += "<br /> Please Select  Service.";
        $('#ddlservices').attr('style', 'border:1px solid red !important;');
        $('#ddlservices').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlservices').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlservices').css({ "background-color": "#ffffff" });
    }

    if (ddldepartment == "-Select Department-" || ddldepartment == "0") {
        text += "<br /> Please Select  Department.";
        $('#ddldepartment').attr('style', 'border:1px solid red !important;');
        $('#ddldepartment').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddldepartment').attr('style', 'border:1px solid #ddd !important;');
        $('#ddldepartment').css({ "background-color": "#ffffff" });
    }

    if (ApplicationID == null || ApplicationID == "") {
        text += "<br /> Please Enter Your ApplicationID. ";
        $('#applicationID').attr('style', 'border:1px solid red !important;');
        $('#applicationID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#applicationID').attr('style', 'border:1px solid #ddd !important;');
        $('#applicationID').css({ "background-color": "#ffffff" });
    }
    if (issueType == "-Select Issues-" || issueType == "0") {
        text += "<br /> Please Select  Type of issue.";
        $('#issueType').attr('style', 'border:1px solid red !important;');
        $('#issueType').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#issueType').attr('style', 'border:1px solid #ddd !important;');
        $('#issueType').css({ "background-color": "#ffffff" });
    }
    if (issueType == "4" || issueType == "Others") {
        if (otherIssue == null || otherIssue == "") {
            text += "<br /> Please Enter Other Issues. ";
            $('#otherIssue').attr('style', 'border:1px solid red !important;');
            $('#otherIssue').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#otherIssue').attr('style', 'border:1px solid #ddd !important;');
            $('#otherIssue').css({ "background-color": "#ffffff" });
        }
    }

    if (txtcomments == null || txtcomments == "") {
        text += "<br /> Please Enter Your FeedBack . ";
        $('#txtcomments').attr('style', 'border:1px solid red !important;');
        $('#txtcomments').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtcomments').attr('style', 'border:1px solid #ddd !important;');
        $('#txtcomments').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
        return false;
    }
    return true;
}