
function CheckUID(UID) {
    var UIDData = "";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Kiosk/BasicDetail.aspx/CheckUID',
        data: '{"prefix": ""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";
            UIDData = arr[0].Name;


            if (UIDData != null || UIDData != "")
                return true;
            else {
                return false;
            }



        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });




}

function BindUIDData(UIDData) {

    $("#step1").addClass("stepactive");
    $("#step2").removeClass("active");
    $("#step3").removeClass("active");
    $("#step4").removeClass("active");
    $("#step5").removeClass("active");
    $("#step6").removeClass("active");

    $("#divSearch").show();
    $("#divBasicInfo").hide();
    $("#divAddress").hide();
    $("#divBtn").hide();

    $("#btnConfirm").bind("click", function (e) { return CheckDeclaration(); });

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

            //var Age = calage(date);
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
        }
    });

    $('#ddlSearch').change(function () {
        var k = $(this).val();
        if (k == "U") {
            $("#UID").attr("placeholder", "Enter 12 Digit Aadhaar No.").val("").focus().blur();
        }
        else if (k == "C") {
            $("#UID").attr("placeholder", "Enter Citizen Profile ID").val("").focus().blur();
        }
        else if (k == "A") {
            $("#UID").attr("placeholder", "Enter Application ID").val("").focus().blur();
        }
    });


    //alert('shhsd');
    if ($("#HFUIDData").val() != "") {

        debugger;
        $("#divSearch").show();
        $("#divBasicInfo").show();
        $("#divAddress").show();
        $("#divBtn").show();
        $("#ddlSearch").prop("disabled", true);
        $("#UID").prop("disabled", true);
        $("#btnSearch").prop("disabled", true);
        $("#fulPhoto").hide();

        var obj = jQuery.parseJSON($("#HFUIDData").val());

        if (obj["dateOfBirth"] != "") {
            var t_DOB = obj["dateOfBirth"];
            t_DOB = t_DOB.replace(/-/g, "/");
            $('#DOB').val(t_DOB);
            $('#DOB').prop("disabled", true);

            debugger;
            var t_DOB = $("#DOB").val();
            t_DOB = t_DOB.replace("-", "/");
            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear();
            var Age = calage(t_DOB);
            $('#Age').val(Age);
        }

        document.getElementById('ProfilePhoto').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);

        $("#FirstName").val(obj["residentName"]);
        $('#FirstName').prop("disabled", true);

        $("#UID").val(obj["aadhaarNumber"]);
        $('#UID').prop("disabled", true);

        $("#FatherName").val(obj["careOf"]);
        $('#FatherName').prop("disabled", true);

        obj["district"];

        $('#EmailID').val(obj["emailId"]);

        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("M");
                $('#ddlSalutation').val("Mr.");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("F");
                $('#ddlSalutation').val("Mrs");
            }
            else {
                $('#ddlGender').val("T");
                $('#ddlSalutation').val("Other");
            }
            $('#ddlGender').prop("disabled", true);
        }

        $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").val(obj["houseNumber"]);
        $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").prop("disabled", true);

        $("[name='ctl00$ContentPlaceHolder1$AddressLine2']").prop("disabled", true);

        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").prop("disabled", true);

        $("[name='ctl00$ContentPlaceHolder1$LandMark']").val(obj["landmark"]);
        $("[name='ctl00$ContentPlaceHolder1$LandMark']").prop("disabled", true);

        $("[name='ctl00$ContentPlaceHolder1$Locality']").val(obj["locality"]);
        $("[name='ctl00$ContentPlaceHolder1$Locality']").prop("disabled", true);

        $('#phoneno').val(obj["phone"]);
        $('#MobileNo').val(obj["phone"]);
        $("[name='ctl00$ContentPlaceHolder1$PinCode']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$PinCode']").prop("disabled", true);

        if (obj["state"] != "") {
            $('#txtState').val(obj["state"]);
            $('#txtState').prop("disabled", true);
        }
        $('#txtDistrict').val(obj["district"]);
        $('#txtBlock').val(obj["subDistrict"]);
        $('#txtPanchayat').val(obj["vtc"]);
        $('#txtDistrict').prop("disabled", true);
        $('#txtBlock').prop("disabled", true);
        $('#txtPanchayat').prop("disabled", true);

        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);

    }//end of UID Data

}

function validateUID(UIDVal) {
    debugger;
    if (UIDVal == "1") {
        var UID = $("#UID").val();
        var length = UID.length;

        if ($("#UID").val() == "") {
            alert("Please enter Aadhaar UID number.");
            //$("#UID").focus();
            return false;
        }
        if (eval(length) < 12) {
            alert("Aadhaar UID should be 12 digit");
            $("#UID").val("");

            return false;
        }

    }
}

function openWindow(UIDVal, value, SessionName) {
    debugger;
    if (validateUID(UIDVal) != false) {
        var qs = getQueryStrings();
        var SvcID = "800";
        if (qs["SvcID"] != null) {
            SvcID = qs["SvcID"];
        }
        else { SvcID = "800"; }
        //if (UIDVal == "1") {
        //code = UIDVal;
        //}

        //CheckLocalAadhar($("#UID").val());
        var UID = $("#UID").val();
        var EID = "0";
        var left = (screen.width / 2) - (560 / 2);
        var top = (screen.height / 2) - (400 / 2);

        window.open('/UID/Default.aspx?SvcID=' + SvcID + '&aadhaarNumber=' + UID + '&kycTypesToUse=OTP', 'open_window',
        ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        window.focus();
    }
    return false;
}

function CheckLocalAadhar(UID) {

    $.when(
           $.ajax({
               type: "POST",
               contentType: "application/json; charset=utf-8",
               url: '/WebApp/Kiosk/Forms/BasicDetail.aspx/CheckLocalAadhaar',
               data: '{"prefix":"","UID":"' + UID + '"}',
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
               var arr = eval(data.d);
               var html = "";
               var code = "";
               code = arr[0].Aadhaar;
               if (code == '1') {
                   var EID = "0";
                   var left = (screen.width / 2) - (560 / 2);
                   var top = (screen.height / 2) - (400 / 2);

                   window.open('/UID/VerifyUID.aspx?aadhaarNumber=' + UID + '&kycTypesToUse=OTP&transactionId=jhh', 'open_window',
                   ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
                   window.focus();
               }
               else {

                   var EID = "0";
                   var left = (screen.width / 2) - (560 / 2);
                   var top = (screen.height / 2) - (400 / 2);

                   window.open('/UID/Default.aspx?aadhaarNumber=' + UID + '&kycTypesToUse=OTP&transactionId=<%=Guid.NewGuid().ToString()%>', 'open_window',
                   ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
                   window.focus();
               }

           });// end of Then function of main Data Insert Function
    
}


function GetJISONKeyField(ProfileID) {
    var JSIONData = "";
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/kiosk/forms/basicdetail.aspx/GetUIDKeyField',
        //data: '{"prefix": ""}',
        //data: '{"UID": '+uid+'}',
        data: '{"prefix":"","UID":"' + ProfileID + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";
            var name = arr[0].Name;
            JSIONData = name;
            return JSIONData;
        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });

}

function getQueryStrings() {
    debugger;
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