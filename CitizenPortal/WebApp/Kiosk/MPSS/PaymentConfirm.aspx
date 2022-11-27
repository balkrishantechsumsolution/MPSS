<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentConfirm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.PaymentConfirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-2.2.3.min.js" type="text/javascript"></script>
    <script src="../../../Sambalpur/js/bootstrap.min.js"></script>
    <script src="/Scripts/angular.min.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="../../../Sambalpur/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <script src="/PortalScripts/Wallet.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <link href="../../../Sambalpur/css/bootstrap.min.css" type="text/css"  rel="stylesheet" />
    <link href="../../../Sambalpur/css/homestyle.css" type="text/css" rel="stylesheet" />

    <link href="/WebApp/Common/Styles/StyleSheet1.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet3.css" type="text/css" rel="stylesheet" />
    <link href="/WebApp/Common/Styles/StyleSheet4.css" type="text/css" rel="stylesheet" />
     <link href="/WebApp/Common/Styles/style.admin.css" type="text/css" rel="stylesheet" />
    <link href="../../Styles/sb-admin-2.css" type="text/css" rel="stylesheet" />
    <script src="/g2c/js/jquery.liMarquee.js" type="text/javascript"></script>    
    <script src="/WebApp/Scripts/DisableBackButton.js"></script>
   
    <style type="text/css">
        .form-heading {
            text-transform: none !important;
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
            font-weight: bold;
        }
    </style>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $("#liBasic").removeClass("active");
            $("#liService").removeClass("active");
            $("#liDetails").removeClass("active");
            $("#liDoc").removeClass("active");
            $("#liPayment").addClass("active");

            $("#step1").addClass("stepfinish");
            $("#step2").addClass("stepfinish");
            $("#step3").addClass("stepfinish");
            $("#step4").addClass("stepfinish ");
            $("#step5").addClass("stepactive");
            $("#step6").addClass("active");
            $("#step7").addClass("active");

            var qs = getQueryStrings();
            var appid = qs["AppID"];
            var svcid = qs["SvcID"];

            $('#divLogin').show();
            $('#side-menu').show();
            $('#divEvent').hide();
        });

        function ValidatePage() {
        //    if ($('#rbtPGPay').is(':checked')) {
        //        var qs = getQueryStrings();
        //        var appid = qs["AppID"];
        //        var svcid = qs["SvcID"];

        //        var url = "http://localhost:53056/pg/RequestICICI.aspx?SvcID=" + svcid + "&AppID=" +appid;
        //        window.location.href = url;
        //        return true;
        //    }

            /*
            if ($("#HFUserType").val() == "CITIZEN") {
                if (!$('#rbtPGPay').is(':checked')) {

                    $("#divErr").show();
                    $("#divErr").addClass("error");
                    return false;
                }
            }
            else if ($("#HFUserType").val() == "KIOSK") {
                if (!$('#rbtSPVPay').is(':checked')) {


                    $("#divErr").show();
                    $("#divErr").addClass("error");
                    return false;
                }
            }
            */

            return true;
        }

        function getQueryStrings() {
            var assoc = {};
            var decode = function (s) { return decodeURIComponent(s.replace(/\+/g, " ")); };
            var queryString = location.search.substring(1);
            var keyValues = queryString.split('&');

            for (var i in keyValues) {
                var key = keyValues[i].split('=');
                if (key.length > 1) {
                    assoc[decode(key[0])] = decode(key[1]);
                }
            }

            return assoc;
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
               
                <%--<uc1:Infomation runat="server" ID="Infomation" />--%>
                <%---Start of Application----%>
                <div class="row">
                    <div class="col-md-12 box-container mTop15">
                        <div runat="server" class="danger error bg-warning" id="divErr">
                            Please Select Payment Type to continue                            
                        </div>
                        <div class="box-heading">
                            <h4 class="box-title register-num">Applicant's Detail
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="ddlYearTerm">
                                        Application Date:
                                    </label>
                                    <label runat="server" id="lblAppDate"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="Village">
                                        Application Number:
                                    </label>
                                    <label runat="server" id="lblAppID"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="form-group">
                                    <label class="" for="Village">
                                        Application Name:
                                    </label>
                                    <label runat="server" id="lblAppName"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="display:none">
                                <div class="form-group">
                                    <label class="" for="ddlYearTerm">
                                        Application ID:
                                    </label>
                                    
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="display:none;">
                                <div class="form-group">
                                    <label class="" for="ddlGender">
                                        Service Name:
                                    </label>
                                    <label runat="server" id="lblServiceName"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="ddlYearTerm">
                                        Amount to Pay:
                                    Rs
                                    </label>
                                    <label runat="server" id="lblTotal"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="display:none;">
                                <div class="form-group">
                                    <label class="" for="ddlYearTerm">
                                        Department Fee:
                                    </label>
                                    <label runat="server" id="lblDeptFee"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="display:none;">
                                <div class="form-group">
                                    <label class="" for="ddlGender">
                                        Government Fee:
                                    </label>
                                    <label runat="server" id="lblGovtFee"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="ddlGender">
                                        Applied By:
                                    </label>
                                    <label runat="server" id="lblCreatedBy"></label>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5 box-container mTop15" style="display:none;">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Payment Detail
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="ddlYearTerm">
                                        Department Fee:
                                    </label>
                                    
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group" style="display:none">
                                    <label class="" for="Village">
                                        Government Fee:
                                    </label>
                                    
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group" style="display:none">
                                    <label class="" for="Village">
                                        Portal Fee:
                                    </label>
                                    <label runat="server" id="lblPortalFee"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group" style="display:none">
                                    <label class="" for="ddlYearTerm">
                                        Other Charges:
                                    </label>
                                    <label runat="server" id="lblOtherCharges"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group" style="display:none">
                                    <label class="" for="ddlGender">
                                        Service Tax:
                                    </label>
                                    <label runat="server" id="lblSvcTax"></label>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                <div class="form-group">
                                    <label class="" for="ddlGender">
                                        Total Amount:
                                    </label>
                                    <label runat="server" id="lblTotal1"></label>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                </div>
                <%----END of Application-----%>

        <%---Start of Application----%>
        <div class="row" id="divPaymentOption" runat="server">
            <div class="col-md-12 box-container mTop15">
                <div class="box-heading">
                    <h4 class="box-title register-num">Payment Type
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                        <div class="form-group">
                            <label class="col-lg-4" for="rbtWalletPay" id="lblSelf"  runat="server" style="display:none">
                                <asp:RadioButton ID="rbtWalletPay" runat="server" GroupName="grpPayment" />
                                Self Wallet
                            </label>
                            <label class="col-lg-4" for="rbtSPVPay" id="lblSPV" runat="server">
                                <asp:RadioButton ID="rbtSPVPay" runat="server" GroupName="grpPayment" />CSC SPV Wallet
                            </label>
                            <label class="col-lg-4" for="rbtPGPay" id="lblPG" runat="server" >
                                <asp:RadioButton ID="rbtPGPay" runat="server" GroupName="grpPayment" />Online Payment Gateway
                            </label>
                             <label class="col-lg-4" for="rbtPGPay" id="lblSbi" runat="server" >
                                <asp:RadioButton ID="rbtSBIPay" runat="server" GroupName="grpPayment" />SBI Bank
                            </label>
                            <div class="clearfix">
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>

            <div class="col-md-5 box-container mTop15" style="display:none;">
                <div class="box-heading">
                    <h4 class="box-title register-num">Authenticate Payment
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                        <div class="form-group">
                            <label class="" for="ddlYearTerm">
                                Transaction Password
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-7">
                        <div class="form-group">
                            <asp:TextBox ID="txt_Password" runat="server" CssClass="form-control" Text="" ToolTip="Enter the password" TextMode="Password" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <%----END of Infrastructure-----%>
                <div class="row" style="display:none;">
                    <div class="col-md-12 box-container" id="divMsg" runat="server">
                        <div class="box-body box-body-open" style="text-align: center; color: maroon; padding: 10px">
                            <div style="font-size: 18px;">
                                You are requested to make payment through 
                            any <b style="font-size: 18px;">CSC centers</b> (<a href="/g2c/forms/CenterList.aspx" style="font-size: 18px;" target="_blank">CSC centers in Odisha</a>)
                            <br />
                              
                            </div>
                            <hr />
                            <div style="font-size: 18px;display:none">
                                 
                            &nbsp;<b style="font-size: 18px;">ଦେୟ ସିସସିକେନ୍ଦ୍ର</b> (<a href="/g2c/forms/CenterList.aspx" style="font-size: 18px;" target="_blank">CSC କେନ୍ଦ୍ର, ଓଡିଶା</a>) <b style="font-size: 18px;">ବା ସବିଆଇକଲେକଟ</b> (<a href="https://www.onlinesbi.com/prelogin/icollecthome.htm?corpID=792927" style="font-size: 18px;" target="_blank">SBI link</a>) ଦ୍ୱାରା ପଇଠ କରିପାରିବେ.

                            <br />
                                <b style="font-size: 18px;">ଦୟାକରି ଧ୍ୟାନ ଦିଅନ୍ତୁ : </b>ଯଦି SBI Collect ରେ ପଇଠ କରନ୍ତି, ପଇଠ କରିସାରି ପଇଠ ର ସମ୍ପୂର୍ଣ ବିବରଣୀ <b style="font-size: 18px;">www.lokaseba-odisha.in</b>
                                ରେ ଲଗଇନ କରି ପ୍ରଦାନ କରିବାକୁ ହବ| ଯଦି ସିସସି କେନ୍ଦ୍ର (CSC କେନ୍ଦ୍ର, ଓଡିଶା) ରେ ପଇଠ କରନ୍ତି ତେବେ କିଛି ବିବରଣୀ ୱେବସାଇଟରେ ଦେବାକୁ ପଡ଼ିବ ନାହିଁ |
                            </div>
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%---Start of Button----%>
                <div class="row">
                    <div class="col-md-12 box-container" id="divBtn">
                        <div class="box-body box-body-open" style="text-align: center;">
                            <asp:Button ID="btnSubmit" runat="server" CausesValidation="False" CssClass="btn btn-success" OnClientClick="return ValidatePage();"
                                 Text="Confirm Payment" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                CssClass="btn btn-danger" PostBackUrl=""
                                Text="Cancel" />
                            <asp:Button ID="btnHome" runat="server" 
                                CssClass="btn btn-primary" PostBackUrl="" ToolTip="Back to Home Page"
                                Text="Home" />
                        </div>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <%----END of Button-----%>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFServiceID" runat="server"/>
    <asp:HiddenField ID="HFUserType" runat="server" />
    <asp:HiddenField ID="HFOrderNo" runat="server" />
    <script type="text/javascript">
        $(document).ready(function (e) {
            $("#HFOrderNo").val(Math.floor((Math.random() * 100000) + 1))
        });
    </script>


    </form>
</body>
</html>
