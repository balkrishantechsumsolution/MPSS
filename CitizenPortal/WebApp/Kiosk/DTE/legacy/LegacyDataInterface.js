
$(document).ready(function () {

 
    //GetUKDistrict();
    GetInstituteMaster();
    GetBranchMaster();


    //$('#btnsubmit').prop('disabled', true);

});
function registration() {

    var registration = $('#txtRegistration').val();

    $('#HFRegistration').val(registration);

}
function studentname() {

    var student = $('#txtStudentName').val();

    $('#HFStudentName').val(student);

}

function INSTITUDE() {
    debugger;
    var institude = $('#ddlinstitude').val();
    var Branch = $('#DropDownList1').val();
    $('#HFInstitude').val(institude);
    $('#HFBranch').val(Branch);
    //var insname = $('#ddlinstitude option:selected').text();
    //$('#HiddenField1').val(insname);

}



function GetInstituteMaster() {
   
    var insname = $('#ddlinstitude').val();
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DTE/legacy/LegacyDataInterface.aspx/GetInstituteMaster',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var obj = jQuery.parseJSON(response.d);
           
            $('#HFInstitude').val(insname);
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;
            $("#ddlinstitude").empty();
            $("#ddlinstitude").append('<option value = "0">-Select College Name-</option>');
            $.each(Category, function () {
                $("#ddlinstitude").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
              
                catCount++;
            });
           
         
        },
        error: function (a, b, c) {
            alert("Unable to fetch Institute Name" + a.responseText);
        }
    });
}

function GetBranchMaster() {

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/DTE/legacy/LegacyDataInterface.aspx/GetBranchMaster',
        data: '{"prefix":""}',
        processData: false,
        dataType: "json",
        success: function (response) {
            var obj = jQuery.parseJSON(response.d);
            var Category = eval(response.d);

            var html = "";
            var catCount = 0;
            $("#DropDownList1").empty();
            $("#DropDownList1").append('<option value = "0">-Select Branch Name-</option>');
            $.each(Category, function () {
                $("#DropDownList1").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;
            });
           
        },
        error: function (a, b, c) {
            alert("Unable to fetch Brach Name" + a.responseText);
        }
    });
}