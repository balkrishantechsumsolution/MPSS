$(document).ready(function () {
    debugger;
    $("#liBasic").removeClass("active");
    $("#liService").removeClass("active");
    $("#liDetails").addClass("active");
    $("#liDoc").removeClass("active");
    $("#liPayment").removeClass("active");

    $("#step1").addClass("stepfinish");
    $("#step2").addClass("stepfinish");
    $("#step3").addClass("stepactive");
    $("#step4").addClass("active");
    $("#step5").addClass("active");
    $("#step6").addClass("active");
    $("#step7").addClass("active");

    $('#divParticulars').hide();
    //$('#divApplicant').hide();
    $('#divmore').hide();
    $('#divDetails').hide();
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

    var qs = getQueryStrings();
    var svcid = qs["SvcID"];

    if (svcid == "374") {
        $('#ddlSemester').prop('disabled', false);
        $('#lblYear').text('Year of Examination');
        $('#Subject').addClass('manadatory');
        GetSemester(svcid);
    } else {
        $('#Subject').removeClass('manadatory');
        $('#ddlSemester').prop('disabled', true);
        $('#Subject').prop('disabled', false);
        GetSemester('000');
    }

    if (svcid == "373") {
        $('#lblYear').text('Year of Examination');
       
        $('#branchname').removeClass('manadatory');
        $('#ddlSemester').prop('disabled', false);
        $('#ddlSubject').prop('disabled', true);
        GetSemester(svcid);
    }
    else {
        
        $('#branchname').addClass('manadatory');
    }


    if (svcid == '372') {
        $('#ddlSubject').prop('disabled', true);
        $('#semester').removeClass('manadatory');
        GetSemester(svcid);
    }
    else {
        $('#semester').addClass('manadatory');
        
    }


    GetInstituteMaster();

    GetBranchMaster();
});

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return;
    }

    var temp = "Gunwant";
    var AppID = "";
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

    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,        
        'RegistrationNo': $('#txtRegistration').val(),
        'Session': $('#ddlSession option:selected').text(), 
        'JoiningYear': "",
        'LeavingYear': $('#ddlPassing option:selected').text(),
        'Semester': $('#ddlSemester option:selected').val(),
        'ApplicantType': $('#ddlApplicantType option:selected').text(),
        'InstituteName': $('#ddlInstitute option:selected').val(),
        'BranchCode': $('#ddlBranch option:selected').val(),
        'SubjectCode': $('#ddlSubject option:selected').val(),
        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
        'ServiceID': svcid
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/DMAS/DMAS.aspx/InsertDivisionalCertificate',
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

function AddSubject(DeleteString) {
    debugger;
    if (validateSubjectValues(DeleteString) == true) {
        var strSubject = "";
        var strSaveSubject = "";
        var Appid = "";
        var strTempString = "";
        var strSubjectName = "";
        var strSemester = "";
        var strBranch = "";
        var strRemarks = "";
        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {

            strSubjectName = $('#txtSubject').val();
            strSemester = $('#txtSemester').val();
            strBranch = $('#txtBranch').val();
            strRemarks = $('#txtRemark').val();

            strTempString = document.getElementById("hdfSubject").value + "#" + SrNo + "," + strSubjectName + "," + strSemester + "," + strBranch + "," + strRemarks + "#";
        }
        else {
            strTempString = document.getElementById("hdfSubject").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSubject' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No.</th>";
        Str = Str + "<th style='text-align: center;'>Subject</th>";
        Str = Str + "<th style='text-align: center;'>Semester</th>";
        Str = Str + "<th style='text-align: center;'>Branch</th>";
        Str = Str + "<th style='text-align: center;'>Remarks Unit</th>";
        Str = Str + "<th style='text-align: center;'>Remove</th>";
        Str = Str + "</tr>";

        while (strTempString.length > 0) {

            intCount = intCount + 1;
            var StartIndex = strTempString.indexOf("#");
            strTempString = strTempString.substring(StartIndex + 1, strTempString.length);
            var EndIndex = strTempString.indexOf("#");
            var RemStr = strTempString.substring(0, EndIndex);


            StartIndex = RemStr.indexOf(",");
            SrNo = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);
            SrNo = intCount;

            StartIndex = RemStr.indexOf(",");
            strSubjectName = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strSemester = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strBranch = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            //StartIndex = RemStr.indexOf(",");
            //strRemarks = RemStr.substring(0, StartIndex);
            //RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strRemarks = RemStr;

            var DeleteString = "#" + SrNo + "," + strSubjectName + "," + strSemester + "," + strBranch + "," + strRemarks + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strSubjectName + "</td>";
            Str = Str + "<td style='' >" + strSemester + "</td>";
            Str = Str + "<td style='' >" + strBranch + "</td>";
            Str = Str + "<td style='' >" + strRemarks + "</td>";


            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strSubject = strSubject + "#" + SrNo + "," + strSubjectName + "," + strSemester + "," + strBranch + "," + strRemarks + "#";

            strSaveSubject = strSaveSubject + "#" + SrNo + "," + strSubjectName + "," + strSemester + "," + strBranch + "," + strRemarks + "#";

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSubject').innerHTML = Str;
        document.getElementById("hdfSubject").value = strSubject;
        document.getElementById("hdfSubjectSave").value = strSaveSubject;
        document.getElementById("hdfSubjectString").value = intCount;

        //document.getElementById('<%=ddlPharmacopoeialMonograph.ClientID %>').selectedIndex = 0;
        //$("#txtOtherPharmacopoeialMonograph").hide();
        //$("#lblOtherPharmacopoeialMonograph").hide();
        //$("#divOtherPhar").hide();
        //document.getElementById('<%=txtNameofIngredient.ClientID %>').value = "";
        //document.getElementById('<%=txtOtherPharmacopoeialMonograph.ClientID %>').value = "";
        //document.getElementById('<%=txtStrength.ClientID %>').value = "";
        //document.getElementById('<%=txtStrengthUnit.ClientID %>').value = "";

        //document.getElementById('<%=txtNameofIngredient.ClientID %>').focus();

        strSubjectName = $('#txtSubject').val("").focus();
        strSemester = $('#txtSemester').val("");
        strBranch = $('#txtBranch').val("");
        strRemarks = $('#txtRemark').val("");
    }
}

function DelString(DeleteString) {

    var Msg = "Do you want remove this Subject Details?";

    if (confirm(Msg)) {
        var strString = document.getElementById("hdfSubject").value;
        strString = strString.replace(DeleteString, "");
        document.getElementById("hdfSubject").value = strString;
        AddSubject(DeleteString);
    }
}

function validateSubjectValues(DeleteString) {

    if (DeleteString != '') {
        return true;
    }

    var strSubjectName = "";
    var strSemester = "";
    var strBranch = "";
    var strRemarks = "";
    var strMsg = "";
    var isError = false;

    strSubjectName = $('#txtSubject').val();
    strSemester = $('#txtSemester').val();
    strBranch = $('#txtBranch').val();
    strRemarks = $('#txtRemark').val();

    if (strSubjectName == "") {
        strMsg = strMsg + "</br> * Please Enter Name of Subject.";
        document.getElementById('txtSubject').focus();
        isError = true;
    }

    if (strSemester == "") {
        strMsg = strMsg + "</br> * Please Enter Semester.";
        document.getElementById('txtSemester').focus();
        isError = true;
    }
    if (strBranch == "") {
        strMsg = strMsg + "</br> * Please Enter Branch.";
        document.getElementById('txtBranch').focus();
        isError = true;
    }
    if (strRemarks == "") {
        strMsg = strMsg + "</br> * Please Enter Remark.";
        document.getElementById('txtRemark').focus();
        isError = true;
    }

    if (isError == true) {
        document.getElementById("divmore").innerHTML = " * Below are the Answer Sheet Details validation error(s), please rectify ! <br> " + strMsg;
        $("#divmore").show();
        document.getElementById("divmore").focus();
        return false;
    }
    else {
        document.getElementById("divmore").innerHTML = "";
        $("#divmore").hide();
    }
    return true;

}

function fnApplicantType() {
    debugger;
    if ($('#ddlApplicantType :selected').val() != 0) {
        $('#divApplicant').show();
        $('#lblApplicant').text('Name of ' + $('#ddlApplicantType :selected').text());
    }
    else { $('#divApplicant').hide(); }
}

function GetInstituteMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DTE/Migration.aspx/GetInstituteMaster',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlInstitute").empty();
            $("#ddlInstitute").append('<option value = "0">-Select Institute Name-</option>');
            $.each(Category, function () {
                $("#ddlInstitute").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Institute Name" + a.responseText);
        }
    });
}

function GetBranchMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DTE/Migration.aspx/GetBranchMaster',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);

             var html = "";
            var catCount = 0;
            $("#ddlBranch").empty();
            $("#ddlBranch").append('<option value = "0">-Select Branch Name-</option>');
            $.each(Category, function () {
                $("#ddlBranch").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Brach Name" + a.responseText);
        }
    });
}

function GetSubject() {
    debugger;
    var semestercode = $('#ddlSemester option:selected').val();
    var branchcode = $('#ddlBranch option:selected').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DTE/Migration.aspx/GetSubject',
        data: '{"prefix":"","SemesterCode":"' + semestercode + '","BranchCode":"' + branchcode + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            
            var Category = eval(response.d);
            
            var html = "";
            var catCount = 0;
            $("#ddlSubject").empty();
            $("#ddlSubject").append('<option value = "0">-Select Subject-</option>');
            $.each(Category, function () {
                $("#ddlSubject").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Brach Name" + a.responseText);
        }
    });
}

function GetSemester(svcid) {
    debugger;
    //var semestercode = $('#ddlSemester option:selected').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DTE/Migration.aspx/GetSemester',
        data: '{"prefix":"","SvcID":"' + svcid + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            
            var Category = eval(response.d);
            
            var html = "";
            var catCount = 0;
            $("#ddlSemester").empty();
            $("#ddlSemester").append('<option value = "0">-Select Semester-</option>');
            $.each(Category, function () {
                $("#ddlSemester").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Semester Master" + a.responseText);
        }
    });
}

function GetSubject1() {
   
    var semestercode = $('#ddlSemester option:selected').val();
    var branchcode = $('#ddlBranch option:selected').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DMAS/DMAS.aspx/GetSubject',
        data: '{"prefix":"","SemesterCode":"' + semestercode + '","BranchCode":"' + branchcode + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlSubject").empty();
            $("#ddlSubject").append('<option value = "0">-Select Subject-</option>');
            $.each(Category, function () {
                $("#ddlSubject").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
        },
        error: function (a, b, c) {
            alert("Unable to fetch Brach Name" + a.responseText);
        }
    });
}

function ValidateForm() {

    debugger;
    var text = "";
    var opt = "";

    var qs = getQueryStrings();
    var svcid = qs["SvcID"];


    if (svcid == "372") {

        var Registration = $('#txtRegistration').val();
        var Session = $("#ddlSession").val();
        var Passingyr = $("#ddlPassing").val();
        var Branchname = $("#ddlBranch").val();


        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }


        if (Session == null || Session == " " || Session == "0") {
            text += "<br /> -Please select Session.";
            $('#ddlSession').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSession').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Session != null) {
            $('#ddlSession').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSession').css({ "background-color": "#ffffff" });
        }

        if (Passingyr == null || Passingyr == " " || Passingyr == "0") {
            text += "<br /> -Please select Passing Year.";
            $('#ddlPassing').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlPassing').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Passingyr != null) {
            $('#ddlPassing').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlPassing').css({ "background-color": "#ffffff" });
        }


        if (Branchname == null || Branchname == " " || Branchname == "0") {
            text += "<br /> -Please select Branch Name.";
            $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlBranch').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Branchname != null) {
            $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlBranch').css({ "background-color": "#ffffff" });
        }
    }


    if (svcid == "373") {
        var Registration = $('#txtRegistration').val();
        var Session = $("#ddlSession").val();
        var YearOfexamintion = $("#ddlPassing").val();
        var semester = $("#ddlSemester").val();


        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }


        if (Session == null || Session == " " || Session == "0") {
            text += "<br /> -Please select Session.";
            $('#ddlSession').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSession').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Session != null) {
            $('#ddlSession').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSession').css({ "background-color": "#ffffff" });
        }

        if (YearOfexamintion == null || YearOfexamintion == " " || YearOfexamintion == "0") {
            text += "<br /> -Please select Year Of Examintion.";
            $('#ddlPassing').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlPassing').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (YearOfexamintion != null) {
            $('#ddlPassing').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlPassing').css({ "background-color": "#ffffff" });
        }


        if (semester == null || semester == " " || semester == "0") {
            text += "<br /> -Please select semester.";
            $('#ddlSemester').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSemester').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (semester != null) {
            $('#ddlSemester').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSemester').css({ "background-color": "#ffffff" });
        }
    }


    if (svcid == '374') {
        var Registration = $('#txtRegistration').val();
        var Session = $("#ddlSession").val();
        var YearOfExamination = $("#ddlPassing").val();
        var Branchname = $("#ddlBranch").val();
        var semester = $("#ddlSemester").val();
        var subject = $("#ddlSubject").val();

        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }


        if (Session == null || Session == " " || Session == "0") {
            text += "<br /> -Please select Session.";
            $('#ddlSession').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSession').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Session != null) {
            $('#ddlSession').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSession').css({ "background-color": "#ffffff" });
        }

        if (YearOfExamination == null || YearOfExamination == " " || YearOfExamination == "0") {
            text += "<br /> -Please select Year Of Examination.";
            $('#ddlPassing').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlPassing').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (YearOfExamination != null) {
            $('#ddlPassing').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlPassing').css({ "background-color": "#ffffff" });
        }


        if (Branchname == null || Branchname == " " || Branchname == "0") {
            text += "<br /> -Please select Branch Name.";
            $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlBranch').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Branchname != null) {
            $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlBranch').css({ "background-color": "#ffffff" });
        }

        if (semester == null || semester == " " || semester == "0") {
            text += "<br /> -Please select semester.";
            $('#ddlSemester').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSemester').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (semester != null) {
            $('#ddlSemester').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSemester').css({ "background-color": "#ffffff" });
        }


        if (subject == null || subject == " " || subject == "0") {
            text += "<br /> -Please select subject.";
            $('#ddlSubject').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSubject').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (subject != null) {
            $('#ddlSubject').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSubject').css({ "background-color": "#ffffff" });
        }




    }


    if (svcid == '371') {

        var Registration = $('#txtRegistration').val();
        var YearOfExamination = $("#ddlPassing").val();
        var Nameofinstitude = $("#ddlInstitute").val();
        var Branchname = $("#ddlBranch").val();
        var semester = $("#ddlSemester").val();
        var subject = $("#ddlSubject").val();

        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration.";
            $('#txtRegistration').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Registration != null) {
            $('#txtRegistration').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }


        if (Nameofinstitude == null || Nameofinstitude == " " || Nameofinstitude == "0") {
            text += "<br /> -Please select Nameofinstitude.";
            $('#ddlInstitute').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlInstitute').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Nameofinstitude != null) {
            $('#ddlInstitute').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlInstitute').css({ "background-color": "#ffffff" });
        }

        if (YearOfExamination == null || YearOfExamination == " " || YearOfExamination == "0") {
            text += "<br /> -Please select Year Of Examination.";
            $('#ddlPassing').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlPassing').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (YearOfExamination != null) {
            $('#ddlPassing').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlPassing').css({ "background-color": "#ffffff" });
        }


        if (Branchname == null || Branchname == " " || Branchname == "0") {
            text += "<br /> -Please select Branch Name.";
            $('#ddlBranch').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlBranch').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Branchname != null) {
            $('#ddlBranch').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlBranch').css({ "background-color": "#ffffff" });
        }

        if (semester == null || semester == " " || semester == "0") {
            text += "<br /> -Please select semester.";
            $('#ddlSemester').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSemester').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (semester != null) {
            $('#ddlSemester').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSemester').css({ "background-color": "#ffffff" });
        }


        if (subject == null || subject == " " || subject == "0") {
            text += "<br /> -Please select subject.";
            $('#ddlSubject').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlSubject').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (subject != null) {
            $('#ddlSubject').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlSubject').css({ "background-color": "#ffffff" });
        }




    }




   

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}