<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="OUATComplaint.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.OUATComplaint" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
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
    </style>


    <script type="text/javascript">

        $(document).ready(function () {
            debugger;
            $('#divother').hide();
            $('#divPayment').hide();
            selectApplication();
            $("#btnSubmit").prop("disabled", true);
            //$("#btnSubmit").bind("click", function (e) { return SubmitData(); });
            $('#ComplaintDetail').val('');
        });

        function AppIDValidation() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Kiosk/OUAT/OUATComplaint.aspx/AppIDValidation",
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

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "/WebApp/Kiosk/OUAT/OUATComplaint.aspx/getAppDetail",
                data: '{"m_AppID":"' + $('#AppList').val() + '","m_ServiceID":"' + $('#txtAppID').val() + '"}',
                processData: false,
                dataType: "json",
                success: function (Result) {
                    var data = $.parseJSON(Result.d);
                    if (data[0] != null) {
                        debugger;
                        $('#txtAppID').attr('style', 'border:2px solid green !important;');
                        $('#txtAppID').css({ "background-color": "#ffffff" });
                        $("#lblFullName").text(data[0]['ApplicantName']);
                        $("#lblDOB").text(data[0]['DOB']);
                        $("#lblEmailID").text(data[0]['emailID']);
                        $("#lblMobileNo").text(data[0]['ConvertedMobileNo']);
                        $("#HDNsField").val(data[0]['MobileNo']);
                        //$("#lblMobileNo").text("XXXXXX" + SmsNo.substring(6));
                        $("#lblPayment").text(data[0]['PaymentSTatus']);
                        $("#btnSubmit").prop("disabled", false);
                    }
                    else {
                        $("#txtAppID").val('');
                        $("#btnSubmit").prop("disabled", true);
                        $('#txtAppID').attr('style', 'border:2px solid red !important;');
                        $('#txtAppID').css({ "background-color": "#fff2ee" });
                        alertPopup("APPLICATION ID INFORMATION", "<BR> NO DATA FOUND!!! <BR> INVALID APPLICATION ID ENTERED!!!");
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
                $('#btnFetch').prop("disabled", true);
            }
            else {
                $('#txtAppID').prop("disabled", false);
                $('#btnFetch').prop("disabled", false);
            }
        }

        function diaplayOther() {
            if ($('#ComplaintType').val() == "0" || $('#ComplaintType').val() != "others") {
                $('#txtOthers').val('');
                $('#txtPaymentRef').val('');
                $('#divother').hide(800);
                $('#divPayment').hide(800);
            }
            if ($('#ComplaintType').val() == "Others") {
                $('#txtOthers').val('');
                $('#txtPaymentRef').val('');
                $('#divother').show(800);
            }
            if ($('#ComplaintType').val() == "033" || $('#ComplaintType').val() == "011" || $('#ComplaintType').val() == "022") {
                $('#txtOthers').val('');
                $('#txtPaymentRef').val('');
                $('#divother').hide(800);
                $('#divPayment').show(800);
                alertPopup("Information :", "<BR> 1. Please Enter Refrence No Received From Bank. <BR> 2.In Case You Have Multiple Refrence No, <BR>    Please Enter Refrence No Seperated With Comma(,)");
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
            debugger;
            var datavar = {

                'aadhaarNumber': uid,

                'AppName': $('#AppList option:selected').val(),
                'AppID': $('#txtAppID').val(),
                'FullName': $('#lblFullName').text(),
                'DOB': $('#lblDOB').text(),
                'EmailId': $('#lblEmailID').text(),
                'MobileNo': $('#lblMobileNo').text(),
                'PaymentStatus': $('#lblPayment').text(),
                'ComplaintType': $('#ComplaintType option:selected').text(),
                'ComplaintDetail': $('#ComplaintDetail').val(),
                'OtherType': $('#txtOthers').val(),
                'BankRefNo': $('#txtPaymentRef').val(),
                'SmsNo': $('#HDNsField').val(),

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
                    url: "/WebApp/Kiosk/OUAT/OUATComplaint.aspx/InsertComplaint",
                    data: JSON.stringify(obj, null, 4),
                    processData: false,
                    dataType: "json",
                    success: function (response) {

                    },
                    error: function (a, b, c) {
                        result = false;
                        alert("5." + a.responseText);
                    }
                })
                ).then(function (data, textStatus, jqXHR) {

                    var obj = jQuery.parseJSON(data.d);
                    var html = "";
                    AppID = obj.ComplaintID;
                    result = true;

                    if (result /*&& jqXHRData_IMG_result*/) {
                        alert("Complaint submitted successfully. Complaint ID : " + obj.AppID);
                        window.location.href = '/g2c/forms/index.aspx'
                    }

                });// end of Then function of main Data Insert Function

            return false;
        }

        function ValidateForm() {

            var text = "";
            var opt = "";

            var AppList = $("#AppList option:selected").text();
            var txtAppID = $('#txtAppID').val();
            var ComplaintType = $("#ComplaintType option:selected").val();
            var txtOthers = $('#txtOthers').val();
            var ComplaintDetail = $('#ComplaintDetail').val();


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

            if (ComplaintType == "Select Complaint" || ComplaintType == "0") {
                text += "<br /> Please Select Complaint Type";
                $('#ComplaintType').attr('style', 'border:1px solid red !important;');
                $('#ComplaintType').css({ "background-color": "#fff2ee" });
                opt = 1;
            }
            else {
                $('#ComplaintType').attr('style', 'border:1px solid #ddd !important;');
                $('#ComplaintType').css({ "background-color": "#ffffff" });
            }

            if (ComplaintType == "Others") {
                if (txtOthers == null || txtOthers == "") {
                    text += "<br /> Please Enter Other Complaint Type. ";
                    $('#txtOthers').attr('style', 'border:1px solid red !important;');
                    $('#txtOthers').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#txtOthers').attr('style', 'border:1px solid #ddd !important;');
                    $('#txtOthers').css({ "background-color": "#ffffff" });
                }
            }


            if ($('#ComplaintType').val() == "033" || $('#ComplaintType').val() == "011" || $('#ComplaintType').val() == "022") {
                if ($('#txtPaymentRef').val() == "" || $('#txtPaymentRef').val() == "") {
                    text += "<br /> Please Enter Bank Refrence Number. ";
                    $('#txtPaymentRef').attr('style', 'border:1px solid red !important;');
                    $('#txtPaymentRef').css({ "background-color": "#fff2ee" });
                    opt = 1;
                }
                else {
                    $('#txtPaymentRef').attr('style', 'border:1px solid #ddd !important;');
                    $('#txtPaymentRef').css({ "background-color": "#ffffff" });
                }
            }

            if (ComplaintDetail == null || ComplaintDetail == "") {
                text += "<br /> Please Enter Your Complaint In Detail. ";
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
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="mtop20"></div>
        <div class="col-lg-8 col-lg-push-2 box-container">
            <div class="box-heading">
                <h4 class="box-title">OUAT ONLINE COMPLAINT FORM</h4>
            </div>
            <div class="box-body box-body-open">
                <div class="form-group">
                    <div id="fillDtl" style="background-color: #dcdcdc; min-height: 80px; padding-top: 10px;">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
                            <label class="manadatory"><b>Application Type</b></label>
                            <select class="form-control" id="AppList" runat="server" onchange="selectApplication();">
                                <option value="0">Select</option>
                                <option value="403">OUAT FORM A</option>
                                <option value="409">OUAT AGRO FORM A</option>
                            </select>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-3">
                            <label class="manadatory"><b>Application ID</b></label>
                            <input id="txtAppID" class="form-control" placeholder="Application ID" name="FirstName" runat="server" onchange="AppIDValidation();" onkeypress="return isNumber(event);" />
                        </div>

                        <%--                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                            <label class="form-label"><b>Captcha Code<span style="color: red">*</span></b></label>
                                <img src="/Account/GetCaptcha" alt="verification code" />
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                            <label class="manadatory"><b>Enter Captcha</b></label>
                            <asp:TextBox MaxLength="6" ID="txtcaptcha" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>--%>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2 mtop22">
                            <button type="button" id="btnFetch" class="btn btn-primary" onclick="getAppDetail();">Fetch</button>
                            <%--<asp:Button ClientIDMode="Static" ID="btnFetch" CssClass="btn btn-primary" Text="Fetch" OnClientClick="getAppDetail();" runat="server" OnClick="btnFetch_Click"/>--%>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop20"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th><b>Name</b></th>
                                    <th><b>DOB</b></th>
                                    <th><b>Email ID</b></th>
                                    <th><b>Mobile</b></th>
                                    <th><b>Payment Status</b></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblFullName" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDOB" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblEmailID" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblMobileNo" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblPayment" runat="server" Font-Bold="True"></asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">
                        <label class="manadatory"><b>Complaint Type :</b></label>
                        <select class="form-control" id="ComplaintType" onchange="diaplayOther();">
                            <option value="0">Select Complaint</option>
                            <option value="033">Multiple Payment</option>
                            <option value="077">Issue While Printing</option>
                            <option value="066">Invalid login Id Password</option>
                            <option value="022">Double Payment status Unpaid</option>
                            <option value="011">Payment Deducted Status Unpaid</option>
                            <option value="088">Wrong entry which need to be edited</option>
                            <option value="055">Login Id Received Password not Received</option>
                            <option value="044">Both Log in Id and Password not received</option>
                            <option value="Others">Others</option>
                        </select>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4" id="divother">
                        <label><b>Mention Other :</b></label>
                        <input type="text" id="txtOthers" class="form-control" />
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-4" id="divPayment">
                        <label><b>Bank Refrence No. :</b></label>
                        <input type="text" id="txtPaymentRef" class="form-control" />
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop20"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <label class="manadatory"><b>Enter Your Complaint :</b></label>
                        <textarea rows="4" cols="50" class="col-lg-12 form-control" id="ComplaintDetail"> </textarea>
                    </div>
                    <div class="clearfix"></div>
                    <div class="mtop20"></div>
                    <div class="clearfix"></div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
                        <input type="button" id="btnSubmit" class="btn btn-success" value="Submit Complaint" onclick="SubmitData();" />
                    </div>
                    <div class="mtop20"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <asp:HiddenField ID="HDNsField" runat="server" />
    </div>
</asp:Content>
