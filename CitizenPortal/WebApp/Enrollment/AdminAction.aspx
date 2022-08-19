<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAction.aspx.cs" Inherits="CitizenPortal.WebApp.Enrollment.AdminAction" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="/WebApp/Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="/WebApp/Styles/style.admin.css" rel="stylesheet" />
    <link href="/WebApp/bootstrap.min.css" rel="stylesheet" />
    <link href="/WebApp/Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="/WebApp/Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="/WebApp/Styles/timeline.css" rel="stylesheet" />
    <link href="/WebApp/Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="/WebApp/Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="/WebApp/Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="/WebApp/Styles/style.admin.css" rel="stylesheet" />
    <link href="/WebApp/Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="/WebApp/Styles/sb-admin-2.css" rel="stylesheet" />

    <style type="text/css">
        .divError {
            font-family: Arial;
            font-size: 20px;
            text-align: center;
            margin: 10px auto;
        }

            .divError img {
                float: left;
                width: 50px;
                margin: 0 20px 0 10px;
            }

            .divError div {
                float: left;
                color: red;
                font-size: .8em;
            }

            .divError h1 {
                float: left;
                margin: 0;
                padding: 0;
                font-size: .9em;
                color: maroon;
            }

        .info, .success, .warning, .error, .validation {
            /*border: 1px solid;*/
            margin: 10px 0px;
            padding: 15px 10px 15px 15px;
            background-repeat: no-repeat;
            background-position: 10px left;
            text-align: left;
            font: 13px Tahoma,sans-serif;
        }

        .success {
            color: #4F8A10;
            background-color: #DFF2BF;
        }

        .error {
            color: #D8000C;
            background-color: #FFBABA;
        }

        .flwrapper {
            border: 1px solid red;
        }

        .fllable {
            float: left;
        }

        .flupload {
            float: left;
        }

        .flbutton {
            float: left;
        }
    </style>

    <script>
        $(document).ready(function () {
            var t_URL = "";
            var t_AppID = "", t_ServiceID = "";
            t_AppID = $("#HFAppID").val();
            t_ServiceID = $("#HFServiceID").val();
            t_URL = $("#HFAckURL").val();
            
            loadIframe("FrameURL", t_URL);


            $('input[type="checkbox"]').click(function (event) {
                if (this.checked) {
                    alert("Please Click on View to verify the document");
                    event.preventDefault();
                }
            });

        });

        function loadIframe(iframeName, url) {
            var $iframe = $('#' + iframeName);
            if ($iframe.length) {
                $iframe.attr('src', url);
                return false;
            }
            return true;
        }

        function ExecuteAction(StageID, ActionID) {
            var t_Remarks = $('#txtRemark').val();

            if ($("#hdnChkCount").val() != $("#hdnDSCount").val()) {
                alert('Please verify all Documents to continue.');
                return false;
            }


            if (t_Remarks == "") {
                alert('Please Enter Note to continue.');
                return false;
            }

            $('#HFStageID').val(StageID);
            $('#HFActionID').val(ActionID);
            return true;
        }


        function ExecuteAction_SentBack(StageID, ActionID) {
            var t_Remarks = $('#txtRemark').val();

            if (t_Remarks == "") {
                alert('Please Enter Note to continue.');
                return false;
            }

            $('#HFStageID').val(StageID);
            $('#HFActionID').val(ActionID);
            $('#HFSentBack').val("1");
            return true;
        }

        function ExecuteAction_Approve(StageID, ActionID) {
            var t_Remarks = $('#txtRemark').val();

            if (t_Remarks == "") {
                $('#txtRemark').val("Application Approved by Authority.");
            }

            $('#HFStageID').val(StageID);
            $('#HFActionID').val(ActionID);
            $('#HFApprove').val("1");
            return true;
        }

        function ExecuteAction_DigiSign(StageID, ActionID) {
            var t_Remarks = $('#txtRemark').val();

            if (t_Remarks == "") {
                $('#txtRemark').val("Application Approved by Authority.");
            }

            $('#HFStageID').val(StageID);
            $('#HFActionID').val(ActionID);
            $('#HFDigiSign').val("1");
            return true;
        }

        function ExecuteAction_Reject(StageID, ActionID) {
            var t_Remarks = $('#txtRemark').val();

            if (t_Remarks == "") {
                alert('Please Enter Note to continue.');
                return false;
            }

            $('#HFStageID').val(StageID);
            $('#HFActionID').val(ActionID);
            $('#HFReject').val("1");
            return true;
        }

        function TestCode(path, checkBox) {
            alert('Hello');
        }

        function ViewDoc(docid, checkBox) {
            debugger;
            var t_Cnt = $("#hdnChkCount").val();

            if (t_Cnt == null || t_Cnt == "") t_Cnt = 0;

            t_Cnt = parseInt(t_Cnt) + 1;

            $("#hdnChkCount").val(t_Cnt);

            var chkBox = document.getElementById(checkBox);
            chkBox.checked = true;


            //var t_URL = ResolveUrl(path);
            var t_URL = '/WebApp/Kiosk/Forms/Download.aspx?file=' + docid;
            //window.open("//" + path);
            //window.open(t_URL);
            CreateDialog(t_URL, "");
        }


        var baseUrl = "<%= Page.ResolveUrl("~/") %>";

        function ResolveUrl(url) {
            if (url.indexOf("~/") == 0) {
                url = baseUrl + url.substring(2);
            }
            return url;
        }


        function CheckDocuments(btnID) {
            debugger;
            var cnt = document.getElementById("hdnDSCount").value;
            if (cnt > 0) {
                for (i = 0; i < cnt; i++) {
                    if (document.getElementById('CheckBox_' + i).checked == false) {
                        var langid = document.getElementById("hdnLangID").value;
                        if (langid == 2) {
                            alert("कृपया सर्व दस्तऐवज तपासा.");
                            return false;
                        }
                        else {
                            alert("Please Check All Documents.");
                            return false;
                        }
                    };
                }
            }


            return true;


        }

        function DisableUnchecked() {

            var cnt = document.getElementById("hdnDSCount").value;
            if (cnt > 0) {
                for (i = 0; i < cnt; i++) {
                    if (document.getElementById('CheckBox_' + i).checked == false) {
                        document.getElementById('CheckBox_' + i).disabled = true;
                    };
                }
            }
        }

        function CheckBoxCheck(chkB) {

            var chkBox = document.getElementById('CheckBox_' + chkB);
            chkBox.checked = true;
            chkBox.disabled = false;
            //chkBox.disabled = true; 
        }

        function CountCheck() {

            var Count = document.getElementById("hdnChkCount").value;
            if (Count == "") {
                Count = 0;
            }
            var dsCnt = document.getElementById("hdnDSCount").value;
            if (dsCnt > 0) {
                for (i = 0; i < dsCnt; i++) {
                    if (document.getElementById('CheckBox_' + i).checked == true) {
                        Count = parseInt(Count) + 1;
                    };
                }
            }
            document.getElementById("hdnChkCount").value = Count;
        }

        function CheckCount(chkID) {
            //var cnt = document.getElementById("hdnDSCount").value;
            //var count = document.getElementById("hdnChkCount").value;
            //var buttonId = document.getElementById("hdnButtonID").value;
            //var chkb = document.getElementById(chkID);

            //if (chkb.checked) {
            //    chkb.checked = false;
            //}
            //else {

            //    //                if (count == cnt) {
            //    //                    chkb.checked = true;
            //    //                    //document.getElementById(buttonId).disabled = false;
            //    //                }
            //    //                else {
            //    //                    chkb.checked = false;
            //    //                    //document.getElementById(buttonId).disabled = true;
            //    //                }
            //}
            //DisableUnchecked();
        }

        function CreateDialog(src, FileName) {
            var dialog = '<div  title="' + FileName + '" style="overflow:hidden;">';
            dialog += '<iframe  src="' + src + '" height="100%" width="100%"></iframe>';
            dialog += '</div>';
            console.log(dialog);
            $(dialog).dialog({ width: '890', height: '600' });

        }

        function ViewOutput() {
            var t_URL = "";
            var t_AppID = "", t_ServiceID = "";
            t_AppID = $("#HFAppID").val();
            t_ServiceID = $("#HFServiceID").val();

            if (t_ServiceID == "440") {
                t_URL = "/WebApp/Kiosk/CTCSU/TransferCertificateSU.aspx?";
            } else if (t_ServiceID == "441") {
                t_URL = "/WebApp/Kiosk/DegreeSU/DegreeCertificate.aspx?";
            } else if (t_ServiceID == "445") {
                t_URL = "/WebApp/Kiosk/RegistrationReceiptSU/RegistrationReceipt.aspx?";
            } else if (t_ServiceID == "446") {
                t_URL = "/WebApp/Kiosk/MigrationSU/MigrationCertificateSU.aspx?";
            } else if (t_ServiceID == "447") {
                t_URL = "/WebApp/Kiosk/ProvisionalSU/ProvisionalCertificate.aspx?";
            } else if (t_ServiceID == "448") {
                t_URL = "/WebApp/Kiosk/VerificationSU/CertificateVerification.aspx?";
            } else if (t_ServiceID == "442") {
                t_URL = "/WebApp/Kiosk/AnswerSheet/AnswerScript.aspx?";
            } else if (t_ServiceID == "443") {
                t_URL = "/WebApp/Kiosk/Graduate/GraduateCertificate.aspx?";
            } else if (t_ServiceID == "449") {
                t_URL = "/WebApp/Kiosk/CBCS/Acknowledgement.aspx?";
            } else if (t_ServiceID == "1467") {
                t_URL = "/WebApp/Enrollment/Acknowledgement.aspx?";
            }

            t_URL = t_URL + "SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            t_URL = ResolveUrl(t_URL);
            CreateDialog(t_URL, "");
            //window.location.href = t_URL;
            //return true;
        }


    </script>
    <style type="text/css">
        #page-iframe {
            position: inherit;
            margin: 50px auto 50px;
            padding: 0 30px;
            border-left: 1px solid #e7e7e7;
        }

        .well {
            margin: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page-iframe" style="min-height: 500px !important;">

            <div class="row">
                <div class="col-md-8 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Application Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <iframe id="FrameURL" scrolling="yes" width="800"
                            src="" height="550" frameborder="0"></iframe>

                    </div>
                </div>
                <div class="col-md-4 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Supporting Documents
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <asp:Panel ID="pnlDocs" runat="server" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>

                </div>
                <div class="col-md-4 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Comments / Action History 
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <asp:Panel ID="pnlRemarks" runat="server" />
                        </div>
                        <div class="clearfix">
                        </div>
                    </div>

                </div>


            </div>
            <div class="row">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Action 
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-2">
                            <asp:Label ID="Label3" runat="server" Text="Action Type" CssClass="manadatory "></asp:Label>
                            <asp:DropDownList name="ddlEntrance" ID="ddlEntrance" CssClass="form-control" runat="server">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="A">Approved</asp:ListItem>
                                <asp:ListItem Value="R">Rejected</asp:ListItem>
                            </asp:DropDownList>
                            <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlEntrance" InitialValue="0" Display="Dynamic"
                                        ErrorMessage="Please select Action type" ValidationGroup="G" ForeColor="Red" />
                            <span id="rfvEntrance" class="errorMSG" style="display: none">Please select Action Type</span>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-6">
                            <asp:Panel ID="pnlG2GDocs" runat="server" />
                            <asp:Label ID="Label1" runat="server" Text="Remark" CssClass="manadatory "></asp:Label>
                            <asp:TextBox ID="txtRemark" runat="server" Text="Remark" CssClass="form-control" placeholder="Enter Remark" onkeyup="javascript:Count(this);" onchange="javascript:Count(this);"></asp:TextBox>
                            <%--<textarea runat="server" name="txtRemark1" rows="1" cols="20" id=""  class="form-control" ></textarea>--%>
                            <span id="rfvRemark" class="errorMSG" style="display: none">Please Enter Note</span>
                            <br/><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRemark" Display="Dynamic"
                                        ErrorMessage="Please enter Remark" ValidationGroup="G" ForeColor="Red" />
                        </div>
                        
                        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                            <asp:Label ID="Label2" runat="server" Text=" " CssClass=" ">&nbsp;&nbsp;&nbsp;</asp:Label>
                            <div class="text-left">
                                <asp:Button ID="btnApproved" runat="server" Text="Submit" CssClass="btn btn-outline btn-danger" OnClick="btnApproved_Click" ValidationGroup="G"/>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:Button ID="Button1" runat="server" Text="Close" CssClass="btn btn-danger" />
                                <asp:Panel ID="pnlActions" runat="server" Visible="false"></asp:Panel>
                                
                            </div>

                        </div>
        <div class="clearfix">
        </div>
        </div>

                </div>
            </div>
        </div>
        <asp:HiddenField ID="HFAppID" runat="server" />
        <asp:HiddenField ID="HFServiceID" runat="server" />
        <asp:HiddenField ID="HFStageID" runat="server" />
        <asp:HiddenField ID="HFActionID" runat="server" />
        <asp:HiddenField ID="HFApprove" runat="server" />
        <asp:HiddenField ID="HFDigiSign" runat="server" />
        <asp:HiddenField ID="HFReject" runat="server" />
        <asp:HiddenField ID="HFAckURL" runat="server" />
        <asp:HiddenField ID="hdnChkCount" runat="server" />
        <asp:HiddenField ID="hdnDSCount" runat="server" />
        <asp:HiddenField ID="HFSentBack" runat="server" />

    </form>
</body>
</html>
