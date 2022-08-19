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

    $('#txtDate').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-150:+0",
        maxDate: '0',

    });

    //function GetValue() {
    //    var desc = CKEDITOR.instances['txtDetail'].getData();
    //    alert(desc);
    //    return false;
    //}
});

function SubmitData() {
    debugger;
    if (!ValidateForm()) {
        return false;
    }

    //$("#btnSubmit").prop('disabled', true);

    var t_Message = "";
    var result = false;

    var qs = getQueryStrings();
    var uid = qs["UID"];

    var temp = "Gunwant";
    var AppID = "";
    var rtnurl = "";

    var result = false;
    var DONArr = $('#txtDate').val().split("/");
    var DONConverted = DONArr[2] + "-" + DONArr[1] + "-" + DONArr[0];

    var pageValue = CKEDITOR.instances['txtDetail'].getData();
    
    var datavar = {
        'NoticeNumber': $('#txtNo').val(),
        'NoticeType': $('#category').val(),
        'NoticeHeading': $('#txtHeading').val(),
        'NoticeDetail': pageValue,
        'NoticeDate': DONConverted,

    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    $("#progressbar").show();
    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/G2G/SU/NoticeBoard.aspx/InsertNoticeDetail',
            data: $.stringify(obj, null, 4),
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                $("#progressbar").hide();
                $("#btnSubmit").prop('disabled', false);
                result = false;
                alertPopup("Could Not Save the Application, Please try again.", "5. " + a.responseText);
            }
        })
        ).then(function (data, textStatus, jqXHR) {
            debugger;
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            var status = obj.Status;

            result = true;
            
            if (status == "Success") {
                $("#progressbar").hide();
                alertPopup("Notice Saved", "Notice number " + obj.AppID + "Saved sucessfully and Emaild to respective college send");//+ " Please Make Payment against the Application Number."
                window.location.href = '/WebApp/G2G/SU/NoticeBoard.aspx';                
            }                        
        });

    return false;
}


function ValidateForm() {
    var text = "";
    var opt = "";

    var NoticeNumber = $('#txtNo');
    var NoticeType = $('#category');
    var NoticeHeading = $('#txtHeading');
    var NoticeDetail = $('#txtDetail');
    var NoticeDate = $('#txtDate');

    if (NoticeNumber.val() == "") {
        text += "<br /> -10th Passing Year can not be greater than 10+2 passing year. ";
        NoticeNumber.attr('style', 'border:1px solid #d03100 !important;');
        NoticeNumber.css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        NoticeNumber.attr('style', 'border:1px solid #cdcdcd !important;');
        NoticeNumber.css({ "background-color": "#ffffff" });
    }

    if (NoticeHeading != null && NoticeHeading.val() == '') {
        text += "<br /> -Please calculate the Percentage in Educational Qualification 10+2. ";
        opt = 1;
    } else {
    }

    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }
    return true;
}

function GetNoticeData() {
    debugger;
    var DOFArr = $('#txtFromDate').val().split("/");
    var DOFConverted = DOFArr[2] + "-" + DOFArr[1] + "-" + DOFArr[0];

    var DOTArr = $('#txtToDate').val().split("/");
    var DOTConverted = DOTArr[2] + "-" + DOTArr[1] + "-" + DOTArr[0];
    var temp = "n!rAj";
    var result = false;
    if (DOFConverted == null || DOFConverted.indexOf('undefined') == 0) {
        DOFConverted = "";
    }
    if (DOTConverted == null || DOTConverted.indexOf('undefined') == 0) {
        DOTConverted = "";
    }

    var SearchText = $('#txtSearch').val();
    var FromDate = DOFConverted;
    var ToDate = DOTConverted;
    var NoticeType = null;


    $("#progressbar").show();

    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            //url: '/webapp/kiosk/forms/basicdetail.aspx/GetUIDKeyField',
            url: '/webapp/g2g/su/Noticeboard.aspx/GetNoticeDetail',
            //data: '{"prefix": ""}',
            //data: '{"UID": '+uid+'}',
            data: '{"prefix":"","SearchText":"' + SearchText + '","FromDate":"' + FromDate + '","ToDate":"' + ToDate + '","NoticeType":"' + NoticeType + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {

            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        })
    )
    .then(function (data, textStatus, jqXHR) {
        debugger;
        var JSONData = jQuery.parseJSON(data.d);

        //var NoticeData = (typeof data.d) == 'string' ? eval('(' + data.d + ')') : data.d;  
        $('#DataGrid').empty();
        $('#DataGrid').append('<table cellpadding="10" style="width:100%;margin:5px auto;">');
        $('#DataGrid').append('<thead>');
        $('#DataGrid').append('<tr>');
        $('#DataGrid').append('<th><b>S.No.</b></th>');
        $('#DataGrid').append('<th><b>Notice No.</b></th>');
        $('#DataGrid').append('<th><b>Notice Date</b></th>');        
        $('#DataGrid').append('<th><b>Heading</b></th>');
        $('#DataGrid').append('<th><b>Details</b></th>');
        $('#DataGrid').append('<th><b>Notice For</b></th>');
        $('#DataGrid').append('<th><b>Created On</b></th>');
        $('#DataGrid').append('<th><b>Created By</b></th>');
        $('#DataGrid').append('<th><b>Is Active</b></th>');
        $('#DataGrid').append('</tr>');
        $('#DataGrid').append('</thead>');
        $('#DataGrid').append('<tbody>');
        for (var i = 0; i < JSONData.length; i++) {
            $('#DataGrid').append('<tr>');
            $('#DataGrid').append('<td style="border:1px solid #ddd;">' + JSONData[i]["SNo"] + '</td>');//Serial No
            $('#DataGrid').append('<td style="border:1px solid #ddd;">' + JSONData[i]["NoticeNumber"] + '</td>');//Serial No
            $('#DataGrid').append('<td style="border:1px solid #ddd;">' + JSONData[i]["NoticeDate"] + '</td>');//Notice Date
            $('#DataGrid').append('<td style="border:1px solid #ddd;">' + JSONData[i]["NoticeHeading"] + '</td>');//Notice Heading
            $('#DataGrid').append('<td style="border:1px solid #ddd;">' + JSONData[i]["NoticeDetail"] + '</td>');//Notce Detail
            $('#DataGrid').append('<td style="border:1px solid #ddd;">' + JSONData[i]["NoticeCategory"] + '</td>');//NoticeCategory
            $('#DataGrid').append('<td style="border:1px solid #ddd;">' + JSONData[i]["CreatedOn"] + '</td>');//CreatedOn
            $('#DataGrid').append('<td style="border:1px solid #ddd;">' + JSONData[i]["CreatedBy"] + '</td>');//CreatedBy
            $('#DataGrid').append('<td style="border:1px solid #ddd;">' + JSONData[i]["IsActive"] + '</td>');//IsActive
            $('#DataGrid').append('</tr>');
        }
        $('#DataGrid').append('</tbody>');
        $('#DataGrid').append('</table>');
        
    }); // end of Then function of main Data Insert Function
    
}

/*
$('#DataGrid').append('<div class='table-responsive'>');
$('#DataGrid').append('<table cellpadding='0' cellspacing='0' class='table table-bordered' style='max-height: 250px; width: 100%'>');
$('#DataGrid').append('<thead>');
$('#DataGrid').append('<tr>');
$('#DataGrid').append('<th style='width: 5px'><b>S.No.</b></th>');
$('#DataGrid').append('<th style='width: 100px'><b>Notice Date</b></th>');
$('#DataGrid').append('<th style='width: 200px'><b>Notice Type</b></th>');
$('#DataGrid').append('<th><b>Details</b></th>');
$('#DataGrid').append('</tr>');
$('#DataGrid').append('</thead>');
$('#DataGrid').append('<tbody id='divNotice' runat='server'>');

$('#DataGrid').append('<tr>'));
$('#DataGrid').append('<td>' + t_DT.Rows[i]['NoticeNumber'].ToString() + '</td>'));//Serial No
$('#DataGrid').append('<td>' + t_DT.Rows[i]['NoticeDate'].ToString() + '</td>'));//Notice Date
$('#DataGrid').append('<td>' + t_DT.Rows[i]['NoticeHeading'].ToString() + '</td>'));//Notice Heading
$('#DataGrid').append('<td>' + t_DT.Rows[i]['NoticeDetail'].ToString() + '</td>'));//Notce Detail
$('#DataGrid').append('</tr>'));


$('#DataGrid').append</tbody>');
$('#DataGrid').append</table>');
*/
