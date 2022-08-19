$(document).ready(function () {
    //$("#liBasic").removeClass("active");
    //$("#liService").removeClass("active");
    //$("#liDetails").addClass("active");
    //$("#liDoc").removeClass("active");
    //$("#liPayment").removeClass("active");

    //$("#step1").addClass("stepfinish");
    //$("#step2").addClass("stepfinish");
    //$("#step3").addClass("stepactive");
    //$("#step4").addClass("active");
    //$("#step5").addClass("active");
    //$("#step6").addClass("active");
    //$("#step7").addClass("active");

    //$('#divParticulars').hide();
    //$('#divSuspect').hide();
    //$('#divmore').hide();

    var ServiceControl = "ctl00$ContentPlaceHolder1$ddlServices";
    var DepartmentControl = "ctl00$ContentPlaceHolder1$ddlDepartment";
    GetServices("", ServiceControl);
    GetDepartment("", DepartmentControl);
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
    $("[name='" + ServiceControl + "']").bind("change", function (e) { return GetDepartmentComplaint("", DepartmentControl, ServiceControl); });
    $("[name='" + DepartmentControl + "']").bind("change", function (e) { return GetDeptServices("", DepartmentControl, ServiceControl); });


});

function GetDepartmentComplaint(category, DepartmentControl, ServiceControl) {
    debugger;
    //var SelIndex = $("[name='" + StateControl + "']").val();
    //var SelIndex = ServiceControl.split('_');
    var SelIndex = $("[name='" + ServiceControl + "']").val().split('_');

    if (SelIndex[2] != null) {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/webapp/Kiosk/forms/OfficeOfficer.aspx/GetDepartmentCode',
            data: '{"prefix":"' + category + '","DepartmentCode":"' + SelIndex[2] + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var Category = eval(response.d);
                var html = "";
                var catCount = 0;
                //$("[name='" + DepartmentControl + "']").empty();
                //$("[name='" + DepartmentControl + "']").append('<option value = "0">-Select-</option>');
                $.each(Category, function () {
                    //$("[name='" + DepartmentControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                    //catCount++;
                    $("[name='" + DepartmentControl + "']").val(this.Id);
                });


            },
            error: function (a, b, c) {
                alert("2." + a.responseText);
            }
        });
    }

}

function SubmitData() {
    debugger;
    //if (!ValidateForm()) {
    //    return;
    //}

    var temp = "Gunwant";
    var AppID = "";
    var result = false;

    var qs = getQueryStrings();
    var uid = qs["UID"];
    var svcid = qs["SvcID"];
    //var dpt = qs["DPT"];
    //var dist = qs["DIST"];
    //var blk = qs["BLK"];
    //var pan = qs["PAN"];
    //var ofc = qs["OFC"];
    //var ofr = qs["OFR"];

    //var categorytext = "";
    //var categoryid = "";
    //categoryid = $('#ddlCategory :selected').val();
    //if (categoryid != 0) {
    //    categorytext = $('#ddlCategory :selected').text();
    //}
    //else { alert('Please select Complaint Category'); return; }

    var DOIArr = $('#txtDate').val().split("/");
    var DOAConverted = DOIArr[2] + "-" + DOIArr[1] + "-" + DOIArr[0];

    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,
        'ServicesID': $('#ddlServices').val(),
        'Services': $('#ddlServices option:selected').text(),
        'DepartmentID': $('#ddlDepartment').val(),
        'ComplaintDept': $('#ddlDepartment option:selected').text(),
        'ReferenceID': $('#RefID').val(),
        'ApplicationDate': DOAConverted,
        'ComplaintID': $('#ddlCategory').val(),
        'ComplaintType': $('#ddlCategory option:selected').text(),
        'OfficerName': $('#txtofficer').val(),
        'ComplaintDescription': $('#txtDescription').val(),
        'ConcernedOfficer': $('#txtofficer').val(),
        'ConcernedOffice': $('#txtoffice').val(),

        'department': 0,
        'district': 0,
        'block': 0,
        'panchayat': 0,
        'office': 0,
        'officer': 0,
        //'SuspectDXML': document.getElementById("hdfSuspectSave").value
        //$('#ddlJoining option:selected').text(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/Complaint/Complaint.aspx/InsertComplaintRegistration',
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
                alert("Your complaint is registered sucessfully of Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
            }

        });// end of Then function of main Data Insert Function

    return false;
}

function ValidateForm() {

    //var text = "";
    //var opt = "";

    ///// Basic Information 
    //var Services = $("#ddlServices option:selected").text();
    //var Department = $("#ddlDepartment option:selected").text();
    //var AppDate = $("#txtDate");
    //var RefID = $("#RefID");
    //var Office = $("#ddlOffice option:selected").text();
    //var officer = $("#txtofficer");
    //var Description = $("#txtDescription");
    
    //if (Services.val() == '') {
    //    text += "<br /> -Please enter First Name. ";
    //    opt = 1;
    //}

    //if (Department.val() == '') {
    //    text += "<br /> -Please enter Last Name. ";
    //    opt = 1;
    //}

    //if (AppDate.val() == '') {
    //    text += "<br /> -Please enter Mobile No. ";
    //    opt = 1;
    //}

    //if (RefID.val() != '') {
    //    var mobmatch1 = /^[789]\d{9}$/;
    //    if (!mobmatch1.test(MobileNo.val())) {
    //        text += "<br /> -Please enter valid mobile Number.";
    //        opt = 1;
    //    }
    //}

    //if (Office.val() == '') {
    //    text += "<br /> -Please enter EMail ID. ";
    //    opt = 1;
    //}

    //if (officer.val() == '') {
    //    text += "<br /> -Please enter Date of Birth. ";
    //    opt = 1;
    //}

    //if ((Gender == '' || Gender == 'Select Gender')) {
    //    text += "<br /> -Please Select Gender. ";
    //    opt = 1;
    //}

    //if (Description != null && Description.val() == '') {
    //    text += "<br /> -Please enter Care of Address. ";
    //    opt = 1;
    //}

    //if (State != null && (State == '' || State == '-Select-')) {
    //    text += "<br /> -Please select State.";
    //    opt = 1;
    //}

    //if (District != null && (District == '' || District == '-Select-')) {
    //    text += "<br /> -Please select District.";
    //    opt = 1;
    //}

    //if (Taluka != null && (Taluka == '' || Taluka == '-Select-')) {
    //    text += "<br /> -Please select Taluka.";
    //    opt = 1;
    //}

    //if (Village != null && (Village == '' || Village == '-Select-')) {
    //    text += "<br /> -Please select Village.";
    //    opt = 1;
    //}
    //if (Description != null && Pincode.val() == '') {
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

    //if (opt == "1") {
    //    alertPopup("Please fill following information.", text);
    //    return false;
    //}

    return true;

}