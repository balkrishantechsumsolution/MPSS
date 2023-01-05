<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CenterCodeWiseMPSOSView.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.CenterCodeWiseMPSOSView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
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
        $('#txtBirthdate').datepicker({
            dateFormat: "yy-mm-dd",
            changeMonth: true,
            changeYear: true,            
            yearRange: "-100:+0",
            maxDate: '0',
        });
    });
function SetValueToHidden() {
                var hiddens = document.getElementById("hfCentreCode");
                var texts = document.getElementById("txtCentreCode");
    hiddens.value = texts.value;

    var hiddensClass = document.getElementById("hfClass");
    var textsClass = document.getElementById("txtClass");
    hiddensClass.value = textsClass.value;


  

    };




</script>

<body>
    <form id="form1" runat="server">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <header>

                <div class="container-fluid whitebg myheader">

                    <div class="row tophead">
                        <div class="col-xs-12 col-sm-3 col-md-1 col-lg-1">
                            <a href="../../../Default.aspx">
                                <img src="../Images/MPSOSLogo.jpg" class="img-responsive small-view" style="width: 80px !important; text-align: left" alt="Madhya Pradesh State Open School, Bhopal" /></a>
                        </div>
                        <div class="col-xs-12 col-sm-9 col-md-5 col-lg-7">
                            <h1>MADHYA PRADESH STATE OPEN SCHOOL EDUCATION BOARD BHOPAL</h1>

                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-4 common-nav pull-right">
                            <div class="row">
                                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-3 text-right pull-right">
                                    <%--<img src="/Sambalpur/img/DigiVarsity.png" class="img-responsive small-view" style="width: 80px !important; text-align: right" alt="DigiUarsity (A complete University Module)" />--%>
                                </div>

                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>

                </div>
            </header>
            <div class="row">
                <div class="col-lg-12 cscPgehd">
                    <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Admit Card Viewer</h2>
                </div>
            </div>
            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container" runat="server" id="divCollege">
                    <div class="box-heading">
                        <h4 class="box-title register-num">Admit Card Filters
                        </h4>
                    </div>

                    <div class="box-body box-body-open">
                        <div class="box-container">

                            <div class="box-body box-body-open ptop20">
                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
                                    <div class="form-group">

                                       <label class="manadatory" for="txtCentreCode">परीक्षा केंद्र कोड</label>
                                    <asp:TextBox ID="txtCentreCode" runat="server" ToolTip="परीक्षा केंद्र कोड" onkeydown="return AllowOnlyNumeric(event);"  MaxLength="5" CssClass="form-control"></asp:TextBox>


                                    </div>
                                </div>
                                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" >
                                    <div class="form-group">

                                       <label class="manadatory" for="txtCentreCode">कक्षा</label>
                                    <asp:TextBox ID="txtClass" runat="server" ToolTip="कक्षा" onkeydown="return AllowOnlyNumeric(event);"  MaxLength="5" CssClass="form-control"></asp:TextBox>


                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip="Show Data"
                                            CssClass="btn btn-success" Text="Show Data" ValidationGroup="G" OnClick="btnSubmit_Click" OnClientClick="SetValueToHidden()"/>
                                        <asp:Button ID="btnHome" runat="server" CausesValidation="True" ToolTip="Home"
                                            CssClass="btn btn-success" Text="Home" ValidationGroup="G" OnClick="btnHome_Click"/>
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

                        <h4 class="box-title">Admit Card Data</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="table-responsive">
                                <div class="demo-container">                                   
                                   <asp:Panel ID="pnl" runat="server"></asp:Panel>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                        <div class="mtop15"></div>
                    </div>

                </div>

            </div>
        </div>
         <asp:HiddenField ID="hfCentreCode" runat="server" ClientIDMode="Static"/>
             <asp:HiddenField ID="hfClass" runat="server" ClientIDMode="Static"/>
      

    </form>
</body>
</html>
