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

function calculatepercentage(TotalMarks, MarksObtained) {
    if (TotalMarks == "") return;

    var result = 0;

    if ($("#txtPercentage").val() == "501") {
        //(8.3 - 0.5) * 10

        if (TotalMarks <= 0) TotalMarks = 1;

        if (TotalMarks < 3.5) {
            alert("CGPA cannot be less than 3.5");
            $('#txtTotalMarks').val("");
            return;
        }

        if (TotalMarks > 10.5) {
            alert("Please enterr valid CGPA");
            $('#txtTotalMarks').val("");
            return;
        }
        result = ((TotalMarks) * 9.5).toFixed(2);
    }
    else {
        if (MarksObtained == "") return;
        if (parseInt(TotalMarks) < parseInt(MarksObtained)) {
            alert("Total Marks must be greater than Marks Obtained");
            $('#txtTotalMarks').val("");
            $('#txtMarkSecure').val("");
            $("#txtPercentage").val("");
            return;
        }
        if (TotalMarks <= 0) TotalMarks = 1;
        result = ((MarksObtained / TotalMarks) * 100).toFixed(2);
    }
    $("#txtPercentage").val(result);
}

function fnNext() {
    SubmitData();
}

function GetStateV2OdishaDefault(category, StateControl) {
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Registration/KioskRegistration.aspx/GetState',
        data: '{"prefix": ""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var arr = eval(response.d);
            var html = "";

            $("[name='" + StateControl + "']").empty();
            $("[name='" + StateControl + "']").append('<option value = "0">-Select-</option>');
            $.each(arr, function () {
                $("[name='" + StateControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            });

            $("[name='" + StateControl + "']").val(21);

            var EdBoard = "boardName";
            $('#boardName').prop("disabled", false);
            GetEducationBoard("", 21, EdBoard);
        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });
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
        var NameOfUniversity = "";
        var NameOfHigherSecondary = "";
        var PassingYear = "";
        var NameOfBoardVal = "";
        var NameOfBoardText = "";
        var Division = "";
        var Total = "";
        var Marks = "";
        var Percentage = "";

        stateVal = $("#EddlBoardState").val();
        stateText = $("#EddlBoardState option:selected").text();
        NameOfUniversity = $("#universrityName").val();
        NameOfHigherSecondary = $("#hscName").val();
        PassingYear = $("#txtPssngYr").val();
        NameOfBoardVal = $("#boardName").val();
        NameOfBoardText = $("#boardName option:selected").text();
        Division = $("#gradeDivision").val();
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

function ServiceType()//changes here on select
{
    if ($("#ReqService").val() == "Excavation") {
        $('#ddlowntank').prop('disabled', true);
        $('#ddlowntank1').prop('disabled', false);
        $('#ddlowntank').hide();
        $('#ddlowntank').val(0);
        $('#ddlowntank1').show();
        $('#ddlowntank1').val(0);
        $('#tanktype').text("Select Land Type");
        $('#TankArea').text("Area To Be Developed");
        $('#ddltankStatus').prop('disabled', true);
        $('#tankstatus').removeClass('manadatory');
        $('#PrdctnQntl').val('');
        $('#PrdctnQntl').prop('disabled', true);
        $('#PrdctnVal').val('');
        $('#PrdctnVal').prop('disabled', true);
    }
    else if ($("#ReqService").val() == "Renovation") {
        $('#ddlowntank').prop('disabled', false);
        $('#ddlowntank1').prop('disabled', true);
        $('#ddlowntank1').hide();
        $('#ddlowntank1').val(0);
        $('#ddlowntank').show();
        $('#ddlowntank').val(0);
        $('#tanktype').text("Select Tank Type");
        $('#TankArea').text("Area To Be Developed");
        $('#ddltankStatus').prop('disabled', false);
        $('#tankstatus').addClass('manadatory');
        $('#PrdctnQntl').prop('disabled', false);
        $('#PrdctnVal').prop('disabled', false);
    }
    else {
        $('#tankstatus').removeClass('manadatory');
        $('#ddlowntank').val(0);
        $('#ddlowntank').prop('disabled', true);
        $('#ddlowntank1').val(0);
        $('#ddlowntank1').prop('disabled', true);
        $('#tanktype').text("Select Type");
        $('#TankArea').text("Area To Be Developed");
        $('#ddltankStatus').prop('disabled', true);
        $('#PrdctnQntl').val('');
        $('#PrdctnQntl').prop('disabled', true);
        $('#PrdctnVal').val('');
        $('#PrdctnVal').prop('disabled', true);
    }
}

function SubmitInlandFisheriesData() {
    ////document.getelementbyid("btnsubmit").disabled = true;

    if (!validateform()) {
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

    var availtng = $("input:radio[name='radio1']:checked").val();
    var pfcs = $("input:radio[name='radio2']:checked").val();
    var infrastructure = $("input:radio[name='radio3']:checked").val();
    var road = $("input:Checkbox[name='road']:checked").val();
    var electricity = $("input:Checkbox[name='electricity']:checked").val();
    var canal = $("input:Checkbox[name='canal']:checked").val();
    var loanpreviously = $("input:radio[name='radio4a']:checked").val();
    var TankDetail = $('#ddlowntank').val();
    var TankDetal = $('#ddlowntank1').val();
    var ReqService = $('#ReqService').val();
    var financemode = $('#financeMeans').val();
    var SvcID = $('#ddlServiceType').val();

    var datavar = {
        'aadhaarNumber': uid,
        'ServiceID': SvcID,
        'ReqdService': ReqService,
        'TankDetal': TankDetal,
        'TankDetail': TankDetail,
        'TankLength': $('#AreaLnth').val(),
        'TankBreadth': $('#AreaBreth').val(),
        'TankArea': $('#AreaHtrs').val(),
        'Village': $('#VllgeName').val(),
        'KhataNo': $('#KhataNo').val(),
        'PlotNo': $('#PlotNo').val(),
        'LeaseCategory': $('#ddlcategory').val(),
        'LeasePeriod': $('#LeasePrd').val(),
        'LeaseValue': $('#LeaseVal').val(),
        'LessorDetail': $('#lessorDetail').val(),
        'Category': $('#ddlCastCategory').val(),
        'AnnualIncome': $('#AnnualIncome').val(),
        'DistrictName': $('#DistrictName').val(),
        'BlockName': $('#BlockName').val(),
        'GramPanchayatName': $('#GramPanchayatName').val(),
        'PresentTankStatus': $('#ddltankStatus').val(),
        'CultureTank': $('#ddltankstatusid').val(),
        'PresentfishQuantal': $('#PrdctnQntl').val(),
        'PresentfishValue': $('#PrdctnVal').val(),
        'BankName': $('#txtBankName').val(),
        'BranchName': $('#txtBranchName').val(),
        'EducationalQualification': $('#EduQualification option:selected').text(),
        'DateOfBirth': $('#DOB').val(),
        'Days': $('#txtDays').val(),
        'Month': $('#txtMonth').val(),
        'Year': $('#txtYear').val(),
        'SpeciesCultured': $('#SpeciesCultured option:selected').text(),
        //Educationboard
        //'Statecode': $('#EddlBoardState').val(),
        //'NameOfBoard': $('#boardName').val(),
        //'NameOfHigherSecondary': $('#hscName').val(),
        //'NameOfUniversity': $('#universrityName').val(),
        //'PassingYear': $('#txtPssngYr').val(),
        //'Grade': $('#gradeDivision ').val(),
        //'TotalMarks': $('#txtTotalMarks').val(),
        //'MarkSecured': $('#txtMarkSecure').val(),
        //'Percentage': $('#txtPercentage').val(),
        'Section1_AvailedAnytraining': availtng,
        'Section1A_NoOfTraining': $('#trainingYear').val(),
        'Section1B_Week': $('#trainingWeek').val(),
        'Section1B_Month': $('#trainingMonth').val(),
        'Section1B_Year': $('#trainingYear2').val(),
        'Section1C_training_Name': $('#ddltrainingName').val(),
        'Section1C_Other_training': $('#otherTrainingnme').val(),
        'Section2_PFCSMember': pfcs,
        'Section2A_PFCSName': $('#memberName').val(),
        'Section2B_PFCSAddress': $('#addressPFCSSHG').val(),
        'Section2C_PFCSMemberNo': $('#membershipNo').val(),
        'Section3_InfrastructureatFarmSide': infrastructure,
        'Section3A_Road': road,
        'Section3B_Electricity': electricity,
        'Section3C_Canal': canal,
        'Section4_PreviouslLoan': loanpreviously,
        'Section4A_BankName': $('#bankName').val(),
        'Section4B_PurposeOfLoan': $('#loanPurpose').val(),
        'Section4C_AmountOfLoan': $('#loanAmt').val(),
        'Section4D_OutstandingLoan': $('#OutstndngloanAmt').val(),
        'FinanceMode': $('#financeMeans').val(),
        'WitnessName1': $('#WitnessNme1').val(),
        'WitnessAddressLine1': $('#AddWtness1').val(),
        'WitnessName2': $('#WitnessNme2').val(),
        'WitnessAddressLine2': $('#AddWtness2').val(),
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
            url: '/WebApp/Kiosk/DOF/FisheriesForm.aspx/InsertFisheries',
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
            if ($('#ddlServiceType').val() == "392") {
                window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=392&AppID=' + obj.AppID + '&UID=' + uid;
            }
            if ($('#ddlServiceType').val() == "437") {
                window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=437&AppID=' + obj.AppID + '&UID=' + uid;
            }
            if ($('#ddlServiceType').val() == "438") {
                window.location.href = '/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=438&AppID=' + obj.AppID + '&UID=' + uid;
            }
        }
    });// end of Then function of main Data Insert Function

    return false;
}

function DistrictVal() {
    $("#DistrictName").bind("change", function (e) {
        if ($("#DistrictName option:selected").val() == "0" || $("#DistrictName option:selected").val() == "-Select-") {
            $("#TahsilName").prop('disabled', true);
        }
        else {
            $("#TahsilName").prop('disabled', false);
        }
    });
}

var dat = new Date();
var curday = dat.getDate();
var curmon = dat.getMonth() + 1;
var curyear = dat.getFullYear();

function checkleapyear(datea) {
    datea.Date = new Date();
    if (datea.getyear() % 4 == 0) {
        if (datea.getyear() % 10 != 0) {
            return true;
        } else {
            if (datea.getyear() % 400 == 0)
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

function datedif(date1, date2) {
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

function AgeCalculate(dob) {

    var D1 = dob.split('/');
    var calyear = D1[0];
    var calmon = D1[1];
    var calday = D1[2];

    var curd = new Date(curyear, curmon - 1, curday);
    var cald = new Date(calday, calmon - 1, calyear);
    var diff = Date.UTC(curyear, curmon, curday, 0, 0, 0) - Date.UTC(calday, calmon, calyear, 0, 0, 0);
    var dife = datedif(curd, cald);
    return dife;
}

function GetAge() {
    var t_DOB = $("#DOB").val();
    if (t_DOB != "" && t_DOB != null) {
        var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
        var selectedYear = S_date.getFullYear();
        var Age = AgeCalculate(t_DOB);
        $("#txtYear").val(Age[0]);
        $("#txtMonth").val(Age[1]);
        $("#txtDays").val(Age[2]);
        
        if ($("#txtYear").val() >= 65)
        {
            if ($("#txtMonth").val()>0)
            {
                alertPopup("Age Validation", "Minimum Age Limit of this service is 65 Years.");
                $("#DOB").val("");
                $("#txtYear").val('');
                $("#txtMonth").val('');
                $("#txtDays").val('');
                return;
            }
            else if ($("#txtDays").val() > 0)
            {
                alertPopup("Age Validation", "Minimum Age Limit of this service is 65 Years.");
                $("#DOB").val('');
                $("#txtYear").val('');
                $("#txtMonth").val('');
                $("#txtDays").val('');
                return;
            }
        }
    }
}

$(document).ready(function () {
    $('#DOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        //minDate: 0,
        stepMonths: false,
        changeYear: true,
        maxDate: '0',
        yearRange: "-65:+1",
        onSelect: function (date) {
            GetAge();
        }
    });

    $('#tankstatus').removeClass('manadatory');
    $('#ddlState').prop('disabled', true);
    $('#AreaLnth').prop('disabled', true);
    $('#AreaBreth').prop('disabled', true);
    $('#AreaHtrs').prop('disabled', true);
    $('#VllgeName').prop('disabled', true);
    $('#KhataNo').prop('disabled', true);
    $('#PlotNo').prop('disabled', true);
    $('#otherTrainingnme').prop('disabled', true);
    $('#ddlcategory').prop('disabled', true);
    $('#LeasePrd').prop('disabled', true);
    $('#LeaseVal').prop('disabled', true);
    $('#ddltankstatusid').prop('disabled', true);
    $('#ddlowntank').prop('disabled', true);
    $('#ddlowntank1').prop('disabled', true);
    $("#TahsilName").prop('disabled', true);
    $('#ddlowntank1').hide();

    FinanceMode();
    ServiceType();
    lesorDetail();
    DistrictVal(); //**** TahsilName gets highlighted if District field blank ****

    var DistrictControl = 'DistrictName';
    GetDistrict('', '21', DistrictControl);

    $('#txtTotalMarks').change(function () {
        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });

    $('#txtMarkSecure').change(function () {
        calculatepercentage($('#txtTotalMarks').val(), $('#txtMarkSecure').val());
    });
});

// **** This is only enable if user select Private Lease Land/Tank ****
function lesorDetail() {
    if ($('#ReqService').val() == "Excavation" && $('#ddlowntank1').val() == "109" || $('#ddlowntank1').val() == "108") {
        $('#lessorDetail').prop('disabled', false);
    }
    else if ($('#ReqService').val() == "Renovation" && $('#ddlowntank').val() == "103" || $('#ddlowntank').val() == "102") {
        $('#lessorDetail').prop('disabled', false);
    }
    else {
        $('#lessorDetail').prop('disabled', true);
    }
}


// **** This is only enable if user select Finance Mode ****
function FinanceMode() {

    if ($('#financeMeans').val() == "0" || $('#financeMeans').val() == "-Select-")  {
        $('#txtBankName').val("");
        $('#txtBranchName').val("");
        $('#txtBankName').prop('disabled', true);
        $('#txtBranchName').prop('disabled', true);
    }
    else if ($('#financeMeans').val() == "SelfFinance")
    {
        $('#txtBankName').val("");
        $('#txtBranchName').val("");
        $('#txtBankName').prop('disabled', true);
        $('#txtBranchName').prop('disabled', true);
    }
    else if ($('#financeMeans').val() == "BankFinance") {
        $('#txtBankName').val("");
        $('#txtBranchName').val("");
        $('#txtBankName').prop('disabled', false);
        $('#txtBranchName').prop('disabled', false);
    }
}


function Owntank() {
    var Owntankid = $('#ddlowntank :selected').val();
    if (Owntankid != 0) {
        if (Owntankid == '101') {
            $('#ddlcategory').val('');
            $('#ddlcategory').val(0);
            $('#AreaLnth').prop('disabled', false);
            $('#AreaBreth').prop('disabled', false);
            $('#AreaHtrs').prop('disabled', false);
            $('#VllgeName').prop('disabled', false);
            $('#KhataNo').prop('disabled', false);
            $('#PlotNo').prop('disabled', false);
            $('#ddlcategory').prop('disabled', true);
            $('#lblCategoryLesTnk').removeClass('manadatory');
            $('#LeasePrd').prop('disabled', true);
            $('#LeaseVal').prop('disabled', true);
            $('#LeasePrd').val('');
            $('#LeaseVal').val('');
        }

        else {
            $('#AreaLnth').prop('disabled', true);
            $('#AreaBreth').prop('disabled', true);
            $('#AreaHtrs').prop('disabled', true);
            $('#VllgeName').prop('disabled', true);
            $('#KhataNo').prop('disabled', true);
            $('#PlotNo').prop('disabled', true);
            $('#ddlcategory').prop('disabled', false);
            $('#lblCategoryLesTnk').addClass('manadatory');
            $('#LeasePrd').prop('disabled', false);
            $('#LeaseVal').prop('disabled', false);
        }

        if (Owntankid == '102' || Owntankid == '103') {
            $('#ddlcategory').val(0);
            $('#ddlcategory').prop('disabled', false);
            $('#LeasePrd').prop('disabled', false);
            $('#LeaseVal').prop('disabled', false);
            $('#lblvillage').removeClass('manadatory');
            $('#AreaLnth').val('');
            $('#AreaBreth').val('');
            $('#AreaHtrs').val('');
            $('#VllgeName').val('');
            $('#KhataNo').val('');
            $('#PlotNo').val('');
            $('#LeasePrd').val('');
            $('#LeaseVal').val('');
        }
        else {
            $('#ddlcategory').prop('disabled', true);
            $('#LeasePrd').prop('disabled', true);
            $('#LeaseVal').prop('disabled', true);
            $('#lblvillage').addClass('manadatory');
        }
    }

    if (Owntankid == 0) {
        $('#AreaLnth').prop('disabled', true);
        $('#AreaBreth').prop('disabled', true);
        $('#AreaHtrs').prop('disabled', true);
        $('#VllgeName').prop('disabled', true);
        $('#KhataNo').prop('disabled', true);
        $('#PlotNo').prop('disabled', true);
        $('#ddlcategory').prop('disabled', true);
        $('#LeasePrd').prop('disabled', true);
        $('#LeaseVal').prop('disabled', true);
    }

    lesorDetail();
}

function Owntank1() {
    var Owntankid1 = $('#ddlowntank1 :selected').val();
    if (Owntankid1 != 0) {
        if (Owntankid1 == '107') {
            $('#ddlcategory').val('');
            $('#ddlcategory').val(0);
            $('#AreaLnth').prop('disabled', false);
            $('#AreaBreth').prop('disabled', false);
            $('#AreaHtrs').prop('disabled', false);
            $('#VllgeName').prop('disabled', false);
            $('#KhataNo').prop('disabled', false);
            $('#PlotNo').prop('disabled', false);
            $('#ddlcategory').prop('disabled', true);
            $('#lblCategoryLesTnk').removeClass('manadatory');
            $('#LeasePrd').prop('disabled', true);
            $('#LeaseVal').prop('disabled', true);
            $('#LeasePrd').val('');
            $('#LeaseVal').val('');
        }

        else {
            $('#AreaLnth').prop('disabled', true);
            $('#AreaBreth').prop('disabled', true);
            $('#AreaHtrs').prop('disabled', true);
            $('#VllgeName').prop('disabled', true);
            $('#KhataNo').prop('disabled', true);
            $('#PlotNo').prop('disabled', true);
            $('#ddlcategory').prop('disabled', false);
            $('#lblCategoryLesTnk').addClass('manadatory');
            $('#LeasePrd').prop('disabled', false);
            $('#LeaseVal').prop('disabled', false);
        }

        if (Owntankid1 == '108' || Owntankid1 == '109') {
            $('#ddlcategory').val(0);
            $('#ddlcategory').prop('disabled', false);
            $('#LeasePrd').prop('disabled', false);
            $('#LeaseVal').prop('disabled', false);
            $('#lblvillage').removeClass('manadatory');
            $('#AreaLnth').val('');
            $('#AreaBreth').val('');
            $('#AreaHtrs').val('');
            $('#VllgeName').val('');
            $('#KhataNo').val('');
            $('#PlotNo').val('');
            $('#LeasePrd').val('');
            $('#LeaseVal').val('');
        }
        else {
            $('#ddlcategory').prop('disabled', true);
            $('#LeasePrd').prop('disabled', true);
            $('#LeaseVal').prop('disabled', true);
            $('#lblvillage').addClass('manadatory');
        }
    }

    if (Owntankid1 == 0) {
        $('#AreaLnth').prop('disabled', true);
        $('#AreaBreth').prop('disabled', true);
        $('#AreaHtrs').prop('disabled', true);
        $('#VllgeName').prop('disabled', true);
        $('#KhataNo').prop('disabled', true);
        $('#PlotNo').prop('disabled', true);
        $('#ddlcategory').prop('disabled', true);
        $('#LeasePrd').prop('disabled', true);
        $('#LeaseVal').prop('disabled', true);
    }

    lesorDetail();
}

function Presentstatustank() {
    var Presentstatusid = $('#ddltankStatus :selected').val();
    if (Presentstatusid != 0) {
        if (Presentstatusid == '204') {
            $('#ddltankstatusid').val(0);
            $('#ddltankstatusid').prop('disabled', false);
        }
        else {
            $('#ddltankstatusid').val(0);
            $('#ddltankstatusid').prop('disabled', true);
        }

        if (Presentstatusid == '201' || Presentstatusid == '202' || Presentstatusid == '203') {
            $('#ddltankstatusid').prop('disabled', true);
            $('#lblPresentstatus').removeClass('manadatory');
            $('#ddltankstatusid').val('');
            $('#ddltankstatusid').val(0);
        }
        else {
            $('#ddltankstatusid').prop('disabled', false);
            $('#lblPresentstatus').addClass('manadatory');
        }
    }
}

function selectchange() {

    var trainingName = $('#ddltrainingName :selected').val();

    if (trainingName != 0) {
        if (trainingName == 'Others') {
            $('#otherTrainingnme').prop('disabled', false);
        } else {
            $('#otherTrainingnme').prop('disabled', true);
        }
    }
}

function validateform() { //Validate Form and Controls if Logic Fails
    var text = "";
    var opt = "";

    var reqservice = $('#ReqService').val();
    var tank = $('#ddlowntank').val();
    var tank1 = $('#ddlowntank1').val(); //for selection for renovation select box
    var AreaLength = $("#AreaLnth").val();
    var AreaBreth = $("#AreaBreth").val();
    var AreaHaters = $("#AreaHtrs").val();
    var VllgeName = $("#VllgeName").val();
    var KhataNo = $("#KhataNo").val();
    var PlotNo = $("#PlotNo").val();
    var category1 = $("#ddlcategory").val();
    var LeasePeriod = $("#LeasePrd").val();
    var LeaseValue = $("#LeaseVal").val();
    var castcategory = $("#ddlCastCategory").val();
    var annualincome = $("#AnnualIncome").val();
    var Presentstatus = $("#ddltankStatus").val();
    var Tankstatus = $("#ddltankstatusid ").val();
    var ProductnQuantal = $("#PrdctnQntl").val();
    var ProductValue = $("#PrdctnVal").val();
    var WitnessName1 = $("#WitnessNme1").val();
    var AddWitness1 = $("#AddWtness1").val();
    //var WitnessName2 = $("#WitnessNme2").val();
    //var AddWitness2 = $("#AddWtness2").val();

    if (reqservice == "0" || reqservice == "-Select-") {
        text += "<br /> -Please Select Required Services.";
        $('#ReqService').attr('style', 'border:1px solid #d03100 !important;');
        $('#ReqService').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ReqService').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ReqService').css({ "background-color": "#ffffff" });
    }

    if (reqservice == "Excavation") {
        if (tank1 == "0" || tank1 == "-Select-") {
            text += "<br /> -Please Select Land Detail.";
            $('#ddlowntank1').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlowntank1').css({ "background-color": "#fff2ee" });
            $('#ddlowntank1').show();
            $('#ddlowntank').hide();
            $('#ddlowntank1').prop('disabled', false);
            opt = 1;
        }
        else {
            $('#ddlowntank1').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlowntank1').css({ "background-color": "#ffffff" });
            $('#ddlowntank1').show();
            $('#ddlowntank').hide();
        }
    }

    if (reqservice == "Renovation") {
        if (tank == "0" || tank == "-Select-") {
            text += "<br /> -Please Select Tank Detail.";
            $('#ddlowntank').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlowntank').css({ "background-color": "#fff2ee" });
            $('#ddlowntank').show();
            $('#ddlowntank1').hide();
            $('#ddlowntank').prop('disabled', false);
            opt = 1;
        }
        else {
            $('#ddlowntank').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlowntank').css({ "background-color": "#ffffff" });
            $('#ddlowntank').show();
            $('#ddlowntank1').hide();
        }
    }

    if (reqservice == "Renovation") {
        if (Presentstatus == "0" || Presentstatus == "-Select-") {
            text += "<br /> -Please select Presentstatus.";
            $('#ddltankStatus').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddltankStatus').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else if (Presentstatus != "0") {
            $('#ddltankStatus').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddltankStatus').css({ "background-color": "#ffffff" });
        }
    }

    if (tank == '101') {
        if (category1 == "0" || category1 == "-Select-") {
            $('#ddlcategory').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlcategory').css({ "background-color": "#ffffff" });
        }
        else if (tank != "0" || tank == "-Select-") {
            $('#ddlowntank').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlowntank').css({ "background-color": "#ffffff" });
        }

        if (AreaLength == null || AreaLength == "") {
            text += "<br /> -Please Enter AreaLength.";
            $('#AreaLnth').attr('style', 'border:1px solid #d03100 !important;');
            $('#AreaLnth').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (AreaLength != null) {
            $('#AreaLnth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaLnth').css({ "background-color": "#ffffff" });
        }

        if (AreaBreth == null || AreaBreth == '') {
            text += "<br /> -Please Enter AreaBreth";
            $('#AreaBreth').attr('style', 'border:1px solid #d03100 !important;');
            $('#AreaBreth').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (AreaBreth != null) {
            $('#AreaBreth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaBreth').css({ "background-color": "#ffffff" });
        }

        if (AreaHaters == null || AreaHaters == "") {
            text += "<br /> -Please Enter AreaHtrs";
            $('#AreaHtrs').attr('style', 'border:1px solid #d03100 !important;');
            $('#AreaHtrs').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (AreaHaters != null) {
            $('#AreaHtrs').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaHtrs').css({ "background-color": "#ffffff" });
        }

        if (VllgeName == null || VllgeName == "") {
            text += "<br /> -Please Enter VllgeName";
            $('#VllgeName').attr('style', 'border:1px solid #d03100 !important;');
            $('#VllgeName').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (VllgeName != null) {
            $('#VllgeName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#VllgeName').css({ "background-color": "#ffffff" });
        }

        if (KhataNo == null || KhataNo == "") {
            text += "<br /> -Please Enter KhataNo";
            $('#KhataNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#KhataNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (KhataNo != null) {
            $('#KhataNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#KhataNo').css({ "background-color": "#ffffff" });
        }

        if (PlotNo == null || PlotNo == "") {
            text += "<br /> -Please Enter PlotNo";
            $('#PlotNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#PlotNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (PlotNo != null) {
            $('#PlotNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PlotNo').css({ "background-color": "#ffffff" });
        }
    }

    if (tank == '102') {
        if (AreaLength == null || AreaLength == "" && AreaBreth == null || AreaBreth == '' && AreaHaters == null || AreaHaters == "" && VllgeName == null || VllgeName == "" && KhataNo == null || KhataNo == "") {
            $('#PlotNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PlotNo').css({ "background-color": "#ffffff" });
            $('#KhataNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#KhataNo').css({ "background-color": "#ffffff" });
            $('#VllgeName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#VllgeName').css({ "background-color": "#ffffff" });
            $('#AreaHtrs').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaHtrs').css({ "background-color": "#ffffff" });
            $('#AreaBreth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaBreth').css({ "background-color": "#ffffff" });
            $('#AreaLnth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaLnth').css({ "background-color": "#ffffff" });
            //opt = 1;
        }
        else if (tank != "0") {
            $('#ddlowntank').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlowntank').css({ "background-color": "#ffffff" });
        }

        if (category1 == "0" || category1 == "-Select-") {
            text += "<br /> -Please select category.";
            $('#ddlcategory').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlcategory').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (category1 != "0") {
            $('#ddlcategory').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlcategory').css({ "background-color": "#ffffff" });
        }

        if (LeasePeriod == null || LeasePeriod == "") {
            text += "<br /> -Please Enter LeasePeriod";
            $('#LeasePrd').attr('style', 'border:1px solid #d03100 !important;');
            $('#LeasePrd').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (LeasePeriod != null) {
            $('#LeasePrd').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#LeasePrd').css({ "background-color": "#ffffff" });
        }

        if (LeaseValue == null || LeaseValue == "") {
            text += "<br /> -Please Enter LeaseValue.";
            $('#LeaseVal').attr('style', 'border:1px solid #d03100 !important;');
            $('#LeaseVal').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (LeaseValue != null) {
            $('#LeaseVal').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#LeaseVal').css({ "background-color": "#ffffff" });
        }
    }

    if (tank == '103') {
        if (AreaLength == null || AreaLength == "" && AreaBreth == null || AreaBreth == '' && AreaHaters == null || AreaHaters == "" && VllgeName == null || VllgeName == "" && KhataNo == null || KhataNo == "") {
            $('#PlotNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PlotNo').css({ "background-color": "#ffffff" });
            $('#KhataNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#KhataNo').css({ "background-color": "#ffffff" });
            $('#VllgeName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#VllgeName').css({ "background-color": "#ffffff" });
            $('#AreaHtrs').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaHtrs').css({ "background-color": "#ffffff" });
            $('#AreaBreth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaBreth').css({ "background-color": "#ffffff" });
            $('#AreaLnth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaLnth').css({ "background-color": "#ffffff" });
        }
        else if (tank != "0") {
            $('#ddlowntank').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlowntank').css({ "background-color": "#ffffff" });
        }

        if (category1 == "0" || category1 == "-Select-") {
            text += "<br /> -Please select category.";
            $('#ddlcategory').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlcategory').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (category1 != "0") {
            $('#ddlcategory').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlcategory').css({ "background-color": "#ffffff" });
        }

        if (LeasePeriod == null || LeasePeriod == "") {
            text += "<br /> -Please Enter LeasePeriod";
            $('#LeasePrd').attr('style', 'border:1px solid #d03100 !important;');
            $('#LeasePrd').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (LeasePeriod != null) {
            $('#LeasePrd').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#LeasePrd').css({ "background-color": "#ffffff" });
        }

        if (LeaseValue == null || LeaseValue == "") {
            text += "<br /> -Please Enter LeaseValue.";
            $('#LeaseVal').attr('style', 'border:1px solid #d03100 !important;');
            $('#LeaseVal').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (LeaseValue != null) {
            $('#LeaseVal').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#LeaseVal').css({ "background-color": "#ffffff" });
        }
    }

    //logic for Exavation Starts Here
    if (tank1 == '107') {
        if (category1 == "0" || category1 == "-Select-") {
            $('#ddlcategory').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlcategory').css({ "background-color": "#ffffff" });
        }
        else if (tank1 != "0" || tank1 == "-Select-") {
            $('#ddlowntank1').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlowntank1').css({ "background-color": "#ffffff" });
        }

        if (AreaLength == null || AreaLength == "") {
            text += "<br /> -Please Enter AreaLength.";
            $('#AreaLnth').attr('style', 'border:1px solid #d03100 !important;');
            $('#AreaLnth').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (AreaLength != null) {
            $('#AreaLnth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaLnth').css({ "background-color": "#ffffff" });
        }

        if (AreaBreth == null || AreaBreth == '') {
            text += "<br /> -Please Enter AreaBreth";
            $('#AreaBreth').attr('style', 'border:1px solid #d03100 !important;');
            $('#AreaBreth').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (AreaBreth != null) {
            $('#AreaBreth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaBreth').css({ "background-color": "#ffffff" });
        }

        if (AreaHaters == null || AreaHaters == "") {
            text += "<br /> -Please Enter AreaHtrs";
            $('#AreaHtrs').attr('style', 'border:1px solid #d03100 !important;');
            $('#AreaHtrs').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (AreaHaters != null) {
            $('#AreaHtrs').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaHtrs').css({ "background-color": "#ffffff" });
        }

        if (VllgeName == null || VllgeName == "") {
            text += "<br /> -Please Enter VllgeName";
            $('#VllgeName').attr('style', 'border:1px solid #d03100 !important;');
            $('#VllgeName').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (VllgeName != null) {
            $('#VllgeName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#VllgeName').css({ "background-color": "#ffffff" });
        }

        if (KhataNo == null || KhataNo == "") {
            text += "<br /> -Please Enter KhataNo";
            $('#KhataNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#KhataNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (KhataNo != null) {
            $('#KhataNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#KhataNo').css({ "background-color": "#ffffff" });
        }

        if (PlotNo == null || PlotNo == "") {
            text += "<br /> -Please Enter PlotNo";
            $('#PlotNo').attr('style', 'border:1px solid #d03100 !important;');
            $('#PlotNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (PlotNo != null) {
            $('#PlotNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PlotNo').css({ "background-color": "#ffffff" });
        }
    }

    if (tank1 == '108') {
        if (AreaLength == null || AreaLength == "" && AreaBreth == null || AreaBreth == '' && AreaHaters == null || AreaHaters == "" && VllgeName == null || VllgeName == "" && KhataNo == null || KhataNo == "") {
            $('#PlotNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PlotNo').css({ "background-color": "#ffffff" });
            $('#KhataNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#KhataNo').css({ "background-color": "#ffffff" });
            $('#VllgeName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#VllgeName').css({ "background-color": "#ffffff" });
            $('#AreaHtrs').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaHtrs').css({ "background-color": "#ffffff" });
            $('#AreaBreth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaBreth').css({ "background-color": "#ffffff" });
            $('#AreaLnth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaLnth').css({ "background-color": "#ffffff" });
        }
        else if (tank1 != "0") {
            $('#ddlowntank1').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlowntank1').css({ "background-color": "#ffffff" });
        }

        if (category1 == "0" || category1 == "-Select-") {
            text += "<br /> -Please select category.";
            $('#ddlcategory').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlcategory').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (category1 != "0") {
            $('#ddlcategory').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlcategory').css({ "background-color": "#ffffff" });
        }

        if (LeasePeriod == null || LeasePeriod == "") {
            text += "<br /> -Please Enter LeasePeriod";
            $('#LeasePrd').attr('style', 'border:1px solid #d03100 !important;');
            $('#LeasePrd').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (LeasePeriod != null) {
            $('#LeasePrd').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#LeasePrd').css({ "background-color": "#ffffff" });
        }

        if (LeaseValue == null || LeaseValue == "") {
            text += "<br /> -Please Enter LeaseValue.";
            $('#LeaseVal').attr('style', 'border:1px solid #d03100 !important;');
            $('#LeaseVal').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (LeaseValue != null) {
            $('#LeaseVal').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#LeaseVal').css({ "background-color": "#ffffff" });
        }
    }

    if (tank1 == '109') {
        if (AreaLength == null || AreaLength == "" && AreaBreth == null || AreaBreth == '' && AreaHaters == null || AreaHaters == "" && VllgeName == null || VllgeName == "" && KhataNo == null || KhataNo == "") {
            $('#PlotNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PlotNo').css({ "background-color": "#ffffff" });
            $('#KhataNo').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#KhataNo').css({ "background-color": "#ffffff" });
            $('#VllgeName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#VllgeName').css({ "background-color": "#ffffff" });
            $('#AreaHtrs').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaHtrs').css({ "background-color": "#ffffff" });
            $('#AreaBreth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaBreth').css({ "background-color": "#ffffff" });
            $('#AreaLnth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#AreaLnth').css({ "background-color": "#ffffff" });
        }
        else if (tank1 != "0") {
            $('#ddlowntank1').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlowntank1').css({ "background-color": "#ffffff" });
        }

        if (category1 == "0" || category1 == "-Select-") {
            text += "<br /> -Please select category.";
            $('#ddlcategory').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddlcategory').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (category1 != "0") {
            $('#ddlcategory').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddlcategory').css({ "background-color": "#ffffff" });
        }

        if (LeasePeriod == null || LeasePeriod == "") {
            text += "<br /> -Please Enter LeasePeriod";
            $('#LeasePrd').attr('style', 'border:1px solid #d03100 !important;');
            $('#LeasePrd').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (LeasePeriod != null) {
            $('#LeasePrd').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#LeasePrd').css({ "background-color": "#ffffff" });
        }

        if (LeaseValue == null || LeaseValue == "") {
            text += "<br /> -Please Enter LeaseValue.";
            $('#LeaseVal').attr('style', 'border:1px solid #d03100 !important;');
            $('#LeaseVal').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (LeaseValue != null) {
            $('#LeaseVal').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#LeaseVal').css({ "background-color": "#ffffff" });
        }
    }

    // Exavation Logic End's Here

    var financemode = $("#financeMeans").val();
    if (financemode == "-Select-" || financemode == "0") {
        text += " <br /> -Please Select Finance Mode";
        $('#financeMeans').attr('style', 'border:1px solid red !important;');
        $('#financeMeans').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#financeMeans').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#financeMeans').css({ "background-color": "#ffffff" });
    }

    // **** Field gets highlighted if user leaves it blank ****
    if (castcategory == "0" || castcategory == "-Select-") {
        text += "<br /> -Please select Cast category.";
        $('#ddlCastCategory').attr('style', 'border:1px solid #d03100 !important;');
        $('#ddlCastCategory').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (castcategory != "0") {
        $('#ddlCastCategory').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddlCastCategory').css({ "background-color": "#ffffff" });
    }

    if (annualincome == null || annualincome == "") {
        text += "<br /> -Please Enter AnnualIncome.";
        $('#AnnualIncome').attr('style', 'border:1px solid #d03100 !important;');
        $('#AnnualIncome').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (annualincome != null) {
        $('#AnnualIncome').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#AnnualIncome').css({ "background-color": "#ffffff" });
    }

    if ($('#DistrictName').val() == "0") {
        text += "<br /> -Please Select District Name.";
        $('#DistrictName').attr('style', 'border:1px solid #d03100 !important;');
        $('#DistrictName').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#DistrictName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#DistrictName').css({ "background-color": "#ffffff" });
    }

    if ($('#DistrictName').val() == "0" || $('#BlockName').val() == "") {
        text += "<br /> -Please Enter Block Name.";
        $('#BlockName').attr('style', 'border:1px solid #d03100 !important;');
        $('#BlockName').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#BlockName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#BlockName').css({ "background-color": "#ffffff" });
    }


    if ($('#DistrictName').val() == "0" || $('#GramPanchayatName').val() == "") {
        text += "<br /> -Please Enter GramPanchayat Name.";
        $('#GramPanchayatName').attr('style', 'border:1px solid #d03100 !important;');
        $('#GramPanchayatName').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#GramPanchayatName').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#GramPanchayatName').css({ "background-color": "#ffffff" });
    }


    if ($('#financeMeans').val() == "BankFinance") {
        if ($('#txtBankName').val() == null || $('#txtBankName').val() == "") {
            text += "<br /> -Please Enter Prefered Bank Name.";
            $('#txtBankName').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtBankName').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtBankName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtBankName').css({ "background-color": "#ffffff" });
        }

        if ($('#txtBranchName').val() == null || $('#txtBranchName').val() == "") {
            text += "<br /> -Please Enter Branch Name.";
            $('#txtBranchName').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtBranchName').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#txtBranchName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtBranchName').css({ "background-color": "#ffffff" });
        }
    }


    if ($('#EduQualification').val() == "0" || $('#EduQualification').val() == "-Select-") {
        text += "<br /> -Please Select Educational Qualification.";
        $('#EduQualification').attr('style', 'border:1px solid #d03100 !important;');
        $('#EduQualification').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#EduQualification').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#EduQualification').css({ "background-color": "#ffffff" });
    }


    if ($('#DOB').val() == null || $('#DOB').val() == "") {
        text += "<br /> -Please Enter Date Of Birth.";
        $('#DOB').attr('style', 'border:1px solid #d03100 !important;');
        $('#DOB').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#DOB').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#DOB').css({ "background-color": "#ffffff" });
    }


    if ($('#ddlServiceType').val() == "438")
    {
        if ($('#SpeciesCultured').val() == "0" || $('#SpeciesCultured').val() == "-Select-") {
            text += "<br /> -Please Select Species Cultured.";
            $('#SpeciesCultured').attr('style', 'border:1px solid #d03100 !important;');
            $('#SpeciesCultured').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#SpeciesCultured').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#SpeciesCultured').css({ "background-color": "#ffffff" });
        }
    }


    if (Presentstatus == '204') {
        if (Tankstatus == "0") {
            text += "<br /> -Please select Presentstatus.";
            $('#ddltankStatus').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddltankStatus').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Presentstatus != "0") {
            $('#ddltankStatus').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddltankStatus').css({ "background-color": "#ffffff" });
        }

        if (Tankstatus == "0" || Tankstatus == "-Select-") {
            text += "<br /> -Please select Tank Status.";
            $('#ddltankstatusid').attr('style', 'border:1px solid #d03100 !important;');
            $('#ddltankstatusid').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (Tankstatus != "0") {
            $('#ddltankstatusid').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddltankstatusid').css({ "background-color": "#ffffff" });
        }
    }


    if (Presentstatus == '201' || Presentstatus == '202' || Presentstatus == '203') {
    } else if (Presentstatus == "-Select-") {
        $('#ddltankStatus').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddltankStatus').css({ "background-color": "#ffffff" });
    }


    if (reqservice != "Excavation" && reqservice != "0") {
        if (ProductnQuantal == null || ProductnQuantal == "") {
            text += "<br /> -Please Enter Production Quantal.";
            $('#PrdctnQntl').attr('style', 'border:1px solid #d03100 !important;');
            $('#PrdctnQntl').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (ProductnQuantal != null) {
            $('#PrdctnQntl').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PrdctnQntl').css({ "background-color": "#ffffff" });
        }
    }


    if (reqservice != "Excavation" && reqservice != "0") {
        if (ProductValue == null || ProductValue == "") {
            text += "<br /> -Please Enter Production Value.";
            $('#PrdctnVal').attr('style', 'border:1px solid #d03100 !important;');
            $('#PrdctnVal').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (ProductValue != null) {
            $('#PrdctnVal').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#PrdctnVal').css({ "background-color": "#ffffff" });
        }
    }

    if (reqservice == "Excavation") {
        $('#ddltankStatus').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#PrdctnQntl').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#PrdctnVal').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#ddltankStatus').prop('disabled', true);
        $('#PrdctnQntl').prop('disabled', true);
        $('#PrdctnVal').prop('disabled', true);
    }

    // **** Education Section ***** //

    //var EddlBoardState = $("#EddlBoardState option:selected").text();
    //var BoardName = $("#boardName");
    //var NameOfHigherSecondary = $("#hscName");
    //var NameOfUniversity = $("#universrityName");
    //var txtPssngYr = $("#txtPssngYr option:selected").text(); //DropDown
    //var PssngYr = $("#txtPssngYr option:selected").val();
    //var gradeDivision = $("#gradeDivision option:selected").text();
    //var ddlPctgeCalclte = $("#ddlPctgeCalclte option:selected").text();
    //var txtTotalMarks = $("#txtTotalMarks");
    //var txtMarkSecure = $("#txtMarkSecure");
    //var txtPercentage = $("#txtPercentage");

    //if (EddlBoardState != null && (EddlBoardState == '' || EddlBoardState == '-Select-')) {
    //    text += "<br /> -Please Select State Of Education.";
    //    $('#EddlBoardState').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#EddlBoardState').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#EddlBoardState').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#EddlBoardState').css({ "background-color": "#ffffff" });
    //}

    //if (BoardName != null && BoardName.val() == '') {
    //    text += "<br /> -Please Enter Education Board Name.";
    //    $('#boardName').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#boardName').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#boardName').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#boardName').css({ "background-color": "#ffffff" });
    //}

    //if (NameOfUniversity != null && NameOfUniversity.val() == '') {
    //    text += "<br /> -Please Enter Name of the Examination Passed ";
    //    $('#universrityName').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#universrityName').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#universrityName').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#universrityName').css({ "background-color": "#ffffff" });
    //}

    //if (NameOfHigherSecondary != null && NameOfHigherSecondary.val() == '') {
    //    text += "<br /> -Please Enter Name Of School.";
    //    $('#hscName').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#hscName').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#hscName').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#hscName').css({ "background-color": "#ffffff" });
    //}

    //if (PssngYr != null && (PssngYr == '' || PssngYr == '0')) {
    //    text += "<br /> -Please Select Year of Passing.";
    //    $('#txtPssngYr').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#txtPssngYr').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#txtPssngYr').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#txtPssngYr').css({ "background-color": "#ffffff" });
    //}

    //var gradeDivision = $('#gradeDivision option:selected').val();
    //if (gradeDivision != null && (gradeDivision == '' || gradeDivision == '0')) {
    //    text += "<br /> -Please Select Division.";
    //    $('#gradeDivision').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#gradeDivision').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#gradeDivision').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#gradeDivision').css({ "background-color": "#ffffff" });
    //}

    //if (txtTotalMarks != null && txtTotalMarks.val() == '') {
    //    text += "<br /> -Please Enter Total Marks. ";
    //    $('#txtTotalMarks').attr('style', 'border:1px solid #d03100 !important;');
    //    $('#txtTotalMarks').css({ "background-color": "#fff2ee" });
    //    opt = 1;
    //} else {
    //    $('#txtTotalMarks').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#txtTotalMarks').css({ "background-color": "#ffffff" });
    //}

    //if ($("#ddlPctgeCalclte").val() != "501") {
    //    if (txtMarkSecure != null && txtMarkSecure.val() == '') {
    //        text += "<br /> -Please enter Marks Secured . ";
    //        $('#txtMarkSecure').attr('style', 'border:1px solid #d03100 !important;');
    //        $('#txtMarkSecure').css({ "background-color": "#fff2ee" });
    //        opt = 1;
    //    } else {
    //        $('#txtMarkSecure').attr('style', 'border:1px solid #cdcdcd !important;');
    //        $('#txtMarkSecure').css({ "background-color": "#ffffff" });
    //    }

    //} else {
    //    $('#txtMarkSecure').attr('style', 'border:1px solid #cdcdcd !important;');
    //    $('#txtMarkSecure').css({ "background-color": "#ffffff" });
    //}

    //section 1
    var AvailedAnytraining = $("input[name='radio1']:checked").val();

    if (AvailedAnytraining == null) {
        text += "<br /> - Please choose Candidate has Availed Any training.";
        opt = 1;
    }

    var NoOfTraining = $('#trainingYear').val();
    var week = $('#trainingWeek').val();
    var month = $('#trainingMonth').val();
    var Year = $('#trainingYear2').val();
    var nameoftraining = $("#ddltrainingName").val();
    var otherTrainingnme = $("#otherTrainingnme").val();

    //************* Textboxes gets highlighted if loan field blank in this section *******************************
    if (AvailedAnytraining == "yes") {
        if (NoOfTraining == null || NoOfTraining == "") {
            text += "<br /> - Please Enter No Of Training ";
            $('#trainingYear').attr('style', 'border:1px solid red !important;');
            $('#trainingYear').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#trainingYear').attr('style', 'border:1px solid #ddd !important;');
            $('#trainingYear').css({ "background-color": "#ffffff" });
        }

        if (week == "0") {
            text += "<br /> - Please select Week ";
            $('#trainingWeek').attr('style', 'border:1px solid red !important;');
            $('#trainingWeek').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#trainingWeek').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#trainingWeek').css({ "background-color": "#ffffff" });
        }

        if (month == "0") {
            text += "<br /> - Please select Month ";
            $('#trainingMonth').attr('style', 'border:1px solid red !important;');
            $('#trainingMonth').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#trainingMonth').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#trainingMonth').css({ "background-color": "#ffffff" });
        }

        if (Year == "0") {
            text += "<br /> - Please select Year ";
            $('#trainingYear2').attr('style', 'border:1px solid red !important;');
            $('#trainingYear2').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#trainingYear2').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#trainingYear2').css({ "background-color": "#ffffff" });
        }

        if (nameoftraining == "0") {
            text += "<br /> - Please Select Training ";
            $('#ddltrainingName').attr('style', 'border:1px solid red !important;');
            $('#ddltrainingName').css({ "background-color": "#fff2ee" });
            opt = 1;
        }
        else {
            $('#ddltrainingName').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#ddltrainingName').css({ "background-color": "#ffffff" });
        }

        if (nameoftraining == "FFDA" || nameoftraining == "BFDA" || nameoftraining == "NFDB" || nameoftraining == "CIFA") {
            $('#otherTrainingnme').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#otherTrainingnme').css({ "background-color": "#ffffff" });
        }

        if (nameoftraining == "Others") {
            if (otherTrainingnme == "" || otherTrainingnme == null) {
                text += "<br /> - Please select Name of Training ";
                $('#otherTrainingnme').attr('style', 'border:1px solid red !important;');
                $('#otherTrainingnme').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#otherTrainingnme').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#otherTrainingnme').css({ "background-color": "#ffffff" });
            }
        }
    }

    //section 2
    var menmberpfcs = $("input[name='radio2']:checked").val();
    if (menmberpfcs == null) {
        text += "<br /> - Please choose menmber OF PFCS ";
        opt = 1;
    } else {
    }

    //************* Textboxes gets highlighted if loan field blank in this section *******************************
    var membername = $("#memberName").val();
    if (menmberpfcs == "yes") {
        if (membername == null || membername == '') {
            text += " <br /> - Please choose member Name";
            $('#memberName').attr('style', 'border:1px solid red !important;');
            $('#memberName').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        else {
            $('#memberName').attr('style', 'border:1px solid #ddd !important;');
            $('#memberName').css({ "background-color": "#ffffff" });
        }

        var Address = $("#addressPFCSSHG").val();
        if (Address == null || Address == '') {
            text += " <br /> -Please choose member Address OF PFCS";
            $('#addressPFCSSHG').attr('style', 'border:1px solid red !important;');
            $('#addressPFCSSHG').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        else {
            $('#addressPFCSSHG').attr('style', 'border:1px solid #ddd !important;');
            $('#addressPFCSSHG').css({ "background-color": "#ffffff" });
        }

        var memberno = $("#membershipNo").val();
        if (memberno == null || memberno == '') {
            text += " <br /> -Please choose member No.";
            $('#membershipNo').attr('style', 'border:1px solid red !important;');
            $('#membershipNo').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        else {
            $('#membershipNo').attr('style', 'border:1px solid #ddd !important;');
            $('#membershipNo').css({ "background-color": "#ffffff" });
        }
    }

    // section 3
    var InfrastructureatFarmSide = $("input[name='radio3']:checked").val();
    if (InfrastructureatFarmSide == null) {
        text += "<br /> - Please enter InfrastructureatFarmSide.";
        opt = 1;
    } else {
    }

    var road = 0;
    if ($('#road').is(":checked")) {
        // it is checked
        road = 1;
    }

    var electricity = 0;
    if ($('#electricity').is(":checked")) {
        // it is checked
        electricity = 1;
    }

    var canal = 0;
    if ($('#canal').is(":checked")) {
        // it is checked
        canal = 1;
    }

    if (InfrastructureatFarmSide == "yes") {
        if (road == 0 || electricity == 0 || canal == 0) {
            text += "<br /> - Please Check Road, Electricity or Canal . ";
            opt = 1;
        }
    }

    //section 4
    var Previouslyloan = $("input[name='radio4a']:checked").val();
    if (Previouslyloan == null) {
        text += "<br /> - Please choose Previously loan  ";
        opt = 1;
    } else {
    }
    var bankname = $("#bankName").val();
    var loanPurpose = $("#loanPurpose").val();
    var loanamount = $("#loanAmt").val();
    var balance = $("#OutstndngloanAmt").val();

    //************* Textboxes gets highlighted if loan field blank in this section *******************************
    if (Previouslyloan == "yes") {
        if (bankname == null || bankname == '') {
            text += " <br /> - Please choose member Name";
            $('#bankName').attr('style', 'border:1px solid red !important;');
            $('#bankName').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        else {
            $('#bankName').attr('style', 'border:1px solid #ddd !important;');
            $('#bankName').css({ "background-color": "#ffffff" });
        }
        if (loanPurpose == null || loanPurpose == '') {
            text += " <br /> - Please choose loan Purpose";
            $('#loanPurpose').attr('style', 'border:1px solid red !important;');
            $('#loanPurpose').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        else {
            $('#loanPurpose').attr('style', 'border:1px solid #ddd !important;');
            $('#loanPurpose').css({ "background-color": "#ffffff" });
        }

        if (loanamount == null || loanamount == '') {
            text += " <br /> - Please choose loan amount";
            $('#loanAmt').attr('style', 'border:1px solid red !important;');
            $('#loanAmt').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        else {
            $('#loanAmt').attr('style', 'border:1px solid #ddd !important;');
            $('#loanAmt').css({ "background-color": "#ffffff" });
        }

        if (balance == null || balance == '') {
            text += " <br /> - Please choose Outstndng loan Amount";
            $('#OutstndngloanAmt').attr('style', 'border:1px solid red !important;');
            $('#OutstndngloanAmt').css({ "background-color": "#fff2ee" });
            opt = 1;
        }

        else {
            $('#OutstndngloanAmt').attr('style', 'border:1px solid #ddd !important;');
            $('#OutstndngloanAmt').css({ "background-color": "#ffffff" });
        }
    }

    //************* Last section *************************
    //************* Textbox gets highlighted if blank *******************************
    if (WitnessName1 == null || WitnessName1 == "") {
        text += "<br /> -Please Enter WitnessName1.";
        $('#WitnessNme1').attr('style', 'border:1px solid #d03100 !important;');
        $('#WitnessNme1').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (WitnessName1 != null) {
        $('#WitnessNme1').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#WitnessNme1').css({ "background-color": "#ffffff" });
    }

    //************* Textbox gets highlighted if blank *******************************
    if (AddWitness1 == null || AddWitness1 == "") {
        text += "<br /> -Please Enter AddWitness1.";
        $('#AddWtness1').attr('style', 'border:1px solid #d03100 !important;');
        $('#AddWtness1').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else if (AddWitness1 != null) {
        $('#AddWtness1').attr('style', 'border:1px solid #cdcdcd !important;');
        $('#AddWtness1').css({ "background-color": "#ffffff" });
    }

    //************* Show alert popup for options which has not filled by user. **************
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}