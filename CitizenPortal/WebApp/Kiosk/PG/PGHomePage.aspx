<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="PGHomePage.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.PG.PGHomePage" %>


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
            if (SvcID == "1452") {
                p_URL = "/WebApp/Kiosk/PG/Acknowledgement.aspx?SvcID=1452";

            }
            //else if (SvcID == "409") {
            //    p_URL = "/WebApp/Kiosk/OUAT/AgroFormAcknowledgement.aspx?SvcID=409";

            //}
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
            var p_URL = "/WebApp/Kiosk/PG/PGAdmitCard.aspx?SvcID=" + SvcID;
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
        }

        function DownloadILetter() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];

            var Path = $("#HFILetterPath").val();

            var p_URL = Path;
            window.open(p_URL,
                           ' scrollbars=1,resizable=1,width=800, height=600, top= 50, left=300');
            return false;
        }

        function ConfirmPayment() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/Forms/ConfirmPayment.aspx?SvcID=" + SvcID;

            //if (AppID == "083000020946" || AppID == "406000005934" || AppID == "382000001419" || AppID == "172000001615") {
            //    window.location.href = p_URL + "&UID=" + UID + "&AppID=" + AppID;

            //}
            if (AppID != null && AppID != "") {
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

        //UploadSEBC
        function UploadDocument() {
            //alert('Payment details can be upload after 24 hours from the time of making of payment');
            //return false;
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var FormBAppID = $("#HFFormBAppID").val();
            var p_URL = "/WebApp/Kiosk/Forms/Attachment.aspx?SvcID=1452";
            window.open(p_URL + "&UID=" + UID + "&AppID=" + AppID,
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
        function UGMarksEntry() {
            var qs = getQueryStrings();
            var UID = qs["UID"];
            var AppID = qs["AppID"];
            var SvcID = qs["SvcID"];
            var p_URL = "/WebApp/Kiosk/PG/UGAndPGMarksEntry.aspx?SvcID=1452";


            if (AppID != null && AppID != "") {
                window.location.href = p_URL + "&UID=" + UID + "&AppID=" + AppID;
            }
            else {
                alert("Invalid Application ID, Please try again after login !");
            }

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

    <div id="page-wrapper" style="">
        <div class="row">
            <div class="col-lg-12">
                <div class="resp-tabs-container ver_1">
                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="DivViewPGApp" runat="server">
                        <a href="#" onclick="javascript:return ViewApplication();">
                            <img src="/webapp/kiosk/CBCS/img/sambalpur-university-logo.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ViewApplication();"></a>
                        <a href="#" onclick="javascript:return ViewApplication();">View PG Admission Form</a>
                        <br />
                        <span>View PG Student Admission Form Details</span>
                    </div>
                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="DivPayment" runat="server">
                        <a href="#" onclick="javascript:return ConfirmPayment();">
                            <img src="/webapp/kiosk/CBCS/img/sambalpur-university-logo.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return ConfirmPayment();"></a>
                        <a href="#" onclick="javascript:return ConfirmPayment();">Make Payment</a>
                        <br />
                        <span>Make Payment for Unpaid PG Application Form</span>
                    </div>
                    <div style="min-height: 4.66em; z-index: -760;" class="SrvDiv" id="DivDocument" runat="server">
                        <a href="#" onclick="javascript:return UploadDocument();">
                            <img src="/webapp/kiosk/CBCS/img/sambalpur-university-logo.png" alt="" align="left" style="height: 70px;" />
                        </a><a href="#" onclick="javascript:return UploadDocument();"></a>
                        <a href="#" onclick="javascript:return UploadDocument();">Upload Document</a>
                        <br />
                        <span>Upload Documnet's</span>
                    </div>
                    <div runat="server" id="divPass" style="min-height: 4.66em; z-index: -760; display: block;" class="SrvDiv">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px; display: none;" />
                        </a><a href="#" onclick="javascript:return DownloadPass();">Download Admit Card</a>
                        <br />
                        <span>Download / Print Admit Card</span>

                    </div>
                    <div runat="server" id="divIntimationLetter" style="min-height: 4.66em; z-index: -760; display: block;" class="SrvDiv" visible="false">
                        <a href="#">
                            <img src="/webapp/kiosk/Images/OUAT.png" alt="" align="left" style="height: 70px; display: none;" />
                        </a><a href="#" onclick="javascript:return DownloadILetter();">Download Intimation Letter</a>
                        <br />
                        <span>Download Intimation Letter</span>

                    </div>
                </div>
            </div>
        </div>



    </div>
    <asp:HiddenField ID="HFFormBAppID" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFILetterPath" runat="server" ClientIDMode="Static" />

</asp:Content>
