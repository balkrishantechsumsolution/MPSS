$(document).ready(function () {
    debugger;
    $("#progressbar").hide();

    GetCollege();
    GetOUATState();

    EL("ApplicantImage").addEventListener("change", readFile, false);
    EL("ApplicantSign").addEventListener("change", readFile2, false);
    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });
    //bind data page load
    var qs = getQueryStrings();
    if (qs['AppID'] != null) {
        fnFetchUserDetails(qs['AppID']);
    }

});

function GetCollege() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Enrollment/EnrollmentForm.aspx/GetCollege',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var CollegeName = $("[id=CollegeName]");
            CollegeName.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=CollegeName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetCourse(CourseCode, ProgramCode) {
    var CollegeCode = $('#CollegeName').val()
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Enrollment/EnrollmentForm.aspx/GetCourse',
        data: '{"CollegeCode":"' + CollegeCode + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var CourseName = $("[id=CourseName]");
            CourseName.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=CourseName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });

            selectByVal("CourseName", CourseCode);
            GetProgram(CourseCode, ProgramCode);
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetProgram(CourseCode, ProgramCode) {
    debugger;
    var SelCourse = CourseCode;
    if (SelCourse == null || SelCourse == "") {
        SelCourse = $('#CourseName').val();
    }
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Enrollment/EnrollmentForm.aspx/GetProgram',
        data: '{"CourseCode":"' + SelCourse + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ProgramName = $("[id=ProgramName]");
            ProgramName.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ProgramName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
            if (ProgramCode != "") {
                selectByVal("ProgramName", ProgramCode);
            }
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function fnFetchUserDetails(AppID) {
    debugger;
    $.when(
      $.ajax({
          type: "POST",
          contentType: "application/json; charset=utf-8",
          url: '/WebApp/Migration/Migration.aspx/GetApplicationDetails',
          data: '{"AppID":"' + AppID + '"}',
          processData: false,
          dataType: "json",
          success: function (response) {

          },
          error: function (a, b, c) {
              alert("1." + a.responseText);
          }
      })
       ).then(function (data, textStatus, jqXHR) {
           var obj = jQuery.parseJSON(data.d);
           var AppID = obj.ApplicationTB[0].RegNo;
           var arr = eval(obj.ApplicationTB);
           var arrAge = eval(obj.AgeTB);
           var html = "";
           var RegdNo = arr[0].RegNo;
           var RollNo = arr[0].RollNo
           var Name = arr[0].Name;
           var mobile = arr[0].Mobile;
           var email = arr[0].Email;
           var Father = arr[0].Father;
           var Mother = arr[0].Mother;
           var DOB = arr[0].DOB;
           var Gender = arr[0].Gender;
           var Category = arr[0].Category;
           //var Age = arr[0].Age;
           var Years = arrAge[0].Years;
           var Months = arrAge[0].Months;
           var Days = arrAge[0].Days;
           var CollegeCode = arr[0].CollegeCode;
           var AdmissionYear = arr[0].AdmissionYear;
           var CourseCode = arr[0].CourseCode;
           var ProgrammCode = arr[0].ProgramCode;

           var Photograph = arr[0].Photograph;
           var Signature = arr[0].Signature;
           //$('#hdfCourseCode').val(CourseCode);
           //$('#hdfProgramCode').val(ProgrammCode);

           if (CollegeCode != null && CollegeCode != "") {
               $('#CollegeName').val(CollegeCode);
               $('#CollegeName').prop('disabled', true);
           }

           if (Name != null && Name != "") {
               $('#FirstName').val(Name);
               $('#FirstName').prop('disabled', true);
           }

           //if (email != null && email != "") {
           //    $('#EmailID').val(email);
           //    $('#EmailID').prop('disabled', true);
           //}

           if (CourseCode != null && CourseCode != "") {

               GetCourse(CourseCode, ProgrammCode);
               $('#CourseName').prop('disabled', true);
               //GetProgram();
           }

           if (ProgrammCode != null && ProgrammCode != "") {
               //$('#ProgramName').val();
               //GetProgram(ProgrammCode);
               $('#ProgramName').prop('disabled', true);
           }

           if (RegdNo != null && RegdNo != "") {
               $('#RegdNo').val(RegdNo);
               $('#RegdNo').prop('disabled', true);
           }
           if (RollNo != null && RollNo != "") {
               $('#RollNo').val(RollNo);
               $('#RollNo').prop('disabled', true);
           }
           if (Father != null && Father != "") {
               $('#FatherName').val(Father);
               $('#FatherName').prop('disabled', true);
           }
           if (Mother != null && Mother != "") {
               $('#MotherName').val(Mother);
               $('#MotherName').prop('disabled', true);
           }

           if (DOB != null && DOB != "") {
               $('#DOB').val(DOB);
               $('#DOB').prop('disabled', true);
           }

           $('#MobileNo').val(mobile);
           $('#EmailID').val(email);
           if (Category != null && Category != "") {
               selectByVal("ddlCategory", Category);
               $('#ddlCategory').prop('disabled', true);
           }

           if (Years != null && Years != "") {
               $("#Year").val(Years + " Years");
               $("#Month").val(Months + " Month");
               $("#Day").val(Days + " Days");
               $('#Year').prop('disabled', true);
               $('#Month').prop('disabled', true);
               $('#Day').prop('disabled', true);
           }
           if (Gender != null && Gender != "") {
               selectByVal("ddlGender", Gender);
               $('#ddlGender').prop('disabled', true);
           }
           if (Category != null && Category != "") {
               selectByVal("ddlcategory", Category);
               //$('#ddlcategory').prop('disabled', true);
               if (Category != "UR") {
                   $('#lblCategory').show();
               }
               else { $('#lblCategory').hide(); }
           }
           if (ProgramName != null && ProgramName != "") {
               $('#ProgramName').val(ProgramName);
               $('#ProgramName').prop('disabled', true);
           }
           if (AdmissionYear != null && AdmissionYear != "") {

               $('#ddlAdmission').val(AdmissionYear);
               $('#ddlAdmission').prop('disabled', true);
               //GetProgram();
           }
           if (Photograph != null && Photograph != "") {
               $('#myImg').attr("src", Photograph);
               $('#myImg').prop('disabled', true);
               $('#ApplicantImage').hide();
           }
           else { $('#ApplicantImage').show(); }

           if (Signature != null && Signature != "") {
               $('#mySign').attr("src", Signature);
               $('#mySign').prop('disabled', true);
               $('#ApplicantSign').hide();
           } else { $('#ApplicantSign').show(); }

       });
}

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return false;
    }

    //$("#btnSubmit").prop('disabled', true);

    var t_Message = "";
    var result = false;

    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    var ProfileID = qs["ProfileID"];
    var temp = "Gunwant";
    var AppID = "";
    var rtnurl = "";

    var ResponseType = "C";

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var RegdNo = $("#RegdNo");
    var RollNo = $("#RollNo");
    var CollegeCode = $("#CollegeName option:selected").val();
    var CollegeName = $("#CollegeName option:selected").val();
    var CourseName = $("#CourseName option:selected").val();
    var ProgramName = $("#ProgramName option:selected").val();

    var FirstName = $("#FirstName");
    var FatherName = $("#FatherName");
    var MotherName = $("#MotherName");
    var DOB = $("#DOB");
    var Gender = $("#ddlGender option:selected").text();

    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");

    var Branch = $("#ddlBranch option:selected").text();
    var Father = $("#FatherName");
    var Mother = $("#MotherName");

    var Category = $("#ddlcategory option:selected").val();

    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    var DOMArr = $('#txtTCDate').val().split("/");
    var DOMConverted = DOMArr[2] + "-" + DOMArr[1] + "-" + DOMArr[0];

    var datavar = {

        'ServiceId': svcid,
        'ProfileId': ProfileID,
        'EnrollmentNo': $('#RegdNo').val(),
        'RollNo': $('#RollNo').val(),
        'CourseCode': $('#CourseName').val(),
        'ProgramCode': $('#ProgramName').val(),
        'AdmissionYear': $('#ddlAdmission').val(),
        'PassingYear': $('#ddlPassing').val(),
        'StudentNameEnglish': '',
        'StudentNameHindi': '',
        'FatherName': Father.val(),
        'EmailID': EmailID.val(),
        'MobileNo': MobileNo.val(),
        'DeliverMode': $('#ddlMode').val(),
        'DeliverType': $('#ddlType').val(),
        'AddressLine1': $('#PAddressLine1').val(),
        'AddressLine2': $('#PRoadStreetName').val(),
        'StateCode': $('#PddlState').val(),
        'DistrictCode': $('#PddlDistrict').val(),
        'SubDistrictCode': $('#PddlTaluka').val(),
        'VillageCode': $('#PddlVillage').val(),
        'PinCode': $('#PPinCode').val(),
        'Remark': $('#txtRemark').val(),
        'ApplyingFor': $('#ddlCertificate').val(),
        'TCIssueDate': DOMConverted,
        'TransferCertificateNo': $('#txtTCNo').val(),
        'DOB': DOBConverted
    };
    console.log(datavar);
    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    $("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Provisional/Provisional.aspx/InsertProvisionalData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#progressbar").hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            var status = obj.Status;
            var AadhaarNo = obj.AadhaarNo;

            AppID = obj.AppID;
            result = true;
            if (AppID == "" || AppID == null) {
                $("#progressbar").hide();
                alertPopup("Form Validation Failed", obj.message);
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else {
                if (status == "Success") {
                    $("#progressbar").hide();
                    alertPopup("+3 Admission Form", "Application saved successfully. Application ID : " + obj.AppID);//+ " Please Make Payment against the Application Number."
                    window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID;
                    //window.location.href = '/WebApp/Kiosk/Forms/Acknowledgement.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID;
                    //window.location.href = '/WebApp/Enrollment/Processbar.aspx?SvcID=1467&AppID=' + obj.AppID;
                }
                else if (status == "AadhaarMobile") {
                    $("#progressbar").hide();
                    alertPopup("Aadhaar and Mobile No already exist", "Unable to save Application,We have sent login credentials in your registered mobile no.");
                }
                else if (status == "Mobile") {
                    $("#progressbar").hide();
                    alertPopup("Mobile No already exist", "Mobile no already registered. Please enter another mobile no.");
                }
                else if (status == "Aadhaar") {
                    $("#progressbar").hide();
                    alertPopup("Aadhaar No already exist", "Your aadhaar no. " + AadhaarNo + " already exist in the system.");
                }
                else {
                    $("#progressbar").hide();
                    alertPopup("Either Aadhaar/Mobile No already exist", "Unable to save Application, Please refresh the browser and try again");
                }
            }

        });// end of Then function of main Data Insert Function

    return false;
}
function ValidateForm() {
    var text = "";
    var opt = "";

    var RegdNo = $("#RegdNo");
    var RollNo = $("#RollNo");
    var CollegeCode = $("#CollegeCode");

    var FirstName = $("#FirstName");
    var EngName = $("#txtStudentEng");
    var HinName = $("#txtStudentHin");
    var DOB = $("#DOB");
    var Gender = $("#ddlGender option:selected").text();

    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var Passing = $("#ddlPassing option:selected").text();
    var Admission = $("#ddlAdmission option:selected").text();
    var Father = $("#FatherName");
    var Mother = $("#MotherName");

    var Category = $("#ddlcategory option:selected").text();

    var RegdNo = $("#RegdNo");
    if (RegdNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter DTE Registration No. ";
        RegdNo.attr('style', 'border:1px solid #d03100 !important;');
        RegdNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        RegdNo.attr('style', 'border:1px solid #cdcdcd !important;');
        RegdNo.css({ "background-color": "#ffffff" });
    }

    var RollNo = $("#RollNo");
    if (RollNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Roll No of DTE. ";
        RollNo.attr('style', 'border:1px solid #d03100 !important;');
        RollNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }

    var CollegeCode = $("#CollegeName");
    if (CollegeCode.val() == 'undefined' || CollegeCode.val() == '' || CollegeCode.val() == '0') {
        text += "<BR>" + " \u002A" + " Please select College. ";
        CollegeCode.attr('style', 'border:1px solid #d03100 !important;');
        CollegeCode.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        CollegeCode.attr('style', 'border:1px solid #cdcdcd !important;');
        CollegeCode.css({ "background-color": "#ffffff" });
    }

    var CourseName = $("#CourseName");
    if (CourseName.val() == 'undefined' || CourseName.val() == '' || CourseName.val() == '0') {
        text += "<BR>" + " \u002A" + " Please select Course. ";
        CourseName.attr('style', 'border:1px solid #d03100 !important;');
        CourseName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        CourseName.attr('style', 'border:1px solid #cdcdcd !important;');
        CourseName.css({ "background-color": "#ffffff" });
    }

    var ProgramName = $("#ProgramName");
    if (ProgramName.val() == 'undefined' || ProgramName.val() == '' || ProgramName.val() == '0') {
        text += "<BR>" + " \u002A" + " Please select Program. ";
        ProgramName.attr('style', 'border:1px solid #d03100 !important;');
        ProgramName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        ProgramName.attr('style', 'border:1px solid #cdcdcd !important;');
        ProgramName.css({ "background-color": "#ffffff" });
    }

    if (FirstName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Full Name. ";
        FirstName.attr('style', 'border:1px solid #d03100 !important;');
        FirstName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        FirstName.attr('style', '1px solid #cdcdcd !important;');
        FirstName.css({ "background-color": "#ffffff" });
    }
    if (Father.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Father Name. ";
        Father.attr('style', 'border:1px solid #d03100 !important;');
        Father.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    //if (Mother.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Mother Name. ";
    //    Mother.attr('style', 'border:1px solid #d03100 !important;');
    //    Mother.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}

    if (DOB.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
        DOB.attr('style', 'border:1px solid #d03100 !important;');
        DOB.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }

    if ((Gender == '' || Gender == 'Select' || Gender == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Gender. ";
        $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlGender").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlGender").css({ "background-color": "#ffffff" });
    }
    /*
    if ((Passing == '' || Passing == '-Select-' || Passing == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Passing. ";
        $("#ddlPassing").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlPassing").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlPassing").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlPassing").css({ "background-color": "#ffffff" });
    }*/

    if ((Admission == '' || Admission == '-Select-' || Admission == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Admission Year. ";
        $("#ddlAdmission").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlAdmission").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlAdmission").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlAdmission").css({ "background-color": "#ffffff" });
    }
    /*
    var Mode = $("#ddlMode option:selected").text();
    if ((Mode == '' || Mode == 'Select' || Mode == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Delivery Mode. ";
        $("#ddlMode").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlMode").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlMode").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlMode").css({ "background-color": "#ffffff" });
    }

    var Type = $("#ddlType option:selected").text();
    if ((Type == '' || Type == 'Select' || Type == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Delivery Type. ";
        $("#ddlType").attr('style', 'border:1px solid #d03100 !important;');
        $("#ddlType").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#ddlType").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#ddlType").css({ "background-color": "#ffffff" });
    }
*/
    if (MobileNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
        MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        MobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        MobileNo.css({ "background-color": "#ffffff" });
    }

    if (EmailID.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Email ID. ";
        EmailID.attr('style', 'border:1px solid #d03100 !important;');
        EmailID.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        EmailID.attr('style', 'border:1px solid #cdcdcd !important;');
        EmailID.css({ "background-color": "#ffffff" });
    }
    /*
    if (EngName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Full Name in English. ";
        EngName.attr('style', 'border:1px solid #d03100 !important;');
        EngName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        EngName.attr('style', '1px solid #cdcdcd !important;');
        EngName.css({ "background-color": "#ffffff" });
    }
    if (HinName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Full Name in Hindi. ";
        HinName.attr('style', 'border:1px solid #d03100 !important;');
        HinName.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        HinName.attr('style', '1px solid #cdcdcd !important;');
        HinName.css({ "background-color": "#ffffff" });
    }
    */
    /*// address

    var AddressLine1 = $("#PAddressLine1");
    var AddressLine2 = $("#PAddressLine2");
    var RoadStreetName = $("#PRoadStreetName");
    var LandMark = $("#PLandMark");
    var Locality = $("#PLocality");
    var State = $("#PddlState option:selected").text();
    var District = $("#PddlDistrict option:selected").text();
    var Taluka = $("#PddlTaluka option:selected").text();
    var Village = $("#PddlVillage option:selected").text();
    var Pincode = $("#PPinCode");


    if (AddressLine1 != null && AddressLine1.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Address Line 1 in Delivery Address. ";
        AddressLine1.attr('style', 'border:1px solid #d03100 !important;');
        AddressLine1.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        AddressLine1.attr('style', 'border:1px solid #cdcdcd !important;');
        AddressLine1.css({ "background-color": "#ffffff" });
    }

    if (RoadStreetName != null && RoadStreetName.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Address Line 2 in Deliver Address. ";
        RoadStreetName.attr('style', 'border:1px solid #d03100 !important;');
        RoadStreetName.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        RoadStreetName.attr('style', 'border:1px solid #cdcdcd !important;');
        RoadStreetName.css({ "background-color": "#ffffff" });
    }

    //if (Locality != null && Locality.val() == '') {
    //    text += "<BR>" + " \u002A" + " Please enter Locality in Present Address. ";
    //    Locality.attr('style', 'border:1px solid #d03100 !important;');
    //    Locality.css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    Locality.attr('style', 'border:1px solid #cdcdcd !important;');
    //    Locality.css({ "background-color": "#ffffff" });
    //}

    if (State != null && (State == '' || State == '-Select-')) {
        text += "<BR>" + " \u002A" + " Please select State in Deliver Address.";
        $('#PddlState').attr('style', 'border:1px solid #d03100 !important;');
        $('#PddlState').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#PddlState').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#PddlState').css({ "background-color": "#ffffff" });
    }

    if (District != null && (District == '' || District == '-Select-' || District == 'Select District')) {
        text += "<BR>" + " \u002A" + " Please select District in Deliver Address.";
        $('#PddlDistrict').attr('style', 'border:1px solid #d03100 !important;');
        $('#PddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#PddlDistrict').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#PddlDistrict').css({ "background-color": "#ffffff" });
    }


    if (Pincode != null && Pincode.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Pincode in Deliver Address.";
        $('#PPinCode').attr('style', 'border:1px solid #d03100 !important;');
        $('#PPinCode').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#PPinCode').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#PPinCode').css({ "background-color": "#ffffff" });
    }
    */
    var ApplyingFor = $('#ddlCertificate');
    if ((ApplyingFor.val() == '' || ApplyingFor.val() == 'Select' || ApplyingFor.val() == "0")) {
        text += "<BR>" + " \u002A" + " Please Select Certificate Type. ";
        ApplyingFor.attr('style', 'border:1px solid #d03100 !important;');
        ApplyingFor.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        ApplyingFor.attr('style', 'border:1px solid #cdcdcd !important;');
        ApplyingFor.css({ "background-color": "#ffffff" });
    }

    var TCIssueDate = $('#txtTCDate');
    if (TCIssueDate.val() == '' || TCIssueDate.val() == 'undefined') {
        text += "<BR>" + " \u002A" + " Please Select Transfer Certificate Issue Date. ";
        TCIssueDate.attr('style', 'border:1px solid #d03100 !important;');
        TCIssueDate.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        TCIssueDate.attr('style', 'border:1px solid #cdcdcd !important;');
        TCIssueDate.css({ "background-color": "#ffffff" });
    }
    var TransferCertificateNo = $('#txtTCNo');
    if (TransferCertificateNo.val() == '' || TransferCertificateNo.val() == 'undefined') {
        text += "<BR>" + " \u002A" + " Please enter Transfer Certificate No. ";
        TransferCertificateNo.attr('style', 'border:1px solid #d03100 !important;');
        TransferCertificateNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        TransferCertificateNo.attr('style', 'border:1px solid #cdcdcd !important;');
        TransferCertificateNo.css({ "background-color": "#ffffff" });
    }

    var chkdeclaration = 0;
    if ($('#chkDeclaration').is(":checked")) {
        // it is checked
        chkdeclaration = 1;
    }

    if (chkdeclaration == 0) {
        //chkAbility
        text += "<BR>" + " \u002A" + "  Please check Declaration and read it. ";
        opt = 1;
        $('#lblDeclaration').attr('style', 'color:red !important;');
        $('#lblDeclaration').css({ "color": "red" });
    }
    else {
        $('#lblDeclaration').attr('style', 'color:#000000 !important;');
        $('#lblDeclaration').css({ "color": "#000000 " });
    }

    if (opt == "") {
        if (!$("#chkDeclaration").is(":checked")) {
            text += "<BR>" + " \u002A" + " Please check Self Declaration.";
            lblDeclaration
            $('#lblDeclaration').attr('style', 'color:red !important;');
            $('#lblDeclaration').css({ "color": "red" });
            opt = 1;
        }
        else {
            $('#lblDeclaration').attr('style', 'color:#000000 !important;');
            $('#lblDeclaration').css({ "color": "#000000" });
        }

    }

    //END Here
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function EL(id) {
    return document.getElementById(id);
} // Get el by ID helper function

function readFile() {

    if (this.files && this.files[0]) {

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 10 || sizekb > 50) {
            // $('#imgupload').attr('src', null);
            alert('The size of the photograph should fall between 20KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }
        var ftype = this;
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Photograph only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
            }
            else {
                alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("myImg").src = e.target.result;
            EL("HFb64").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}

function readFile2() {

    if (this.files && this.files[0]) {

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfSign').val(sizekb);
        if (sizekb < 5 || sizekb > 20) {
            // $('#imgupload').attr('src', null);
            alert('The size of the signature should fall between 10KB to 20KB. Your signature Size is ' + sizekb + 'kb.');
            return false;
        }

        var ftype = this; //document.getElementById('File1');
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Signature only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
            }
            else {
                alert("Signature only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("mySign").src = e.target.result;
            EL("HFb64Sign").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
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

function selectByVal(p_Control, txt) {
    var t_Value = txt;
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }
    return t_Value;
}

function ValidateCSVTURegNo() {
    var RegdNo = $('#txtCSVTURegdNo');

    //let regex = /[a-zA-Z]+([+-]?(?=\.\d|\d)(?:\d+)?(?:\.?\d*))(?:[eE]([+-]?\d+))?/i;

    if (RegdNo.val() != '') {
        var regex = /[a-zA-Z]+([+-]?(?=\.\d|\d)(?:\d+)?(?:\.?\d*))(?:[eE]([+-]?\d+))?/i;
        if (!regex.test(RegdNo.val())) {
            RegdNo.val('');
            RegdNo.attr('style', 'border:1px solid #d03100 !important;');
            RegdNo.css({ "background-color": "#fff2ee" });
            alertPopup("Registration No Validation!", " Please Enter correct CSVTU Registration No.");
            return;
        } else {
            RegdNo.attr('style', 'border:1px solid #cdcdcd !important;');
            RegdNo.css({ "background-color": "#ffffff" });

        }

        return regex.test(RegdNo);
    }
}

function GetOUATState() {
    var SelState = $('#PddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATState',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlState = $("[id=PddlState]");
            ddlState.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=PddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetOUATDistrict() {
    var SelState = $('#PddlState').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        //url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATDistrict',
        url: '/WebApp/Kiosk/RD/SeniorCitizen.aspx/GetSeniorCitizenOdishaDistrict',
        data: '{"prefix":"","StateCode":"' + SelState + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlDistrict = $("[id=PddlDistrict]");
            ddlDistrict.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=PddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetOUATBlock() {
    var SelBlock = $('#PddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATBlock',
        data: '{"prefix":"","DistrictCode":"' + SelBlock + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlBlock = $("[id=PddlTaluka]");
            ddlBlock.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=PddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function GetOUATPanchayat() {
    var SelSubDistrict = $('#PddlTaluka').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/OUAT/DoctoralMastersAdmissionForm16-17.aspx/GetOUATPanchayat',
        data: '{"prefix":"","SubDistrictCode":"' + SelSubDistrict + '"}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlVillage = $("[id=PddlVillage]");
            ddlVillage.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=PddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}

function Declaration(chk) {

    debugger;

    if (chk) {
        if ($('#FirstName').val() == "" || $('#FatherName').val() == "") {
            //alert("Please enter the all the mandatory fields.");
            alert("Please enter your Full Name, Father Name  to continue.");
            document.getElementById("chkDeclaration").checked = false;
            return false;
        }

        if ($('#CddlDistrict').val() == 0) {
            alert("Please select Present District to continue.");
            document.getElementById("chkDeclaration").checked = false;
            return false;
        }
        if ($('#ddlGender').val() != '0') {
            if ($('#ddlGender').val() == "Male") {
                $('#lblGender').text("son of ");
                $('#lblTitle').text("Mr.");
            } else if ($('#ddlGender').val() == "Female") {
                $('#lblGender').text("daughter of ");
                $('#lblTitle').text("Ms.");
            } else { $('#lblGender').text("transgender of"); $('#lblTitle').text("Mr./Ms."); }
        }
        else {
            alert("Please, select Gender");
            document.getElementById("chkDeclaration").checked = false;
            return false;
        }

        var name = $('#FirstName').val();
        var fname = $('#FatherName').val();
        var place = $("#CddlDistrict option:selected").text();//$('#CddlDistrict').val();
        //alert(name);
        $("#lblName").text(name);
        $("#lblApplicant").text(name);
        $("#lblNameAadhaar").text(name);
        $("#lblPhsclFthrName").text(fname);
        //$("#lblPhsclDstName").text(fname);
        //$("#cndidteplce").text(place);

        $('#btnSubmit').prop('disabled', false);


        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!

        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        var today = dd + '/' + mm + '/' + yyyy;
        $("#currntdte").text(today);
        $('#divDeclaration').show();
    }
    else {
        $("#lblName").text("");
        $("#lblNameAadhaar").text("");
        $("#lblApplicant").text("");
        $("#lblPhsclFthrName").text("");
        $("#lblPhsclDstName").text("");
        $('#btnSubmit').prop('disabled', true);
        $('#divDeclaration').hide();
    }
}