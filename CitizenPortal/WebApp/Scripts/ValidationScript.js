function isNum(char) {
    if (char == 8) return true;
    if (char == 9) return true;
    if (char == 13) return true;
    //if (char == 35) return true;
    //if (char == 36) return true;
    //if (char == 46) return true;
    if (char >= 48 && char <= 57) return true;
    //if (char > 111 && char <= 123) return true;
}

function isNumberKey(evt, inputName) {
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if (!isNum(charCode)) return false;
    return true;
}


function Salutation() {


    var SelIndex = "";
    var strText = "";


    SelIndex = document.getElementById('CPH_ddlSalutation').selectedIndex;
    strText = document.getElementById('CPH_ddlSalutation').options[SelIndex].text;

    if (strText == 'कुमार' || strText == 'श्री.') {

        var valueToSet = 'पुरुष';
        var valuetoremove = 'स्त्री';
        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), false);
        //document.getElementById('CPH_RequiredFieldValidator17').disabled = true;
        //                if (document.getElementById('CPH_Dropgen').selectedIndex <= 0) {
        //                    ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);
        //                }   

    }

    if (strText == 'कुमारी' || strText == 'श्रीमती' || strText == 'सौ') {

        var valueToSet = 'स्त्री';
        var valuetoremove = 'पुरुष';
        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), false);

    }


    if (strText == '---निवडा---') {


        var valueToSet = '---निवडा---';

        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);

    }


    var selectObj = document.getElementById('CPH_Dropgen');
    for (var i = 0; i < selectObj.options.length; i++) {
        selectObj.options[i].disabled = false;
    }

    for (var i = 0; i < selectObj.options.length; i++) {
        var vari = selectObj.options[i].text;
        var reminx = "";
        if (vari == valuetoremove) {
            selectObj.options[i].disabled = true;
        }
        if (vari == valueToSet) {
            selectObj.options[i].selected = true;
        }

    }
    SalutationGen();
}

function SalutationGen() {


    var SelIndex = "";
    var strText = "";
    var SelGen = "";
    var strGen = "";

    SelIndex = document.getElementById('CPH_ddlSalutation').selectedIndex;
    strText = document.getElementById('CPH_ddlSalutation').options[SelIndex].text;
    SelGen = document.getElementById('CPH_Dropgen').selectedIndex;
    strGen = document.getElementById('CPH_Dropgen').options[SelGen].text;

    if (strText == 'कुमार' || strText == 'श्री.') {

        var valueToSet = 'पुरुष';
        var valuetoremove = 'स्त्री';
        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), false);
        //document.getElementById('CPH_RequiredFieldValidator17').disabled = true;
        //                if (document.getElementById('CPH_Dropgen').selectedIndex <= 0) {
        //                    ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);
        //                }   

    }

    if (strText == 'कुमारी' || strText == 'श्रीमती' || strText == 'सौ') {

        var valueToSet = 'स्त्री';
        var valuetoremove = 'पुरुष';
        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), false);

    }


    if (strText == '---निवडा---') {

        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);

    }
    if (strGen == '---निवडा---') {

        ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator17"), true);

    }




}


function Salutation_Contact2() {
    var SelIndex = "";
    var strText = "";


    SelIndex = document.getElementById('CPH_ddl_sal1').selectedIndex;
    strText = document.getElementById('CPH_ddl_sal1').options[SelIndex].text;

    if (strText == 'कुमार' || strText == 'श्री.') {
        var valueToSet = 'पुरुष';
        var valuetoremove = 'स्त्री';
    }

    if (strText == 'कुमारी' || strText == 'श्रीमती' || strText == 'सौ') {
        var valueToSet = 'स्त्री';
        var valuetoremove = 'पुरुष';
    }

    var selectObj = document.getElementById('CPH_ddlgen2');
    for (var i = 0; i < selectObj.options.length; i++) {
        selectObj.options[i].disabled = false;
    }

    for (var i = 0; i < selectObj.options.length; i++) {
        var vari = selectObj.options[i].text;
        var reminx = "";
        if (vari == valuetoremove) {
            selectObj.options[i].disabled = true;
        }
        if (vari == valueToSet) {
            selectObj.options[i].selected = true;
        }

    }

}
//Modified on 17-12-2012
function Page_ClientValidate() {
    return true;
}

function RadioListVisibility(ctrlName, DisplayItem) {

    var chkBox = document.getElementById(ctrlName);
    var options = chkBox.getElementsByTagName('input');


    if (options[0].checked == true) {
        toggleDisplay(DisplayItem, 1);
    }
    else {
        toggleDisplay(DisplayItem, 0);
    }
}

function toggleDisplay(CtrlName, flag) {

    element = document.getElementById(CtrlName).style;
    if (flag == 1) {
        element.display = 'block';
    }
    else {
        element.display = 'none';
    }
}


function changescript() {
    var FullName = document.getElementById('CPH_FullName');
    FullName.value = toProperCase(FullName.value);

    var FullName = document.getElementById('CPH_txtfullNameE');
    FullName.value = toProperCase(FullName.value);

    return;
}


function toProperCase(s) {
    return s.toLowerCase().replace(/^(.)|\s(.)/g,
  function ($1) { return $1.toUpperCase(); });
}



function ValidateUID() {

    if (!ValidateNumbers('CPH_UID')) {
        if (document.getElementById('CPH_HV1').value == 'Eng') {
            alert('Please Enter 12 digit UID Number');
        }
        else {
            alert('कृपया १२ अंकी आधार क्रमांकाची नोंद करा ');
        }

        document.getElementById('CPH_HV1').focus();
        return false;
    }


    if (!ValidateNumbers('CPH_txtUid3')) {
        if (document.getElementById('CPH_HV1').value == 'Eng') {
            alert('Please Enter 12 digit UID Number');
        }
        else {
            alert('कृपया १२ अंकी आधार क्रमांकाची नोंद करा ');
        }

        document.getElementById('CPH_HV1').focus();
        return false;
    }


    return true;
}

function ValidateNumbers(p_Control) {

    var t_Value = document.getElementById(p_Control).value;
    var t_Length = t_Value.length;
    var t_Result = true;
    for (var i = 0; i < t_Length; i++) {

        var t_ACSIICode = t_Value.charAt(i).charCodeAt(0);

        if (t_ACSIICode > 31 && (t_ACSIICode < 48 || t_ACSIICode > 57)) {
            t_Result = false;
            break;
        }
    }

    if (!t_Result) {
        document.getElementById(p_Control).value = '';
    }

    return t_Result;
}



function validateValues() {
   
    if (document.getElementById('CPH_HV1').value == 'Eng') {

        if (document.getElementById('CPH_FullName').value == '') {

            showalert('Please Enter Full Name in English', 'CPH_FullName');
            return false;

        }


        if (document.getElementById('CPH_FullName_LL').value == '') {

            showalert('Please Enter Full Name in Marathi', 'CPH_FullName_LL');

            return false;

        }

        if (document.getElementById('CPH_DOB').value == '') {

            alert('Please Enter Date Of Birth');

            document.getElementById('CPH_DOB').focus();

            return false;

        }




        if (document.getElementById('CPH_Mobile').value == '') {

            alert('Please Enter Mobile No');

            document.getElementById('CPH_Mobile').focus();

            return false;

        }
        if (document.getElementById('CPH_AddrCare').value == '') {

            alert('Please Enter Address');

            document.getElementById('CPH_AddrCare').focus();

            return false;

        }


        SelIndex = document.getElementById('CPH_District').selectedIndex;

        if (SelIndex <= 0) {
            alert('Please Select District.');
            document.getElementById('CPH_District').focus();
            return false;
        }

        SelIndex = document.getElementById('CPH_SubDistrict').selectedIndex;

        if (SelIndex <= 0) {
            alert('Please Select SubDistrict.');
            document.getElementById('CPH_SubDistrict').focus();
            return false;
        }

        SelIndex = document.getElementById('CPH_Village').selectedIndex;

        if (SelIndex <= 0) {
            alert('Please Select Village.');
            document.getElementById('CPH_Village').focus();
            return false;
        }


        if (document.getElementById('CPH_txtfullNameE').value == '') {

            alert('Please Enter Full Name(English) of Emergency Contact Person-1 .');

            document.getElementById('CPH_txtfullNameE').focus();

            return false;

        }
        if (document.getElementById('CPH_txtfullnameM').value == '') {

            alert('Please Enter Full Name(Marathi) of Emergency Contact Person-1 .');

            document.getElementById('CPH_txtfullnameM').focus();

            return false;

        }

        if (document.getElementById('CPH_txtMobie').value == '') {

            alert('Please Enter Mobile Number of Emergency Contact Person-1');

            document.getElementById('CPH_txtMobie').focus();

            return false;

        }

        if (document.getElementById('CPH_txtfename').value == '') {

            alert('Please Enter Full Name(English) of Emergency Contact Person-2 .');

            document.getElementById('CPH_txtfename').focus();

            return false;

        }
        if (document.getElementById('CPH_txtfmname').value == '') {

            alert('Please Enter Full Name(Marathi) of Emergency Contact Person-2 .');

            document.getElementById('CPH_txtfmname').focus();

            return false;

        }
        if (document.getElementById('CPH_txtbirth').value == '') {

            alert('Please Select date of birth of Emergency Contact Person-2.');

            document.getElementById('CPH_txtbirth').focus();

            return false;

        }
        if (document.getElementById('CPH_ddlgen2').value == '---Select---') {

            alert('Please Select Gender of Emergency Contact Person-2.');

            document.getElementById('CPH_ddlgen2').focus();

            return false;

        }


    }
    else {

        //                if ((document.getElementById('CPH_FullName_LL').value == '')){

        //                    ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator2"), true);
        //                    alert('');
        //                    return true;
        //                }

        if ((document.getElementById('CPH_ddlSalutation').value == '---निवडा---') && (document.getElementById('CPH_FullName').value == '') && (document.getElementById('CPH_FullName_LL').value == '') && (document.getElementById('CPH_age').value == '') && (document.getElementById('CPH_AddrCare').value == '') && (document.getElementById('CPH_Building').value == '') && (document.getElementById('CPH_District').selectedIndex <= 0) && (document.getElementById('CPH_SubDistrict').selectedIndex <= 0) && (document.getElementById('CPH_Village').selectedIndex <= 0) && (document.getElementById('CPH_txtfullNameE').value == '') && (document.getElementById('CPH_txtfullnameM').value == '')) {

            alert("एक किंवा एकापेक्षा जास्त चिन्हांकित क्षेत्रात माहिती भरण्यात आलेली नाही. कृपया चिन्हांकित क्षेत्रात माहिती भरावी.");
            return true;
        }

        //                if (document.getElementById('CPH_ddlSalutation').value == '---निवडा---') {

        //                    showalert('कृपया अर्जदाराच्या संबोधनाची निवड करा.', 'CPH_ddlSalutation');

        //                    return false;

        //                }

        //                if (document.getElementById('CPH_FullName').value == '') {

        //                    showalert('कृपया अर्जदाराच्या पूर्ण नावाची (इंग्रजी) नोंद करा.', 'CPH_FullName');

        //                    return false;

        //                }


        //                if (document.getElementById('CPH_FullName_LL').value == '') {

        //                    showalert('कृपया अर्जदाराच्या पूर्ण नावाची (मराठी) नोंद करा.', 'CPH_FullName_LL');

        //                    return false;
        //                }

        //                if (document.getElementById('CPH_age').value == '') {

        //                    showalert('कृपया अर्जदाराच्या वयाची नोंद करा .', 'CPH_age');

        //                    return false;

        //                }



        //                if (document.getElementById('CPH_AddrCare').value == '') {

        //                    showalert('कृपया घर ओळख/ क्रमांकाची नोंद करा.', 'CPH_AddrCare');

        //                    return false;

        //                }


        //                if (document.getElementById('CPH_Building').value == '') {

        //                    showalert('कृपया अर्जदाराच्या पत्त्याची नोंद करा.', 'CPH_Building');

        //                    return false;

        //                }




        //                SelIndex = document.getElementById('CPH_District').selectedIndex;

        //                if (SelIndex <= 0) {
        //                    alert('कृपया अर्जदाराच्या जिल्ह्याची निवड करा.');
        //                    document.getElementById('CPH_District').focus();
        //                    return false;
        //                }

        //                SelIndex = document.getElementById('CPH_SubDistrict').selectedIndex;

        //                if (SelIndex <= 0) {
        //                    alert('कृपया अर्जदाराच्या तालुक्याची निवड करा.');
        //                    document.getElementById('CPH_SubDistrict').focus();
        //                    return false;
        //                }

        //                SelIndex = document.getElementById('CPH_Village').selectedIndex;

        //                if (SelIndex <= 0) {
        //                    alert('कृपया अर्जदाराच्या गावाची निवड करा.');
        //                    document.getElementById('CPH_Village').focus();
        //                    return false;
        //                }


        //                if (document.getElementById('CPH_txtfullNameE').value == '') {

        //                    showalert('कृपया आपत्कालीन परिस्थितीत संपर्क साधावयाच्या व्यक्तीच्या पूर्ण नावाची (इंग्रजी) नोंद करा.', 'CPH_txtfullNameE');

        //                    return false;

        //                }
        //                if (document.getElementById('CPH_txtfullnameM').value == '') {

        //                    showalert('कृपया आपत्कालीन परिस्थितीत संपर्क साधावयाच्या व्यक्तीच्या पूर्ण नावाची (मराठी) नोंद करा.', 'CPH_txtfullnameM');

        //                    return false;

        //                }



        //                var SelectedValue = $('#CPH_RadioBttnLst1 :radio:checked').next().text();

        //                if (SelectedValue == '') {


        //                    showalert('आपत्कालीन स्थितीत संपर्कासाठी अन्य व्यक्ती आहे का ?', 'CPH_RadioBttnLst1');

        //                    return false;

        //                }
        //                if (SelectedValue == '') {

        //                    var Typeval = $('#CPH_RadioBttnLst1 :radio:checked').next().text();

        //                    if (Typeval == "हो") {
        //                        if (document.getElementById('CPH_ddl_sal1').value == '---निवडा---') {

        //                            showalert('कृपया आपत्कालीन व्यक्ती-2 ची उपाधी निवडा .', 'CPH_ddl_sal1');

        //                            return false;

        //                        }

        //                        if (document.getElementById('CPH_txtfename').value == '') {

        //                            showalert('कृपया आपत्कालीन व्यक्ती-२ चे पूर्ण नावाची (इंग्रजी) नोंद करा.', 'CPH_txtfename');

        //                            return false;

        //                        }
        //                        if (document.getElementById('CPH_txtfmname').value == '') {

        //                            showalert('कृपया आपत्कालीन व्यक्ती-२ चे पूर्ण नावाची (मराठी) नोंद करा.', 'CPH_txtfmname');

        //                            return false;

        //                        }

        //                        if (document.getElementById('CPH_ddlgen2').value == '---निवडा---') {

        //                            showalert('कृपया आपत्कालीन व्यक्ती-२ लिंग निवडा.', 'CPH_ddlgen2');

        //                            return false;

        //                        }

        //                    }
        //                }
    }

    if (typeof (Page_ClientValidate) == 'function') {
        Page_ClientValidate();
    }
    if (Page_IsValid) {
        //return true;
    }
    else {
        return false;
    }

    /*******/
    var x = 3;
    var e = document.getElementById('CPH_age').value;
    var t_Length = e.length;
    //            if (t_Length >= x) {

    //                document.getElementById("CPH_age").value = '';
    //                alert("कृपया वयाची नोंद जास्तीत जास्त ३ अंकापर्यंतच करा.");
    //                return false;
    //            }

    if (e > 125) {
        document.getElementById("CPH_age").value = '';
        alert("कृपया वयाची नोंद जास्तीत जास्त १२५ वर्षा पर्यंत असावी.");
        return false;
    }

    var t_NumberMessage = 'कृपया केवळ अंकांची नोंद करा';
    if (!ValidateNumbers('CPH_age')) {
        alert(t_NumberMessage);
        document.getElementById('CPH_age').focus();
        return false;
    }


    if (document.getElementById('CPH_HFValidate').value == '') {
        document.getElementById('CPH_HFValidate').value = 'Y';
        return ValidateMsg(document.getElementById('CPH_HV1').value);
    }

} //end of validate values function



function disp_confirm() {
    var r = confirm(" तुम्हाला निश्चितपणे री-सेट करायचे आहे का? सावधान- री-सेट केल्यास सर्व माहिती पुसली जाईल. ")
    if (r == true) {

        location.reload();
        return true;

    }
    else {
        return false;
        // alert("You pressed Cancel!")
    }
}

function back() {

    var r = confirm(" तुम्हाला निश्चितपणे मागे जायचे आहे का? सावधान- मागे गेल्यास तुम्ही मुख्य पृष्ठावर परत जाल.")
    if (r == true) {

        location.href = '../HOME/Menu.aspx';

    }
    else {
        return false;

    }
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;

    return true;
}
function isNumberKey1(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return true;

    return false;
}
function isBS(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode || 8)

        return false;

    return true;


}
function IsAlphabet(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode

    var txt = String.fromCharCode(charCode)

    if (txt.match(/^[a-zA-Z\b ]+$/))

        return true;

    return false;

}


function daysInMonth(month, year) { // months are 1-12

    var dd = new Date(year, month, 0);

    return dd.getDate();

}

function checkDate1(sender, args) {
    if (sender._selectedDate > new Date()) {
        if (document.getElementById('CPH_HV1').value == 'Eng') {
            alert("You cannot select a day next than today!");
            document.getElementById('CPH_DOB').value = '';
            document.getElementById('CPH_age').value = '';
            return false;
        }
        else {
            alert("तुम्ही आज नंतरचा दिनांक निवडू शकत नाही. ");
        }
        sender._selectedDate = new Date();
        sender._textbox.set_Value(sender._selectedDate.format(sender._format))
    }
    CheckAge();
}

function CheckAge(p_Control) {

    today = new Date();
    var dt = document.getElementById("CPH_DOB").value;
    var d = dt.split("/");

    var dateTimeInput = new Date(d[1] + "/" + d[0] + "/" + d[2]);
    if (dateTimeInput > today) {
        document.getElementById("CPH_DOB").value = '';
        alert("तुम्ही आज नंतरचा दिनांक निवडू शकत नाही.");
        return false;
    }
    if (ageCount() == true) {

        Appage();
    }
    else { return false; }

    return true;
}



function AgeChk() {
    var agecalc = document.getElementById('CPH_age').value;
    if (eval(agecalc) > 125) {
        alert('वय १२५ पेक्षा कमी असावे.');
        document.getElementById('CPH_age').value = '';
        document.getElementById('CPH_age').focus();
        return false;
    }

    if (eval(agecalc) <= 0) {
        alert('किमान वय शुन्य नसावे.');
        document.getElementById('CPH_age').value = '';
        document.getElementById('CPH_age').focus();
        return false;
    }

    if (eval(agecalc) < 60) {
        alert('तुम्ही पात्र नाही. वय ६० वर्षांपेक्षा जास्त असले पाहिजे.');
        document.getElementById('CPH_age').value = '';
        document.getElementById('CPH_age').focus();
        return false;
    }
}

function ValidateDate(ctrl) {


    //            if (ctrl.value == "" || ctrl.value == "dd/mm/yyyy") {
    //                if (document.getElementById('CPH_HV1').value == 'Eng') {
    //                    alert("Please Enter Date of Birth");
    //                } else {
    //                    alert("जन्मतारीखेची नोंद करा.");
    //                }
    //                return false;
    //            }
    //            else if (isDateMar(ctrl.value) == false) {
    //                ctrl.value = "";
    //                ctrl.focus();
    //                return false;

    //            }
    if (isDateMar(ctrl.value) == false) {
        ctrl.value = "";
        ctrl.focus();
        return false;

    }
}



function CheckAgeNew() {
   
    if (document.getElementById('CPH_DOB').value == "" || document.getElementById('CPH_DOB').value == "dd/mm/yyyy") {
        document.getElementById("CPH_age").disabled = false;
        document.getElementById('CPH_age').value = '';

        return false;
    }
    else if (isDateMar(document.getElementById('CPH_DOB').value) == false) {
        document.getElementById('CPH_DOB').value = "";
        document.getElementById('CPH_DOB').focus();
        document.getElementById("CPH_age").disabled = false;
        document.getElementById('CPH_age').value = '';

        return false;

    }

    today = new Date();
    var dt = document.getElementById("CPH_DOB").value;
    var d = dt.split("/");

    var dateTimeInput = new Date(d[1] + "/" + d[0] + "/" + d[2]);

    var SelectedDate = new Date(d[2], d[1], d[0]);


    if (dateTimeInput > today) {
        if (document.getElementById('CPH_HV1').value == 'Eng') {

            document.getElementById("CPH_DOB").value = '';
            alert("You cannot select a day next than Today.");
            document.getElementById("CPH_age").disabled = false;
            document.getElementById('CPH_age').value = '';


            return false;
        }

        else {
            document.getElementById("CPH_DOB").value = '';
            alert("तुम्ही आज नंतरचा दिनांक निवडू शकत नाही. ");
            document.getElementById("CPH_age").disabled = false;
            document.getElementById('CPH_age').value = '';

            return false;
        }

    }


    ageCount();

    return true;
}



function ageCount() {

    var date1 = new Date();
    var dob = document.getElementById("CPH_DOB").value;
    var d = dob.split("/");
    var dateTimeInput = new Date(d[1] + "/" + d[0] + "/" + d[2]);
    var date2 = new Date(dateTimeInput);

    var allMonths = date1.getMonth() - date2.getMonth() + (12 * (date1.getFullYear() - date2.getFullYear()));

    var pattern = /^\d{1,2}\/\d{1,2}\/\d{4}$/; //Regex to validate date format (dd/mm/yyyy)
    if (pattern.test(dob)) {

        var y1 = date1.getFullYear(); //getting current year
        var nowmonth = date1.getMonth();
        var nowday = date1.getDate();

        var y2 = date2.getFullYear(); //getting dob year

        var birthmonth = date2.getMonth();
        var birthday = date2.getDate();
        //calculating age

        var datetemp = new Date();
        var tempyear = datetemp.getFullYear() - 125;
        var nd = new Date(tempyear, 01, 01);

        var age = y1 - y2;
        var age_month = nowmonth - birthmonth;
        var age_day = nowday - birthday;



        if (d[2] == "0000") {
            alert("अवैध दिनांक.");
            document.getElementById('CPH_DOB').value = "";
            document.getElementById('CPH_DOB').focus();
            document.getElementById('CPH_age').value = '';
            document.getElementById('CPH_age').focus();
            return false;
        }

        if (d[2] < nd.getFullYear()) {
            alert('वय १२५ पेक्षा कमी असावे.');
            document.getElementById('CPH_DOB').value = "";
            document.getElementById('CPH_DOB').focus();
            document.getElementById('CPH_age').value = '';
            document.getElementById('CPH_age').focus();
            return false;
        }



        if (age_month < 0 || (age_month == 0 && age_day < 0)) {
            age = parseInt(age) - 1;
        }

        if (age < 60) {
            alert('तुम्ही पात्र नाही. वय ६० वर्षांपेक्षा जास्त असले पाहिजे.');
            document.getElementById('CPH_DOB').value = '';
            document.getElementById('CPH_age').value = '';
            document.getElementById("CPH_age").disabled = false;
            document.getElementById('CPH_age').focus();
            return false;
        }

        //                if ((age <= 0 && age_month <= 0 && age_day <= 0) || age < 60) {

        //                    alert('तुम्ही पात्र नाही. वय ६० वर्षांपेक्षा जास्त असले पाहिजे.');
        //                    document.getElementById('CPH_age').value = '';
        //                    document.getElementById('CPH_age').focus();
        //                    return false;
        //                }


        //                var agecalc = document.getElementById('CPH_age').value;

        //                if (allMonths < 720) {
        //                    alert('तुम्ही पात्र नाही. वय ६० वर्षांपेक्षा जास्त असले पाहिजे.');
        //                    document.getElementById('CPH_age').value = '';
        //                    document.getElementById('CPH_age').focus();
        //                    return false;
        //                }


        if (allMonths > 1500) {
            alert('वय १२५ पेक्षा कमी असावे.');
            document.getElementById('CPH_DOB').value = "";
            document.getElementById('CPH_DOB').focus();
            document.getElementById('CPH_age').value = '';
            return false;
        }
        else {
            ValidatorEnable(document.getElementById("CPH_RequiredFieldValidator12"), false);
            document.getElementById("CPH_age").value = age;
            document.getElementById("CPH_age").disabled = true;
            return true;
        }
    }
    else {
        if (document.getElementById('CPH_HV1').value == 'Eng') {
            document.getElementById("CPH_age").disabled = false;
            document.getElementById("CPH_DOB").value = '';
            alert("Invalid Date. Please enter correct date format (dd/mm/yyyy)!");
        }
        else {
            document.getElementById("CPH_age").disabled = false;
            document.getElementById("CPH_DOB").value = '';
            alert("अवैध दिनांक. कृपया दिनांक (dd/mm/yyyy) मध्ये लिहा.");
        }

        return false;

    }
}

function isNumberKeyAB(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if ((charCode == 65 || charCode == 66 || charCode == 97 || charCode == 98 || charCode == 77 || charCode == 109 || charCode == 112 || charCode == 80 ))
    { return true;}
    else if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }    
        return true;
    
}

function isAttendanceKey(evt) {
debugger;
    //P for Present | A for Absent (65) | M for Malpractice (77) | U for Unfair (85)
    var charCode = (evt.which) ? evt.which : event.keyCode
    if ((charCode == 80 || charCode == 65 || charCode == 77 || charCode == 85 || charCode == 97 || charCode == 112 || charCode == 109 || charCode == 117))
    { return true;}
    else {
        return false;
    }    
        return true;
    
}

function CheckAttendance(sender, args) {
   
    //alert(sender, args);
    var ctrlID = sender.id.split('_');
    var i = ctrlID[3];
    var id = "#ContentPlaceHolder1_DataGridView_txtAttendance_" + i;
    var attendance = $(id).text();
    //var regx = "^[a-bA-B0-9]+$";

    var isValid = false;
    var t_Message = "";

    //if ((parseInt(args.Value) > parseInt(TotalMarks)) && (String(args.Value) != "ab") && (String(args.Value) != "AB")) {
    //    alert('Marks cannot be grater then total marks (' + TotalMarks + ')');
    //    return args.IsValid = false;
    //} else
    //    return args.IsValid = true;

    console.log(String(args.Value.toUpperCase()));
    if ((String(args.Value.toUpperCase()) == "A") || (String(args.Value.toUpperCase()) == "P") || (String(args.Value.toUpperCase()) == "M") || (String(args.Value.toUpperCase()) == "U")) {
        args.IsValid = true;
        isValid = true;
    }

    if (!isValid) {
        //alert('marks cannot be grater then total marks (' + TotalMarks + ')');
        t_Message = 'Marked attendance can only be "A for Absent, P for Present, M for Malpractice or U for Unfair means"';
        args.isvalid = false;
        isValid = false;
    }

    //if (!isValid && (parseInt(args.Value) <= parseInt(TotalMarks))) {
    //    args.IsValid = true;
    //    isValid = true;
    //}

    //return args.isvalid = true;

    if (isValid) {
        return args.isvalid = true;
    }
    else {

        if (t_Message == '') {
            t_Message = 'Invalid Marks';
        }

        alert(t_Message);
        return args.IsValid = false;
    }

    return isValid;

}


function CheckMarksEnter(sender, args) {
   
    //alert(sender, args);
    var ctrlID = sender.id.split('_');
    var i = ctrlID[3];
    var idTotalMarks = "#ContentPlaceHolder1_DataGridView_TheoryMark_CT_" + i;
    var TotalMarks = $(idTotalMarks).text();
    var regx = "^[a-bA-B0-9]+$";

    var isValid = false;
    var t_Message = "";

    //if ((parseInt(args.Value) > parseInt(TotalMarks)) && (String(args.Value) != "ab") && (String(args.Value) != "AB")) {
    //    alert('Marks cannot be grater then total marks (' + TotalMarks + ')');
    //    return args.IsValid = false;
    //} else
    //    return args.IsValid = true;

    if ((String(args.Value.toUpperCase()) == "AB") || (String(args.Value.toUpperCase()) == "MP")) {
        args.IsValid = true;
        isValid = true;
    }

    if (!isValid && (parseInt(args.Value) > parseInt(TotalMarks))) {
        //alert('marks cannot be grater then total marks (' + TotalMarks + ')');
        t_Message = 'marks cannot be grater then total marks (' + TotalMarks + ')';
        args.isvalid = false;
        isValid = false;
    }

    if (!isValid && (parseInt(args.Value) <= parseInt(TotalMarks))) {
        args.IsValid = true;
        isValid = true;
    }

    //return args.isvalid = true;

    if (isValid) {
        return args.isvalid = true;
    }
    else {

        if (t_Message == '') {
            t_Message = 'Invalid Marks';
        }

        alert(t_Message);
        return args.IsValid = false;
    }

    return isValid;

}


function CheckMarksEnter2(sender, args) {
   
    //alert(sender, args);
    var ctrlID = sender.id.split('_');
    var i = ctrlID[3];
    var idTotalMarks = "#ContentPlaceHolder1_DataGridView_SessionalMark_TA_" + i;
    var TotalMarks = $(idTotalMarks).text();
    var idMinMarks = "#ContentPlaceHolder1_DataGridView_MinSessionalMark_TA_" + i;
    var MinMarks = $(idMinMarks).text();
    var idEnterMarks = "#ContentPlaceHolder1_DataGridView_txtSessionalMO_TA_" + i;
    var EnterMarks = $(idEnterMarks).val();
    var regx = "^[a-bA-B0-9]+$";

    var isValid = false;
    var t_Message = "";
    var hideMessage = false;

    //if ((parseInt(args.Value) > parseInt(TotalMarks)) && (String(args.Value) != "ab") && (String(args.Value) != "AB")) {
    //    alert('Marks cannot be grater then total marks (' + TotalMarks + ')');
    //    return args.IsValid = false;
    //} else
    //    return args.IsValid = true;

    if ((String(args.Value.toUpperCase()) == "AB") || (String(args.Value.toUpperCase()) == "MP")) {
        args.IsValid = true;
        isValid = true;
    }
    else {

        if (!isValid && (parseInt(args.Value) > parseInt(TotalMarks))) {
            //alert('marks cannot be grater then total marks (' + TotalMarks + ')');
            t_Message = 'Enter ' + EnterMarks + 'marks cannot be grater then total marks (' + TotalMarks + ')';
            args.isvalid = false;
            isValid = false;
        }

        if ((parseInt(args.Value) <= parseInt(TotalMarks))) {
            args.IsValid = true;
            isValid = true;
        }

        if ((parseInt(args.Value) < parseInt(MinMarks))) {

            if (confirm('Entered Mark ' + EnterMarks + ' is less then expexted minium mark ' + MinMarks + '! Do you want to continue?') == true) {
                args.IsValid = true;
                isValid = true;
            }
            else {
                args.IsValid = false;
                isValid = false;
                hideMessage = true;
            }
        }
        
    }
    //return args.isvalid = true;

    if (isValid) {
        return args.isvalid = true;
    }
    else {

        if (t_Message == '') {
            t_Message = 'Invalid Marks';
        }

        if (hideMessage) {

        }
        else {
            alert(t_Message);
        }
        return args.IsValid = false;
    }

    return isValid;

}

function CheckMarksEnter2_old(sender, args) {
   
    //alert(sender, args);
    var ctrlID = sender.id.split('_');
    var i = ctrlID[3];
    var idTotalMarks = "#ContentPlaceHolder1_DataGridView_SessionalMark_TA_" + i;
    var TotalMarks = $(idTotalMarks).text();
    var regx = "^[a-bA-B0-9]+$";

    var isValid = false;
    var t_Message = "";

    //if ((parseInt(args.Value) > parseInt(TotalMarks)) && (String(args.Value) != "ab") && (String(args.Value) != "AB")) {
    //    alert('Marks cannot be grater then total marks (' + TotalMarks + ')');
    //    return args.IsValid = false;
    //} else
    //    return args.IsValid = true;

    if ((String(args.Value.toUpperCase()) == "AB") || (String(args.Value.toUpperCase()) == "MB")) {
        args.IsValid = true;
        isValid = true;
    }

    if (!isValid && (parseInt(args.Value) > parseInt(TotalMarks))) {
        //alert('marks cannot be grater then total marks (' + TotalMarks + ')');
        t_Message = 'marks cannot be grater then total marks (' + TotalMarks + ')';
        args.isvalid = false;
        isValid = false;
    }

    if (!isValid && (parseInt(args.Value) <= parseInt(TotalMarks))) {
        args.IsValid = true;
        isValid = true;
    }

    //return args.isvalid = true;

    if (isValid) {
        return args.isvalid = true;
    }
    else {

        if (t_Message == '') {
            t_Message = 'Invalid Marks';
        }

        alert(t_Message);
        return args.IsValid = false;
    }

    return isValid;

}

function CheckMarksEnter3(sender, args) {
   
    //alert(sender, args);
    var ctrlID = sender.id.split('_');
    var i = ctrlID[3];
    var idTotalMarks = "#ContentPlaceHolder1_DataGridView_PracticalMark_" + i;
    var TotalMarks = $(idTotalMarks).text();
    var regx = "^[a-bA-B0-9]+$";

    var isValid = false;
    var t_Message = "";

    //if ((parseInt(args.Value) > parseInt(TotalMarks)) && (String(args.Value) != "ab") && (String(args.Value) != "AB")) {
    //    alert('Marks cannot be grater then total marks (' + TotalMarks + ')');
    //    return args.IsValid = false;
    //} else
    //    return args.IsValid = true;

    if ((String(args.Value.toUpperCase()) == "AB") || (String(args.Value.toUpperCase()) == "MB")) {
        args.IsValid = true;
        isValid = true;
    }

    if (!isValid && (parseInt(args.Value) > parseInt(TotalMarks))) {
        //alert('marks cannot be grater then total marks (' + TotalMarks + ')');
        t_Message = 'marks cannot be grater then total marks (' + TotalMarks + ')';
        args.isvalid = false;
        isValid = false;
    }

    if (!isValid && (parseInt(args.Value) <= parseInt(TotalMarks))) {
        args.IsValid = true;
        isValid = true;
    }

    //return args.isvalid = true;

    if (isValid) {
        return args.isvalid = true;
    }
    else {

        if (t_Message == '') {
            t_Message = 'Invalid Marks';
        }

        alert(t_Message);
        return args.IsValid = false;
    }

    return isValid;

}

function CheckMarksEnter4(sender, args) {
   
    //alert(sender, args);
    var ctrlID = sender.id.split('_');
    var i = ctrlID[3];
    var idTotalMarks = "#ContentPlaceHolder1_DataGridView_TheoryMark_" + i;
    var TotalMarks = $(idTotalMarks).text();
    var regx = "^[a-bA-B0-9]+$";

    var isValid = false;
    var t_Message = "";

    //if ((parseInt(args.Value) > parseInt(TotalMarks)) && (String(args.Value) != "ab") && (String(args.Value) != "AB")) {
    //    alert('Marks cannot be grater then total marks (' + TotalMarks + ')');
    //    return args.IsValid = false;
    //} else
    //    return args.IsValid = true;

    if ((String(args.Value.toUpperCase()) == "AB") || (String(args.Value.toUpperCase()) == "MP")) {
        args.IsValid = true;
        isValid = true;
    }

    if (!isValid && (parseInt(args.Value) > parseInt(TotalMarks))) {
        //alert('marks cannot be grater then total marks (' + TotalMarks + ')');
        t_Message = 'marks cannot be grater then total marks (' + TotalMarks + ')';
        args.isvalid = false;
        isValid = false;
    }

    if (!isValid && (parseInt(args.Value) <= parseInt(TotalMarks))) {
        args.IsValid = true;
        isValid = true;
    }

    //return args.isvalid = true;

    if (isValid) {
        return args.isvalid = true;
    }
    else {

        if (t_Message == '') {
            t_Message = 'Invalid Marks';
        }

        alert(t_Message);
        return args.IsValid = false;
    }

    return isValid;

}

function CheckMarksEnter5(sender, args) {
   
    //alert(sender, args);
    var ctrlID = sender.id.split('_');
    var i = ctrlID[3];
    var idTotalMarks = "#ContentPlaceHolder1_DataGridView_TheoryTM_" + i;
    var TotalMarks = $(idTotalMarks).text();
    var regx = "^[a-bA-B0-9]+$";

    var isValid = false;
    var t_Message = "";

    //if ((parseInt(args.Value) > parseInt(TotalMarks)) && (String(args.Value) != "ab") && (String(args.Value) != "AB")) {
    //    alert('Marks cannot be grater then total marks (' + TotalMarks + ')');
    //    return args.IsValid = false;
    //} else
    //    return args.IsValid = true;

    if ((String(args.Value.toUpperCase()) == "AB") || (String(args.Value.toUpperCase()) == "MP")) {
        args.IsValid = true;
        isValid = true;
    }

    if (!isValid && (parseInt(args.Value) > parseInt(TotalMarks))) {
        //alert('marks cannot be grater then total marks (' + TotalMarks + ')');
        t_Message = 'marks cannot be grater then total marks (' + TotalMarks + ')';
        args.isvalid = false;
        isValid = false;
    }

    if (!isValid && (parseInt(args.Value) <= parseInt(TotalMarks))) {
        args.IsValid = true;
        isValid = true;
    }

    //return args.isvalid = true;

    if (isValid) {
        return args.isvalid = true;
    }
    else {

        if (t_Message == '') {
            t_Message = 'Invalid Marks';
        }

        alert(t_Message);
        return args.IsValid = false;
    }

    return isValid;

}

//^-\d*\.?\d*[1-9]+\d*$)|(^-[1-9]+\d*\.\d|(^[A-Ba-b]+$)*$
///^[A-Ba-b]+$/
///^[A-Ba-b_][A-Ba-b\d_]*$/
// ^[a-bA-B0-9]+$
/*
<asp:RangeValidator ID="RangeValidator1" runat="server" MaximumValue="50" MinimumValue="0" Display="Dynamic" 
ErrorMessage="Invalid Marks" ForeColor="Red" ControlToValidate="txtMarks" Type="Integer" 
SetFocusOnError="True"></asp:RangeValidator>
*/

/*

<asp:TemplateField HeaderText="Is Absent">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkIsAbsent" runat="server" Enabled="false" onclick="return IsAbsent(this);"
                                                            Checked='<%# isAbsent(Eval("IsAbsent").ToString())%>' />

                                                        
                                                    </ItemTemplate>
                                                </asp:TemplateField>

*/








function CheckSession() {
    var session = '<%=Session["State_Code"] != null%>';
    if (session == false) {
        alert("Your Session has expired");
        window.location = "../Home/Index.aspx";
    }
}

//$(document).ajaxError(function (event, jqxhr, settings, thrownError) {
//    
//    alert("Your Form has error");
//   // window.location = "/customError.aspx";
//});

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

//function AllowOnlyNumeric(e) {
//   
//    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
//        (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
//        (e.keyCode >= 35 && e.keyCode <= 40)
//        || e.keyCode === 96) {
//        return;
//    }
//    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 97 || e.keyCode > 105 || e.key.length === 0) && e.which === 48) {
//        e.preventDefault();
//    }
//}
function AllowOnlyNumeric(e) {
    if (char == 8) return true;

    if (isNaN(e.key))
        return false; else return true;
}
function numericspecialchar(e) {
    //debugger;
    var regex = new RegExp("[0-9:/-]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }

}

function Alphanumericspecialchar(e) {
    //debugger;
    var regex = new RegExp("[ A-Za-z0-9./-]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}

function Alphanumericspecialchar1(e) {
    //debugger;
    var regex = new RegExp(/^[a-zA-Z0-9 \\,#().-]+$/);
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode != 46 && charCode > 31
        && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

//This is used for Alphabets with special character (.) and (space)
function AlphaSpecialchar(e) {
   
    var regex = new RegExp("[ A-Za-z. ]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }

}

function decimalent(e) {
   
    var regex = new RegExp("[\d{0,2}(\.\d{1,2})?]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }

}







//Accept alphanumeric value only

function AlphaNumeric(e) {
   
    var regex = new RegExp("[ A-Za-z0-9 ]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }

}


function AlphaNumSpecialCharRemarkMotherPNC(e) {
    //var regex = new RegExp("[ A-Za-z0-9./#,-()]");
    var regex = new RegExp(/^[a-zA-Z0-9 ",'*#<>()_+=/\\@!?.-]+$/);
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);
    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}



function AlphaNumSpecialChar(e) {
    //var regex = new RegExp("[ A-Za-z0-9./#,-()]");
    var regex = new RegExp(/^[a-zA-Z0-9 "!?.-]+$/);
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);
    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}

function AlphaNumSpecialCharAddress(e) {
    var regex = new RegExp(/^[A-Za-z0-9 "/#,-,(),.,\\]+$/);
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
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


function Getdate(t_DOB, days) {
    t_DOB = t_DOB.replace("-", "/");
    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
    //get current date
    var someDate = new Date(S_date);

    someDate.setDate(someDate.getDate() + parseInt(days));

    //var dd = someDate.getDate();
    //var mm = someDate.getMonth() + 1;
    //var y = someDate.getFullYear();

    //var someFormattedDate = dd + '/' + mm + '/' + y;
    ////get current date

    return someDate;
}
function GetSubtractdate(t_DOB, days) {
    t_DOB = t_DOB.replace("-", "/");
    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2), t_DOB.substr(0, 2));
    //get current date
    var someDate = new Date(S_date);

    someDate.setDate(someDate.getDate() - parseInt(days));

    //var dd = someDate.getDate();
    //var mm = someDate.getMonth() + 1;
    //var y = someDate.getFullYear();

    //var someFormattedDate = dd + '/' + mm + '/' + y;
    ////get current date

    return someDate;
}

function ActualDateFormat(t_DOB) {

    t_DOB = t_DOB.replace("-", "/");
    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
    //get current date
    var someDate = new Date(S_date);
    //var dd = someDate.getDate();
    //var mm = someDate.getMonth() + 1;
    //var y = someDate.getFullYear();
    //var someFormattedDate = dd + '/' + mm + '/' + y;
    //get current date
    return someDate;
}

function AddDateONCurrentDate1(t_DOB, days) {

    t_DOB = t_DOB.replace("-", "/");
    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2), t_DOB.substr(0, 2));
    //get current date
    var someDate = new Date(S_date);

    return someDate;

}


//Date Validation Added
function AddDateONCurrentDate(t_DOB, days) {
   
    t_DOB = t_DOB.replace("-", "/");
    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
    //get current date
    var someDate = new Date(S_date);
    someDate.setDate(someDate.getDate() + parseInt(days));

    var dd = someDate.getDate();
    var mm = someDate.getMonth();
    var y = someDate.getFullYear();

    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    var someFormattedDate = y + '-' + mm + '-' + dd;
    //var someFormattedDate2 = dd + '/' + mm + '/' + y;
    //get current date
    //return someFormattedDate;

    return someDate;
    //return new Date(someFormattedDate);

}

function DateRange(t_DOB) {
    t_DOB = t_DOB.replace("-", "/");
    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
    //get current date
    var someDate = new Date(S_date);
    var dd = someDate.getDate();
    var mm = someDate.getMonth();
    var y = someDate.getFullYear();

    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    var someFormattedDate = y + '-' + mm + '-' + dd;
    //get current date
    return someFormattedDate;
}

function GetMaxToday() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    var someFormattedDate = yyyy + '-' + mm + '-' + dd;
    //get current date
    return someFormattedDate;
}


function SubtractDateONCurrentDate(t_DOB, days) {
    t_DOB = t_DOB.replace("-", "/");
    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
    //get current date
    var someDate = new Date(S_date);
    someDate.setDate(someDate.getDate() - parseInt(days));

    var dd = someDate.getDate();
    var mm = someDate.getMonth();
    var y = someDate.getFullYear();

    if (dd < 10) {
        dd = '0' + dd;
    }
    if (mm < 10) {
        mm = '0' + mm;
    }
    var someFormattedDate = y + '-' + mm + '-' + dd;
    var someFormattedDate = y + '-' + mm + '-' + dd;
    //get current date
    return someFormattedDate;

}
function GetToday() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!

    var yyyy = today.getFullYear();
    
    return today;
}

//Date validation End

//Logic By Gunwant 
function getCurrentFiscalYear(t_DOB) {

    var fiscalyear = "";
    t_DOB = t_DOB.replace("-", "/");
    var year = t_DOB.substr(6, 4);
    var month = t_DOB.substr(3, 2);
    var date = t_DOB.substr(0, 2);
    var t_NewDate = year.toString() + '-' + month.toString() + '-' + date.toString();
    var today = new Date(t_NewDate);
    //today = new Date('2019-04-01');
    if ((today.getMonth() + 1) <= 3) {
        fiscalyear = (today.getFullYear() - 1) + "-" + today.getFullYear()
    } else {
        fiscalyear = today.getFullYear() + "-" + (today.getFullYear() + 1)
    }
    return fiscalyear
}


//Logic By Meenakshi 
function getCurrentFinancialYear(t_DOB) {

   
    var fiscalyear = "";
    t_DOB = t_DOB.replace("-", "/");
    var year = t_DOB.substr(6, 4);
    var month = t_DOB.substr(3, 2);
    var date = t_DOB.substr(0, 2);
    var t_NewDate = year.toString() + '-' + month.toString() + '-' + date.toString();
    var today = new Date(t_NewDate);
    if ((today.getMonth() + 1) <= 3) {
        fiscalyear = today.getFullYear().toString() - 1;
    }
    else {
        fiscalyear = (today.getFullYear() - 1).toString();
    }
    return fiscalyear;
}



function diff_weeks(dt2, dt1) {

    var diff = (dt2.getTime() - dt1.getTime()) / 1000;
    diff /= (60 * 60 * 24 * 7);
    return Math.abs(Math.round(diff));

}

//Alphabets,Numeric,Comma,Hyphen,Dot,Space 
function AlphanumericspecialcharWithComma(e) {
    var regex = new RegExp("[ A-Za-z0-9,.-]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}


//Alphabets,Comma,Hyphen,Dot,Space without Numeric value
function AlphaspecialcharWithComma(e) {
    var regex = new RegExp("[ A-Za-z,.-]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}

//Alphabets,Comma,Hyphen,Dot,Space without Numeric value
function AlphaspecialcharWithComma(e) {
    var regex = new RegExp("[ A-Za-z,.-]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}

//Alphabets with all characters
function AlphaAllspecialchar(e) {
    var regex = new RegExp("[ A-Za-z,.-/:';$~`%^&*(){}@#!]");
    var key = e.keyCode || e.which;
    key = String.fromCharCode(key);

    if (!regex.test(key)) {
        e.returnValue = false;
        if (e.preventDefault) {
            e.preventDefault();
        }
    }
}


