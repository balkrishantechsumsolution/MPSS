<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="GovtGirlSchAdmForm.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.MPSS.GovtGirlSchAdmForm" %>

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

<script type="text/javascript">
    $(document).ready(function () {




        $('#txtBirthdate').datepicker({
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true,
            minDate: new Date('2014/03/14'),
            yearRange: "-100:+0",
            maxDate: '0',

        });

        $('#txtCertIssueDate').datepicker({
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true,
            yearRange: "-100:+0",
            maxDate: '0',

        });



        var dtVal = document.getElementById("hdnClass").value;

        var sdt = document.getElementById("hdnBirthDate").value;

        $('#txtBirthdate').val(sdt);



        if (dtVal == "6") {

            var maxDate = "";
            var minDate = "";

            minDate = new Date('2010/01/04');
            maxDate = new Date('2015/03/31');

            $('#txtBirthdate').datepicker('option', 'minDate', minDate);
            $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);

        }
        if (dtVal == "7") {
            var maxDate = "";
            var minDate = "";

            minDate = new Date('2009/01/04');
            maxDate = new Date('2013/03/31');

            $('#txtBirthdate').datepicker('option', 'minDate', minDate);
            $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
        }
        if (dtVal == "8") {
            var maxDate = "";
            var minDate = "";

            minDate = new Date('2008/01/04');
            maxDate = new Date('2012/03/31');


            $('#txtBirthdate').datepicker('option', 'minDate', minDate);
            $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
        }

        if (dtVal == "9") {
            var maxDate = "";
            var minDate = "";

            minDate = new Date('2007/01/04');
            maxDate = new Date('2011/03/31');


            $('#txtBirthdate').datepicker('option', 'minDate', minDate);
            $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
        }
        if (document.getElementById('chkDecl').checked == true) {
            $('#btnSubMain').removeAttr("disabled");
        }
        else {

            $('#btnSubMain').attr("disabled", "disabled");
        }

        $('#txtTotalMarks').change(function () {

            GradeAndPercent();
        });

        $('#txtMarksObtain').change(function () {

            GradeAndPercent();
        });

        $('#txtBirthdate').change(function () {
            var dtVal = $('#txtBirthdate').val();
            document.getElementById("hdnBirthDate").value = dtVal;
        });
        $('#ddlDisAbility').change(function () {
            var dtVal = $('#ddlDisAbility').val();
            if (dtVal == "Y") {
                $('#divDisAble').show();
            }
            else {
                $('#divDisAble').hide();
            }
        });


        $('#ddlClass').change(function () {
            var dtVal = $('#ddlClass option:selected').val();
            document.getElementById("hdnClass").value = dtVal;


            if (dtVal == "6") {

                var maxDate = "";
                var minDate = "";

                minDate = new Date('2010/01/04');
                maxDate = new Date('2015/03/31');

                $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);

            }
            if (dtVal == "7") {
                var maxDate = "";
                var minDate = "";

                minDate = new Date('2009/01/04');
                maxDate = new Date('2013/03/31');

                $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
            }
            if (dtVal == "8") {
                var maxDate = "";
                var minDate = "";

                minDate = new Date('2008/01/04');
                maxDate = new Date('2012/03/31');


                $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
            }

            if (dtVal == "9") {
                var maxDate = "";
                var minDate = "";

                minDate = new Date('2007/01/04');
                maxDate = new Date('2011/03/31');


                $('#txtBirthdate').datepicker('option', 'minDate', minDate);
                $('#txtBirthdate').datepicker('option', 'maxDate', maxDate);
            }


        });



        //$("#btnShow").click(function () {
        //    $('#divSTUDENT').show();
        //});
    });



    function GradeAndPercent() {
        var dTotalVal = $('#txtTotalMarks').val();
        var dMarksObtain = $('#txtMarksObtain').val();

        var per = (parseInt(dMarksObtain) / parseInt(dTotalVal)) * 100;
        $('#txtMarksPercentage').val(per);

        var rw = $('#txtMarksPercentage').val();
        var grade = "";

        if (rw >= 80.00 && rw <= 100) { grade = 'A'; }
        else if (rw >= 70.00 && rw <= 79.99) { grade = 'B'; }
        else if (rw >= 60.00 && rw <= 69.99) { grade = 'C'; }
        else if (rw >= 50.00 && rw <= 59.99) { grade = 'D'; }
        else if (rw >= 40.00 && rw <= 49.99) { grade = 'E'; }
        else if (rw >= 0.00 && rw <= 39.99) { grade = 'F'; }

        $('#txtGrade').val(grade);
    }
    function GetApplicable() {
        if (document.getElementById('chkDecl').checked == true) {
            $('#btnSubMain').removeAttr("disabled");
        }
        else {

            $('#btnSubMain').attr("disabled", "disabled");
        }
    }

    function ValidateMobile() {
        var opt = "";
        var text = "";


        var txtMobie = $('#txtMobie').val();
        if (txtMobie == null || txtMobie == "") {
            //text += "<br />" + " \u002A" + " Please Enter Mobile No.";
            text += "<br /> -Please Enter Mobile No. ";
            $('#txtMobie').attr('style', 'border:1px solid #d03100 !important;');
            $('#txtMobie').css({ "background-color": "#fff2ee" });
            opt = 1;
        } else if (txtMobie != null) {
            $('#txtMobie').attr('style', 'border:1px solid #cdcdcd !important;');
            $('#txtMobie').css({ "background-color": "#ffffff" });

            if (txtMobie != '' || txtMobie != null) {
                var mobmatch1 = /^[6789]\d{9}$/;
                if (!mobmatch1.test(txtMobie)) {
                    text += "<br />" + " \u002A" + " Please Enter Valid Mobile Number.";
                    $("#txtMobie").attr('style', 'border:1px solid #d03100 !important;');
                    $("#txtMobie").css({ "background-color": "#fff2ee" });
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
                $('#txtIssueDate').val(NewDOB);

                return true;
            }
            else {
                alert("Invalid date format!");
                //document.form1.text1.focus();
                $('#txtIssueDate').val('');
                return false;
            }
        }
    }


</script>

<body>
    <form id="form1" runat="server">
        <div id="page-wrapper" style="min-height: 500px !important;">

            <div class="row">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">

                    <div class="box-heading form_hd">
                        <h2>श्रमोदय (आवासीय) विद्यालय प्रवेश परीक्षा 2023-24 की आवेदन फ़ार्म</h2>

                    </div>

                    <div class="clearfix"></div>

                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                        <div class="alert alert-success">
                            <p><b>कृपया अंग्रेजी भाषा में ही डेटा दर्ज करें</b></p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="manadatory" for="ddlFullName">
                        श्रमकों का पोर्टल कोड़ क्रमांक
                    </label>


                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
                    <asp:TextBox ID="txtRegNo" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="15"></asp:TextBox>
                    <div class="col-xs-12 pleft0">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="txtRegNo" Display="Dynamic"
                            ErrorMessage="श्रमकों का पोर्टल कोड़ क्रमांक डाले" ValidationGroup="G" ForeColor="Red" />
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="form-group">
                    <asp:Button ID="btnShow" runat="server" CausesValidation="True" ToolTip="Show Data"
                        CssClass="btn btn-success" Text="Show Data" ValidationGroup="G" OnClick="btnShow_Click1" />



                </div>
            </div>
            <asp:Panel ID="pnlDetails" runat="server" Visible="false">

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                    <asp:ValidationSummary runat="server" ID="ValidationSummary1"
                        DisplayMode="BulletList"
                        ShowMessageBox="False" ValidationGroup="G" ShowSummary="True" CssClass="alert alert-danger" />
                </div>
                <div id="divSTUDENT" runat="server">

                    <div class="row">

                        <div class="col-xs-12 col-sm-8 col-md-9 col-lg-9 box-container row">
                            <div class="box-heading">
                                <h4 class="box-title register-num" style="padding-top: 8px;">छात्र प्रोफ़ाइल विवरण
                                </h4>
                            </div>

                            <div class="box-body box-body-open">
                                <div class="row">
                                   

                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="manadatory">कक्षा (जिस के लिए आवेदन करना चाहते है)*</label>
                                            <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddldistrict">
                                                विद्यालय में प्रवेश हेतू जिला चुनें
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">

                                            <asp:DropDownList ID="ddlSchoolDistrict" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlSchoolDistrict_SelectedIndexChanged">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>


                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlSchoolDistrict" Display="Dynamic"
                                                    ErrorMessage="Please enter School District Name" ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddldistrict">
                                                विद्यालय का नाम प्रवेश हेतू
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">

                                            <asp:DropDownList ID="ddlSchool" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                            </asp:DropDownList>


                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="ddlSchool" Display="Dynamic"
                                                    ErrorMessage="Please enter School Name" ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                आवेदक / छात्रा का नाम *
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtFullName" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="txtFullName" Display="Dynamic"
                                                    ErrorMessage="Please enter Student Name" ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>



                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                पिता का नाम 
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtFatherName" runat="server" ToolTip="Father Full Name" CssClass="form-control" MaxLength="100" ReadOnly="true" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFatherName" Display="Dynamic"
                                                    ErrorMessage="Please enter Father Name" ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                माता का नाम
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtMotherName" runat="server" ToolTip="Mother Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMotherName" Display="Dynamic"
                                                    ErrorMessage="Please enter Mother Name" ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                जन्म तिथि (DD/MM/YYYY)                                            
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                        <div class="form-group">
                                            <asp:TextBox ID="txtBirthdate" runat="server" ReadOnly="true" ToolTip="dd/mm/yyyy" CssClass="form-control"></asp:TextBox>
                                            <div class="col-xs-12 pleft0">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtBirthdate" Display="Dynamic"
                                                    ErrorMessage="Please enter Date of Birth" ValidationGroup="G" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="display: none;">
                                        <div class="form-group">
                                            <label class="manadatory" for="ddlFullName">
                                                दिनांक 01/07/2022 को आयु                                          
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6" style="display: none;">
                                        <div class="form-group">
                                            <label class="manadatory" id="lblAge" runat="server" />
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                छात्रा की श्रेणी 
                                            
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <asp:DropDownList ID="ddlCaste" runat="server" CssClass="form-control">
                                            <%-- <asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                        </asp:DropDownList>


                                        <div class="col-xs-12 pleft0 p5">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlCaste" InitialValue="0" Display="Dynamic"
                                                ErrorMessage="Please select Category." ValidationGroup="G" ForeColor="Red" />

                                        </div>

                                    </div>


                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                लिंग                                       
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                                <%-- <asp:ListItem Value="0">--Select--</asp:ListItem>--%>
                                            </asp:DropDownList>


                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="ddlGender" InitialValue="0" Display="Dynamic"
                                                    ErrorMessage="Please select Gender." ValidationGroup="G" ForeColor="Red" />

                                            </div>

                                        </div>
                                    </div>


                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                क्या आप दिव्यांग हैं                                           
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:DropDownList ID="ddlDisAbility" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                                <asp:ListItem Value="N">No</asp:ListItem>
                                            </asp:DropDownList>


                                            <div class="col-xs-12 pleft0 p5">
                                                <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="ddlDisAbility" InitialValue="0" Display="Dynamic"
                                                    ErrorMessage="Please select Disability." ValidationGroup="G" ForeColor="Red" />

                                            </div>

                                        </div>
                                    </div>
                                    <div id="divDisAble" style="display: none;">
                                        <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                            <div class="form-group">
                                                <label class="manadatory">
                                                    यदि दिव्यांग हैं तो प्रकार                                           
                                                </label>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <asp:DropDownList ID="ddlDisAbilityType" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="V">दृष्टिबाधित</asp:ListItem>
                                                    <asp:ListItem Value="O">अस्थिबाधित</asp:ListItem>
                                                    <asp:ListItem Value="H">श्रवणबाधित</asp:ListItem>
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    यदि दिव्यांग हैं तो प्रमाण-पत्र क्रमांक
                                                </label>


                                            </div>
                                        </div>

                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtDisAbilityNo" runat="server" ToolTip="Mother Name" CssClass="form-control" MaxLength="25"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtMotherName" Display="Dynamic"
                                                        ErrorMessage="Please enter Mother Name" ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                क्या आपका परीक्षा परिणाम प्रतीक्षा मे है
यदि परिणाम प्रतीक्षित मार्कशीट अटैचमेंट की आवश्यकता नहीं है                                           
                                            </label>

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RadioButton1" runat="server" Text="Yes" GroupName="chkYesMatt" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="RadioButton2" runat="server" Text="No" GroupName="chkYesMatt" />

                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                क्या आप मध्यप्रदेश के मूलनिवासी है ?
                                           
                                            </label>


                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">
                                            <asp:RadioButton ID="rbnNative1" runat="server" Text="Yes" GroupName="native" />

                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-2 col-md-2 col-lg-2">
                                        <div class="form-group">

                                            <asp:RadioButton ID="rbnNative2" runat="server" Text="No" GroupName="native" />
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="clearfix"></div>
                        </div>


                        <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 pleft0 pright0">
                            <div id="divPhoto" class="col-md-12 box-container">
                                <div class="box-heading">
                                    <h4 class="box-title manadatory">अपलोड करें
                                      
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

                        </div>

                        <div class="clearfix"></div>

                        <div class="row">
                            <div class="col-md-12 box-container" runat="server" id="div3">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">आवेदक का पता
                                        
                                    </h4>
                                </div>
                                <div class="clearfix"></div>
                                <div class="box-body box-body-open">
                                    <div class="row">
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    मकान नंबर
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtHouse" runat="server" ToolTip="House No." CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtHouse" Display="Dynamic"
                                                        ErrorMessage="Please enter House No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    कॉलोनी
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtColony" runat="server" ToolTip="Colony" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtColony" Display="Dynamic"
                                                        ErrorMessage="Please enter Colony." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    शहर/ग्राम
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtCity" runat="server" ToolTip="City" CssClass="form-control" MaxLength="100" onkeypress="return Alphanumericspecialchar(event);"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtCity" Display="Dynamic"
                                                        ErrorMessage="Please enter City/Vilage." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    ब्लॉक
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtBlock" runat="server" ToolTip="Block" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBlock" Display="Dynamic"
                                                        ErrorMessage="Please enter Block." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    जिला
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:DropDownList ID="ddlAddDistrict" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="ddlAddDistrict" Display="Dynamic"
                                                        ErrorMessage="Please enter District." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    पिन कोड
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtPinCode" runat="server" ToolTip="Pin Code" CssClass="form-control" onkeydown="return AllowOnlyNumeric(event);" MaxLength="6"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPinCode" Display="Dynamic"
                                                        ErrorMessage="Please enter Pin No." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="clearfix"></div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlDistrict">
                                                    समग्र आईडी
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtSamagraNo" runat="server" ToolTip="Samagra No" onkeydown="return AllowOnlyNumeric(event);" ReadOnly="true" MaxLength="9" CssClass="form-control"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtSamagraNo" Display="Dynamic"
                                                        ErrorMessage="Please enter SamagraNo." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <label class="manadatory" for="ddlFullName">
                                                    मोबाइल नं
                                                </label>


                                            </div>
                                        </div>
                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                            <div class="form-group">
                                                <asp:TextBox ID="txtMobie" CssClass="form-control" runat="server" onkeydown="return AllowOnlyNumeric(event);" onChange="ValidateMobile();" MaxLength="10"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtMobie" Display="Dynamic"
                                                        ErrorMessage="Please enter Mobie." ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>


                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="clearfix"></div>
                        <div class="row">
                            <div class="col-md-12 box-container" runat="server" id="div1">
                                <div class="box-heading">
                                    <h4 class="box-title register-num">छात्र / छात्रा द्वारा पूर्व कक्षा परीक्षा  उत्तीर्ण करने का विवरण
                                        
                                    </h4>
                                </div>
                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                    <table class="table">
                                        <tr class="table-dark">
                                            <th>विद्यालय का नाम *</th>
                                            <th>विद्यालय का प्रकार </th>
                                            <th>जिले का नाम</th>
                                            <th style="display: none">विकास खण्ड</th>
                                            <th>कक्षा</th>
                                            <th>उत्तीर्ण वर्ष</th>
                                            <th>प्राप्तांक</th>
                                            <th>पूर्णांक</th>
                                            <th>परिणाम प्रतिशत(%)</th>
                                            <th>परिणाम ग्रेड</th>
                                        </tr>
                                        <%-- <tr class="table-dark">


                                                <th>कक्षा</th>
                                                <th>उत्तीर्ण वर्ष</th>
                                                <th>प्राप्तांक</th>
                                                <th>पूर्णांक</th>
                                                <th>परिणाम प्रतिशत(%)</th>
                                                <th>परिणाम ग्रेड</th>
                                            </tr>--%>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtPreviousSchoolName" runat="server" ToolTip="Father Full Name" CssClass="form-control" MaxLength="100" onkeypress="return ValidateAlpha(event);"></asp:TextBox>
                                                <div class="col-xs-12 pleft0">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="txtPreviousSchoolName" Display="Dynamic"
                                                        ErrorMessage="Please enter Previous School Name" ValidationGroup="G" ForeColor="Red" />
                                                </div>
                                            </td>

                                            <td>
                                                <asp:DropDownList ID="ddlSchoolType" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="P">Private</asp:ListItem>
                                                    <asp:ListItem Value="G">Govt</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>

                                            <td>
                                                <asp:DropDownList ID="ddlPreviousSchoolDistrict" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="display: none">
                                                <asp:DropDownList ID="ddlSchoolVikaskhand" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlScClass" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="5">5</asp:ListItem>
                                                    <asp:ListItem Value="6">6</asp:ListItem>
                                                    <asp:ListItem Value="7">7</asp:ListItem>
                                                    <asp:ListItem Value="8">8</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>

                                                <asp:DropDownList ID="ddlPassYear" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="0">--Select--</asp:ListItem>
                                                    <asp:ListItem Value="2022">2022</asp:ListItem>
                                                    <asp:ListItem Value="2021">2021</asp:ListItem>
                                                    <asp:ListItem Value="2020">2020</asp:ListItem>
                                                    <asp:ListItem Value="2019">2019</asp:ListItem>
                                                    <asp:ListItem Value="2018">2018</asp:ListItem>
                                                    <asp:ListItem Value="2017">2017</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtMarksObtain" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="6" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox></td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="txtMarksObtain" Display="Dynamic"
                                                ErrorMessage="Please enter Marks Obtain" ValidationGroup="G" ForeColor="Red" />
                                            <td>
                                                <asp:TextBox ID="txtTotalMarks" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="6" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox></td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="txtTotalMarks" Display="Dynamic"
                                                ErrorMessage="Please enter Total Marks" ValidationGroup="G" ForeColor="Red" />
                                            <td>
                                                <asp:TextBox ID="txtMarksPercentage" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="6" ReadOnly="true" onkeydown="return AllowOnlyNumeric(event);"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="txtGrade" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="100" ReadOnly="true"></asp:TextBox></td>
                                        </tr>

                                    </table>

                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div style="display: none;">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">

                                <div class="clearfix"></div>
                                <div class="box-body box-body-open row">
                                    <div class="table-responsive">
                                        <asp:GridView ID="GridView1" CssClass="GridClass" CellPadding="10"
                                            CellSpacing="5" BorderStyle="None" BorderWidth="1px" ForeColor="#333333" GridLines="None" runat="server">
                                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                            <RowStyle BackColor="#E3EAEB" />
                                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" Width="400px" />
                                            <EditRowStyle BackColor="#ffff99" />

                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

                        </div>





                        <div class="clearfix"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">


                            <div class="box-body box-body-open row">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                प्रवेश परीक्षा हेतु जिला चुने *
                                            
                                            </label>


                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <asp:DropDownList ID="ddlRegDistrict" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                                        </asp:DropDownList>


                                        <div class="col-xs-12 pleft0 p5">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlRegDistrict" InitialValue="0" Display="Dynamic"
                                                ErrorMessage="Please select District." ValidationGroup="G" ForeColor="Red" />

                                        </div>


                                    </div>
                                </div>


                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                अनुसूचित जाति/ जनजाति/ अन्य पिछड़ा वर्ग का निर्धारित प्रपत्र में स्थायी/ अस्थाई, एस.डी.ओ. या अन्य सक्षम अधिकारी द्वारा जारी प्रमाण पत्र क्र.
                                            
                                            </label>


                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <asp:TextBox ID="txtCastCertNo" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="40"></asp:TextBox></td>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                प्रमाण पत्र जारी दिनांक (DD/MM/YYYY)
                                            
                                            </label>


                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <asp:TextBox ID="txtCertIssueDate" runat="server" ToolTip="Full Name" CssClass="form-control" MaxLength="100"></asp:TextBox>
                                    </div>
                                </div>


                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                पूर्व कक्षा की अंक सूची स्कैन कापी संलग्न ( केवल .jpg फ़ाइल अधिकतम 200 केबी । ) यदि परिणाम प्रतीक्षित मार्कशीट अटैचमेंट की आवश्यकता नहीं है
                                            
                                            </label>


                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <input class="camera" id="File5MSh" name="Photoupload" type="file" runat="server" />
                                        <asp:Button ID="Button5MSh" type="submit" Text="Upload" runat="server" OnClick="Button5MSh_Click"></asp:Button>
                                        <asp:Panel ID="Panel5MSh" Visible="False" runat="server">
                                            <asp:Label ID="Label5MSh" runat="server"></asp:Label>
                                        </asp:Panel>


                                    </div>
                                </div>


                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                विकलांगता प्रमाणपत्र की स्कैन कापी संलग्न
( केवल .jpg फ़ाइल अधिकतम 200 केबी । )
                                            
                                            </label>


                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <input class="camera" id="FileDisAbility" name="Photoupload" type="file" runat="server" />
                                        <asp:Button ID="ButtonDisAbility" type="submit" Text="Upload" runat="server" OnClick="ButtonDisAbility_Click"></asp:Button>
                                        <asp:Panel ID="PanelDisAbility" Visible="False" runat="server">
                                            <asp:Label ID="LabelDisAbility" runat="server"></asp:Label>
                                        </asp:Panel>


                                    </div>
                                </div>

                                <div class="clearfix"></div>






                                <div class="clearfix"></div>



                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                जाति प्रमाणपत्र की स्कैन कापी संलग्न
( केवल .jpg फ़ाइल अधिकतम 200 केबी । )
                                            
                                            </label>


                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <input class="camera" id="FileCaste" name="Photoupload" type="file" runat="server" />
                                        <asp:Button ID="ButtonCaste" type="submit" Text="Upload" runat="server" OnClick="ButtonCaste_Click"></asp:Button>
                                        <asp:Panel ID="PanelCaste" Visible="False" runat="server">
                                            <asp:Label ID="LabelCaste" runat="server"></asp:Label>
                                        </asp:Panel>


                                    </div>
                                </div>

                                <div class="clearfix"></div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <div class="form-group">
                                            <label class="manadatory">
                                                मध्य प्रदेश के मूल निवासी प्रमाणपत्र की स्कैन कापी संलग्न
( केवल .jpg फ़ाइल अधिकतम 200 केबी । )
                                            
                                            </label>


                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                                        <input class="camera" id="FileNativeCert" name="Photoupload" type="file" runat="server" />
                                        <asp:Button ID="ButtonNativeCert" type="submit" Text="Upload" runat="server" OnClick="ButtonNativeCert_Click"></asp:Button>
                                        <asp:Panel ID="PanelNativeCert" Visible="False" runat="server">
                                            <asp:Label ID="LabelNativeCert" runat="server"></asp:Label>
                                        </asp:Panel>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="row">



                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 box-container row">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <asp:CheckBox ID="chkDecl" runat="server" OnClick="GetApplicable();" />
                                            घोषणा : मैं घोषणा करती हूँ की मेरे द्वारा प्रवेश नियम पुस्तिका पढ़ ली गई है तथा तदानुसार आवेदन पत्र में मेरे द्वारा भरी गई जानकारी तथा दस्तावेजो की छाया प्रति पूर्णतः सत्य है यदि कोई भी दस्तावेज/जानकारी गलत या अपूर्ण पायी जाती है तो प्रवेश स्वतः ही निरस्त हो जायेगा ।
                                              
                                        </div>

                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                        <div class="form-group">
                                            प्रवेश पत्र हेतु निर्देश :-प्रवेश पत्र आवेदन पत्र की रसीद पर दिए गए आवेदन क्रमांक के माध्यम से मध्यप्रदेश  राज्‍य मुक्‍त स्‍कूल शिक्षा बोर्ड पोर्टल से डाउनलोड किये जा सकेंगे.                                              
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-lg-push-1 text-center">
                                <asp:Button ID="btnHome" runat="server" CausesValidation="True" Text="Home" ToolTip="Home page"
                                    CssClass="btn btn-info" PostBackSection="" OnClick="btnHome_Click"
                                     />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel" ToolTip="Refresh the page"
                                    CssClass="btn btn-danger" PostBackSection=""
                                    Text="Cancel" />
                                <asp:Button ID="btnSubMain" runat="server" CausesValidation="True" ToolTip="Proceed to Payment"
                                    CssClass="btn btn-success" Text="Submit" ValidationGroup="G" OnClick="btnSubMain_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>

        <asp:HiddenField ID="hdnImage" runat="server" />
        <asp:HiddenField ID="hdnFile5MSh" runat="server" />
        <asp:HiddenField ID="hdnFileDisAbility" runat="server" />
        <asp:HiddenField ID="hdnFileCaste" runat="server" />
        <asp:HiddenField ID="hdnFileNativeCert" runat="server" />


        <asp:HiddenField ID="hdnImageName" runat="server" />
        <asp:HiddenField ID="hdnFile5MShName" runat="server" />
        <asp:HiddenField ID="hdnFileDisAbilityName" runat="server" />
        <asp:HiddenField ID="hdnFileCasteName" runat="server" />
        <asp:HiddenField ID="hdnFileNativeCertName" runat="server" />

        <asp:HiddenField ID="hdnClass" runat="server" />
        <asp:HiddenField ID="hdnBirthDate" runat="server" />

        <asp:HiddenField ID="hdnSamagraFamilyID" runat="server" />
        <asp:HiddenField ID="hdnSamagraMemberID" runat="server" />
        <asp:HiddenField ID="hdnCardHolderName" runat="server" />
        <asp:HiddenField ID="hdnUniqueCode" runat="server" />


    </form>
</body>
</html>
