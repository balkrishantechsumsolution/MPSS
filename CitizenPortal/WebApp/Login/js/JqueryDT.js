// ***** Enable JQuery DataTable ****//

//$(document).ready(function () {
//    debugger;
//        $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
//        $('#DataGridView').dataTable();
//    });

// ***** Enable JQuery DataTable With Multiple Filters****//
//$(document).ready(function () {
//    debugger;
//    var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
//        ({
//            "iDisplayLength": 10,
//        });

//    $("table[id$='DataGridView'] thead th").each(function () {
//        var title = $("table[id$='DataGridView'] thead th").eq($(this).index()).text();
//        $(this).html('<input type="text" placeholder="Search ' + title + '" />');
//    });

//    table.columns().every(function () {
//        var dataTableColumn = this;
//        var searchTextBoxes = $(this.header()).find('input');
//        searchTextBoxes.on('keyup change', function () {
//            dataTableColumn.search(this.value).draw();
//        });

//        searchTextBoxes.on('click', function (e) {
//            e.stopPropagation();
//        });
//    });
//});


// ***** Enable JQuery DataTable Server Side With Multiple Filters****//
$(document).ready(function () {
    debugger;
    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: '/g2c/forms/CenterListV2.aspx/GetDataFromDB',
        data: '{}',
        processData: true,
        async: true,
        dataType: "json",
        success: function (response) {
            var item = $.parseJSON(response.d);
            if (item != null && item.length > 0) {
                var dynamicColumns = [];
                var i = 0;
                $.each(item[0], function (key, value) {
                    var obj = { sTitle: key };
                    dynamicColumns[i] = obj;
                    i++;
                });
                var rowDataSet = [];
                var i = 0;
                $.each(item, function (key, value) {
                    var rowData = [];
                    var j = 0;
                    $.each(item[i], function (key, value) {
                        rowData[j] = value;
                        j++;
                    });
                    rowDataSet[i] = rowData;
                    i++;
                });

                var table = $("table[id$='DataGridView']").DataTable({
                    "processing": true,
                    "ServerSide": true,
                    "iDisplayLength": 10,
                    "bDestroy": true,
                    "bInfo": true,
                    "bFilter": true,
                    "bSort": true,
                    "aaData": rowDataSet,
                    "aoColumns": dynamicColumns,
                });

                $("table[id$='DataGridView'] thead th").each(function () {
                    var title = $("table[id$='DataGridView'] thead th").eq($(this).index()).text();
                    $(this).html('<input type="text" placeholder="Search ' + title + '" />');
                });

                $("div[id$='LoadingDiv']").hide(800);
                $("div[id$='DisplayGrid']").show(800);
                $("div[id$='DisplayGrid']").css("width:100% !important");

                table.columns().every(function () {
                    var dataTableColumn = this;
                    var searchTextBoxes = $(this.header()).find('input');
                    searchTextBoxes.on('keyup change', function () {
                        dataTableColumn.search(this.value).draw();
                    });
                    searchTextBoxes.on('click', function (e) {
                        e.stopPropagation();
                    });
                });
            }
        }
    });
});