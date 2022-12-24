<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/MPSSMaster.Master" AutoEventWireup="true" CodeBehind="CorrespondentRenewal.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.CorrespondentRenewal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <script src="../../Scripts/ServiceLanguage.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid p0" id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">

            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <%-- <div class="row">
            <div class="col-lg-12 cscPgehd">
                <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>ScholarShip Form</h2>
            </div>
        </div>--%>


            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-md-12 box-container" runat="server" id="div5">

                        <div class="box-heading form_hd">
                            <div class="box-heading form_hd">
                                <h2>Correspondent Renewal Application Form Year 2023-24</h2>

                            </div>
                        </div>

                    </div>
                    <div class="col-md-12 box-container" runat="server" id="div1">

                        <div class="box-heading form_hd">
                            <div class="box-heading form_hd">
                                <h4>Sanskrit School for LKG / UKG / Class 1-4
                                    / Praveshika / Purmadhima / Uttarmadhima class to be operated</h4>

                            </div>
                        </div>

                    </div>
                    <div class="col-lg-12">
                        <div class="alert alert-success">
                            <p><b>{{resourcesData.lblInstruction}}</b></p>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
