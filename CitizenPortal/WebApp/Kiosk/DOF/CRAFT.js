function GetBPLYear() {
    var qs = getQueryStrings();
    var state = "22";
    var svcid = qs["SvcID"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];

    var catCount = 0;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Kiosk/DOF/CraftForm.aspx/BindBPLYear',
        data: '{"ServiceId":"' + svcid + '","State":"' + state + '","District":"' + dist + '","Taluka":"' + blk + '","Village":"' + pan + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";
            $("[id*=BPLYr]").empty();
            $("[id*=BPLYr]").append('<option value = "0">Select BPLYear</option>');
            $.each(arr, function () {
                $("[id*=BPLYr]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                console.log(this.Id + ',' + this.Name);
            });
        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });
}

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

//function enginHP() {
//    debugger;
//    var engin2 = $("#EngneType2").val();
//    if (engin2 == "InBoard") {
//        var x = document.getElementById("engineHP");
//        //if (x.length > 0)
//            for (x = 0; x.length; x++) {
//                x.remove(x.length - 1);
//        }
//        var x = document.getElementById("engineHP");
//        var option = document.createElement("option");
//        option.text = "20HP";
//        x.add(option);
//    }
//    if (engin2 == "OutBoard") {
//        var x = document.getElementById("engineHP");
//        //if (x.length > 0)
//            for (x = 0; xlength; x++) {
//            x.remove(x.length - 1);
//        }
//        var x = document.getElementById("engineHP");
//        var option = document.createElement("option");
//        option.text = "5 HP";
//        x.add(option);
//        var option = document.createElement("option");
//        option.text = "9 HP";
//        x.add(option);
//        var option = document.createElement("option");
//        option.text = "12 HP";
//        x.add(option);
//    }
//}

function fnNext() {
    SubmitData();
}

function SubmitData() {
    //document.getElementById("btnSubmit").disabled = true;
    if (!ValidateForm()) {
        return;
    }

    var temp = "Mohan";
    var AppID = "";
    var result = false;

    var BoatCondition = $("input:radio[name='radio1']:checked").val();
    var BankFince = $("input:radio[name='radio2']:checked").val();
    var EnginePurchase = $("input:radio[name='radio5']:checked").val();

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

        'Boat_Condition': BoatCondition,
        'BPL_APL_Category': $('#BPLCategory').val(),
        'BPLNo': $('#BPLNo').val(),
        'BPLYear': $('#BPLYr').val(),
        'BoatRegistrationNo': $('#BoatRegNo').val(),
        'BoatRegistrationDate': $('#FishinglincValid').val(),
        'PoliceStation': $('#PoliceStatn').val(),
        'BoatOal': $('#BoardLngth').val(),
        'BoatDepth': $('#BoardDpth').val(),
        'BoatWidth': $('#BoardWdth').val(),

        'BankFinance': BankFince,
        'BankName1': $('#BnkNme1LoanAval').val(),
        'BankAddress1': $('#Bnk1Address').val(),
        'BankName2': $('#BnkNme2LoanAval').val(),
        'BankAddress2': $('#Bnk2Address').val(),

        'Category': $('#lblCategory').val(),
        'EngineType1': $('#EngneType1').val(),
        'EngineType2': $('#EngneType2').val(),
        'Other_Engine_Name': $('#OtherTypeOfEngineDetail').val(),
        'EngineHP': $('#engineHP').val(),
        'Other_Engine_HP': $('#otherdDtl').val(),

        'Annual_Income': $('#lblAnualIncom').val(),
        'Date_Of_Manufacture': $('#MnftureDateBox').val(),

        'Engine_Purchase': EnginePurchase,
        'Purchase_Type': $('#DirectPurchase').val(),
        'Purchase_Type_Other': $('#OthrPrchse').val(),

        'EngineNumber': $('#EngineNo').val(),
        'EngineMake': $('#EngineMake').val(),
        'EngineCapacity': $('#EngineCapacity').val(),
        'FinanceYear': $('#FinaceYear').val(),
        'FinanceBank': $('#FinaceBank').val(),

        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/DOF/CraftForm.aspx/InsertCRAFT',
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
    $('#divinfo').show();
    BadBoat();
    //GetBPLYear();
    BplAplCategory();
    document.getElementById("btnSubmit").disabled = false;

    $("#engineHP").prop('disabled', true);
    $("#OtherTypeOfEngineDetail").prop('disabled', true);
    $("#otherdDtl").prop('disabled', true);
    $("#OthrPrchse").prop('disabled', true);

    $('#FishinglincValid').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        //maxDate: '365',
        //yearRange: "-50:+50",
        yearRange: "-0:+50",
        //yearRange: "2005:2025",
        onSelect: function (date) {
        }
    });

    $('#MnftureDateBox').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        //maxDate: '365', limit upto todays date
        maxDate: '0',
        yearRange: "-50:+50",
        //yearRange: "2005:2025",
        onSelect: function (date) {
        }
    });

    $("#EngneType1").bind("change", function (e) {
        if ($("#EngneType1").val() == "Other Type Of Engine") {
            $("#OtherTypeOfEngineDetail").prop('disabled', false);
        }
        else {
            $("#OtherTypeOfEngineDetail").prop('disabled', true);
        }
    });

    $("#EngneType2").bind("change", function (e) {
        var CategoryArr = ["10 HP", "20 HP", "Other"];
        var CategoryArr2 = ["6.5 HP", "9 HP", "10 HP", "Other"];

        $("#engineHP").empty();
        $("#engineHP").append('<option value = "0">-Select-</option>');

        if ($("#EngneType2").val() == "Engine Type - Other") {
            $("#otherdDtl").prop('disabled', false);
        }
        else {
            $("#otherdDtl").prop('disabled', true);
        }

        if ($("#EngneType2").val() == "In-Board") {
            var arrLen = CategoryArr.length;

            for (i = 0; i < arrLen; i++) {
                $("#engineHP").append('<option value = "' + CategoryArr[i] + '">' + CategoryArr[i] + '</option>');
            }
            $("#engineHP").prop('disabled', false);
            $("#otherdDtl").val('');
        }

        else if ($("#EngneType2").val() == "Out-Board") {
            var arrLen = CategoryArr2.length;

            for (i = 0; i < arrLen; i++) {
                $("#engineHP").append('<option value = "' + CategoryArr2[i] + '">' + CategoryArr2[i] + '</option>');
            }
            $("#engineHP").prop('disabled', false);
            $("#otherdDtl").val('');
        }
        else if ($("#EngneType2" == "0")) {
            $("#engineHP").prop('disabled', true);
            $("#otherdDtl").val('');
        }
    });

    $("#engineHP").bind("change", function (e) {
        if ($("#engineHP").val() == "Other") {
            $("#otherdDtl").prop('disabled', false);
            $("#otherdDtl").val('');
        }
        else {
            $("#otherdDtl").prop('disabled', true);
            $("#otherdDtl").val('');
        }
    });

    $("#DirectPurchase").bind("change", function (e) {
        if ($("#DirectPurchase").val() == "Others") {
            $("#OthrPrchse").prop('disabled', false);
        }
        else {
            $("#OthrPrchse").prop('disabled', true);
        }
    });
});

// **** Logic for Apl/Bpl Category while changed by user ****
function BplAplCategory() {
    var BPLCategory = $('#BPLCategory :selected').val();
    if (BPLCategory == '101') {
        $('#BPLNo').val('');
        $('#AplBplNo').text("BPL");
        $('#BPLYr').val(0);
        $('#AplBplYr').text("BPL Year");
        //added as per new changes
        $("#BPLNo").prop('disabled', false);
        $("#BPLYr").prop('disabled', false);
    }
    else if (BPLCategory == '102') {
        $('#BPLNo').val('');
        $('#AplBplNo').text("APL");
        $('#BPLYr').val(0);
        $('#AplBplYr').text("APL Year");
        //added as per new changes
        $("#BPLNo").prop('disabled', true);
        $("#BPLYr").prop('disabled', true);
    }
    else {
        $('#BPLNo').val('');
        $('#AplBplNo').text("APL / BPL");
        $('#BPLYr').val('');
        $('#BPLYr').val(0);
        $('#AplBplYr').text("Select Year");
        //added as per new changes
        $("#BPLNo").prop('disabled', true);
        $("#BPLYr").prop('disabled', true);
    }

    //if (BPLCategory != 0) {
    //    $('#BPLNo').prop('disabled', false);
    //    $('#BPLYr').prop('disabled', false);
    //}
    //else
    //    $('#BPLNo').prop('disabled', true);
    //    $('#BPLYr').prop('disabled', true);

    //if (BPLCategory == '101' || BPLCategory == '102') {
    //    $('#BPLNo').prop('disabled', false);
    //    $('#BPLYr').prop('disabled', false);
    //}

    if (BPLCategory == 0) {
        $('#BPLYr') == "";
        $('#BPLNo') == null;
    }
}

function BadBoat() {
    var qs = getQueryStrings();
    var uid = qs["UID"];
    var text = "<br /> - As Your Boat Condition Is Bad, <br /> &nbsp; You Cannot Apply For This Service. ";
    var BoatCondition = $("input:radio[name='radio1']:checked").val();
    var EngineReq = $("input:radio[name='radio3']:checked").val();

    if (BoatCondition == "Bad") {
        $('#FirstTimeEngine').show(800);
    }

    if (BoatCondition == "Good") {
        $('#FirstTimeEngine').hide(800);
    }

    //if (BoatCondition == "Bad") {
    ////alertPopup("Boat Information", text);
    //if (confirm('As Your Boat Condition Is Bad, You Cannot Apply For This Service.')) {
    //    window.location.href = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + uid;
    //}
    //else {
    //    return false;
    //    //window.location.href = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + uid;
    //}
    //}

    //if (EngineReq == "no") {
    //    if (confirm('As You Do Not Required A Boat Engine, You Cannot Apply For This Service.')) {
    //        window.location.href = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + uid;
    //    }
    //    else {
    //        return false;
    //        //window.location.href = '/WebApp/Citizen/Forms/Dashboard.aspx?UID=' + uid;
    //    }
    //}
}

function ValidateForm() {
    var text = "";
    var opt = "";

    var BoatCondition = $("input:radio[name='radio1']:checked").val();
    if (BoatCondition == null) {
        text += "<br /> - Please choose Boat Condition ";
        opt = 1;
    }

    else {
        var BPL_APL_Category = $('#BPLCategory').val();
        if (BPL_APL_Category == "0") {
            text += "<br /> -Please enter BPL Category ";
            $('#BPLCategory').attr('style', 'border:1px solid red !important;');
            $('#BPLCategory').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#BPLCategory').attr('style', 'border:1px solid #ddd !important;');
            $('#BPLCategory').css({ "background-color": "#ffffff" });
        }

        var BPLNo = $('#BPLNo').val();
        if (BPL_APL_Category == "101" && BPLNo == '' || BPLNo == null) {
            text += "<br /> -Please enter BPL Number ";
            $('#BPLNo').attr('style', 'border:1px solid red !important;');
            $('#BPLNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#BPLNo').attr('style', 'border:1px solid #ddd !important;');
            $('#BPLNo').css({ "background-color": "#ffffff" });
        }

        var BPLYear = $('#BPLYr').val();
        if (BPL_APL_Category == "101" && BPLYear == "0") {
            text += "<br /> -Please enter BPL Year ";
            $('#BPLYr').attr('style', 'border:1px solid red !important;');
            $('#BPLYr').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#BPLYr').attr('style', 'border:1px solid #ddd !important;');
            $('#BPLYr').css({ "background-color": "#ffffff" });
        }

        var PoliceStation = $('#PoliceStatn').val();
        if (PoliceStation == null || PoliceStation == '') {
            text += "<br /> -Please enter Police Station ";
            $('#PoliceStatn').attr('style', 'border:1px solid red !important;');
            $('#PoliceStatn').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#PoliceStatn').attr('style', 'border:1px solid #ddd !important;');
            $('#PoliceStatn').css({ "background-color": "#ffffff" });
        }

        var BoatRegistrationNo = $('#BoatRegNo').val();
        if (BoatRegistrationNo == null || BoatRegistrationNo == '') {
            text += "<br /> -Please enter Boat Registratuon Number ";
            $('#BoatRegNo').attr('style', 'border:1px solid red !important;');
            $('#BoatRegNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#BoatRegNo').attr('style', 'border:1px solid #ddd !important;');
            $('#BoatRegNo').css({ "background-color": "#ffffff" });
        }

        var BoatRegistrationDate = $('#FishinglincValid').val();
        if (BoatRegistrationDate == null || BoatRegistrationDate == '') {
            text += "<br /> -Please enter Boat Registratuon Date ";
            $('#FishinglincValid').attr('style', 'border:1px solid red !important;');
            $('#FishinglincValid').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#FishinglincValid').attr('style', 'border:1px solid #ddd !important;');
            $('#FishinglincValid').css({ "background-color": "#ffffff" });
        }

        var BoatOal = $('#BoardLngth').val();
        if (BoatOal == null || BoatOal == '') {
            text += "<br /> -Please enter Boat Lenght ";
            $('#BoardLngth').attr('style', 'border:1px solid red !important;');
            $('#BoardLngth').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#BoardLngth').attr('style', 'border:1px solid #ddd !important;');
            $('#BoardLngth').css({ "background-color": "#ffffff" });
        }

        var BoatDepth = $('#BoardDpth').val();
        if (BoatDepth == null || BoatDepth == '') {
            text += "<br /> -Please enter Boat Depth ";
            $('#BoardDpth').attr('style', 'border:1px solid red !important;');
            $('#BoardDpth').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#BoardDpth').attr('style', 'border:1px solid #ddd !important;');
            $('#BoardDpth').css({ "background-color": "#ffffff" });
        }

        var BoatWidth = $('#BoardWdth').val();
        if (BoatWidth == null || BoatWidth == '') {
            text += "<br /> -Please enter Boat Lenght ";
            $('#BoardWdth').attr('style', 'border:1px solid red !important;');
            $('#BoardWdth').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#BoardWdth').attr('style', 'border:1px solid #ddd !important;');
            $('#BoardWdth').css({ "background-color": "#ffffff" });
        }

        var Category = $('#lblCategory').val();
        if (Category == "0") {
            text += "<br /> -Please Choose Category ";
            $('#lblCategory').attr('style', 'border:1px solid red !important;');
            $('#lblCategory').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#lblCategory').attr('style', 'border:1px solid #ddd !important;');
            $('#lblCategory').css({ "background-color": "#ffffff" });
        }

        var AnnualIncome = $('#lblAnualIncom').val();
        if (AnnualIncome == "" || AnnualIncome == null) {
            text += "<br /> -Please Choose Annual Income ";
            $('#lblAnualIncom').attr('style', 'border:1px solid red !important;');
            $('#lblAnualIncom').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#lblAnualIncom').attr('style', 'border:1px solid #ddd !important;');
            $('#lblAnualIncom').css({ "background-color": "#ffffff" });
        }

        var Engine1Type = $('#EngneType1').val();
        if (Engine1Type == "0") {
            text += "<br /> -Please Choose Engine Name ";
            $('#EngneType1').attr('style', 'border:1px solid red !important;');
            $('#EngneType1').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#EngneType1').attr('style', 'border:1px solid #ddd !important;');
            $('#EngneType1').css({ "background-color": "#ffffff" });
        }

        var EngineType = $('#EngneType2').val();
        var EngineHP = $('#engineHP').val();
        var OtherHp = $('#otherdDtl').val();

        if (EngineType == "0" || EngineType == "-Select-") {
            text += "<br /> -Please Choose Engine Type ";
            $('#EngneType2').attr('style', 'border:1px solid red !important;');
            $('#EngneType2').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else if (EngineType != "0" || EngineType != "-Select-") {
            $('#EngneType2').attr('style', 'border:1px solid #ddd !important;');
            $('#EngneType2').css({ "background-color": "#ffffff" });
            if (EngineType == "Engine Type - Other") {
                if (OtherHp == null || OtherHp == '') {
                    text += "<br /> -Please Choose Engine HP Detail";
                    $('#otherdDtl').attr('style', 'border:1px solid red !important;');
                    $('#otherdDtl').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#otherdDtl').attr('style', 'border:1px solid #ddd !important;');
                    $('#otherdDtl').css({ "background-color": "#ffffff" });
                }
            }
            else {
                if (EngineHP == "0" || EngineHP == null) {
                    text += "<br /> -Please Choose Engine HP ";
                    $('#engineHP').attr('style', 'border:1px solid red !important;');
                    $('#engineHP').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#engineHP').attr('style', 'border:1px solid #ddd !important;');
                    $('#engineHP').css({ "background-color": "#ffffff" });
                    if (EngineType == "In-Board" || EngineType == "Out-Board") {
                        if (EngineHP == "Other") {
                            if (OtherHp == null || OtherHp == '') {
                                text += "<br /> -Please Choose Engine HP Detail";
                                $('#otherdDtl').attr('style', 'border:1px solid red !important;');
                                $('#otherdDtl').css({ "background-color": "#fff2ee" });
                                opt = 1;
                            }
                            else {
                                $('#otherdDtl').attr('style', 'border:1px solid #ddd !important;');
                                $('#otherdDtl').css({ "background-color": "#ffffff" });
                            }
                        }
                    }
                }
            }
        }

        if ($("input:radio[name='radio1']:checked").val() == "Bad") {
            if ($('#EngineNo').val() == null || $('#EngineNo').val() == "") {
                text += "<br /> -Please Enter Engine Number.";
                $('#EngineNo').attr('style', 'border:1px solid red !important;');
                $('#EngineNo').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#EngineNo').attr('style', 'border:1px solid #ddd !important;');
                $('#EngineNo').css({ "background-color": "#ffffff" });
            }

            if ($('#EngineMake').val() == null || $('#EngineMake').val() == "") {
                text += "<br /> -Please Enter Engine Make.";
                $('#EngineMake').attr('style', 'border:1px solid red !important;');
                $('#EngineMake').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#EngineMake').attr('style', 'border:1px solid #ddd !important;');
                $('#EngineMake').css({ "background-color": "#ffffff" });
            }

            if ($('#EngineCapacity').val() == null || $('#EngineCapacity').val() == "") {
                text += "<br /> -Please Enter Engine Capacity.";
                $('#EngineCapacity').attr('style', 'border:1px solid red !important;');
                $('#EngineCapacity').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#EngineCapacity').attr('style', 'border:1px solid #ddd !important;');
                $('#EngineCapacity').css({ "background-color": "#ffffff" });
            }

            if ($('#FinaceYear').val() == null || $('#FinaceYear').val() == "") {
                text += "<br /> -Please Enter Bank Finance Year.";
                $('#FinaceYear').attr('style', 'border:1px solid red !important;');
                $('#FinaceYear').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#FinaceYear').attr('style', 'border:1px solid #ddd !important;');
                $('#FinaceYear').css({ "background-color": "#ffffff" });
            }

            if ($('#FinaceBank').val() == null || $('#FinaceBank').val() == "") {
                text += "<br /> -Please Enter Bank Finance Name.";
                $('#FinaceBank').attr('style', 'border:1px solid red !important;');
                $('#FinaceBank').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#FinaceBank').attr('style', 'border:1px solid #ddd !important;');
                $('#FinaceBank').css({ "background-color": "#ffffff" });
            }
        }

        var ManufactureDate = $('#MnftureDateBox').val();
        if (ManufactureDate == null || ManufactureDate == '') {
            text += "<br /> -Please Input Manufacture Date Of Engine ";
            $('#MnftureDateBox').attr('style', 'border:1px solid red !important;');
            $('#MnftureDateBox').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#MnftureDateBox').attr('style', 'border:1px solid #ddd !important;');
            $('#MnftureDateBox').css({ "background-color": "#ffffff" });
        }

        var BankFinance = $("input[name='radio2']:checked").val();
        if (BankFinance == null) {
            text += "<br /> - Do You Need Engine With Bank Finance ";
            opt = 1;
        }

        var BankName1 = $('#BnkNme1LoanAval').val();
        if (BankFinance == "yes") {
            if (BankName1 == null || BankName1 == '') {
                text += "<br /> -Please enter Bank 1 Name ";
                $('#BnkNme1LoanAval').attr('style', 'border:1px solid red !important;');
                $('#BnkNme1LoanAval').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#BnkNme1LoanAval').attr('style', 'border:1px solid #ddd !important;');
                $('#BnkNme1LoanAval').css({ "background-color": "#ffffff" });
            }
        }

        var BankAddress1 = $('#Bnk1Address').val();
        if (BankFinance == "yes") {
            if (BankAddress1 == null || BankAddress1 == '') {
                text += "<br /> -Please enter Bank 1 Address ";
                $('#Bnk1Address').attr('style', 'border:1px solid red !important;');
                $('#Bnk1Address').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#Bnk1Address').attr('style', 'border:1px solid #ddd !important;');
                $('#Bnk1Address').css({ "background-color": "#ffffff" });
            }
        }

        var BankName2 = $('#BnkNme2LoanAval').val();
        if (BankFinance == "yes") {
            if (BankName2 == null || BankName2 == '') {
                text += "<br /> -Please enter Bank 2 Name ";
                $('#BnkNme2LoanAval').attr('style', 'border:1px solid red !important;');
                $('#BnkNme2LoanAval').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#BnkNme2LoanAval').attr('style', 'border:1px solid #ddd !important;');
                $('#BnkNme2LoanAval').css({ "background-color": "#ffffff" });
            }
        }

        var BankAddress2 = $('#Bnk2Address').val();
        if (BankFinance == "yes") {
            if (BankAddress2 == null || BankAddress2 == '') {
                text += "<br /> -Please enter Bank 2 Address ";
                $('#Bnk2Address').attr('style', 'border:1px solid red !important;');
                $('#Bnk2Address').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#Bnk2Address').attr('style', 'border:1px solid #ddd !important;');
                $('#Bnk2Address').css({ "background-color": "#ffffff" });
            }
        }

        var EnginePurchase = $("input[name='radio5']:checked").val();
        if (EnginePurchase == null) {
            text += "<br /> - Please Choose Direct Purchase Or Department Purchase ";
            opt = 1;
        }

        var DirectPurchase = $('#DirectPurchase').val();
        var otherPurchase = $('#OthrPrchse').val();

        if (EnginePurchase == "Direct Purchase") {
            if (DirectPurchase == "0") {
                text += "<br /> -Please Choose Direct Purchase Or Department Purchase ";
                $('#DirectPurchase').attr('style', 'border:1px solid red !important;');
                $('#DirectPurchase').css({ "background-color": "#fff2ee" });
                $('#OthrPrchse').attr('style', 'border:1px solid #ddd !important;');
                $('#OthrPrchse').css({ "background-color": "#ffffff" });
                opt = 1;
            }
            else {
                $('#DirectPurchase').attr('style', 'border:1px solid #ddd !important;');
                $('#DirectPurchase').css({ "background-color": "#ffffff" });
            }
        }

        if (DirectPurchase == "Others") {
            if (otherPurchase == null || otherPurchase == '') {
                text += "<br /> -Please Choose Direct Purchase Name ";
                $('#OthrPrchse').attr('style', 'border:1px solid red !important;');
                $('#OthrPrchse').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#OthrPrchse').attr('style', 'border:1px solid #ddd !important;');
                $('#OthrPrchse').css({ "background-color": "#ffffff" });
            }
        }
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}