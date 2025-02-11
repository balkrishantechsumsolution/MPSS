﻿
function GetSubDistrict(category) {
    var SelIndex = $("#ddlDistrict").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '../Registration/KioskRegistration.aspx/GetSubDistrict',
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


        },
        error: function (a, b, c) {
            alert("3." + a.responseText);
        }
    });

}

function GetVillage(category) {
    var SelIndex = $("#ddlTaluka").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '../Registration/KioskRegistration.aspx/GetVillage',
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

        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}


function ViewDoc(p_URL, p_ServiceID, p_AppID) {
    //var t_URL = ResolveUrl(p_URL);
    if (p_ServiceID == '101') {
        var t_URL = "../Common/HTML2PDF/HTMLToPdf.aspx";
    } else if (p_ServiceID == '103')
    { var t_URL = "../Kiosk/Birth/Preview.aspx"; }
    else if (p_ServiceID == '104') {
        var t_URL = "../Kiosk/Death/Preview.aspx";
    }
    t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
    window.open(t_URL, 'ViewDoc', 'titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
    return false;
}

function TakeAction(p_URL, p_ServiceID, p_AppID) {
    //var t_URL = ResolveUrl(p_URL);
    //var t_URL = "/WebApp/G2G/SU/SUAction.aspx";
    var t_URL = "/WebApp/Enrollment/AdminAction.aspx";
    t_URL = t_URL + "?AppID=" + p_AppID + "&SvcID=" + p_ServiceID;
    window.open(t_URL, 'ViewDoc', 'height=' + screen.height + ',width=' + screen.width + ',titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
    return false;
}
$(document).ready(function () {
    $('#txtFromDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-150:+0",
        maxDate: '0',

    });

    $('#txtToDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-150:+0",
        maxDate: '0',

    });

    //var DistrictControl = "ddlDistrict";
    //GetDistrict("", "21", DistrictControl);
});


function ViewOutput(p_URL, p_ServiceID, p_AppID) {
    debugger;
    var t_URL = "";
    var t_AppID = "", t_ServiceID = "";
    t_AppID = p_AppID;
    t_ServiceID = p_ServiceID;
    if (t_ServiceID == "440") {
        t_URL = "/WebApp/Kiosk/CTCSU/TransferCertificateSU.aspx?";
    } else if (t_ServiceID == "441") {
        t_URL = "/WebApp/Kiosk/DegreeSU/DegreeCertificate.aspx?";
    } else if (t_ServiceID == "445") {
        t_URL = "/WebApp/Kiosk/RegistrationReceiptSU/RegistrationReceipt.aspx?";
    } else if (t_ServiceID == "446") {
        t_URL = "/WebApp/Kiosk/Birth/BirthAcknowledgement.aspx?";
    } else if (t_ServiceID == "447") {
        t_URL = "/WebApp/Kiosk/ProvisionalSU/ProvisionalCertificate.aspx?";
    } else if (t_ServiceID == "448") {
        t_URL = "/WebApp/Kiosk/VerificationSU/CertificateVerification.aspx?";
    } else if (t_ServiceID == "442") {        
        t_URL = "/WebApp/Kiosk/AnswerSheet/AnswerScript.aspx?";
    } else if (t_ServiceID == "443") {
        t_URL = "/WebApp/Kiosk/Graduate/GraduateCertificate.aspx?";
    } else if (t_ServiceID == "449") {
        t_URL = "/WebApp/Kiosk/CBCS/Acknowledgement.aspx?";
    }
    else if (t_ServiceID == "1456") {
        t_URL = "/WebApp/Kiosk/Enrolement/Acknowledgement.aspx?";
    }
     else if (t_ServiceID == "1446") {
        t_URL = "#";
     } else if (t_ServiceID == "1467") {
         t_URL = "/WebApp/Enrollment/Acknowledgement.aspx?";
     } else if (t_ServiceID == "1468") {
         t_URL = "/WebApp/Examination/Acknowledgement.aspx?";
     }


    t_URL = t_URL + "SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
    t_URL = ResolveUrl(t_URL);
    //CreateDialog(t_URL, "");
    window.open(t_URL, 'ViewDoc', 'top=10,left=10,height=500,width=900,titlebar=no,menubar=no,status=yes,toolbar=no,scrollbars=yes,resizable=yes');
    return false;
}

var baseUrl = "<%= Page.ResolveUrl('~/') %>";

function ResolveUrl(url) {
    if (url.indexOf("~/") == 0) {
        url = baseUrl + url.substring(2);
    }
    return url;
}

