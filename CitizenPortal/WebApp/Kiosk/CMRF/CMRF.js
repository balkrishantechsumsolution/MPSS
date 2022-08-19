$(document).ready(function () {
    $('#divRecPurpose').hide();
    $('#divRecAmount').hide();
    $('#divRecomend').hide();
    $('#divDiseased').hide();
    $('#divHandicap').hide();

    $('#txtIncAgri').val("");
    $('#txtIncSalary').val("");
    $('#txtIncOther').val("");
    $('#txtIncTotal').val("");

    $('#txtAgri').val("");
    $('#txtSalary').val("");
    $('#txtOther').val("");
    $('#txtTotal').val("");

    //txtCost
    //txtExpenditure
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

});

$(document).ready(function () {
    console.log("ready!");
});

function fnNext() {
    SubmitData();
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

    //var IsHandi;
    //if ($('#ddlHand').val() == '101') { IsHandi = '1' }
    //else { IsHandi = '0' }
       

    var datavar = {

        'aadhaarNumber': uid,
        'ProfileID' : uid,
        'ApplicationTypeID': $('#ddlType').val(),
        'ApplicationType': $('#ddlType option:selected').text(),
        'ApplicationCategoryID': $('#ddlCategory').val(),
        'ApplicationCategory': $('#ddlCategory option:selected').text(),
        'FundAmount': $('#txtAmount').val(),
        'FundPurpose': $('#txtPurpose').val(),
        'FundReceivedEarlier': $('#ddlReceived').val(),
        'FundReceivedPurpose': $('#txtRecPurpose').val(),
        'FundReceivedAmount': $('#txtRecAmount').val(),        
        'IsHandDiseased': $('#ddlHand').val(),
        'HandDiseasedDetail': $('#txtDetail').val(),
        'RecommendedBy': $('#ddlRecommendation').val(),
        'Occupation': $('#txtOccupation').val(),
        'AnnualIncome': $('#txtIncome').val(),        
        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
        'AgricultureIncome': $('#txtAgri').val(),
        'SalaryIncome': $('#txtSalary').val(),
        'OtherIncome': $('#txtOther').val(),
        'DiseaseName': $('#txtDisease').val(),
        'TreatmentRequired': $('#txtTreatment').val(),
        'MedicineCost': $('#txtCost').val(),
        'Appratus': $('#txtAppratus').val(),
        'OtherExpenditure': $('#txtExpenditure').val(),
        'TreatmentPlace': $('#txtPlace').val(),
        'TreatmentReason': $('#txtReason').val(),
        'TreatmentAvailableOrissa': $('#ddlTreatment').val(),
        'AgriIncomeRecom': $('#txtIncAgri').val(),
        'SalaryIncomeRecom': $('#txtIncSalary').val(),
        'OtherIncomeRecom': $('#txtIncOther').val(),
        'AnnualIncomeRecom': $('#txtIncTotal').val(),
        'FinancialCondition': $('#txtRelativeIncome').val(),
        'Acceptable': $('#ddlPrayer').val(),
        'RemarkRecom': $('#txtRemarks').val(),
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/CMRF/CMRF.aspx/InsertCMRF',
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

function ValidateForm() {
    var text = "";
    var opt = "";
    var VesselName = $('#ddlType').val();
    if (VesselName == "Select Application Type" || VesselName == "0") {
        text += "<br /> -Please Select Application Type";
        $('#ddlType').attr('style', 'border:1px solid red !important;');
        $('#ddlType').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlType').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlType').css({ "background-color": "#ffffff" });
    }
    var VesselName = $('#ddlCategory').val();
    if (VesselName == "Select Application Category" || VesselName == "0") {
        text += "<br /> -Please Select Application Category";
        $('#ddlCategory').attr('style', 'border:1px solid red !important;');
        $('#ddlCategory').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlCategory').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlCategory').css({ "background-color": "#ffffff" });
    }


    var VesselName = $('#txtAmount').val();
    if (VesselName == null || VesselName == '') {
        text += "<br /> -Please Enter Required Amount";
        $('#txtAmount').attr('style', 'border:1px solid red !important;');
        $('#txtAmount').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtAmount').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAmount').css({ "background-color": "#ffffff" });
    }
    var VesselName = $('#txtPurpose').val();
    if (VesselName == null || VesselName == '') {
        text += "<br /> -Please Enter Purpose For The Fund";
        $('#txtPurpose').attr('style', 'border:1px solid red !important;');
        $('#txtPurpose').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtPurpose').attr('style', 'border:1px solid #ddd !important;');
        $('#txtPurpose').css({ "background-color": "#ffffff" });
    }


    
    var ddlReceived = $('#ddlReceived').val();
    var txtRecPurpose = $('#txtRecPurpose').val();
    var txtRecAmount = $('#txtRecAmount').val();
    if (ddlReceived == "Select Received Fund Earlier") {
        text += "<br /> -Please Select Received Fund Earlier";
        $('#ddlReceived').attr('style', 'border:1px solid red !important;');
        $('#ddlReceived').css({ "background-color": "#fff2ee" });
     
    
    } 
    else if (ddlReceived == "1") {
        if (txtRecPurpose != "" && txtRecAmount != "") {
            $('#ddlReceived').attr('style', 'border:1px solid #ddd !important;');
            $('#ddlReceived').css({ "background-color": "#ffffff" });
            $('#txtRecPurpose').attr('style', 'border:1px solid #ddd !important;');
            $('#txtRecPurpose').css({ "background-color": "#ffffff" });
            $('#txtRecAmount').attr('style', 'border:1px solid #ddd !important;');
            $('#txtRecAmount').css({ "background-color": "#ffffff" });
        }
        else {
            text += "<br /> -Please Enter Purpose For The Fund Received";
            text += "<br /> -Please Enter Amount Received Earliar";
            $('#txtRecPurpose').attr('style', 'border:1px solid red !important;');
            $('#txtRecPurpose').css({ "background-color": "#fff2ee" });
            $('#txtRecAmount').attr('style', 'border:1px solid red !important;');
            $('#txtRecAmount').css({ "background-color": "#fff2ee" });
            $('#ddlReceived').attr('style', 'border:1px solid #ddd !important;');
            $('#ddlReceived').css({ "background-color": "#ffffff" });
        }
    }

    else if (ddlReceived == "0") {

        $('#ddlReceived').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlReceived').css({ "background-color": "#ffffff" });
    }
   
    

    var ddlReceived = $('#ddlHand').val();
    var txtRecPurpose = $('#txtDetail').val();
   
    if (ddlReceived == "Select Handicapped or Diseased") {
        text += "<br /> -Please Select Handicapped or Diseased";
        $('#ddlHand').attr('style', 'border:1px solid red !important;');
        $('#ddlHand').css({ "background-color": "#fff2ee" });


    }
    else if (ddlReceived == "1") {
        if (txtRecPurpose != "" && txtRecAmount != "") {
            $('#ddlHand').attr('style', 'border:1px solid #ddd !important;');
            $('#ddlHand').css({ "background-color": "#ffffff" });
            $('#txtDetail').attr('style', 'border:1px solid #ddd !important;');
            $('#txtDetail').css({ "background-color": "#ffffff" });
       
        }
        else {
            text += "<br /> -Please Enter Detail Of Handicapped / Disease";
        
            $('#txtDetail').attr('style', 'border:1px solid red !important;');
            $('#txtDetail').css({ "background-color": "#fff2ee" });
            $('#ddlHand').attr('style', 'border:1px solid #ddd !important;');
            $('#ddlHand').css({ "background-color": "#ffffff" });
        }
    }

    else if (ddlReceived == "0") {

        $('#ddlHand').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlHand').css({ "background-color": "#ffffff" });
    }


    var VesselName = $('#ddlRecommendation').val();
    if (VesselName == "Select Recommendation" || VesselName == "0") {
        text += "<br /> -Please Select Recommendation";
        $('#ddlRecommendation').attr('style', 'border:1px solid red !important;');
        $('#ddlRecommendation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#ddlRecommendation').attr('style', 'border:1px solid #ddd !important;');
        $('#ddlRecommendation').css({ "background-color": "#ffffff" });
    }
    var VesselName = $('#txtOccupation').val();
    if (VesselName == null || VesselName == '') {
        text += "<br /> -Please Enter Applicant Occupation";
        $('#txtOccupation').attr('style', 'border:1px solid red !important;');
        $('#txtOccupation').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtOccupation').attr('style', 'border:1px solid #ddd !important;');
        $('#txtOccupation').css({ "background-color": "#ffffff" });
    }


    var VesselName = $('#txtAgri').val();
    if (VesselName == null || VesselName == '') {
        debugger;
       text += "<br /> -Please Enter Source Of Income From Agriculture";
            $('#txtAgri').attr('style', 'border:1px solid red !important;');
            $('#txtAgri').css({ "background-color": "#fff2ee" });
            opt = 1;
       
    
    } else {
        $('#txtAgri').attr('style', 'border:1px solid #ddd !important;');
        $('#txtAgri').css({ "background-color": "#ffffff" });
    }

    var VesselName = $('#txtSalary').val();
    if (VesselName == null || VesselName == '') {
        text += "<br /> -Please Enter Source Of Income From Salary";
        $('#txtSalary').attr('style', 'border:1px solid red !important;');
        $('#txtSalary').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtSalary').attr('style', 'border:1px solid #ddd !important;');
        $('#txtSalary').css({ "background-color": "#ffffff" });
    }

    var VesselName = $('#txtOther').val();
    if (VesselName == null || VesselName == '') {
        text += "<br /> -Please Enter Other Source Of Income";
        $('#txtOther').attr('style', 'border:1px solid red !important;');
        $('#txtOther').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#txtOther').attr('style', 'border:1px solid #ddd !important;');
        $('#txtOther').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function CheckEarlierFund() {
    debugger;
    var FundReceived = $('#ddlReceived').val();
    if (FundReceived == 1) {
        $('#divRecPurpose').show();
        $('#divRecAmount').show();
    }
    else { 
        $('#divRecAmount').hide();
        $('#divRecPurpose').hide();        
    }
}

function fnRecommendation() {
    debugger;
    $('#divRecomend').hide();

    //var FundReceived = $('#ddlRecommendation').val();
    //if (FundReceived == null) {
    //    $('#divRecomend').hide();
    //    //$('#txtRecom').html($('#ddlRecommendation :selected').text())        
    //}
    //else {
    //    $('#divRecomend').show();
    //    $('#txtRecom').html('Tahasildar / Sub-Collector');
    //}
}
function fnIsDiseased() {
    var FundReceived = $('#ddlHand').val();
    if (FundReceived == 1) {
        //$('#divDiseased').show();
        $('#divHandicap').show();
    }
    else
    {
        $('#divDiseased').hide();        
        $('#divHandicap').hide();
    }
}

function fnCalIncome() {
    var agri = $('#txtAgri').val();
    var sal = $('#txtSalary').val();
    var oth = $('#txtOther').val();
    var tot = $('#txtTotal').val();

    if (agri == null || agri == "")
    { agri = ""; }

    if (sal == null || sal == "")
    { sal = ""; }

    if (oth == null || oth == "")
    { oth = ""; }

    tot = (parseInt(agri)) + (parseInt(sal)) + (parseInt(oth));
    $('#txtTotal').val(tot);
}


function fnCalIncomeRecom() {
    var agrirecom = $('#txtIncAgri').val();
    var salrecom = $('#txtIncSalary').val();
    var othrecom = $('#txtIncOther').val();
    var totrecom = $('#txtIncTotal').val();

    if (agrirecom == null || agrirecom == "")
    { agrirecom = ""; }

    if (salrecom == null || salrecom == "")
    { salrecom = ""; }

    if (othrecom == null || othrecom == "")
    { othrecom = ""; }

    totrecom = (parseInt(agrirecom)) + (parseInt(salrecom)) + (parseInt(othrecom));
    $('#txtIncTotal').val(totrecom);
}