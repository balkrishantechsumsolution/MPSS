<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="OUATComplaintListDept.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.OUAT.OUATComplaintListDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../Citizen/Forms/Js/jquery.dataTables.min.js"></script>
    <script src="../../Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
    <link href="../../Citizen/Forms/Css/dataTables.jqueryui.min.css" rel="stylesheet" />
    <link href="../../Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script type="text/javascript">

        $(document).ready(function () {
            OUATDataTable();
        });

        function OUATDataTable() {
            var table = $("table[id$='DataGridView']").DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100, -1], [10, 50, 100, "All"]],
                    "iDisplayLength": 10,
                    "order": [[0, "desc"]]
                });

            $("table[id$='DataGridView'] thead th").each(function () {
                var title = $("table[id$='DataGridView'] thead th").eq($(this).index()).text();
                $(this).html('<input type="text" placeholder="' + title + '" />');
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
        };
    </script>

    <style>
        .w95 {
            width:95%;
            margin:0 auto;
        }
        #LeftPanel_pnlMenu { display:none;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="w95">
        <div class="col-lg-12 pright0 mb15"><a href="/WebApp/G2G/OUAT/OUATG2GDashboard.aspx" class="btn btn-info"><i class="fa fa-arrow-circle-left fa-fw"></i> Back To Page</a></div>
        <div class="mt20"></div>
        <div class="col-lg-12 box-container pright0">
            <div class="box-heading">
                <h4 class="box-title ng-binding">OUAT Complaint List :</h4>
            </div>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="dataTable_wrapper">
                        <div class="dataTables_wrapper form-inline dt-bootstrap no-footer divwidth" id="dataTables-example_wrapper">
                            <div class="">
                                <div class="row text-center" id="LoadingDiv" runat="server">
                                    <div>Please Wait While Data Is Being Loaded...</div>
                                    <img src="../../Login/Loading_hourglass_88px.gif" />
                                </div>
                                <div id="DisplayGrid" style="display: none" runat="server">
                                    <asp:GridView ID="DataGridView" AutoGenerateColumns="true" OnPreRender="DataGridView_PreRender" runat="server" ></asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

</asp:Content>
