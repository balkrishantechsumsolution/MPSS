function fnSearchData() {
    var regNo = "";
    var reqNo = "";
    var childName = "";
    var father = "";
    var mother = "";
    var gender = "";
    var DOB = "";
    var POB = "";
    if ($('#txtRegistration').val() != null || $('#txtRegistration').val() != "")
    { regNo = $('#txtRegistration').val() }

    if ($('#txtInstitutaionNo').val() != null || $('#txtInstitutaionNo').val() != "")
    { reqNo = $('#txtInstitutaionNo').val() }

    if ($('#txtChildname').val() != null || $('#txtChildname').val() != "")
    { childName = $('#txtChildname').val() }

    if ($('#txtFatherName').val() != null || $('#txtFatherName').val() != "")
    { father = $('#txtFatherName').val() }

    if ($('#txtMotherName').val() != null || $('#txtMotherName').val() != "")
    { mother = $('#txtMotherName').val() }

    if ($('#ddlSrchGender').val() != null || $('#ddlSrchGender').val() != "")
    { gender = $('#ddlSrchGender').val() }

    if ($('#txtDOB').val() != null || $('#txtDOB').val() != "")
    {
        var DOBArr = $('#txtDOB').val().split("/");
        var DOBConverted = DOBArr[2] + "-" + DOBArr[1] + "-" + DOBArr[0]; DOB = $('#txtDOB').val()
    }

    if ($('#txtPlace').val() != null || $('#txtPlace').val() != "")
    { POB = $('#txtPlace').val() }


  var temp = 'Gunwant'
    var datavar = {
     
    'regNo': regNo,
    'reqNo': reqNo,
    'childName':childName,
    'father':father,
    'mother':mother,
    'gender':gender,
    'DOB':DOB,
    'POB':POB

    };

    var obj = {
        "prefix": "'" + temp + "'",
        "Data": $.stringify(datavar, null, 4)
    };
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/Birth/BirthCertificate.aspx/SearchBirthData',
        data: $.stringify(obj, null, 4),
        processData: false,
        dataType: "json",
        success: function (data) {
            var obj = jQuery.parseJSON(data.d);
            var html = "";
            debugger;
            if (obj[0] != null) {
                if (obj[0]["RegistrationNo"] != "") {
                    $('#divRegNo').hide();
                    $('#divInstNo').hide();
                    $('#divOtherdtls').hide();
                    $('#divSerchBtn').hide();
                    $('#divDetails').show();
                    $('#divBtn').show();
                    $('#divPlace').show();
                    $('#divTabs').hide();

                    $('#txtregNo').val(obj[0]["RegistrationNo"]);
                    $('#txtChildName').val(obj[0]["ChildName"]);
                    $('#ddlGender').val(obj[0]["Gender"]);
                    $('#FatherName').val(obj[0]["FatherName"]);
                    $('#MotherName').val(obj[0]["MotherName"]);
                    $('#DOB').val(obj[0]["DateOfBirth"]);
                    $('#hospname').val(obj[0]["InstitutionName"]);
                    $('#POB').val(obj[0]["residentName"]);
                    $('#AddressLine1').val(obj[0]["AddressLine1"]);
                    $('#AddressLine2').val(obj[0]["AddressLine2"]);
                    $('#RoadStreetName').val(obj[0]["StreetRoadName"]);
                    $('#LandMark').val(obj[0]["LandMark"]);
                    $('#Locality').val(obj[0]["Locality"]);
                    $('#ddlVillage').val(obj[0]["PanchayatVillageCode"]);
                    $('#ddlTaluka').val(obj[0]["BlockTalukaCode"]);
                    $('#ddlDistrict').val(obj[0]["DistrictCode"]);
                    $('#ddlState').val(obj[0]["StateCode"]);
                    $('#PinCode').val(obj[0]["PinCode"]);

                    GetStateAsPerValue(obj[0]["StateCode"], obj[0]["DistrictCode"], obj[0]["BlockTalukaCode"], obj[0]["PanchayatVillageCode"]);
                }
            }
            else {
                $('#divRegNo').show();
                $('#divInstNo').hide();
                $('#divOtherdtls').hide();
                $('#divSerchBtn').show();
                $('#divDetails').hide();
                $('#divBtn').hide();
                $('#divPlace').hide();
                $('#divTabs').show();
            }
            
        },
        error: function (a, b, c) {
            result = false;
            alert("5." + a.responseText);
        }
    });
               

}


function GetStateAsPerValue(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";

        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/WebApp/Registration/KioskRegistration.aspx/GetState',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                $("[id*=ddlState]").empty();
                $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByText("ddlState", p_State);



                //$('#ddlTaluka').val();

                //GetDistrict(p_District);

                var SelIndex = t_StateVal;//$("#ddlState").val();

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: '/WebApp/Registration/KioskRegistration.aspx/GetDistrict',
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

                        t_DistrictVal = selectByText("ddlDistrict", p_District);

                        if (t_DistrictVal != "") {
                            //selectByText("ddlDistrict", p_District);

                            //GetSubDistrict(p_SubDistrict);


                            var SelIndex = t_DistrictVal;//$("#ddlDistrict").val();

                            $.ajax({
                                type: "POST",
                                contentType: "application/json; charset=utf-8",
                                url: '/WebApp/Registration/KioskRegistration.aspx/GetSubDistrict',
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
                                    
                                    t_SubDistrictVal = selectByText("ddlTaluka", p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '/WebApp/Registration/KioskRegistration.aspx/GetVillage',
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

                                            t_SubDistrictVal = selectByText("ddlVillage", p_Village);

                                        },
                                        error: function (a, b, c) {
                                            alert("4." + a.responseText);
                                        }


                                    });
                                    


                                },
                                error: function (a, b, c) {
                                    alert("3." + a.responseText);
                                }
                            });


                        }

                    },
                    error: function (a, b, c) {
                        alert("2." + a.responseText);
                    }
                });


            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });

    }

}

function selectByText(p_Control, txt) {
    //$("[id*=ddlState] option")
    //.filter(function () { return $.trim($(this).text()) == txt; })
    //.attr('selected', true);

    var t_Value = txt;

    //$("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
    //    //return $(this).text().toLowerCase() == txt.toLowerCase();
    //    if ($(this).val().toLowerCase() == txt.toLowerCase()) {
    //        t_Value = $(this).val();
    //        return t_Value;
    //    }
    //}).prop('selected', true);

    //alert(t_Value);
    if (t_Value != "") {
        $("[id*=" + p_Control + "]").val(t_Value);
    }

    //$("[id*=" + p_Control + "] option").each(function () {
    //    if ($(this).text() == theText) {
    //        //$(this).attr('selected', 'selected');
    //        t_Value = $(this).val();
    //    }
    //});

    //$("[id*=" + p_Control + "]").val(t_Value);

    return t_Value;
}



