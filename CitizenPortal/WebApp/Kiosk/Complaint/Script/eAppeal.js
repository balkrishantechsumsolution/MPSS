$(document).ready(function () {
    $('#divGridAppeal').hide();
    var ServiceControl = "ctl00$ContentPlaceHolder1$ddlServices";
    var DepartmentControl = "ctl00$ContentPlaceHolder1$ddlDepartment";
    var DistrictControl = 'ctl00$ContentPlaceHolder1$ddlDistrict';

    GetEAppealServices("", ServiceControl);
    GetEAppealDepartment("", DepartmentControl);
    GetDistrict("", "21", DistrictControl);

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

    //$("#btnSubmit").bind("click", function (e) { return SubmitData(); });
    //$("[name='" + ServiceControl + "']").bind("change", function (e) { return GetEAppealServices("", DepartmentControl, ServiceControl); });
    $("[name='" + DepartmentControl + "']").bind("change", function (e) { return GetEAppealDeptServices("", DepartmentControl, ServiceControl); });
    $("[name='" + ServiceControl + "']").bind("change", function (e) { return GetEAppealDepartmentCode("", DepartmentControl, ServiceControl); });

});

function GetEAppealServices(category, ServiceControl, DepartmentControl) {
    debugger;
    var SelIndex = $("[name='" + ServiceControl + "']").val();
    if (SelIndex != '0') {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/webapp/Kiosk/Complaint/eAppeal.aspx/GetEAppealServices',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";

                $("[name='" + ServiceControl + "']").empty();
                $("[name='" + ServiceControl + "']").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[name='" + ServiceControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                });

                var qs = getQueryStrings();
                var t_SvcID = "";
                if (qs["SvcID"] != null) {
                    t_SvcID = qs["SvcID"];
                    //GetSelectedServices("", ServiceControl, t_SvcID, "", DepartmentControl, ServiceControl);//Implemented in AddressScript.js
                    GetEAppealSelectedServices("", ServiceControl, t_SvcID, "", DepartmentControl, ServiceControl)
                }

            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }
    else {
        //ddlDepartment
    }
}

function GetEAppealDepartment(category, DepartmentControl, ServiceControl) {
    debugger;
    //var SelIndex = $("[name='" + StateControl + "']").val();
    //var SelIndex = ServiceControl.split('_');
    //var SelIndex = $("[name='" + ServiceControl + "']").val().split('_');

    //BindAppleteAuthority(category, SelIndex[0]);

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Kiosk/Complaint/eAppeal.aspx/GetEAppealDepartment',
        data: '{"prefix":"' + category + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("[name='" + DepartmentControl + "']").empty();
            $("[name='" + DepartmentControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + DepartmentControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

    //,"DepartmentCode":"' + SelIndex[2] + '"

}

function GetEAppealDeptServices(category, DepartmentControl, ServiceControl) {
    debugger;
    var SelIndex = $("[name='" + DepartmentControl + "']").val();
    if (SelIndex != '0') {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/webapp/Kiosk/Complaint/eAppeal.aspx/GetEAppealDeptServices',
            data: '{"prefix": "","DepartmentCode":"' + SelIndex + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                var catCount = 0;
                $("[name='" + ServiceControl + "']").empty();
                $("[name='" + ServiceControl + "']").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[name='" + ServiceControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    catCount++;
                });

                //$("[name='" + ServiceControl + "']").append('<option value = ' + catCount + '>Show All Services</option>');

            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }
    else {

        GetEAppealServices(category, ServiceControl);
    }
    //$("#divGridAppeal").hide();
}

function GetEAppealDepartmentCode(category, DepartmentControl, ServiceControl) {
    debugger;
    //var SelIndex = $("[name='" + StateControl + "']").val();
    //var SelIndex = ServiceControl.split('_');
    var SelIndex = $("[name='" + ServiceControl + "']").val().split('_');

    ResetControls();

    if (SelIndex != '0') {
        if (SelIndex[0] != null) {
            BindEAppealAppleteAuthority(category, SelIndex[0]);
        }

        if (SelIndex[0] != null) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/webapp/Kiosk/Complaint/eAppeal.aspx/GetEAppealDepartmentCode',
                data: '{"prefix":"' + category + '","DepartmentCode":"' + SelIndex[0] + '"}',
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
                    $("[name='" + DepartmentControl + "']").attr("disabled", true);

                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }
        else {
            //$('#divGridAppeal').hide();
            var ServiceControl = "ctl00$ContentPlaceHolder1$ddlServices";
            var DepartmentControl = "ctl00$ContentPlaceHolder1$ddlDepartment";
            var DistrictControl = 'ctl00$ContentPlaceHolder1$ddlDistrict';

            GetEAppealServices("", ServiceControl);
            GetEAppealDepartment("", DepartmentControl);
            GetDistrict("", "21", DistrictControl);
        }
    }
    else {
        var DepartmentControl = "ctl00$ContentPlaceHolder1$ddlDepartment";
        $("[name='" + DepartmentControl + "']").attr("disabled", false);
        GetEAppealDepartment("", DepartmentControl);
                
    }

}

function GetAppletAuthority() {
    var category = "";
    var svcid = $("#ddlServices option:selected").val();
    var deptid = $("#ddlDepartment option:selected").val();
    var distid = $("#ddlDistrict option:selected").val();

    if (svcid == 0) {
        alert('Please Select Service');
    }
    
    if (deptid == 0) {
        alert('Please Select Department');
    }
    BindEAppealAppleteAuthority(category, svcid);
    BindOfficeName(svcid, deptid, distid);
    //$('#divGridAppeal').hide()
}

function BindEAppealAppleteAuthority(category, svcid) {
    debugger;
    var catCount = 0;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Kiosk/Complaint/eAppeal.aspx/BindEAppealAppleteAuthority',
        data: '{"prefix":"' + category + '","ServiceCode":"' + svcid + '"}',
        processData: false,
        dataType: "json",
        success: function (result) {
            var Applete = eval(result.d);
            var html = "";

            if (result.d.length > 2) {
                $("#divGridAppeal").show();
            }
            else {
                $("#divGridAppeal").hide();
            }

            $("[id=grdViewAppeal]").empty();
            $("#grdViewAppeal").append("<tr><th>Service Name</th><th>Time Limit</th><th>Designated Officer</th><th>Appellate Authority</th><th>Revisional Authority</th><th>FAQ</th></tr>");
            var t_student = [result];
            //for (var i = 0; i < result.d.length - 3; i++) { //Logic commented due to an issue in it.
            for (var i = 0; i < 1; i++) {
                $("#grdViewAppeal").append("<tr><td>" + Applete[i].ServiceName + "</td><td>" + Applete[i].TimeLimit + " days </td><td>" + Applete[i].DesignatedOfficer + "</td><td>" + Applete[i].AppellateAuthority + "</td><td>" + Applete[i].RevisionalAuthority + "</td><td><a href='" + Applete[i].FAQURL + "' target='_blank'>How to Apply</td></tr>");
                catCount++;

            }
           
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });
    //$("#divGridAppeal").hide();
}

function BindOfficeName(svcid, deptid, distid) {
    
    var OfficeControl = "ddlOffice";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/webapp/Kiosk/Complaint/eAppeal.aspx/GetOfficeName',
            data: '{"prefix": "","ServiceCode":"' + svcid + '","DepartmentCode":"' + deptid + '","DistrictCode":"' + distid + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                debugger;
                $("[name='" + OfficeControl + "']").empty();
                $("[name='" + OfficeControl + "']").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[name='" + OfficeControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                });

                //var qs = getQueryStrings();
                //var t_SvcID = "";
                //if (qs["SvcID"] != null) {
                //    t_SvcID = qs["SvcID"];
                //    GetEAppealSelectedServices("", ServiceControl, t_SvcID, "", DepartmentControl, ServiceControl);//Implemented in AddressScript.js
                //}

            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    

}

function GetEAppealSelectedServices(category, ServiceControl, ServiceID, deptCategory, DepartmentControl) {
    debugger;
    //var SelIndex = $("[name='" + ServiceControl + "']").val();

    if (ServiceID != "") {
        selectServiceByVal(ServiceControl, ServiceID, deptCategory, DepartmentControl);
        
    }
}

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
        'Services': $('#ddlServices option:selected').val(),
        'ServicesName': $('#ddlServices option:selected').text(),
        'DepartmentID': $('#ddlDepartment option:selected').val(),
        'DepartmentName': $('#ddlDepartment option:selected').text(),

        'DistrictID': $('#ddlDistrict option:selected').val(),
        'DistrictName': $('#ddlDistrict option:selected').text(),
        'ComplaintDept': $('#ddlDepartment option:selected').text(),
        'ReferenceID': $('#RefID').val(),
        'ApplicationDate': DOAConverted,

        'ComplaintID': $('#ddlCategory option:selected').val(),
        'ComplaintType': $('#ddlCategory option:selected').text(),
        'OfficeName': $('#ddlOffice option:selected').text(),
        'OfficerName': $('#txtofficer').val(),
                
        'ComplaintDescription': $('#txtDescription').val(),
        'ConcernedOfficer': $('#txtofficer').val(),
        'ConcernedOffice': $('#ddlCategory option:selected').text(),
        
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
            url: '/WebApp/Kiosk/Complaint/eAppeal.aspx/InsertEAppeal',
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
                alert("Your E-Appeal is registered sucessfully with Reference ID : " + obj.AppID + ". Please attach necessary document.");
                window.location.href = '../Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID + '&UID=' + uid;
            }

        });// end of Then function of main Data Insert Function

    return false;
}

function ValidateForm() {

    var text = "";
    var opt = "";

    /// Basic Information 
    var Services = $("#ddlServices option:selected").val();
    var Department = $("#ddlDepartment option:selected").val();
    var District = $("#ddlDistrict option:selected").val();
    //  var office = $("#ddlOffice option:selected").val();
    var category = $("#ddlCategory option:selected").val();
    //var officer = $("#txtofficer").val();
    //var AppDate = $("#txtDate").val();
   // var Office = $("#ddlOffice option:selected").val();
    //var RefId = $("#RefID").val();
    var Description = $("#txtDescription").val();

    if (Services=="-Select Services-") {
        text += "<br /> -Please Select services. ";
        opt = 1;
    }

    if (Department == "0" || Department == "-Select Department-") {
        text += "<br /> -Please select department. ";
        opt = 1;
    }
    if (District == "0" || District == "-Select District-") {
        text += "<br /> -Please Select District. ";
        opt = 1;
    }
    //if (office == "0" || office == "-Select Concerned office-") {
    //    text += "<br /> -Please Select Concerned office ";
    //    opt = 1;
    //}
    if (category == "0" || category == "-Select Complaint Type-") {
        text += "<br /> -Please Select Complaint Type. ";
        opt = 1;
    }
    //if (officer == "" || officer == null) {
    //    text += "<br /> -Please Enter officer. ";
    //    opt = 1;
    //}
    //if (AppDate == ""||AppDate==null) {
    //    text += "<br /> -Please Enter Submitted Application Date. ";
    //    opt = 1;
    //}

    
    //if (RefId == "" || RefId == null)
    //{
    //    text += "<br /> -Please enter Reference ID  ";
    //    opt = 1;
    //}
    if (Description == null || Description == "")
    {
        text += "<br /> -Please Enter Complaint Discription  ";
        opt = 1;
    }
    

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}

function ResetControls() {
    var ServiceControl = "ctl00$ContentPlaceHolder1$ddlServices";//
    var DepartmentControl = "ctl00$ContentPlaceHolder1$ddlDepartment";
    var DistrictControl = 'ctl00$ContentPlaceHolder1$ddlDistrict';

    $("[name='" + DistrictControl + "']").val(0);
}