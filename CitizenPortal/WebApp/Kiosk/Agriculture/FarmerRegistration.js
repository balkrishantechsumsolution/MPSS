

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

function fnNext() {
    SubmitData();
}

function SubmitData() {
    debugger;
    document.getElementById("btnSubmit").disabled = true;
    //if (!ValidateForm()) {
    //    return;
    //}
    
    var temp = "Gunwant";
    var AppID = "";
    var result = false;
    var DOBArr = $('#DeceasedDOB').val().split("/");
    var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0];

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
        'PDistrictCode': $('#ddlDistrict').val(),
        'PBlockCode': $('#ddlTaluka').val(),
        'PGramPanchayat': $('#ddlPanchayat').val(),
        'PVillageCode': $('#ddlVillage').val(),
        'NameofHOF': $('#DeceasedName').val(),
        'FatherName': $('#DeceasedFName').val(),
        'DOB': DOBConverted,
        'Age': $('#DeceasedAge').val(),
        'Gender': $('#ddlDeceasedGender').val(),
        'RelationwithHOF': $('#ddlRelation').val(),
        'VoterIDCardNo': $('#VoterCardNo').val(),
        'Category': $('#ddlcategory').val(),
        'DAddressLine1': $('#AddressLine1').val(),
        'DAddressLine2': $('#AddressLine2').val(),
        'DRoadStreetName': $('#RoadStreetName').val(),
        'DLandMark': $('#LandMark').val(),
        'DLocality': $('#Locality').val(),
        'DState': $('#ddlState').val(),
        'DDistrict': $('#ddlDistrict').val(),
        'DTaluka': $('#ddlTaluka').val(),
        'DVillage': $('#ddlVillage').val(),
        'PinCode': $('#PinCode').val(),
        //'NameofTheMember': $('#txtMember').val(),
        //'RelationwithMember': $('#txtHOF').val(),
        //'AgeofMember': $('#txtHOF').val(),
        //'Nominated': $('#txtNominated').val(),
        'AccountHolder': $('#AccountHolder').val(),
        'AccountNumber': $('#AccountNumber').val(),
        'IFSCCode': $('#IFSCCode').val(),
        'department': dpt,
        'district': dist,
        'block': blk,
        'panchayat': pan,
        'office': ofc,
        'officer': ofr,
        'HeirsDXML': document.getElementById("hdfSuspectSave").value

    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };


    $.when(
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Kiosk/Agriculture/FarmerRegistration.aspx/InsertFarmerRegistration',
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
var t_DOB = new Date();
$(document).ready(function () {
  
    debugger;
  
    $('#DeceasedDOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        //maxDate: '365', limit upto todays date
        maxDate: '0',
        yearRange: "-50:+50",
        //yearRange: "2005:2025",
        onSelect: function (date) {

            if ($('#DeceasedDOB' != "")) {
                var t_DOB = $("#DeceasedDOB").val();
                t_DOB = t_DOB.replace(/-/g, "/");
                $('#DeceasedDOB').val(t_DOB);
            

                var t_DOB = $("#DeceasedDOB").val();
                t_DOB = t_DOB.replace("-", "/");
                var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));
                var selectedYear = S_date.getFullYear();
                var Age = calage(t_DOB);
                $('#DeceasedAge').val(Age);

                var Age = calcExSerDur(t_DOB, '18/03/2017');
                $('#DeceasedAge').prop("disabled", true);
                $('#DeceasedAge').val(Age.years);




            }
        }
    });

});

function checkleapyear(datea) {
    if (datea.getYear() % 4 == 0) {
        if (datea.getYear() % 10 != 0) {
            return true;
        } else {
            if (datea.getYear() % 400 == 0)
                return true;
            else
                return false;
        }
    }
    return false;
}

function ValidateForm() {
    debugger;
    var text = "";
    var opt = "";

    // Basic Information 
    var PDistrict = $("#ddlDistrict option:selected").text();
    var PTaluka = $("#ddlTaluka option:selected").text();
    var PPanchayat = $("#ddlPanchayat option:selected").text();
    var PVillage = $("#ddlVillage option:selected").text();
    var DeceasedName = $("#DeceasedName").val();
    var DeceasedFName = $("#DeceasedFName").val();
    var DOB = $("#DeceasedDOB");
    var Age = $("#DeceasedAge");
    var Gender = $("#ddlDeceasedGender option:selected").text();
    var Relation = $("#ddlRelation option:selected").text();
    var VoterCardNo = $("#VoterCardNo").val();
  

    var AddressLine1 = $("#AddressLine1").val();
    var RoadStreetName = $("#RoadStreetName").val();
    var LandMark = $("#LandMark").val();
    var Locality = $("#Locality").val();
    var State = $("#ddlState option:selected").text();
    var District = $("#ddlDistrict option:selected").text();
    var Taluka = $("#ddlTaluka option:selected").text();
    var Village = $("#ddlVillage option:selected").text();
    var Pincode = $("#PinCode").val();

    var AccountHolder = $('#AccountHolder').val();
    var AccountNumber = $('#AccountNumber').val();
    var IFSCode = $('#IFSCCode').val();
    
    

    if (PDistrict != null && (PDistrict == '0' || PDistrict == '-Select-')) {
        text += "<br /> -Please select  Property District.";
        opt = 1;
    }
    //if (PTaluka != null && (PTaluka == '0' || PTaluka == 'Select Taluka')) {
    //    text += "<br /> -Please select Property Taluka.";
    //    opt = 1;
    //}
    //if (PPanchayat != null && (PPanchayat == '' || PPanchayat == 'Select Village')) {
    //    text += "<br /> -Please select Property  Gram Panchayat.";
    //    opt = 1;
    //}
    //if (PVillage != null && (PVillage == '' || PVillage == 'Select Village')) {
    //    text += "<br /> -Please select Property Village.";
    //    opt = 1;
    //}
   

 
    if (DeceasedName == null || DeceasedName == '') {
        text += "<br /> -Please enter HOF Name. ";
        opt = 1;
    }

    if (DeceasedFName == null || DeceasedFName == '') {
        text += "<br /> -Please enter  Father/Husband Name. ";
        opt = 1;
    }
    if (DOB.val() == null || DOB.val() == '') {
        text += "<br /> -Please enter Date of Birth. ";
        opt = 1;
    }

    
    
    if ((Age.val() == null || Age.val() == '')) {
        text += "<br /> -Please Select Age. ";
        opt = 1;
    }
    
   

    if ((Gender == '' || Gender == 'Select Gender')) {
        text += "<br /> -Please Select Gender. ";
        opt = 1;
    }

    if (AddressLine1 != null && AddressLine1 == '') {
        text += "<br /> -Please enter Care of Address. ";
        opt = 1;
    }
    
    if (RoadStreetName != null && RoadStreetName == '') {
        text += "<br /> -Please enter Road/Street Name in Address. ";
        opt = 1;
    }
    
    if (Locality != null && Locality == '') {
        text += "<br /> -Please enter Locality in Address. ";
        opt = 1;
    }
    if (State != null && (State == '' || State == '-Select-')) {
        text += "<br /> -Please select State.";
        opt = 1;
    }

    if (District != null && (District == '' || District == '-Select-'   )) {
        text += "<br /> -Please select District.";
        opt = 1;
    }

    if (Taluka != null && (Taluka == '' || Taluka == '-Select-')) {
        text += "<br /> -Please select Taluka.";
        opt = 1;
    }

    if (Village != null && (Village == '' || Village == '-Select-')) {
        text += "<br /> -Please select Village.";
        opt = 1;
    }
    if (Pincode == '') {
        text += "<br /> -Please enter PIN. ";
        opt = 1;
    }
    
    
    var alpha = /^[a-zA-Z]*$/g;

    

   
    //var pinmatch = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
    //if (DOB != null && DOB != "")
    //    {
    //    if (!pinmatch.test(DOB.val())) {
    //        text += "<br /> -Please enter Invalid Format.";
    //        opt = 1;
    //    }
    //}
  
    

    if (AccountHolder == null || AccountHolder == '') {
        text += "<br /> -Please enter Account Holder Name.";
        opt = 1;
    }

    if (AccountNumber == null || AccountNumber == '') {
        text += "<br /> -Please enter Account Number.";
        opt = 1;
    }

    if (IFSCode == null || IFSCode == '') {
        text += "<br /> -Please enter IFSC Code.";
        opt = 1;
    }

  
    if (opt == "1") {
        alertPopup("Please fill following information.", text);
        return false;
    }

    return true;

}

function agecalculate()
{
    debugger;
    var data = $("#DeceasedDOB").val();

}

function AddSuspect(DeleteString) {
    debugger;
    if (validateSuspectValues(DeleteString) == true) {
        var strSuspect = "";
        var strSaveSuspect = "";
        var Appid = "";
        var strTempString = "";
        var strName = "";
        var strHof = "";
        var strage = "";
        var strnominated = "";
        var Str = "";
        var SrNo = "";

        if (DeleteString == "") {

            strName = $('#txtMember').val();
            strHof = $('#txtHOF').val();
            strage = $('#txtAge').val();
            strnominated = $('#txtNominated').val();

            strTempString = document.getElementById("hdfSuspect").value + "#" + SrNo + "," + strName + "," + strHof + "," + strage + "," + strnominated + "#";
        }
        else {
            strTempString = document.getElementById("hdfSuspect").value;
        }

        intCount = 0;
        Str = "<table style='width:100%' class='table table-striped table-bordered' id='tblSuspect' >";
        Str = Str + "<tr >";
        Str = Str + "<th style='text-align: center;'>Sr. No. </th>";
        Str = Str + "<th style='text-align: center;'> Name</th>";
        Str = Str + "<th style='text-align: center;'>Realtion with HOF</th>";
        Str = Str + "<th style='text-align: center;'>Age</th>";
        Str = Str + "<th style='text-align: center;'>Nominated</th>";
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
            strName = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strHof = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            StartIndex = RemStr.indexOf(",");
            strage = RemStr.substring(0, StartIndex);
            RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            //StartIndex = RemStr.indexOf(",");
            //strRemarks = RemStr.substring(0, StartIndex);
            //RemStr = RemStr.substring(StartIndex + 1, RemStr.length);

            strnominated = RemStr;

            var DeleteString = "#" + SrNo + "," + strName + "," + strHof + "," + strage + "," + strnominated + "#";

            Str = Str + "<tr>";

            Str = Str + "<td style='width:65px' >" + SrNo + "</td>";
            Str = Str + "<td style='' >" + strName + "</td>";
            Str = Str + "<td style='' >" + strHof + "</td>";
            Str = Str + "<td style='' >" + strage + "</td>";
            Str = Str + "<td style='' >" + strnominated + "</td>";

         



            Str = Str + "<td align='center' style='width:85px'><input class='btn btn-danger' style='width:85px' value='Remove' onclick='DelString(&quot;" + DeleteString + "&quot;);'/></td>";
            Str = Str + "</tr>";

            strSuspect = strSuspect + "#" + SrNo + "," + strName + "," + strHof + "," + strage + "," + strnominated + "#";

            strSaveSuspect = strSaveSuspect + "#" + SrNo + "," + strName + "," + strHof + "," + strage + "," + strnominated + "#";
             
            var HeirsDXML = strSaveSuspect;

            strTempString = strTempString.substring(EndIndex + 1, strTempString.length);

        }

        Str = Str + "</table>";
        document.getElementById('divSuspect').innerHTML = Str;
        document.getElementById("hdfSuspect").value = strSuspect;
        document.getElementById("hdfSuspectSave").value = strSaveSuspect;
        document.getElementById("hdfSuspectString").value = intCount;

       




        //document.getElementById('<%=ddlPharmacopoeialMonograph.ClientID %>').selectedIndex = 0;
        //$("#txtOtherPharmacopoeialMonograph").hide();
        //$("#lblOtherPharmacopoeialMonograph").hide();
        //$("#divOtherPhar").hide();
        //document.getElementById('<%=txtNameofIngredient.ClientID %>').value = "";
        //document.getElementById('<%=txtOtherPharmacopoeialMonograph.ClientID %>').value = "";
        //document.getElementById('<%=txtStrength.ClientID %>').value = "";
        //document.getElementById('<%=txtStrengthUnit.ClientID %>').value = "";

        //document.getElementById('<%=txtNameofIngredient.ClientID %>').focus();

        strName = $('#txtMember').val("").focus();
        strHof = $('#txtHOF').val("");
        strage = $('#txtAge').val("");
        strnominated = $('#txtNominated').val("");
    }
}

function DelString(DeleteString) {

    var Msg = "Do you want remove this Suspect?";

    if (confirm(Msg)) {
        var strString = document.getElementById("<%=hdfSuspect.ClientID %>").value;
        strString = strString.replace(DeleteString, "");
        document.getElementById("<%=hdfSuspect.ClientID %>").value = strString;
        AddSuspect(DeleteString);
    }
}

function validateSuspectValues(DeleteString) {

    if (DeleteString != '') {
        return true;
    }

    var strName = "";
    var strHof = "";
    var strage = "";
    var strnominated = "";
    var strMsg = "";
    var isError = false;

    strName = $('#txtMember').val();
    strHof = $('#txtHOF').val();
    strage = $('#txtAge').val();
    strnominated = $('#txtNominated').val();

    if (strName == "") {
        strMsg = strMsg + "</br> * Please Enter Family member Name.";
        document.getElementById('txtMember').focus();
        isError = true;
    }

    if (strHof == "") {
        strMsg = strMsg + "</br> * Please Enter Relation with HOF.";
        document.getElementById('txtHOF').focus();
        isError = true;
    }
    if (strage == "") {
        strMsg = strMsg + "</br> * Please Enter Age.";
        document.getElementById('txtAge').focus();
        isError = true;
    }
    if (strnominated == "") {
        strMsg = strMsg + "</br> * Please Enter Nominated.";
        document.getElementById('txtNominated').focus();
        isError = true;
    }

    if (isError == true) {
        document.getElementById("divmore").innerHTML = " * Below are the Family Member Details validation error(s), please rectify ! <br> " + strMsg;
        $("#divmore").show();
        document.getElementById("divmore").focus();
        return false;
    }
    else {
        document.getElementById("divmore").innerHTML = "";
        $("#divmore").hide();
    }
    return true;

}

function GetDistrictwise(Category) {
  
    var district = $('#ddlDistrict').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/Agriculture/FarmerRegistration.aspx/GetDistrict",
        data: '{"prefix":"' + Category + '" ,  "DistrictCode":"' + district + '"}',
        dataType: "json",
        success: function (result) {
            var Category = eval(result.d);
            var html = "";
            var catCount = 0;
            $("#ddlTaluka").empty();
            $("#ddlTaluka").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlTaluka").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });
            //var ddlCustomers = $("[id*=ddlTaluka]");
            //ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            //$.each(r.d, function () {
            //    $("[id*=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            //});
        }
    });
}

function GetBlockwise(Category) {
  
    var Taluka = $('#ddlTaluka').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "/WebApp/Kiosk/Agriculture/FarmerRegistration.aspx/GetVillage",
        data: '{"prefix":"' + Category + '" ,  "SubDistrictCode":"' + Taluka + '"}',
        dataType: "json",
        success: function (result) {
            var Category = eval(result.d);
            var html = "";
            var catCount = 0;
            $("#ddlPanchayat").empty();
            $("#ddlPanchayat").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("#ddlPanchayat").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });
            //var ddlCustomers = $("[id*=ddlTaluka]");
            //ddlCustomers.empty().append('<option selected="selected" value="0">-Select-</option>');
            //$.each(r.d, function () {
            //    $("[id*=ddlTaluka]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            //});
        }
    });
}





