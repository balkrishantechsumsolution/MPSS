function ValidateDate(p_Date) {
    debugger;
    var inputText = p_Date;
    if (inputText != null && inputText != '') {
        var dateformat = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
        // Match the date format through regular expression  
        if (dateformat.test(inputText)) {
            var DOB = inputText.split('/');
            var Y = DOB[2];
            var M = DOB[1];
            var D = DOB[0];
            if (M < 10) {
                if (M.length == 1) {
                    M = '0' + M;
                }
                else
                    M = M;
            }
            if (D < 10) {
                if (D.length == 1) {
                    D = '0' + D;
                }
                else
                    D = D;
            }

            var NewDOB = D + '/' + M + '/' + Y;
            $('#ContentPlaceHolder1_DOJ').val(NewDOB);

            return true;
        }
        else {
            alert("Invalid date format!");
            //document.form1.text1.focus();
            $('#ContentPlaceHolder1_DOJ').val('');
            return false;
        }
    }
}

function CalDuration(t_Date) {

    var t_DOB = t_Date.replace("-", "/");
    var S_date = new Date(t_DOB.substr(6, 4), t_DOB.substr(3, 2) - 1, t_DOB.substr(0, 2));

    var today = new Date();
    var dd = today.getDate();

    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();
    if (dd < 10) {
        dd = '0' + dd;
    }

    if (mm < 10) {
        mm = '0' + mm;
    }
    today = dd + '/' + mm + '/' + yyyy;

    var Age = calcExSerDur(t_DOB, today);
    var t_Age = Age.years + " Years " + Age.months + " Months " + Age.days + " Days"
    $('#ContentPlaceHolder1_txtExperiance').val(t_Age);
    $('#ContentPlaceHolder1_hdnExperience').inputText = t_Age;

    //$("#Year").val(Age.years);
    //$("#Month").val(Age.months);
    //$("#Day").val(Age.days);
}
function CalculateExperiance() {
    debugger;
    var t_Date = $('#ContentPlaceHolder1_DOJ').val();

    if (!ValidateDate(t_Date)) {
        return false;
    }

    CalDuration(t_Date);

    
}

$(document).ready(function () {

    $('#ContentPlaceHolder1_DOJ').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-150:+0",
        maxDate: '0',

    });

    $('#ContentPlaceHolder1_DOB').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        yearRange: "-150:+0",
        maxDate: '0',

    });

    var t_Date = $('#ContentPlaceHolder1_DOJ').val();
    if (t_Date != "") {
        //CalDuration(t_Date);
    }

    debugger;
    var table = $("table[id$='grdView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
        ({
            dom: 'Bfrtip',
            buttons: ['pageLength', 'excel', 'print'],
            "lengthMenu": [[10, 50, 100,-1], [10, 50, 100, 'All']],
            "iDisplayLength": 10
        });

    //$("div[id$='LoadingDiv']").hide(800);
    //$("div[id$='DisplayGrid']").show(800);

});

function ConfirmSubmit() {
    debugger;
    if (confirm("Please Confirm! Do you want to Submit the Save Mark?")) {
        //confirm_value.value = "Yes";
        return true;
    } else {
        //confirm_value.value = "No";
        return false;
    }


}
