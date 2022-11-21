$(document).ready(function () {
    //GetState();
    var StateControl = "ctl00$ContentPlaceHolder1$Address1$ddlState";
    var DistrictControl = "ctl00$ContentPlaceHolder1$Address1$ddlDistrict";
    var TalukaControl = "ctl00$ContentPlaceHolder1$Address1$ddlTaluka";
    var VillageControl = "ctl00$ContentPlaceHolder1$Address1$ddlVillage";


    var StateControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlState";
    var DistrictControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlDistrict";
    var TalukaControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlTaluka";
    var VillageControl2 = "ctl00$ContentPlaceHolder1$Address2$ddlVillage";

    //GetDistrictV2("", "ctl00$ContentPlaceHolder1$Address1$ddlState", "ctl00$ContentPlaceHolder1$Address1$ddlDistrict");

    GetStateV2("", StateControl);
    GetStateV2("", StateControl2);
    //GetStateV2("", "ctl00$ContentPlaceHolder1$Address2$ddlDistrict");//Logic to be activated for Educational State.


    GetDistrict("", "21", "ctl00$ContentPlaceHolder1$Address1$ddlDistrict"); //Implemented in Addressscript.js
    

    $("[name='" + StateControl + "']").bind("change", function (e) { return GetDistrict("", $("[name='" + StateControl + "']").val(), DistrictControl); });
    $("[name='" + DistrictControl + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl, TalukaControl); });
    $("[name='" + TalukaControl + "']").bind("change", function (e) { return GetVillage("", TalukaControl, VillageControl); });

    $("[name='" + StateControl2 + "']").bind("change", function (e) { return GetDistrict("", $("[name='" + StateControl2 + "']").val(), DistrictControl2); });
    $("[name='" + DistrictControl2 + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl2, TalukaControl2); });
    $("[name='" + TalukaControl2 + "']").bind("change", function (e) { return GetVillage("", TalukaControl2, VillageControl2); });


    EL("File1").addEventListener("change", readFile, false);

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });



    $('#FirstName').val("Gunwant");
    $('#MiddleName').val("");
    $('#LastName').val("Saini");
        
        
    $('#FatherName').val("Mr. Jag Mohan");
    $('#FatherName').val("Mr. Jag Mohan");
    $('#ddlGender').val("M");
    $('#phoneno').val("01143035379");
    $('#MobileNo').val("9650020439");
    $('#EmailID').val("test@test.com");

    $('#AgeYear').val("32");
    $('#AgeMonth').val("5");
    $('#AgeDay').val("10");
    //$('#Religion').val();
    //$('#Category').val();
    //$('#Nationality').val();
    $('#stdcode').val("011");


    $("#PAddressLine1").val("Address Line 1");
    $("#PAddressLine1").val("Address Line 2");

    $("#PLandMark").val("Landmark");

    $("#PLocality").val("Locality");

    $("#PRoadStreetName").val("RoadStreetName");

    $("#PAddressLine2").val("Address Line 2");

    $('#PPinCode').val("123456");

    $("#CAddressLine1").val("Address Line 1");
    $("#CLandMark").val("Address Line 2");
    $("#CLocality").val("Locality");
    $("#CRoadStreetName").val("RoadStreet Name");
    $("#CPinCode").val("123456");
    $("#CAddressLine2").val("Address Line 2");



});


function EL(id) { return document.getElementById(id); } // Get el by ID helper function

function readFile() {
    debugger;

    if (this.files && this.files[0]) {
        //if (this.files[0].size > '5000') { alert('The Applicant Phograph size should be less than 5000 Bytes.'); return false; }
        //var imgType = this.files[0].type;
        //if (imgType != 'jpg' || imgType != 'jpeg') { alert('The Applicant Phograph image type should be .jpeg or .jpg'); return false; }


        //var PhotoUpload1 = $("#myImg");

        //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
        //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

        //if (Photoarray.indexOf(Extension) <= -1) {
        //    alert("Photo must be in JPEG / PNG form.");
        //    return false;
        //}

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
            EL("myImg").src = e.target.result;
            EL("ContentPlaceHolder1_HFb64").value = e.target.result;


            //var img = new Image;
            //img.onload = function () {
            //    var width = img.width;
            //    var height = img.height;
            //    var aspratio = parseInt(height) / parseInt(width);
            //    //if (width != 160) {
            //    //    //$('#imgupload').attr('src', null);
            //    //    alert('The width of the photograph should be 160 pixels.');
            //    //}
            //    //if (aspratio < 1.25 || aspratio > 1.33) {
            //    //    //$('#imgupload').attr('src', null);
            //    //    alert('The height of the photograph should fall between 200 to 212 pixels.');
            //    //}

            //};
            //img.src = FR.result;




        };
        FR.readAsDataURL(this.files[0]);
    }
}



function GetStateOdishaV2(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        var AddState = "ddlState";
        var AddDistrict = "ddlDistrict";
        var AddTaluka = "ddlTaluka";
        var AddVillage = "ddlVillage";

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
                t_StateVal = selectByTextAddress(AddState, "ODISHA");



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

                        t_DistrictVal = selectByTextAddress(AddDistrict, p_District);

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

                                    t_SubDistrictVal = selectByTextAddress(AddTaluka, p_SubDistrict);


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
                                            $("[id*=" + AddVillage + "]").empty();
                                            $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
                                            $.each(Category, function () {
                                                $("[id*=" + AddVillage + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByTextAddress(AddVillage, p_Village);
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

function selectByTextAddress(p_Control, txt) {
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



var objState = "", objDistrict = "", objTaluka = "", objVillage = "";

function fnCopyAddress() {
    if (chkAddress.checked) {
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
    var FatherName = $("#FatherName");

    var MobileNo = $("#MobileNo");
    var EmailID = $("#EmailID");
    var DOB = $("#DOB");
    var Age = $("#Age");

    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");

    var Religion = $("#religion option:selected").text();

    var Category = $("#category option:selected").text();
    var Nationality = $("#nationality option:selected").text();


    var Gender = $("#ddlGender option:selected").text();

    //Permanent  address
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

    //Present  address
    var PreAddressLine1 = $("#CAddressLine1");
    var PreAddressLine2 = $("#CAddressLine2");
    var PreRoadStreetName = $("#CRoadStreetName");
    var PreLandMark = $("#CLandMark");
    var PreLocality = $("#CLocality");
    //CoPrententPlaceHolder1_Address1_ddlState
    var PreState = $("#CddlState option:selected").text();
    var PreDistrict = $("#CddlDistrict option:selected").text();
    var PreTaluka = $("#CddlTaluka option:selected").text();
    var PreVillage = $("#CddlVillage option:selected").text();
    var PrePincode = $("#CPinCode");



    if (EL("myImg").src.indexOf("photo.png") != -1) {       
        text += "<br /> -Please upload Applicant Photograph.";
        opt = 1;
    }

    if (FirstName.val() == '') {
        FirstName.addClass("msgError");
        text += "<br /> -Please enter First Name. ";
        opt = 1;
    }

    if (LastName.val() == '') {
        text += "<br /> -Please enter Last Name. ";
        opt = 1;
    }

    
    if (FatherName.val() == '') {
        text += "<br /> -Please enter Father Name. ";
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

    //if (EmailID.val() == '') {
    //    text += "<br /> -Please enter EMail ID. ";
    //    opt = 1;
    //}

    if (DOB.val() == '') {
        text += "<br /> -Please enter Date of Birth. ";
        opt = 1;
    }

    if ((Gender == '' || Gender == 'Select Gender')) {
        text += "<br /> -Please Select Gender. ";
        opt = 1;
    }

    if ((Religion == '' || Religion == 'Select')) {
        text += "<br /> -Please Select Religion. ";
        opt = 1;
    }

    if ((Category == '' || Category == 'Select')) {
        text += "<br /> -Please Select Category. ";
        opt = 1;
    }

    if ((Nationality == '' || Nationality == 'Select')) {
        text += "<br /> -Please Select Nationality. ";
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

    if (District != null && (District == '' || District == '-Select-' || District == 'Select District')) {
        text += "<br /> -Please select District in Permanent Address.";
        opt = 1;
    }

    if (Taluka != null && (Taluka == '' || Taluka == '-Select-' || Taluka == 'Select Block')) {
        text += "<br /> -Please select Taluka in Permanent Address.";
        opt = 1;
    }

    if (Village != null && (Village == '' || Village == '-Select-' || Village == 'Select Panchayat')) {
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

    if (PreDistrict != null && (PreDistrict == '' || PreDistrict == '-Select-' || PreDistrict == 'Select District')) {
        text += "<br /> -Please select District in Present Address.";
        opt = 1;
    }

    if (PreTaluka != null && (PreTaluka == '' || PreTaluka == '-Select-' || PreTaluka == 'Select Block')) {
        text += "<br /> -Please select Taluka in Present Address.";
        opt = 1;
    }

    if (PreVillage != null && (PreVillage == '' || PreVillage == '-Select-' || PreVillage == 'Select Panchayat')) {
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


    //var PhotoUpload1 = $("#myImg");

    //var Photoarray = ['JPEG', ' PNG', ' TIFF', 'JPG'];
    //var Extension = PhotoUpload1.val().substring(PhotoUpload1.val().lastIndexOf('.') + 1).toUpperCase();

    //if (Photoarray.indexOf(Extension) <= -1) {
    //    _err_mag += "<br /> - Photo must be in JPEG / PNG form.";
    //    opt = 1;
    //}

    //var sizekb = $('#HFSizeOfPhoto').val();
    //sizekb = sizekb == "" ? 0 : sizekb.toFixed(0);

    ////alert(sizekb);

    //if (sizekb < 5 || sizekb > 50) {
    //    text += "<br /> - The size of the photograph should fall between 5KB to 50KB. Your Photo Size is " + sizekb + "kb.";
    //    opt = 1;
    //}

    var passOdia = $("input[name='radio1']:checked").val();

    if (passOdia == null) {
        text += "<br /> -Please choose whether Candidate has passed Odia.";
        opt = 1;
    }



    if (opt == "1") {
        //alertPopup("Please fill following information.", text);
        alert(text);
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

    var FirstName = $("#FirstName");
    var LastName = $("#LastName");
    var FatherName = $("#FatherName");
    var Age = $("#Age");

    var AgeYear = $("#Year");
    var AgeMonth = $("#Month");
    var AgeDay = $("#Day");

    var Religion = $("#religion option:selected").text();

    var Category = $("#category option:selected").text();
    var Nationality = $("#nationality option:selected").text();

    //var obj = jQuery.parseJSON($("#HFUIDData").val());


    var passOdia = $("input[name='radio1']:checked").val();


    var datavar = {

        'FirstName': $('#FirstName').val(),
        'MiddleName': $('#MiddleName').val(),
        'LastName': $('#LastName').val(),
        'residentName': $('#FirstName').val() + ($('#MiddleName').val() == "" ? "": " " + $('#MiddleName').val() + " ") + $('#LastName').val(),
        'residentNameLocal': $('#FirstName').val() + ($('#MiddleName').val() == "" ? "" : " " + $('#MiddleName').val() + " ") + $('#LastName').val(),
        'careOf': $('#FatherName').val(),
        'careOfLocal': $('#FatherName').val(),
        'dateOfBirth': DOBConverted,
        'gender': $('#ddlGender').val(),
        'phone': $('#phoneno').val(),
        'Mobile': $('#MobileNo').val(),
        'emailId': $('#EmailID').val(),

        'AgeYear': $('#AgeYear').val(),
        'AgeMonth': $('#AgeMonth').val(),
        'AgeDay': $('#AgeDay').val(),
        'Religion': $('#Religion').val(),
        'Category': $('#Category').val(),
        'Nationality': $('#Nationality').val(),
        'stdcode': $('#stdcode').val(),


        'houseNumber': $("#PAddressLine1").val(),
        'houseNumberLocal': $("#PAddressLine1").val(),

        'landmark': $("#PLandMark").val(),
        'landmarkLocal': $("#PLandMark").val(),

        'locality': $("#PLocality").val(),
        'localityLocal': $("#PLocality").val(),

        'street': $("#PRoadStreetName").val(),
        'streetLocal': $("#PRoadStreetName").val(),

        'postOffice': $("#PAddressLine2").val(),
        'postOfficeLocal': $("#PAddressLine2").val(),

        'responseCode': '',
        'language': '1',

        'state': $('#PddlState').val(),
        'stateLocal': $('#PddlState').val(),
        'district': $('#PddlDistrict').val(),
        'districtLocal': $('#PddlDistrict').val(),
        'subDistrict': $('#PddlTaluka').val(),
        'subDistrictLocal': $('#PddlTaluka').val(),
        'Village': $('#PddlVillage').text(),
        'pincode': $('#PPinCode').val(),
        'pincodeLocal': $('#PPinCode').val(),

        //'Image': obj["photo"],
        'Image': $('#ContentPlaceHolder1_HFb64').val(),
        'phouseNumber': $("#CAddressLine1").val(),
        'plandmark': $("#CLandMark").val(),
        'plocality': $("#CLocality").val(),
        'pstreet': $("#CRoadStreetName").val(),
        'ppincode': $("#CPinCode").val(),
        'ppostOffice': $("#CAddressLine2").val(),

        'pstate': $('#CddlState').val(),
        'pdistrict': $('#CddlDistrict').val(),
        'psubDistrict': $('#CddlTaluka').val(),
        'pvillage': $('#CddlTaluka').val(),

        'JSONData': '',



        'Section1_PassOdia': '',
        'Section1_AbililtyRead': '',
        'Section1_AbilityWrite': '',
        'Section1_AbilitySpeak': '',
        'Section2_Married': '',
        'Section2A_MoreThanOneSpouse': '',
        'Section3_ExServiceMan': '',
        'Section3A_ServiceRendered': '',
        'Section3B_ServiceDuration': '',
        'Section3C_ServiceYear': '',
        'Section3C_ServiceMonth': '',
        'Section3C_ServiceDay': '',
        'Section4_IsSportsPerson': '',
        'Section4A_SportsParticipated': '',
        'Section4B_SportsOthers': '',
        'Section4B_WantsRelaxation': '',
        //'Section5_SportsPersonData': '',
        'Section5A_ParticipateEvent': '',
        'Section5B_SportsCategory': '',
        'Section5C_SportsMedal': '',
        'Section6_NCCCertificate': '',
        'Section6A_NCCCertificateCategory': '',
        //'Section7': '',
        'Section7A_RegNo': '',
        'Section7A_RegDate': '',
        'Section7B_NameEmpExchg': '',
        'Section8_HasDL': '',
        'Section8A_LicenseVehicle': '',
        'Section8B_LicenseNo': '',
        'Section8B_LicenseDate': '',
        'Section8C_NameRTOOffice': '',
        'Section9_InvolvedCriminal': '',
        'Section9A_ArrestDetail': '',
        'Section9B_CaseRefNo': '',
        'Section9C_District': '',
        'Section9D_PoliceStationNo': '',
        'Section9E_IPCSection': '',

        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': '',
        //'': ''



    };


    //var datavar = {

    //    'aadhaarNumber': '',
    //    'action': '',
    //    'residentName': $('#FirstName').val(),
    //    'residentNameLocal': $('#FirstName').val(),
    //    'careOf': $('#FatherName').val(),
    //    'careOfLocal': $('#FatherName').val(),
    //    'dateOfBirth': DOBConverted,
    //    'gender': $('#ddlGender').val(),
    //    'phone': $('#phoneno').val(),
    //    'Mobile': $('#MobileNo').val(),
    //    'emailId': $('#EmailID').val(),

    //    'houseNumber': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(),
    //    'houseNumberLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine1']").val(),

    //    'landmark': $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(),
    //    'landmarkLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$LandMark']").val(),

    //    'locality': $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(),
    //    'localityLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$Locality']").val(),

    //    'street': $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(),
    //    'streetLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$RoadStreetName']").val(),

    //    'postOffice': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(),
    //    'postOfficeLocal': $("[name='ctl00$ContentPlaceHolder1$Address1$AddressLine2']").val(),

    //    'responseCode': '',
    //    'language': '1',

    //    'state': $('#ContentPlaceHolder1_Address1_ddlState option:selected').text(),
    //    'stateLocal': $('#ContentPlaceHolder1_Address1_ddlState option:selected').text(),
    //    'district': $('#ContentPlaceHolder1_Address1_ddlDistrict option:selected').text(),
    //    'districtLocal': $('#ContentPlaceHolder1_Address1_ddlDistrict option:selected').text(),
    //    'subDistrict': $('#ContentPlaceHolder1_Address1_ddlTaluka option:selected').text(),
    //    'subDistrictLocal': $('#ContentPlaceHolder1_Address1_ddlTaluka option:selected').text(),
    //    'Village': $('#ContentPlaceHolder1_Address1_ddlVillage option:selected').text(),
    //    'pincode': $('#ContentPlaceHolder1_Address1_PinCode').val(),
    //    'pincodeLocal': $('#ContentPlaceHolder1_Address1_PinCode').val(),

    //    //'Image': obj["photo"],
    //    'Image': $('#ContentPlaceHolder1_HFb64').val(),
    //    'phouseNumber': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine1']").val(),
    //    'plandmark': $("[name='ctl00$ContentPlaceHolder1$Address2$LandMark']").val(),
    //    'plocality': $("[name='ctl00$ContentPlaceHolder1$Address2$Locality']").val(),
    //    'pstreet': $("[name='ctl00$ContentPlaceHolder1$Address2$RoadStreetName']").val(),
    //    'ppincode': $("[name='ctl00$ContentPlaceHolder1$Address2$PinCode']").val(),
    //    'ppostOffice': $("[name='ctl00$ContentPlaceHolder1$Address2$AddressLine2']").val(),

    //    'pstate': $('#ContentPlaceHolder1_Address2_ddlState').val(),
    //    'pdistrict': $('#ContentPlaceHolder1_Address2_ddlDistrict').val(),
    //    'psubDistrict': $('#ContentPlaceHolder1_Address2_ddlTaluka').val(),
    //    'pvillage': $('#ContentPlaceHolder1_Address2_ddlVillage').val(),

    //    'JSONData': '',
    //    'CitizenProfileID': $('#ContentPlaceHolder1_HFProfileID').val(),

    //    'statecode': $('#ContentPlaceHolder1_Address1_ddlState').val(),
    //    'districtcode': $('#ContentPlaceHolder1_Address1_ddlDistrict').val(),
    //    'subDistrictcode': $('#ContentPlaceHolder1_Address1_ddlTaluka').val(),
    //    'Villagecode': $('#ContentPlaceHolder1_Address1_ddlVillage').val(),
    //};

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/g2c/Forms/OISF.aspx/InsertData',
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
              
                alert("Application submitted successfully. Reference ID : " + obj.AppID + " Please attach necessary document.");
                window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=' + svcid + '&AppID=' + obj.AppID;

            }

            //alert("Basic detail saved from Aadhaar.");
            //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

        });// end of Then function of main Data Insert Function

    return false;
}