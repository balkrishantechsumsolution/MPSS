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

function EL(id) { return document.getElementById(id); } // Get el by ID helper function

function readFile() {
    debugger;
    if (this.files && this.files[0]) {
        //if (this.files[0].size > '5000') { alert('The Applicant Phograph size should be less than 5000 Bytes.'); return false; }
        //var imgType = this.files[0].type;
        //if (imgType != 'jpg' || imgType != 'jpeg') { alert('The Applicant Phograph image type should be .jpeg or .jpg'); return false; }

        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 5 || sizekb > 50) {
            // $('#imgupload').attr('src', null);
            alert('The size of the photograph should fall between 5KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("ProfilePhoto").src = e.target.result;
            EL("HFb64").value = e.target.result;


            var imgsizee = input.files[0].size;
            var sizekb = imgsizee / 1024;

            $('#HFSizeOfPhoto').val(sizekb);
            if (sizekb < 5 || sizekb > 50) {
                // $('#imgupload').attr('src', null);
                alert('The size of the photograph should fall between 5KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            }



        };
        FR.readAsDataURL(this.files[0]);
    }
}

function fnNext() {
    debugger;
    //var qs = getQueryStrings();
    //if (qs["URL"] != null) {
    //    var url = qs["URL"];
    //    var svcid = qs["SvcID"];
    //    var dpt = qs["DPT"];
    //    var dist = qs["DIST"];
    //    var blk = qs["BLK"];
    //    var pan = qs["PAN"];
    //    var ofc = qs["OFC"];
    //    var ofr = qs["OFR"];
    //    alert("Basic detail saved from Aadhaar.");
    //    window.location.href = url + '?SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;
    //}
    //else if (qs["UID"] != null) {
    //    var AppID = qs["UID"];
    //    window.location.href = '/WebApp/Kiosk/Forms/OfficeOfficer.aspx?UID=' + AppID

    //}
    //else { window.location.href = '/WebApp/Kiosk/Forms/DashboardChart.aspx' }
    SubmitData();
}

function ValidateForm() {

    var text = "";
    var opt = "";

    /// Basic Information 
    var FirstName = $("#FirstName");
    var LastName = $("#LastName");
    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");
    var Gender = $("#ddlGender option:selected").text();

    //Permanent address
    var AddressLine1 = $("#AddressLine1");
    var AddressLine2 = $("#AddressLine2");
    var RoadStreetName = $("#RoadStreetName");
    var LandMark = $("#LandMark");
    var Locality = $("#Locality");

    var State = $("#ddlState option:selected").text();
    var District = $("#ddlDistrict option:selected").text();
    var Taluka = $("#ddlTaluka option:selected").text();
    var Village = $("#ddlVillage option:selected").text();
    var Pincode = $("#PinCode");
    //Present Address




    if (FirstName.val() == '') {
        text += "<br /> -Please Enter First Name. ";
        opt = 1;
    }

    if (LastName.val() == '') {
        text += "<br /> -Please Enter Last Name. ";
        opt = 1;
    }

    if (MobileNo.val() == '') {
        text += "<br /> -Please Enter Mobile No. ";
        opt = 1;
    }

    if (MobileNo.val() != '') {
        var mobmatch1 = /^[789]\d{9}$/;
        if (!mobmatch1.test(MobileNo.val())) {
            text += "<br /> -Please Enter valid mobile Number.";
            opt = 1;
        }
    }

    if (EmailID.val() == '') {
        text += "<br /> -Please Enter EMail ID. ";
        opt = 1;
    }

    if (EmailID.val() != '') {
        var ss = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!ss.test(EmailID.val())) {
            text += "<br /> - Please Enter valid EmailID";
            //text += "<br /> -  Please enter valid Confirm EmailID.";
            opt = 1;
        }
    }



    if (DOB.val() == '') {
        text += "<br /> -Please Enter Date of Birth. ";
        opt = 1;
    }

    if ((Gender == '' || Gender == 'Select Gender')) {
        text += "<br /> -Please Select Gender. ";
        opt = 1;
    }
    //permanent Address
    if (AddressLine1 != null && AddressLine1.val() == '') {
        text += "<br /> -Please Enter Care of Address. ";
        opt = 1;
    }
    if (RoadStreetName != null && RoadStreetName.val() == '') {
        text += "<br /> -Please Enter Road/Street of Permanent Address. ";
        opt = 1;
    }
    if (Locality != null && Locality.val() == '') {
        text += "<br /> -Please Enter Locality of Permanent Address. ";
        opt = 1;
    }

    if (State != null && (State == '' || State == 'Enter State Name')) {
        text += "<br /> -Please Select State in Permanent Address.";
        opt = 1;
    }

    if (District != null && (District == '' || District == '-Select-')) {
        text += "<br /> -Please Select Districtin Permanent Address.";
        opt = 1;
    }

    if (Taluka != null && (Taluka == '' || Taluka == '-Select-')) {
        text += "<br /> -Please Select Block in Permanent Address.";
        opt = 1;
    }

    if (Village != null && (Village == '' || Village == '-Select-')) {
        text += "<br /> -Please Select Village in Permanent Address.";
        opt = 1;
    }
    if (Pincode != null && Pincode.val() == '') {
        text += "<br /> -Please enter Pincode in permanent Address.";
        opt = 1;
    }

    //var pinmatch = /^[0-9]\d{5}$/;
    //if (Pincode != null && Pincode.val() != '') {
    //    if (!pinmatch.test(Pincode.val())) {
    //        text += "<br /> -Please enter valid pincode.";
    //        opt = 1;
    //    }
    //}


    //present Addess
    var PreAddressLine1 = $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']");//$("#AddressLine1");
    var PreAddressLine2 = $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']");//$("#AddressLine2");
    var PreRoadStreetName = $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']");//$("#RoadStreetName");
    var PreLandMark = $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']");//$("#LandMark");
    var PreLocality = $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']");//$("#Locality");

    var PreState = $("#ddlState option:selected").text();
    var PreDistrict = $("#ddlDistrict option:selected").text();
    var PreTaluka = $("#ddlTaluka option:selected").text();
    var PreVillage = $("#ddlVillage option:selected").text();
    var PrePincode = $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']");//$("#PinCode");


    if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
        text += "<br /> -Please Enter Address of Present Address. ";
        opt = 1;
    }
    if (PreRoadStreetName != null && PreRoadStreetName.val() == '') {
        text += "<br /> -Please Enter Road/Street Name of Present Address. ";
        opt = 1;
    }
    if (PreLocality != null && PreLocality.val() == '') {
        text += "<br /> -Please Enter Locality of Present Address. ";
        opt = 1;
    }

    if (PreState != null && (PreState == '' || PreState == '-Select-')) {
        text += "<br /> -Please Select State in present Address.";
        opt = 1;
    }

    if (PreDistrict != null && (PreDistrict == '' || PreDistrict == 'Select District')) {
        text += "<br /> -Please Select District in present Address.";
        opt = 1;
    }

    if (PreTaluka != null && (PreTaluka == '' || PreTaluka == 'Select Block')) {
        text += "<br /> -Please Select Block in Present Address.";
        opt = 1;
    }

    if (PreVillage != null && (PreVillage == '' || PreVillage == 'Select Panchayat')) {
        text += "<br /> -Please Select Village Present Address..";
        opt = 1;
    }
    if (PrePincode != null && PrePincode.val() == '') {
        text += "<br /> -Please Enter Pincode Present Address..";
        opt = 1;
    }

    //var Prepinmatch = /^[0-9]\d{5}$/;
    //if (PrePincode != null && PrePincode.val() != '') {
    //    if (!Prepinmatch.test(PrePincode.val())) {
    //        text += "<br /> -Please Enter valid pincode.";
    //        opt = 1;
    //    }
    //}


    if ($("#HFResponseType").val() == "1") {
        //var PhotoUpload1 = $("#ProfilePhoto");

        //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
        //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

        //if (Photoarray.indexOf(Extension) <= -1) {
        //    _err_mag += "<br /> - Photo must be in JPEG / PNG form.";
        //    opt = 1;
        //}

        //var sizekb = parseFloat(PhotoUpload1.files[0].size / 1024).toFixed(2); // Commented on 07-05-2015 with below line
        //var sizekb = $('#HFSizeOfPhoto').val();
        //sizekb = sizekb.toFixed(0);
        ////alert(sizekb);

        //if (sizekb < 5 || sizekb > 50) {
        //    _err_mag += "<br /> - The size of the photograph should fall between 5KB to 50KB. Your Photo Size is " + sizekb + "kb.";
        //    opt = 1;
        //}
    }

    //var v = new Image();

    //v.src = document.getElementById("imgupload").getAttribute('src');


    //var width = v.width;
    //var height = v.height;
    //var aspratio = parseInt(height) / parseInt(width);
    //if (width != 160) {

    //    _err_mag += "<br /> -The width of the photograph should be 160 pixels.";
    //    opt = 1;
    //}
    //if (aspratio < 1.25 || aspratio > 1.33) {

    //    _err_mag += "<br /> -The height of the photograph should fall between 200 to 212 pixels.";
    //    opt = 1;
    //}

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return;
    }

    var temp = "Gunwant";
    var AppID = "";
    var result = false;
    var DOBArr = $('#DOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

    var obj = jQuery.parseJSON($("#HFUIDData").val());

    var UserImage = obj["photo"];

    var qs = getQueryStrings();
    if (qs["ProfileID"] != null && qs["ProfileID"] != "") {
        if (EL("HFb64").value != null && EL("HFb64").value != "") {
            UserImage = EL("HFb64").value;
        }
    }


    var datavar = {

        'aadhaarNumber': $('#UID').val(),
        'action': '',
        'residentName': $('#FirstName').val(),
        'residentNameLocal': $('#FirstName').val(),
        'careOf': $('#FatherName').val(),
        'careOfLocal': $('#FatherName').val(),
        'dateOfBirth': DOBConverted,
        'gender': $('#ddlGender').val(),
        'phone': $('#phoneno').val(),
        'Mobile': $('#MobileNo').val(),
        'emailId': $('#EmailID').val(),

        'houseNumber': $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").val(),
        'houseNumberLocal': $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").val(),

        'landmark': $("[name='ctl00$ContentPlaceHolder1$LandMark']").val(),
        'landmarkLocal': $("[name='ctl00$ContentPlaceHolder1$LandMark']").val(),

        'locality': $("[name='ctl00$ContentPlaceHolder1$Locality']").val(),
        'localityLocal': $("[name='ctl00$ContentPlaceHolder1$Locality']").val(),

        'street': $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(),
        'streetLocal': $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(),

        'postOffice': $("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(),
        'postOfficeLocal': $("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(),

        'responseCode': '',
        'language': '1',

        'state': $('#txtState').val(),
        'stateLocal': $('#txtState').val(),
        'district': $('#txtDistrict').val(),
        'districtLocal': $('#txtDistrict').val(),
        'subDistrict': $('#txtBlock').val(),
        'subDistrictLocal': $('#txtBlock').val(),
        'Village': $('#txtPanchayat').val(),
        'pincode': $('#PinCode').val(),
        'pincodeLocal': $('#PinCode').val(),

        'Image': UserImage,

        'phouseNumber': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(),
        'plandmark': $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(),
        'plocality': $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(),
        'pstreet': $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(),
        'ppincode': $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(),
        'ppostOffice': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(),

        'pstate': $('#ddlState').val(),
        'pdistrict': $('#ddlDistrict').val(),
        'psubDistrict': $('#ddlTaluka').val(),
        'pvillage': $('#ddlVillage').val(),

        'JSONData': $("#HFUIDData").val(),

        //$("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val("");
        //    $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val("");
        //    $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val("");
        //    $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val("");
        //    $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val("");
        //    //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
        //    //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
        //    //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
        //    //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
        //    $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val("");
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/Forms/BasicDetail.aspx/InsertBasicDetails',
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
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            AppID = obj.AppID;
            result = true;

            if (result /*&& jqXHRData_IMG_result*/) {
                var qs = getQueryStrings();
                if (qs["SvcID"] == '386') {
                    alert("Basic detail saved from Aadhaar. Please fill the Complaint details.");
                    window.location.href = '/WebApp/Kiosk/Complaint/Complaint.aspx?UID=' + AppID + '&SvcID=386';
                    return false;
                }
                if (qs["SvcID"] == '387') {
                    alert("Basic detail saved from Aadhaar. Please fill Habisha Brata details.");
                    window.location.href = '/WebApp/Kiosk/Habisha/Habisha.aspx?UID=' + AppID + '&SvcID=387';
                    return false;
                }

                if (qs["URL"] != null && qs["URL"] != "") {
                    var url = qs["URL"];
                    var svcid = qs["SvcID"];
                    var dpt = qs["DPT"];
                    var dist = qs["DIST"];
                    var blk = qs["BLK"];
                    var pan = qs["PAN"];
                    var ofc = qs["OFC"];
                    var ofr = qs["OFR"];

                    alert("Basic detail saved.");
                    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;
                }
                else {
                    alert("Basic detail saved. Please select Service, Office and Other to proceed.");
                    window.location.href = 'OfficeOfficer.aspx?UID=' + AppID;

                }
            }
        });// end of Then function of main Data Insert Function

    return false;
}

var dat = new Date();
var curday = dat.getDate();
var curmon = dat.getMonth() + 1;
var curyear = dat.getFullYear();

function checkleapyear(datea) {
    if (datea.getYear() % 4 == 0) {
        if (datea.getYear() % 10 != 0) {
            return true;
        } else {
            if (datea.getYear() % 400 == 0)
                return true;
            else
                return false;
        }
    }
    return false;
}

function DaysInMonth(Y, M) {
    with (new Date(Y, M, 1, 12)) {
        setDate(0);
        return getDate();
    }
}

function datediff(date1, date2) {
    var y1 = date1.getFullYear(),
    m1 = date1.getMonth(),
    d1 = date1.getDate(),
    y2 = date2.getFullYear(),
    m2 = date2.getMonth(),
    d2 = date2.getDate();
    if (d1 < d2) {
        m1--;
        d1 += DaysInMonth(y2, m2);
    }
    if (m1 < m2) {
        y1--;
        m1 += 12;
    }
    return [y1 - y2, m1 - m2, d1 - d2];
}

function calage(dob) {

    var D1 = dob.split('/');
    var calday = D1[0];
    var calmon = D1[1];
    var calyear = D1[2];

    var curd = new Date(curyear, curmon - 1, curday);
    var cald = new Date(calyear, calmon - 1, calday);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calyear, calmon, calday, 0, 0, 0);
    var dife = datediff(curd, cald);
    return dife[0];
}

//function GetStateAsPerUID2(p_State, p_District, p_SubDistrict) {
//    if (p_State != "") {
//        var category = "";

//        GetStateAJAX(p_State).success(GetDistrictAJAX);
//    }
//}

//function GetDistrictAJAX(p_District) {

//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
//        data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
//        processData: false,
//        dataType: "json",
//        success: function (response) {
//            var Category = eval(response.d);
//            var html = "";
//            var catCount = 0;
//            $("[id=ddlDistrict]").empty();
//            $("[id=ddlDistrict]").append('<option value = "0">-Select-</option>');
//            $.each(Category, function () {
//                $("[id=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
//                //console.log(this.Id + ',' + this.Name);
//                catCount++;
//            });

//            selectByText("ddlDistrict", p_District);
//        },
//        error: function (a, b, c) {
//            alert("2." + a.responseText);
//        }
//    });

//}

//function GetStateAJAX(p_State) {
//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
//        data: '{"prefix": ""}',
//        processData: false,
//        dataType: "json",
//        success: function (response) {
//            var arr = eval(response.d);
//            var html = "";
//            $("[id*=ddlState]").empty();
//            $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
//            $.each(arr, function () {
//                $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
//                //console.log(this.Id + ',' + this.Name);
//            });

//            //$("[id*=ddlState]").text(p_Value);
//            selectByText("ddlState", p_State);

//            //$('#ddlTaluka').val();

//            //GetDistrict(p_District);

//            var SelIndex = $("#ddlState").val();

//        },
//        error: function (a, b, c) {
//            alert("1." + a.responseText);
//        }
//    });

//}

function GetStateAsPerUIDUsingVAL(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=ddlState]").empty();
                $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByVal("ddlState", p_State);



                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id=ddlDistrict]").empty();
                        $("[id=ddlDistrict]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByVal("ddlDistrict", p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);


                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id=ddlTaluka]").empty();
                                    $("[id=ddlTaluka]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByVal("ddlTaluka", p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '../../Registration/KioskRegistration.aspx/GetVillage',
                                        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                        processData: false,
                                        dataType: "json",
                                        success: function (response) {
                                            var Category = eval(response.d);
                                            var html = "";
                                            var catCount = 0;
                                            $("[id=ddlVillage]").empty();
                                            $("[id=ddlVillage]").append('<option value = "0">-Select-</option>');
                                            $.each(Category, function () {
                                                $("[id=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByVal("ddlVillage", p_Village);
                                        },
                                        error: function (a, b, c) {
                                            alert("4." + a.responseText);
                                        }


                                    });



                                },
                                error: function (a, b, c) {
                                    alert("3." + a.responseText);
                                }
                            });


                        }

                    },
                    error: function (a, b, c) {
                        alert("2." + a.responseText);
                    }
                });


            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });

    }

}

function selectByVal(p_Control, txt) {

    var t_Value = txt;

    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    return t_Value;
}


function GetStateAsPerUID(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=ddlState]").empty();
                $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByText("ddlState", p_State);



                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
                    data: '{"prefix":"' + category + '","StateCode":"' + SelIndex + '"}',
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        var Category = eval(response.d);
                        var html = "";
                        var catCount = 0;
                        $("[id=ddlDistrict]").empty();
                        $("[id=ddlDistrict]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id=ddlDistrict]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByText("ddlDistrict", p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);


                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
                                data: '{"prefix":"' + category + '","DistrictCode":"' + SelIndex + '"}',
                                processData: false,
                                dataType: "json",
                                success: function (response) {
                                    var Category = eval(response.d);
                                    var html = "";
                                    var catCount = 0;
                                    $("[id=ddlTaluka]").empty();
                                    $("[id=ddlTaluka]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByText("ddlTaluka", p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '../../Registration/KioskRegistration.aspx/GetVillage',
                                        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                        processData: false,
                                        dataType: "json",
                                        success: function (response) {
                                            var Category = eval(response.d);
                                            var html = "";
                                            var catCount = 0;
                                            $("[id=ddlVillage]").empty();
                                            $("[id=ddlVillage]").append('<option value = "0">-Select-</option>');
                                            $.each(Category, function () {
                                                $("[id=ddlVillage]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByText("ddlVillage", p_Village);
                                        },
                                        error: function (a, b, c) {
                                            alert("4." + a.responseText);
                                        }


                                    });



                                },
                                error: function (a, b, c) {
                                    alert("3." + a.responseText);
                                }
                            });


                        }

                    },
                    error: function (a, b, c) {
                        alert("2." + a.responseText);
                    }
                });


            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });

    }

}

function selectByText(p_Control, txt) {
    //$("[id*=ddlState] option")
    //.filter(function () { return $.trim($(this).text()) == txt; })
    //.attr('selected', true);

    var t_Value = "";

    $("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
        //return $(this).text().toLowerCase() == txt.toLowerCase();
        if ($(this).text().toLowerCase() == txt.toLowerCase()) {
            t_Value = $(this).val();
            return t_Value;
        }
    }).prop('selected', true);

    //alert(t_Value);
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    //$("[id*=" + p_Control + "] option").each(function () {
    //    if ($(this).text() == theText) {
    //        //$(this).attr('selected', 'selected');
    //        t_Value = $(this).val();
    //    }
    //});

    //$("[id*=" + p_Control + "]").val(t_Value);

    return t_Value;
}

$(document).ready(function () {
    debugger;
    GetState();

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

    EL("fulPhoto").addEventListener("change", readFile, false);

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

    qs = getQueryStrings();
    if (qs["ProfileID"] != null) {
        debugger;
        //var JSIONData = GetJISONKeyField(qs["ProfileID"]);
        //$("#HFUIDData").val(JSIONData);
        /////////////////

        ProfileID = qs["ProfileID"];
        $.when(
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

          },
          error: function (a, b, c) {
              alert("1." + a.responseText);
          }
      })
       ).then(function (data, textStatus, jqXHR) {
           debugger;

           //var arr = eval(data.d);
           //var arr = jQuery.parseJSON(data.d);
            JSONData = data.d;
           //var html = "";
           //var name = arr[0].Name; // 2017-01-31: Logic commented for editing the Profile
           //var JSONData = name; // 2017-01-31: Logic commented for editing the Profile
           $("#HFUIDData").val(JSONData);

           if ($("#HFUIDData").val() != "") {

               $("#HFResponseType").val("1");
               BindProfileV2(JSONData, 1);//function to call with 1 in case of Citizen Profile Data
           }

       });// end of Then function of main Data Insert Function
        ///////////
    }
    else {
        //alert('shhsd');
        $("#HFResponseType").val("0");
        BindProfile($("#HFUIDData").val(), 0);//function to call with 0 in case of eKYC Data
    }

    if (false && $("#HFUIDData").val() != "") {
        //alert($("#HFUIDData").val());
        debugger;

        $("#divNonAadhar").hide();

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
            var selectedYear = S_date.getFullYear(); // selected year

            //var Age = calage(S_date);
            var Age = calage(t_DOB);
            $('#Age').val(Age);
        }

        document.getElementById('ProfilePhoto').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);

        $("#FirstName").val(obj["residentName"]);
        $('#FirstName').prop("disabled", true);

        $("#UID").val(obj["aadhaarNumber"]);
        $('#UID').prop("disabled", true);

        $("#FatherName").val(obj["careOf"]);
        if (obj["careOf"] != null) {
            $('#FatherName').prop("disabled", true);
        }
        //obj["careOfLocal"];

        obj["district"];
        //obj["districtLocal"];
        $('#EmailID').val(obj["emailId"]);

        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("M");
                $('#ddlSalutation').val("1");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("F");
                $('#ddlSalutation').val("2");
            }
            else {
                $('#ddlGender').val("T");
                $('#ddlSalutation').val("3");
            }
            $('#ddlGender').prop("disabled", true);
        }

        $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").val(obj["houseNumber"]);
        $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").prop("disabled", true);

        //$("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(obj["houseNumber"]);
        $("[name='ctl00$ContentPlaceHolder1$AddressLine2']").prop("disabled", true);

        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").prop("disabled", true);

        //obj["houseNumberLocal"];
        $("[name='ctl00$ContentPlaceHolder1$LandMark']").val(obj["landmark"]);
        $("[name='ctl00$ContentPlaceHolder1$LandMark']").prop("disabled", true);
        //obj["landmarkLocal"];
        //obj["language"];
        $("[name='ctl00$ContentPlaceHolder1$Locality']").val(obj["locality"]);
        $("[name='ctl00$ContentPlaceHolder1$Locality']").prop("disabled", true);
        //obj["localityLocal"];
        //obj["phone"];
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


        //obj["pincodeLocal"];
        //obj["postOffice"];
        //obj["postOfficeLocal"];
        //obj["residentName"];
        //obj["residentNameLocal"];                

        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").prop('selected', false).filter(function () {
        //    return $(this).text() == obj["state"];
        //}).prop('selected', true);

        //// Now set dropdown selected option to the one as per State.                
        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").map(function () {
        //    if ($(this).text() == obj["state"]) return this;
        //}).attr('selected', 'selected');

        //selectByText(obj["state"]);



        obj["state"];
        //obj["stateLocal"];
        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
        //obj["streetLocal"];
        obj["subDistrict"];
        //obj["subDistrictLocal"];



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

        //alert($("#DOB").val());
        //alert(Age);

        //GetStateAsPerUID(obj["state"], obj["district"], obj["subDistrict"], obj["vtc"]);
        objState = obj["state"], objDistrict = obj["district"], objTaluka = obj["subDistrict"], objVillage = obj["vtc"];
    }//end of UID Data

});


/*
New Function to Bind the Page with Citizen Details for Editing the Profile.
*/
function BindProfileV2(JSONData, ProfileType) {



    if (JSONData != "") {
        //alert($("#HFUIDData").val());
        debugger;

        $("#divNonAadhar").hide();

        $("#divSearch").show();
        $("#divBasicInfo").show();
        $("#divAddress").show();
        $("#divBtn").show();
        $("#ddlSearch").prop("disabled", true);
        $("#UID").prop("disabled", true);
        $("#btnSearch").prop("disabled", true);
        //$('#MobileNo').prop('disabled', true);
        //$('#divSearch').hide();
        if (ProfileType == 1) {
            $("#fulPhoto").show();
        }
        else {
            $("#fulPhoto").hide();
        }


        var obj = jQuery.parseJSON(JSONData);

        if (obj["dateOfBirth"] != "") {
            var t_DOB = obj["dateOfBirth"];

            if (ProfileType == 1) {

                var D1 = t_DOB.split('-');
                var calday = D1[2];
                var calmon = D1[1];
                var calyear = D1[0];


                t_DOB = calday.toString() + "/" + calmon.toString() + "/" + calyear;

            }

            t_DOB = t_DOB.replace(/-/g, "/");
            $('#DOB').val(t_DOB);
            $('#DOB').prop("disabled", true);

            debugger;
            var t_DOB = $("#DOB").val();
            t_DOB = t_DOB.replace("-", "/");
            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear(); // selected year

            //var Age = calage(S_date);
            var Age = calage(t_DOB);
            $('#Age').val(Age);
        }

        if (ProfileType == 1) {
            if (obj["Image"] != null && obj["Image"] != "") {
                if (obj["Image"].indexOf('data:image/jpeg;base64,') !== -1) {
                    document.getElementById('ProfilePhoto').setAttribute('src', obj["Image"]);
                }
                else {
                    document.getElementById('ProfilePhoto').setAttribute('src', 'data:image/jpeg;base64,' + obj["Image"]);
                }
            }
            else { $('#fulPhoto').show(); }
        }
        else {
            document.getElementById('ProfilePhoto').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);
        }

        $("#FirstName").val(obj["residentName"]);
        $('#FirstName').prop("disabled", true);

        if (qs["ProfileID"] != null) {
            $("#UID").val(qs["ProfileID"]);
            //$('#ddlSearch').val("C");
            $('#UID').prop("disabled", true);

        }
        else {
            $("#UID").val(obj["aadhaarNumber"]);
            $('#UID').prop("disabled", true);
        }
        $("#FatherName").val(obj["careOf"]);
        if (obj["careOf"] != null) {
            $('#FatherName').prop("disabled", true);
        }
        else { $('#FatherName').prop("disabled", false); }
        //obj["careOfLocal"];

        obj["district"];
        //obj["districtLocal"];
        $('#EmailID').val(obj["emailId"]);

        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("M");
                $('#ddlSalutation').val("1");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("F");
                $('#ddlSalutation').val("2");
            }
            else {
                $('#ddlGender').val("T");
                $('#ddlSalutation').val("3");
            }
            $('#ddlGender').prop("disabled", true);
        }

        /*
        2016-11-22: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.
        */
        if (obj["houseNumber"] != null && obj["houseNumber"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").val(obj["houseNumber"]);
            $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").prop("disabled", true);
        }

        if (obj["postOffice"] != null && obj["postOffice"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(obj["postOffice"]);
            $("[name='ctl00$ContentPlaceHolder1$AddressLine2']").prop("disabled", true);
        }

        if (obj["street"] != null && obj["street"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
            $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").prop("disabled", true);
        }

        if (obj["landmark"] != null && obj["landmark"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$LandMark']").val(obj["landmark"]);
            $("[name='ctl00$ContentPlaceHolder1$LandMark']").prop("disabled", true);
        }
        /*
        2016-11-22: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.
        */

        //obj["houseNumberLocal"];
        //obj["landmarkLocal"];
        //obj["language"];

        /*2016-12-20: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.*/
        if (obj["locality"] != null && obj["locality"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Locality']").val(obj["locality"]);
            $("[name='ctl00$ContentPlaceHolder1$Locality']").prop("disabled", true);
        }

        //obj["localityLocal"];
        //obj["phone"];
        $('#phoneno').val(obj["phone"]);

        $('#MobileNo').val(obj["Mobile"]);
        if (obj["Mobile"] != null && obj["Mobile"] != "") {
            $('#MobileNo').val(obj["Mobile"]);
            $('#MobileNo').prop("disabled", true);
        }
        else { $('#MobileNo').prop("disabled", false); }

        if (obj["Mobile"] == null) {
            $('#MobileNo').val(obj["phone"]);
        }


        $("[name='ctl00$ContentPlaceHolder1$PinCode']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$PinCode']").prop("disabled", true);

        if (obj["state"] != "") {
            $('#txtState').val(obj["state"]);
            $('#txtState').prop("disabled", true);
        }
        $('#txtDistrict').val(obj["district"]);
        $('#txtBlock').val(obj["subDistrict"]);

        if (ProfileType == 1) {
            $('#txtPanchayat').val(obj["Village"]);
        }
        else {
            $('#txtPanchayat').val(obj["vtc"]);
        }
        $('#txtDistrict').prop("disabled", true);
        $('#txtBlock').prop("disabled", true);
        $('#txtPanchayat').prop("disabled", true);


        //obj["pincodeLocal"];
        //obj["postOffice"];
        //obj["postOfficeLocal"];
        //obj["residentName"];
        //obj["residentNameLocal"];                

        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").prop('selected', false).filter(function () {
        //    return $(this).text() == obj["state"];
        //}).prop('selected', true);

        //// Now set dropdown selected option to the one as per State.                
        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").map(function () {
        //    if ($(this).text() == obj["state"]) return this;
        //}).attr('selected', 'selected');

        //selectByText(obj["state"]);



        obj["state"];
        //obj["stateLocal"];
        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
        //obj["streetLocal"];
        obj["subDistrict"];
        //obj["subDistrictLocal"];


        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(obj["phouseNumber"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(obj["ppostOffice"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(obj["plandmark"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(obj["plocality"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(obj["pstreet"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(obj["ppincode"]);

        //GetStateAsPerUID("", "", "", "");

        //$('#ddlState').val(obj["pstate"]),
        //$('#ddlDistrict').val(obj["pdistrict"]),
        //$('#ddlTaluka').val(obj["psubDistrict"]),
        //$('#ddlVillage').val(obj["pvillage"]),



        if (ProfileType == 1) {
            //GetStateAsPerUIDUsingVAL(obj["statecode"], obj["districtcode"], obj["subDistrictcode"], obj["Villagecode"]);

            GetStateAsPerUIDUsingVAL(obj["pstate"], obj["pdistrict"], obj["psubDistrict"], obj["pvillage"]);
        }
        //else {
        //    GetStateAsPerUID(obj["state"], obj["district"], obj["subDistrict"], obj["vtc"]);
        //}

        objState = obj["state"], objDistrict = obj["district"], objTaluka = obj["subDistrict"], objVillage = obj["vtc"];
    }//end of UID Data


}

function BindProfile(JSONData, ProfileType) {



    if (JSONData != "") {
        //alert($("#HFUIDData").val());
        debugger;

        $("#divNonAadhar").hide();

        $("#divSearch").show();
        $("#divBasicInfo").show();
        $("#divAddress").show();
        $("#divBtn").show();
        $("#ddlSearch").prop("disabled", true);
        $("#UID").prop("disabled", true);
        $("#btnSearch").prop("disabled", true);
        //$('#MobileNo').prop('disabled', true);
        //$('#divSearch').hide();
        if (ProfileType == 1) {
            $("#fulPhoto").show();
        }
        else {
            $("#fulPhoto").hide();
        }


        var obj = jQuery.parseJSON(JSONData);

        if (obj["dateOfBirth"] != "") {
            var t_DOB = obj["dateOfBirth"];

            if (ProfileType == 1) {

                var D1 = t_DOB.split('-');
                var calday = D1[2];
                var calmon = D1[1];
                var calyear = D1[0];


                t_DOB = calday.toString() + "/" + calmon.toString() + "/" + calyear;

            }

            t_DOB = t_DOB.replace(/-/g, "/");
            $('#DOB').val(t_DOB);
            $('#DOB').prop("disabled", true);

            debugger;
            var t_DOB = $("#DOB").val();
            t_DOB = t_DOB.replace("-", "/");
            var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
            var selectedYear = S_date.getFullYear(); // selected year

            //var Age = calage(S_date);
            var Age = calage(t_DOB);
            $('#Age').val(Age);
        }

        if (ProfileType == 1) {
            if (obj["Image"] != null && obj["Image"] != "") {
                if (obj["Image"].indexOf('data:image/jpeg;base64,') !== -1) {
                    document.getElementById('ProfilePhoto').setAttribute('src', obj["Image"]);
                }
                else {
                    document.getElementById('ProfilePhoto').setAttribute('src', 'data:image/jpeg;base64,' + obj["Image"]);
                }
            }
            else { $('#fulPhoto').show(); }
        }
        else {
            document.getElementById('ProfilePhoto').setAttribute('src', 'data:image/png;base64,' + obj["photo"]);
        }

        $("#FirstName").val(obj["residentName"]);
        $('#FirstName').prop("disabled", true);

        if (qs["ProfileID"] != null) {
            $("#UID").val(qs["ProfileID"]);
            //$('#ddlSearch').val("C");
            $('#UID').prop("disabled", true);

        }
        else {
            $("#UID").val(obj["aadhaarNumber"]);
            $('#UID').prop("disabled", true);
        }
        $("#FatherName").val(obj["careOf"]);
        if (obj["careOf"] != null) {
            $('#FatherName').prop("disabled", true);
        }
        else { $('#FatherName').prop("disabled", false); }
        //obj["careOfLocal"];

        obj["district"];
        //obj["districtLocal"];
        $('#EmailID').val(obj["emailId"]);

        if (obj["gender"] != "") {
            if (obj["gender"] == "M") {
                $('#ddlGender').val("M");
                $('#ddlSalutation').val("1");
            }
            else if (obj["gender"] == "F") {
                $('#ddlGender').val("F");
                $('#ddlSalutation').val("2");
            }
            else {
                $('#ddlGender').val("T");
                $('#ddlSalutation').val("3");
            }
            $('#ddlGender').prop("disabled", true);
        }

        /*
        2016-11-22: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.
        */
        if (obj["houseNumber"] != null && obj["houseNumber"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").val(obj["houseNumber"]);
            $("[name='ctl00$ContentPlaceHolder1$AddressLine1']").prop("disabled", true);
        }

        if (obj["postOffice"] != null && obj["postOffice"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(obj["postOffice"]);
            $("[name='ctl00$ContentPlaceHolder1$AddressLine2']").prop("disabled", true);
        }

        if (obj["street"] != null && obj["street"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
            $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").prop("disabled", true);
        }

        if (obj["landmark"] != null && obj["landmark"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$LandMark']").val(obj["landmark"]);
            $("[name='ctl00$ContentPlaceHolder1$LandMark']").prop("disabled", true);
        }
        /*
        2016-11-22: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.
        */

        //obj["houseNumberLocal"];
        //obj["landmarkLocal"];
        //obj["language"];

        /*2016-12-20: Logic altered to enable these text boxes in case value from UID is blank, based on which, user cannot submit the form.*/
        if (obj["locality"] != null && obj["locality"] != "") {
            $("[name='ctl00$ContentPlaceHolder1$Locality']").val(obj["locality"]);
            $("[name='ctl00$ContentPlaceHolder1$Locality']").prop("disabled", true);
        }

        //obj["localityLocal"];
        //obj["phone"];
        $('#phoneno').val(obj["phone"]);

        $('#MobileNo').val(obj["Mobile"]);
        if (obj["Mobile"] != null && obj["Mobile"] != "") {
            $('#MobileNo').val(obj["Mobile"]);
            $('#MobileNo').prop("disabled", true);
        }
        else { $('#MobileNo').prop("disabled", false); }

        if (obj["Mobile"] == null) {
            $('#MobileNo').val(obj["phone"]);
        }


        $("[name='ctl00$ContentPlaceHolder1$PinCode']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$PinCode']").prop("disabled", true);

        if (obj["state"] != "") {
            $('#txtState').val(obj["state"]);
            $('#txtState').prop("disabled", true);
        }
        $('#txtDistrict').val(obj["district"]);
        $('#txtBlock').val(obj["subDistrict"]);

        if (ProfileType == 1) {
            $('#txtPanchayat').val(obj["Village"]);
        }
        else {
            $('#txtPanchayat').val(obj["vtc"]);
        }
        $('#txtDistrict').prop("disabled", true);
        $('#txtBlock').prop("disabled", true);
        $('#txtPanchayat').prop("disabled", true);


        //obj["pincodeLocal"];
        //obj["postOffice"];
        //obj["postOfficeLocal"];
        //obj["residentName"];
        //obj["residentNameLocal"];                

        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").prop('selected', false).filter(function () {
        //    return $(this).text() == obj["state"];
        //}).prop('selected', true);

        //// Now set dropdown selected option to the one as per State.                
        //$("[name='ctl00$ContentPlaceHolder1$Address1$ddlState'] option").map(function () {
        //    if ($(this).text() == obj["state"]) return this;
        //}).attr('selected', 'selected');

        //selectByText(obj["state"]);



        obj["state"];
        //obj["stateLocal"];
        $("[name='ctl00$ContentPlaceHolder1$RoadStreetName']").val(obj["street"]);
        //obj["streetLocal"];
        obj["subDistrict"];
        //obj["subDistrictLocal"];


        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(obj["phouseNumber"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(obj["ppostOffice"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(obj["plandmark"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(obj["plocality"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(obj["pstreet"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(obj["ppincode"]);

        //GetStateAsPerUID("", "", "", "");

        //$('#ddlState').val(obj["pstate"]),
        //$('#ddlDistrict').val(obj["pdistrict"]),
        //$('#ddlTaluka').val(obj["psubDistrict"]),
        //$('#ddlVillage').val(obj["pvillage"]),



        if (ProfileType == 1) {
            //GetStateAsPerUIDUsingVAL(obj["statecode"], obj["districtcode"], obj["subDistrictcode"], obj["Villagecode"]);

            GetStateAsPerUIDUsingVAL(obj["pstate"], obj["pdistrict"], obj["psubDistrict"], obj["pvillage"]);
        }
        //else {
        //    GetStateAsPerUID(obj["state"], obj["district"], obj["subDistrict"], obj["vtc"]);
        //}

        objState = obj["state"], objDistrict = obj["district"], objTaluka = obj["subDistrict"], objVillage = obj["vtc"];
    }//end of UID Data


}


//Start: jQuery Extension Function
jQuery.extend({
    stringify: function stringify(value, replacer, space) {
        if ("JSON" in window) {
            return JSON.stringify(value, replacer, space);
        }

        'use strict';

        var rx_escapable = /[\\\"\u0000-\u001f\u007f-\u009f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;

        function f(n) {
            // Format integers to have at least two digits.
            return n < 10 ? '0' + n : n;
        }

        function this_value() {
            return this.valueOf();
        }

        if (typeof Date.prototype.toJSON !== 'function') {

            Date.prototype.toJSON = function () {

                return isFinite(this.valueOf()) ? this.getUTCFullYear() + '-' +
                    f(this.getUTCMonth() + 1) + '-' +
                    f(this.getUTCDate()) + 'T' +
                    f(this.getUTCHours()) + ':' +
                    f(this.getUTCMinutes()) + ':' +
                    f(this.getUTCSeconds()) + 'Z' : null;
            };

            Boolean.prototype.toJSON = this_value;
            Number.prototype.toJSON = this_value;
            String.prototype.toJSON = this_value;
        }

        var gap,
            indent,
            meta,
            rep;


        function quote(string) {

            // If the string contains no control characters, no quote characters, and no
            // backslash characters, then we can safely slap some quotes around it.
            // Otherwise we must also replace the offending characters with safe escape
            // sequences.

            rx_escapable.lastIndex = 0;
            return rx_escapable.test(string) ? '"' + string.replace(rx_escapable, function (a) {
                var c = meta[a];
                return typeof c === 'string' ? c : '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);
            }) + '"' : '"' + string + '"';
        }


        function str(key, holder) {

            // Produce a string from holder[key].

            var i, // The loop counter.
                k, // The member key.
                v, // The member value.
                length,
                mind = gap,
                partial,
                value = holder[key];

            // If the value has a toJSON method, call it to obtain a replacement value.

            if (value && typeof value === 'object' &&
                typeof value.toJSON === 'function') {
                value = value.toJSON(key);
            }

            // If we were called with a replacer function, then call the replacer to
            // obtain a replacement value.

            if (typeof rep === 'function') {
                value = rep.call(holder, key, value);
            }

            // What happens next depends on the value's type.

            switch (typeof value) {
                case 'string':
                    return quote(value);

                case 'number':

                    // JSON numbers must be finite. Encode non-finite numbers as null.

                    return isFinite(value) ? String(value) : 'null';

                case 'boolean':
                case 'null':

                    // If the value is a boolean or null, convert it to a string. Note:
                    // typeof null does not produce 'null'. The case is included here in
                    // the remote chance that this gets fixed someday.

                    return String(value);

                    // If the type is 'object', we might be dealing with an object or an array or
                    // null.

                case 'object':

                    // Due to a specification blunder in ECMAScript, typeof null is 'object',
                    // so watch out for that case.

                    if (!value) {
                        return 'null';
                    }

                    // Make an array to hold the partial results of stringifying this object value.

                    gap += indent;
                    partial = [];

                    // Is the value an array?

                    if (Object.prototype.toString.apply(value) === '[object Array]') {

                        // The value is an array. Stringify every element. Use null as a placeholder
                        // for non-JSON values.

                        length = value.length;
                        for (i = 0; i < length; i += 1) {
                            partial[i] = str(i, value) || 'null';
                        }

                        // Join all of the elements together, separated with commas, and wrap them in
                        // brackets.

                        v = partial.length === 0 ? '[]' : gap ? '[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']' : '[' + partial.join(',') + ']';
                        gap = mind;
                        return v;
                    }

                    // If the replacer is an array, use it to select the members to be stringified.

                    if (rep && typeof rep === 'object') {
                        length = rep.length;
                        for (i = 0; i < length; i += 1) {
                            if (typeof rep[i] === 'string') {
                                k = rep[i];
                                v = str(k, value);
                                if (v) {
                                    partial.push(quote(k) + (
                                        gap ? ': ' : ':'
                                    ) + v);
                                }
                            }
                        }
                    } else {

                        // Otherwise, iterate through all of the keys in the object.

                        for (k in value) {
                            if (Object.prototype.hasOwnProperty.call(value, k)) {
                                v = str(k, value);
                                if (v) {
                                    partial.push(quote(k) + (
                                        gap ? ': ' : ':'
                                    ) + v);
                                }
                            }
                        }
                    }

                    // Join all of the member texts together, separated with commas,
                    // and wrap them in braces.

                    v = partial.length === 0 ? '{}' : gap ? '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}' : '{' + partial.join(',') + '}';
                    gap = mind;
                    return v;
            }
        }

        // If the JSON object does not yet have a stringify method, give it one.

        meta = { // table of character substitutions
            '\b': '\\b',
            '\t': '\\t',
            '\n': '\\n',
            '\f': '\\f',
            '\r': '\\r',
            '"': '\\"',
            '\\': '\\\\'
        };

        return (function (value, replacer, space) {

            // The stringify method takes a value and an optional replacer, and an optional
            // space parameter, and returns a JSON text. The replacer can be a function
            // that can replace values, or an array of strings that will select the keys.
            // A default replacer method can be provided. Use of the space parameter can
            // produce text that is more easily readable.

            var i;
            gap = '';
            indent = '';

            // If the space parameter is a number, make an indent string containing that
            // many spaces.

            if (typeof space === 'number') {
                for (i = 0; i < space; i += 1) {
                    indent += ' ';
                }

                // If the space parameter is a string, it will be used as the indent string.

            } else if (typeof space === 'string') {
                indent = space;
            }

            // If there is a replacer, it must be a function or an array.
            // Otherwise, throw an error.

            rep = replacer;
            if (replacer && typeof replacer !== 'function' &&
                (typeof replacer !== 'object' ||
                    typeof replacer.length !== 'number')) {
                throw new Error('jQuery.stringify');
            }

            // Make a fake root object containing our value under the key of ''.
            // Return the result of stringifying the value.

            return str('', {
                '': value
            });
        }(value, replacer, space));
    }
});
var objState = "", objDistrict = "", objTaluka = "", objVillage = "";

function fnCopyAddress(chk) {
    //if (chkAddress.checked)
    if (chk) {
        GetStateAsPerUID(objState, objDistrict, objTaluka, objVillage);
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val($("#AddressLine1").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val($("#AddressLine2").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val($("#RoadStreetName").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val($("#LandMark").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val($("#Locality").val());
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val($("#PinCode").val());
    }
    else {
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val("");
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val("");
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val("");

        var AddState = "ContentPlaceHolder1_Address2_ddlState";
        var AddDistrict = "ContentPlaceHolder1_Address2_ddlDistrict";
        var AddTaluka = "ContentPlaceHolder1_Address2_ddlTaluka";
        var AddVillage = "ContentPlaceHolder1_Address2_ddlVillage";

        GetStateV2("", AddState);

        $("[name='ctl00$ContentPlaceHolder1$Address2$ddlState'").val("0");

        $("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").empty();
        $("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").append('<option value = "0">-Select-</option>');

        $("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").empty();
        $("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").append('<option value = "0">-Select-</option>');

        $("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").empty();
        $("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").append('<option value = "0">-Select-</option>');

    }
}

function fnNonUID() {
    debugger;
    var qs = getQueryStrings();
    if (qs["SvcID"] != "387" && qs["SvcID"] != "386") {
        if (qs["URL"] != null && qs["URL"] != "") {
            var url = qs["URL"];
            var svcid = qs["SvcID"];
            var dpt = qs["DPT"];
            var dist = qs["DIST"];
            var blk = qs["BLK"];
            var pan = qs["PAN"];
            var ofc = qs["OFC"];
            var ofr = qs["OFR"];
            window.location.href = "../../Citizen/Forms/ValidateUser.aspx?URL=" + url + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

            //alert("Basic detail saved from Aadhaar.");
            //window.location.href = "../../Citizen/Forms/CitizenProfile.aspx?URL=" + url + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;
        }
    }
    else {
        var url = qs["URL"];
        var svcid = qs["SvcID"];
        //window.location.href = "../../Citizen/Forms/CitizenProfile.aspx?URL=" + url + '&SvcID=' + svcid;
        window.location.href = "../../Citizen/Forms/ValidateUser.aspx?URL=" + url + '&SvcID=' + svcid;
    }
}