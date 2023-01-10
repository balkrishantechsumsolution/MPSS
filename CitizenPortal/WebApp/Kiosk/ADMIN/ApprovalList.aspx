<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ApprovalList.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.ADMIN.ApprovalList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!DOCTYPE html>



    <meta http-equiv="PRAGMA" content="NO-CACHE" />
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />

    <script src="../../../Scripts/jquery-2.2.3.js"></script>
    <script src="../../../Scripts/angular.min.js"></script>
    <link href="../../../Sambalpur/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../../Sambalpur/css/homestyle.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <%--   --%>
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <%-- <link href="../../bootstrap.min.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/timeline.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet4.css" rel="stylesheet" />--%>
    <%----%><link href="/WebApp/Common/Styles/style.admin.css" rel="stylesheet" />

    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Styles/sb-admin-2.css" rel="stylesheet" />
    <script src="../../Scripts/DisableBackButton.js"></script>

    <style>
        #gv {
            margin: 25px auto 0 auto;
        }

            #gv tr th {
                padding: 10px;
            }

            #gv tr td {
                padding: 10px;
            }

            #gv > tbody > tr:nth-child(1) {
                background-color: #006699;
                font-weight: 10px;
                color: White;
                padding: 10px;
            }

            #gv > tbody > tr:not(:nth-child(1)) {
                background-color: #E3EAEB;
                padding: 10px;
            }

            #gv > tbody > tr.pagingDiv {
                display: inline-block;
                max-width: 100%;
                margin-bottom: 5px;
                font-weight: bold;
                padding: 10px;
            }

                #gv > tbody > tr.pagingDiv table {
                    color: #000 !important;
                    display: block !important;
                    margin: 0 !important;
                    padding: 10px;
                }

                    #gv > tbody > tr.pagingDiv table td {
                        color: #000 !important;
                        display: block !important;
                        margin: 0 !important;
                        padding: 10px;
                    }

        .pagingDiv a, .pagingDiv span {
            display: inline-block;
            padding: 0px 9px;
            margin-right: 4px;
            border-radius: 3px;
            border: solid 1px #c0c0c0;
            background: #e9e9e9;
            box-shadow: inset 0px 1px 0px rgba(255,255,255, .8), 0px 1px 3px rgba(0,0,0, .1);
            font-size: .875em;
            font-weight: bold;
            text-decoration: none;
            color: #717171;
            text-shadow: 0px 1px 0px rgba(255,255,255, 1);
        }

            .pagingDiv a:hover {
                background: #fefefe;
                background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#FEFEFE), to(#f0f0f0));
                background: -moz-linear-gradient(0% 0% 270deg,#FEFEFE, #f0f0f0);
            }

            .pagingDiv a.active {
                border: none;
                background: #616161;
                box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);
                color: #f0f0f0;
                text-shadow: 0px 0px 3px rgba(0,0,0, .5);
            }

        .pagingDiv span {
            color: #f0f0f0;
            background: #616161;
        }

        #gv a, #gv span {
            display: block;
            padding: 5px 15px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        #gv a {
            background-color: #f0f0f0;
            color: #545454;
            border: 1px solid #ddd;
        }

            #gv a:hover {
                background-color: #37495f;
                color: #fff;
            }

        #gv span {
            background-color: #B65838;
            color: #fff;
            border: 1px solid #B65838;
        }
    </style>

    <script src="/WebApp/Login/js/jquery-1.12.3.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>

    <%--<script src="bootstrap-datetimepicker.min.js"></script>--%>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/WebApp/Login/js/jquery.dataTables.min.js"></script>
    <script src="/WebApp/Citizen/Forms/Js/jqueryDataTableButtons-1.2.4.js"></script>

    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Login/css/bootstrap.css" rel="stylesheet" />

    <link href="/WebApp/Citizen/Forms/Css/jQueryDataTableButtons.css" rel="stylesheet" />

    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="/g2c/css/hmepge.bootstrap.css" rel="stylesheet" />


    <%--<link href="bootstrap-datetimepicker.css" rel="stylesheet" />
    <link href="bootstrap-datetimepicker.min.css" rel="stylesheet" />--%>
    <script type="text/javascript">
        $(document).ready(function () {




            $('#txtFromdate').datepicker({
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',
            });

            $('#txtTodate').datepicker({
                dateFormat: "yy-mm-dd",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',
            });
        });
    </script>
    <script type="text/javascript">
        var jsonData = {};
        // Select/Deselect checkboxes based on header checkbox
        function SelectheaderCheckboxes(header) {
            debugger
            var gvcheck = document.getElementById('gv');
            var i;
            var headerchk = document.getElementById(header);
            //Condition to check header checkbox selected or not if that is true checked all checkboxes
            if (headerchk.checked) {
                for (i = 0; i < gvcheck.rows.length; i++) {
                    var inputs = gvcheck.rows[i].getElementsByTagName('input');
                    inputs[0].checked = true;
                }
            }
            //if condition fails uncheck all checkboxes in gridview
            else {
                for (i = 0; i < gvcheck.rows.length; i++) {
                    var inputs = gvcheck.rows[i].getElementsByTagName('input');
                    inputs[0].checked = false;
                }
            }
        }
        //function to check header checkbox based on child checkboxes condition
        var jsonCol = [];
        var data = [];
        function Selectchildcheckboxes(header) {
            var ck = header;
            var count = 0;
            var gvcheck = document.getElementById('gv');
            var headerchk = document.getElementById(header);
            var rowcount = gvcheck.rows.length;

            //By using this for loop we will count how many checkboxes has checked
            for (i = 1; i < gvcheck.rows.length; i++) {
                var inputs = gvcheck.rows[i].getElementsByTagName('input');

                if (inputs[0].checked) {

                    var inTD3 = gvcheck.rows[i].getElementsByTagName("td")[4].innerText;
                    var inTD4 = gvcheck.rows[i].getElementsByTagName("td")[3].innerText;
                    var inTDTotalStudent = gvcheck.rows[i].getElementsByTagName("td")[5].innerText;
                    var inTDBankAccNo = gvcheck.rows[i].getElementsByTagName("td")[6].innerText;
                    var inTDBankAccIFFSC = gvcheck.rows[i].getElementsByTagName("td")[7].innerText;
                    var inTDAMT = gvcheck.rows[i].getElementsByTagName("td")[9].innerText;
                    var cell3 = inTD3;
                    var cell4 = inTD4;
                    var cell5 = inTDTotalStudent;
                    var cell6 = inTDBankAccNo;
                    var cell7 = inTDBankAccIFFSC;
                    var cell9 = inTDAMT;
                    var jsonData = { amtDate: cell3, userId: cell4, amt: cell9, BankAccNo: cell6, BankAccIFFSC: cell7, totalStudent: cell5 };
                    jsonCol.push(jsonData);
                    data = arrUnique(jsonCol);
                    count++;
                }
            }
            //Condition to check all the checkboxes selected or not
            if (count == rowcount - 1) {
                headerchk.checked = true;

            }
            else {
                headerchk.checked = false;
            }




            return false;



        }
        var jObjCol = [];

        function arrUnique(arr) {
            var cleaned = [];
            arr.forEach(function (itm) {
                var unique = true;
                cleaned.forEach(function (itm2) {
                    if (_.isEqual(itm, itm2)) unique = false;
                });
                if (unique) cleaned.push(itm);
            });
            return cleaned;
        }
        function GetPaymentData() {
            document.getElementById("hdPaymentData").value = JSON.stringify(data, null, 4);
        }
        function GetPayment(g) {
           /* alert(i);*/
            var i = parseInt(g + 1);
            var gvcheck = document.getElementById('gv');
            var rowcount = gvcheck.rows.length;

            var inTD3 = gvcheck.rows[i].getElementsByTagName("td")[4].innerText;
            var inTD4 = gvcheck.rows[i].getElementsByTagName("td")[3].innerText;
            var inTDTotalStudent = gvcheck.rows[i].getElementsByTagName("td")[5].innerText;
            var inTDBankAccNo = gvcheck.rows[i].getElementsByTagName("td")[6].innerText;
            var inTDBankAccIFFSC = gvcheck.rows[i].getElementsByTagName("td")[7].innerText;
            var inTDAMT = gvcheck.rows[i].getElementsByTagName("td")[9].innerText;
            var cell3 = inTD3;
            var cell4 = inTD4;
            var cell5 = inTDTotalStudent;
            var cell6 = inTDBankAccNo;
            var cell7 = inTDBankAccIFFSC;
            var cell9 = inTDAMT;
            var jsonData = { amtDate: cell3, userId: cell4, amt: cell9, BankAccNo: cell6, BankAccIFFSC: cell7, totalStudent: cell5 };
            jsonCol.push(jsonData);
            data = arrUnique(jsonCol);
            document.getElementById("hdPaymentData").value = JSON.stringify(data, null, 4);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="Static">
    <div id="page-wrapper" style="min-height: 500px !important;">

        <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Report Viewer</h2>
            </div>
        </div>
        <div class="row">

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" runat="server" id="divCollege">
                <div class="box-heading">
                    <h4 class="box-title register-num">Report Filters
                    </h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="box-container">

                        <div class="box-body box-body-open ptop20">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">

                                    <label>From Date</label>

                                    <asp:TextBox ID="txtFromdate" runat="server" ToolTip="dd/mm/yyyy" CssClass="form-control"></asp:TextBox>


                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">

                                    <label>To Date</label>

                                    <asp:TextBox ID="txtTodate" runat="server" ToolTip="dd/mm/yyyy" CssClass="form-control"></asp:TextBox>


                                </div>
                            </div>



                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">


                                    <asp:Button ID="btnHome" runat="server" CausesValidation="True" ToolTip="Home"
                                        CssClass="btn btn-success" Text="Home" ValidationGroup="G" OnClick="btnHome_Click" />

                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container">

                <div class="box-heading">

                    <h4 class="box-title">Reports Data</h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div class="table-responsive">
                            <div class="demo-container">
                                <asp:Button ID="btnExcel" runat="server" Text="Excel" OnClick="btnExcel_Click" CssClass="btn btn-success" />
                                <asp:Label ID="lblTotal" runat="server" />
                                <asp:Panel ID="pnl" runat="server"></asp:Panel>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix"></div>
                    <div class="mtop15"></div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <asp:Button ID="btnPayment" runat="server" CausesValidation="True" ToolTip="Payment"
                                CssClass="btn btn-success" Text="Payment" ValidationGroup="G" OnClientClick="GetPaymentData();" OnClick="btnPayment_Click" />



                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <asp:HiddenField ID="hdPaymentData" Value="" ClientIDMode="Static" runat="server" />
                </div>
            </div>

        </div>

    </div>
    </div>
</asp:Content>
