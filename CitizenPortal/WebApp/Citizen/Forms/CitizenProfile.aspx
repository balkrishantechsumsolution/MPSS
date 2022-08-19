<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Citizen/Master/Citizen.Master" AutoEventWireup="true" CodeBehind="CitizenProfile.aspx.cs" Inherits="CitizenPortal.WebApp.Citizen.Forms.CitizenProfile" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/PersonalDetail.ascx" TagPrefix="uc1" TagName="PersonalDetail" %>
<%@ Register Src="~/WebApp/Control/Photograph.ascx" TagPrefix="uc1" TagName="Photograph" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc1" TagName="Address" %>
<%@ Register Src="~/WebApp/Control/Address.ascx" TagPrefix="uc2" TagName="Address" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../../Scripts/jquery-1.9.1.min.js"></script>
    <script src="/Scripts/jquery-ui-1.11.4.min.js"></script>

    <script src="../../Scripts/jquery.fileupload.js"></script>
    <script src="/Scripts/jquery.msgBox.js"></script>
    <link href="../../../PortalStyles/msgBoxLight.css" rel="stylesheet" />
    <script src="../../../PortalScripts/ServiceLanguage.js"></script>
    <link href="../../../PortalStyles/jquery-ui.min.css" rel="stylesheet" />
    <%--<script src="../../../Scripts/angular.min.js"></script>--%>
    <%--<script src="../Script/CitizenProfile.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="../Script/RegisterMobile.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/CommonScript.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/ValidationScript.js?v=<%=Guid.NewGuid()%>"></script>
    <script src="/WebApp/Scripts/AddressScript.js?v=<%=Guid.NewGuid()%>"></script>--%>


    <script src="/WebApp/Citizen/Script/RegisterMobile.js"></script>
    <script src="/WebApp/Scripts/CommonScript.js"></script>
    <script src="/WebApp/Scripts/ValidationScript.js"></script>
    <script src="/WebApp/Scripts/AddressScript.js"></script>
    <script src="/WebApp/Citizen/Script/CitizenProfile.js"></script>
    <script type="text/javascript">
        var csrfSession = '<%= Session["CSRFVal"].ToString() %>';
        var csrfval = '<%= Session["CSRFValue"].ToString() %>';

        //alert(csrfSession);
</script>
    <script type="text/javascript">
        
        //$('#File1').bind('change', function () {
        //    alert('hi');
        //    alert('This file size is: ' + this.files[0].size / 1024 / 1024 + "MB");
        //});

        function imageIsLoaded(e) {
            
            $('#myImg').attr('src', e.target.result);
        };

        //var selectedFile = document.getElementById('File1').files[0];
        $('#btnSubmit').click(function () {
            var fileUpload = $("#FileUpload1").get(0);
            var files = fileUpload.files;
            var test = new FormData();
            for (var i = 0; i < files.length; i++) {
                test.append(files[i].name, files[i]);
            }
            $.ajax({
                url: "/WebApp/Citizen/Handler/UploadHandler.ashx",
                type: "POST",
                contentType: false,
                processData: false,
                data: test,
                // dataType: "json",
                success: function (result) {
                    alert(result);
                },
                error: function (err) {
                    alert(err.statusText);
                }
            });
        });
    </script>

     <script type="text/javascript">

        function PerPinCode() {
            
            var PinCode = $('#ContentPlaceHolder1_Address1_PinCode').val();
            var state = $('#ContentPlaceHolder1_Address1_ddlState').val();
            if (state == 21) {
                var pinmatch = /^[7]\d{5}$/;
                if (!pinmatch.test(PinCode)) {
                    alertPopup("Form Validation", "Please enter valid PinCode, starting with 7 ");
                    $('#ContentPlaceHolder1_Address1_PinCode').val("");
                    opt = 1;

                }
            }
        }
        $(document).ready(function () {

            $("#ContentPlaceHolder1_Address1_PinCode").bind("change", function (e) { return PerPinCode(); });
        });
     </script>
     <script type="text/javascript">

        function PrePinCode() {
            var PinCode = $('#ContentPlaceHolder1_Address2_PinCode').val();
            var state = $('#ContentPlaceHolder1_Address2_ddlState').val();
            if (state == 21) {
                var pinmatch = /^[7]\d{5}$/;
                if (!pinmatch.test(PinCode)) {
                    alertPopup("Form Validation", "Please enter valid PinCode, starting with 7");
                    $('#ContentPlaceHolder1_Address2_PinCode').val("");
                    opt = 1;

                }
            }
        }
        $(document).ready(function () {

            $("#ContentPlaceHolder1_Address2_PinCode").bind("change", function (e) { return PrePinCode(); });
        });
     </script>
    <style type="text/css">
        .fldupload {
            position: absolute;
            top: 0;
            right: 0;
            margin: 0;
            opacity: 0;
            -ms-filter: 'alpha(opacity=0)';
            font-size: 200px !important;
            direction: ltr;
            cursor: pointer;
        }

        .fldupload {
            width: 100px;
            height: 30px;
        }

        .pagination {
            border: 0;
            margin: 0;
        }

            .pagination > li > a, .pagination > li > span {
                padding: 2px 5px;
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
            text-transform: uppercase;
            font-weight: bold;
        }
        div.msgBox {
            width:600px !important;
             overflow: auto;
            height: 400px;
        }
        .msgBoxContent {
        width:400px !important;
        }
    </style>
    <style>
        .ui-widget-header {
            color: #333 !important;
            font-weight: normal !important;
        }
    </style>
    <script type="text/javascript">

        
    </script>
    <input type="hidden" id="Token" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
            <div id="page-wrapper" style="min-height: 500px !important;">
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>


                <%----Start of Search Mobile-----%>

                <div style="display:none">
                <div class="row" id="divSearch" style="display:none">
                    <div class="col-md-12 box-container">
                        <div class="box-heading">
                            <h4 class="box-title">Search using Registered Mobile Number
                            </h4>
                        </div>

                        <div class="box-body box-body-open">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">
                                <div class="row">
                                    <div class="form-group col-lg-3">
                                        <label class="" for="txtOTP">
                                            Enter Registered Mobile No. <span id="lblMobile"></span>
                                        </label>
                                    </div>
                                    <div class="form-group col-lg-4">

                                        <input class="form-control" placeholder="Enter 10 digit Mobile Number" name="txtAadhaar" type="text" value="" id="UID" maxlength="10" onkeypress="return isNumberKey(event);"
                                            autofocus />
                                    </div>
                                    <div class="form-group col-lg-3 text-left">
                                        <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                            Text="Validate" OnClientClick="return ValidateMobile(); " />

                                        <%-- <button type="button" class="btn btn-primary" onclick="alert('hello');"> Create Profile </button>
                               <asp:Button ID="btnSearch" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                    Text="OTP" OnClientClick="return openWindow(1,2,'UIDCasteCertificate1'); " />
                <asp:Button ID="Button1" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                    Text="Bio metric" OnClientClick="return openWindow(1,1,'UIDSGNPPass'); " />--%>
                                    </div>
                                    <%--<div class="form-group col-lg-1 text-right" style="white-space: nowrap; margin-top: 10px;"><a onclick="fnNonUID();" title="Click if Aadhaar UID is not available">Register your Mobile</a></div>--%>
                                </div>
                            </div>
                            <div id="divOTP">
                                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-3">
                                    <div class="form-group">
                                        <label class="" for="txtOTP">
                                            Enter OTP SMS on Mobile No. <span id="lblOTPMobile"></span>
                                        </label>
                                    </div>
                                </div>
                                <%--                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                            <div class="form-group">
                                <input type="text" id="txtOTP" maxlength="6" onkeypress="return isNumberKey(event);" />
                            </div>
                        </div>--%>
                                <div class="form-group col-lg-4">

                                    <input class="form-control" name="txtOTP" type="text" value="" id="txtOTP" maxlength="6" onkeypress="return isNumberKey(event);" />
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <%--<a href="#" onclick="fnGenOTP">Regenerate OTP</a>--%>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                            Text="Regenerate OTP" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-lg-4">

                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <%--<a href="#" onclick="fnGenOTP">Regenerate OTP</a>--%>
                                        <asp:Button ID="btnProceed" runat="server" CausesValidation="False" CssClass="btn btn-primary"
                                            Text="Proceed" />
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>


                    </div>
                </div>
                </div>
                    <%-----End of Searh Mobile------%>

                <div id="divCitizenProfile">
                    <div>
                        <h2 class="form-heading"><i class="fa fa-pencil-square-o"></i>Citizen Profile
                        </h2>
                    </div>
                    <div class="mt20">

                        <div class="row" style="background-color: #fbfbfb; border: 1px solid #ebebeb; display: block; padding: 10px; margin: 0">

                            <div class="row">
                                <%---Start of PhotoNDetail----%>
                                <div class="col-md-3 box-container" id="divPhoto" runat="server">
                                    <div class="box-heading">
                                        <h4 class="box-title'">{{resourcesData.lblAppPhotograph}}
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">
                                        <div class="alert alert-info col-xs-12 col-sm-6 col-md-12 col-lg-12" style="display: none">
                                            Please, upload your recent pasport size photograph size between 200 to 250 pixels.
                                        </div>
                                        <%--<uc1:Photograph runat="server" ID="Photograph" />--%>
                                        <%--<img class="form-control" src="../Images/photo.png" name="photocustomer" style="height: 225px; width: 200px;" />--%>

                                        <div class="col-lg-12">
                                            <img class="form-control" src="/webApp/kiosk/Images/photo.png" name="photocustomer" style="height: 220px" id="myImg" />
                                            <input class="camera"
                                                id="File1" name="Photoupload" type="file" runat="server" onchange="readFile(this.files)"/>
                                        </div>
                                       <%-- onchange="readFile(this.files)"--%>
                                        <asp:RegularExpressionValidator ID="RegExValFileUploadFileType" runat="server"
                                            ControlToValidate="File1"
                                            ErrorMessage="Only .jpg,.png,.jpeg Files are allowed" Font-Bold="True"
                                            Font-Size="Medium"
                                            ValidationExpression="(.*?)\.(jpg|jpeg|png|JPG|JPEG|PNG)$"></asp:RegularExpressionValidator>
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                                <%---End of Photoupload----%>
                                <%---Start of Basic Details----%>
                                <div class="col-md-9 box-container mTop15" id="divDetails" runat="server">
                                    <div class="box-heading" id="Div4" >
                                        <h4 class="box-title">{{resourcesData.lblApplicantDetails}}
                                        </h4>
                                    </div>
                                    <div class="box-body box-body-open">
                                        
                                        <uc1:PersonalDetail runat="server" ID="PersonalDetail" />
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                </div>
                                <%---End of Basic Details----%>
                            </div>
                            <%---Start of PostalAddress----%>
                            <div class="row" id="divAddress" runat="server">
                                <div class="col-md-6 box-container mTop15">
                                    <div class="box-heading">
                                        <h4 class="box-title">Permanent Address
                                        </h4>
                                    </div>
                                    <%---Start of PostalAddress----%>
                                    <div class="box-body box-body-open">

                                        <uc1:Address runat="server" ID="Address1" ClientIDMode="Inherit" />
                                        <div class="clearfix">
                                        </div>
                                    </div>
                                    <%---END of PostalAddress-----%>
                                </div>
                                <div class="col-md-6 box-container mTop15">
                                    <div class="box-heading">
                                        <h4 class="row box-title register-num"><span class="col-md-6">Present Address</span> <span class="col-md-6" style="font-style: normal; font-size: 12px; text-align: right;">
                                            <input id="chkAddress" type="checkbox" onclick="fnCopyAddress();" />Same as Permanent Address</span><span class="clearfix">
                                            </span>
                                        </h4>
                                    </div>
                                    <%---Start of PostalAddress----%>
                                    <div class="box-body box-body-open">
                                        <uc2:Address runat="server" ID="Address2" ClientIDMode="Inherit" />
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                                <%---END of PostalAddress-----%>
                            </div>
                        </div>
                        <%----End of PostalAddress-----%>

                        <%---Start of Button----%>
                        <div class="row" id="divBtn" runat="server">
                            <div class="col-md-12 box-container">
                                <div class="box-body box-body-open" style="text-align: center;">

                                    <input type="button" id="btnSubmit" class="btn btn-success" value="Submit" />
                                    <asp:Button ID="btnCancel" runat="server" CausesValidation="True" CommandName="Cancel"
                                        CssClass="btn btn-danger" PostBackUrl=""
                                        Text="Cancel" />
                                </div>
                            </div>
                            <div class="clearfix">
                            </div>
                        </div>
                        <%---End of Button----%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="HFb64" runat="server" />
    <asp:HiddenField ID="HFServiceID" runat="server" />
    <asp:HiddenField ID="HFOTPDone" runat="server" />
    <asp:HiddenField ID="HFMobileNo" runat="server" />
    <asp:HiddenField ID="HFProfileID" runat="server" />
    <asp:HiddenField ID="HFSizeOfPhoto" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="HFUIDData" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="CSRFVal" runat="server" />
  
</asp:Content>
