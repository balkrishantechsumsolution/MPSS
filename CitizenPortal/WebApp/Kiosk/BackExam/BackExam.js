$(document).ready(function () {
    debugger;
    GetCBCSCourseList();
    $("#btnSubmit").click(function () {
        debugger;
        event.preventDefault();
        var BranchName = $('#ddlBranchName').val();
        var RollNo = $('#txtRollNo').val();
        var Semester = $('#ddlSemester').val();
        var StudentName = $('#txtStudentName').val();
        window.location.href = "../BackExam/StudentForm.aspx?BranchName=" + BranchName + "&RollNo=" + RollNo + "&Semester=" + Semester + "&StudentName=" + StudentName + "";
       
    });
});


function GetCBCSCourseList() {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/WebApp/Kiosk/CBCS/AdmissionForm.aspx/GetCBCSCourseList',
        data: '{}',
        dataType: "json",
        success: function (response) {
            var Category = eval(response.d);
            var html = "";
            var catCount = 0;

            var ddlps = $("[id=ddlBranchName]");
            ddlps.empty().append('<option selected="selected" value="0">-Select-</option>');
            $.each(Category, function () {
                $("[id=ddlBranchName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                catCount++;

            });
        },
        error: function (a, b, c) {
            alert("2." + a.responseText);
        }
    });
}
