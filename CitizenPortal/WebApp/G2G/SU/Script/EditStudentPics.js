
$(document).ready(function () {
    debugger;

    $("#progressbar").hide();

    EL("ApplicantImage").addEventListener("change", readFile, false);
    EL("ApplicantSign").addEventListener("change", readFile2, false);

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




function selectByVal(p_Control, txt) {
    var t_Value = txt;
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }
    return t_Value;
}



////validate senior citizen age
function ValiateSCAge(Ages) {
    debugger;
    var Age = Ages;
    if (Age != '') {
        if (Age < 60 || Age == 0) {
            $("#Year").val('');
            $("#Month").val('');
            $("#Day").val('');
            $("#DOB").val('');
            var dob = $("#DOB");

            //dob.attr('style', 'border:1px solid #d03100 !important;');
            //dob.css({ "background-color": "#fff2ee" });
            alertPopup("Age Validation", "<BR>" + " \u002A" + "For apply this service your age should be minimum 60 year.")
        }
    }
}



function isNumberKeyDecimal(e) {
    var code = (code ? code : e.which);
    if (code != 46 && code > 31 && (code < 48 || code > 57))
        return false;
        //if it is (.)
    else if (code == 46) {
        var Value = $('#txtTotalMarks').val();//this.value;
        //if value already contains (.) character
        if (Value.indexOf('.') != -1) {
            var splt = Value.split('.');
            //if there is already(.) char then return false
            if (splt.length >= 2)
                return false;
        }
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


function EditStudentData() {
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
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    var DOB = $("#DOB");

    if (DOB.val() != '') {
        var todaydate = $.datepicker.formatDate('dd/mm/yy', new Date());
        var txtDOB = DOB.val();
        var dateDOB = new Date(txtDOB.substr(6, 4), txtDOB.substr(3, 2) - 1, txtDOB.substr(0, 2));
        var Age = calcExSerDur(txtDOB, todaydate);
        var ageToCompare = Age.years;
        var ageActual = Age.years;
    }

    var temp = "Gunwant";
    var AppID = "";
    var rtnurl = "";

    var ResponseType = "C";

    if ($("#HFUIDData").val() != "") {
        ResponseType = "";
    }

    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];
        
    var datavar = {
        'RollNo': $('#txtRollNo').val(),
        'AppID': $('#txtAppID').val(),
        'ProfileID': $('#UID').val(),
        'AadhaarNumber': $('#UID').val(),        
        'Remarks': $('#txtRemarks').val(),
        'Image': $('#HFb64').val(),
        'ImageSign': $('#HFb64Sign').val(),
        
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
            url: '/WebApp/G2G/SU/EditStudentPics.aspx/UpdateStudentData',
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
                alertPopup("Form Validation Failed", "Error While Saving Application., <BR> Either You Have Used MobileNumber or AadhaarNumber Which Has Been Used Earlier.");
                //rtnurl = "/Account/Login";
                //window.location.href = rtnurl;
                //return;
            }
            else {
                if (status == "Success") {
                    $("#progressbar").hide();
                    alertPopup("Record Update", "Application Updated successfully. Reference ID : " + obj.AppID);//+ " Please Make Payment against the Application Number."
                    window.location.href = '/WebApp/Kiosk/CBCS/Acknowledgement.aspx?SvcID=1449&AppID=' + obj.AppID;
                    //window.location.href = '/WebApp/Kiosk/OUAT/OUATProcessbar.aspx?SvcID=424&AppID=' + obj.AppID;
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

    // Basic Information 

    var FirstName = $("#FirstName");
    var MobileNo = $("#MobileNo");    
    var DOB = $("#DOB");
    
    var Father = $("#FatherName");
    var Mother = $("#MotherName");
    
    if (EL("myImg").src.indexOf("photo.png") != -1) {
        text += "<BR>" + " \u002A" + " Please upload Applicant Photograph.";
        $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
        $('#myImg').css({ "background-color": "#fff2ee" });
        $('#myImg').css({ "height": "220px" });
        opt = 1;
    } else {
        $('#myImg').attr('style', 'border:0 !important;');
        $('#myImg').css({ "background-color": "" });
        $('#myImg').css({ "height": "220px" });
    }

    if (EL("mySign").src.indexOf("signature.png") != -1) {
        text += "<BR>" + " \u002A" + " Please upload Applicant Signature.";
        $('#mySign').attr('style', 'border:1px solid #d03100 !important;');
        $('#mySign').css({ "background-color": "#fff2ee" });
        $('#mySign').css({ "height": "130px" });
        opt = 1;
    } else {
        $('#mySign').attr('style', '');
        $('#mySign').css({ "background-color": "" });
        $('#mySign').css({ "height": "130px" });
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
    if (Father.val() == '' && Gaurdian.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Father Name. ";
        Father.attr('style', 'border:1px solid #d03100 !important;');
        Father.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if (Mother.val() == '' && Gaurdian.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mother Name. ";
        Mother.attr('style', 'border:1px solid #d03100 !important;');
        Mother.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    if ((Father.val() == '' || Mother.val() == '') && Gaurdian.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Gaurdian Name. ";
        Mother.attr('style', 'border:1px solid #d03100 !important;');
        Mother.css({ "background-color": "#fff2ee" });
        opt = 1;
    }
   
    if (DOB.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Date of Birth. ";
        DOB.attr('style', 'border:1px solid #d03100 !important;');
        DOB.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        DOB.attr('style', 'border:1px solid #cdcdcd !important;');
        DOB.css({ "background-color": "#ffffff" });
    }
    
    if (MobileNo.val() == '') {
        text += "<BR>" + " \u002A" + " Please enter Mobile No. ";
        MobileNo.attr('style', 'border:1px solid #d03100 !important;');
        MobileNo.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        //MobileNo.attr('style', 'border:1px solid #cdcdcd !important;');
        //MobileNo.css({ "background-color": "#ffffff" });
    }
    
    
    if ($('#txtRemarks').val() != null && $('#txtRemarks').val() == '') {
        text += "<br /> -Please enter Remarks for Update. ";
        $('#txtRemarks').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRemarks').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtRemarks').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRemarks').css({ "background-color": "#ffffff" });
    }

    //END Here
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

//application details by aapid on page load...............
function fnFetchUserDetails() {
    debugger;

    var RollNo = $('#txtRollNo').val();

    try {

        $.when(
          $.ajax({
              type: "POST",
              contentType: "application/json; charset=utf-8",
              url: '/WebApp/G2G/SU/EditStudentPics.aspx/GetApplicationDetails',
              data: '{"RollNo":"' + RollNo + '"}',
              processData: false,
              dataType: "json",
              success: function (response) {

              },
              error: function (a, b, c) {
                  alert("1." + a.responseText);
              }
          })
           ).then(function (data, textStatus, jqXHR) {
               debugger;
               var obj = jQuery.parseJSON(data.d);

               var AppID = obj.AppID;
               var arr = eval(data.d);
               var html = "";
               var AadhaarNo = arr[0]["AadhaarNo"];
               var AdmissionNo = arr[0].AdmissionNo;
               var AdmissionDate = arr[0].AdmissionDate;
               var BranchCode = arr[0].BranchCode;
               var BranchName = arr[0].BranchName;
               var Name = arr[0].Name;
               var mobile = arr[0].Mobile;
               var email = arr[0].Email;
               var Father = arr[0].Father;
               var Mother = arr[0].Mother;
               var Gaurdian = arr[0].Gaurdian;
               var Relation = arr[0].Relation;
               var DOB = arr[0].DOB;
               var Gender = arr[0].Gender;
               var MotherTongue = arr[0].MotherTongue;
               var Category = arr[0].Category;
               var UserId = arr[0].UserId;
               var Age = arr[0].Age;
               var name = arr[0].Name;
               var CollegeName = arr[0].CollegeName;
               var CollegeCode = arr[0].CollegeCode;
               var SubjectList = arr[0].SubjectList;
               //address
               var AddrCareOf = arr[0]["AddrCareOf"];
               var AddrBuilding = arr[0]["AddrBuilding"];
               var AddrStreet = arr[0]["AddrStreet"];
               var AddrLandmark = arr[0]["AddrLandmark"];
               var AddrLocality = arr[0]["AddrLocality"];
               var State = arr[0]["State"];
               var District = arr[0]["District"];
               var Taluka = arr[0]["Taluka"];
               var Village = arr[0]["Village"];
               var PinCode = arr[0]["PinCode"];
               var CareOfP = arr[0]["CareOfP"];
               var CareOfLocalP = arr[0]["CareOfLocalP"];
               var houseNumberP = arr[0]["houseNumberP"];
               var LandmarkP = arr[0]["LandmarkP"];
               var LocalityP = arr[0]["LocalityP"];
               var pincodeP = arr[0]["pincodeP"];
               var StreetP = arr[0]["StreetP"];
               var StateCodeP = arr[0]["StateCodeP"];
               var DistrictCodeP = arr[0]["DistrictCodeP"];
               var BlockCodeP = arr[0]["BlockCodeP"];
               var PanchayatCodeP = arr[0]["PanchayatCodeP"];
               //SSC & HSC Marks Param
               var BoardType = arr[0]["BoardType"];
               var RollNo10 = arr[0]["RollNo10"];
               var BoardName = arr[0]["BoardName"];
               var ExamPass = arr[0]["ExamPass"];
               var PassingYear = arr[0]["PassingYear"];
               var GradeType = arr[0]["GradeType"];
               var TotalMark = arr[0]["TotalMark"];
               var MarkObtained = arr[0]["MarkObtained"];
               var Percentage = arr[0]["Percentage"];
               var Type = arr[0]["Type"];
               var BoardType12 = arr[0]["BoardType12"];
               var RollNo12 = arr[0]["RollNo12"];
               var BoardName12 = arr[0]["BoardName12"];
               var ExamPass12 = arr[0]["ExamPass12"];
               var PassingYear12 = arr[0]["PassingYear12"];
               var GradeType12 = arr[0]["GradeType12"];
               var TotalMark12 = arr[0]["TotalMark12"];
               var MarkObtained12 = arr[0]["MarkObtained12"];
               var Percentage12 = arr[0]["Percentage12"];
               var Type12 = arr[0]["Type12"];

               debugger;
               
               if (name != null && name != "") {
                   $('#FirstName').val(name);
                   $("#FirstName").prop('disabled', true);
               }

               if (mobile != null && mobile != "") {
                   $('#MobileNo').val(mobile);
                   $("#MobileNo").prop('disabled', true);
               }
               if (Father != null && Father != "") {
                   $('#FatherName').val(Father);
                   $("#FatherName").prop('disabled', true);
               }
               if (Mother != null && Mother != "") {
                   $('#MotherName').val(Mother);
                   $("#MotherName").prop('disabled', true);
               }

               if (DOB != null && DOB != "") {
                   DOB = DOB.split('-');
                   DOB = DOB[2] + '/' + DOB[1] + '/' + DOB[0];
                   $('#DOB').val(DOB);
                   $("#DOB").prop('disabled', true);
               }
               $('#UID').val(AadhaarNo);
               $('#UID').prop('disabled', true);
               $('#txtAppID').val(arr[0].AppID);
               $('#txtAppID').prop('disabled', true);

               //Signature & Image 
               $('#myImg').attr('src', arr[0]["ApplicantImageStr"]);
               $('#mySign').attr('src', arr[0]["ImageSign"]);

           });
    }
    catch (error) {
        console.error(error);
    }
    return false;
}
