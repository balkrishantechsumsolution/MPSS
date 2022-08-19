<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/G2G/Master/G2GMaster.Master" AutoEventWireup="true" CodeBehind="NoticeBoard.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SU.NoticeBoard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%--<script src="../../../fckeditor/fckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/12.4.0/classic/ckeditor.js"></script>--%>

    <title>Data Entry Report View</title>
    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="Script/NoticeBoard.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/G2G/OISF/css/allocationCenterStylesheet.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />
    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />
    <script src="https://cdn.ckeditor.com/4.14.0/standard-all/ckeditor.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            debugger;
            var table = $("table[id$='DataGridView']").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable
                ({
                    dom: 'Bfrtip',
                    buttons: ['pageLength', 'excel', 'print'],
                    "lengthMenu": [[10, 50, 100], [10, 50, 100]],
                    "iDisplayLength": 10
                });

            $("table[id$='DataGridView'] thead th").each(function () {
                var title = $("table[id$='DataGridView'] thead th").eq($(this).index()).text();
                $(this).html('<input type="text" placeholder="' + title + '" />');
            });

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
        });
        //fckNotice.Value.Trim()
    </script>
    <script type="text/javascript">
        
    </script>
    <style>
        tfoot > button, input, select, textarea {
            height: 25px;
            font-weight: bolder;
            color: #000000;
        }


        table#DataGridView > thead > tr > th {
            width: 25% !important;
        }

        table#DataGridView > tbody > tr > td {
            width: 25% !important;
        }

        #DataGridView input, textarea {
            min-width: 75px !important;
            width: 100% !important;
            max-width: 200px !important;
            color: #333;
        }

        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }
    </style>
    <style>
        tfoot > button, input, select, textarea {
            height: 25px;
            font-weight: bolder;
            color: #000000;
        }


        table#DataGridView > thead > tr > th {
            width: 25% !important;
        }

        table#DataGridView > tbody > tr > td {
            width: 25% !important;
        }

        #DataGridView input, textarea {
            min-width: 75px !important;
            width: 100% !important;
            max-width: 200px !important;
            color: #333;
        }

        .form-heading {
            color: #820000;
            text-align: left;
            border-left: 15px solid #ce6d07;
            border-right: 2px solid #ce6d07;
            border-top: 1px solid #d8d8d8;
            border-bottom: 1px solid #d8d8d8;
            background: rgba(0, 0, 0, .075);
            padding: 10px 20px 10px 15px;
            border-top-right-radius: 2px;
            border-top-left-radius: 2px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: x-large;
        }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div class="container-fluid">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Configure Notice</h2>
                </div>
            </div>
            <%---Start of Filter----%>
            <div class="row" style="">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Search Filter
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtFromDate">
                                    From Date
                                </label>
                                <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtToDate">
                                    To Date
                                </label>
                                <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="txtSearch">
                                    Search Text
                                </label>
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search Text"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="" for="">
                                    &nbsp;</label><input type="button" id="btnSearch" class="btn btn-primary" value="Search" title="Get data" onclick="GetNoticeData();" />
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>
                        <div class="row col-md-12 box-container">
                            <div id="DataGrid" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <%--<table cellpadding="5" cellspacing="0" class="table table-bordered" style="width:100%;margin:5px auto;">
                                    <thead>
                                        <tr>
                                            <th style="width: 5px"><b>S.No.</b></th>
                                            <th style="width: 100px"><b>Notice Date</b></th>
                                            <th style="width: 200px"><b>Notice Type</b></th>
                                            <th><b>Details</b></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <div ></div>
                                    </tbody>
                                </table>--%>
                            </div>
                        </div>
                        <div class="clearfix">
                        </div>

                    </div>
                </div>
            </div>
            <%----END of Filter-----%>
            <div class="row">
                <div class="col-md-12 box-container">
                    <div class="box-heading">
                        <h4 class="box-title">Notice&nbsp; Details
                        </h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Notice Number</label>
                                <input type="text" id="txtNo" class="form-control" placeholder="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory">
                                    Notice
                                Date</label>
                                <input type="text" id="txtDate" class="form-control" placeholder="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-2">
                            <div class="form-group">
                                <label class="manadatory" for="category">
                                    Show in
                                </label>
                                <select class="form-control" data-val="true" data-val-number="Category" data-val-required="Please select your Category" id="category" name="Category">
                                    <option value="Select Category">Select</option>
                                    <option value="College">College Dashboard</option>
                                    <option value="Student">Student Dashboard</option>
                                    <option value="Both">Both</option>
                                </select>

                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-6">
                            <div class="form-group">
                                <label class="manadatory">
                                    Notice Heading</label>
                                <input type="text" id="txtHeading" class="form-control" placeholder="" autocomplete="off" />
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <%--<div class="form-group">
                                <label class="manadatory">
                                    Detail</label><br />
                                <textarea name="content" id="txtDetail" style="height: 55px"></textarea>
                                
                                <script>
                                    ClassicEditor
                                            .create(document.querySelector('#txtDetail'))
                                            .then(editor => {
                                                console.log(editor);
                                                myEditor = editor;
                                            })
                                            .catch(error => {
                                                console.error(error);
                                            });
                                </script>
                            </div>--%>
                            <textarea cols="80" id="txtDetail" name="txtDetail" rows="10"></textarea>
                            <%--<input type="button" id="btnSubmit" class="btn btn-success" value="Get Value" onclick="GetValue();" />--%>

                            <script>
                                CKEDITOR.replace('txtDetail', {
                                    height: 260,
                                });
                            </script>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div id="divBtn" class="row">
                <div class="col-md-12 box-container" style="margin-top: 5px;">
                    <div class="box-body box-body-open" style="text-align: center;">

                        <input type="button" id="btnSubmit" class="btn btn-primary" value="Submit" title="insert data" onclick="SubmitData();" />
                        &nbsp;
                                <input type="submit" name="" value="Home" id="btnHome" title="Back to Home Page" class="btn btn-primary" />
                    </div>
                </div>
                <div class="clearfix">
                </div>
            </div>
        </div>
    </div>

</asp:Content>
