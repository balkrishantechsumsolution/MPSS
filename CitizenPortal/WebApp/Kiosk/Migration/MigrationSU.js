function GetCollegeMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/MigrationSU/MigrationSU.aspx/GetCollegeMaster',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlCollege").empty();
            $("#ddlCollege").append('<option value = "0">-Select College Name-</option>');
            $.each(Category, function () {
                $("#ddlCollege").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch College Name" + a.responseText);
        }
    });
}

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return;
    }
    
    var temp = "Gunwant";
    var AppID = "";
    var result = false;
    var DOBArr = $('#txtDate').val().split("/");
    var DOLConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = '1446';
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    var DOBArr1 = $('#txtDOB').val().split("/");
    var DOBConverted1 = DOBArr1[2] + "-" + DOBArr1[1] + "-" + DOBArr1[0];

    var UserImage = "";
    var UserImageSign = "";


    if (EL("HFb64").value != null && EL("HFb64").value != "") {
        UserImage = EL("HFb64").value;
    }

    if (EL("HFb64Sign").value != null && EL("HFb64Sign").value != "") {
        UserImageSign = EL("HFb64Sign").value;
    }

    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,

        'StudentType': $('#ddlStudent option:selected').text(),
        'RegistrationNo': $('#txtRegistration').val(),
        'AdmissionYear': $('#ddlAdmission option:selected').text(),
        'RollNo': $('#txtRoll').val(),
        'Program': $('#ddlPrograme option:selected').val(),
        'Class': $('#ddlClass option:selected').text(),
        'ExaminationDetails': $('#ddlReason option:Selected').text(),
        'LastExamDate': DOLConverted,
        'CollegeCode': $('#ddlCollege option:selected').val(),
        'CollegeName': $('#ddlCollege option:selected').text(),
        'Reason': $('#txReason').val(),
        'JoiningCollege': $('#txtCollege').val(),
        'JoiningUniversity': $('#txtUniversity').val(),

        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
        'RegCardStatus': $('#ddlRegCardStatus option:selected').val(),
        'Image': UserImage,
        'ImageSign': UserImageSign,
        'DOB': DOBConverted1,
        'Gender': $('#ddlGender option:selected').text(),
        'Mobile': $('#txtContactNo').val(),
        'EmailID': $('#EmailID').val(),
        'FatherName': $('#lblFathersName').val(),
        'Candidate': $('#txtCandidate').val(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/MigrationSU/MigrationSU.aspx/InsertMigrationSU',
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
                alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
            }

        });// end of Then function of main Data Insert Function

    return false;
}

$(document).ready(function () {
    $('divApplication').hide();
    $('#txtDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {

            var t_DOB = $("#txtDate").val();

            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear();

        }
    });

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

    //$("#btnSearch").bind("click", function (e) { return EditStudentDetail(); });



    GetCollegeMaster();
    GetCBCSCourseList();

    
    
    $('#disclaimercheck').click(function () {
        $(this).is(':checked') ? $('#btnSubmit').prop('disabled', false) : $('#btnSubmit').prop('disabled', 'disabled');
       
    });
  

    $('#txtDOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '0',
        yearRange: "-150:+0",
        onSelect: function (date) {

            var t_DOB = $("#txtDOB").val();


            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear();
            //var Age = calage1(t_DOB);
            //if (Age != null && Age < 14) {
            //    alertPopup("Age Validate", "Age allow minimum 14 year's");
            //    $("#lblDOB").val('');
            //}

        }
    });

});
//function EditStudentDetail() {
//    debugger;
//    var RollNo = $('#txtRoll').val();
//    var DOB = $('#txtDOB').val();
//    var RegNo = $('#txtRegistration').val();
  

//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: '/WebApp/Kiosk/MigrationSU/MigrationSU.aspx/EditStudentDetail',
//        data: '{"prefix":"","RollNo":"' + RollNo + '","DOB":"' + DOB + '","RegNo":"' + RegNo + '"}',
//        processData: false,
//        dataType: "json",
//        success: function (response) {            
//            var data = jQuery.parseJSON(response.d);
//            if (data != "") {
//                debugger;
//                //alert('val:-' + data["DtState"]);

//                    if (data["Name"] != '') {
//                        $('#txtRoll').val(data["RollNo"]);
//                        $('#txtRegistration').val(data["RegNo"]);
//                        //$('#txtDOB').val(data["DOB"]);
//                        $('#ddlGender').val(data["Gender"]);
//                        $('#txtCandidate').val(data["Name"]);

//                        var dob = data["DOB"];
//                        $('#txtDOB').val(dob);

//                        if (data["ImageSign"] != null && data["ImageSign"] != "") {
//                            if (data["ImageSign"].indexOf('data:image/jpeg;base64,') !== -1 || data["ImageSign"].indexOf('data:image/png;base64,') !== -1) {
//                                document.getElementById('mySign').setAttribute('src', data["ImageSign"]);
//                            } else {
//                                document.getElementById('mySign').setAttribute('src', 'data:image/jpeg;base64,' + data["ImageSign"]);
//                            }
//                            EL("mySign").src = data["ImageSign"];
//                            EL("HFb64Sign").value = data["ImageSign"];
//                        }
//                        else {
//                            document.getElementById('mySign').setAttribute('src', "/WebApp/Kiosk/OISF/img/signature.png");
//                        }

//                        if (data["ApplicantImageStr"] != null && data["ApplicantImageStr"] != "") {
//                            if (data["ApplicantImageStr"].indexOf('data:image/jpeg;base64,') !== -1 || data["ApplicantImageStr"].indexOf('data:image/png;base64,') !== -1) {
//                                document.getElementById('myImg').setAttribute('src', data["ApplicantImageStr"]);
//                            } else {
//                                document.getElementById('myImg').setAttribute('src', 'data:image/jpeg;base64,' + data["ApplicantImageStr"]);
//                            }
//                            EL("myImg").src = data["ApplicantImageStr"];
//                            EL("HFb64").value = data["ApplicantImageStr"];
//                        }
//                        else {
//                            document.getElementById('myImg').setAttribute('src', "/webApp/kiosk/Images/photo.png");
//                        }
//                    }
                    
                
                
//            }
//        },
//        error: function (a, b, c) {
//            alert("4." + a.responseText);
//        }
//    });
//}
function EL(id) { return document.getElementById(id); } // Get el by ID helper function



function ValidateForm() {

    debugger;
    var text = "";
    var opt = "";

    var StudentType = $('#ddlStudent').val();
    var Registration = $('#txtRegistration').val();
    var RollNo = $('#txtRoll').val();
    var Program = $("#ddlPrograme").val();
    var ddlAdmission = $("#ddlAdmission").val();
    var Class = $("#ddlClass").val();
    var ddlpassed = $("#ddlReason").val();
    var College = $("#ddlCollege").val();
    var ddlRegCardStatus = $("#ddlRegCardStatus").val();

    var FatherName = $("#lblFathersName");
    var Gender = $("#ddlGender option:selected").text();
    var txtContactNo = $('#txtContactNo').val();
    var MailID = $('#EmailID').val();
    //var dateofleaving = $("#txtDate").val();
    //txtCollege
    //txtUniversity

    var DOB = $("#txtDOB");

    var Candidate = $('#txtCandidate');


    if (EL("mySign").src.indexOf("signature.png") != -1) {
        text += "<BR>" + " \u002A" + " Please Upload Signature.";
        $('#mySign').attr('style', 'border:1px solid #d03100 !important;');
        $('#mySign').css({ "background-color": "#fff2ee" });
        $('#mySign').css({ "height": "130px" });
        opt = 1;
    } else {
        $('#mySign').attr('style', '');
        $('#mySign').css({ "background-color": "" });
        $('#mySign').css({ "height": "130px" });
    }
    if (EL("myImg").src.indexOf("photo.png") != -1) {
        text += "<BR>" + " \u002A" + " Please Upload Photo.";
        $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
        $('#myImg').css({ "background-color": "#fff2ee" });
        $('#myImg').css({ "height": "130px" });
        opt = 1;
    } else {
        $('#myImg').attr('style', '');
        $('#myImg').css({ "background-color": "" });
        $('#myImg').css({ "height": "130px" });
    }

    if (DOB.val() == '' || DOB.val() == null) {
        text += "<br /> -Please Enter Date Of Birth. ";
        $("#txtDOB").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtDOB").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#txtDOB").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtDOB").css({ "background-color": "#ffffff" });
    }

    if (StudentType == null || StudentType == " " || StudentType == "0") {
        text += "<br /> -Please select Student Type.";
        $('#ddlStudent').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlStudent').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (StudentType != null) {
        $('#ddlStudent').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlStudent').css({ "background-color": "#ffffff" });
    }

    if (Registration == null || Registration == "") {
        text += "<br /> -Please Enter Registration.";
        $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRegistration').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Registration != null) {
        $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRegistration').css({ "background-color": "#ffffff" });
    }

    if (RollNo == null || RollNo == "") {
        text += "<br /> -Please Enter Roll Number.";
        $('#txtRoll').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtRoll').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (RollNo != null) {
        $('#txtRoll').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtRoll').css({ "background-color": "#ffffff" });
    }

    if (Program == null || Program == " " || Program == "0") {
        text += "<br /> -Please select Program.";
        $('#ddlPrograme').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlPrograme').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Program != null) {
        $('#ddlPrograme').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlPrograme').css({ "background-color": "#ffffff" });
    }

    //if (Class == null || Class == " " || Class == "0") {
    //    text += "<br /> -Please select Class.";
    //    $('#ddlClass').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#ddlClass').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else if (Class != null) {
    //    $('#ddlClass').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#ddlClass').css({ "background-color": "#ffffff" });
    //}
    if (ddlAdmission == null || ddlAdmission == " " || ddlAdmission == "0") {
        text += "<br /> -Please select Year of Admission";
        $('#ddlAdmission').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlAdmission').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (ddlAdmission != null) {
        $('#ddlAdmission').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlAdmission').css({ "background-color": "#ffffff" });
    }
    /*
    if (dateofleaving == null || dateofleaving == "") {
        text += "<br /> -Please Enter Date of leaving.";
        $('#txtDate').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtDate').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (dateofleaving != null) {
        $('#txtDate').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtDate').css({ "background-color": "#ffffff" });
    }
    */
    if (ddlpassed == null || ddlpassed == " " || ddlpassed == "0") {
        text += "<br /> -Please select Examination passed /Appeared";
        $('#ddlReason').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlReason').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (ddlpassed != null) {
        $('#ddlReason').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlReason').css({ "background-color": "#ffffff" });
    }

    if (College == null || College == " " || College == "0") {
        text += "<br /> -Please select College Name";
        $('#ddlCollege').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlCollege').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (College != null) {
        $('#ddlCollege').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlCollege').css({ "background-color": "#ffffff" });
    }


    if (ddlRegCardStatus == null || ddlRegCardStatus == " " || ddlRegCardStatus == "0") {
        text += "<br /> -Please select Original Registration Card Status";
        $('#ddlRegCardStatus').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlRegCardStatus').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (ddlRegCardStatus != null) {
        $('#ddlRegCardStatus').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlRegCardStatus').css({ "background-color": "#ffffff" });
    }
    if (Candidate.val() == '' || Candidate.val() == null) {
        text += "<br /> -Please Enter Candidate Name ";
        $("#txtCandidate").attr('style', 'border:1px solid #d03100 !important;');
        $("#txtCandidate").css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $("#txtCandidate").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#txtCandidate").css({ "background-color": "#ffffff" });
    }

    //if (FatherName.val() == '' || FatherName.val() == null) {
    //    text += "<br /> -Please Enter Father Name ";
    //    $("#lblFathersName").attr('style', 'border:1px solid #d03100 !important;');
    //    $("#lblFathersName").css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $("#lblFathersName").attr('style', 'border:1px solid #cdcdcd !important;');
    //    $("#lblFathersName").css({ "background-color": "#ffffff" });
    //}
    //if (Gender == '-Select-' || Gender == "0") {
    //    text += "<br /> -Please Select Gender. ";
    //    $("#ddlGender").attr('style', 'border:1px solid #d03100 !important;');
    //    $("#ddlGender").css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    $("#ddlGender").attr('style', 'border:1px solid #cdcdcd !important;');
    //    $("#ddlGender").css({ "background-color": "#ffffff" });
    //}

    if (MailID == null || MailID == "") {
        text += "<br />" + " \u002A" + " Please Enter Email Id.";
        $('#EmailID').attr('style', 'border:1px solid #d03100 !important;');
        $('#EmailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else if (MailID != null) {
        $('#EmailID').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#EmailID').css({ "background-color": "#ffffff" });

        if (MailID != '') {
            var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            if (!emailmatch.test(MailID)) {
                $("#EmailID").val('');
                $('#EmailID').attr('style', 'border:1px solid #d03100 !important;');
                $('#EmailID').css({ "background-color": "#fff2ee" });
                text += "<br />" + " \u002A" + " Please Enter Email ID In Proper Format.";
                opt = 1;
            }
        }
    }

    if (txtContactNo == null || txtContactNo == "") {
        text += "<br />" + " \u002A" + " Please Enter Mobile No.";
        $('#txtContactNo').attr('style', 'border:1px solid #d03100 !important;');
        $('#txtContactNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (txtContactNo != null) {
        $('#txtContactNo').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#txtContactNo').css({ "background-color": "#ffffff" });

        //if (txtContactNo != '' || txtContactNo != null) {
        //    var mobmatch1 = /^[789]\d{9}$/;
        //    if (!mobmatch1.test(txtContactNo)) {
        //        text += "<br />" + " \u002A" + " Please Enter Valid Mobile Number.";
        //        $("#txtContactNo").attr('style', 'border:1px solid #d03100 !important;');
        //        $("#txtContactNo").css({ "background-color": "#fff2ee" });
        //        opt = 1;
        //    }
        //}
    }



    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function GetCBCSCourseList() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/RegistrationReceiptSU/Registration.aspx/GetSUBranchMaster',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlPrograme").empty();
            $("#ddlPrograme").append('<option value = "0">-Select Branch Name-</option>');

            $.each(Category, function () {
                $("#ddlPrograme").append('<option value = "' + this.Id + '">' + this.Name + '</option>');

                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Branch Name" + a.responseText);
        }
    });
}

function readFile(files) {

    if (files) {
        for (var i = 0; i < files.length; i++) {

            var imgsizee = files[i].size;
            var sizekb = imgsizee / 1024;
            sizekb = sizekb.toFixed(0);

            $('#HFSizeOfPhoto').val(sizekb);
            if (sizekb < 5 || sizekb > 100) {

                alert('The size of the photograph should fall between 5KB to 100KB. Your Photo Size is ' + sizekb + 'kb.');
                return false;
            }

            var ftype = files[i]; //document.getElementById('File1');
            var fileupload = ftype.name;
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

                var image = new Image();
                //Set the Base64 string return from FileReader as source.
                image.src = e.target.result;

                //image.onload = function () {

                //    var height = this.height;
                //    var width = this.width;
                //    if (height > 201 || width > 151) {
                //        alert("Height must be less than 201 px and Width must not exceed 150px.");
                //        return ;
                //    }
                //    else {

                //    }
                //}
                EL("myImg").src = e.target.result;
                EL("HFb64").value = e.target.result;
            };
            FR.readAsDataURL(files[0]);


        }
    }
}
function readFileSign(files) {


    if (files) {
        for (var i = 0; i < files.length; i++) {

            var imgsizee = files[i].size;
            var sizekb = imgsizee / 1024;
            sizekb = sizekb.toFixed(0);
            $('#HFSizeOfPhotoSign').val(sizekb);
            if (sizekb < 5 || sizekb > 100) {

                alert('The size of the photograph should fall between 5KB to 100KB. Your Photo Size is ' + sizekb + 'kb.');
                return false;
            }

            var ftype = files[i]; //document.getElementById('File1');
            var fileupload = ftype.name;
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
                var image = new Image();
                //Set the Base64 string return from FileReader as source.
                image.src = e.target.result;
                //image.onload = function () {

                //    var height = this.height;
                //    var width = this.width;
                //    if (height > 101 || width > 151) {
                //        alert("Height must be less than 100 px and Width must not exceed 150px.");
                //        return ;
                //    }
                //    else {

                //    }
                //}
                EL("mySign").src = e.target.result;
                EL("HFb64Sign").value = e.target.result;
            };
            FR.readAsDataURL(files[0]);


        }
    }
}