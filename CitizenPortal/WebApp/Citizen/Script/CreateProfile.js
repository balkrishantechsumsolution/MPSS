


//function GetCategoryCast() {
//debugger;
// var catCount = 0;
//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: '/webapp/Citizen/Forms/CreateProfile.aspx/BindCategory',
//        processData: false,
//        dataType: "json",
//        success: function (response) {
//            var arr = eval(response.d);
//            var html = "";
//            $("[id*=ddlCategory]").empty();
//            $("[id*=ddlCategory]").append('<option value = "0">Select Category</option>');
//            $.each(arr, function () {
//               // alert('hi');
//                $("[id*=ddlCategory]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
//                // console.log(this.Id + ',' + this.Name);
//            });

//        },
//        error: function (a, b, c) {
//            alert("4." + a.responseText);
//        }
//    });

//}
//function GetReligion() {
//    debugger;
//    var catCount = 0;
//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: '/webapp/Citizen/Forms/CreateProfile.aspx/BindReligion',
//        processData: false,
//        dataType: "json",
//        success: function (response) {
//            var arr = eval(response.d);
//            var html = "";
//            $("[id*=ddlReligion]").empty();
//            $("[id*=ddlReligion]").append('<option value = "0">Select Religion</option>');
//            $.each(arr, function () {
//               // alert('hi');
//                $("[id*=ddlReligion]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
//                // console.log(this.Id + ',' + this.Name);
//            });

//        },
//        error: function (a, b, c) {
//            alert("4." + a.responseText);
//        }
//    });

//}
//function GetMaritalstatus() {
//    debugger;
//    var catCount = 0;
//    $.ajax({
//        type: "POST",
//        contentType: "application/json; charset=utf-8",
//        url: '/webapp/Citizen/Forms/CreateProfile.aspx/BindMaritalstatus',
//        processData: false,
//        dataType: "json",
//        success: function (response) {
//            var arr = eval(response.d);
//            var html = "";
//            $("[id*=ddlMaritalStatus]").empty();
//            $("[id*=ddlMaritalStatus]").append('<option value = "0">Select Material Status</option>');
//            $.each(arr, function () {
//                // alert('hi');
//                $("[id*=ddlMaritalStatus]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
//                // console.log(this.Id + ',' + this.Name);
//            });

//        },
//        error: function (a, b, c) {
//            alert("4." + a.responseText);
//        }
//    });

//}


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

$(document).ready(function () {
    GetCategoryCast();
    GetReligion();
    GetMaritalstatus();

    var StateControl = "ctl00$ContentPlaceHolder1$Address1$ddlState";
    var DistrictControl = "ctl00$ContentPlaceHolder1$Address1$ddlDistrict";
    var TalukaControl = "ctl00$ContentPlaceHolder1$Address1$ddlTaluka";
    var VillageControl = "ctl00$ContentPlaceHolder1$Address1$ddlVillage";

    $("[name='" + StateControl + "']").bind("change", function (e) { return GetDistrict("", $("[name='" + StateControl + "']").val(), DistrictControl); });
    $("[name='" + DistrictControl + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl, TalukaControl); });
    $("[name='" + TalukaControl + "']").bind("change", function (e) { return GetVillage("", TalukaControl, VillageControl); });

    EL("File1").addEventListener("change", readFile, false);

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });
    debugger;
    var qs = getQueryStrings();

    if (qs['UserID'] != null)
    { //fnFetchUserDetails();
    }

    if (qs['ProfileID'] == '0000000000000') {
        $('#MobileNo').val(qs['M']);
        $('#MobileNo').prop('disabled', true);
    } //else {

    //    alert('Profile already registered with Mobile No.' + qs['M']+". Use "+qs['M']+" as Login Id to access the portal");//fnGetCitizenDetails();
    //}
   
});

function fnGetCitizenDetails() {
    var qs = getQueryStrings();
    if (qs["URL"] != null && qs["URL"] != "") {
        var ProfileID = qs["UID"];

        if (ProfileID != null && ProfileID != "") {
            $.when(
       $.ajax({
           type: "POST",
           contentType: "application/json; charset=utf-8",
           url: '/WebApp/Citizen/Forms/CitizenProfile.aspx/GetCitizenProfileData',
           data: '{"prefix": "","Data":"' + ProfileID + '"}',
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


           $("#ContentPlaceHolder1_HFProfileID").val(ProfileID);

           var obj = jQuery.parseJSON(data.d);


           result = true;

           if (result /*&& jqXHRData_IMG_result*/) {

               $("#FirstName").val(obj["residentName"]);
               $('#FirstName').prop("disabled", true);

               //$("#UID").val(obj["aadhaarNumber"]);
               //$('#UID').prop("disabled", true);

               $("#FatherName").val(obj["careOf"]);
               $('#FatherName').prop("disabled", true);

               //obj["careOfLocal"];

               obj["district"];
               //obj["districtLocal"];
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


               $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(obj["houseNumber"]);
               $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").prop("disabled", true);

               //$("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(obj["houseNumber"]);
               $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").prop("disabled", true);

               $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(obj["street"]);
               $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").prop("disabled", true);

               //obj["houseNumberLocal"];
               $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(obj["landmark"]);
               $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").prop("disabled", true);
               //obj["landmarkLocal"];
               //obj["language"];
               $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(obj["locality"]);
               $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").prop("disabled", true);
               //obj["localityLocal"];
               //obj["phone"];
               $('#phoneno').val(obj["phone"]);
               $('#MobileNo').val(obj["Mobile"]);
               $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").val(obj["pincode"]);
               $("[name='ctl00$ContentPlaceHolder1$Address1$PinCode']").prop("disabled", true);

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


               obj["state"];
               //obj["stateLocal"];
               $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(obj["street"]);
               //obj["streetLocal"];
               obj["subDistrict"];
               //obj["subDistrictLocal"];



               $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(obj["phouseNumber"]);
               $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").prop("disabled", true);

               //$("[name='ctl00$ContentPlaceHolder1$AddressLine2']").val(obj["houseNumber"]);
               $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").prop("disabled", true);

               $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(obj["pstreet"]);
               $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").prop("disabled", true);
               $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(obj["plandmark"]);
               $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").prop("disabled", true);
               $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(obj["plocality"]);
               $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").prop("disabled", true);
               $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(obj["ppincode"]);
               $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").prop("disabled", true);

               GetStateUIDPermanent(obj["state"], obj["district"], obj["subDistrict"]);
               GetStateUID(obj["pstate"], obj["pdistrict"], obj["psubDistrict"]);
               //objState = obj["state"], objDistrict = obj["district"], objTaluka = obj["subDistrict"], objVillage = obj["vtc"];



           }

           //alert("Basic detail saved from Aadhaar.");
           //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

       });// end of Then function of main Data Insert Function

        }


    }
}

function EL(id) { return document.getElementById(id); } // Get el by ID helper function

function readFile() {

    debugger;
    if (this.files && this.files[0]) {
        var imgsizee = this.files[0].size;
        var sizekb = imgsizee / 1024;
        sizekb = sizekb.toFixed(0);

        $('#HFSizeOfPhoto').val(sizekb);
        if (sizekb < 5 || sizekb > 50) {
            // $('#imgupload').attr('src', null);
            alert('The size of the photograph should fall between 5KB to 50KB. Your Photo Size is ' + sizekb + 'kb.');
            return false;
        }

        var ftype = this; //document.getElementById('File1');
        var fileupload = ftype.value;
        if (fileupload == '') {
            alert("Photograph only allows file types of PNG, JPG, JPEG. ");
            return;
        }
        else {
            var Extension = fileupload.substring(fileupload.indexOf('.') + 1);
            if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
                //if (ftype.files && ftype.files[0]) {
                //    var reader = new FileReader();
                //    reader.onload = function (e) {
                //        $('#File1').attr('src', e.target.result)

                //    }
                //    reader.readAsDataURL(ftype.files[0]);
                //}
            }
            else {
                alert("Photograph only allows file types of PNG, JPG, JPEG. ");
                return;
            }
        }

        var FR = new FileReader();
        FR.onload = function (e) {
            EL("myImg").src = e.target.result;
            EL("ContentPlaceHolder1_HFb64").value = e.target.result;
        };
        FR.readAsDataURL(this.files[0]);
    }
}

var objState = "", objDistrict = "", objTaluka = "", objVillage = "";

function fnCopyAddress() {
    if (chkAddressCreate.checked) {
        var objState = "ContentPlaceHolder1_Address1_ddlState";
        var objDistrict = "ContentPlaceHolder1_Address1_ddlDistrict";
        var objTaluka = "ContentPlaceHolder1_Address1_ddlTaluka";
        var objVillage = "ContentPlaceHolder1_Address1_ddlVillage";

        GetStateUID($("#" + objState).val(), $("#" + objDistrict).val(), $("#" + objTaluka).val(), $("#" + objVillage).val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val($("#ContentPlaceHolder1_Address1_AddressLine1").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val($("#ContentPlaceHolder1_Address1_AddressLine2").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val($("#ContentPlaceHolder1_Address1_RoadStreetName").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val($("#ContentPlaceHolder1_Address1_LandMark").val());
        $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val($("#ContentPlaceHolder1_Address1_Locality").val());
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlState']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlDistrict']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlTaluka']").val(obj["pincode"]);
        //$("[name='ctl00$ContentPlaceHolder1$Address2$ddlVillage']").val(obj["pincode"]);
        $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val($("#ContentPlaceHolder1_Address1_PinCode").val());
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
        $("[id*=" + AddState + "]").val("0");


        $("[id*=" + AddDistrict + "]").empty();
        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');

        $("[id*=" + AddTaluka + "]").empty();
        $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');

        $("[id*=" + AddVillage + "]").empty();
        $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
    }
}

function GetStateUIDPermanent(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        var AddState = "ContentPlaceHolder1_Address1_ddlState";
        var AddDistrict = "ContentPlaceHolder1_Address1_ddlDistrict";
        var AddTaluka = "ContentPlaceHolder1_Address1_ddlTaluka";
        var AddVillage = "ContentPlaceHolder1_Address1_ddlVillage";

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
                $("[id*=" + AddState + "]").empty();
                $("[id*=" + AddState + "]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=" + AddState + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByTextCitizen(AddState, p_State);



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
                        $("[id*=" + AddDistrict + "]").empty();
                        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id*=" + AddDistrict + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByTextCitizen(AddDistrict, p_District);

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
                                    $("[id*=" + AddTaluka + "]").empty();
                                    $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id*=" + AddTaluka + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByTextCitizen(AddTaluka, p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    if (SelIndex != null && SelIndex != "") {
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
                                                $("[id*=" + AddVillage + "]").empty();
                                                $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
                                                $.each(Category, function () {
                                                    $("[id*=" + AddVillage + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                    //console.log(this.Id + ',' + this.Name);
                                                    catCount++;
                                                });

                                                t_VillageVal = selectByTextCitizen(AddVillage, p_Village);
                                            },
                                            error: function (a, b, c) {
                                                alert("4." + a.responseText);
                                            }


                                        });
                                    }



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

function GetStateUID(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        var AddState = "ContentPlaceHolder1_Address2_ddlState";
        var AddDistrict = "ContentPlaceHolder1_Address2_ddlDistrict";
        var AddTaluka = "ContentPlaceHolder1_Address2_ddlTaluka";
        var AddVillage = "ContentPlaceHolder1_Address2_ddlVillage";

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
                $("[id*=" + AddState + "]").empty();
                $("[id*=" + AddState + "]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=" + AddState + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByTextCitizen(AddState, p_State);



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
                        $("[id*=" + AddDistrict + "]").empty();
                        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id*=" + AddDistrict + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByTextCitizen(AddDistrict, p_District);

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
                                    $("[id*=" + AddTaluka + "]").empty();
                                    $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id*=" + AddTaluka + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByTextCitizen(AddTaluka, p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    if (SelIndex != null && SelIndex != "") {
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
                                                $("[id*=" + AddVillage + "]").empty();
                                                $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
                                                $.each(Category, function () {
                                                    $("[id*=" + AddVillage + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                    //console.log(this.Id + ',' + this.Name);
                                                    catCount++;
                                                });

                                                t_VillageVal = selectByTextCitizen(AddVillage, p_Village);
                                            },
                                            error: function (a, b, c) {
                                                alert("4." + a.responseText);
                                            }


                                        });
                                    }



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

function selectByTextCitizen(p_Control, txt) {
    debugger;
    //$("[id*=ddlState] option")
    //.filter(function () { return $.trim($(this).text()) == txt; })
    //.attr('selected', true);

    //var t_Value = $("#" + txt + "").val();
    var t_Value = txt;
    //$("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
    //    //return $(this).text().toLowerCase() == txt.toLowerCase();
    //    if ($(this).val().toLowerCase() == txt.toLowerCase()) {
    //        t_Value = $(this).val();
    //        return t_Value;
    //    }
    //}).prop('selected', true);

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

    //Permanent  address
    var AddressLine1 = $("#ContentPlaceHolder1_Address1_AddressLine1");
    var AddressLine2 = $("#ContentPlaceHolder1_Address1_AddressLine2");
    var RoadStreetName = $("#ContentPlaceHolder1_Address1_RoadStreetName");
    var LandMark = $("#ContentPlaceHolder1_Address1_LandMark");
    var Locality = $("#ContentPlaceHolder1_Address1_Locality");
    var State = $("#ContentPlaceHolder1_Address1_ddlState option:selected").text();
    var District = $("#ContentPlaceHolder1_Address1_ddlDistrict option:selected").text();
    var Taluka = $("#ContentPlaceHolder1_Address1_ddlTaluka option:selected").text();
    var Village = $("#ContentPlaceHolder1_Address1_ddlVillage option:selected").text();
    var Pincode = $("#ContentPlaceHolder1_Address1_PinCode");

    //Present  address
    var PreAddressLine1 = $("#ContentPlaceHolder1_Address2_AddressLine1");
    var PreAddressLine2 = $("#ContentPlaceHolder1_Address2_AddressLine2");
    var PreRoadStreetName = $("#ContentPlaceHolder1_Address2_RoadStreetName");
    var PreLandMark = $("#ContentPlaceHolder1_Address2_LandMark");
    var PreLocality = $("#ContentPlaceHolder1_Address2_Locality");
    //CoPrententPlaceHolder1_Address1_ddlState
    var PreState = $("#ContentPlaceHolder1_Address2_ddlState option:selected").text();
    var PreDistrict = $("#ContentPlaceHolder1_Address2_ddlDistrict option:selected").text();
    var PreTaluka = $("#ContentPlaceHolder1_Address2_ddlTaluka option:selected").text();
    var PreVillage = $("#ContentPlaceHolder1_Address2_ddlVillage option:selected").text();
    var PrePincode = $("#ContentPlaceHolder1_Address2_PinCode");



    if (EL("myImg").src.indexOf("photo.png") != -1) {
        text += "<br /> -Please upload Applicant Photograph.";
        opt = 1;
    }

    if (FirstName.val() == '') {
        text += "<br /> -Please enter First Name. ";
        opt = 1;
    }

    if (LastName.val() == '') {
        text += "<br /> -Please enter Last Name. ";
        opt = 1;
    }

    if (MobileNo.val() == '') {
        text += "<br /> -Please enter Mobile No. ";
        opt = 1;
    }

    if (MobileNo.val() != '') {
        var mobmatch1 = /^[789]\d{9}$/;
        if (!mobmatch1.test(MobileNo.val())) {
            text += "<br /> -Please enter valid mobile Number.";
            opt = 1;
        }
    }

    if (EmailID.val() == '') {
        text += "<br /> -Please enter EMail ID. ";
        opt = 1;
    }

    if (DOB.val() == '') {
        text += "<br /> -Please enter Date of Birth. ";
        opt = 1;
    }

    if ((Gender == '' || Gender == 'Select Gender')) {
        text += "<br /> -Please Select Gender. ";
        opt = 1;
    }

    if (AddressLine1 != null && AddressLine1.val() == '') {
        text += "<br /> -Please enter Care of Address in Permanent Address. ";
        opt = 1;
    }

    if (State != null && (State == '' || State == '-Select-')) {
        text += "<br /> -Please select State in Permanent Address.";
        opt = 1;
    }

    if (District != null && (District == '' || District == '-Select-')) {
        text += "<br /> -Please select District in Permanent Address.";
        opt = 1;
    }

    if (Taluka != null && (Taluka == '' || Taluka == '-Select-')) {
        text += "<br /> -Please select Taluka in Permanent Address.";
        opt = 1;
    }

    if (Village != null && (Village == '' || Village == '-Select-')) {
        text += "<br /> -Please select Village in Permanent Address.";
        opt = 1;
    }
    if (Pincode != null && Pincode.val() == '') {
        text += "<br /> -Please enter Pincode in Permanent Address.";
        opt = 1;
    }
    /////////////////////////
    if (PreAddressLine1 != null && PreAddressLine1.val() == '') {
        text += "<br /> -Please enter Care of Address in Present Address. ";
        opt = 1;
    }

    if (PreState != null && (PreState == '' || PreState == '-Select-')) {
        text += "<br /> -Please select State in Present Address.";
        opt = 1;
    }

    if (PreDistrict != null && (PreDistrict == '' || PreDistrict == '-Select-')) {
        text += "<br /> -Please select District in Present Address.";
        opt = 1;
    }

    if (PreTaluka != null && (PreTaluka == '' || PreTaluka == '-Select-')) {
        text += "<br /> -Please select Taluka in Present Address.";
        opt = 1;
    }

    if (PreVillage != null && (PreVillage == '' || PreVillage == '-Select-')) {
        text += "<br /> -Please select Village in Present Address.";
        opt = 1;
    }
    if (PrePincode != null && PrePincode.val() == '') {
        text += "<br /> -Please enter Pincode in Present Address.";
        opt = 1;
    }
    /////////////////////////
    var pinmatch = /^[0-9]\d{5}$/;
    if (Pincode != null && Pincode.val() != '') {
        if (!pinmatch.test(Pincode.val())) {
            text += "<br /> -Please enter valid pincode.";
            opt = 1;
        }
    }

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
    var qs = getQueryStrings();
    //var obj = jQuery.parseJSON($("#HFUIDData").val());

    var datavar = {

        'aadhaarNumber': '',
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

        'houseNumber': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(),
        'houseNumberLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(),

        'landmark': $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(),
        'landmarkLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(),

        'locality': $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(),
        'localityLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(),

        'street': $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(),
        'streetLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(),

        'postOffice': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(),
        'postOfficeLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(),

        'responseCode': '',
        'language': '1',

        'state': $('#ContentPlaceHolder1_Address1_ddlState option:selected').text(),
        'stateLocal': $('#ContentPlaceHolder1_Address1_ddlState option:selected').text(),
        'district': $('#ContentPlaceHolder1_Address1_ddlDistrict option:selected').text(),
        'districtLocal': $('#ContentPlaceHolder1_Address1_ddlDistrict option:selected').text(),
        'subDistrict': $('#ContentPlaceHolder1_Address1_ddlTaluka option:selected').text(),
        'subDistrictLocal': $('#ContentPlaceHolder1_Address1_ddlTaluka option:selected').text(),
        'Village': $('#ContentPlaceHolder1_Address1_ddlVillage option:selected').text(),
        'pincode': $('#ContentPlaceHolder1_Address1_PinCode').val(),
        'pincodeLocal': $('#ContentPlaceHolder1_Address1_PinCode').val(),

        //'Image': obj["photo"],
        'Image': $('#ContentPlaceHolder1_HFb64').val(),
        'phouseNumber': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(),
        'plandmark': $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(),
        'plocality': $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(),
        'pstreet': $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(),
        'ppincode': $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(),
        'ppostOffice': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(),

        'pstate': $('#ContentPlaceHolder1_Address2_ddlState').val(),
        'pdistrict': $('#ContentPlaceHolder1_Address2_ddlDistrict').val(),
        'psubDistrict': $('#ContentPlaceHolder1_Address2_ddlTaluka').val(),
        'pvillage': $('#ContentPlaceHolder1_Address2_ddlVillage').val(),

        'JSONData': '',
        'CitizenProfileID': $('#ContentPlaceHolder1_HFProfileID').val(),

        'statecode': $('#ContentPlaceHolder1_Address1_ddlState').val(),
        'districtcode': $('#ContentPlaceHolder1_Address1_ddlDistrict').val(),
        'subDistrictcode': $('#ContentPlaceHolder1_Address1_ddlTaluka').val(),
        'Villagecode': $('#ContentPlaceHolder1_Address1_ddlVillage').val(),
        'LoginId': qs["UserID"],
        'Religion': $('#ddlReligion option:selected').text(),
        'Category': $('#ddlCategory option:selected').text(),
        'MaterialStatus': $('#ddlStatus option:selected').text(),
        'vtc': $('#ContentPlaceHolder1_Address1_ddlVillage option:selected').text(),
        'vtcLocal': $('#ContentPlaceHolder1_Address1_ddlVillage option:selected').text()
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Citizen/Forms/CreateProfile.aspx/InsertCreateProfile',
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
                alert("Profile Created Successfully. Now you can avail services.");
                window.location.href = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + AppID;
            }

            
        });// end of Then function of main Data Insert Function

    return false;
}


function fnFetchUserDetails(UserID) {
    debugger;
    $.when(
      $.ajax({
          type: "POST",
          contentType: "application/json; charset=utf-8",
          url: '/webapp/citizen/forms/basicdetails.aspx/GetUserDetails',
          //data: '{"prefix": ""}',
          //data: '{"UID": '+uid+'}',
          data: '{"prefix":"","UID":"' + UserID + '"}',
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
           var name = arr[0].Name;
           var JSONData = name;


       });
}