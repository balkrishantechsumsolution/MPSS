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


function SubmitData() {
    debugger;
    //if (!ValidateForm()) {
    //    return false;
    //}

    //$("#btnSubmit").prop('disabled', true);

    var t_Message = "";
    var result = false;

    var qs = getQueryStrings();
    var Appid = qs["AppID"];
    var svcid = qs["SvcID"];

    var temp = "Gunwant";
    var AppID = "";
    var rtnurl = "";

    var ResponseType = "C";

   
    var result = false;

    var Photograph = '0';
    var Relative = $("input[name='RBTN']:checked").val();
    if ($('#RBTNY').is(":checked")) {
        Photograph = '1';
    }

    var PresentAddress = '0';
    if ($('#RBTNY1').is(":checked")) {
        PresentAddress = '1';
    }

    var OriginalAadhar = '0';
    if ($('#RBTNY2').is(":checked")) {
        OriginalAadhar = '1';
    }

    var Mobile = '0';
    if ($('#RBTNY3').is(":checked")) {
        Mobile = '1';
    }

    var AnyCriminalCase = '0';
    if ($('#RBTNY4').is(":checked")) {
        AnyCriminalCase = '1';
    }


    var datavar = {
        'AppID': Appid
            , 'ServiceID': svcid
            , 'Photograph': Photograph
            , 'PresentAddress': PresentAddress
            , 'OriginalAadhar': OriginalAadhar
            , 'Mobile': Mobile
            , 'AnyCriminalCase': AnyCriminalCase,


    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    $("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/G2G/SeniorCitizen/SCG2GAction.aspx/InsertSeniorCitizenCheckList',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#progressbar").hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Check List Data, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {

            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            result = true;
            if (AppID == "" || AppID == null) {
               // alertPopup("Form Validation Failed", "Error While Saving Application., <BR> Either You Have Used MobileNumber or AadhaarNumber Which Has Been Used Earlier.");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else {
                if (result /*&& jqXHRData_IMG_result*/) {
                    $("#progressbar").hide();
                    //alertPopup("Addmission Into OUAT", "Application saved successfully. Reference ID : " + obj.AppID + " Please Make Payment against the Application Number.");
                   // window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=424&AppID=' + obj.AppID;
                    //window.location.href = '/WebApp/Kiosk/OUAT/OUATProcessbar.aspx?SvcID=424&AppID=' + obj.AppID;
                }
                else {
                    $("#progressbar").hide();
                    alertPopup("Form Validation Failed", "Unable to save Application, Please refresh the browser and try again");
                }
            }

        });// end of Then function of main Data Insert Function

    return false;
}