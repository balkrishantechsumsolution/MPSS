<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" CodeBehind="RefundPayment.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.ReFundPayment.RefundPayment" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <script src="../../Login/js/jquery.dataTables.min.js"></script>
    <script src="../../Login/js/dataTables.jqueryui.min.js"></script>
    <link href="../../Login/css/dataTables.jqueryui.min.css" rel="stylesheet" />
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    -
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery.msgBox.js"></script>
    <link href="../../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../Scripts/CommonScript.js"></script>


    <style type="text/css">
        .mtop22 {
            margin-top: 22px !important;
        }

        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }

        .ptop28 {
            padding-top: 28px !important;
        }

        .RTtable > tbody > tr > th {
            background-color: #4879a9;
            color: #fff;
            padding: 12px !important;
            font-weight: normal;
            border: 1px solid #fff;
            text-align: center;
            vertical-align: middle !important;
        }

        .RTtable > tbody > tr > td {
            background-color: #fff;
            text-align: center;
            padding: 10px !important;
            border: 1px solid #ddd;
        }
    </style>


    <script type="text/javascript">
        var Fetchcheck = 0;
        $(document).ready(function () {
           
            $("#btnSubmit").prop("disabled", true);
           
            $('#divDeclaration').hide();
            var qs = getQueryStrings();
            var AppId = qs["AppID"];
            var svcid = qs["SvcID"];
            $('#divother').hide();
            $('#divPayment').hide();
            selectApplication();
            $('#btnFetch').prop("disabled", false);
            $("#btnSubmit").prop("disabled", true);
            //$("#btnSubmit").bind("click", function (e) { return SubmitData(); });
            $('#ComplaintDetail').val('');
            if (svcid == "403") {
                $('#AppList').val('403');
                $("#AppList").prop("disabled", true);
            }
            else {
                $('#AppList').val('430');
                $("#AppList").prop("disabled", true);
            }
            $('#txtAppID').val(AppId);
            GetBankName();

           
        });

        function isNumber(evt) {
            evt = (evt) ? evt : window.event;
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
       
        function calc() {
            debugger;
            if ($('#FormDeclaration').prop('checked') == true && Fetchcheck == 1) {
             
                $('#btnSubmit').prop("disabled", false);
            } else {
                alert('Click on fetch Payment Details first before Submitting Request.');
                $('#btnSubmit').prop("disabled", true);
            }
        }
     


        function AppIDValidation() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Kiosk/ReFundPayment/RefundPayment.aspx/AppIDValidation",
                data: '{"m_AppID":"' + $('#AppList').val() + '","m_ServiceID":"' + $('#txtAppID').val() + '"}',
                processData: false,
                dataType: "json",
                success: function (result) {
                    if (result.d == "0") {
                        $('#txtAppID').attr('style', 'border:2px solid red !important;');
                        alertPopup("Invalid Application ID", "<BR> Please Enter Valid Application-ID.")
                        $('#txtAppID').val('');
                        $("#lblFullName").text('');
                        $("#lblDOB").text('');
                        $("#lblMobileNo").text('');
                        $("#lblEmailID").text('');
                        $("#HDNsField").val('');
                        $("#lblPayment").text('');
                        $("#btnSubmit").prop("disabled", true);
                        return;
                    }
                    else {
                        $('#txtAppID').attr('style', 'border:2px solid #4CAF50 !important;');
                        return;
                    }
                },
                error: function (a, b, c) {
                    alert("4." + a.responseText);
                }
            });
        }

        function getAppDetail() {
            debugger;
            

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Kiosk/ReFundPayment/RefundPayment.aspx/getAppDetail",
                data: '{"m_AppID":"' + $('#AppList').val() + '","m_ServiceID":"' + $('#txtAppID').val() + '"}',
                processData: false,
                dataType: "json",
                success: function (Result) {
                    debugger;
                    var data = $.parseJSON(Result.d);
                    console.log(data)
                    if (data != null) {
                        var html = "";
                        $('#TableData').html('');

                        $('#txtAppID').attr('style', 'border:2px solid green !important;');
                        $('#txtAppID').css({ "background-color": "#ffffff" });
                        $.each(data, function (key, value) {
                            html = "<tr><td>" + value.AppID + "</td><td>" + value.Bank_TranID + "</td><td>" + value.PGSequenceNo + "</td><td>" + value.PaymentStatus + "</td</tr>";
                            $('#TableData').append(html);
                        });

                        //$("#btnSubmit").prop("disabled", false);
                    }
                    else {
                        $("#txtAppID").val('');
                        //$("#btnSubmit").prop("disabled", true);
                        $('#txtAppID').attr('style', 'border:2px solid red !important;');
                        $('#txtAppID').css({ "background-color": "#fff2ee" });
                        alertPopup("APPLICATION ID INFORMATION", "<BR> NO DATA FOUND!!! <BR> INVALID APPLICATION ID ENTERED!!!");
                    }
                    if (data == null || data == '' || data=="undefined") {
                        Fetchcheck = 0;
                        $("#btnSubmit").prop("disabled", true);
                        alert('NO DATA FOUND!!! INVALID APPLICATION ID ENTERED!!!"');

                    }
                    else {
                        Fetchcheck = 1;
                        $("#btnSubmit").prop("disabled", false);
                    }
                },
                error: function (Result) {
                    alert(Result);
                }
            });
        }

        function selectApplication() {
            if ($('#AppList').val() == "0") {
                $('#txtAppID').prop("disabled", true);

            }
            else {
                $('#txtAppID').prop("disabled", false);

            }
        }

       

        function AllowIFSC() {

            var ifsc = document.getElementById('IFSCCode').value;
            var reg = /^[A-Z|a-z]{4}[0][\w]{6}$/;

            if (ifsc.match(reg)) {

                $('.IFSCCode').css("border-color", "none")
                $('.forerrormsg').html("")
                return true;

            }
            else {
                $('.IFSCCode').css("border-color", "#dc1717")
                $('.forerrormsg').html("Please Enter correct  IFSC Code")
                return false;
            }
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


        function SubmitData() {
            if (!ValidateForm()) {
                return;
            }
            
            var temp = "Mohan";
            var AppID = "";
            var result = false;

            var qs = getQueryStrings();
            var uid = qs["UID"];
            var svcid = qs["SvcID"];
            var dpt = qs["DPT"];
            var dist = qs["DIST"];
            var blk = qs["BLK"];
            var pan = qs["PAN"];
            var ofc = qs["OFC"];
            var ofr = qs["OFR"];
            var datavar = {

                'aadhaarNumber': uid,

                'AppName': $('#AppList option:selected').val(),
                'AppID': $('#txtAppID').val(),
                'FullName': $('#lblFullName').text(),
                'DOB': $('#lblDOB').text(),
                'EmailId': $('#lblEmailID').text(),
                'MobileNo': $('#lblMobileNo').text(),
                'PaymentStatus': $('#lblPayment').text(),
                'ReFundDetail': $('#ComplaintDetail').val(),
                'SmsNo': $('#HDNsField').val(),
                'NameOfAccountHolder': $('#AccountHolder').val(),
                'AccountNumber': $('#AccountNumber').val(),
                'IFSCCode': $('#IFSCCode').val(),
                'BackName':$("#ddlBankName option:selected").val(),
                'BankBranch': $('#BankBranch').val(),

                'department': dpt,
                'district': dist,
                'block': blk,
                'panchayat': pan,
                'office': ofc,
                'officer': ofr,
            };

            var obj = {
                "prefix": "'" + temp + "'",
                "Data": JSON.stringify(datavar, null, 4)
            };

            $.when(
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "/WebApp/Kiosk/ReFundPayment/RefundPayment.aspx/InsertRefund",
                    data: JSON.stringify(obj, null, 4),
                    processData: false,
                    dataType: "json",
                    success: function (response) {
                        debugger;
                    },
                    error: function (a, b, c) {
                        result = false;
                        alert("5." + a.responseText);
                    }
                })
                ).then(function (data, textStatus, jqXHR) {
                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    RefundID = obj.RefundID;
                    AppID = obj.AppID;
                    result = true;

                    if (result /*&& jqXHRData_IMG_result*/) {
                        alert("Your Refund Request submitted successfully. ReFund ID : " + RefundID);
                        window.location.href = '/WebApp/Kiosk/ReFundPayment/RefundPaymentReciept.aspx?SvcID=' + svcid + '&AppID=' + AppID + '&UID=' + uid;
                    }

                });// end of Then function of main Data Insert Function

            return false;
        }


        function ValidateForm() {

            var text = "";
            var opt = "";

            var AppList = $("#AppList option:selected").text();
            var txtAppID = $('#txtAppID').val();
           
            var ComplaintDetail = $('#ComplaintDetail').val();
            var holdername = $('#AccountHolder').val();
            var accountnumber = $('#AccountNumber').val();
            var IFSCCode = $('#IFSCCode').val();
            var BackName = $("#ddlBankName option:selected").val();
            var BankBranch = $('#BankBranch').val();


            if (AppList == "Select" || AppList == "0") {
                text += "<br /> Please Select Application Type";
                $('#AppList').attr('style', 'border:1px solid red !important;');
                $('#AppList').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#AppList').attr('style', 'border:1px solid #ddd !important;');
                $('#AppList').css({ "background-color": "#ffffff" });
            }



            if (txtAppID == null || txtAppID == "") {
                text += "<br /> Please Enter Application Id. ";
                $('#txtAppID').attr('style', 'border:1px solid red !important;');
                $('#txtAppID').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#txtAppID').attr('style', 'border:1px solid #ddd !important;');
                $('#txtAppID').css({ "background-color": "#ffffff" });
            }


            if (holdername == null || holdername == "") {
                text += "<br /> Please Enter Account Holder Name ";
                $('#AccountHolder').attr('style', 'border:1px solid red !important;');
                $('#AccountHolder').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#AccountHolder').attr('style', 'border:1px solid #ddd !important;');
                $('#AccountHolder').css({ "background-color": "#ffffff" });
            }

            if (accountnumber == null || accountnumber == "") {
                text += "<br /> Please Enter Account Number. ";
                $('#AccountNumber').attr('style', 'border:1px solid red !important;');
                $('#AccountNumber').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#AccountNumber').attr('style', 'border:1px solid #ddd !important;');
                $('#AccountNumber').css({ "background-color": "#ffffff" });
            }

            if (BackName == "Select Bank Name" || BackName == "0") {
                text += "<br /> Please Select BackName";
                $('#ddlBankName').attr('style', 'border:1px solid red !important;');
                $('#ddlBankName').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#ddlBankName').attr('style', 'border:1px solid #ddd !important;');
                $('#ddlBankName').css({ "background-color": "#ffffff" });
            }

            if (BankBranch == null || BankBranch == "") {
                text += "<br /> Please Enter Branch Name. ";
                $('#BankBranch').attr('style', 'border:1px solid red !important;');
                $('#BankBranch').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#BankBranch').attr('style', 'border:1px solid #ddd !important;');
                $('#BankBranch').css({ "background-color": "#ffffff" });
            }


            if (IFSCCode == null || IFSCCode == "") {
                text += "<br /> Please Enter IFSC Code ";
                $('#IFSCCode').attr('style', 'border:1px solid red !important;');
                $('#IFSCCode').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#IFSCCode').attr('style', 'border:1px solid #ddd !important;');
                $('#IFSCCode').css({ "background-color": "#ffffff" });
            }

           


            if (ComplaintDetail == null || ComplaintDetail == "") {
                text += "<br /> Please Enter Your Refund Detail In Description. ";
                $('#ComplaintDetail').attr('style', 'border:1px solid red !important;');
                $('#ComplaintDetail').css({ "background-color": "#fff2ee" });
                opt = 1;
            } else {
                $('#ComplaintDetail').attr('style', 'border:1px solid #ddd !important;');
                $('#ComplaintDetail').css({ "background-color": "#ffffff" });
            }

            if (opt == "1") {
                alertPopup("Please Fill The Following Information.", text);
                return false;
            }
            return true;
        }

        function GetBankName() {
            var SelState = $("#ddlBankName option:selected").val();
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '/WebApp/Kiosk/ReFundPayment/RefundPayment.aspx/GetBankName',
                data: '{}',
                dataType: "json",
                success: function (response) {
                    var Category = eval(response.d);
                    var html = "";
                    var catCount = 0;

                    var ddlState = $("[id=ddlBankName]");
                    ddlState.empty().append('<option selected="selected" value="0">Select BackName</option>');
                    $.each(Category, function () {
                        $("[id=ddlBankName]").append('<option value = "' + this.Id + '">' + this.Name + '</option>');
                        catCount++;
                    });
                },
                error: function (a, b, c) {
                    alert("2." + a.responseText);
                }
            });
        }


    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper" style="min-height: 311px;">
        <div class="row">
            <div class="mtop20"></div>
            <div class="col-lg-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title">OUAT ONLINE REFUND FORM</h4>
                </div>

                <div class="box-body box-body-open">
                    <div class="form-group">
                        <div id="fillDtl" style="background-color: #ddd; width: 97%; min-height: 80px; padding-top: 10px; margin: 0 auto;">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
                                <label class="manadatory"><b>Application Type</b></label>
                                <select class="form-control" id="AppList" runat="server" onchange="selectApplication();">
                                    <option value="0">Select</option>
                                    <option value="403">OUAT FORM A</option>
                                    <option value="430">OUAT AGRO Diploma</option>
                                </select>
                            </div>
                            <div class="col-xs-12 col-sm-12 c   ol-md-12 col-lg-3">
                                <label class="manadatory"><b>Application ID</b></label>
                                <input id="txtAppID" class="form-control" placeholder="Application ID" name="FirstName" maxlength="15" runat="server" onkeypress="return isNumber(event);" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2 mtop22">
                                <button type="button" id="btnFetch" class="btn btn-primary" onclick="getAppDetail();">Fetch Payment Detail</button>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="mtop20"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <table class="table table-bordered" style="height: 10%;">
                                <thead>
                                    <tr>
                                        <th><b>AppID</b></th>
                                        <th><b>Bank Transation ID</b></th>
                                        <th><b>PGSequenceNo</b></th>
                                        <th><b>PaymentStatus</b></th>
                                    </tr>
                                </thead>
                                <tbody id="TableData">
                                </tbody>
                            </table>

                        </div>
                        <div class="clearfix"></div>

                        <div class="clearfix"></div>
                        <div class="mtop20"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="mtop20"></div>
                <div class="row" id="divBankDtls" runat="server">
                    <div class="col-md-12 box-container mTop15">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Bank Detail in which Amount to be Refunded 
                            </h4>
                        </div>
                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-3 col-md-4 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="AccountHolder">
                                        Name of the Account Holder</label>
                                    <input id="AccountHolder" class="form-control" placeholder="Name of Account Holder" name="AccountHolder" type="text" value="" maxlength="25"
                                        onkeypress="return ValidateAlpha(event);" autofocus="autofocus" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="AccountNumber">
                                        Account Number</label>
                                    <input id="AccountNumber" class="form-control" placeholder="Account Number" name="AccNo" type="text" value="" maxlength="22"
                                        onkeypress="return isNumber(event);" autofocus="autofocus" />
                                </div>
                            </div>

                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
                                <div class="form-group">
                                    <label class="manadatory" for="IFSCCode">
                                        Bank Name</label>
                                    <select class="form-control" id="ddlBankName">
                                        <option value="0">Select BackName</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="IFSCCode">
                                        Bank Branch</label>
                                    <input id="BankBranch" class="form-control" placeholder="Enter Bank Branch" name="BankBranch" type="text" value="" maxlength="50"
                                        autofocus="autofocus" />
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-2">
                                <div class="form-group">
                                    <label class="manadatory" for="IFSCCode">
                                        IFSC Code</label>
                                    <input id="IFSCCode" class="form-control" placeholder="Enter IFSC Code" name="IFSCCode" type="text" value="" maxlength="11"
                                        onchange="AllowIFSC()" autofocus="autofocus" />
                                    <label for="IFSCCODE" class="forerrormsg" style="color: red;"></label>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <label class="manadatory"><b>Enter Remark / Description  :</b></label>
                                <textarea rows="4" cols="50" class="col-lg-12 form-control" id="ComplaintDetail" style="resize: none;"> </textarea>
                            </div>
                            <div class="col-lg-12 mtop15" style="color: #a94442;">Note:- In Case You Have Multiple Refrence No Please Give All The Bank Transaction ID /Reference ID in Description,For Refunds</div>
                            <div class="clearfix">
                            </div>


                        </div>
                        <%----End of BankDetails-----%>
                    </div>
                    <div class="col-md-12 box-container" id="Div2">
                        <div class="box-heading">
                            <h4 class="box-title register-num">Declaration</h4>
                        </div>
                        <div class="clearfix"></div>
                        <div class="box-body box-body-open">
                            <div class="col-md-12 box-container mTop15">
                                <p class="text-justify">
                                    <input type="checkbox" name="checkbox" id="FormDeclaration" onclick="calc();" runat="server" />
                                    <b>I declare that the above details furnished is completely correct to the best of my knowledge.
                                    </b>
                                </p>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                        <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" onclick="SubmitData();" />
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="HDNsField" runat="server" />
        </div>
    </div>
</asp:Content>
