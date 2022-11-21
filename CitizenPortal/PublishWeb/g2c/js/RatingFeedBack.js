$(document).ready(function () {
    console.log("ready!");
    $('#Rating').val('');
   
});



function AlphaNumeric(e) {
    var regex = new RegExp("[ A-Za-z0-9]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}

function SubmitRatingData() {
    debugger;
    var temp = "Mohan";
    var AppID = "";
    var result = false;
    if (!ValidateRatingForm()) {
        return;
    }

 

    var datavar = {

        'aadhaarNumber': '123456446464',
        'Rating': $('#Rating').val(),
        'MobileNo': $('#MobileNumber').val(),
        'EmailID': $('#mailid').val(),
        'FeedBackDetail': $('#Feedbackcomment').val(),
       
    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/g2c/forms/index.aspx/InsertRatingFeedBack',
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
                alert("Your  submitted successfully");
                window.location.href = '../forms/index.aspx';
            }

        });// end of Then function of main Data Insert Function

    return false;
}
//function onchange()
//{
//    mobilevalidate();
//}
function ValidateAlpha(evt) {
    //var Name = $('#AccountHolder').val();
    //var charCode;
    var e = evt; // for trans-browser compatibility
    Name = (e.which) ? e.which : event.keyCode;
    //charCode = (evt.which) ? evt.which : event.keyCode;
    if (Name >= 97 && Name <= 122 || Name >= 65 && Name <= 90 || Name == 8 || Name == 32) {
        return true;
    }
    else {
        return false;
    }
}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

//function mobilevalidate() {
//    var text = "";
//    var opt = "";
//    var mobileno = $("#MobileNumber").val();
  
//    if (mobileno!= null) {
//        if (isNaN(mobileno) || mobileno.indexOf(" ") != -1) {
//            text += "<br /> Please Enter A Valid Mobile Number.";
//            //alertPopup("Mobile Number", "</BR> Please Enter Valid Mobile Number.");
//            opt = 1;
//        }
        
//        if (mobileno.length > 10 || mobileno.length < 10) {
//            text += "<br /> Mobile No. Should Be Atleast 10 Digit.";
//            //alertPopup("Mobile Number", "</BR> Mobile No. Should Be 10 Digit.");
//            opt = 1;
//        }
        
//        if (!(mobileno.charAt(0) == "9" || mobileno.charAt(0) == "8" || mobileno.charAt(0) == "7")) {
//            text += "<br /> Mobile No. Should Start With 9 ,8 or 7.";
//            //alertPopup("Mobile Number", "</BR> Mobile No. Should Starts Sith 9 ,8 or 7");
//            opt = 1;
//        }
       
//    }
//    if (opt == "1") {
//        alertPopup("Please Fill The Following Information.", text);
//        $("#MobileNumber").val("");
       
//        return false;
//    }
//    return true;
//}

function EmailValidate() {
    debugger;
    var emailid = document.getElementById('mailid').value;
    //var reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-z/A-Z]+\.)+[a-z/A-Z]{1,3})(\]?))$/;
    //var reg = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    var reg = /[a-zA-Z0-9\.\-]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    if (emailid.match(reg)) {
        $('#mailid').attr('style', 'border:1px solid #ddd !important;');
        $('#mailid').css({ "background-color": "#ffffff" });
    }
    else {
        alertPopup("Please Enter Email-ID.", "</BR> Please Enter A Valid Email-ID in Proper Format");
        $('#mailid').attr('style', 'border:2px solid red !important;');
        $('#mailid').val('');
    }
}

function ValidateRatingForm() {
    debugger;
    var text = "";
    var opt = "";

    var Rating = $('#Rating').val();
    var MobileNo = $('#MobileNumber').val();
    var emailid = $('#mailid').val();
    var txtcomments = $('#Feedbackcomment').val();
   
   

   
    if (Rating == null || Rating == "") {
        text += "<br /> Please Select Rating . ";
        $('#Rating').attr('style', 'border:1px solid red !important;');
        $('#Rating').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#Rating').attr('style', 'border:1px solid #ddd !important;');
        $('#Rating').css({ "background-color": "#ffffff" });
    }
    

    if (MobileNo == null || MobileNo == "") {
        text += "<br /> Please Enter Your Mobile No. ";
        $('#MobileNumber').attr('style', 'border:1px solid red !important;');
        $('#MobileNumber').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#MobileNumber').attr('style', 'border:1px solid #ddd !important;');
        $('#MobileNumber').css({ "background-color": "#ffffff" });
    }
   
    if (emailid == null || emailid == "") {
        text += "<br /> Please Enter Your Email Id. ";
        $('#mailid').attr('style', 'border:1px solid red !important;');
        $('#mailid').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#mailid').attr('style', 'border:1px solid #ddd !important;');
        $('#mailid').css({ "background-color": "#ffffff" });
    }

    if (txtcomments == null || txtcomments == "") {
        text += "<br /> Please Enter Your comment . ";
        $('#Feedbackcomment').attr('style', 'border:1px solid red !important;');
        $('#Feedbackcomment').css({ "background-color": "#fff2ee" });
        opt = 1;
    } else {
        $('#Feedbackcomment').attr('style', 'border:1px solid #ddd !important;');
        $('#Feedbackcomment').css({ "background-color": "#ffffff" });
    }

    if (opt == "1") {
        alertPopup("Please Fill The Following Information.", text);
        return false;
    }
    return true;
}