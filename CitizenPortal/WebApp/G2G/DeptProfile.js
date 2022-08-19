
$(document).ready(function () {
    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });
    EL("File1").addEventListener("change", readFile, false);
    EL("File2").addEventListener("change", readFile2, false);
    EditProfile();
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

function EditProfile()
{
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/G2G/DeptProfile.aspx/EditProfile',
        data: '{"prefix": ""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            debugger;
            var data = jQuery.parseJSON(response.d);
            if (data != "")
            {
                $('#Name').val(data["Name"]);
                $('#Mobile').val(data["Mobile"]);
                $('#Designation').val(data["Designation"]);
                $('#JoiningDate').val(data["JoiningDate"]);
                $('#MailID').val(data["MailID"]);
                $('#ddlGender').val(data["Gender"]);
                $('#AadhaarNo').val(data["AadhaarNo"]);

                if (data["Sign"] != null && data["Sign"] != "") {
                    if (data["Sign"].indexOf('data:image/jpeg;base64,') !== -1 || data["Sign"].indexOf('data:image/png;base64,') !== -1) {
                        document.getElementById('mySign').setAttribute('src', data["Sign"]);
                    } else {
                        document.getElementById('mySign').setAttribute('src', 'data:image/jpeg;base64,' + data["Sign"]);
                    }
                    EL("mySign").src = data["Sign"];
                    EL("HFb64Sign").value = data["Sign"];
                }

                if (data["Photo"] != null && data["Photo"] != "") {
                    if (data["Photo"].indexOf('data:image/jpeg;base64,') !== -1 || data["Photo"].indexOf('data:image/png;base64,') !== -1) {
                        document.getElementById('myImg').setAttribute('src', data["Photo"]);
                    } else {
                        document.getElementById('myImg').setAttribute('src', 'data:image/jpeg;base64,' + data["photo"]);
                    }
                    EL("myImg").src = data["Photo"];
                    EL("HFb64").value = data["Photo"];
                }
            }
        },
        error: function (a, b, c) {
            result = false;
            alert("5." + a.responseText);
        }
    });
}


function SubmitData() {

    if (!ValidateForm()) {
        return;
    }

    var temp = "Gunwant";
    var AppID = "";
    var result = false;
    debugger;
    var qs = getQueryStrings();
    var LoginID = $('#HFLID').val();
    var Name = $('#Name').val();
    var Designation = $('#Designation').val();
    var Gender = $('#ddlGender').val();
    var Mobile = $('#Mobile').val();
    var PhoneNo = $('#PhoneNo').val();
    var MailID = $('#MailID').val();
    var JoiningDate = $('#JoiningDate').val();

    JoiningDate = $('#JoiningDate').val().split("/");
    JoiningDate = JoiningDate[2] + "-" + JoiningDate[1] + "-" + JoiningDate[0];

    var EmpCode = $('#EmpCode').val();
    var AadhaarNo = $('#AadhaarNo').val();
    var Photo = "";
    var Sign = "";

    //Designation = "<Script>alert(12)</Script>";

    var datavar = {
        'LoginID': LoginID,
        'Name': Name,
        'Designation': Designation,
        'Gender': Gender,
        'Mobile': Mobile,
        'PhoneNo': PhoneNo,
        'MailID': MailID,
        'JoiningDate': JoiningDate,
        'EmpCode': EmpCode,
        'AadhaarNo': AadhaarNo,
        'Photo': $('#HFb64').val(),
        'Sign': $('#HFb64Sign').val(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": JSON.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/G2G/DeptProfile.aspx/InsertDeptProfile',
            data: JSON.stringify(obj, null, 4),
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
        var intStatus = obj.intStatus;
        var StatusMessage = obj.Status;

        AppID = obj.AppID;
        result = true;

        if (intStatus == 2 || intStatus == 3 || intStatus == 4) {
            result = false;

            alert(StatusMessage);
        }

        if (result /*&& jqXHRData_IMG_result*/) {
            alert("Profile updated successfully.");
            window.location.href = '/WebApp/G2G/SU/SUDashboard.aspx';
        }

    });// end of Then function of main Data Insert Function

    return false;
}


function EL(id) { return document.getElementById(id); } // Get el by ID helper function


function readFile() {
    if (this.files && this.files[0]) {
        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 10 || sizekb > 50) {
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


function ValidateForm() {

    var text = "";
    var opt = "";

    var LoginID = "";
    var Name = $('#Name').val();
    var Designation = $('#Designation').val();
    var Gender = $('#ddlGender').val();
    var Mobile = $('#Mobile').val();
    var PhoneNo = $('#PhoneNo').val();
    var MailID = $('#MailID').val();
    var JoiningDate = $('#JoiningDate').val();
    var EmpCode = $('#EmpCode').val();
    var AadhaarNo = $('#AadhaarNo').val();


    //if (EL("myImg").src.indexOf("photo.png") != -1) {
    //    text += "<BR>" + " \u002A" + " Please Upload Photograph.";
    //    $('#myImg').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#myImg').css({ "background-color": "#fff2ee" });
    //    $('#myImg').css({ "height": "250px" });
    //    opt = 1;
    //} else {
    //    $('#myImg').attr('style', 'border:0 !important;');
    //    $('#myImg').css({ "background-color": "" });
    //    $('#myImg').css({ "height": "250px" });
    //}


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


    if (Name == null || Name == "") {
        text += "<br />" + " \u002A" + " Please Enter Your Name.";
        $('#Name').attr('style', 'border:1px solid #d03100 !important;');
        $('#Name').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Name != null) {
        $('#Name').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#Name').css({ "background-color": "#ffffff" });
    }


    if (Designation == null || Designation == "") {
        text += "<br />" + " \u002A" + " Please Enter Your Designation.";
        $('#Designation').attr('style', 'border:1px solid #d03100 !important;');
        $('#Designation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Designation != null) {
        $('#Designation').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#Designation').css({ "background-color": "#ffffff" });
    }


    if (Gender == null || Gender == " " || Gender == "0") {
        text += "<BR>" + " \u002A" + " Please Select Gender.";
        $('#ddlGender').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlGender').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Gender != null) {
        $('#ddlGender').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlGender').css({ "background-color": "#ffffff" });
    }


    if (Mobile == null || Mobile == "") {
        text += "<br />" + " \u002A" + " Please Enter Mobile No.";
        $('#Mobile').attr('style', 'border:1px solid #d03100 !important;');
        $('#Mobile').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (Mobile != null) {
        $('#Mobile').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#Mobile').css({ "background-color": "#ffffff" });

        if (Mobile != '' || Mobile != null) {
            var mobmatch1 = /^[789]\d{9}$/;
            if (!mobmatch1.test(Mobile)) {
                text += "<br />" + " \u002A" + " Please Enter Valid Mobile Number.";
                $("#Mobile").attr('style', 'border:1px solid #d03100 !important;');
                $("#Mobile").css({ "background-color": "#fff2ee" });
                opt = 1;
            }
        }
    }

    if (MailID == null || MailID == "") {
        text += "<br />" + " \u002A" + " Please Enter Your Email ID.";
        $('#MailID').attr('style', 'border:1px solid #d03100 !important;');
        $('#MailID').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (MailID != null) {
        $('#MailID').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#MailID').css({ "background-color": "#ffffff" });

        if (MailID != '') {
            var emailmatch = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            if (!emailmatch.test(MailID)) {
                $("#MailID").val('');
                $('#MailID').attr('style', 'border:1px solid #d03100 !important;');
                $('#MailID').css({ "background-color": "#fff2ee" });
                text += "<br />" + " \u002A" + " Please Enter Email ID In Proper Format.";
                opt = 1;
            }
        }
    }


    //if ($("#AadhaarNo").val() == '' || $("#AadhaarNo").val() == null) {
    //    text += "<br />" + " \u002A" + " Please Enter Aadhaar Number.";
    //    $("#AadhaarNo").attr('style', 'border:1px solid #d03100 !important;');
    //    $("#AadhaarNo").css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //}
    //else {
    //    $("#AadhaarNo").attr('style', 'border:1px solid #cdcdcd !important;');
    //    $("#AadhaarNo").css({ "background-color": "#ffffff" });
    //}

    if ($("#JoiningDate").val() == '' || $("#JoiningDate").val() == null) {
        text += "<br />" + " \u002A" + " Please Enter Date of Incharge.";
        $("#JoiningDate").attr('style', 'border:1px solid #d03100 !important;');
        $("#JoiningDate").css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $("#JoiningDate").attr('style', 'border:1px solid #cdcdcd !important;');
        $("#JoiningDate").css({ "background-color": "#ffffff" });
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}
