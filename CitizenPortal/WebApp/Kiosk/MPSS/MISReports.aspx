<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="MISReports.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.MISReports" %>

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
        .GridClass {
            width: 100%;
            font-family: tahoma;
        }

            .GridClass td /* this applies to the Gridviews Data fileds */ {
                padding: 1px;
                text-align: center;
                width: 3%;
                border: solid 1px black;
                border-collapse: collapse;
            }

            .GridClass th /* this applies to the Gridviews Headers */ {
                padding: 10px 10px;
                border-width: 1px;
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
<body>
    <form id="form1" runat="server">
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

                                    <label class="manadatory">Application ID</label>

                                  <asp:TextBox ID="txtApplicationID" runat="server"></asp:TextBox>


                                </div>
                            </div>

                               <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">

                                    <label class="manadatory">श्रमकों का पोर्टल कोड़ क्रमांक</label>

                                  <asp:TextBox ID="txtRegNo" runat="server"></asp:TextBox>


                                </div>
                            </div>
                           
                           
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip="Show Data"
                                        CssClass="btn btn-success" Text="Show Data" ValidationGroup="G" OnClick="btnSubmit_Click" />

                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="box-container">
                    <div class="box-heading">

                        <h4 class="box-title">MPSS Reports Data</h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <div class="table-responsive">
                                <div class="demo-container">
                                    <asp:Button ID="btnExcel" runat="server" Text="Excel" onclick="btnExcel_Click" CssClass="btn btn-success" />
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
    </div>


    </form>
</body>
</html>
