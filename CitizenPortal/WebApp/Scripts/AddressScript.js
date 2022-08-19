
function GetState() {
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
            $("[id*=ddlState]").empty();
            $("[id*=ddlState]").append('<option value = "0">-Select-</option>');
            $.each(arr, function () {
                $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
            });

        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });
}


function GetStateV2(category, StateControl) {
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
            //$("[id*=ddlState]").empty();
            //$("[id*=ddlState]").append('<option value = "0">-Select-</option>');
            //$.each(arr, function () {
            //    $("[id*=ddlState]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
            //    //console.log(this.Id + ',' + this.Name);
            //});

            $("[name='" + StateControl + "']").empty();
            $("[name='" + StateControl + "']").append('<option value = "0">-Select-</option>');
            $.each(arr, function () {
                $("[name='" + StateControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                //catCount++;
            });

        },
        error: function (a, b, c) {
            alert("1." + a.responseText);
        }
    });
}

/*
function GetDistrict(category) {
    var SelIndex = category;

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Registration/KioskRegistration.aspx/GetDistrict',
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
        url: '/webapp/Registration/KioskRegistration.aspx/GetSubDistrict',
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
        url: '/webapp/Registration/KioskRegistration.aspx/GetVillage',
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
*/

//GetDistrictFromState
// This function is created to bind the Districts as per the State Value selected in the Form.
function GetDistrictV2(category, StateControl, DistrictControl) {
    var SelIndex = $("[name='" + StateControl + "']").val();
    //var SelIndex = StateControl;
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
            $("[name='" + DistrictControl + "']").empty();
            $("[name='" + DistrictControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + DistrictControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}

function GetDistrict(category, StateControl, DistrictControl) {
    //var SelIndex = $("[name='" + StateControl + "']").val(); //This Logic is commented to bind the Districts Directly from State, using a hard coded value of the State.
    var SelIndex = StateControl;
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
            $("[name='" + DistrictControl + "']").empty();
            $("[name='" + DistrictControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + DistrictControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });


        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

}

function ResetControlsAsPerSubDistrict() {
    //var StateControl = "ctl00$ContentPlaceHolder1$Address2$ddlState";
    var DistrictControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlDistrict";
    var TalukaControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlTaluka";
    var VillageControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlVillage";
    var ServiceControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlServices";
    var DepartmentControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlDepartment";
    var OfficeControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlOffice";
    var OfficerControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlOfficer";


    $("[name='" + VillageControl + "']").empty();
    $("[name='" + VillageControl + "']").append('<option value = "0">-Select-</option>');

    $("[name='" + OfficeControl + "']").empty();
    $("[name='" + OfficeControl + "']").append('<option value = "0">-Select-</option>');

    $("[name='" + OfficerControl + "']").empty();
    $("[name='" + OfficerControl + "']").append('<option value = "0">-Select-</option>');

}
/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category 
 * @param {} DistrictControl 
 * @param {} TalukaControl 
 * @returns {} 
 */
function GetSubDistrict(category, DistrictControl, TalukaControl) {
    debugger;
    var SelIndex = $("[name='" + DistrictControl + "']").val();
    ResetControlsAsPerSubDistrict();
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
            $("[name='" + TalukaControl + "']").empty();
            $("[name='" + TalukaControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + TalukaControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });


        },
        error: function (a, b, c) {
            alert("3." + a.responseText);
        }
    });

}
/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category 
 * @param {} TalukaControl 
 * @param {} VillageControl 
 * @returns {} 
 */
function GetVillage(category, TalukaControl, VillageControl) {
    var SelIndex = $("[name='" + TalukaControl + "']").val();

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
            $("[name='" + VillageControl + "']").empty();
            $("[name='" + VillageControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + VillageControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });


        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}

/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category 
 * @param {} OfficeControl 
 * @param {} DistrictControl 
 * @param {} TalukaControl 
 * @param {} VillageControl 
 * @param {} ServiceControl 
 * @param {} DepartmentControl 
 * @returns {} 
 */
function GetOffice(category, OfficeControl, DistrictControl, TalukaControl, VillageControl, ServiceControl, DepartmentControl) {
    debugger;
    
    var DistIndex = $("[name='" + DistrictControl + "']").val();
    var BlockIndex = $("[name='" + TalukaControl + "']").val();
    var PanchIndex = $("[name='" + VillageControl + "']").val();
    var SvcIndex = $("[name='" + ServiceControl + "']").val().split('_');
    var DeptIndex = $("[name='" + DepartmentControl + "']").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/forms/OfficeOfficer.aspx/GetOffice',
        data: '{"prefix":"' + category + '","DistrictCode":"' + DistIndex + '","SubDistrictCode":"' + BlockIndex + '","VillageCode":"' + PanchIndex + '","ServiceCode":"' + SvcIndex[0] + '","DepartmentCode":"' + DeptIndex + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var selectedOffice = 0;
            $("[name='" + OfficeControl + "']").empty();
            $("[name='" + OfficeControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + OfficeControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);

                if (catCount == 0) {
                    selectedOffice = this.Id;
                }

                catCount++;
            });

            if (catCount == 1) {
                var OfficerControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlOfficer";

                $("[name='" + OfficeControl + "']").val(selectedOffice);
                GetOfficer("", OfficerControl, OfficeControl, ServiceControl, DistrictControl, TalukaControl);

            }



        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}

/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category 
 * @param {} OfficerControl 
 * @param {} OfficeControl 
 * @param {} ServiceControl 
 * @param {} DistrictControl 
 * @param {} BlockControl 
 * @returns {} 
 */
function GetOfficer(category, OfficerControl, OfficeControl, ServiceControl, DistrictControl, BlockControl) {
    var OfficeIndex = $("[name='" + OfficeControl + "']").val();
    var ServiceIndex = $("[name='" + ServiceControl + "']").val().split('_');
    var DistrictCode = $("[name='" + DistrictControl + "']").val();
    var BlockCode = $("[name='" + BlockControl + "']").val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/forms/OfficeOfficer.aspx/GetOfficer',
        data: '{"prefix":"' + category + '","OfficeCode":"' + OfficeIndex + '","ServiceCode":"' + ServiceIndex[0] + '", "DistrictCode":"'+DistrictCode+'", "BlockCode":"'+BlockCode+'"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            var selectedOfficer = 0;
            $("[name='" + OfficerControl + "']").empty();
            $("[name='" + OfficerControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + OfficerControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);

                if (catCount == 0) {
                    selectedOfficer = this.Id;
                }

                catCount++;
            });

            if (catCount == 1) {
                $("[name='" + OfficerControl + "']").val(selectedOfficer);
            }

        },
        error: function (a, b, c) {
            alert("4." + a.responseText);
        }
    });

}

/**
 * This function is used to Bind the List of all the Services as available in Portal.
 * @param {} category 
 * @param {} ServiceControl 
 * @param {} DepartmentControl 
 * @returns {} 
 */
function GetServices(category, ServiceControl, DepartmentControl) {
    debugger;
    var SelIndex = $("[name='" + ServiceControl + "']").val();
    if (SelIndex != '0') {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/webapp/Kiosk/forms/OfficeOfficer.aspx/GetServices',
            data: '{"prefix": ""}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";

                $("[name='" + ServiceControl + "']").empty();
                $("[name='" + ServiceControl + "']").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[name='" + ServiceControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                });

                var qs = getQueryStrings();
                var t_SvcID = "";
                if (qs["SvcID"] != null) {
                    t_SvcID = qs["SvcID"];
                    GetSelectedServices("", ServiceControl, t_SvcID, "", DepartmentControl, ServiceControl);//Implemented in AddressScript.js
                }

            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }
    else {
    }
}

/**
 * This function is used to Bind the List of all the Services as available in Portal.
 * @param {} category 
 * @param {} ServiceControl 
 * @param {} DepartmentControl 
 * @returns {} 
 */
function GetServicesV2(category, ServiceControl, DepartmentControl) {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Kiosk/forms/OfficeOfficer.aspx/GetServices',
        data: '{"prefix": ""}',
        processData: false,
        dataType: "json",
        success: function(response) {
            var arr = eval(response.d);
            var html = "";

            $("[name='" + ServiceControl + "']").empty();
            $("[name='" + ServiceControl + "']").append('<option value = "0">-Select-</option>');
            $.each(arr,
                function() {
                    $("[name='" + ServiceControl + "']")
                        .append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                });

            var qs = getQueryStrings();
            var t_SvcID = "";
            if (qs["SvcID"] != null) {
                t_SvcID = qs["SvcID"];
                GetSelectedServices("", ServiceControl, t_SvcID, "", DepartmentControl, ServiceControl);//Implemented in AddressScript.js
            }

        },
        error: function(a, b, c) {
            alert("1." + a.responseText);
        }
    });

}

function GetSelectedServices(category, ServiceControl, ServiceID, deptCategory, DepartmentControl) {
    debugger;
    //var SelIndex = $("[name='" + ServiceControl + "']").val();

    if (ServiceID != "") {
        //$("[name='" + ServiceControl + "']").val(ServiceID);
        selectServiceByVal(ServiceControl, ServiceID, deptCategory, DepartmentControl);
        //GetDepartmentCode(deptCategory, DepartmentControl, ServiceControl);
        //$("[name='" + DepartmentControl + "']").val(this.Id);

        //$("[name='" + DepartmentControl + "']").attr("disabled", true);

        ////disable it 
        //var $hiddenInput = $('<input/>', {
        //    type: 'hidden', name: name, value: $dropDown.val()
        //});

        //    $form.append($hiddenInput);  //append the hidden field with same name and value from the dropdown field

        //var $dropDown = $("[name='" +DepartmentControl + "']");

        //$dropDown.addClass('disabled')  //disable class
        //         .prop({
        //             'name': name + "_1", disabled: true
        //         }); //change


    }
}

function selectServiceByVal(p_Control, txt, deptCategory, DepartmentControl) {
    //$("[id*=ddlState] option")
    //.filter(function () { return $.trim($(this).text()) == txt; })
    //.attr('selected', true);

    var t_Value = "";

    //$("[name='" + p_Control + "'] option").filter(function () {
    //    //return $(this).text().toLowerCase() == txt.toLowerCase();

    //    var ServiceIndex = $(this).val().split('_');

    //    if (ServiceIndex[0]== txt) {
    //        t_Value = $(this).val();
    //        return t_Value;
    //    }
    //}).prop('selected', true);


    $("[name='" + p_Control + "'] > option").each(function () {
        var ServiceIndex = $(this).val().split('_');

        if (ServiceIndex[0] == txt) {
            t_Value = $(this).val();

            GetDetailsFromService(t_Value, deptCategory, DepartmentControl, p_Control);

            return t_Value;
        }
    });


    //alert(t_Value);
    if (t_Value != "") {
        $("[name='" +p_Control + "']").val(t_Value);
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

/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category 
 * @param {} DepartmentControl 
 * @param {} ServiceControl 
 * @returns {} 
 */
function GetDeptServices(category, DepartmentControl, ServiceControl) {
    debugger;
    var SelIndex = $("[name='" + DepartmentControl + "']").val();
    if (SelIndex != '0') {
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: '/webapp/Kiosk/forms/OfficeOfficer.aspx/GetDeptServices',
            data: '{"prefix": "","DepartmentCode":"' + SelIndex + '"}',
            processData: false,
            dataType: "json",
            success: function (response) {
                var arr = eval(response.d);
                var html = "";
                var catCount = 0;
                $("[name='" + ServiceControl + "']").empty();
                $("[name='" + ServiceControl + "']").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[name='" + ServiceControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    catCount++;
                });

                //$("[name='" + ServiceControl + "']").append('<option value = ' + catCount + '>Show All Services</option>');

            },
            error: function (a, b, c) {
                alert("1." + a.responseText);
            }
        });
    }
    else {

        //GetServices("", ServiceControl, DepartmentControl);// Line commented due to an issue in binding all Services in the Service Dropdown, in case, no Department is selected
        GetServicesV2("", ServiceControl, DepartmentControl); //Logic altered to resolve an issue, wherein, all Services needs to be displayed in Service Dropdown, in case, no Department is selected.
    }
    $("#divGrid").hide();
}


function ResetControls() {


    //var StateControl = "ctl00$ContentPlaceHolder1$Address2$ddlState";
    var DistrictControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlDistrict";
    var TalukaControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlTaluka";
    var VillageControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlVillage";
    var ServiceControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlServices";
    var DepartmentControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlDepartment";
    var OfficeControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlOffice";
    var OfficerControl = "ctl00$ContentPlaceHolder1$DesignatedOfficer$ddlOfficer";


    $("[name='" + DistrictControl + "']").val(0);
    

    $("[name='" + TalukaControl + "']").empty();
    $("[name='" + TalukaControl + "']").append('<option value = "0">-Select-</option>');


    $("[name='" + VillageControl + "']").empty();
    $("[name='" + VillageControl + "']").append('<option value = "0">-Select-</option>');

    $("[name='" + OfficeControl + "']").empty();
    $("[name='" + OfficeControl + "']").append('<option value = "0">-Select-</option>');

    $("[name='" + OfficerControl + "']").empty();
    $("[name='" + OfficerControl + "']").append('<option value = "0">-Select-</option>');

}

/**
 * This Function is used in Pages or Javascript files as
 * 1. OfficeOfficer.js file in OfficeOfficer.aspx file.
 * @param {} category 
 * @param {} DepartmentControl 
 * @param {} ServiceControl 
 * @returns {} 
 */
function GetDepartmentCode(category, DepartmentControl, ServiceControl) {
    debugger;
    //var SelIndex = $("[name='" + StateControl + "']").val();
    //var SelIndex = ServiceControl.split('_');
    var SelIndex = $("[name='" + ServiceControl + "']").val().split('_');

    ResetControls();

    if (SelIndex != '0') {
        if (SelIndex[0] != null) {
            BindAppleteAuthority(category, SelIndex[0]);
        }

        if (SelIndex[2] != null) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/webapp/Kiosk/forms/OfficeOfficer.aspx/GetDepartmentCode',
                data: '{"prefix":"' + category + '","DepartmentCode":"' + SelIndex[2] + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    //$("[name='" + DepartmentControl + "']").empty();
                    //$("[name='" + DepartmentControl + "']").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        //$("[name='" + DepartmentControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        //catCount++;
                        $("[name='" + DepartmentControl + "']").val(this.Id);
                    });
                    $("[name='" + DepartmentControl + "']").attr("disabled", true);

                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }
    }
    else {
        //$("[name='" + DepartmentControl + "']").empty();
        //$("[name='" + DepartmentControl + "']").append('<option value = "0">-Select-</option>');
        GetDeptServices("", DepartmentControl, ServiceControl);
        $("[name='" + DepartmentControl + "']").val(0);
        $("[name='" + DepartmentControl + "']").attr("disabled", false);
        $("#divGrid").hide();
        $('#divOfficeOfficer').hide();
    }

}

function GetDetailsFromService(p_Value, category, DepartmentControl, ServiceControl) {
    debugger;
    //var SelIndex = $("[name='" + StateControl + "']").val();
    //var SelIndex = ServiceControl.split('_');
    var SelIndex = p_Value.split('_');
    if (SelIndex != '0') {
        if (SelIndex[0] != null) {
            BindAppleteAuthority(category, SelIndex[0]);
        }

        if (SelIndex[2] != null) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/webapp/Kiosk/forms/OfficeOfficer.aspx/GetDepartmentCode',
                data: '{"prefix":"' + category + '","DepartmentCode":"' + SelIndex[2] + '"}',
                processData: false,
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;
                    //$("[name='" + DepartmentControl + "']").empty();
                    //$("[name='" + DepartmentControl + "']").append('<option value = "0">-Select-</option>');
                    $.each(Category, function () {
                        //$("[name='" + DepartmentControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        //console.log(this.Id + ',' + this.Name);
                        //catCount++;
                        $("[name='" + DepartmentControl + "']").val(this.Id);
                    });
                    $("[name='" + DepartmentControl + "']").attr("disabled", true);

                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }
    }
    else {
        $("[name='" + DepartmentControl + "']").empty();
        $("[name='" + DepartmentControl + "']").append('<option value = "0">-Select-</option>');
        $("#divGrid").hide();
        $('#divOfficeOfficer').hide();
    }

}

function GetDepartment(category, DepartmentControl, ServiceControl) {
    debugger;
    //var SelIndex = $("[name='" + StateControl + "']").val();
    //var SelIndex = ServiceControl.split('_');
    //var SelIndex = $("[name='" + ServiceControl + "']").val().split('_');

    //BindAppleteAuthority(category, SelIndex[0]);

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/webapp/Kiosk/forms/OfficeOfficer.aspx/GetDepartment',
        data: '{"prefix":"' + category + '"}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("[name='" + DepartmentControl + "']").empty();
            $("[name='" + DepartmentControl + "']").append('<option value = "0">-Select-</option>');
            $.each(Category, function () {
                $("[name='" + DepartmentControl + "']").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                //console.log(this.Id + ',' + this.Name);
                catCount++;
            });

        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });

    //,"DepartmentCode":"' + SelIndex[2] + '"

}


function GetStateOdisha(p_State, p_District, p_SubDistrict, p_Village) {

    if (p_State != "") {
        var category = "";
        var t_StateVal = "";
        var t_DistrictVal = "";
        var t_SubDistrictVal = "";
        var t_VillageVal = "";

        var AddState = "ddlState";
        var AddDistrict = "ddlDistrict";
        var AddTaluka = "ddlTaluka";
        var AddVillage = "ddlVillage";

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
                $("[id*=" + AddState + "]").empty();
                $("[id*=" + AddState + "]").append('<option value = "0">-Select-</option>');
                $.each(arr, function () {
                    $("[id*=" + AddState + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                    //console.log(this.Id + ',' + this.Name);
                });

                //$("[id*=ddlState]").text(p_Value);
                t_StateVal = selectByText(AddState, "ODISHA");



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
                        $("[id*=" + AddDistrict + "]").empty();
                        $("[id*=" + AddDistrict + "]").append('<option value = "0">-Select-</option>');
                        $.each(Category, function () {
                            $("[id*=" + AddDistrict + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                            //console.log(this.Id + ',' + this.Name);
                            catCount++;
                        });

                        t_DistrictVal = selectByText(AddDistrict, p_District);

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
                                    $("[id*=" + AddTaluka + "]").empty();
                                    $("[id*=" + AddTaluka + "]").append('<option value = "0">-Select-</option>');
                                    $.each(Category, function () {
                                        $("[id*=" + AddTaluka + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                        //console.log(this.Id + ',' + this.Name);
                                        catCount++;
                                    });

                                    t_SubDistrictVal = selectByText(AddTaluka, p_SubDistrict);


                                    var SelIndex = t_SubDistrictVal;//$("#ddlTaluka").val();

                                    $.ajax({
                                        type: "POST",
                                        contentType: "application/json; charset=utf-8",
                                        url: '../../Registration/KioskRegistration.aspx/GetVillage',
                                        data: '{"prefix":"' + category + '","SubDistrictCode":"' + SelIndex + '"}',
                                        processData: false,
                                        dataType: "json",
                                        success: function (response) {
                                            var Category = eval(response.d);
                                            var html = "";
                                            var catCount = 0;
                                            $("[id*=" + AddVillage + "]").empty();
                                            $("[id*=" + AddVillage + "]").append('<option value = "0">-Select-</option>');
                                            $.each(Category, function () {
                                                $("[id*=" + AddVillage + "]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                                                //console.log(this.Id + ',' + this.Name);
                                                catCount++;
                                            });

                                            t_VillageVal = selectByText(AddVillage, p_Village);
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

    var t_Value = "";

    $("[id*=" + p_Control + "] option").prop('selected', false).filter(function () {
        //return $(this).text().toLowerCase() == txt.toLowerCase();
        if ($(this).text().toLowerCase() == txt.toLowerCase()) {
            t_Value = $(this).val();
            return t_Value;
        }
    }).prop('selected', true);

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
function fnCheckPinCode() {
    debugger;
    var PinCode = $('#PinCode').val();
    var state = $('#ddlState').val();
    if (state == 21) {
        var pinmatch = /^[7]\d{5}$/;
        if (!pinmatch.test(PinCode)) {
            alertPopup("Form Validation", "Please enter valid PinCode, starting with 7");
            $('#PinCode').val("");
            opt = 1;

        }
    }
}
$(document).ready(function () {

    $("#PinCode").bind("change", function (e) { return fnCheckPinCode(); });
});