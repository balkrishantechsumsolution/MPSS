<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="G2GAccept.aspx.cs" Inherits="CitizenPortal.WebApp.G2G.G2GAccept" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/style.admin.css" rel="stylesheet" />
    <link href="../bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/sb-admin-2.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../Styles/timeline.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet1.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet3.css" rel="stylesheet" />
    <link href="../Styles/StyleSheet4.css" rel="stylesheet" />
    <link href="../Styles/style.admin.css" rel="stylesheet" />
    <link href="../Styles/bootstrap.min.css" rel="stylesheet" />
    <link href="../Styles/sb-admin-2.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            var t_URL = "";
            var t_AppID = "", t_ServiceID = "";
            t_AppID = $("#HFAppID").val();
            t_ServiceID = $("#HFServiceID").val();
            t_URL = $("#HFAckURL").val();
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
    </form>
</body>
</html>
