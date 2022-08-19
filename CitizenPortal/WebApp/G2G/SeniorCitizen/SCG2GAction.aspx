<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SCG2GAction.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.SeniorCitizen.SCG2GAction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <script src="/Scripts/jquery-2.2.3.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <link href="../../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../bootstrap.min.css" rel="stylesheet" />
    <link href="../../Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/timeline.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="../../Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="../../Styles/style.admin.css" rel="stylesheet" />
    <link href="../../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Styles/sb-admin-2.css" rel="stylesheet" />
     <%--<script src="/Scripts/jquery.msgBox.js"></script>--%>
    <link href="/PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <%--<script src="/Scripts/fileupload/vendor/jquery.ui.widget.js"></script>
    <script src="/Scripts/fileupload/jquery.iframe-transport.js"></script>
    <script src="/Scripts/fileupload/jquery.fileupload.js"></script>--%>
    <%--<script src="SeniorCitizen.js"></script>--%>
    <%--<script src="/PortalScripts/ServiceLanguage.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>--%>
   
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
      <script src="/WebApp/G2G/SeniorCitizen/SeniorCitizenAction.js?v=<%=CitizenPortal.Common.GlobalValues.JSVersion%>"></script>
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
    </style>

    <script>
        $(document).ready(function () {
            debugger;
            var t_URL = "";
            var t_AppID = "", t_ServiceID = "";
            t_AppID = $("#HFAppID").val();
            t_ServiceID = $("#HFServiceID").val();
            t_URL = $("#HFAckURL").val();
            CheckedCheckbox($("#HdfCheckBox").val())
            ////t_URL = "../Kiosk/Forms/SeniorCitizenPramaanapatra.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            //if (t_ServiceID == '101') {
            //    t_URL = "../Common/HTML2PDF/HTMLToPDF.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            //} else if (t_ServiceID == '103')
            //{ t_URL = "../Kiosk/Birth/Preview.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID; }
            //else if (t_ServiceID == '104') {
            //    t_URL = "../Kiosk/Death/Preview.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            //}
            //else if (t_ServiceID == '105') {
            //    t_URL = "../Kiosk/NFBS/Acknowledgement.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            //}
            ////t_URL = "../Common/HTML2PDF/HTMLToPDF.aspx" + "?SvcID=" + t_ServiceID + "&AppID=" + t_AppID;
            
            
          
            loadIframe("FrameURL", t_URL);


            $('input[type="checkbox"]').click(function (event) {
                debugger;
                var id = $(this).attr("ID");//CheckBox_0
                var CheckDoc = $("input[name='CHKYES']:checked").val();
                if (CheckDoc != "Yes") {
                    if (this.checked) {
                        alert("Please Click on View to verify the document");
                        event.preventDefault();
                        

                        if (CheckDoc == null || CheckDoc == "undefined") {
                            $('#pnlDocs').attr('style', 'color:red !important;');
                            $('#pnlDocs').css({ "color": "red !important;" });
                            opt = 1;
                        } else {
                            $('#pnlDocs').attr('style', 'color:#fff !important;');
                            $('#pnlDocs').css({ "color": "#fff " });
                        }
                    }
                }
                else {
                    if (id == "CHKY1" | id == "CHKY2" | id == "CHKY3" | id == "CHKY4" | id == "CHKY5") {
                                                    
                            
                    }
                    else
                    {
                        if (this.checked) {
                            alert("Please Click on View to verify the document");
                            event.preventDefault();
                           
                            if (CheckDoc == null || CheckDoc == "undefined") {
                                $('#pnlDocs').attr('style', 'color:red !important;');
                                $('#pnlDocs').css({ "color": "red !important;" });
                                opt = 1;
                            } else {
                                $('#pnlDocs').attr('style', 'color:#fff !important;');
                                $('#pnlDocs').css({ "color": "#fff " });
                            }
                        }
                    }
                }
                
            });

        });
        //disable checkbox
        function DisableCheckbox() {
           
            $("input[name='RBTN']").prop("disabled", true);
            $("input[name='RBTN1']").prop("disabled", true);
            $("input[name='RBTN2']").prop("disabled", true);
            $("input[name='RBTN3']").prop("disabled", true);
            $("input[name='RBTN4']").prop("disabled", true);
        }
        //checked check box list
        function CheckedCheckbox(CHKY) {
            debugger;
            var str = CHKY;
            var arr = str.split(',');

            //for (var i = 0, len = arr.length; i < len; i++) {
            //    arr[i] = str.indexOf(arr[i]);
            //}

            if (arr[0] == "true") {
                $('#RBTNY').prop('checked', true);
            }
            if (arr[0] == "false") {
                $('#RBTNN').prop('checked', true);
            }
            //--------------
            if (arr[1] == "true") {
                $('#RBTNY1').prop('checked', true);
            }
            if (arr[1] == "false") {
                $('#RBTNN1').prop('checked', true);
            }
            //-----------------
            if (arr[2] == "true") {
                $('#RBTNY2').prop('checked', true);
            }
            if (arr[2] == "false") {
                $('#RBTNN2').prop('checked', true);
            }
            //------------------
            if (arr[3] == "true") {
                $('#RBTNY3').prop('checked', true);
            }
            if (arr[3] == "false") {
                $('#RBTNN3').prop('checked', true);
            }
            //----------------
            if (arr[4] == "true") {
                $('#RBTNY4').prop('checked', true);[]
            }
            if (arr[4] == "false") {
                $('#RBTNN4').prop('checked', true);
            }

        }
        function loadIframe(iframeName, url) {
            var $iframe = $('#' + iframeName);
            if ($iframe.length) {
                $iframe.attr('src', url);
                return false;
            }
            return true;
        }

        function ExecuteAction(StageID, ActionID) {
            debugger;
            var t_Remarks = $('#txtRemark').val();
            var CheckDoc = $("input[name='CHKYES']:checked").val();
            if ($("#hdnChkCount").val() != $("#hdnDSCount").val()) {
                alert('Please verify all Documents to continue.');
               
                   if (CheckDoc == null || CheckDoc == "undefined") {
                            $('#pnlDocs').attr('style', 'color:red !important;');
                            $('#pnlDocs').css({ "color": "red !important;" });
                            opt = 1;
                        } else {
                            $('#pnlDocs').attr('style', 'color:#fff !important;');
                            $('#pnlDocs').css({ "color": "#fff " });
                        }
                   $('#pnlDocs').focus();
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

        function ViewDoc(path, checkBox) {

            var chkBox = document.getElementById(checkBox);

            var t_Cnt = $("#hdnChkCount").val();

            if (t_Cnt == null || t_Cnt == "") t_Cnt = 0;

            if (chkBox.checked) {

            } else {
                t_Cnt = parseInt(t_Cnt) + 1;

                $("#hdnChkCount").val(t_Cnt);
                chkBox.checked = true;

            }
           
            var t_URL = ResolveUrl(path);
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
            $(dialog).dialog({ width: '750', height: '600' });

        }

        function Count(p_Control) {
            
        }

        function ViewOutput() {
            var t_URL = "";
            var t_AppID = "", t_ServiceID = "";
            t_AppID = $("#HFAppID").val();
            t_ServiceID = $("#HFServiceID").val();
            t_URL = "/WebApp/Kiosk/RD/SeniorCitizenIDCard.aspx?";
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
            <div class="row" id="divServiceDeliveryDetails" runat="server">
                <div class="col-md-12 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Service Delivery Details 
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead>
                                        <tr>                                            
                                            <th scope="col">Service name</th>
                                            <th scope="col">Time Limit</th>
                                            <th scope="col">Designated Officer</th>
                                            <th scope="col">Appellate Authority</th>
                                            <th scope="col">Revisional Appellate Authority</th>
                                            <th scope="col">Application Date</th>
                                            <th scope="col">Expected Delivery Date</th>
                                            <%--<th scope="col">Status</th>--%>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>                                            
                                            <td><asp:Label ID="lblServiceName" runat="server"></asp:Label></td>
                                            <td><asp:Label ID="lblTimeLimit" runat="server"></asp:Label></td>
                                            <td><asp:Label ID="lblDesignatedOfficer" runat="server"></asp:Label></td>
                                            <td><asp:Label ID="lblAppellateAuthority" runat="server"></asp:Label></td>
                                            <td><asp:Label ID="lblRevisionalAuthority" runat="server"></asp:Label></td>
                                            <td><asp:Label ID="lblCreatedOn" runat="server"></asp:Label></td>
                                            <td><asp:Label ID="lblDeliveryDate" runat="server"></asp:Label></td>
                                            <%--<td>Pending</td>--%>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="clearfix">
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-md-8 box-container mTop15">
                    <div class="box-heading">
                        <h4 class="box-title">Application Details
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <iframe id="FrameURL" scrolling="yes" width="845"
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
                        <h4 class="box-title">Check List
                        </h4>
                    </div>
                    <div class="box-body box-body-open">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                            
                            <table class="table table-striped table-bordered table-hover dataTable no-footer' style='margin-bottom: 0;">
                               <tbody>
                                <tr>
                                   <%-- <th>S.No.</th>--%>
                                    <th style="width:35%;">Action</th>
                                    <th>Name Of Check List Item</th>
                                </tr>
                                <tr>
                                    <%--<td>1</td>--%>
                                    <td>
                                      
                                       <%-- <input type="checkbox" name="CHKYES" id="CHKY1" value="Yes" onclick="SubmitData();" />--%>
                                      <span><input type="radio" name="RBTN" id="RBTNY" value="Yes" onclick="SubmitData();" />Yes </span>
                                        <span class="ml10"><input type="radio" name="RBTN" id="RBTNN" value="No" onclick="SubmitData();" />No </span>
                                    </td>
                                    <td>Photograph Verification</td>
                                </tr>
                                    <tr>
                                   <%-- <td>2</td>--%>
                                    <td>           
                                       <%-- <input type="checkbox" name="CHKYES" id="CHKY2" value="Yes" onclick="SubmitData();" />  --%>                          
                                        <span><input type="radio" name="RBTN1" id="RBTNY1" value="Yes" onclick="SubmitData();" />Yes </span>
                                        <span class="ml10"><input type="radio" name="RBTN1" id="RBTNN1" value="No" onclick="SubmitData();" />No </span>
                                    </td>
                                    <td>Present Address Verification</td>
                                </tr>
                                   <tr>
                                 <%--   <td>3</td>--%>
                                    <td>           
                                      <%--  <input type="checkbox" name="CHKYES" id="CHKY3" value="Yes" onclick="SubmitData();" />--%>                             
                                        <span><input type="radio" name="RBTN2" id="RBTNY2" value="Yes" onclick="SubmitData();" />Yes </span>
                                        <span class="ml10"><input type="radio" name="RBTN2" id="RBTNN2" value="No" onclick="SubmitData();" />No </span>
                                    </td>
                                    <td>Verification with Original Aadhar</td>
                                </tr>
                                    <tr>
                                  <%--  <td>4</td>--%>
                                    <td>          
                                       <%-- <input type="checkbox" name="CHKYES" id="CHKY4" value="Yes" onclick="SubmitData();" />  --%>                           
                                        <span><input type="radio" name="RBTN3" id="RBTNY3" value="Yes" onclick="SubmitData();" />Yes </span>
                                        <span class="ml10"><input type="radio" name="RBTN3" id="RBTNN3" value="No" onclick="SubmitData();" />No </span>
                                    </td>
                                    <td>Mobile No Verification</td>
                                </tr>
                                    <tr>
                                   <%-- <td>5</td>--%>
                                    <td>       
                                        <%--<input type="checkbox" name="CHKYES" id="CHKY5" value="Yes" onclick="SubmitData();" />--%>                                
                                        <span><input type="radio" name="RBTN4" id="RBTNY4" value="Yes" onclick="SubmitData();" />Yes </span>
                                        <span class="ml10"><input type="radio" name="RBTN4" id="RBTNN4" value="No" onclick="SubmitData();" />No </span>
                                    </td>
                                    <td>Content of the Application are checked and found to be correct</td> <%--If Involved in any Criminal Case--%>
                                </tr>
                            </tbody>
                            </table>
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
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-8">
                             <asp:Panel ID="pnlG2GDocs" runat="server" />
                            <div id="divReport" runat="server">

                                <div style="color: darkred; margin-bottom: 5px">
                                    <span>Note: Only <b>.Jpeg</b>, <b>.Jpg</b> and <b>.pdf</b> files are allowed to upload !
                                        <br />
                                        File should not be greater than 200 KB ! </span>
                                </div>
                                <div runat="server" class="danger error bg-warning" id="divErr">
                                </div>
                                
                                <div id="divReportGeneral" runat="server">
                                <asp:Label ID="lblReport" runat="server" Text="Inquiry Report" Visible="true"></asp:Label>
                                <asp:FileUpload ID="fuReport" runat="server" class="" />
                                <asp:ImageButton ID="btnUpload" runat="server" ImageUrl="~/WebApp/Kiosk/Images/upload.png" Height="50px" Width="50px" ToolTip="Click to upload the file"
                                    Text="Upload" OnClick="btnUpload_Click" Visible="False"></asp:ImageButton>
                                <br />
                                </div>
                                <div id="divReportFisheries" runat="server">
                                <asp:Label ID="Label3" runat="server" Text="Detailed Project Report" Visible="true"></asp:Label>
                                <asp:FileUpload ID="FU_DOC998" runat="server" class="" />
                                <asp:ImageButton ID="ImageButton_DOC998" runat="server" ImageUrl="~/WebApp/Kiosk/Images/upload.png" Height="50px" Width="50px" ToolTip="Click to upload the file"
                                    Text="Upload" OnClick="ImageButton_DOC998_Click" Visible="False"></asp:ImageButton>
                                <br />
                                
                                <asp:Label ID="Label4" runat="server" Text="Project Report" Visible="true"></asp:Label>
                                <asp:FileUpload ID="FU_DOC997" runat="server" class="" />
                                <asp:ImageButton ID="ImageButton_DOC997" runat="server" ImageUrl="~/WebApp/Kiosk/Images/upload.png" Height="50px" Width="50px" ToolTip="Click to upload the file"
                                    Text="Upload" Visible="False"></asp:ImageButton>
                                <br />
                                
                                <asp:Label ID="Label5" runat="server" Text="Feasibility Report" Visible="true"></asp:Label>
                                <asp:FileUpload ID="FU_DOC996" runat="server" class="" />
                                <asp:ImageButton ID="ImageButton_DOC996" runat="server" ImageUrl="~/WebApp/Kiosk/Images/upload.png" Height="50px" Width="50px" ToolTip="Click to upload the file"
                                    Text="Upload" Visible="False"></asp:ImageButton>
                                </div>

                            </div>
                            <asp:Label ID="Label1" runat="server" Text="Note" CssClass="manadatory "></asp:Label>
                            <textarea runat="server" name="txtRemark" rows="2" cols="20" id="txtRemark" placeholder="Enter Remark" class="form-control" onkeyup="javascript:Count(this);" onchange="javascript:Count(this);">
                    </textarea>
                            <span id="rfvRemark" class="errorMSG" style="display: none">Please Enter Note</span>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <asp:Label ID="Label2" runat="server" Text=" " CssClass=" "></asp:Label>
                            <div class="text-left">
                                <asp:Panel ID="pnlActions" runat="server"></asp:Panel>
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
        <asp:HiddenField ID="HdfCheckBox" runat="server" />
       
    </form>
</body>
</html>
