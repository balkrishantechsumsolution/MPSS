$(document).ready(function () {




    //$('#side-menu1').hide();
    //$('#pnlMenu').hide();
    //$('#page-wrapper').css("margin", "0 auto");
    //$('#Age').attr("readonly", true);
    $('#DOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {

            //var Age = calcDobAge(date);
            var Age = calcExSerDur(date, '01/01/2016');
            $('#Age').val(Age.years);

            $("#Year").val(Age.years);
            $("#Month").val(Age.months);
            $("#Day").val(Age.days);

            //if (Age < 18) {
            //    $('#DOB').val('');
            //    alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
            //    $('#Age').val('');
            //    return false;
            //} else if (Age > 23) {
            //    $('#Age').val('');
            //    alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 23 years.');
            //    $('#Age').val('');
            //    return false;
            //}
        }
    });

    $('#txtTotalMarks').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });


    $('#txtMarkSecure').change(function () {

        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    //$('#txtDOB').datepicker({
    //    dateFormat: "dd/mm/yy",
    //    changeMonth: true,
    //    changeYear: true,
    //    maxDate: '-1d',
    //    yearRange: "-150:+0",
    //    onSelect: function (date) {
    //        // Add validations
    //        //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
    //    }
    //});

    $('#txtRndDrtinstrt').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            var durn = calcExSerDur(date, $('#txtRndDrtinend').val());

            if (durn != null) {

                if (durn.years < 0) return false;
                if (durn.months < 0) return false;
                if (durn.days < 0) return false;

                $("#SevsYear").val(durn.years);
                $("#SevsMonth").val(durn.months);
                $("#SevsDay").val(durn.days);
            }

        }
    });

    $('#txtRndDrtinend').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);

            if (durn != null) {

                if (durn.years < 0) return false;
                if (durn.months < 0) return false;
                if (durn.days < 0) return false;

                $("#SevsYear").val(durn.years);
                $("#SevsMonth").val(durn.months);
                $("#SevsDay").val(durn.days);
            }

        }
    });


    $('#txtRegdte').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });

    $('#txtLicenseDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {
            // Add validations
            //var durn = calcExSerDur($('#txtRndDrtinstrt').val(), date);
        }
    });


    //Section 1
    $("#yes").on('change', function () {
        $("#readOdiya").prop('disabled', false);
        $("#writeOdiya").prop('disabled', false);
        $("#spkOdiya").prop('disabled', false);
    });

    $("#no").on('change', function () {
        $("#readOdiya").prop('disabled', true);
        $("#writeOdiya").prop('disabled', true);
        $("#spkOdiya").prop('disabled', true);


        $("#readOdiya").prop('checked', false);
        $("#writeOdiya").prop('checked', false);
        $("#spkOdiya").prop('checked', false);

    });
    //$("#no").prop('checked', true).trigger('change');


    //Section 2
    $("#Mrd").on('change', function () {
        $("#LvSpse").prop('disabled', false);
        $("#NtLvSpse").prop('disabled', false);
    });

    $("#UnMrd").on('change', function () {
        $("#LvSpse").prop('disabled', true);
        $("#NtLvSpse").prop('disabled', true);

        $("#LvSpse").prop('checked', false);
        $("#NtLvSpse").prop('checked', false);
    });

    //$("#UnMrd").prop('checked', true).trigger('change');


    //Section 3
    $("#exarmyyes").on('change', function () {
        $("#txtRtrmntdte").prop('disabled', false);
        $("#txtRndDrtinstrt").prop('disabled', false);
        $("#txtRndDrtinend").prop('disabled', false);
    });

    $("#exarmyno").on('change', function () {
        $("#txtRtrmntdte").prop('disabled', true);
        $("#txtRndDrtinstrt").prop('disabled', true);
        $("#txtRndDrtinend").prop('disabled', true);

        $("#txtRtrmntdte").val('');
        $("#txtRndDrtinstrt").val('');
        $("#txtRndDrtinend").val('');

        $("#SevsYear").val('');
        $("#SevsMonth").val('');
        $("#SevsDay").val('');


    });


    //$("#exarmyno").prop('checked', true).trigger('change');

    //Section 4


    $("#ddlSports").change(function () {
        if ($('option:selected', this).val() == 999) {
            $("#txtOthrsport").prop('disabled', false);

        }
        else {
            $("#txtOthrsport").prop('disabled', true);
            $("#txtOthrsport").val('');
        }
    });


    $("#sptprsnYes").on('change', function () {
        $("#ddlSports").prop('disabled', false);
        $("#txtOthrsport").prop('disabled', true);
        $("#ddlRxlstnhgt").prop('disabled', false);
        $("#ddlRxlstnchst").prop('disabled', false);
        $("#ddlRxlstnwght").prop('disabled', false);
        $("#dntavlrlxon").prop('checked', true).trigger('change');

    });

    $("#sptprsnNo").on('change', function () {
        $("#ddlSports").prop('disabled', true);
        $("#txtOthrsport").prop('disabled', true);
     
        $("#ddlRxlstnhgt").prop('disabled', true);
        $("#ddlRxlstnchst").prop('disabled', true);
        $("#ddlRxlstnwght").prop('disabled', true);


        $("#txtOthrsport").val('');
        
        $("#ddlSports").val(0);
        $("#ddlRxlstnhgt").val(0);
        $("#ddlRxlstnchst").val(0);
        $("#ddlRxlstnwght").val(0);

        $('input[name="radio4"]').prop('checked', false);
        $('input[name="radio4b"]').prop('checked', false);

    });

    //$("#sptprsnNo").prop('checked', true).trigger('change');


    $("#wntavlrlxon").on('change', function () {
        $("#ddlRxlstnhgt").prop('disabled', false);
        $("#ddlRxlstnchst").prop('disabled', false);
        $("#ddlRxlstnwght").prop('disabled', false);
    });

    $("#dntavlrlxon").on('change', function () {
        $("#ddlRxlstnhgt").prop('disabled', true);
        $("#ddlRxlstnchst").prop('disabled', true);
        $("#ddlRxlstnwght").prop('disabled', true);


        $("#ddlRxlstnhgt").val(0);
        $("#ddlRxlstnchst").val(0);
        $("#ddlRxlstnwght").val(0);
    });


    //$("#dntavlrlxon").prop('checked', true).trigger('change');




    //Section 5



    //Section 6


    $("#HsCerfte").on('change', function () {
        $("#radio6AA").prop('disabled', false);
        $("#radio6AB").prop('disabled', false);
        $("#radio6AC").prop('disabled', false);

    });

    $("#NtHvgCerfte").on('change', function () {
        $("#radio6AA").prop('disabled', true);
        $("#radio6AB").prop('disabled', true);
        $("#radio6AC").prop('disabled', true);

        $("#radio6AA").prop('checked', false);
        $("#radio6AB").prop('checked', false);
        $("#radio6AC").prop('checked', false);

    });

    //$("#NtHvgCerfte").prop('checked', true).trigger('change');

    ////Section 7



    ////Section 8


    $("#rdoDLYes").on('change', function () {
        $("#hvyVeh").prop('disabled', false);
        $("#lgtVeh").prop('disabled', false);
        $("#txtLicenseNo").prop('disabled', false);
        $("#txtLicenseDate").prop('disabled', false);
        $("#txtLicenseOffice").prop('disabled', false);

    });

    $("#rdoDLNo").on('change', function () {
        $("#hvyVeh").prop('disabled', true);
        $("#lgtVeh").prop('disabled', true);

        $("#hvyVeh").prop('checked', false);
        $("#lgtVeh").prop('checked', false);

        $("#txtLicenseNo").prop('disabled', true);
        $("#txtLicenseDate").prop('disabled', true);
        $("#txtLicenseOffice").prop('disabled', true);

        $("#txtLicenseNo").val('');
        $("#txtLicenseDate").val('');
        $("#txtLicenseOffice").val('');

    });

    //$("#rdoDLNo").prop('checked', true).trigger('change');

    ////Section 9


    $("#rdoCrmYes").on('change', function () {
        $("#radio9AA").prop('disabled', false);
        $("#radio9AB").prop('disabled', false);
        $("#txtCriminalRefNo").prop('disabled', false);
        $("#ddlArrestDistrict").prop('disabled', false);
        $("#txtPoliceStationNo").prop('disabled', false);
        $("#txtIPCSection").prop('disabled', false);

    });

    $("#rdoCrmNo").on('change', function () {
        $("#radio9AA").prop('disabled', true);
        $("#radio9AB").prop('disabled', true);

        $("#radio9AA").prop('checked', false);
        $("#radio9AB").prop('checked', false);

        $("#txtCriminalRefNo").prop('disabled', true);
        $("#ddlArrestDistrict").prop('disabled', true);
        $("#txtPoliceStationNo").prop('disabled', true);
        $("#txtIPCSection").prop('disabled', true);


        $("#txtCriminalRefNo").val('');
        $("#ddlArrestDistrict").val(0);

        $("#txtPoliceStationNo").val('');
        $("#txtIPCSection").val('');

    });

    //$("#rdoCrmNo").prop('checked', true).trigger('change');

    //Section Complete




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
    GetStateV2("", "EddlBoardState");//Logic to be activated for Educational State.


    GetDistrict("", "21", "ddlArrestDistrict"); //Implemented in Addressscript.js
    

    $("[name='" + StateControl + "']").bind("change", function (e) { return GetDistrict("", $("[name='" + StateControl + "']").val(), DistrictControl); });
    $("[name='" + DistrictControl + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl, TalukaControl); });
    $("[name='" + TalukaControl + "']").bind("change", function (e) { return GetVillage("", TalukaControl, VillageControl); });

    $("[name='" + StateControl2 + "']").bind("change", function (e) { return GetDistrict("", $("[name='" + StateControl2 + "']").val(), DistrictControl2); });
    $("[name='" + DistrictControl2 + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl2, TalukaControl2); });
    $("[name='" + TalukaControl2 + "']").bind("change", function (e) { return GetVillage("", TalukaControl2, VillageControl2); });

    $("#religion").bind("change", function (e) {

        var CategoryArr = ["SC", "ST", "SEBC", "UR"];
        var CategoryArr2 = ["UR"];

        $("#category").empty();
        $("#category").append('<option value = "0">-Select-</option>');

        if ($("#religion").val() == "Hndu") {
            var arrLen = CategoryArr.length;

            for (i = 0; i < arrLen; i++) {
                $("#category").append('<option value = "' + CategoryArr[i] + '">' + CategoryArr[i] + '</option>');
            }
        }
        else {

            var arrLen = CategoryArr2.length;

            for (i = 0; i < arrLen; i++) {
                $("#category").append('<option value = "' + CategoryArr2[i] + '">' + CategoryArr2[i] + '</option>');
            }
        }


    });

    

    //EL("File1").addEventListener("change", readFile, false);

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });



    ////Start:Temp Logic
    //$('#FirstName').val("Gunwant");
    //$('#MiddleName').val("");
    //$('#LastName').val("Saini");
        
        
    //$('#FatherName').val("Mr. Jag Mohan");
    //$('#FatherName').val("Mr. Jag Mohan");
    //$('#ddlGender').val("M");
    //$('#phoneno').val("01143035379");
    //$('#MobileNo').val("9650020439");
    //$('#EmailID').val("test@test.com");

    //$('#AgeYear').val("32");
    //$('#AgeMonth').val("5");
    //$('#AgeDay').val("10");
    ////$('#Religion').val();
    ////$('#Category').val();
    ////$('#Nationality').val();
    //$('#stdcode').val("011");


    //$("#PAddressLine1").val("Address Line 1");
    //$("#PAddressLine1").val("Address Line 2");

    //$("#PLandMark").val("Landmark");

    //$("#PLocality").val("Locality");

    //$("#PRoadStreetName").val("RoadStreetName");

    //$("#PAddressLine2").val("Address Line 2");

    //$('#PPinCode').val("123456");

    //$("#CAddressLine1").val("Address Line 1");
    //$("#CLandMark").val("Address Line 2");
    //$("#CLocality").val("Locality");
    //$("#CRoadStreetName").val("RoadStreet Name");
    //$("#CPinCode").val("123456");
    //$("#CAddressLine2").val("Address Line 2");
    //End:Temp Logic



});

function calculatepercentage(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;
    if (MarksObtained == "") return;

    if (TotalMarks < MarksObtained) {
        alert("Total Marks must be greater than Marks Obtained");
        $('#txtTotalMarks').val("");
        $('#txtMarkSecure').val("");
        $("#txtPercentage").val("");

        return;
    }

    if (TotalMarks <= 0) TotalMarks = 1;

    var result = (MarksObtained / TotalMarks) * 100;

    $("#txtPercentage").val(result);

}


function calculatepercentage(TotalMarks, MarksObtained) {

    if (TotalMarks == "") return;
    if (MarksObtained == "") return;

    if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
        alert("Total Marks must be greater than Marks Obtained");
        $('#txtTotalMarks').val("");
        $('#txtMarkSecure').val("");
        $("#txtPercentage").val("");

        return;
    }

    if (TotalMarks <= 0) TotalMarks = 1;

    var result = (MarksObtained / TotalMarks) * 100;

    $("#txtPercentage").val(result);

}


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
            EL("HFb64").value = e.target.result;


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





    /*

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
    */

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

    var Section1_PassOdia = $("input[name='radio1']:checked").val();

    if (Section1_PassOdia == null) {
        text += "<br /> -Please choose whether Candidate has passed Odia.";
        opt = 1;
    }

    var Section1_AbililtyRead = 0;
    if ($('#readOdiya').is(":checked")) {
        // it is checked
        Section1_AbililtyRead = 1;
    }

    var Section1_AbilityWrite = 0;
    if ($('#writeOdiya').is(":checked")) {
        // it is checked
        Section1_AbilityWrite = 1;
    }

    var Section1_AbilitySpeak = 0;
    if ($('#spkOdiya').is(":checked")) {
        // it is checked
        Section1_AbilitySpeak = 1;
    }

    if (Section1_AbililtyRead == 0 || Section1_AbilityWrite == 0 || Section1_AbilitySpeak == 0) {
        text += "<br /> -Please choose ability to Odia Language.";
        opt = 1;
    }


    var Section2_Married = $("input[name='radio2']:checked").val();
    if (Section2_Married == null) {
        text += "<br /> -Please choose whether Candidate is married or not.";
        opt = 1;
    }

    var Section2A_MoreThanOneSpouse = $("input[name='radio2a']:checked").val();

    var Section3_ExServiceMan = $("input[name='radio3']:checked").val();
    if (Section3_ExServiceMan == null) {
        text += "<br /> -Please choose whether Candidate is Ex-Serviceman or not.";
        opt = 1;
    }



    var Section3A_ServiceRendered = $("#txtRtrmntdte").val();
    var Section3B_ServiceDurationFrom = $("#txtRndDrtinstrt").val();
    var Section3B_ServiceDurationTo = $("#txtRndDrtinend").val();
    var Section3C_ServiceYear = $("#SevsYear").val();
    var Section3C_ServiceMonth = $("#SevsMonth").val();
    var Section3C_ServiceDay = $("#SevsDay").val();

    if (Section3_ExServiceMan == "yes") {

        if (Section3B_ServiceDurationFrom == "" || Section3B_ServiceDurationTo == "") {
            text += "<br /> -Please Enter the duration of service rendered.";
            opt = 1;

        }

    }


    //Section 4
    var Section4_IsSportsPerson = $("input[name='radio4']:checked").val();
    var Section4A_SportsParticipated = $("#ddlSports option:selected").text();
    var Section4B_SportsOthers = $("#txtOthrsport").val();
    var Section4B_WantsRelaxation = $("input[name='radio4b']:checked").val();

    var Section4B_RelaxationHeight = $("#ddlRxlstnhgt option:selected").text();
    var Section4B_RelaxationChest = $("#ddlRxlstnchst option:selected").text();
    var Section4B_RelaxationWeight = $("#ddlRxlstnwght option:selected").text();

    if (Section4_IsSportsPerson == null) {
        text += "<br /> -Please choose whether Candidate is Sports Person or not.";
        opt = 1;
    }

    if (Section4_IsSportsPerson == "yes") {
        if (Section4A_SportsParticipated != null && (Section4A_SportsParticipated == '' || Section4A_SportsParticipated == 'List of Sports')) {
            text += "<br /> -Please choose List of Sports Event the candidate participated in.";
            opt = 1;
        }

        if (Section4A_SportsParticipated != null && (Section4A_SportsParticipated == 'Others')) {

            if (Section4B_SportsOthers == "") {
                text += "<br /> -Please enter Sports Event the candidate participated in.";
                opt = 1;

            }

        }

        
        if (Section4B_RelaxationHeight == null) {
            text += "<br /> -Please choose whether Candidate wants to avail ralaxation in height, weight & chest.";
            opt = 1;
        }

        if (Section4B_RelaxationHeight == "yes") {

            if (Section4B_RelaxationHeight != null && (Section4B_RelaxationHeight == '' || Section4B_RelaxationHeight == 'Select')) {
                text += "<br /> -Please select Height in Physical Standards of Measurement.";
                opt = 1;
            }

            if (Section4B_RelaxationChest != null && (Section4B_RelaxationChest == '' || Section4B_RelaxationChest == 'Select')) {
                text += "<br /> -Please select Chest in Physical Standards of Measurement.";
                opt = 1;
            }

            if (Section4B_RelaxationWeight != null && (Section4B_RelaxationWeight == '' || Section4B_RelaxationWeight == 'Select')) {
                text += "<br /> -Please select Weight in Physical Standards of Measurement.";
                opt = 1;
            }

        }

    }

    //Section 5
    var Section5A_ParticipateEvent = $("#ddlSports2 option:selected").text();
    if (Section5A_ParticipateEvent != null && (Section5A_ParticipateEvent == '' || PreVillage == 'List of Sports')) {
        text += "<br /> -Please choose List of Sports Event the candidate participated in.";
        opt = 1;
    }


    var Section5B_SportsCategory = $("input[name='radio5b']:checked").val();
    if (Section5B_SportsCategory == null) {
        text += "<br /> -Please choose List of Sports Category the candidate participated in.";
        opt = 1;
    }
    var Section5C_SportsMedal = $("input[name='radio5C']:checked").val();

    //Section 6
    var Section6_NCCCertificate = $("input[name='radio6']:checked").val();
    var Section6A_NCCCertificateCategory = $("input[name='radio6A']:checked").val();

    if (Section6_NCCCertificate == null) {
        text += "<br /> -Please choose whether candidate possess NCC Certificate or not.";
        opt = 1;
    }

    if (Section6_NCCCertificate == "yes") {
        if (Section6A_NCCCertificateCategory == null) {
            text += "<br /> -Please choose category of NCC Certificate.";
            opt = 1;
        }
    }

    //Section 7
    var Section7A_RegNo = $("#txtRegNo").val();
    var Section7A_RegDate = $("#txtRegdte").val();
    var Section7B_NameEmpExchg = $("#txtNmeEmpEx").val();

    if (Section7A_RegNo == "" || Section7A_RegDate == "") {
        text += "<br /> -Please enter Employment Exchange Registration Number and Date.";
        opt = 1;
    }

    if (Section7B_NameEmpExchg == "") {
        text += "<br /> -Please enter Employment Exchange Name.";
        opt = 1;
    }

    //Section 8
    var Section8_HasDL = $("input[name='radio8']:checked").val();

    var Section8A_LicenseVehicle = $("input[name='radio8A']:checked").val();
    var Section8B_LicenseNo = $("#txtLicenseNo").val();

    var Section8B_LicenseDate = $("#txtLicenseDate").val();
    var Section8C_NameRTOOffice = $("#txtLicenseOffice").val();

    if (Section8_HasDL == null) {
        text += "<br /> -Please choose whether candidate possess Driving License with validity for atleast 1 year.";
        opt = 1;
    }

    if (Section8_HasDL == "yes") {

        if (Section8A_LicenseVehicle == null) {
            text += "<br /> -Please choose whether Driving License is applicable for Heavy Vehicle or Light vehicle.";
            opt = 1;

        }

        if (Section8B_LicenseNo == "" || Section8B_LicenseDate == "") {
            text += "<br /> -Please enter License Number and Date.";
            opt = 1;
        }

        if (Section8C_NameRTOOffice == "") {
            text += "<br /> -Please enter Name of RTO Office.";
            opt = 1;
        }

    }

    //Section 9
    var Section9_InvolvedCriminal = $("input[name='radio9']:checked").val();

    var Section9A_ArrestDetail = $("input[name='radio9A']:checked").val();

    var Section9B_CaseRefNo = $("#txtCriminalRefNo").val();
    var Section9C_District = $("#ddlArrestDistrict").val();
    var Section9D_PoliceStationNo = $("#txtPoliceStationNo").val();
    var Section9E_IPCSection = $("#txtIPCSection").val();


    if (Section9_InvolvedCriminal == null) {
        text += "<br /> -Please choose whether candidate is involved in Criminal Case.";
        opt = 1;
    }

    if (Section9_InvolvedCriminal == "yes") {
        if (Section9A_ArrestDetail == null) {
            text += "<br /> -Please choose whether candidate is involved in Criminal Case.";
            opt = 1;
        }

        if (Section9B_CaseRefNo == "") {
            text += "<br /> -Please enter details of Case Reference No.";
            opt = 1;
        }

        if (Section9C_District != null && (Section9C_District == '' || Section9C_District == '-Select-')) {
            text += "<br /> -Please choose List of Sports Event the candidate participated in.";
            opt = 1;
        }

        if (Section9D_PoliceStationNo == "") {
            text += "<br /> -Please enter details of Police Station.";
            opt = 1;
        }

        if (Section9E_IPCSection == "") {
            text += "<br /> -Please enter details of IPC Section.";
            opt = 1;
        }

    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        //alert(text);
        return false;
    }


    return true;

}


function date_by_subtracting_days(date, days) {
    return new Date(
        date.getFullYear(),
        date.getMonth(),
        date.getDate() - days,
        date.getHours(),
        date.getMinutes(),
        date.getSeconds(),
        date.getMilliseconds()
    );
}

function AssignDataValues(JSONData) {



    var obj = jQuery.parseJSON(JSONData);


    $("#FirstName").val(obj["FirstName"]);
    $("#MiddleName").val(obj["MiddleName"]);
    $("#LastName").val(obj["LastName"]);
    $("#FatherName").val(obj["careOf"]);
    $("#FatherName").val(obj["careOfLocal"]);
    $("#DOBConverted").val(obj["dateOfBirth"]);
    $('#AgeYear').val(obj["AgeYear"]);//AgeYear
    $("#AgeMonth").val(obj["AgeMonth"]);
    $("#AgeDay").val(obj["AgeDay"]);
    $("#gender").val(obj["ddlGender"]);
    $("#Religion").val(obj["Religion"]);
    $("#Category").val(obj["Category"]);
    $("#Nationality").val(obj["Nationality"]);
    $("#EmailID").val(obj["emailId"]);
    $("#MobileNo").val(obj["Mobile"]);
    $("#stdcode").val(obj["stdcode"]);
    $("#phoneno").val(obj["phone"]);
    $("#PAddressLine1").val(obj["houseNumber"]);//?
    $("#PAddressLine1").val(obj["houseNumberLocal"]);
    $("#PLandMark").val(obj["landmark"]);//?
    $("#PLandMark").val(obj["landmarkLocal"]);//?
    $("#PLocality").val(obj["locality"]);//?
    $("#PLocality").val(obj["localityLocal"]);//?
    $("#PRoadStreetName").val(obj["street"]);//?
    $("#PRoadStreetName").val(obj["streetLocal"]);//?
    $("#PAddressLine2").val(obj["postOffice"]);//?
    $("#PAddressLine2").val(obj["postOfficeLocal"]);//?

    $("#PddlState").val(obj["state"]);//?
    $("#PddlState").val(obj["stateLocal"]);//?
    $("#PddlDistrict").val(obj["districtLocal"]);//?
    $("#PddlTaluka").val(obj["subDistrictLocal"]);//?
    $("#PddlVillage").val(obj["Village"]);//?
    $("#PPinCode").val(obj["pincode"]);//?
    $("#PPinCode").val(obj["pincodeLocal"]);//?

    $("#ContentPlaceHolder1_HFb64").val(obj["Image"]);//?
    $("#CAddressLine1").val(obj["phouseNumber"]);//?
    $("#CLandMark").val(obj["plandmark"]);//?
    $("#CLocality").val(obj["plocality"]);//?
    $("#CRoadStreetName").val(obj["pstreet"]);//?
    $("#CPinCode").val(obj["ppincode"]);//?
    $("#CAddressLine2").val(obj["ppostOffice"]);//?

    $("#CddlState").val(obj["pstate"]);//?
    $("#CddlDistrict").val(obj["pdistrict"]);//?
    $("#CddlTaluka").val(obj["psubDistrict"]);//?
    $("#CddlVillage").val(obj["pvillage"]);//?

    $("#Section1_PassOdia").val(obj["Section1_PassOdia"]);
    $("#Section1_AbililtyRead").val(obj["Section1_AbililtyRead"]);
    $("#Section1_AbilityWrite").val(obj["Section1_AbilityWrite"]);
    $("#Section1_AbilitySpeak").val(obj["Section1_AbilitySpeak"]);

    $("#Section2_Married").val(obj["Section2_Married"]);
    $("#Section2A_MoreThanOneSpouse").val(obj["Section2A_MoreThanOneSpouse"]);

    $("#Section3_ExServiceMan").val(obj["Section3_ExServiceMan"]);

    $("#Section3A_ServiceRendered").val(obj["Section3A_ServiceRendered"]);

    $("#Section3B_ServiceDuration").val(obj["Section3B_ServiceDuration"]);
    $("#Section3B_ServiceDurationFrom").val(obj["Section3B_ServiceDurationFrom"]);
    $("#Section3B_ServiceDurationTo").val(obj["Section3B_ServiceDurationTo"]);

    $("#Section3C_ServiceYear").val(obj["Section3C_ServiceYear"]);
    $("#Section3C_ServiceMonth").val(obj["Section3C_ServiceMonth"]);
    $("#Section3C_ServiceDay").val(obj["Section3C_ServiceDay"]);

    $("#Section4_IsSportsPerson").val(obj["Section4_IsSportsPerson"]);
    $("#Section4A_SportsParticipated").val(obj["Section4A_SportsParticipated"]);
    $("#Section4B_SportsOthers").val(obj["Section4B_SportsOthers"]);
    $("#Section4B_WantsRelaxation").val(obj["Section4B_WantsRelaxation"]);

    $("#Section5A_ParticipateEvent").val(obj["Section5A_ParticipateEvent"]);
    $("#Section5B_SportsCategory").val(obj["Section5B_SportsCategory"]);
    $("#Section5C_SportsMedal").val(obj["Section5C_SportsMedal"]);

    $("#Section6_NCCCertificate").val(obj["Section6_NCCCertificate"]);
    $("#Section6A_NCCCertificateCategory").val(obj["Section6A_NCCCertificateCategory"]);

    $("#Section7A_RegNo").val(obj["Section7A_RegNo"]);
    $("#Section7A_RegDate").val(obj["Section7A_RegDate"]);
    $("#Section7B_NameEmpExchg").val(obj["Section7B_NameEmpExchg"]);

    $("#Section8_HasDL").val(obj["Section8_HasDL"]);
    $("#Section8A_LicenseVehicle").val(obj["Section8A_LicenseVehicle"]);
    $("#Section8B_LicenseNo").val(obj["Section8B_LicenseNo"]);
    $("#Section8B_LicenseDate").val(obj["Section8B_LicenseDate"]);
    $("#Section8C_NameRTOOffice").val(obj["Section8C_NameRTOOffice"]);

    $("#Section9_InvolvedCriminal").val(obj["Section9_InvolvedCriminal"]);
    $("#Section9A_ArrestDetail").val(obj["Section9A_ArrestDetail"]);
    $("#Section9B_CaseRefNo").val(obj["Section9B_CaseRefNo"]);
    $("#Section9C_District").val(obj["Section9C_District"]);
    $("#Section9D_PoliceStationNo").val(obj["Section9D_PoliceStationNo"]);
    $("#Section9E_IPCSection").val(obj["Section9E_IPCSection"]);




    return false;
}


Date.isLeapYear = function (year) {
    return (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0));
};

Date.getDaysInMonth = function (year, month) {
    return [31, (Date.isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][month];
};

Date.prototype.isLeapYear = function () {
    return Date.isLeapYear(this.getFullYear());
};

Date.prototype.getDaysInMonth = function () {
    return Date.getDaysInMonth(this.getFullYear(), this.getMonth());
};

Date.prototype.addMonths = function (value) {
    var n = this.getDate();
    this.setDate(1);
    this.setMonth(this.getMonth() + value);
    this.setDate(Math.min(n, this.getDaysInMonth()));
    return this;
};


function pad(n, width, z) {
    z = z || '0';
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return;
    }


    $("#btnSubmit").prop('disabled', true);
    var t_Message = "";
    var result = false;
    //t_Message = "Please confirm to proceed.";

    //if (confirm(t_Message)) {
    //    result = true;
    //}

    //if (!result) return false;

    var DOB = $("#DOB");

    if (DOB.val() != '') {


        /*

        var Age = calcDobAge(date);
                    $('#Age').val(Age.years);

                    $("#Year").val(Age.years);
                    $("#Month").val(Age.months);
                    $("#Day").val(Age.days);

                    if (Age < 18) {
                        $('#DOB').val('');
                        alertPopup("Please fill following information.", 'To fill the application applicant age should be 18 years.');
                        $('#Age').val('');
                        return false;
                    } else if (Age > 23) {
                        $('#Age').val('');
                        alertPopup("Please fill following information.", 'To fill the application applicant age should be less than 23 years.');
                        $('#Age').val('');
                        return false;
                    }

        */

        var txtDOB = DOB.val();
        var dateDOB = new Date(txtDOB.substr(6, 4), txtDOB.substr(3, 2) - 1, txtDOB.substr(0, 2));
        var Age = calcExSerDur(txtDOB, '01/01/2016');
        var minAge = 18;
        var maxAge = 23;
        var ageToCompare = Age.years;

        if ($('#category').val() == "UR") {

        }
        else if ($('#category').val() == "SC" || $('#category').val() == "ST") {
            maxAge = 28;
        }

        var startDate = $('#txtRndDrtinstrt').val();
        var endDate = $('#txtRndDrtinend').val();

        if (startDate != "" && endDate != "") {         

            if ($("#DOB").datepicker("getDate") >= $("#txtRndDrtinstrt").datepicker("getDate")) {
                alert('Qualifying Service Duration must be greater than Date of Birth');
                $("#txtRndDrtinstrt").val("");
            }

            if ($("#DOB").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
                alert('Qualifying Service Duration must be greater than Date of Birth');
                $("#txtRndDrtinend").val("");
            }

            if ($("#txtRndDrtinstrt").datepicker("getDate") >= $("#txtRndDrtinend").datepicker("getDate")) {
                alert('Qualifying Service To Date must be greater than From Date');
                $("#txtRndDrtinend").val("");
            }

            //var startDate2 = new Date(startDate.substr(6, 4), startDate.substr(3, 2) - 1, startDate.substr(0, 2));
            //var endDate2 = new Date(endDate.substr(6, 4), endDate.substr(3, 2) - 1, endDate.substr(0, 2));

            //var oneDay = 24 * 60 * 60 * 1000; // hours*minutes*seconds*milliseconds
            //var firstDate = startDate2; //new Date(2008, 01, 12);
            //var secondDate = endDate2; //new Date(2008, 01, 22);

            //var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime()) / (oneDay)));


            var durn = calcExSerDur(startDate, endDate);

            if (durn != null) {                

                if (durn.years > 0) dateDOB.setFullYear(dateDOB.getFullYear() + durn.years);
                if (durn.months > 0) {
                    dateDOB = dateDOB.addMonths(durn.months);
                }
                if (durn.days > 0) {
                    dateDOB.setDate(dateDOB.getDate() + durn.days);
                }

               
                //alert(dateDOB);


                var newDate = pad(dateDOB.getDate().toString(), 2) + "/" + pad(dateDOB.getMonth().toString(), 2) + "/" + dateDOB.getFullYear().toString();

                var Age = calcExSerDur(newDate, '01/01/2016');
                //alert(Age.years);
                //alert(Age.months);
                //alert(Age.days);
                ageToCompare = Age.years;

            }


            //var ServicesDate = dateDOB.setDate(dateDOB.getDate() - diffDays);
            //var ServicesDate = dateDOB.getDate() - diffDays;

            //alert(ServicesDate);
            //var Age = calcExSerDur(txtDOB, ServicesDate);
            //alert(Age);
        }

        var text = "";
        var check = false;
        var opt = 0;
        if (ageToCompare < minAge) {
            //$('#DOB').val('');
            text += "<br /> -Applicant age should be 18 years. ";
            //$("#Year").val('');
            //$("#Month").val('');
            //$("#Day").val('');


            opt = 1;
        } else if (ageToCompare > maxAge) {

            //if ($("#Month").val() == 0) {
               
            //}
            //else {
            //    check = true;
            //}

            //if ($("#Day").val() == 0) {

            //}
            //else {
            //    check = true;
            //}

            check = true;

            if (check) {
                //$('#DOB').val('');
                text += "<br /> -Applicant age should be less than " + maxAge + " years. ";
                //$("#Year").val('');
                //$("#Month").val('');
                //$("#Day").val('');
                opt = 1;

            }

        }

        //alertPopup("Eligibility criteria for submitting application.", text);

        if (opt == 1) {
            t_Message = "As per Govt. Notification, you are not eligible for the Application. Do you want to submit your application?";

            if (confirm(t_Message)) {
                result = true;
            }

        }
        else {
            t_Message = "As per Govt. Notification, you are eligible for the Application. Please confirm to Proceed.";
            alert(t_Message);
            result = true;
        }


        if (!result) {
            $("#btnSubmit").prop('disabled', false);
            return false;

        }

        
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

    var Section1_PassOdia = $("input[name='radio1']:checked").val();
    var Section1_AbililtyRead = 0;
    if ($('#readOdiya').is(":checked")) {
        // it is checked
        Section1_AbililtyRead = 1;
    }
        
    var Section1_AbilityWrite = 0;
    if ($('#writeOdiya').is(":checked")) {
        // it is checked
        Section1_AbilityWrite = 1;
    }

    var Section1_AbilitySpeak = 0;
    if ($('#spkOdiya').is(":checked")) {
        // it is checked
        Section1_AbilitySpeak = 1;
    }


    var Section2_Married = $("input[name='radio2']:checked").val();
    var Section2A_MoreThanOneSpouse = $("input[name='radio2a']:checked").val();

    var Section3_ExServiceMan = $("input[name='radio3']:checked").val();
    var Section3A_ServiceRendered = $("#txtRtrmntdte").val();
    var Section3B_ServiceDurationFrom = $("#txtRndDrtinstrt").val();
    var Section3B_ServiceDurationTo = $("#txtRndDrtinend").val();
    var Section3C_ServiceYear = $("#SevsYear").val();
    var Section3C_ServiceMonth = $("#SevsMonth").val();
    var Section3C_ServiceDay = $("#SevsDay").val();

    var Section4_IsSportsPerson = $("input[name='radio4']:checked").val();
    var Section4A_SportsParticipated = $("#ddlSports option:selected").text();
    var Section4B_SportsOthers = $("#txtOthrsport").val();
    var Section4B_WantsRelaxation = $("input[name='radio4b']:checked").val();

    var Section4B_RelaxationHeight = $("#ddlRxlstnhgt option:selected").text();
    var Section4B_RelaxationChest = $("#ddlRxlstnchst option:selected").text();
    var Section4B_RelaxationWeight = $("#ddlRxlstnwght option:selected").text();

    var Section5A_ParticipateEvent = $("#ddlSports2 option:selected").text();
    var Section5B_SportsCategory = $("input[name='radio5b']:checked").val();
    var Section5C_SportsMedal = $("input[name='radio5C']:checked").val();

    var Section6_NCCCertificate = $("input[name='radio6']:checked").val();
    var Section6A_NCCCertificateCategory = $("input[name='radio6A']:checked").val();

    var Section7A_RegNo = $("#txtRegNo").val();
    var Section7A_RegDate = $("#txtRegdte").val();
    var Section7B_NameEmpExchg = $("#txtNmeEmpEx").val();

    var Section8_HasDL = $("input[name='radio8']:checked").val();
    var Section8A_LicenseVehicle = $("input[name='radio8A']:checked").val();
    var Section8B_LicenseNo = $("#txtLicenseNo").val();
    var Section8B_LicenseDate = $("#txtLicenseDate").val();
    var Section8C_NameRTOOffice = $("#txtLicenseOffice").val();

    var Section9_InvolvedCriminal = $("input[name='radio9']:checked").val();
    var Section9A_ArrestDetail = $("input[name='radio9A']:checked").val();
    var Section9B_CaseRefNo = $("#txtCriminalRefNo").val();
    var Section9C_District = $("#ddlArrestDistrict").val();
    var Section9D_PoliceStationNo = $("#txtPoliceStationNo").val();
    var Section9E_IPCSection = $("#txtIPCSection").val();


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
        'Village': $('#PddlVillage').val(),
        'pincode': $('#PPinCode').val(),
        'pincodeLocal': $('#PPinCode').val(),

        //'Image': obj["photo"],
        'Image': $('#HFb64').val(),
        'phouseNumber': $("#CAddressLine1").val(),
        'plandmark': $("#CLandMark").val(),
        'plocality': $("#CLocality").val(),
        'pstreet': $("#CRoadStreetName").val(),
        'ppincode': $("#CPinCode").val(),
        'ppostOffice': $("#CAddressLine2").val(),

        'pstate': $('#CddlState').val(),
        'pdistrict': $('#CddlDistrict').val(),
        'psubDistrict': $('#CddlTaluka').val(),
        'pvillage': $('#CddlVillage').val(),

        'JSONData': '',
        'statecode': $('#CddlState').val(),
        'districtcode': $('#CddlDistrict').val(),
        'subDistrictcode': $('#CddlTaluka').val(),
        'Villagecode': $('#CddlVillage').val(),

        'Religion':Religion,
        'Category':Category,
        'Nationality':Nationality,

        'Section1_PassOdia': Section1_PassOdia,
        'Section1_AbililtyRead': Section1_AbililtyRead,
        'Section1_AbilityWrite': Section1_AbilityWrite,
        'Section1_AbilitySpeak': Section1_AbilitySpeak,
        'Section2_Married': Section2_Married,
        'Section2A_MoreThanOneSpouse': Section2A_MoreThanOneSpouse,
        'Section3_ExServiceMan': Section3_ExServiceMan,
        'Section3A_ServiceRendered': Section3A_ServiceRendered,
        //'Section3B_ServiceDuration': Section3B_ServiceDuration,
        'Section3B_ServiceDurationFrom': Section3B_ServiceDurationFrom,
        'Section3B_ServiceDurationTo': Section3B_ServiceDurationTo,
        'Section3C_ServiceYear': Section3C_ServiceYear,
        'Section3C_ServiceMonth': Section3C_ServiceMonth,
        'Section3C_ServiceDay': Section3C_ServiceDay,
        'Section4_IsSportsPerson': Section4_IsSportsPerson,
        'Section4A_SportsParticipated': Section4A_SportsParticipated,
        'Section4B_SportsOthers': Section4B_SportsOthers,
        'Section4B_WantsRelaxation': Section4B_WantsRelaxation,
        'Section4B_RelaxationHeight': Section4B_RelaxationHeight,
        'Section4B_RelaxationChest':Section4B_RelaxationChest,
        'Section4B_RelaxationWeight':Section4B_RelaxationWeight,
        //'Section5_SportsPersonData': '',
        'Section5A_ParticipateEvent': Section5A_ParticipateEvent,
        'Section5B_SportsCategory': Section5B_SportsCategory,
        'Section5C_SportsMedal': Section5C_SportsMedal,
        'Section6_NCCCertificate': Section6_NCCCertificate,
        'Section6A_NCCCertificateCategory': Section6A_NCCCertificateCategory,
        //'Section7': '',
        'Section7A_RegNo': Section7A_RegNo,
        'Section7A_RegDate': Section7A_RegDate,
        'Section7B_NameEmpExchg': Section7B_NameEmpExchg,
        'Section8_HasDL': Section8_HasDL,
        'Section8A_LicenseVehicle': Section8A_LicenseVehicle,
        'Section8B_LicenseNo': Section8B_LicenseNo,
        'Section8B_LicenseDate': Section8B_LicenseDate,
        'Section8C_NameRTOOffice': Section8C_NameRTOOffice,
        'Section9_InvolvedCriminal': Section9_InvolvedCriminal,
        'Section9A_ArrestDetail': Section9A_ArrestDetail,
        'Section9B_CaseRefNo': Section9B_CaseRefNo,
        'Section9C_District': Section9C_District,
        'Section9D_PoliceStationNo': Section9D_PoliceStationNo,
        'Section9E_IPCSection': Section9E_IPCSection,

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
            url: '/WebApp/Kiosk/OISF/OISFForm.aspx/InsertData',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#btnSubmit").prop('disabled', false);
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
                window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=388&AppID=' + obj.AppID;

            }

            //alert("Basic detail saved from Aadhaar.");
            //    window.location.href = url + '?UID=' + AppID + '&SvcID=' + svcid + '&DPT=' + dpt + '&DIST=' + dist + '&BLK=' + blk + '&PAN=' + pan + '&OFC=' + ofc + '&OFR=' + ofr;

        });// end of Then function of main Data Insert Function

    return false;
}

function AddEducation(DeleteString) {
    return false;
    if (validateValues(DeleteString) == true) {
        var strProduct = "";
        var strSaveProduct = "";
        var Appid = "";
        var strTempString = "";


        var stateVal = "";
        var stateText = "";
        var NameOfExamination = "";
        var PassingYear = "";
        var NameOfBoardVal = "";
        var NameOfBoardText = "";
        var Division = "";
        var Total = "";
        var Marks = "";
        var Percentage = "";


        stateVal = $("#EddlBoardState").val();
        stateText = $("#EddlBoardState option:selected").text();

        NameOfExamination = $("#txtExmntnName").val();

        PassingYear = $("#txtPssngYr").val();
        NameOfBoardVal = $("#ddlBoard").val();
        NameOfBoardText = $("#ddlBoard option:selected").text();
        Division = $("#txtDivision").val();
        Total = $("#txtTotalMarks").val();
        Marks = $("#txtMarkSecure").val();
        Percentage = "";


        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {


            strTempString = "#" + SrNo + "," + strIngredient + "," + strMonographID + "," + strMonograph + "," + strOtherMonograph + "," + strStrength + "," + strUnit + "#";

        }
        else {
            strTempString = document.getElementById("<%=hdfProduct.ClientID %>").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblProduct' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Name of Active Ingredient</th>";
        Str = Str + "<th style='text-align: center;'>Pharmacopoeial Monograph</th>";
        Str = Str + "<th style='text-align: center;'>Strength</th>";
        Str = Str + "<th style='text-align: center;'>Strength Unit</th>";
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
            strIngredient = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strMonographID = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strMonograph = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strOtherMonograph = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strStrength = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strUnit = RemStr;

            var DeleteString = "#" + SrNo + "," + strIngredient + "," + strMonographID + "," + strMonograph + "," + strOtherMonograph + "," + strStrength + "," + strUnit + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strIngredient + "</td>";
            if (strMonographID == 'Other')
                Str = Str + "<td style='' >" + strMonograph + " (" + strOtherMonograph + ") </td>";
            else
                Str = Str + "<td style='' >" + strMonograph + "</td>";

            Str = Str + "<td style='' >" + strStrength + "</td>";
            Str = Str + "<td style='' >" + strUnit + "</td>";


            Str = Str + "<td align='center'><img src='/Quick Links/FDA/Images/NotVerified.png' style='cursor:pointer;padding-top: 5px;text-align:center;' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strProduct = strProduct + "#" + SrNo + "," + strIngredient + "," + strMonographID + "," + strMonograph + "," + strOtherMonograph + "," + strStrength + "," + strUnit + "#";

            strSaveProduct = strSaveProduct + "#" + SrNo + "," + strIngredient + "," + strMonographID + "," + strMonograph + "," + strOtherMonograph + "," + strStrength + "," + strUnit + "#";

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divProduct').innerHTML = Str;
        document.getElementById("<%=hdfProduct.ClientID %>").value = strProduct;
        document.getElementById("<%=hdfProductSave.ClientID %>").value = strSaveProduct;
        document.getElementById("<%=hdfProdString.ClientID %>").value = intCount;

        document.getElementById('<%=ddlPharmacopoeialMonograph.ClientID %>').selectedIndex = 0;
        $("#txtOtherPharmacopoeialMonograph").hide();
        $("#lblOtherPharmacopoeialMonograph").hide();
        $("#divOtherPhar").hide();
        document.getElementById('<%=txtNameofIngredient.ClientID %>').value = "";
        document.getElementById('<%=txtOtherPharmacopoeialMonograph.ClientID %>').value = "";
        document.getElementById('<%=txtStrength.ClientID %>').value = "";
        document.getElementById('<%=txtStrengthUnit.ClientID %>').value = "";

        document.getElementById('<%=txtNameofIngredient.ClientID %>').focus();

    }
}

function DeleteEducation(DeleteString) {
    return false;
    var Msg = "Do you want remove this Qualification?";

    if (confirm(Msg)) {
        
        AddEducation(DeleteString);
    }
}

function validateValues(DeleteString) {

    if (DeleteString != '') {
        return true;
    }

    var strMsg = "";
    var isError = false;


    var stateVal = "";
    var stateText = "";
    var NameOfExamination = "";
    var PassingYear = "";
    var NameOfBoardVal = "";
    var NameOfBoardText = "";
    var Division = "";
    var Total = "";
    var Marks = "";
    var Percentage = "";


    stateVal = $("#EddlBoardState").val();
    stateText = $("#EddlBoardState option:selected").text();

    NameOfExamination = $("#txtExmntnName").val();

    PassingYear = $("#txtPssngYr").val();
    NameOfBoardVal = $("#ddlBoard").val();
    NameOfBoardText = $("#ddlBoard option:selected").text();
    Division = $("#txtDivision").val();
    Total = $("#txtTotalMarks").val();
    Marks = $("#txtMarkSecure").val();
    Percentage = "";
    
    if (stateText != null && (stateText == '' || stateText == '-Select-')) {
        text += "<br /> -Please select State in Educational Qualifications.";
        isError = true;
    }

    if (NameOfExamination == '') {
        text += "<br /> -Please enter Examination Passed. ";
        isError = true;
    }

    if (PassingYear == '') {
        text += "<br /> -Please enter Passing Year. ";
        isError = true;
    }

    if (NameOfBoardText != null && (NameOfBoardText == '' || NameOfBoardText == '-Select-' || NameOfBoardText == 'List of Board')) {
        text += "<br /> -Please select Board.";
        isError = true;
    }

    if (Division == '') {
        text += "<br /> -Please enter Division. ";
        isError = true;
    }

    if (Total == '') {
        text += "<br /> -Please enter Total Marks. ";
        isError = true;
    }

    if (Marks == '') {
        text += "<br /> -Please enter Marks Secured. ";
        isError = true;
    }

    if (isError == true) {


        alertPopup("Please fill following information in Educational Qualification.", text);
        return false;
    }

    return true;

}

