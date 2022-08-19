
$(document).ready(function () {
    debugger;
    var StateControl = "21";
    var DistrictControl = "District";
    var TalukaControl = "Taluka";
    var VillageControl = "Village";
    var category = "";

    GetDistrict(category, StateControl, DistrictControl)

    $('#DOPossission').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '-1d',
        yearRange: "-150:+0",
        onSelect: function (date) {

            var t_DOP = $("#DOPossission").val();

            var S_date = new Date(t_DOP.substr(6, 4), t_DOP.substr(3, 2) - 1, t_DOP.substr(0, 2));
            var selectedYear = S_date.getFullYear();
        }
    });

    $('#divUsed').hide();
    $('#divDetails').hide();
    $('#txtResDetails').hide();
    $('#txtModDetails').hide();
    $('#txtNOCDetail').hide();
    $('#txtlawDetails').hide();
    $('#divDeed').hide();
    $("[name='" + DistrictControl + "']").bind("change", function (e) { return GetSubDistrict("", DistrictControl, TalukaControl); });
    $("[name='" + TalukaControl + "']").bind("change", function (e) { return GetVillage("", TalukaControl, VillageControl); });

    $("#btnSubmit").bind("click", function (e) { return SubmitData(); });

});

function chkClick(Ctrl, txtCtrl) {
    debugger;
    var t_SelectedVal = $('#' + Ctrl).val();
    if (t_SelectedVal == 1) {
        $('#' + txtCtrl).show(500);
    }
    else {
        $('#' + txtCtrl).hide(500);
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
    var dpt = qs["DPT"];
    var dist = qs["DIST"];
    var blk = qs["BLK"];
    var pan = qs["PAN"];
    var ofc = qs["OFC"];
    var ofr = qs["OFR"];

    var DArr = $('#DOPossission').val().split("/");
    var DOP = DArr[2] + "-" + DArr[1] + "-" + DArr[0];

    var rbtLand = "";
    var rbtReg = "";
    var rbtBuild = "";
    var rbtPlot = "";
    var rbtMort = "";
    var rbtNOC = "";
    var rbtLaw = "";
    var rbtRent = "";
    var rbttax = "";
    //var IsHandi;
    //if ($('#ddlHand').val() == '101') { IsHandi = '1' }
    //else { IsHandi = '0' }
    var backend = $("input[name=grpLand]:checked").val()
    if (backend == 1) {
        rbtLand = 'Occupied';
    }
    else {
        rbtLand = 'Vacant';
    }
    var reg = $("input[name=grpReg]:checked").val()
    if (reg == 1) {
        rbtReg = '1';
    }
    else {
        rbtReg = '0';
    }
    var Build = $("input[name=grpBuild]:checked").val()
    if (Build == 1) {
        rbtBuild = '1';
    }
    else {
        rbtBuild = '0';
    }
    var Plot = $("input[name=grpPlot]:checked").val()
    if (Plot == 1) {
        rbtPlot = '1';
    }
    else {
        rbtPlot = '0';
    }
    var Mort = $("input[name=grpMort]:checked").val()
    if (Mort == 1) {
        rbtMort = '1';
    }
    else {
        rbtMort = '0';
    }
    var NOC = $("input[name=grpNOC]:checked").val()
    if (NOC == 1) {
        rbtNOC = '1';
    }
    else {
        rbtNOC = '0';
    }

    var Law = $("input[name=grpLaw]:checked").val()
    if (Law == 1) {
        rbtLaw = '1';
    }
    else {
        rbtLaw = '0';
    }

    var tax = $("input[name=grptax]:checked").val()
    if (tax == 1) {
        rbttax = '1';
    }
    else {
        rbttax = '0';
    }
    var amt = $("input[name=grpAmt]:checked").val()
    if (amt == 1) {
        rbtRent = '1';
    }
    else {
        rbtRent = '0';
    }
   



    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID': uid,
        'District': $('#ddlDistrict').val(),
        'Block': $('#ddlTaluka').val(),
        'Mouza': $('#ddlVillage').val(),
        'DrawingNo': $('#txtDrawing').val(),
        'PlotNo': $('#txtPlotNo').val(),
        'AllottedArea': $('#txtArea').val(),
        'AreaUnit': $('#ddlUnit option:selected').text(),
        'KhataNo': $('#txtKhata').val(),
        'RevenuePlotNo': $('#txtPlotReve').val(),
        'PossessionDate': DOP,
        'LandUsed': rbtLand,
        'LandUsedType': $('#ddlLandType option:selected').text(),
        'IsRegistered': rbtReg,
        'RegistrationNo': $('#txtRegistration').val(),
        'DeedBookNo': $('#txtDeedBook').val(),
        'DeedVolumeNo': $('#txtVolume').val(),
        'FromPageDeedNo': $('#txtPagefrom').val(),
        'ToPageDeedNo': $('#txtPageTo').val(),
        'IsConstruted': rbtBuild,
        'IsHoldingTaxAccessed': rbttax,
        'ConstrutedDetail': $('#txtDetails').val(),
        'IsNonResidential': rbtPlot,
        'ResidentialDetail': $('#txtResDetails').val(),
        'IsMortgaged': rbtMort,
        'MortgagedDetail': $('#txtModDetails').val(),
        'IsNOCEnclosed': rbtNOC,
        'NOCDetail': $('#txtNOCDetail').val(),
        'IsDisputed': $('#grpLaw').val(),
        'DisputeDetail': $('#txtlawDetails').val(),
        'RentAmount': $('#txtAmtRent').val(),
        'WeatherUpdated': rbtRent,
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
            url: '/WebApp/Kiosk/Conversion/ConversionForm.aspx/InsertConversion',
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
//validation in coversion by Anjali soni
function ValidateForm() {

    var text = "";
    var opt = "";
    debugger;

    /// Basic Information 
    var District = $("#ddlDistrict option:selected").val();
    var taluka = $("#ddlTaluka option:selected").val();
    var village = $("#ddlVillage option:selected").val();
    var drawing = $("#txtDrawing").val();
    var ploteno = $("#txtPlotNo").val();
    var area = $("#txtArea").val();
    var Unit = $("#ddlUnit option:selected").val();
    var Khata = $("#txtKhata").val();
    var revenue = $("#txtPlotReve").val();
    var dob = $("#DOPossission").val();
    


    if (District == "0" || District == "-Select-") {
        text += "<br /> -Please select District.";
        $('#ddlDistrict').attr('style', 'border:1px solid red !important;');
        $('#ddlDistrict').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlDistrict').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlDistrict').css({ "background-color": "#ffffff" });
    }

    if (taluka == "Select Taluka" || taluka == "-Select-" || taluka=="0") {
        text += "<br /> -Please select Taluka.";
        $('#ddlTaluka').attr('style', 'border:1px solid red !important;');
        $('#ddlTaluka').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {

        $('#ddlTaluka').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlTaluka').css({ "background-color": "#ffffff" });
    }

    if (village == "Select Village" || village == "-Select-" || village == "0") {
        text += "<br /> -Please select Village.";
        $('#ddlVillage').attr('style', 'border:1px solid red !important;');
        $('#ddlVillage').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlVillage').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlVillage').css({ "background-color": "#ffffff" });
    }
    
    if (drawing == null || drawing == "") {
        text += "<br /> -Please Enter Drawing ";
        $('#txtDrawing').attr('style', 'border:1px solid red !important;');
        $('#txtDrawing').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtDrawing').attr('style', 'border:1px solid #ddd !important;');
        $('#txtDrawing').css({ "background-color": "#ffffff" });
    }
    if (ploteno == null || ploteno == "") {
        text += "<br /> -Please Enter PloteNo. ";
        $('#txtPlotNo').attr('style', 'border:1px solid red !important;');
        $('#txtPlotNo').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPlotNo').attr('style', 'border:1px solid #ddd !important;');
        $('#txtPlotNo').css({ "background-color": "#ffffff" });
    }

    if (area == null || area == "") {
        text += "<br /> -Please Enter Area. ";
        $('#txtArea').attr('style', 'border:1px solid red !important;');
        $('#txtArea').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtArea').attr('style', 'border:1px solid #ddd !important;');
        $('#txtArea').css({ "background-color": "#ffffff" });
    }

    if (Unit == "0" || Unit == "-Select Unit-") {
        text += "<br /> -Please select Unit.";
        $('#ddlUnit').attr('style', 'border:1px solid red !important;');
        $('#ddlUnit').css({ "background-color": "#fff2ee" });
        opt = 1;
    }
    else {
        $('#ddlUnit').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlUnit').css({ "background-color": "#ffffff" });
    }

    if (Khata == null || Khata == "") {
        text += "<br /> -Please Enter Khata. ";
        $('#txtKhata').attr('style', 'border:1px solid red !important;');
        $('#txtKhata').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtKhata').attr('style', 'border:1px solid #ddd !important;');
        $('#txtKhata').css({ "background-color": "#ffffff" });
    }
    if (revenue == null || revenue == "") {
        text += "<br /> -Please Enter revenue. ";
        $('#txtPlotReve').attr('style', 'border:1px solid red !important;');
        $('#txtPlotReve').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPlotReve').attr('style', 'border:1px solid #ddd !important;');
        $('#txtPlotReve').css({ "background-color": "#ffffff" });
    }

    if (dob == null || dob == "") {
        text += "<br /> -Please Enter DOB. ";
        $('#DOPossission').attr('style', 'border:1px solid red !important;');
        $('#DOPossission').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#DOPossission').attr('style', 'border:1px solid #ddd !important;');
        $('#DOPossission').css({ "background-color": "#ffffff" });
    }

    //section 1
    var prentlandused = $("input:radio[name='grpLand']:checked").val();
    if (prentlandused == null) {
        text += "<br /> - Please choose present land used.";
        opt = 1;
    }

   
    if (prentlandused == "1") {
        var LandType = $('#ddlLandType').val();
        if (LandType == "0" || LandType == "--Select Land Used Type--") {
            text += "<br /> -Please Select Land Used Type ";
            $('#ddlLandType').attr('style', 'border:1px solid red !important;');
            $('#ddlLandType').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#ddlLandType').attr('style', 'border:1px solid #ddd !important;');
            $('#ddlLandType').css({ "background-color": "#ffffff" });
        }
        
    }
    //section 2
    var leasedeed = $("input:radio[name='grpReg']:checked").val();
    if (leasedeed == null) {
        text += "<br /> - Please choose whether lease deed Executed and registered.";
        opt = 1;
    }
    if (leasedeed == "1") {
        var Registration = $('#txtRegistration').val();
        if (Registration == null || Registration == "") {
            text += "<br /> -Please Enter Registration ";
            $('#txtRegistration').attr('style', 'border:1px solid red !important;');
            $('#txtRegistration').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtRegistration').attr('style', 'border:1px solid #ddd !important;');
            $('#txtRegistration').css({ "background-color": "#ffffff" });
        }
        var DeedBook = $('#txtDeedBook').val();
        if (DeedBook == null || DeedBook == "") {
            text += "<br /> -Please Enter DeedBook ";
            $('#txtDeedBook').attr('style', 'border:1px solid red !important;');
            $('#txtDeedBook').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtDeedBook').attr('style', 'border:1px solid #ddd !important;');
            $('#txtDeedBook').css({ "background-color": "#ffffff" });
        }
        var Volume = $('#txtVolume').val();
        if (Volume == null || Volume == "") {
            text += "<br /> -Please Enter Volume ";
            $('#txtVolume').attr('style', 'border:1px solid red !important;');
            $('#txtVolume').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtVolume').attr('style', 'border:1px solid #ddd !important;');
            $('#txtVolume').css({ "background-color": "#ffffff" });
        }
        var Pagefrom = $('#txtPagefrom').val();
        if (Pagefrom == null || Pagefrom == "") {
            text += "<br /> -Please Enter Pagefrom ";
            $('#txtPagefrom').attr('style', 'border:1px solid red !important;');
            $('#txtPagefrom').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtPagefrom').attr('style', 'border:1px solid #ddd !important;');
            $('#txtPagefrom').css({ "background-color": "#ffffff" });
        }
        var PageTo = $('#txtPageTo').val();
        if (PageTo == null || PageTo == "") {
            text += "<br /> -Please Enter PageTo ";
            $('#txtPageTo').attr('style', 'border:1px solid red !important;');
            $('#txtPageTo').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtPageTo').attr('style', 'border:1px solid #ddd !important;');
            $('#txtPageTo').css({ "background-color": "#ffffff" });
        }

    }
    //section 3
    var Buildingconstructed = $("input:radio[name='grpBuild']:checked").val();
    if (Buildingconstructed == null) {
        text += "<br /> - Please choose whether Building has been constructed.";
        opt = 1;
    }
    if (Buildingconstructed == "1") {
        var Details = $('#txtDetails').val();
        if (Details == null || Details == "") {
            text += "<br /> -Please Enter Details of approval plan ";
            $('#txtDetails').attr('style', 'border:1px solid red !important;');
            $('#txtDetails').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtDetails').attr('style', 'border:1px solid #ddd !important;');
            $('#txtDetails').css({ "background-color": "#ffffff" });
        }
        var holdingtextassessed = $("input:radio[name='grptax']:checked").val();
        if (holdingtextassessed == null) {
            text += "<br /> - Please choose If holding text assessed";
            opt = 1;
        }
    }
   
    //section 4
    var plotisbeingused = $("input:radio[name='grpPlot']:checked").val();
    if (plotisbeingused == null) {
        text += "<br /> - Please choose if the plot is being used.";
        opt = 1;
    }
    if (plotisbeingused == "1") {
        var ResDetails = $('#txtResDetails').val();
        if (ResDetails == null || ResDetails == "") {
            text += "<br /> -Please Enter Plot is Being used other than residential ";
            $('#txtResDetails').attr('style', 'border:1px solid red !important;');
            $('#txtResDetails').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtResDetails').attr('style', 'border:1px solid #ddd !important;');
            $('#txtResDetails').css({ "background-color": "#ffffff" });
        }
    }
    //section 5
    var propertiesstand = $("input:radio[name='grpMort']:checked").val();
    if (propertiesstand == null) {
        text += "<br /> - Please choose properties stand mortgaged.";
        opt = 1;
    }
    if (propertiesstand == "1") {
        var ModDetails = $('#txtModDetails').val();
        if (ModDetails == null || ModDetails == "") {
            text += "<br /> -Please Enter properties stand mortgaged ";
            $('#txtModDetails').attr('style', 'border:1px solid red !important;');
            $('#txtModDetails').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtModDetails').attr('style', 'border:1px solid #ddd !important;');
            $('#txtModDetails').css({ "background-color": "#ffffff" });
        }
    }
    //section 6
    var Noobjectioncirtificate = $("input:radio[name='grpNOC']:checked").val();
    if (Noobjectioncirtificate == null) {
        text += "<br /> - Please choose No objection cirtificate from mortgagee enclosed.";
        opt = 1;
    }
    if (Noobjectioncirtificate == "1") {
        var NOCDetail = $('#txtNOCDetail').val();
        if (NOCDetail == null || NOCDetail == "") {
            text += "<br /> -Please Enter No objection cirtificate ";
            $('#txtNOCDetail').attr('style', 'border:1px solid red !important;');
            $('#txtNOCDetail').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtNOCDetail').attr('style', 'border:1px solid #ddd !important;');
            $('#txtNOCDetail').css({ "background-color": "#ffffff" });
        }
    }
    //section 7
    var disputepending = $("input:radio[name='grpLaw']:checked").val();
    if (disputepending == null) {
        text += "<br /> - Please choose disputepending in the court of law regarding title of the property .";
        opt = 1;
    }
    if (disputepending == "1") {
        var lawDetails = $('#txtlawDetails').val();
        if (lawDetails == null || lawDetails == "") {
            text += "<br /> -Please Enter disputepending in the court of law regarding title of the property ";
            $('#txtlawDetails').attr('style', 'border:1px solid red !important;');
            $('#txtlawDetails').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else {
            $('#txtlawDetails').attr('style', 'border:1px solid #ddd !important;');
            $('#txtlawDetails').css({ "background-color": "#ffffff" });
        }
    }
    //section 8
    
    var AmtRent = $('#txtAmtRent').val();
    if (AmtRent == null || AmtRent == "") {
        text += "<br /> -Please Enter Ammount of annual ground rent ";
        $('#txtAmtRent').attr('style', 'border:1px solid red !important;');
        $('#txtAmtRent').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAmtRent').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAmtRent').css({ "background-color": "#ffffff" });
    }
   
    var disputepending = $("input:radio[name='grpAmt']:checked").val();
    if (disputepending == null) {
        text += "<br /> - Please choose whether up-to-date ground rent along with intrested for related payment .";
        opt = 1;
    }


    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}

