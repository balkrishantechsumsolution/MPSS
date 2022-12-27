<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/MPSSMaster.Master" AutoEventWireup="true" CodeBehind="ScholarShip.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.ScholarShip" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

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

            

            //datePicker

            $('#ContentPlaceHolder1_txtBirthdate').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',

            });
            $('#ContentPlaceHolder1_txtDateAdmisCurrSch').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',

            });
            $('#ContentPlaceHolder1_txtDateAdmisCurrClass').datepicker({
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-100:+0",
                maxDate: '0',

            });

            var dtValDisAbility = $('#ContentPlaceHolder1_ddlDisAbility').val();
            if (dtValDisAbility == "Y") {
                $('#divDisAble').show();


            }
            else {
                $('#divDisAble').hide();

            }

            $('#ContentPlaceHolder1_ddlDisAbility').change(function () {
                var dtVal = $('#ContentPlaceHolder1_ddlDisAbility').val();
                if (dtVal == "Y") {
                    $('#divDisAble').show();


                }
                else {
                    $('#divDisAble').hide();

                }
            });

        });
        function ValidatePrincipalMobile() {
            var opt = "";
            var text = "";

            var txtPrincipalMoNo = $('#ContentPlaceHolder1_txtPrincipalMoNo').val();
            if (txtPrincipalMoNo == null || txtPrincipalMoNo == "") {
                //text += "<br />" + " \u002A" + " Please Enter Mobile No.";
                text += "<br /> -Please Enter Mobile No. ";
                $('#ContentPlaceHolder1_txtPrincipalMoNo').attr('style', 'border:1px solid #d03100 !important;');
                $('#ContentPlaceHolder1_txtPrincipalMoNo').css({ "background-color": "#fff2ee" });
                 opt = 1;  
            } else if (txtPrincipalMoNo != null) {
                $('#ContentPlaceHolder1_txtPrincipalMoNo').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtPrincipalMoNo').css({ "background-color": "#ffffff" });

                if (txtPrincipalMoNo != '' || txtPrincipalMoNo != null) {
                    var mobmatch1 = /^[6789]\d{9}$/;
                    if (!mobmatch1.test(txtPrincipalMoNo)) {
                        text += "<br />" + " \u002A" + " Please Enter Valid Mobile Number.";
                        $("#ContentPlaceHolder1_txtPrincipalMoNo").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ContentPlaceHolder1_txtPrincipalMoNo").css({ "background-color": "#fff2ee" });
                         opt = 1;                      
                    }
                }
            }
            if (opt == "1") {               
               
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;

            }
            else {
              
            }
            return true;


        }
        function ValidateMobile() {
            var opt = "";
            var text = "";


            var txtMobieNoParent = $('#ContentPlaceHolder1_txtMobieNoParent').val();
            if (txtMobieNoParent == null || txtMobieNoParent == "") {
                //text += "<br />" + " \u002A" + " Please Enter Mobile No.";
                text += "<br /> -Please Enter Mobile No. ";
                $('#ContentPlaceHolder1_txtMobieNoParent').attr('style', 'border:1px solid #d03100 !important;');
                $('#ContentPlaceHolder1_txtMobieNoParent').css({ "background-color": "#fff2ee" });
                 opt = 1; 
            } else if (txtMobieNoParent != null) {
                $('#ContentPlaceHolder1_txtMobieNoParent').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtMobieNoParent').css({ "background-color": "#ffffff" });

                if (txtMobieNoParent != '' || txtMobieNoParent != null) {
                    var mobmatch1 = /^[6789]\d{9}$/;
                    if (!mobmatch1.test(txtMobieNoParent)) {
                        text += "<br />" + " \u002A" + " Please Enter Valid Mobile Number.";
                        $("#ContentPlaceHolder1_txtMobieNoParent").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ContentPlaceHolder1_txtMobieNoParent").css({ "background-color": "#fff2ee" });
                         opt = 1;  
                    }
                }
            }
            if (opt == "1") {
                
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;
            }        
            else {
          
        }
            return true;
        }
        function SambathaCode() {

            var opt = "";
            var text = "";
            var txtSambathaCode = $('#ContentPlaceHolder1_txtSambathaCode').val();
            var samagramatch1 = /^[0123456789]\d{3}$/;

            if (!samagramatch1.test(txtSambathaCode)) {
                text += "<br />" + " \u002A" + " Please Enter Valid 4 Sambatha Code.";
                $("#ContentPlaceHolder1_txtSambathaCode").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtSambathaCode").css({ "background-color": "#fff2ee" });
                opt = 1; 
            } else {
                $('#ContentPlaceHolder1_txtSambathaCode').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtSambathaCode').css({ "background-color": "#ffffff" });
            }
            if (opt == "1") {
                
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;
            } else {
              
            }
            return true;
        }
        function DiceCode() {

            var opt = "";
            var text = "";
            var txtDiceCode = $('#ContentPlaceHolder1_txtDiceCode').val();
            var samagramatch1 = /^[0123456789]\d{10}$/;

            if (!samagramatch1.test(txtDiceCode)) {
                text += "<br />" + " \u002A" + " Please Enter Valid 11 Dice Code.";
                $("#ContentPlaceHolder1_txtDiceCode").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtDiceCode").css({ "background-color": "#fff2ee" });
                opt = 1; 
            } else {
                $('#ContentPlaceHolder1_txtDiceCode').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtDiceCode').css({ "background-color": "#ffffff" });
            }
            if (opt == "1") {
                
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;
            } else {
              
            }
            return true;
        }
         
        function SamagaraVal() {

            var opt = "";
            var text = "";
            var txtSamagraID = $('#ContentPlaceHolder1_txtSamagraID').val();
            var samagramatch1 = /^[0123456789]\d{8}$/;

            if (!samagramatch1.test(txtSamagraID)) {
                text += "<br />" + " \u002A" + " Please Enter Valid 9 digit Samagra No.";
                $("#ContentPlaceHolder1_txtSamagraID").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtSamagraID").css({ "background-color": "#fff2ee" });
                 opt = 1;  
            } else {
                $('#ContentPlaceHolder1_txtSamagraID').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtSamagraID').css({ "background-color": "#ffffff" });
            }
            if (opt == "1") {
                
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;
            } else {
              
            }
            return true;
        }
        function SamagaraFamilyVal() {

            var opt = "";
            var text = "";
            var txtFamilySamagraID = $('#ContentPlaceHolder1_txtFamilySamagraID').val();
            var samagramatch1 = /^[0123456789]\d{8}$/;

            if (!samagramatch1.test(txtFamilySamagraID)) {
                text += "<br />" + " \u002A" + " Please Enter Valid 9 digit Family Samagra No.";
                $("#ContentPlaceHolder1_txtFamilySamagraID").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtFamilySamagraID").css({ "background-color": "#fff2ee" });
                 opt = 1;  
            } else {
                $('#ContentPlaceHolder1_txtFamilySamagraID').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtFamilySamagraID').css({ "background-color": "#ffffff" });
            }
            if (opt == "1") {
                
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;
            } else {
              
            }
            return true;
        }

        function AadharVal() {

            var opt = "";
            var text = "";
            var txtAadhar = $('#ContentPlaceHolder1_txtAadhar').val();
            var samagramatch1 = /^[0123456789]\d{11}$/;

            if (!samagramatch1.test(txtAadhar)) {
                text += "<br />" + " \u002A" + " Please Enter Valid 12 digit Aadhar No.";
                $("#ContentPlaceHolder1_txtAadhar").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtAadhar").css({ "background-color": "#fff2ee" });
                 opt = 1; 
            } else {
                $('#ContentPlaceHolder1_txtAadhar').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtAadhar').css({ "background-color": "#ffffff" });
            }
            if (opt == "1") {
                
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;
            } else {
              
            }
            return true;
        }

        function ValidateDate(p_Date) {

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
                    $('#ContentPlaceHolder1_txtIssueDate').val(NewDOB);

                    return true;
                }
                else {
                    alert("Invalid date format!");
                    //document.form1.text1.focus();
                    $('#ContentPlaceHolder1_txtIssueDate').val('');
                    return false;
                }
            }
        }
        function CheckPrincipalIFSC() {
            debugger;
            var opt = "";
            var text = "";
            text = "";



            var txtPrincipalBankIFSC = $('#ContentPlaceHolder1_txtPrincipalBankIFSC');
            var reg = /[A-Z|a-z]{4}[0][a-zA-Z0-9]{6}$/;

            if (txtPrincipalBankIFSC.val() != '') {
                if (txtPrincipalBankIFSC.val().match(reg)) {
                    txtPrincipalBankIFSC.attr('style', '1px solid #cdcdcd !important;');
                    txtPrincipalBankIFSC.css({ "background-color": "#ffffff" });
                }
                else {

                    text += "\n -IFSC code should be count 11.";
                    text += "\n -Starting 4 should be only alphabets[A-Z].";
                    text += "\n -Remaining 7 should be accepting only alphanumeric.";
                    $('#ContentPlaceHolder1_txtPrincipalBankIFSC').val('');
                    txtPrincipalBankIFSC.attr('style', 'border:1px solid #d03100 !important;');
                    txtPrincipalBankIFSC.css({ "background-color": "#fff2ee" });
                     opt = 1;  
                }
            }



            if (opt == "1") {
                
                alert(text);
                //document.form1.text1.focus();
                $('#ContentPlaceHolder1_txtPrincipalBankIFSC').val('');
                return false;
            } else {
              
            }
            return true;
        }

        function CheckIFSC() {
            debugger;
            var opt = "";
            var text = "";
            text = "";



            var txtIFSC = $('#ContentPlaceHolder1_txtBankIFSCCode');
            var reg = /[A-Z|a-z]{4}[0][a-zA-Z0-9]{6}$/;

            if (txtIFSC.val() != '') {
                if (txtIFSC.val().match(reg)) {
                    txtIFSC.attr('style', '1px solid #cdcdcd !important;');
                    txtIFSC.css({ "background-color": "#ffffff" });
                }
                else {

                    text += "\n -IFSC code should be count 11.";
                    text += "\n -Starting 4 should be only alphabets[A-Z].";
                    text += "\n -Remaining 7 should be accepting only alphanumeric.";
                    $('#ContentPlaceHolder1_txtBankIFSCCode').val('');
                    txtIFSC.attr('style', 'border:1px solid #d03100 !important;');
                    txtIFSC.css({ "background-color": "#fff2ee" });
                     opt = 1;  
                }
            }



            if (opt == "1") {
                
                alert(text);
                //document.form1.text1.focus();
                $('#ContentPlaceHolder1_txtBankIFSCCode').val('');
                return false;
            } else {
              
            }
            return true;
        }
        function Validate() {
            var txtBankAccNo = $('#ContentPlaceHolder1_txtBankAccNo');
            var txtConfirmBankAccNo = $('#ContentPlaceHolder1_txtConfirmBankAccNo');

            if (txtBankAccNo.val() != txtConfirmBankAccNo.val()) {
                $("#ContentPlaceHolder1_txtBankAccNo").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtBankAccNo").css({ "background-color": "#fff2ee" });
                $("#ContentPlaceHolder1_txtConfirmBankAccNo").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtConfirmBankAccNo").css({ "background-color": "#fff2ee" });
                alert("Bank Account Number do not match.");
                return false;
            }
            else {

                $('#ContentPlaceHolder1_txtBankAccNo').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtBankAccNo').css({ "background-color": "#ffffff" });

                $('#ContentPlaceHolder1_txtConfirmBankAccNo').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtConfirmBankAccNo').css({ "background-color": "#ffffff" });
            }
            return true;
        }

        function SchoolBankValidate() {
            var txtPrincipalBankNo = $('#ContentPlaceHolder1_txtPrincipalBankNo');
            var txtPrincipalConfirmBankNo = $('#ContentPlaceHolder1_txtPrincipalConfirmBankNo');

            if (txtPrincipalBankNo.val() != txtPrincipalConfirmBankNo.val()) {
                $("#ContentPlaceHolder1_txtPrincipalBankNo").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtPrincipalBankNo").css({ "background-color": "#fff2ee" });
                $("#txtPrincipalConfirmBankNo").attr('style', 'border:1px solid #d03100 !important;');
                $("#txtPrincipalConfirmBankNo").css({ "background-color": "#fff2ee" });
                alert("Bank Account Number do not match.");
                return false;
            }
            else {

                $('#ContentPlaceHolder1_txtPrincipalBankNo').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtPrincipalBankNo').css({ "background-color": "#ffffff" });

                $('#txtPrincipalConfirmBankNo').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#txtPrincipalConfirmBankNo').css({ "background-color": "#ffffff" });
            }
            return true;
        }
        function CheckError() {

            var opt = "";
            var text = "";

            var txtFamilySamagraID = $('#ContentPlaceHolder1_txtFamilySamagraID').val();
            var Fsamagramatch1 = /^[0123456789]\d{8}$/;

            if (!Fsamagramatch1.test(txtFamilySamagraID)) {
                text += "<br />" + " \u002A" + " Please Enter Valid 9 digit Family Samagra No.";
                $("#ContentPlaceHolder1_txtFamilySamagraID").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtFamilySamagraID").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ContentPlaceHolder1_txtFamilySamagraID').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtFamilySamagraID').css({ "background-color": "#ffffff" });
            }

            var txtSamagraID = $('#ContentPlaceHolder1_txtSamagraID').val();
            var samagramatch1 = /^[0123456789]\d{8}$/;

            if (!samagramatch1.test(txtSamagraID)) {
                text += "<br />" + " \u002A" + " Please Enter Valid 9 digit Samagra No.";
                $("#ContentPlaceHolder1_txtSamagraID").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtSamagraID").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ContentPlaceHolder1_txtSamagraID').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtSamagraID').css({ "background-color": "#ffffff" });
            }

            var txtAadhar = $('#ContentPlaceHolder1_txtAadhar').val();
            var Aadharmatch1 = /^[0123456789]\d{11}$/;

            if (!Aadharmatch1.test(txtAadhar)) {
                text += "<br />" + " \u002A" + " Please Enter Valid 12 digit Aadhar No.";
                $("#ContentPlaceHolder1_txtAadhar").attr('style', 'border:1px solid #d03100 !important;');
                $("#ContentPlaceHolder1_txtAadhar").css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ContentPlaceHolder1_txtAadhar').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtAadhar').css({ "background-color": "#ffffff" });
            }





            var txtPrincipalBankIFSC = $('#ContentPlaceHolder1_txtPrincipalBankIFSC');
            var reg = /[A-Z|a-z]{4}[0][a-zA-Z0-9]{6}$/;

            if (txtPrincipalBankIFSC.val() != '') {
                if (txtPrincipalBankIFSC.val().match(reg)) {
                    txtPrincipalBankIFSC.attr('style', '1px solid #cdcdcd !important;');
                    txtPrincipalBankIFSC.css({ "background-color": "#ffffff" });
                }
                else {

                    text += "\n -IFSC code should be count 11.";
                    text += "\n -Starting 4 should be only alphabets[A-Z].";
                    text += "\n -Remaining 7 should be accepting only alphanumeric.";
                    $('#ContentPlaceHolder1_txtPrincipalBankIFSC').val('');
                    txtPrincipalBankIFSC.attr('style', 'border:1px solid #d03100 !important;');
                    txtPrincipalBankIFSC.css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
            }



            var txtIFSC = $('#ContentPlaceHolder1_txtBankIFSCCode');
            var IFSCreg = /[A-Z|a-z]{4}[0][a-zA-Z0-9]{6}$/;

            if (txtIFSC.val() != '') {
                if (txtIFSC.val().match(IFSCreg)) {
                    txtIFSC.attr('style', '1px solid #cdcdcd !important;');
                    txtIFSC.css({ "background-color": "#ffffff" });
                }
                else {

                    text += "\n -IFSC code should be count 11.";
                    text += "\n -Starting 4 should be only alphabets[A-Z].";
                    text += "\n -Remaining 7 should be accepting only alphanumeric.";
                    $('#ContentPlaceHolder1_txtBankIFSCCode').val('');
                    txtIFSC.attr('style', 'border:1px solid #d03100 !important;');
                    txtIFSC.css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
            }

            var txtPrincipalMoNo = $('#ContentPlaceHolder1_txtPrincipalMoNo').val();
            if (txtPrincipalMoNo == null || txtPrincipalMoNo == "") {
                //text += "<br />" + " \u002A" + " Please Enter Mobile No.";
                text += "<br /> -Please Enter Mobile No. ";
                $('#ContentPlaceHolder1_txtPrincipalMoNo').attr('style', 'border:1px solid #d03100 !important;');
                $('#ContentPlaceHolder1_txtPrincipalMoNo').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else if (txtPrincipalMoNo != null) {
                $('#ContentPlaceHolder1_txtPrincipalMoNo').attr('style', 'border:1px solid #cdcdcd !important;');
                $('#ContentPlaceHolder1_txtPrincipalMoNo').css({ "background-color": "#ffffff" });

                if (txtPrincipalMoNo != '' || txtPrincipalMoNo != null) {
                    var mobmatch1 = /^[6789]\d{9}$/;
                    if (!mobmatch1.test(txtPrincipalMoNo)) {
                        text += "<br />" + " \u002A" + " Please Enter Valid Mobile Number.";
                        $("#ContentPlaceHolder1_txtPrincipalMoNo").attr('style', 'border:1px solid #d03100 !important;');
                        $("#ContentPlaceHolder1_txtPrincipalMoNo").css({ "background-color": "#fff2ee" });
                        opt = 1;
                    }
                }
            }
            if (opt == "1") {               
                //alert("Please fill following information."+text);              
                alertPopup("Please fill following information.", text);
                return false;

            }
            return true;
        }

    </script>
    <style>
        .panel-body {
            padding: 15px;
        }

        fieldset {
            padding: 10px;
            border: 1px solid #37495f;
            border-radius: 5px;
        }

        legend {
            display: block;
            width: auto;
            padding: 0;
            margin-bottom: 10px;
            font-size: 16px;
            line-height: inherit;
            color: #ff7124;
            border: 0;
            border-bottom: none;
            font-weight: bold;
            padding: 0px 10px;
        }

        #ContentPlaceHolder1_ddlStudenID_ddlStudenID_TextBox {
            background-color: #ADD8E6;
            border: solid 1px Blue;
            border-right: 0px none;
            width: 100% !important;
            height: 33px !important;
        }

        .ContentPlaceHolder1_ddlStudenID_ddlStudenID_Button {
            background-color: #ADD8E6;
            border: solid 1px Blue;
        }

        /*  .CustomComboBoxStyle .ajax__combobox_textboxcontainer input {
    background-color: #ADD8E6;
    border: solid 1px Blue;
    border-right: 0px none;
}*/


        .ajax__combobox_buttoncontainer button {
            width: 15px !important;
            height: 20px !important;
        }

        .ajax__combobox_itemlist {
            position: relative !important;
            left: 0px !important;
            top: 3px !important;
            width: 175px !important;
            height: 150px !important;
        }
    </style>
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
                                <h2>{{resourcesData.lblScName}}</h2>

                            </div>
                        </div>

                    </div>
                    <div class="col-lg-12">
                        <div class="alert alert-success">
                            <p><b>{{resourcesData.lblInstruction}}</b></p>

                        </div>
                    </div>
                </div>





                <div class="box-body box-body-open">


                    <div id="smartwizard">
                        <ul>
                            <li  class="done active"><a href="#step-1">Step 1<br />
                                <small id="lblsearch">{{resourcesData.lblScStDtls}}</small></a></li>
                            <li  class="done active"><a href="#step-2">Step 2<br />
                                <small>{{resourcesData.lblStApplicantAddress}}</small></a></li>
                            <li  class="done active"><a href="#step-3">Step 3<br />
                                <small>{{resourcesData.lblScStInform}}</small></a></li>
                            <li  class="done active"><a href="#step-4">Step 4<br />
                                <small>{{resourcesData.lblScStInformation}}</small></a></li>
                            <li class="done active"><a href="#step-5">Step 5<br />
                                <small>{{resourcesData.lblScStBankDetails}}</small></a></li>
                             <li class="done active"><a href="#step-6">Step 6<br />
                                <small>{{resourcesData.lblAttach}}</small></a></li>

                        </ul>
                        <div class="mt-4">
                            <div id="step-1">
                                <div class="row">
                                    <fieldset id="divStudentInnfo" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblScStDtls}}</legend>
                                        <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 box-container row">
                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">

                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblStSamagraID}}</label>
                                                    <%--<asp:DropDownList ID="ddlStudenID" runat="server" CssClass="form-control">
                            </asp:DropDownList>--%>



                                                    <asp:TextBox ID="txtSamagraID" onChange="SamagaraVal();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="9"></asp:TextBox>

                                                    <%-- <ajaxToolkit:ComboBox ID="ddlStudenID" runat="server"
                                                        AutoPostBack="true"
                                                        DropDownStyle="DropDownList"
                                                        AutoCompleteMode="SuggestAppend"
                                                        CaseSensitive="False"
                                                        CssClass=""
                                                        ItemInsertLocation="Append" OnSelectedIndexChanged="ddlStudenID_SelectedIndexChanged" />--%>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtSamagraID" Display="Dynamic"
                                                            ErrorMessage="Please enter Samagra No" ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">

                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblFamilySamagra}}</label>
                                                    <asp:TextBox ID="txtFamilySamagraID" onChange="SamagaraFamilyVal();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="9"></asp:TextBox>


                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtFamilySamagraID" Display="Dynamic"
                                                            ErrorMessage="Please enter Family SamagraID No" ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.aadhaar}}</label>
                                                    <asp:TextBox ID="txtAadhar" onChange="AadharVal();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="12"></asp:TextBox>


                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtAadhar" Display="Dynamic"
                                                            ErrorMessage="Please enter Aadhar No" ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStName}}</label>
                                                    <asp:TextBox ID="txtStudentName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtStudentName" Display="Dynamic"
                                                            ErrorMessage="Please enter Student name in English" ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStNameHindi}}</label>
                                                    <asp:TextBox ID="txtStudentHindiName" CssClass="form-control" runat="server" MaxLength="100"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ControlToValidate="txtStudentHindiName" Display="Dynamic"
                                                            ErrorMessage="Please enter Student Name in Hindi" ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblStGender}}</label>
                                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    </asp:DropDownList>


                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlGender" InitialValue="0" Display="Dynamic"
                                                            ErrorMessage="Please select Gender." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblStDOB}}</label>
                                                    <asp:TextBox ID="txtBirthdate" CssClass="form-control" runat="server" MaxLength="10" placeholder="dd/MM/YYYY" onkeypress="return ValidateAlpha(event);"
                                                        onkeydown=" return allowBackspace(event);" onchange="CalculateExperiance();">
                                                    </asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBirthdate" InitialValue="" Display="Dynamic"
                                                            ErrorMessage="Please select Birth Date." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStClass}}</label>
                                                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    </asp:DropDownList>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlClass" Display="Dynamic"
                                                            ErrorMessage="Please Enter Class" ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="clearfix"></div>


                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStSection}} </label>

                                                    <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                        <asp:ListItem Value="8">8</asp:ListItem>
                                                    </asp:DropDownList>

                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddlSection" Display="Dynamic"
                                                            ErrorMessage="Please College Section." ValidationGroup="G" ForeColor="Red" />
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStSchool}}</label>
                                                    <asp:TextBox ID="txtSchool" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="School"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSchool" Display="Dynamic"
                                                            ErrorMessage="Please Enter School." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStSubject}}</label>
                                                    <asp:TextBox ID="txtSubject" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);" placeholder="Subject"></asp:TextBox>
                                                    <div class="col-xs-12 pleft0 p5">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSubject" Display="Dynamic"
                                                            ErrorMessage="Please Enter Subject." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="clearfix"></div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStFather}}</label>
                                                    <asp:TextBox ID="txtFatherName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="txtFatherName" Display="Dynamic"
                                                            ErrorMessage="Please enter Father's Name." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStFatherOcc}}</label>
                                                    <asp:TextBox ID="txtFatherOcc" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="txtFatherOcc" Display="Dynamic"
                                                            ErrorMessage="Please enter Father's Occupation." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12  col-sm-8 col-md-8 col-lg-3">
                                                <label>
                                                    {{resourcesData.lblScStFatherDead}}
                                        
                                                </label>

                                                <asp:CheckBox ID="IsFatherDead" runat="server" />

                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label class="manadatory">{{resourcesData.lblScStMother}}</label>
                                                    <asp:TextBox ID="txtMotherName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <div class="col-xs-12 pleft0">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="txtMotherName" Display="Dynamic"
                                                            ErrorMessage="Please enter Mother's Name." ValidationGroup="G" ForeColor="Red" />
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                                <div class="form-group">
                                                    <label>{{resourcesData.lblScStMotherOcc}}</label>
                                                    <asp:TextBox ID="txtMotherOcc" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                    <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtMotherOcc" Display="Dynamic"
                                    ErrorMessage="Please enter Mother's Occupation." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                                </div>
                                            </div>

                                               <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                {{resourcesData.lblPassExam}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbnpass1" runat="server" Text="Yes" GroupName="pass" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                            <asp:RadioButton ID="rbnpass2" runat="server" Text="No" GroupName="pass" Checked="true" />
                                        </div>
                                    </div>
                                            <div class="clearfix"></div>
                                        </div>


                                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 pleft0 pright0">
                                            <div id="divPhoto" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory">{{resourcesData.lblStUpload}}
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/photo.png" name="ProfilePhoto" Style="height: 180px" ID="myImg" />
                                                        <input class="camera" id="File1" name="Photoupload" type="file" runat="server" />
                                                        <asp:Button ID="btnPhoto" type="submit" Text="Upload" runat="server" OnClick="btnPhoto_Click"></asp:Button>
                                                        <asp:Panel ID="frmConfirmationPhoto" Visible="False" runat="server">
                                                            <asp:Label ID="lblUploadResultPhoto" runat="server"></asp:Label>
                                                        </asp:Panel>

                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div id="divTC" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory">{{resourcesData.lblStTCUpload}}
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        {{resourcesData.lblStTCUpload}}                                        
                                                        <asp:Image runat="server" class="form-control" name="ProfilePhoto" ID="ImageTC" src="/webApp/kiosk/Images/tc.bmp" Style="height: 100px" />
                                                        <input id="oFile" type="file" runat="server" name="oFile" />
                                                        <asp:Button ID="btnUpload" type="submit" Text="Upload" runat="server" OnClick="btnUpload_Click"></asp:Button>
                                                        <asp:Panel ID="frmConfirmation" Visible="False" runat="server">
                                                            <asp:Label ID="lblUploadResult" runat="server"></asp:Label>
                                                        </asp:Panel>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <div class="clearfix"></div>
                                </div>
                                <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>
                            </div>
                            <div id="step-2">
                                <fieldset>
                                    <legend>&nbsp {{resourcesData.lblStApplicantAddress}}</legend>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblStHouseNo}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtHouse" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ControlToValidate="txtHouse" Display="Dynamic"
                                                    ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblStColony}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtColony" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtColony" Display="Dynamic"
                                                    ErrorMessage="Please enter Colony." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblStCity}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtCity" runat="server" ToolTip="City" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtCity" Display="Dynamic"
                                                    ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblStBlock}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtBlock" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ControlToValidate="txtBlock" Display="Dynamic"
                                                    ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlDistrict">
                                                {{resourcesData.lblStDistrict}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtDistrict" runat="server" ToolTip="District" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtDistrict" Display="Dynamic"
                                                    ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                {{resourcesData.lblStPinCode}}
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" ControlToValidate="txtPinCode" Display="Dynamic"
                                                    ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                </fieldset>

                                <br />

                                <div class="clearfix"></div>
                                <%---Start of Button----%>
                            </div>
                            <div id="step-3">
                                <fieldset id="divStudentIfo" style="width: 100%; margin-bottom: 15px;">
                                    <legend>&nbsp {{resourcesData.lblScStInform}}</legend>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblScStFIncome}}</label>
                                            <asp:TextBox ID="txtFamiyIncome" CssClass="form-control" runat="server" MaxLength="8" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFamiyIncome" Display="Dynamic"
                                                    ErrorMessage="Please enter Family Income." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblScStCaste}}</label>
                                            <asp:DropDownList ID="ddlCaste" runat="server" CssClass="form-control">
                                                <%-- <asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                            </asp:DropDownList>
                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlCaste" InitialValue="0" Display="Dynamic"
                                                    ErrorMessage="Please select Category." ValidationGroup="G" ForeColor="Red" />

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStSubCaste}}</label>
                                            <asp:TextBox ID="txtSubCaste" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                            <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtSubCaste" Display="Dynamic"
                                    ErrorMessage="Please enter Sub Cast." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStDigitalCasteNo}}</label>
                                            <asp:TextBox ID="txtDigitalCasteNo" CssClass="form-control" runat="server"></asp:TextBox>

                                            <%--   <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtDigitalCasteNo" Display="Dynamic"
                                    ErrorMessage="Please enter Digital Caste Cetrtificate Number." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblScStReligion}}</label>
                                            <asp:DropDownList ID="ddlReligion" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="1">Hindu</asp:ListItem>
                                                <asp:ListItem Value="2">Muslim</asp:ListItem>
                                                <asp:ListItem Value="3">Sikh</asp:ListItem>
                                                <asp:ListItem Value="4">Christian</asp:ListItem>
                                                <asp:ListItem Value="999 Private">Traditional Private</asp:ListItem>
                                            </asp:DropDownList>


                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlReligion" Display="Dynamic"
                                                    ErrorMessage="Please enter Regilion." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStNative}}</label>
                                            <asp:CheckBox ID="IsMPOrigin" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="IsMPOriginY" runat="server" Text="Yes" GroupName="IsMPOrigin" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="IsMPOriginN" runat="server" Text="No" GroupName="IsMPOrigin" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                     <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblStHostelName}}</label>
                                            <asp:TextBox ID="txtHostelName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3" style="display:none;">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblStCurrSchCls}}</label>
                                            <asp:TextBox ID="txtSchoolEntryCls" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                   
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblStCurrSchCls}} </label>
                                             <asp:DropDownList ID="ddlCuurentSchoolName" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblDiceCode}}</label>
                                            <asp:TextBox ID="txtDiceCode" onChange="DiceCode();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="11"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                      <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblSambathaCode}}</label>
                                            <asp:TextBox ID="txtSambathaCode" onChange="SambathaCode();" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" MaxLength="4"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblStudyClass}} </label>
                                            <asp:DropDownList ID="ddlCuurentClass" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblPreStudyClass}}  </label>
                                            <asp:DropDownList ID="ddlPreviousClass" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                      <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblAllSub}} </label>
                                            <%--  <asp:TextBox ID="txtAllSubject" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>--%>

                                            <asp:DropDownList ID="ddlAllSubject" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                            </asp:DropDownList>
                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>


                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblPreAllSub}} </label>
                                            <%--<asp:TextBox ID="txtPreAllSubject" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>--%>
                                            <asp:DropDownList ID="ddlPreAllSubject" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="7" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="8" Value="8"></asp:ListItem>
                                            </asp:DropDownList>


                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                   
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3" style="display: none;">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblDetached}} </label>
                                            <asp:TextBox ID="txtDetached" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3" style="display:none;">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblDetachedPercentage}}</label>
                                            <asp:TextBox ID="txtDetachedPer" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblDetachedPercentageEqp}}</label>
                                            <asp:TextBox ID="txtDetachedPerEqp" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblDetachedPercentageEscort}}</label>
                                            <asp:TextBox ID="txtDetachedPerEscort" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStExamBoardName}}</label>
                                            <asp:TextBox ID="txtExamBoardName" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStMonthlyFee}}</label>
                                            <asp:TextBox ID="txtMonthlyFee" CssClass="form-control" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                            <%--   <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtMonthlyFee" Display="Dynamic"
                                    ErrorMessage="Please enter MonthlyFee." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>


                                    

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblScStDateAdmisCurrSch}}</label>
                                            <asp:TextBox ID="txtDateAdmisCurrSch" CssClass="form-control" runat="server"></asp:TextBox>

                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtDateAdmisCurrSch" Display="Dynamic"
                                                    ErrorMessage="Please enter Date of admission in current school." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblScStDateAdmisCurrClass}}</label>
                                            <asp:TextBox ID="txtDateAdmisCurrClass" CssClass="form-control" runat="server"></asp:TextBox>

                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ControlToValidate="txtDateAdmisCurrClass" Display="Dynamic"
                                                    ErrorMessage="Please enter Date of Admission to class (DD/MM/YYYY)." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblScStNoOfSibling}}</label>
                                            <asp:TextBox ID="txtNoOfSibling" CssClass="form-control" runat="server" MaxLength="2" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ControlToValidate="txtNoOfSibling" Display="Dynamic"
                                                    ErrorMessage="Please enter How many brothers/sisters." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblScStAdmissionNo}}</label>
                                            <asp:TextBox ID="txtAdmissionNo" CssClass="form-control" runat="server"></asp:TextBox>

                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ControlToValidate="txtAdmissionNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Student's School admission number." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                     
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStCurrentCls}}</label>
                                            <asp:TextBox ID="txtCurrentCls" CssClass="form-control" runat="server"></asp:TextBox>

                                            <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ControlToValidate="txtCurrentCls" Display="Dynamic"
                                    ErrorMessage="Please enter Current Class." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStLastCls}}</label>
                                            <asp:TextBox ID="txtLastCls" CssClass="form-control" runat="server"></asp:TextBox>

                                            <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ControlToValidate="txtLastCls" Display="Dynamic"
                                    ErrorMessage="Please enter Last year's class." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStPreAttDays}}</label>
                                            <asp:TextBox ID="txtPreAttDays" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox>

                                            <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ControlToValidate="txtPreAttDays" Display="Dynamic"
                                    ErrorMessage="Please enter Student's attendance day in the previous year." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblScStMediums}}</label>
                                            <asp:DropDownList ID="ddlMedium" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="S">Sanskrit</asp:ListItem>
                                                <asp:ListItem Value="H">Hindi</asp:ListItem>
                                                <asp:ListItem Value="E">English</asp:ListItem>
                                            </asp:DropDownList>

                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ControlToValidate="ddlMedium" Display="Dynamic"
                                                    ErrorMessage="Please enter Student's medium of instruction." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                     <div class="clearfix"></div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory" for="FatherName">{{resourcesData.lblScStDisability}} </label>
                                            <asp:DropDownList ID="ddlDisAbility" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                <asp:ListItem Value="N">No</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ControlToValidate="ddlDisAbility" InitialValue="0" Display="Dynamic"
                                                ErrorMessage="Please select Disability." ValidationGroup="G" ForeColor="Red" />
                                        </div>
                                    </div>
                                    <div id="divDisAble" style="display: none;">
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="FatherName">{{resourcesData.lblDisavbiType}}  </label>
                                                <asp:DropDownList ID="ddlDisAbilityType" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="V">दृष्टिबाधित</asp:ListItem>
                                                    <asp:ListItem Value="O">अस्थिबाधित</asp:ListItem>
                                                    <asp:ListItem Value="H">श्रवणबाधित</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblDetachedPercentage}}</label>
                                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>

                                                <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtExamBoardName" Display="Dynamic"
                                    ErrorMessage="Please enter Exam Board Name." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStEquipDisability}}</label>
                                                <asp:TextBox ID="txtEquipDisability" CssClass="form-control" runat="server"></asp:TextBox>


                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStFreeUniform}}</label>
                                                <asp:TextBox ID="txtFreeUniform" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" ControlToValidate="txtFreeUniform" Display="Dynamic"
                                    ErrorMessage="Please enter FreeUniform." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>


                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStYrLastExam}}</label>
                                                <asp:TextBox ID="txtYrLastExam" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator49" runat="server" ControlToValidate="txtYrLastExam" Display="Dynamic"
                                    ErrorMessage="Please enter Year of last class exam." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>

                                     <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStLastAnnualResult}}</label>
                                                <asp:TextBox ID="txtLastAnnualResult" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator50" runat="server" ControlToValidate="txtLastAnnualResult" Display="Dynamic"
                                    ErrorMessage="Please enter last annual result." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStPassPercentage}}</label>
                                                <asp:TextBox ID="txtPassPercentage" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="txtPassPercentage" Display="Dynamic"
                                    ErrorMessage="Please enter Pass Percentage." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                     <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStStudentStatus}}</label>
                                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                     <asp:ListItem Value="P">Pass</asp:ListItem>
                                                    <asp:ListItem Value="F">Fail</asp:ListItem>
                                                </asp:DropDownList>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ControlToValidate="ddlStatus" Display="Dynamic"
                                                        ErrorMessage="Please enter StudentStatus." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStLastClsInt}}</label>
                                                <asp:TextBox ID="txtLastClsInt" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="txtLastClsInt" Display="Dynamic"
                                    ErrorMessage="Please enter Name of last class institution." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                       
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStCodeFacultySt}}</label>
                                                <asp:TextBox ID="txtCodeFacultySt" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator54" runat="server" ControlToValidate="txtCodeFacultySt" Display="Dynamic"
                                    ErrorMessage="Please enter >Code of Faculty/Stream." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>


                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStCodeTradeVocationalPrg}}</label>
                                                <asp:TextBox ID="txtCodeTradeVocationalPrg" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ControlToValidate="txtCodeTradeVocationalPrg" Display="Dynamic"
                                    ErrorMessage="Please enter Code of trade taken by the student in vocational education." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStTypeJobRoleVocationalPrg}}</label>
                                                <asp:TextBox ID="txtTypeJobRoleVocationalPrg" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator57" runat="server" ControlToValidate="txtTypeJobRoleVocationalPrg" Display="Dynamic"
                                    ErrorMessage="Please enter What type of job roles are expected in vocational education." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStLvlNSFQ}}</label>
                                                <asp:TextBox ID="txtLvlNSFQ" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator58" runat="server" ControlToValidate="txtLvlNSFQ" Display="Dynamic"
                                    ErrorMessage="Please enter >Which level of NSFQ has been completed by the student?." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStObjVocationalPrg}}</label>
                                                <asp:TextBox ID="txtObjVocationalPrg" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--<div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtObjVocationalPrg" Display="Dynamic"
                                    ErrorMessage="Please enter Objectives of student to take vocational education." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStJobStaus}}</label>
                                                <asp:TextBox ID="txtJobStaus" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtJobStaus" Display="Dynamic"
                                    ErrorMessage="Please enter Job / Placement Status." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStJobSalary}}</label>
                                                <asp:TextBox ID="txtJobSalary" CssClass="form-control" runat="server" onkeypress="return isNumberKey(event)"></asp:TextBox>

                                                <%-- <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtJobSalary" Display="Dynamic"
                                    ErrorMessage="Please enter JobSalary." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory">{{resourcesData.lblScStMobieNoParent}}</label>
                                                <asp:TextBox ID="txtMobieNoParent" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidateMobile();" MaxLength="10"></asp:TextBox>

                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtMobieNoParent" Display="Dynamic"
                                                        ErrorMessage="Please enter MobieNo Parent." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                    <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                            <div class="form-group">
                                                <label>{{resourcesData.lblScStLadliLaxmiNo}}</label>
                                                <asp:TextBox ID="txtLadliLaxmiNo" CssClass="form-control" runat="server"></asp:TextBox>

                                                <%--  <div class="col-xs-12 pleft0">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtLadliLaxmiNo" Display="Dynamic"
                                    ErrorMessage="Please enter Ladli Laxmi No." ValidationGroup="G" ForeColor="Red" />
                            </div>--%>
                                            </div>
                                        </div>
                                </fieldset>
                                <div class="clearfix"></div>
                                <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>
                            </div>
                            <div id="step-4">
                                <fieldset id="divStudentOther" style="width: 100%; margin-bottom: 15px;">
                                    <legend>&nbsp {{resourcesData.lblScStInformation}}</legend>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStParentIcomeTaxPayer}}</label>
                                            <asp:CheckBox ID="IsParentIcomeTaxPayer" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton29" runat="server" Text="Yes" GroupName="IsParentIcomeTaxPayer" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton30" runat="server" Text="No" GroupName="IsParentIcomeTaxPayer" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsAnyHaveScholarShip}}</label>
                                            <asp:CheckBox ID="IsAnyHaveScholarShip" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton27" runat="server" Text="Yes" GroupName="IsAnyHaveScholarShip" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton28" runat="server" Text="No" GroupName="IsAnyHaveScholarShip" />
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsHosteller}}</label>
                                            <asp:CheckBox ID="IsHosteller" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton25" runat="server" Text="Yes" GroupName="IsHosteller" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton26" runat="server" Text="No" GroupName="IsHosteller" />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsFamilyBPL}}</label>
                                            <asp:CheckBox ID="IsFamilyBPL" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="IsFamilyBPLY" runat="server" Text="Yes" GroupName="IsFamilyBPL" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="IsFamilyBPLN" runat="server" Text="No" GroupName="IsFamilyBPL" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsDisadvantagedgroup}}</label>
                                            <asp:CheckBox ID="IsDisadvantagedgroup" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton1" runat="server" Text="Yes" GroupName="IsDisadvantagedgroup" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton2" runat="server" Text="No" GroupName="IsDisadvantagedgroup" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsRTE}}</label>
                                            <asp:CheckBox ID="IsRTE" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton3" runat="server" Text="Yes" GroupName="IsRTE" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton4" runat="server" Text="No" GroupName="IsRTE" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsClsFirstEnrollStatus}}</label>
                                            <asp:CheckBox ID="IsClsFirstEnrollStatus" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton5" runat="server" Text="Yes" GroupName="IsClsFirstEnrollStatus" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton6" runat="server" Text="No" GroupName="IsClsFirstEnrollStatus" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsDGSCaste}}</label>
                                            <asp:CheckBox ID="IsDGSCaste" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton7" runat="server" Text="Yes" GroupName="IsDGSCaste" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton8" runat="server" Text="No" GroupName="IsDGSCaste" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsFreeTextbooks}}</label>
                                            <asp:CheckBox ID="IsFreeTextbooks" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton9" runat="server" Text="Yes" GroupName="IsFreeTextbooks" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton10" runat="server" Text="No" GroupName="IsFreeTextbooks" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsFreeTransport}}</label>
                                            <asp:CheckBox ID="IsFreeTransport" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton11" runat="server" Text="Yes" GroupName="IsFreeTransport" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton12" runat="server" Text="No" GroupName="IsFreeTransport" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScSIsFreeEscortDis}}</label>


                                            <asp:CheckBox ID="IsFreeEscortDis" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton13" runat="server" Text="Yes" GroupName="IsFreeEscortDis" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton14" runat="server" Text="No" GroupName="IsFreeEscortDis" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStFreeBicycle}}</label>
                                            <asp:CheckBox ID="FreeBicycle" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton15" runat="server" Text="Yes" GroupName="FreeBicycle" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton16" runat="server" Text="No" GroupName="FreeBicycle" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsResidingHostel}}</label>
                                            <asp:CheckBox ID="IsResidingHostel" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton17" runat="server" Text="Yes" GroupName="IsResidingHostel" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton18" runat="server" Text="No" GroupName="IsResidingHostel" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsRecSpecialTraining}}</label>
                                            <asp:CheckBox ID="IsRecSpecialTraining" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton19" runat="server" Text="Yes" GroupName="IsRecSpecialTraining" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton20" runat="server" Text="No" GroupName="IsRecSpecialTraining" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIshomeless}}</label>
                                            <asp:CheckBox ID="Ishomeless" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton21" runat="server" Text="Yes" GroupName="Ishomeless" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton22" runat="server" Text="No" GroupName="Ishomeless" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="clearfix"></div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStIsRegVocationalPrg}}</label>
                                            <asp:CheckBox ID="IsRegVocationalPrg" runat="server" Style="display: none;" />
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton23" runat="server" Text="Yes" GroupName="IsRegVocationalPrg" />

                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                                <div class="form-group">
                                                    <asp:RadioButton ID="RadioButton24" runat="server" Text="No" GroupName="IsRegVocationalPrg" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </fieldset>
                                <%--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>

                                <div class="clearfix"></div>
                            </div>
                            <div id="step-5">
                                <fieldset>
                                    <legend>&nbsp {{resourcesData.lblScStBankInfo}}</legend>
                                    <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblBankName}}</label>
                                            <asp:TextBox ID="txtStudentBankName" CssClass="form-control" runat="server" MaxLength="200" placeholder="Bank Name"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ControlToValidate="txtStudentBankName" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank Name." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStBankAccount}}</label>
                                            <asp:TextBox ID="txtBankAccNo" CssClass="form-control" runat="server" MaxLength="20" onkeydown="return AllowOnlyNumeric(event);" placeholder="Bank Account No" onchange="Validate();"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtBankAccNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStCBankAccount}}</label>
                                            <%--<label >Weight of Child(kg)</label>--%>
                                            <asp:TextBox ID="txtConfirmBankAccNo" CssClass="form-control" runat="server" placeholder="Confirm Bank Account No." MaxLength="20" onkeydown="return AllowOnlyNumeric(event);" onchange="Validate();"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="txtConfirmBankAccNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStCBankIFSC}}</label>
                                            <%--<label >Weight of Child(kg)</label>--%>
                                            <asp:TextBox ID="txtBankIFSCCode" CssClass="form-control" runat="server" MaxLength="11" placeholder="Bank IFSC Code" onchange="CheckIFSC();"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtBankIFSCCode" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank IFSC Code." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblParentMobileNo}}</label>
                                            <asp:TextBox ID="txtUserMoNo" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidateMobile();" MaxLength="10"></asp:TextBox>

                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ControlToValidate="txtUserMoNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Mobile No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <br />
                                <fieldset>
                                    <legend>&nbsp {{resourcesData.lblSchoolBankInfo}}</legend>
                                    <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScBankAccActive}}</label>
                                            <asp:TextBox ID="txtScActive" CssClass="form-control" runat="server" MaxLength="200" placeholder="School Name in Which Account is Active"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtScActive" Display="Dynamic"
                                                    ErrorMessage="Please enter School Name in Which Account is Active." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblBankName}}</label>
                                            <asp:TextBox ID="txtScBankName" CssClass="form-control" runat="server" MaxLength="200" placeholder="Bank Name"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="txtScBankName" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank Name." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStBankAccount}}</label>
                                            <asp:TextBox ID="txtPrincipalBankNo" CssClass="form-control" runat="server" MaxLength="20" onkeydown="return AllowOnlyNumeric(event);" placeholder="Bank Account No" onchange="SchoolBankValidate();"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtBankAccNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStCBankAccount}}</label>
                                            <%--<label >Weight of Child(kg)</label>--%>
                                            <asp:TextBox ID="txtPrincipalConfirmBankNo" CssClass="form-control" runat="server" placeholder="Confirm Bank Account No." MaxLength="20" onkeydown="return AllowOnlyNumeric(event);" onchange="SchoolBankValidate();"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtConfirmBankAccNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank Account No." ValidationGroup="G" ForeColor="Red" />
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-xs-12  col-sm-4 col-md-4 col-lg-4">
                                        <div class="form-group">
                                            <label>{{resourcesData.lblScStCBankIFSC}}</label>
                                            <%--<label >Weight of Child(kg)</label>--%>
                                            <asp:TextBox ID="txtPrincipalBankIFSC" CssClass="form-control" runat="server" MaxLength="11" placeholder="Bank IFSC Code" onchange="CheckPrincipalIFSC();"></asp:TextBox>

                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtBankIFSCCode" Display="Dynamic"
                                                    ErrorMessage="Please enter Bank IFSC Code." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">{{resourcesData.lblPrincipalBankAccActive}} </label>
                                            <asp:TextBox ID="txtPrincipalMoNo" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidatePrincipalMobile();" MaxLength="10"></asp:TextBox>

                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="txtPrincipalMoNo" Display="Dynamic"
                                                    ErrorMessage="Please enter Principal Mobile No." ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                         




                            </div>
                                  <div id="step-6">
                                <div class="row">
                                    <fieldset id="divAttachment" style="width: 100%; margin-bottom: 15px;">
                                        <legend>&nbsp {{resourcesData.lblAttach}}</legend>
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div id="divCheque" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory">{{resourcesData.lblCheque}}
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/cheque.jpg" name="ProfileCheque" Style="height: 180px" ID="imgCheque" />
                                                        <input class="camera" id="Chequeupload" name="Chequeupload" type="file" runat="server" />
                                                        <asp:Button ID="btnCheque" type="submit" Text="Upload" runat="server" OnClick="btnCheque_Click"></asp:Button>
                                                        <asp:Panel ID="Panel1" Visible="False" runat="server">
                                                            <asp:Label ID="lblResultCheque" runat="server"></asp:Label>
                                                        </asp:Panel>

                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                             <div id="divPassbook" class="col-md-12 box-container">
                                                <div class="box-heading">
                                                    <h4 class="box-title manadatory">{{resourcesData.lblPassbook}}
                                      
                                                    </h4>
                                                </div>
                                                <div class="box-body box-body-open p0">
                                                    <div class="col-lg-12">
                                                        <asp:Image runat="server" class="form-control" src="/webApp/kiosk/Images/Passbook.jpg" name="ProfilePassbook" Style="height: 180px" ID="imgPassbook" />
                                                        <input class="camera" id="Passbookupload" name="Passbookupload" type="file" runat="server" />
                                                        <asp:Button ID="btnPassbook" type="submit" Text="Upload" runat="server" OnClick="btnPassbook_Click"></asp:Button>
                                                        <asp:Panel ID="Panel2" Visible="False" runat="server">
                                                            <asp:Label ID="lblResultPassbook" runat="server"></asp:Label>
                                                        </asp:Panel>

                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                       <div class="clearfix"></div>
                                <%---Start of Button----%>

                                <div class="box-body box-body-open" style="text-align: center;">
                                    <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" ToolTip=" Proceed to Payment"
                                        CssClass="btn btn-success" Text="Submit" ValidationGroup="G" OnClick="btnSubmit_Click" onClientClick="return CheckError();"/>
                                    <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                        CssClass="btn btn-danger" PostBackSection=""
                                        Text="Cancel" />
                                </div>


                                <asp:ValidationSummary runat="server" ID="ValidationSummary1"
                                    DisplayMode="BulletList"
                                    ShowMessageBox="False" ValidationGroup="G" ShowSummary="True" CssClass="alert alert-danger" />

                                </div>
                                <%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center ptop20" id="divRow1">
                                            <input type="button" id="btnSaveDraft1" class="save_btn btn-lg" value="Save Draft" onclick="getDataStep(1);" />
                                        </div>--%>
                            </div>
                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>


    <asp:HiddenField ID="HFCurrentLang" runat="server" ClientIDMode="Static" />

    <asp:HiddenField ID="hdnImage" runat="server" />
    <asp:HiddenField ID="hdnTC" runat="server" />
    <asp:HiddenField ID="hdnImagePath" runat="server" />
    <asp:HiddenField ID="hdnTCPath" runat="server" />
    <asp:HiddenField ID="hdnCheque" runat="server" />
    <asp:HiddenField ID="hdnChequePath" runat="server" />
    <asp:HiddenField ID="hdnPassbook" runat="server" />
    <asp:HiddenField ID="hdnPassbookPath" runat="server" />


    <link href="/WebApp/Styles/smart_wizard.min.css" rel="stylesheet" />
    <link href="/WebApp/Styles//smart_wizard_theme_arrows.min.css" rel="stylesheet" />
    <script src="/WebApp/Scripts//jquery.smartWizard.min.js" type="text/javascript"></script>

    <script>
        $(document).ready(function () {

            $('#smartwizard').smartWizard({
                selected: 0,
                theme: 'arrows',
                autoAdjustHeight: true,
                transitionEffect: 'fade',
                showStepURLhash: false

            });
            //$('#smartwizard').append("<button class='btn btn-info'>Save Draft</button>")

        });


    </script>
    <style>
        .sw-theme-arrows .step-content {
            padding: 20px 13px 8px;
            border: 0 solid #d4d4d4;
            background-color: #fbfbfb;
            text-align: left;
        }

            .sw-theme-arrows .step-content .input-group {
                display: block;
            }

            .sw-theme-arrows .step-content .input-group-addon {
                height: auto;
            }

        .sw-theme-arrows > ul.step-anchor > li > a small, .sw-theme-arrows > ul.step-anchor > li > a small {
            font-size: 17px;
        }

        .sw-theme-arrows > ul.step-anchor > li > a, .sw-theme-arrows > ul.step-anchor > li > a {
            padding: 5px 0 5px 45px;
        }

            .sw-theme-arrows > ul.step-anchor > li > a:hover, .sw-theme-arrows > ul.step-anchor > li > a:hover {
                padding: 5px 0 5px 45px;
            }

        .sw-theme-arrows > ul.step-anchor {
            display: flex;
            width: 100%;
            -ms-flex-direction: row;
            flex-direction: row;
        }

        .nav-tabs > li {
            /* float: left; */
            margin-bottom: -1px;
            flex: auto;
        }

        .sw-theme-arrows #step-4.step-content .input-group-addon {
            height: auto;
        }

        .sw-theme-arrows #step-5.step-content .input-group-addon {
            height: 50px;
        }

        .sw-toolbar-bottom .btn-group.mr-2.sw-btn-group {
            float: none;
            display: block;
        }

        .sw-toolbar-bottom button.btn.btn-secondary.sw-btn-next {
            float: right;
            background: #ff7124;
            color: #fff;
            font-size: 15px;
            border-top-left-radius: 4px !important;
            border-bottom-left-radius: 4px !important;
        }

        .sw-toolbar-bottom button.btn.btn-secondary.sw-btn-prev {
            background: #682e2e;
            color: #fff;
            font-size: 15px;
            border-radius: 4px !important;
        }

        .sw-theme-arrows > ul.step-anchor > li.active > a {
            border-color: #37495f !important;
            color: #fff !important;
            background: #37495f !important;
        }

            .sw-theme-arrows > ul.step-anchor > li.active > a:after {
                border-left: 30px solid #37495f !important;
            }

        .sw-theme-arrows > ul.step-anchor > li.done > a {
            border-color: #37495f !important;
            color: #fff !important;
            background: #37495f !important;
        }

            .sw-theme-arrows > ul.step-anchor > li.done > a:after {
                border-left: 30px solid #37495f;
            }
    </style>



</asp:Content>
