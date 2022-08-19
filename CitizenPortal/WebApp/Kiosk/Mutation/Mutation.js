$(document).ready(function () {
    $('#divDeed').hide();
    $('#divMortgage').hide();
    $('#divRent').hide();
    
    $('#DODLI').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '02/12/2016',
        yearRange: "-50:+0",
        onSelect: function (date) {
           
        }
    });

    $('#DOIOH').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '02/12/2016',
        yearRange: "-50:+0",
        onSelect: function (date) {

        }
    });
    $('#DOPossission').datepicker({
        dateFormat: "dd/mm/yy",
        changeMonth: true,
        changeYear: true,
        maxDate: '02/12/2016',
        yearRange: "-50:+0",
        onSelect: function (date) {

        }
    });

});

function fuShowHideDiv(divID, isTrue) {
    debugger;
    //alert(divID);
    if (isTrue == "1") {
        $('#' + divID).show(500);
    }
    if (isTrue == "0") {
        $('#' + divID).hide(500);
    }
}