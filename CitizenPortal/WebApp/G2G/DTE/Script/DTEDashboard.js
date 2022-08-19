function GetDistrict123() {
    var SelIndex = "21";//$("#ddlState").val();
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '../Registration/KioskRegistration.aspx/GetDistrict',
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


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}

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
    var t_URL = "/WebApp/G2G/DTE/DTEAction.aspx";
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
    if (t_ServiceID == "371") {
        t_URL = "/WebApp/Kiosk/Transcript/Certificateverification.aspx?";
    } else if (t_ServiceID == "368") {
        t_URL = "/WebApp/Kiosk/DTE/MigrationCertificate.aspx?";
    } else if (t_ServiceID == "369") {
        t_URL = "/WebApp/Kiosk/Diploma/DiplomaCertificate.aspx?";
    } else if (t_ServiceID == "370") {
        t_URL = "/WebApp/Kiosk/DMAS/AnswerSheet.aspx?";
    } else if (t_ServiceID == "372") {
        t_URL = "/WebApp/Kiosk/DMAS/DuplicateMarkSheet.aspx?";
    } else if (t_ServiceID == "373") {
        t_URL = "/WebApp/Kiosk/diploma/DiplomaMarkSheet.aspx?";
    } else if (t_ServiceID == "374") {
        //alert('No out put defined Copy of Answersheet, please upload the ');
        t_URL = "/WebApp/KIOSK/DMAS/AnswerSheet.aspx?";
    } else if (t_ServiceID == "802") {
        t_URL = "/WebApp/Kiosk/ITIMigration/MigrationCertificateITI.aspx?";
    } else if (t_ServiceID == "1449") {
        t_URL = "/WebApp/Kiosk/CBCS/Acknowledgement.aspx?";
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