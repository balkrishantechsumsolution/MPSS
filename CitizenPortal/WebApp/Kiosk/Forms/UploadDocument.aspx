<%@ Page Title="" Language="C#" MasterPageFile="~/WebApp/Kiosk/Master/KioskMaster.Master" AutoEventWireup="true" CodeBehind="UploadDocument.aspx.cs" Inherits="CitizenPortal.WebApp.Kiosk.Forms.UploadDocument" %>

<%@ Register Src="~/WebApp/Control/FormTitle.ascx" TagPrefix="uc1" TagName="FormTitle" %>
<%@ Register Src="~/WebApp/Control/Photograph.ascx" TagPrefix="uc1" TagName="Photograph" %>
<%@ Register Src="~/WebApp/Control/Declaration.ascx" TagPrefix="uc1" TagName="Declaration" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/PortalScripts/ServiceLanguage.js"></script>
    <link href="/PortalStyles/jquery-ui.min.css" rel="stylesheet" />
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
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#liBasic").removeClass("active");
            $("#liService").addClass("active");
            $("#liDetails").removeClass("active");
            $("#liDoc").addClass("active");
            $("#liPayment").removeClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="intrnlContent" ng-app="appmodule">
        <div ng-controller="ctrl">
    <div id="page-wrapper" style="min-height: 500px !important;">
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <uc1:FormTitle runat="server" ID="FormTitle" />
        <div class="row">

            <%--</div>
        <div class="row">--%>
            <div class="col-md-12 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">{{resourcesData.lblDeclaration}}
                    </h4>
                </div>
                <div class="box-body box-body-open">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-12">

                        <table role="presentation" class="table table-striped table-bordered table-hover dataTable no-footer">
                            <tbody class="files">
                                <tr style="vertical-align: middle">
                                    <td style="vertical-align: middle">
                                        <i class="fa fa-info-circle"></i></td>
                                    <td colspan="3">
                                        <span class="">Age Proof&nbsp;
                                        </span>&nbsp;&nbsp;&nbsp;&nbsp;<strong class="error text-danger"></strong></td>
                                    <td style="vertical-align: middle">
                                        <span class="btn btn-success fileinput-button">
                                            <i class="fa fa-plus"></i>
                                            <span>Add files...</span>
                                            <input type="file" name="files[]" multiple="" class="fldupload">
                                        </span></td>
                                </tr>
                                <tr style="vertical-align: middle">
                                    <td style="vertical-align: middle">
                                        <input type="checkbox" name="delete" value="1" class="toggle">
                                    </td>
                                    <td>
                                        <span class="preview">
                                            <a href="https://jquery-file-upload.appspot.com/image%2Fjpeg/3084878850/6863ed85c163d88fc099c25865eddf6b.jpg" title="6863ed85c163d88fc099c25865eddf6b.jpg" download="6863ed85c163d88fc099c25865eddf6b.jpg" data-gallery="">
                                                <img style="width: 100px;" src="https://jquery-file-upload.appspot.com/image%2Fjpeg/3084878850/6863ed85c163d88fc099c25865eddf6b.jpg.80x80.jpg"></a>
                                        </span>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <p class="name">1437639463cityint_dhauli.jpg</p>
                                        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" style="margin-bottom: 0;">
                                            <div class="progress-bar progress-bar-success" style="width: 0%;"></div>
                                        </div>

                                    </td>
                                    <td style="vertical-align: middle">
                                        <p class="size">52.92 KB</p>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <button class="btn btn-primary start">
                                            <i class="fa fa-upload"></i>
                                            <span>Start</span>
                                        </button>
                                        <button class="btn btn-warning cancel">
                                            <i class="fa fa-ban"></i>
                                            <span>Cancel</span>
                                        </button>
                                        <button class="btn btn-danger delete" data-type="DELETE" data-url="https://jquery-file-upload.appspot.com/image%2Fjpeg/1877091720/canstock5277756.jpg">
                                            <i class="fa fa-trash"></i>
                                            <span>Delete</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr style="vertical-align: middle">
                                    <td style="vertical-align: middle">
                                        <i class="fa fa-info-circle"></i></td>
                                    <td colspan="3">
                                        <span class="">Residence Proof&nbsp;
                                        </span>&nbsp;&nbsp;&nbsp;&nbsp;<strong class="error text-danger"></strong></td>
                                    <td style="vertical-align: middle">
                                        <span class="btn btn-success fileinput-button">
                                            <i class="fa fa-plus"></i>
                                            <span>Add files...</span>
                                            <input type="file" name="files[]" multiple="" class="fldupload">
                                        </span></td>
                                </tr>
                                <tr style="vertical-align: middle">
                                    <td style="vertical-align: middle">
                                        <input type="checkbox" name="delete" value="1" class="toggle">
                                    </td>
                                    <td>
                                        <span class="preview">
                                            <a href="https://jquery-file-upload.appspot.com/image%2Fjpeg/3084878850/6863ed85c163d88fc099c25865eddf6b.jpg" title="6863ed85c163d88fc099c25865eddf6b.jpg" download="6863ed85c163d88fc099c25865eddf6b.jpg" data-gallery="">
                                                <img style="width: 100px;" src="https://jquery-file-upload.appspot.com/image%2Fjpeg/3084878850/6863ed85c163d88fc099c25865eddf6b.jpg.80x80.jpg"></a>
                                        </span>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <p class="name">1437639463cityint_dhauli.jpg</p>
                                        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" style="margin-bottom: 0;">
                                            <div class="progress-bar progress-bar-success" style="width: 0%;"></div>
                                        </div>

                                    </td>
                                    <td style="vertical-align: middle">
                                        <p class="size">52.92 KB</p>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <button class="btn btn-primary start">
                                            <i class="fa fa-upload"></i>
                                            <span>Start</span>
                                        </button>
                                        <button class="btn btn-warning cancel">
                                            <i class="fa fa-ban"></i>
                                            <span>Cancel</span>
                                        </button>
                                        <button class="btn btn-danger delete" data-type="DELETE" data-url="https://jquery-file-upload.appspot.com/image%2Fjpeg/1877091720/canstock5277756.jpg">
                                            <i class="fa fa-trash"></i>
                                            <span>Delete</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr style="vertical-align: middle">
                                    <td style="vertical-align: middle">
                                        <i class="fa fa-info-circle"></i></td>
                                    <td colspan="3">
                                        <span class="">Domicile Proof&nbsp;
                                        </span>&nbsp;&nbsp;&nbsp;&nbsp;<strong class="error text-danger"></strong></td>
                                    <td style="vertical-align: middle">
                                        <span class="btn btn-success fileinput-button">
                                            <i class="fa fa-plus"></i>
                                            <span>Add files...</span>
                                            <input type="file" name="files[]" multiple="" class="fldupload">
                                        </span></td>
                                </tr>
                                <tr style="vertical-align: middle">
                                    <td style="vertical-align: middle">
                                        <input type="checkbox" name="delete" value="1" class="toggle">
                                    </td>
                                    <td>
                                        <span class="preview">
                                            <a href="https://jquery-file-upload.appspot.com/image%2Fjpeg/3084878850/6863ed85c163d88fc099c25865eddf6b.jpg" title="6863ed85c163d88fc099c25865eddf6b.jpg" download="6863ed85c163d88fc099c25865eddf6b.jpg" data-gallery="">
                                                <img style="width: 100px;" src="https://jquery-file-upload.appspot.com/image%2Fjpeg/3084878850/6863ed85c163d88fc099c25865eddf6b.jpg.80x80.jpg"></a>
                                        </span>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <p class="name">1437639463cityint_dhauli.jpg</p>
                                        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" style="margin-bottom: 0;">
                                            <div class="progress-bar progress-bar-success" style="width: 0%;"></div>
                                        </div>

                                    </td>
                                    <td style="vertical-align: middle">
                                        <p class="size">52.92 KB</p>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <button class="btn btn-primary start">
                                            <i class="fa fa-upload"></i>
                                            <span>Start</span>
                                        </button>
                                        <button class="btn btn-warning cancel">
                                            <i class="fa fa-ban"></i>
                                            <span>Cancel</span>
                                        </button>
                                        <button class="btn btn-danger delete" data-type="DELETE" data-url="https://jquery-file-upload.appspot.com/image%2Fjpeg/1877091720/canstock5277756.jpg">
                                            <i class="fa fa-trash"></i>
                                            <span>Delete</span>
                                        </button>
                                    </td>
                                </tr>
                                <tr style="vertical-align: middle">
                                    <td style="vertical-align: middle">
                                        <i class="fa fa-info-circle"></i></td>
                                    <td colspan="3">
                                        <span class="">Any Other Doucment&nbsp;
                                        </span>&nbsp;&nbsp;&nbsp;&nbsp;<strong class="error text-danger"></strong></td>
                                    <td style="vertical-align: middle">
                                        <span class="btn btn-success fileinput-button">
                                            <i class="fa fa-plus"></i>
                                            <span>Add files...</span>
                                            <input type="file" name="files[]" multiple="" class="fldupload">
                                        </span></td>
                                </tr>
                                <tr style="vertical-align: middle">
                                    <td style="vertical-align: middle">
                                        <input type="checkbox" name="delete" value="1" class="toggle">
                                    </td>
                                    <td>
                                        <span class="preview">
                                            <a href="https://jquery-file-upload.appspot.com/image%2Fjpeg/3084878850/6863ed85c163d88fc099c25865eddf6b.jpg" title="6863ed85c163d88fc099c25865eddf6b.jpg" download="6863ed85c163d88fc099c25865eddf6b.jpg" data-gallery="">
                                                <img style="width: 100px;" src="https://jquery-file-upload.appspot.com/image%2Fjpeg/3084878850/6863ed85c163d88fc099c25865eddf6b.jpg.80x80.jpg"></a>
                                        </span>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <p class="name">1437639463cityint_dhauli.jpg</p>
                                        <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" style="margin-bottom: 0;">
                                            <div class="progress-bar progress-bar-success" style="width: 0%;"></div>
                                        </div>

                                    </td>
                                    <td style="vertical-align: middle">
                                        <p class="size">52.92 KB</p>
                                    </td>
                                    <td style="vertical-align: middle">
                                        <button class="btn btn-primary start">
                                            <i class="fa fa-upload"></i>
                                            <span>Start</span>
                                        </button>
                                        <button class="btn btn-warning cancel">
                                            <i class="fa fa-ban"></i>
                                            <span>Cancel</span>
                                        </button>
                                        <button class="btn btn-danger delete" data-type="DELETE" data-url="https://jquery-file-upload.appspot.com/image%2Fjpeg/1877091720/canstock5277756.jpg">
                                            <i class="fa fa-trash"></i>
                                            <span>Delete</span>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">{{resourcesData.lblDeclaration}}
                    </h4>
                </div>
                <uc1:Photograph runat="server" ID="Photograph" />
            </div>
            <div class="col-md-9 box-container">
                <div class="box-heading">
                    <h4 class="box-title register-num">{{resourcesData.lblDeclaration}}
                    </h4>
                </div>
                <uc1:Declaration runat="server" ID="Declaration" />
            </div>
        </div>
        <%---Start of Button----%>
        <div class="row">
            <div class="col-md-12 box-container" id="divBtn">
                <div class="box-body box-body-open" style="text-align: center;">
                    <%--<asp:Button ID="btnConfirm" runat="server" Text="Submit" class="btn btn-success"
                        OnClientClick="return checkDeclaration();" />--%>
                    <input type="button" id="btnConfirm" class="btn btn-success" value="Submit" />
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
</asp:Content>
