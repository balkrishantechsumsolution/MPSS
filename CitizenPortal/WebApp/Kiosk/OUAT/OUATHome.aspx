<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="OUATHome.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.OUAT.OUATHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../../Scripts/jquery-2.2.3.min.js"></script>
    <link href="../../Styles/easy-responsive-tabs.css" rel="stylesheet" />
    <script src="../../Scripts/easyResponsiveTabs.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>
    <script type="text/javascript">


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

        function RedirectToService(p_URL) {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];

            window.open(p_URL + "?SvcID=" + SvcID + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
            return false;
        }

        function MakePayment() {
            //alert('Payment details can be upload after 24 hours from the time of making of payment');
            //return false;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/OUATPayment.aspx?SvcID=" + SvcID;
            if (AppID == "083000020946" || AppID == "406000005934" || AppID == "382000001419" || AppID == "172000001615") {
                window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                               ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');

            }
        }

        function ViewApplication() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "";
            if (SvcID == "403") {
                p_URL = "/WebApp/Kiosk/OUAT/Acknowledgement.aspx?SvcID=403";

            }
            else if (SvcID == "409") {
                p_URL = "/WebApp/Kiosk/OUAT/AgroFormAcknowledgement.aspx?SvcID=409";

            }
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function ViewFormBApplication() {

            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var p_URL = "";
            p_URL = "/WebApp/Kiosk/OUAT/FormBAcknowledgement.aspx?SvcID=405";

            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');

        }

        function ViewAgroFormBApplication() {

            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var p_URL = "";
            p_URL = "/WebApp/Kiosk/OUAT/AgroFormBAcknowledgement.aspx?SvcID=428";

            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');

        }

        function EditApplication() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "";
            if (SvcID == "403") {
                p_URL = "/WebApp/Kiosk/OUAT/FormA.aspx?SvcID=403";

            }
            else if (SvcID == "409") {
                p_URL = "/WebApp/Kiosk/OUAT/AgroFormA.aspx?SvcID=409";

            }
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function DownloadPass() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/AdmitCard.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function DownloadAgro() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/AgroAdmitCard.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }


        //function EventScore() {
        //    var qs = getQueryStrings();
        //    var UID = qs["UID"];
        //    var AppID = qs["AppID"];            
        //    var p_URL = "/WebApp/Kiosk/OISF/MarkSheet.aspx?SvcID=388";
        //    window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
        //                   ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        //}

        function OuatRefund() {
            debugger;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = '/WebApp/Kiosk/ReFundPayment/RefundPayment.aspx?SvcID=' + SvcID + '&AppID=' + AppID + '&UID=' + UID;
            window.open(p_URL);
        }


        function ConfirmPayment() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + SvcID;

            if (AppID == "083000020946" || AppID == "406000005934" || AppID == "382000001419" || AppID == "172000001615") {
                window.location.href = p_URL + "&UID=" + UID + "&AppID=" + AppID;

            }

            //window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
            //               ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        $(document).ready(function () {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            //if (AppID == "416000004427") {
            //    $("#div1").show();

            //}
        });

        function ApplyFormB() {
            //alert('Applicable after Entrance Exam, only if the candidate has appeared.')
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/FormB.aspx?SvcID=" + SvcID;

            // window.location.href = p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }
        function MarksEntry() {
            //alert('Applicable after Entrance Exam, only if the candidate has appeared.')
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/UGMarksEntry.aspx?SvcID=" + SvcID;

            // window.location.href = p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function Edit10thPercentage() {
            debugger;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/10THMarksEntry.aspx?SvcID=" + SvcID;

            // window.location.href = p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID + "&FormBAppID=" + FormBAppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }
        function Edit12thPercentage() {
            //alert('Applicable after Entrance Exam, only if the candidate has appeared.')
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/12THMarksEntry.aspx?SvcID=" + SvcID;

            // window.location.href = p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID + "&FormBAppID=" + FormBAppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function ApplyAgroFormB() {
            //alert('Applicable after Entrance Exam, only if the candidate has appeared.')
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];

            //AppID = "180000061";
            //UID = "mohan.kumar";
            SvcID = "428";

            var p_URL = "/WebApp/Kiosk/OUAT/AgroFormB.aspx?SvcID=" + SvcID;

            // window.location.href = p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID + "&ProfileID=" + UID,
                ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        //UploadSEBC
        function UploadDocument() {
            //alert('Payment details can be upload after 24 hours from the time of making of payment');
            //return false;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var p_URL = "/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=428";
            window.open(p_URL + "&UID=" + UID + "&AppID=" + FormBAppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function UploadCustomDocument() {
            //alert('Payment details can be upload after 24 hours from the time of making of payment');
            //return false;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var p_URL = "/WebApp/Kiosk/OISF/CustomAttachment.aspx?SvcID=405";
            window.open(p_URL + "&UID=" + UID + "&AppID=" + FormBAppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function ProvisionalMarks() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/ProvisionalMark.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }


        function ProvisionalMarksAgro() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/AgroProvisionalMarks.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function ShowRankCard() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/RankCard.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function ShowAgroRankCard() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/AgroRankCard.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function OUATSpotAdmission() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/SpotAdmission.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function OUATSpotRank() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/OUAT/SpotAdmissionRank.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

    </script>

    <style type="text/css">
        #container {
            width: 100%;
        }

        @media only screen and (max-width: 768px) {
            #container {
                width: 100%;
                margin: 0 auto;
            }
        }

        .SrvDiv {
            background-color: #fff;
            border: solid 1px #ddd;
            color: #045abc;
            width: 47.1%;
            margin: .5%;
            float: left;
            padding: .5%;
            overflow: auto;
            font-size: 18px;
            border-radius: 5px;
            border-left: solid 5px #438bc8;
        }

            .SrvDiv a {
                color: #000;
                font-size: .9em;
                text-decoration: none;
                font-weight: bold;
            }

                .SrvDiv a:hover {
                    color: #5AB1D0;
                    font-size: .9em;
                    text-decoration: none;
                    font-weight: bolder;
                }

            .SrvDiv img {
                margin-right: 10px;
                border: none;
            }

            .SrvDiv span {
                line-height: 20px;
                margin: 10px 0 0 0;
                color: #767676;
                font-size: .65em;
            }

        #parentHorizontalTab {
            margin: 0 10px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div ng-controller="ctrl">
        <div id="page-wrapper" style="min-height: 500px !important;">
            <div class="row">
                <div class="col-lg-12">
                </div>
            </div>


            <div class="resp-tabs-container ver_1">
                <div style="margin-top: 20px;">
                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="101">
                        <a href="#" onclick="javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ViewApplication();">VIEW Application Form-A</a>
                        <br />
                        <span>View  & Print Form-A Application</span>

                    </div>
                    <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="101">
                        <a href="#" onclick="javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return EditApplication();">Edit Application</a>
                        <br />
                        <span>Edit Application</span>

                    </div>
                    <div style="min-height: 4.66em; z-index: -760; display: none" class="SrvDiv" id="102">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return RedirectToService('/WebApp/Kiosk/OUAT/AcknowledgeHistory.aspx');">VIEW ACKNOWLEDGE DETAILS</a>
                        <br />
                        <span>View the acknowledge details sent by department</span>

                    </div>
                    <div runat="server" id="divPayment">
                        <div style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" id="103">
                            <a href="#" onclick="javascript:return ConfirmPayment();">
                                <img src="/webapp/kiosk/Images/csc_logo.png" alt="" align="left" style="height: 50px; margin-top: 9px;" />
                            </a><a href="#" onclick="javascript:return ConfirmPayment();">MAKE PAYMENT</a>
                            <br />
                            <span>Make Payment either through Online Payment or CSC Center</span>

                        </div>
                        <div style="min-height: 4.66em; z-index: -760; display: none" class="SrvDiv" id="104">
                            <a href="#">
                                <img src="/webapp/kiosk/Images/sbi_logo.png" alt="" align="left" style="height: 70px;" />
                            </a><a href="#" onclick="javascript:return MakePayment();">UPDATE PAYMENT DETAILS</a>
                            <br />
                            <span>Update the payment DUNo. of SBI-Connect</span>

                        </div>
                    </div>
                    <div runat="server" id="divPass" style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return DownloadPass();">Download Admit Card for OUAT CEE - 2017</a>
                        <br />
                        <span>Download / Print Admit Card UG COURSE PROGRAMME</span>

                    </div>
                    <div runat="server" visible="false" id="divAgro" style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return DownloadAgro();">Download Admit Card for OUAT CEE - 2017 (Agro-Polytechnic)</a>
                        <br />
                        <span>Download / Print Admit Card UG COURSE PROGRAMME for Agro-Polytechnic Student</span>

                    </div>
                    <div runat="server" id="divFormBold" style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ApplyFormB();">Submission of Online Application FORM-B</a>
                        <br />
                        <span>To be filled after Entrance Exam</span>

                    </div>

                    <div runat="server" id="divAgroFormB" style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ApplyAgroFormB();">Submission of Online Application Agro FORM-B</a>
                        <br />
                        <span>To be filled after Entrance Exam</span>
                    </div>

                    <div id="divFormBAck" style="min-height: 4.66em; z-index: -760;" class="SrvDiv" runat="server">
                        <a href="#" onclick="javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ViewFormBApplication();">VIEW Application Form-B</a>
                        <br />
                        <span>View  & Print Form-B Application</span>

                    </div>
                    <div id="divAckAgroFromB" style="min-height: 4.66em; z-index: -760;" class="SrvDiv" runat="server" visible="false">
                        <a href="#" onclick="javascript:return RedirectToService('../Birth/BirthCertificate.aspx?SvcID=103');">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ViewAgroFormBApplication();">VIEW Application Agro Form-B</a>
                        <br />
                        <span>View  & Print Agro Form-B Application</span>

                    </div>
                    <div runat="server" id="divSEBC" style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" visible="false">
                        <a href="#" onclick="javascript:return UploadDocument();">
                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return UploadDocument();">Upload Relevant Document </a>
                        <br />
                        <span>Upload and View the attached Document</span>
                    </div>
                    <div runat="server" id="divDomicile" style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv">
                        <a href="#" onclick="javascript:return UploadDocument();">
                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return UploadCustomDocument();">Upload Domicile Certificate </a>
                        <br />
                        <span>Upload Domicile Certificate </span>
                    </div>
                    <div runat="server" id="divPM" style="min-height: 4.66em; z-index: -760;" class="SrvDiv">
                        <a href="#" onclick="javascript:return ProvisionalMarks();">
                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ProvisionalMarks();">Provisional Weightage & Rank</a>
                        <br />
                        <span>Click to view Provisional Weightage & Rank for OUAT UG Admission - 2017</span>
                    </div>
                    <div runat="server" id="divAgroProv" style="min-height: 4.66em; z-index: -760;" class="SrvDiv">
                        <a href="#" onclick="javascript:return ProvisionalMarksAgro();">
                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ProvisionalMarksAgro();">Agro-Polytechnic Provisional Weightage</a>
                        <br />
                        <span>Click to view Agro-Polytechnic Weightage for OUAT UG Admission - 2017</span>
                    </div>
                    <div runat="server" id="divRank" style="min-height: 4.66em; z-index: -760;" class="SrvDiv">
                        <a href="#" onclick="javascript:return ShowRankCard();">
                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ShowRankCard();">Intimation Cum Rank Card</a>
                        <br />
                        <span>Click to view Intimation Cum Rank Card for OUAT UG Admission - 2017</span>
                    </div>
                    <div runat="server" id="divAgroRC" style="min-height: 4.66em; z-index: -760;" class="SrvDiv">
                        <a href="#" onclick="javascript:return ShowAgroRankCard();">
                            <img src="/webapp/kiosk/Images/odisalogo_1.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ShowAgroRankCard();">Intimation Cum Rank Card for AgroPolytechnic Student</a>
                        <br />
                        <span>Click to view Intimation Cum Rank Card for OUAT UG Admission - 2017</span>
                    </div>
                    <div runat="server" id="divPCMPCB" style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" visible="false">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return MarksEntry();">Submission of Marks Entry</a>
                        <br />
                        <span>To be filled after Entrance Exam</span>

                    </div>
                    <div id="divOUATRefund" runat="server" style="min-height: 4.66em; z-index: -760;" class="SrvDiv">
                        <a href="#" onclick="javascript:return OuatRefund();">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return OuatRefund();">SUBMIT REFUND Application</a>
                        <br />
                        <span>To Be Fill Refund Application</span>

                    </div>
                    <div runat="server" id="div2" style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" visible="false">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return Edit10thPercentage();">Submission of HSC Percentage</a>
                        <%--<br />
                        <span>To be filled after Entrance Exam</span>--%>
                    </div>
                    <div runat="server" id="div3" style="min-height: 4.66em; z-index: -760; display: none;" class="SrvDiv" visible="false">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return Edit12thPercentage();">Submission of 10+2 Percentage</a>
                        <%-- <br />
                        <span>To be filled after Entrance Exam</span>--%>
                    </div>
                    <div style="min-height: 4.66em; z-index: -760;display:none;" class="SrvDiv" id="divSpot1" runat="server">
                        <a href="#" onclick="javascript:return OUATSpotAdmission();">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return OUATSpotAdmission();">Apply for Spot Admission</a>
                        <br />
                        <span>Click to Apply for OUAT UG Spot Admission</span>

                    </div>
                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="divSpot" runat="server">
                        <a href="#" onclick="javascript:return OUATSpotRank();">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return OUATSpotRank();">Intimation-Cum-Rank Card for Spot Admission</a>
                        <br />
                        <span>Download Intimation-Cum-Rank Card for OUAT UG Spot Admission</span>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFFormBAppID" runat="server" ClientIDMode="Static" />
</asp:Content>
